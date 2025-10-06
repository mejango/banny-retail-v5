#!/usr/bin/env node

const fs = require('fs');
const path = require('path');

// V4 to V5 migration script generator
// Generates both direct and contract-based versions from raw.json
// Note: Outfit IDs are generated automatically when minting in V5
// The system handles V4 to V5 category mapping internally

function generateMigrationScript() {
    // Generate both versions from raw.json
    generateScriptForFile('raw.json', 'AirdropOutfits.s.sol', 'direct');
    generateScriptForFile('raw.json', 'AirdropOutfitsContract.s.sol', 'contract');
    
    // Generate chain-specific migration contracts
    generateChainSpecificContracts('raw.json');
}

function generateScriptForFile(inputFile, outputFile, version = 'direct') {
    console.log(`\n=== Generating ${outputFile} from ${inputFile} (${version} version) ===`);
    
    // Load the raw data
    const rawDataPath = path.join(__dirname, inputFile);
    const rawData = JSON.parse(fs.readFileSync(rawDataPath, 'utf8'));
    
    const items = rawData.data.nfts.items;
    
    // Generate the migration script based on version
    let script;
    if (version === 'contract') {
        script = generateContractVersion(items);
    } else {
        script = generateDirectVersion(items);
    }
    
    // Write the script to file
    const outputPath = path.join(__dirname, '..', outputFile);
    fs.writeFileSync(outputPath, script);
    
    console.log(`Generated migration script with chain-specific filtering`);
    console.log(`Script written to: ${outputPath}`);
}

function generateDirectVersion(items) {
    let script = `// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";

contract AirdropOutfitsScript is Script {
    function run() public {
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
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 1); // Ethereum mainnet
    }
    
    function _runOptimism() internal {
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 10); // Optimism
    }
    
    function _runBase() internal {
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 8453); // Base
    }
    
    function _runArbitrum() internal {
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 42161); // Arbitrum
    }
    
    function _runEthereumSepolia() internal {
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 11155111); // Ethereum Sepolia
    }
    
    function _runOptimismSepolia() internal {
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 11155420); // Optimism Sepolia
    }
    
    function _runBaseSepolia() internal {
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 84532); // Base Sepolia
    }
    
    function _runArbitrumSepolia() internal {
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 421614); // Arbitrum Sepolia
    }
    
    function _processMigration(address hookAddress, address resolverAddress, uint256 chainId) internal {
        address deployer = vm.addr(vm.envUint("PRIVATE_KEY"));
        
        // Validate addresses
        require(hookAddress != address(0), "Hook address not set");
        require(resolverAddress != address(0), "Resolver address not set");
        
        JB721TiersHook hook = JB721TiersHook(hookAddress);
        Banny721TokenUriResolver resolver = Banny721TokenUriResolver(resolverAddress);
        
        vm.startBroadcast();
        
        // Process the migration for this specific chain
        _executeMigration(hook, resolver, deployer, chainId);
        
        vm.stopBroadcast();
    }
    
    function _executeMigration(
        JB721TiersHook hook,
        Banny721TokenUriResolver resolver,
        address deployer,
        uint256 chainId
    ) internal {
        // Filter data by chainId and process migration
        `;

    // Generate chain-specific data processing
    const chains = [
        { id: 1, name: 'Ethereum' },
        { id: 10, name: 'Optimism' },
        { id: 8453, name: 'Base' },
        { id: 42161, name: 'Arbitrum' },
        { id: 11155111, name: 'EthereumSepolia' },
        { id: 11155420, name: 'OptimismSepolia' },
        { id: 84532, name: 'BaseSepolia' },
        { id: 421614, name: 'ArbitrumSepolia' }
    ];

    chains.forEach(chain => {
        const chainItems = items.filter(item => item.chainId === chain.id);
        console.log(`Processing chain ${chain.id} (${chain.name}): ${chainItems.length} items`);
        
        if (chainItems.length === 0) {
            script += `
        if (chainId == ${chain.id}) {
            // No items found for ${chain.name}
            console.log("No items to migrate on ${chain.name}");
            return;
        }`;
            return;
        }

        // Process data for this chain
        const bannys = [];
        const outfits = [];
        const backgrounds = [];
        const tierIdQuantities = new Map(); // Map UPC to quantity needed
        
        chainItems.forEach(item => {
            const tokenId = item.metadata.tokenId;
            const upc = item.metadata.upc;
            const category = item.metadata.category;
            const categoryName = item.metadata.categoryName;
            const owner = item.owner || (item.wallet ? item.wallet.address : '0x0000000000000000000000000000000000000000');
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

        // Generate the chain-specific migration code
        script += `
        if (chainId == ${chain.id}) {
            // ${chain.name} migration
            console.log("Migrating ${chainItems.length} items on ${chain.name}");
            
            // Step 1: Mint all assets to deployer initially
            `;

        script += `
            console.log("Minting tierIds to deployer");
            `;

        // Generate single mintFor call with all tierIds
        const uniqueUpcs = Array.from(tierIdQuantities.keys()).sort((a, b) => a - b);
        const totalQuantity = Array.from(tierIdQuantities.values()).reduce((sum, qty) => sum + qty, 0);
        
        script += `
            // Create array of all tierIds to mint
            uint256[] memory allTierIds = new uint256[](${totalQuantity});
            uint256 tierIndex = 0;
            `;

        // Generate the tierIds array
        uniqueUpcs.forEach(upc => {
            const quantity = tierIdQuantities.get(upc);
            script += `
            // Add ${quantity} instances of UPC ${upc}
            for (uint256 i = 0; i < ${quantity}; i++) {
                allTierIds[tierIndex] = ${upc};
                tierIndex++;
            }`;
        });

        script += `
            
            // Mint all tierIds at once
            uint256[] memory mintedIds = hook.mintFor(allTierIds, deployer);
            `;

        // Create a mapping from UPC to minted tokenIds for dressing
        const upcToMintedIds = new Map();
        let currentIndex = 0;
        uniqueUpcs.forEach(upc => {
            const quantity = tierIdQuantities.get(upc);
            script += `
            // UPC ${upc} minted tokenIds (${quantity} items)
            uint256[] memory upc${upc}MintedIds = new uint256[](${quantity});
            for (uint256 i = 0; i < ${quantity}; i++) {
                upc${upc}MintedIds[i] = mintedIds[${currentIndex} + i];
            }`;
            upcToMintedIds.set(upc, `upc${upc}MintedIds`);
            currentIndex += quantity;
        });

        script += `
            // Step 2: Process each Banny body and dress them
            console.log("Processing ${bannys.length} Banny bodies...");
            `;

        // Add Banny dressing calls
        bannys.forEach((banny, index) => {
            if (banny.outfitIds.length > 0) {
                script += `
            // Dress Banny ${banny.tokenId} (${banny.productName})
            {
                uint256[] memory outfitIds = new uint256[](${banny.outfitIds.length});
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
                        
                        script += `                outfitIds[${outfitIndex}] = ${upcArrayName}[${itemIndex}]; // V4: ${v4OutfitId} -> V5: ${upcArrayName}[${itemIndex}]\n`;
                    } else {
                        // Fallback to V4 outfitId if we can't find the mapping
                        script += `                outfitIds[${outfitIndex}] = ${v4OutfitId}; // Fallback: using V4 outfitId\n`;
                    }
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
                
                script += `
                resolver.decorateBannyWith(
                    address(hook),
                    ${banny.tokenId},
                    ${v5BackgroundId},
                    outfitIds
                );
            }
            `;
            }
        });

        script += `
            // Step 3: Transfer all assets to rightful owners
            console.log("Transferring %d tokens to rightful owners", mintedIds.length);
            `;

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

        // Add transfer calls
        // Transfer tokens in the order they were minted (stored in allMintedTokenIds)
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
            
            script += `
            // Transfer UPC ${item.upc} (minted tokenId mintedIds[${transferIndex}]) to ${item.owner}
            IERC721(address(hook)).transferFrom(deployer, ${item.owner}, mintedIds[${transferIndex}]);
            `;
            transferIndex++;
        });

        script += `
            return;
        }`;
    });

    script += `
    }
}
`;

    return script;
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
        const owner = item.owner || (item.wallet ? item.wallet.address : '0x0000000000000000000000000000000000000000');
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

function generateContractVersion(items) {
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

contract AirdropOutfitsContractScript is Script {
    function run() public {
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
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 1);
    }
    
    function _runOptimism() internal {
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 10);
    }
    
    function _runBase() internal {
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 8453);
    }
    
    function _runArbitrum() internal {
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 42161);
    }
    
    function _runEthereumSepolia() internal {
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 11155111);
    }
    
    function _runOptimismSepolia() internal {
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 11155420);
    }
    
    function _runBaseSepolia() internal {
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 84532);
    }
    
    function _runArbitrumSepolia() internal {
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146a4498a70e0bf2e4585acf9cade85954;
        _processMigration(hookAddress, resolverAddress, 421614);
    }
    
    function _processMigration(address hookAddress, address resolverAddress, uint256 chainId) internal {
        address deployer = vm.addr(vm.envUint("PRIVATE_KEY"));
        
        // Validate addresses
        require(hookAddress != address(0), "Hook address not set");
        require(resolverAddress != address(0), "Resolver address not set");
        
        vm.startBroadcast();
        
        // Deploy the appropriate chain-specific migration contract with transfer data
        if (chainId == 1) {
            address[] memory transferOwners = _getEthereumTransferOwners();
            MigrationContractEthereum migrationContract = new MigrationContractEthereum(transferOwners);
            console.log("Ethereum migration contract deployed at:", address(migrationContract));
            migrationContract.executeMigration(hookAddress, resolverAddress);
        } else if (chainId == 10) {
            address[] memory transferOwners = _getOptimismTransferOwners();
            MigrationContractOptimism migrationContract = new MigrationContractOptimism(transferOwners);
            console.log("Optimism migration contract deployed at:", address(migrationContract));
            migrationContract.executeMigration(hookAddress, resolverAddress);
        } else if (chainId == 8453) {
            address[] memory transferOwners = _getBaseTransferOwners();
            MigrationContractBase migrationContract = new MigrationContractBase(transferOwners);
            console.log("Base migration contract deployed at:", address(migrationContract));
            migrationContract.executeMigration(hookAddress, resolverAddress);
        } else if (chainId == 42161) {
            address[] memory transferOwners = _getArbitrumTransferOwners();
            MigrationContractArbitrum migrationContract = new MigrationContractArbitrum(transferOwners);
            console.log("Arbitrum migration contract deployed at:", address(migrationContract));
            migrationContract.executeMigration(hookAddress, resolverAddress);
        } else {
            revert("Unsupported chain for contract deployment");
        }
        
        vm.stopBroadcast();
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
        const owner = item.owner || (item.wallet ? item.wallet.address : '0x0000000000000000000000000000000000000000');
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
        address resolverAddress
    ) external {
        address deployer = msg.sender;
        
        // Validate addresses
        require(hookAddress != address(0), "Hook address not set");
        require(resolverAddress != address(0), "Resolver address not set");
        
        JB721TiersHook hook = JB721TiersHook(hookAddress);
        Banny721TokenUriResolver resolver = Banny721TokenUriResolver(resolverAddress);
        
        // ${chain.name} migration - ${chainItems.length} items
        
        // Step 1: Mint all assets to deployer initially
        `;

    // Generate single mintFor call with all tierIds
    const uniqueUpcs = Array.from(tierIdQuantities.keys()).sort((a, b) => a - b);
    const totalQuantity = Array.from(tierIdQuantities.values()).reduce((sum, qty) => sum + qty, 0);
    
    contract += `
        // Create array of all tierIds to mint
        uint256[] memory allTierIds = new uint256[](${totalQuantity});
        uint256 tierIndex = 0;
        `;

    // Generate the tierIds array
    uniqueUpcs.forEach(upc => {
        const quantity = tierIdQuantities.get(upc);
        contract += `
        // Add ${quantity} instances of UPC ${upc}
        for (uint256 i = 0; i < ${quantity}; i++) {
            allTierIds[tierIndex] = ${upc};
            tierIndex++;
        }`;
    });

    contract += `
        
        // Mint all tierIds at once
        uint256[] memory mintedIds = hook.mintFor(allTierIds, deployer);
        `;

    // Create a mapping from UPC to minted tokenIds for dressing
    const upcToMintedIds = new Map();
    let currentIndex = 0;
    uniqueUpcs.forEach(upc => {
        const quantity = tierIdQuantities.get(upc);
        contract += `
        // UPC ${upc} minted tokenIds (${quantity} items)
        uint256[] memory upc${upc}MintedIds = new uint256[](${quantity});
        for (uint256 i = 0; i < ${quantity}; i++) {
            upc${upc}MintedIds[i] = mintedIds[${currentIndex} + i];
        }`;
        upcToMintedIds.set(upc, `upc${upc}MintedIds`);
        currentIndex += quantity;
    });

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
        }
        `;
        }
    });

    contract += `
        // Step 3: Transfer all assets to rightful owners using constructor data
        for (uint256 i = 0; i < transferOwners.length; i++) {
            IERC721(address(hook)).transferFrom(
                deployer, 
                transferOwners[i], 
                mintedIds[i]
            );
        }
    }
}`;

    return contract;
}

// Run the script generation
generateMigrationScript();
