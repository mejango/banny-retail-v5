#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const createKeccakHash = require('keccak');

function toChecksumAddress(address) {
    if (!/^(0x)?[0-9a-f]{40}$/i.test(address)) {
        // Not a valid address format, return as is
        return address;
    }
    address = address.toLowerCase().replace('0x', '');
    const hash = createKeccakHash('keccak256').update(address).digest('hex');
    let checksumAddress = '0x';

    for (let i = 0; i < address.length; i++) {
        // If the i-th hex character is greater than 7, use the uppercase char, otherwise lowercase
        checksumAddress += parseInt(hash[i], 16) >= 8 ? address[i].toUpperCase() : address[i];
    }

    return checksumAddress;
}

// V4 to V5 migration script generator
// Generates contract-based migration scripts and chain-specific contracts from raw.json
// Note: Outfit IDs are generated automatically when minting in V5
// The system handles V4 to V5 category mapping internally

function generateMigrationScript() {
    // Generate contract-based migration script and chain-specific contracts from raw.json
    generateScriptForFile('raw.json', 'AirdropOutfits.s.sol');

    // Generate chain-specific migration contracts
    generateChainSpecificContracts('raw.json');
}

function generateScriptForFile(inputFile, outputFile) {
    console.log(`\n=== Generating ${outputFile} from ${inputFile} ===`);

    // Load the raw data
    const rawDataPath = path.join(__dirname, inputFile);
    const rawData = JSON.parse(fs.readFileSync(rawDataPath, 'utf8'));

    const items = rawData.data.nfts.items;

    // Calculate tier IDs for each chain
    const ethereumItems = items.filter(item => item.chainId === 1);
    const optimismItems = items.filter(item => item.chainId === 10);
    const baseItems = items.filter(item => item.chainId === 8453);
    const arbitrumItems = items.filter(item => item.chainId === 42161);

    const ethereumTierIds = [];
    const optimismTierIds = [];
    const baseTierIds = [];
    const arbitrumTierIds = [];

    // Build tier ID arrays for each chain
    [ethereumItems, optimismItems, baseItems, arbitrumItems].forEach((chainItems, index) => {
        const tierIdQuantities = new Map();
        chainItems.forEach(item => {
            const upc = item.metadata.upc;
            tierIdQuantities.set(upc, (tierIdQuantities.get(upc) || 0) + 1);
        });

        const uniqueUpcs = Array.from(tierIdQuantities.keys()).sort((a, b) => a - b);
        const tierIds = [];
        uniqueUpcs.forEach(upc => {
            const quantity = tierIdQuantities.get(upc);
            for (let i = 0; i < quantity; i++) {
                tierIds.push(upc);
            }
        });

        if (index === 0) ethereumTierIds.push(...tierIds);
        else if (index === 1) optimismTierIds.push(...tierIds);
        else if (index === 2) baseTierIds.push(...tierIds);
        else if (index === 3) arbitrumTierIds.push(...tierIds);
    });

    // Generate the contract-based migration script
    const script = generateContractVersion(items, { ethereumTierIds, optimismTierIds, baseTierIds, arbitrumTierIds });

    // Write the script to file
    const outputPath = path.join(__dirname, '..', outputFile);
    fs.writeFileSync(outputPath, script);

    console.log(`Generated migration script with chain-specific filtering`);
    console.log(`Script written to: ${outputPath}`);
}


function buildTransferDataForChain(chainItems) {
    // Process data for this chain
    const bannys = [];
    const outfits = [];
    const backgrounds = [];

    chainItems.forEach(item => {
        const tokenId = item.metadata.tokenId;
        const upc = item.metadata.upc;
        const category = item.metadata.category;
        const owner = toChecksumAddress(item.owner || (item.wallet ? item.wallet.address : '0x0000000000000000000000000000000000000000'));
        const productName = item.metadata.productName;

        if (category === 0) {
            // Banny body
            bannys.push({
                tokenId,
                upc,
                backgroundId: item.metadata.backgroundId || 0,
                outfitIds: item.metadata.outfitIds || [],
                owner,
                productName
            });
        } else if (category === 1) {
            // Background
            backgrounds.push({
                tokenId,
                upc,
                owner,
                productName
            });
        } else {
            // Outfit
            outfits.push({
                tokenId,
                upc,
                category,
                owner,
                productName
            });
        }
    });

    // Collect all outfitIds and backgroundIds that are being used
    const usedOutfitIds = new Set();
    const usedBackgroundIds = new Set();

    bannys.forEach(banny => {
        if (banny.backgroundId && banny.backgroundId !== 0) {
            usedBackgroundIds.add(banny.backgroundId);
        }
        banny.outfitIds.forEach(outfitId => {
            usedOutfitIds.add(outfitId);
        });
    });

    // Build transfer data array
    const allItems = [...bannys, ...outfits, ...backgrounds];
    const transferData = [];

    allItems.forEach((item, index) => {
        // Skip if owner is zero address
        if (item.owner === '0x0000000000000000000000000000000000000000') {
            return;
        }

        // Skip if this is an outfit being worn
        if (item.tokenId && usedOutfitIds.has(item.tokenId)) {
            return;
        }

        // Skip if this is a background being used
        if (item.tokenId && usedBackgroundIds.has(item.tokenId)) {
            return;
        }

        transferData.push({
            owner: item.owner
        });
    });

    return transferData;
}

function generateTierIdLoops(tierIds) {
    // Group consecutive tier IDs to create efficient for loops
    const groups = [];
    let currentGroup = null;

    tierIds.forEach((tierId, index) => {
        if (currentGroup && currentGroup.tierId === tierId) {
            currentGroup.count++;
        } else {
            if (currentGroup) groups.push(currentGroup);
            currentGroup = { tierId, startIndex: index, count: 1 };
        }
    });
    if (currentGroup) groups.push(currentGroup);

    let loops = '';
    groups.forEach(group => {
        loops += `
            // Add ${group.count} instances of tier ID ${group.tierId}
            for (uint256 i = 0; i < ${group.count}; i++) {
                allTierIds[${group.startIndex} + i] = ${group.tierId};
            }`;
    });

    return loops;
}

function generatePriceMap(items) {
    // Create a map of UPC to price from raw.json
    const upcToPrice = new Map();
    items.forEach(item => {
        const upc = item.metadata.upc;
        const price = item.metadata.price;
        if (!upcToPrice.has(upc)) {
            upcToPrice.set(upc, price);
        }
    });

    // Generate a helper function that returns price for a given UPC
    const sortedUpcs = Array.from(upcToPrice.keys()).sort((a, b) => a - b);
    let code = '';

    if (sortedUpcs.length > 0) {
        sortedUpcs.forEach(upc => {
            const price = upcToPrice.get(upc);
            code += `\n        if (upc == ${upc}) return ${price};`;
        });
        code += '\n        return 0;';
    } else {
        code = '        return 0;';
    }

    return code;
}

function generateTokenIdArray(chainItems, transferData, tierIdQuantities) {
    // Build allItems array in transfer order (bannys, outfits, backgrounds)
    const bannys = [];
    const outfits = [];
    const backgrounds = [];
    const usedOutfitIds = new Set();
    const usedBackgroundIds = new Set();

    chainItems.forEach(item => {
        const tokenId = item.metadata.tokenId;
        const upc = item.metadata.upc;
        const category = item.metadata.category;
        const owner = toChecksumAddress(item.owner || (item.wallet ? item.wallet.address : '0x0000000000000000000000000000000000000000'));
        const productName = item.metadata.productName;

        if (category === 0) {
            bannys.push({
                tokenId,
                upc,
                backgroundId: item.metadata.backgroundId || 0,
                outfitIds: item.metadata.outfitIds || [],
                owner,
                productName
            });
            if (item.metadata.backgroundId && item.metadata.backgroundId !== 0) {
                usedBackgroundIds.add(item.metadata.backgroundId);
            }
            (item.metadata.outfitIds || []).forEach(outfitId => {
                usedOutfitIds.add(outfitId);
            });
        } else if (category === 1) {
            backgrounds.push({
                tokenId,
                upc,
                owner,
                productName
            });
        } else {
            outfits.push({
                tokenId,
                upc,
                category,
                owner,
                productName
            });
        }
    });

    // Build itemsForTransfer in the same order as transferData
    const allItemsOrdered = [...bannys, ...outfits, ...backgrounds];
    const itemsForTransfer = [];

    allItemsOrdered.forEach(item => {
        // Skip if owner is zero address
        if (item.owner === '0x0000000000000000000000000000000000000000') {
            return;
        }

        // Skip if this is an outfit being worn
        if (item.tokenId && usedOutfitIds.has(item.tokenId)) {
            return;
        }

        // Skip if this is a background being used
        if (item.tokenId && usedBackgroundIds.has(item.tokenId)) {
            return;
        }

        itemsForTransfer.push(item);
    });

    // Build tier ID array in mint order (sorted by UPC) to determine unit numbers
    const tierIdQuantitiesForMinting = new Map();
    chainItems.forEach(item => {
        const upc = item.metadata.upc;
        tierIdQuantitiesForMinting.set(upc, (tierIdQuantitiesForMinting.get(upc) || 0) + 1);
    });

    const uniqueUpcs = Array.from(tierIdQuantitiesForMinting.keys()).sort((a, b) => a - b);
    const tierIdsInMintOrder = [];
    uniqueUpcs.forEach(upc => {
        const quantity = tierIdQuantitiesForMinting.get(upc);
        for (let i = 0; i < quantity; i++) {
            tierIdsInMintOrder.push(upc);
        }
    });

    // Create a map from V4 tokenId to its position in the mint order
    // This allows us to determine the unit number for each item
    const v4TokenIdToMintIndex = new Map();
    const upcCounters = new Map();

    tierIdsInMintOrder.forEach((upc, mintIndex) => {
        const counter = (upcCounters.get(upc) || 0) + 1;
        upcCounters.set(upc, counter);

        // Find the V4 token ID that corresponds to this mint position
        const upcItems = chainItems.filter(item => item.metadata.upc === upc);
        // Sort by original order in chainItems to maintain consistency
        const sortedUpcItems = [...upcItems].sort((a, b) => {
            return chainItems.indexOf(a) - chainItems.indexOf(b);
        });

        if (counter <= sortedUpcItems.length) {
            const item = sortedUpcItems[counter - 1];
            if (item) {
                v4TokenIdToMintIndex.set(item.metadata.tokenId, { upc, unitNumber: counter });
            }
        }
    });

    // Generate token IDs for each item in transfer order
    // Token IDs are generated as: UPC * 1000000000 + unitNumber
    let code = '';

    itemsForTransfer.forEach((item, index) => {
        const v4TokenId = item.tokenId;
        const mapping = v4TokenIdToMintIndex.get(v4TokenId);

        if (mapping) {
            const { upc, unitNumber } = mapping;
            const tokenId = upc * 1000000000 + unitNumber;
            code += `\n        generatedTokenIds[${index}] = ${tokenId}; // UPC ${upc}, unit ${unitNumber} (V4: ${v4TokenId})`;
        } else {
            // Fallback: use UPC from item and increment unit counter
            const upc = item.upc;
            // This shouldn't happen, but if it does, we'll use a simple counter
            code += `\n        generatedTokenIds[${index}] = ${upc} * 1000000000 + 1; // Fallback (V4: ${v4TokenId})`;
        }
    });

    return code;
}

function generateContractVersion(items, tierIds = null) {
    // Calculate tier IDs for each chain if not provided
    if (!tierIds) {
        const ethereumItems = items.filter(item => item.chainId === 1);
        const optimismItems = items.filter(item => item.chainId === 10);
        const baseItems = items.filter(item => item.chainId === 8453);
        const arbitrumItems = items.filter(item => item.chainId === 42161);

        const ethereumTierIds = [];
        const optimismTierIds = [];
        const baseTierIds = [];
        const arbitrumTierIds = [];

        // Build tier ID arrays for each chain
        [ethereumItems, optimismItems, baseItems, arbitrumItems].forEach((chainItems, index) => {
            const tierIdQuantities = new Map();
            chainItems.forEach(item => {
                const upc = item.metadata.upc;
                tierIdQuantities.set(upc, (tierIdQuantities.get(upc) || 0) + 1);
            });

            const uniqueUpcs = Array.from(tierIdQuantities.keys()).sort((a, b) => a - b);
            const tierIds = [];
            uniqueUpcs.forEach(upc => {
                const quantity = tierIdQuantities.get(upc);
                for (let i = 0; i < quantity; i++) {
                    tierIds.push(upc);
                }
            });

            if (index === 0) ethereumTierIds.push(...tierIds);
            else if (index === 1) optimismTierIds.push(...tierIds);
            else if (index === 2) baseTierIds.push(...tierIds);
            else if (index === 3) arbitrumTierIds.push(...tierIds);
        });

        tierIds = { ethereumTierIds, optimismTierIds, baseTierIds, arbitrumTierIds };
    }

    // Process transfer data for each chain
    const chains = [
        { id: 1, name: 'Ethereum' },
        { id: 10, name: 'Optimism' },
        { id: 8453, name: 'Base' },
        { id: 42161, name: 'Arbitrum' }
    ];

    let transferDataFunctions = '';

    chains.forEach(chain => {
        const chainItems = items.filter(item => item.chainId === chain.id);
        if (chainItems.length === 0) return;

        // Build transfer data for this chain
        const transferData = buildTransferDataForChain(chainItems);

        transferDataFunctions += `
    function _get${chain.name}TransferOwners() internal pure returns (address[] memory) {
        address[] memory transferOwners = new address[](${transferData.length});
        `;

        transferData.forEach((data, index) => {
            transferDataFunctions += `
        transferOwners[${index}] = ${data.owner};`;
        });

        transferDataFunctions += `
        return transferOwners;
    }
    `;
    });

    // Generate a contract-based version that deploys a migration contract
    // and makes a single call to it
    return `// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {MigrationContractEthereum} from "./MigrationContractEthereum.sol";
import {MigrationContractOptimism} from "./MigrationContractOptimism.sol";
import {MigrationContractBase} from "./MigrationContractBase.sol";
import {MigrationContractArbitrum} from "./MigrationContractArbitrum.sol";

import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Sphinx} from "@sphinx-labs/contracts/SphinxPlugin.sol";
import {IJBTerminal} from "@bananapus/core-v5/src/interfaces/IJBTerminal.sol";
import {JBConstants} from "@bananapus/core-v5/src/libraries/JBConstants.sol";
import {JBMetadataResolver} from "@bananapus/core-v5/src/libraries/JBMetadataResolver.sol";

contract AirdropOutfitsScript is Script, Sphinx {
    // Maximum tier IDs per batch to avoid metadata size limit (255 words max)
    // Each tier ID takes 1 word, plus overhead for array length, boolean, and metadata structure
    // Using 150 as a safe batch size to stay well under the limit
    uint256 private constant BATCH_SIZE = 150;
    function configureSphinx() public override {
        sphinxConfig.projectName = "banny-core";
        sphinxConfig.mainnets = ["ethereum", "optimism", "base", "arbitrum"];
        sphinxConfig.testnets = ["ethereum_sepolia", "optimism_sepolia", "base_sepolia", "arbitrum_sepolia"];
    }

    function run() public sphinx {
        uint256 chainId = block.chainid;
        
        if (chainId == 1) {
            // Ethereum Mainnet
            _runEthereum();
        } else if (chainId == 10) {
            // Optimism
            _runOptimism();
        } else if (chainId == 8453) {
            // Base
            _runBase();
        } else if (chainId == 42161) {
            // Arbitrum
            _runArbitrum();
        } else if (chainId == 11155111) {
            // Ethereum Sepolia
            _runEthereumSepolia();
        } else if (chainId == 11155420) {
            // Optimism Sepolia
            _runOptimismSepolia();
        } else if (chainId == 84532) {
            // Base Sepolia
            _runBaseSepolia();
        } else if (chainId == 421614) {
            // Arbitrum Sepolia
            _runArbitrumSepolia();
        } else {
            revert("Unsupported chain");
        }
    }
    
    function _runEthereum() internal {
        address hookAddress = ${toChecksumAddress('0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750')};
        address resolverAddress = ${toChecksumAddress('0x47c011146a4498a70e0bf2e4585acf9cade85954')};
        address v4HookAddress = ${toChecksumAddress('0x2da41cdc79ae49f2725ab549717b2dbcfc42b958')};
        address v4ResolverAddress = ${toChecksumAddress('0xa5f8911d4cfd60a6697479f078409434424fe666')};
        address terminalAddress = ${toChecksumAddress('0x2db6d704058e552defe415753465df8df0361846')};
        address v4ResolverFallback = ${toChecksumAddress('0xfF80c37a57016EFf3d19fb286e9C740eC4537Dd3')};
        _processMigration(
            hookAddress,
            resolverAddress,
            v4HookAddress,
            v4ResolverAddress,
            terminalAddress,
            v4ResolverFallback,
            1
        );
    }
    
    function _runOptimism() internal {
        address hookAddress = ${toChecksumAddress('0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750')};
        address resolverAddress = ${toChecksumAddress('0x47c011146a4498a70e0bf2e4585acf9cade85954')};
        address v4HookAddress = ${toChecksumAddress('0x2da41cdc79ae49f2725ab549717b2dbcfc42b958')};
        address v4ResolverAddress = ${toChecksumAddress('0xa5f8911d4cfd60a6697479f078409434424fe666')};
        address terminalAddress = ${toChecksumAddress('0x2db6d704058e552defe415753465df8df0361846')};
        address v4ResolverFallback = ${toChecksumAddress('0xfF80c37a57016EFf3d19fb286e9C740eC4537Dd3')};
        _processMigration(
            hookAddress,
            resolverAddress,
            v4HookAddress,
            v4ResolverAddress,
            terminalAddress,
            v4ResolverFallback,
            10
        );
    }
    
    function _runBase() internal {
        address hookAddress = ${toChecksumAddress('0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750')};
        address resolverAddress = ${toChecksumAddress('0x47c011146a4498a70e0bf2e4585acf9cade85954')};
        address v4HookAddress = ${toChecksumAddress('0x2da41cdc79ae49f2725ab549717b2dbcfc42b958')};
        address v4ResolverAddress = ${toChecksumAddress('0xa5f8911d4cfd60a6697479f078409434424fe666')};
        address terminalAddress = ${toChecksumAddress('0x2db6d704058e552defe415753465df8df0361846')};
        address v4ResolverFallback = ${toChecksumAddress('0xfF80c37a57016EFf3d19fb286e9C740eC4537Dd3')};
        _processMigration(
            hookAddress,
            resolverAddress,
            v4HookAddress,
            v4ResolverAddress,
            terminalAddress,
            v4ResolverFallback,
            8453
        );
    }
    
    function _runArbitrum() internal {
        address hookAddress = ${toChecksumAddress('0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750')};
        address resolverAddress = ${toChecksumAddress('0x47c011146a4498a70e0bf2e4585acf9cade85954')};
        address v4HookAddress = ${toChecksumAddress('0x2da41cdc79ae49f2725ab549717b2dbcfc42b958')};
        address v4ResolverAddress = ${toChecksumAddress('0xa5f8911d4cfd60a6697479f078409434424fe666')};
        address terminalAddress = ${toChecksumAddress('0x2db6d704058e552defe415753465df8df0361846')};
        address v4ResolverFallback = ${toChecksumAddress('0xfF80c37a57016EFf3d19fb286e9C740eC4537Dd3')};
        _processMigration(
            hookAddress,
            resolverAddress,
            v4HookAddress,
            v4ResolverAddress,
            terminalAddress,
            v4ResolverFallback,
            42161
        );
    }
    
    function _runEthereumSepolia() internal {
        address hookAddress = ${toChecksumAddress('0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750')};
        address resolverAddress = ${toChecksumAddress('0x47c011146a4498a70e0bf2e4585acf9cade85954')};
        address v4HookAddress = ${toChecksumAddress('0x2da41cdc79ae49f2725ab549717b2dbcfc42b958')};
        address v4ResolverAddress = ${toChecksumAddress('0xa5f8911d4cfd60a6697479f078409434424fe666')};
        address terminalAddress = ${toChecksumAddress('0x2db6d704058e552defe415753465df8df0361846')};
        address v4ResolverFallback = ${toChecksumAddress('0xfF80c37a57016EFf3d19fb286e9C740eC4537Dd3')};
        _processMigration(
            hookAddress,
            resolverAddress,
            v4HookAddress,
            v4ResolverAddress,
            terminalAddress,
            v4ResolverFallback,
            11155111
        );
    }
    
    function _runOptimismSepolia() internal {
        address hookAddress = ${toChecksumAddress('0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750')};
        address resolverAddress = ${toChecksumAddress('0x47c011146a4498a70e0bf2e4585acf9cade85954')};
        address v4HookAddress = ${toChecksumAddress('0x2da41cdc79ae49f2725ab549717b2dbcfc42b958')};
        address v4ResolverAddress = ${toChecksumAddress('0xa5f8911d4cfd60a6697479f078409434424fe666')};
        address terminalAddress = ${toChecksumAddress('0x2db6d704058e552defe415753465df8df0361846')};
        address v4ResolverFallback = ${toChecksumAddress('0xfF80c37a57016EFf3d19fb286e9C740eC4537Dd3')};
        _processMigration(
            hookAddress,
            resolverAddress,
            v4HookAddress,
            v4ResolverAddress,
            terminalAddress,
            v4ResolverFallback,
            11155420
        );
    }
    
    function _runBaseSepolia() internal {
        address hookAddress = ${toChecksumAddress('0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750')};
        address resolverAddress = ${toChecksumAddress('0x47c011146a4498a70e0bf2e4585acf9cade85954')};
        address v4HookAddress = ${toChecksumAddress('0x2da41cdc79ae49f2725ab549717b2dbcfc42b958')};
        address v4ResolverAddress = ${toChecksumAddress('0xa5f8911d4cfd60a6697479f078409434424fe666')};
        address terminalAddress = ${toChecksumAddress('0x2db6d704058e552defe415753465df8df0361846')};
        address v4ResolverFallback = ${toChecksumAddress('0xfF80c37a57016EFf3d19fb286e9C740eC4537Dd3')};
        _processMigration(
            hookAddress,
            resolverAddress,
            v4HookAddress,
            v4ResolverAddress,
            terminalAddress,
            v4ResolverFallback,
            84532
        );
    }
    
    function _runArbitrumSepolia() internal {
        address hookAddress = ${toChecksumAddress('0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750')};
        address resolverAddress = ${toChecksumAddress('0x47c011146a4498a70e0bf2e4585acf9cade85954')};
        address v4HookAddress = ${toChecksumAddress('0x2da41cdc79ae49f2725ab549717b2dbcfc42b958')};
        address v4ResolverAddress = ${toChecksumAddress('0xa5f8911d4cfd60a6697479f078409434424fe666')};
        address terminalAddress = ${toChecksumAddress('0x2db6d704058e552defe415753465df8df0361846')};
        address v4ResolverFallback = ${toChecksumAddress('0xfF80c37a57016EFf3d19fb286e9C740eC4537Dd3')};
        _processMigration(
            hookAddress,
            resolverAddress,
            v4HookAddress,
            v4ResolverAddress,
            terminalAddress,
            v4ResolverFallback,
            421614
        );
    }
    
    function _processMigration(address hookAddress, address resolverAddress, address v4HookAddress, address v4ResolverAddress, address terminalAddress, address v4ResolverFallback, uint256 chainId) internal {
        // Validate addresses
        require(hookAddress != address(0), "Hook address not set");
        require(resolverAddress != address(0), "Resolver address not set");
        require(v4HookAddress != address(0), "V4 Hook address not set");
        require(v4ResolverAddress != address(0), "V4 Resolver address not set");
        require(terminalAddress != address(0), "Terminal address not set");
        
        IJBTerminal terminal = IJBTerminal(terminalAddress);
        JB721TiersHook hook = JB721TiersHook(hookAddress);
        
        // Get project ID from hook
        uint256 projectId = hook.PROJECT_ID();
        
        // Deploy the appropriate chain-specific migration contract with transfer data
        if (chainId == 1) {
            // Ethereum tier IDs
            uint16[] memory allTierIds = new uint16[](${tierIds.ethereumTierIds.length});
            ${generateTierIdLoops(tierIds.ethereumTierIds)}
            address[] memory transferOwners = _getEthereumTransferOwners();
            MigrationContractEthereum migrationContract = new MigrationContractEthereum(transferOwners);
            console.log("Ethereum migration contract deployed at:", address(migrationContract));
            
            // Mint all assets to the contract address via pay()
            _mintViaPay(
                terminal,
                hook,
                projectId,
                allTierIds,
                address(migrationContract)
            );
            console.log("Minted", allTierIds.length, "tokens to contract");
            
            migrationContract.executeMigration(hookAddress, resolverAddress, v4HookAddress, v4ResolverAddress, v4ResolverFallback);
        } else if (chainId == 10) {
            // Optimism tier IDs
            uint16[] memory allTierIds = new uint16[](${tierIds.optimismTierIds.length});
            ${generateTierIdLoops(tierIds.optimismTierIds)}
            address[] memory transferOwners = _getOptimismTransferOwners();
            MigrationContractOptimism migrationContract = new MigrationContractOptimism(transferOwners);
            console.log("Optimism migration contract deployed at:", address(migrationContract));
            
            // Mint all assets to the contract address via pay()
            _mintViaPay(
                terminal,
                hook,
                projectId,
                allTierIds,
                address(migrationContract)
            );
            console.log("Minted", allTierIds.length, "tokens to contract");
            
            migrationContract.executeMigration(hookAddress, resolverAddress, v4HookAddress, v4ResolverAddress, v4ResolverFallback);
        } else if (chainId == 8453) {
            // Base tier IDs
            uint16[] memory allTierIds = new uint16[](${tierIds.baseTierIds.length});
            ${generateTierIdLoops(tierIds.baseTierIds)}
            address[] memory transferOwners = _getBaseTransferOwners();
            MigrationContractBase migrationContract = new MigrationContractBase(transferOwners);
            console.log("Base migration contract deployed at:", address(migrationContract));
            
            // Mint all assets to the contract address via pay()
            _mintViaPay(
                terminal,
                hook,
                projectId,
                allTierIds,
                address(migrationContract)
            );
            console.log("Minted", allTierIds.length, "tokens to contract");
            
            migrationContract.executeMigration(hookAddress, resolverAddress, v4HookAddress, v4ResolverAddress, v4ResolverFallback);
        } else if (chainId == 42161) {
            // Arbitrum tier IDs
            uint16[] memory allTierIds = new uint16[](${tierIds.arbitrumTierIds.length});
            ${generateTierIdLoops(tierIds.arbitrumTierIds)}
            address[] memory transferOwners = _getArbitrumTransferOwners();
            MigrationContractArbitrum migrationContract = new MigrationContractArbitrum(transferOwners);
            console.log("Arbitrum migration contract deployed at:", address(migrationContract));
            
            // Mint all assets to the contract address via pay()
            _mintViaPay(
                terminal,
                hook,
                projectId,
                allTierIds,
                address(migrationContract)
            );
            console.log("Minted", allTierIds.length, "tokens to contract");
            
            migrationContract.executeMigration(hookAddress, resolverAddress, v4HookAddress, v4ResolverAddress, v4ResolverFallback);
        } else {
            revert("Unsupported chain for contract deployment");
        }
        
        vm.stopBroadcast();
    }
    
    function _mintViaPay(
        IJBTerminal terminal,
        JB721TiersHook hook,
        uint256 projectId,
        uint16[] memory tierIds,
        address beneficiary
    ) internal {
        uint256 totalTierIds = tierIds.length;
        
        // Process tier IDs in batches
        for (uint256 i = 0; i < totalTierIds; i += BATCH_SIZE) {
            uint256 batchSize = i + BATCH_SIZE > totalTierIds ? totalTierIds - i : BATCH_SIZE;
            uint16[] memory batchTierIds = new uint16[](batchSize);
            
            // Copy tier IDs for this batch
            for (uint256 j = 0; j < batchSize; j++) {
                batchTierIds[j] = tierIds[i + j];
            }
            
            // Build the metadata using the tiers to mint and the overspending flag
            bytes[] memory data = new bytes[](1);
            data[0] = abi.encode(false, batchTierIds);
            
            // Get the hook ID
            bytes4[] memory ids = new bytes4[](1);
            ids[0] = JBMetadataResolver.getId("pay", hook.METADATA_ID_TARGET());
            
            // Generate the metadata
            bytes memory hookMetadata = JBMetadataResolver.createMetadata(ids, data);
            
            // Calculate the amount needed for this batch
            uint256 batchAmount = _calculateTotalPriceForTiers(batchTierIds);
            
            // Pay the terminal to mint the NFTs for this batch
            terminal.pay{value: batchAmount}({
                projectId: projectId,
                amount: batchAmount,
                token: JBConstants.NATIVE_TOKEN,
                beneficiary: beneficiary,
                minReturnedTokens: 0,
                memo: "Airdrop mint",
                metadata: hookMetadata
            });
        }
    }
    
    function _getPriceForUPC(uint16 upc) internal pure returns (uint256) {
        // Price map: UPC -> price in wei
        // This is generated from raw.json prices
${generatePriceMap(items)}
    }
    
    function _calculateTotalPriceForTiers(uint16[] memory tierIds) internal pure returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < tierIds.length; i++) {
            total += _getPriceForUPC(tierIds[i]);
        }
        return total;
    }${transferDataFunctions}
}`;
}

function generateChainSpecificContracts(inputFile) {
    console.log(`\n=== Generating chain-specific migration contracts from ${inputFile} ===`);

    // Load the raw data
    const rawDataPath = path.join(__dirname, inputFile);
    const rawData = JSON.parse(fs.readFileSync(rawDataPath, 'utf8'));

    const items = rawData.data.nfts.items;

    const chains = [
        { id: 1, name: 'Ethereum', fileName: 'MigrationContractEthereum.sol' },
        { id: 10, name: 'Optimism', fileName: 'MigrationContractOptimism.sol' },
        { id: 8453, name: 'Base', fileName: 'MigrationContractBase.sol' },
        { id: 42161, name: 'Arbitrum', fileName: 'MigrationContractArbitrum.sol' },
        { id: 11155111, name: 'EthereumSepolia', fileName: 'MigrationContractEthereumSepolia.sol' },
        { id: 11155420, name: 'OptimismSepolia', fileName: 'MigrationContractOptimismSepolia.sol' },
        { id: 84532, name: 'BaseSepolia', fileName: 'MigrationContractBaseSepolia.sol' },
        { id: 421614, name: 'ArbitrumSepolia', fileName: 'MigrationContractArbitrumSepolia.sol' }
    ];

    chains.forEach(chain => {
        const chainItems = items.filter(item => item.chainId === chain.id);
        console.log(`Processing chain ${chain.id} (${chain.name}): ${chainItems.length} items`);

        if (chainItems.length === 0) {
            console.log(`Skipping ${chain.name} - no items found`);
            return;
        }

        // Generate contract for this specific chain
        const contract = generateSingleChainContract(chain, chainItems);

        // Write the contract to file
        const outputPath = path.join(__dirname, '..', chain.fileName);
        fs.writeFileSync(outputPath, contract);

        console.log(`Generated ${chain.fileName} with ${chainItems.length} items`);
    });
}

function generateSingleChainContract(chain, chainItems) {
    // Process data for this chain
    const bannys = [];
    const outfits = [];
    const backgrounds = [];
    const tierIdQuantities = new Map(); // Map UPC to quantity needed
    const transferData = []; // Array of {tokenIndex, owner} for transfers

    chainItems.forEach(item => {
        const tokenId = item.metadata.tokenId;
        const upc = item.metadata.upc;
        const category = item.metadata.category;
        const categoryName = item.metadata.categoryName;
        const owner = toChecksumAddress(item.owner || (item.wallet ? item.wallet.address : '0x0000000000000000000000000000000000000000'));
        const productName = item.metadata.productName;

        // Count how many of each UPC we need
        tierIdQuantities.set(upc, (tierIdQuantities.get(upc) || 0) + 1);

        if (category === 0) {
            // Banny body
            bannys.push({
                tokenId,
                upc,
                backgroundId: item.metadata.backgroundId || 0,
                outfitIds: item.metadata.outfitIds || [],
                owner,
                productName
            });
        } else if (category === 1) {
            // Background
            backgrounds.push({
                tokenId,
                upc,
                owner,
                productName
            });
        } else {
            // Outfit
            outfits.push({
                tokenId,
                upc,
                category,
                categoryName,
                owner,
                productName
            });
        }
    });

    // Collect all outfitIds and backgroundIds that are being used
    const usedOutfitIds = new Set();
    const usedBackgroundIds = new Set();

    bannys.forEach(banny => {
        if (banny.backgroundId && banny.backgroundId !== 0) {
            usedBackgroundIds.add(banny.backgroundId);
        }
        banny.outfitIds.forEach(outfitId => {
            usedOutfitIds.add(outfitId);
        });
    });

    // Build transfer data array
    const allItems = [...bannys, ...outfits, ...backgrounds];
    let transferIndex = 0;

    allItems.forEach((item, index) => {
        // Skip if owner is zero address
        if (item.owner === '0x0000000000000000000000000000000000000000') {
            return;
        }

        // Skip if this is an outfit being worn
        if (item.tokenId && usedOutfitIds.has(item.tokenId)) {
            return;
        }

        // Skip if this is a background being used
        if (item.tokenId && usedBackgroundIds.has(item.tokenId)) {
            return;
        }

        transferData.push({
            tokenIndex: transferIndex,
            owner: item.owner
        });
        transferIndex++;
    });

    let contract = `// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";

contract MigrationContract${chain.name} {
    address[] private transferOwners;
    
    constructor(address[] memory _transferOwners) {
        transferOwners = _transferOwners;
    }
    
    function executeMigration(
        address hookAddress,
        address resolverAddress,
        address v4HookAddress,
        address v4ResolverAddress,
        address fallbackV4ResolverAddress
    ) external {
        
        // Validate addresses
        require(hookAddress != address(0), "Hook address not set");
        require(resolverAddress != address(0), "Resolver address not set");
        require(v4HookAddress != address(0), "V4 Hook address not set");
        require(v4ResolverAddress != address(0), "V4 Resolver address not set");
        require(fallbackV4ResolverAddress != address(0), "V4 fallback resolver address not set");
        
        JB721TiersHook hook = JB721TiersHook(hookAddress);
        Banny721TokenUriResolver resolver = Banny721TokenUriResolver(resolverAddress);
        IERC721 v4Hook = IERC721(v4HookAddress);
        Banny721TokenUriResolver v4Resolver = Banny721TokenUriResolver(v4ResolverAddress);
        Banny721TokenUriResolver fallbackV4Resolver = Banny721TokenUriResolver(fallbackV4ResolverAddress);
        
        // ${chain.name} migration - ${chainItems.length} items
        
        // Step 1: Assets are already minted to this contract by the deployer
        `;

    // Generate struct definition for minted token IDs
    const uniqueUpcs = Array.from(tierIdQuantities.keys()).sort((a, b) => a - b);

    // Generate struct definition at contract level
    let structDefinition = `
    // Define struct to hold all UPC minted tokenIds
    struct MintedIds {
`;

    uniqueUpcs.forEach(upc => {
        const quantity = tierIdQuantities.get(upc);
        structDefinition += `        uint256[${quantity}] upc${upc};\n`;
    });

    structDefinition += `    }
    
    `;

    // Insert struct definition into contract
    const contractStart = `contract MigrationContract${chain.name} {`;
    const replacement = `${contractStart}${structDefinition}address[] private transferOwners;`;
    contract = contract.replace(`${contractStart}\n    address[] private transferOwners;`, replacement);

    contract += `
        
        // Assets are already minted to this contract by the deployer
        `;

    // Create a mapping from UPC to minted tokenIds for dressing
    const upcToMintedIds = new Map();

    contract += `
        // Create and populate the struct
        // Token IDs are generated as: UPC * 1000000000 + unitNumber (where unitNumber starts at 1)
        MintedIds memory sortedMintedIds;
        `;

    uniqueUpcs.forEach(upc => {
        const quantity = tierIdQuantities.get(upc);
        contract += `
        // Populate UPC ${upc} minted tokenIds (${quantity} items)
        for (uint256 i = 0; i < ${quantity}; i++) {
            sortedMintedIds.upc${upc}[i] = ${upc} * 1000000000 + (i + 1);
        }`;
        upcToMintedIds.set(upc, `sortedMintedIds.upc${upc}`);
    });

    // Check if there are any outfits or backgrounds that need approval
    const hasOutfitsOrBackgrounds = bannys.some(banny =>
        (banny.outfitIds && banny.outfitIds.length > 0) ||
        (banny.backgroundId && banny.backgroundId !== 0)
    );

    // Generate approval code using setApprovalForAll
    if (hasOutfitsOrBackgrounds) {
        contract += `
        // Step 1.5: Approve resolver to transfer all tokens owned by this contract
        // The resolver needs approval to transfer outfits and backgrounds to itself during decoration
        IERC721(address(hook)).setApprovalForAll(address(resolver), true);
        `;
    }

    contract += `
        // Step 2: Process each Banny body and dress them
        `;

    // Add Banny dressing calls
    bannys.forEach((banny, index) => {
        if (banny.outfitIds.length > 0) {
            contract += `
        // Dress Banny ${banny.tokenId} (${banny.productName})
        {
            uint256[] memory outfitIds = new uint256[](${banny.outfitIds.length});
            uint256[] memory expectedV4Outfits = new uint256[](${banny.outfitIds.length});
            `;

            banny.outfitIds.forEach((v4OutfitId, outfitIndex) => {
                // Find which UPC this V4 outfitId corresponds to
                const matchingItem = chainItems.find(item => item.metadata.tokenId === v4OutfitId);
                if (matchingItem) {
                    const upc = matchingItem.metadata.upc;
                    const upcArrayName = upcToMintedIds.get(upc);
                    // Find the index of this specific outfitId within its UPC
                    const upcItems = chainItems.filter(item => item.metadata.upc === upc);
                    const itemIndex = upcItems.findIndex(item => item.metadata.tokenId === v4OutfitId);

                    contract += `            outfitIds[${outfitIndex}] = ${upcArrayName}[${itemIndex}]; // V4: ${v4OutfitId} -> V5: ${upcArrayName}[${itemIndex}]\n`;
                } else {
                    // Fallback to V4 outfitId if we can't find the mapping
                    contract += `            outfitIds[${outfitIndex}] = ${v4OutfitId}; // Fallback: using V4 outfitId\n`;                                      
                }
                contract += `            expectedV4Outfits[${outfitIndex}] = ${v4OutfitId};\n`;
            });

            // Map backgroundId to V5 minted tokenId
            let v5BackgroundId = banny.backgroundId;
            if (banny.backgroundId && banny.backgroundId !== 0) {
                const backgroundItem = chainItems.find(item => item.metadata.tokenId === banny.backgroundId);                                                   
                if (backgroundItem) {
                    const upc = backgroundItem.metadata.upc;
                    const upcArrayName = upcToMintedIds.get(upc);
                    const upcItems = chainItems.filter(item => item.metadata.upc === upc);                                                                      
                    const itemIndex = upcItems.findIndex(item => item.metadata.tokenId === banny.backgroundId);                                                 
                    v5BackgroundId = `${upcArrayName}[${itemIndex}]`;
                }
            }

            contract += `
            resolver.decorateBannyWith(
                address(hook),
                ${banny.tokenId},
                ${v5BackgroundId},
                outfitIds
            );
            
            _expectV4AssetIds(
                resolver,
                fallbackV4Resolver,
                v4HookAddress,
                ${banny.tokenId},
                ${banny.backgroundId},
                expectedV4Outfits,
                "V4/V5 asset mismatch for Banny ${banny.tokenId}"
            );
            `;

            contract += `
        }
        `;
        }
    });

    contract += `
        // Step 3: Transfer all assets to rightful owners using constructor data
        // Generate token IDs in the same order as items appear (matching mint order)
        // Token ID format: UPC * 1000000000 + unitNumber
        uint256[] memory generatedTokenIds = new uint256[](transferOwners.length);
        ${generateTokenIdArray(chainItems, transferData, tierIdQuantities)}
        
        for (uint256 i = 0; i < transferOwners.length; i++) {
            uint256 tokenId = generatedTokenIds[i];
            // Verify V4 ownership before transferring V5
            address v4Owner = v4Hook.ownerOf(tokenId);
            require(v4Owner == transferOwners[i], "V4/V5 ownership mismatch for token");
            
            IERC721(address(hook)).transferFrom(
                address(this), 
                transferOwners[i], 
                tokenId
            );
        }
    }

    function _matchesV4AssetIds(
        uint256 backgroundId,
        uint256[] memory outfitIds,
        uint256 expectedBackgroundId,
        uint256[] memory expectedOutfitIds
    ) internal pure returns (bool) {
        if (backgroundId != expectedBackgroundId) return false;
        if (outfitIds.length != expectedOutfitIds.length) return false;
        for (uint256 i = 0; i < outfitIds.length; i++) {
            if (outfitIds[i] != expectedOutfitIds[i]) return false;
        }
        return true;
    }

    function _expectV4AssetIds(
        Banny721TokenUriResolver primaryResolver,
        Banny721TokenUriResolver fallbackResolver,
        address v4HookAddress,
        uint256 tokenId,
        uint256 expectedBackgroundId,
        uint256[] memory expectedOutfitIds,
        string memory errorMessage
    ) internal view {
        (uint256 backgroundId, uint256[] memory outfitIds) = primaryResolver.assetIdsOf(v4HookAddress, tokenId);
        if (_matchesV4AssetIds(backgroundId, outfitIds, expectedBackgroundId, expectedOutfitIds)) {
            return;
        }

        (backgroundId, outfitIds) = fallbackResolver.assetIdsOf(v4HookAddress, tokenId);
        require(
            _matchesV4AssetIds(backgroundId, outfitIds, expectedBackgroundId, expectedOutfitIds),
            errorMessage
        );
    }
}`;

    // Fix indentation issues
    contract = contract.replace(/^                        outfitIds\[0\] =/gm, '            outfitIds[0] =');
    contract = contract.replace(/^                    }$/gm, '        }'); // Fix struct closing bracket indentation

    return contract;
}

// Run the script generation
generateMigrationScript();
