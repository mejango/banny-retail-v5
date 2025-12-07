// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {MigrationContractBase5} from "./MigrationContractBase5.sol";

import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Sphinx} from "@sphinx-labs/contracts/SphinxPlugin.sol";
import {IJBTerminal} from "@bananapus/core-v5/src/interfaces/IJBTerminal.sol";
import {JBConstants} from "@bananapus/core-v5/src/libraries/JBConstants.sol";
import {JBMetadataResolver} from "@bananapus/core-v5/src/libraries/JBMetadataResolver.sol";

contract AirdropOutfitsBatch8Script is Script, Sphinx {
    // Maximum tier IDs per batch to avoid metadata size limit (255 words max)
    // Each tier ID takes 1 word, plus overhead for array length, boolean, and metadata structure
    // Using 100 as a safe batch size to stay well under the limit
    uint256 private constant BATCH_SIZE = 100;
    
    function configureSphinx() public override {
        sphinxConfig.projectName = "banny-core";
        sphinxConfig.mainnets = ["ethereum", "optimism", "base", "arbitrum"];
        sphinxConfig.testnets = ["ethereum_sepolia", "optimism_sepolia", "base_sepolia", "arbitrum_sepolia"];
    }

    function run() public sphinx {
        uint256 chainId = block.chainid;
        
        if (chainId == 8453) {
            // Base
            _runBase();
        } else if (chainId == 84532) {
            // Base Sepolia
            _runBaseSepolia();
        } else {
            revert("Unsupported chain for batch 8");
        }
    }

    function _runBase() internal {
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146A4498a70E0bF2E4585acF9CaDE85954;
        address v4HookAddress = 0x2da41CdC79Ae49F2725AB549717B2DBcfc42b958;
        address v4ResolverAddress = 0xa5F8911d4CFd60a6697479f078409434424fe666;
        address terminalAddress = 0x2dB6d704058E552DeFE415753465df8dF0361846;
        address v4ResolverFallback = 0xfF80c37a57016EFf3d19fb286e9C740eC4537Dd3;
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
    
    function _runBaseSepolia() internal {
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146A4498a70E0bF2E4585acF9CaDE85954;
        address v4HookAddress = 0x2da41CdC79Ae49F2725AB549717B2DBcfc42b958;
        address v4ResolverAddress = 0xa5F8911d4CFd60a6697479f078409434424fe666;
        address terminalAddress = 0x2dB6d704058E552DeFE415753465df8dF0361846;
        address v4ResolverFallback = 0xfF80c37a57016EFf3d19fb286e9C740eC4537Dd3;
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
        
        if (chainId == 8453 || chainId == 84532) {
            // Base - Batch 8 only
            uint16[] memory tierIds8 = new uint16[](53);
            
            // Add 2 instances of tier ID 5
            for (uint256 i = 0; i < 2; i++) {
                tierIds8[0 + i] = 5;
            }
            // Add 1 instances of tier ID 6
            for (uint256 i = 0; i < 1; i++) {
                tierIds8[2 + i] = 6;
            }
            // Add 1 instances of tier ID 7
            for (uint256 i = 0; i < 1; i++) {
                tierIds8[3 + i] = 7;
            }
            // Add 6 instances of tier ID 10
            for (uint256 i = 0; i < 6; i++) {
                tierIds8[4 + i] = 10;
            }
            // Add 2 instances of tier ID 11
            for (uint256 i = 0; i < 2; i++) {
                tierIds8[10 + i] = 11;
            }
            // Add 1 instances of tier ID 13
            for (uint256 i = 0; i < 1; i++) {
                tierIds8[12 + i] = 13;
            }
            // Add 1 instances of tier ID 14
            for (uint256 i = 0; i < 1; i++) {
                tierIds8[13 + i] = 14;
            }
            // Add 1 instances of tier ID 17
            for (uint256 i = 0; i < 1; i++) {
                tierIds8[14 + i] = 17;
            }
            // Add 5 instances of tier ID 19
            for (uint256 i = 0; i < 5; i++) {
                tierIds8[15 + i] = 19;
            }
            // Add 1 instances of tier ID 24
            for (uint256 i = 0; i < 1; i++) {
                tierIds8[20 + i] = 24;
            }
            // Add 1 instances of tier ID 25
            for (uint256 i = 0; i < 1; i++) {
                tierIds8[21 + i] = 25;
            }
            // Add 4 instances of tier ID 28
            for (uint256 i = 0; i < 4; i++) {
                tierIds8[22 + i] = 28;
            }
            // Add 4 instances of tier ID 31
            for (uint256 i = 0; i < 4; i++) {
                tierIds8[26 + i] = 31;
            }
            // Add 1 instances of tier ID 32
            for (uint256 i = 0; i < 1; i++) {
                tierIds8[30 + i] = 32;
            }
            // Add 1 instances of tier ID 34
            for (uint256 i = 0; i < 1; i++) {
                tierIds8[31 + i] = 34;
            }
            // Add 3 instances of tier ID 35
            for (uint256 i = 0; i < 3; i++) {
                tierIds8[32 + i] = 35;
            }
            // Add 1 instances of tier ID 38
            for (uint256 i = 0; i < 1; i++) {
                tierIds8[35 + i] = 38;
            }
            // Add 1 instances of tier ID 39
            for (uint256 i = 0; i < 1; i++) {
                tierIds8[36 + i] = 39;
            }
            // Add 2 instances of tier ID 40
            for (uint256 i = 0; i < 2; i++) {
                tierIds8[37 + i] = 40;
            }
            // Add 1 instances of tier ID 41
            for (uint256 i = 0; i < 1; i++) {
                tierIds8[39 + i] = 41;
            }
            // Add 2 instances of tier ID 42
            for (uint256 i = 0; i < 2; i++) {
                tierIds8[40 + i] = 42;
            }
            // Add 2 instances of tier ID 43
            for (uint256 i = 0; i < 2; i++) {
                tierIds8[42 + i] = 43;
            }
            // Add 2 instances of tier ID 44
            for (uint256 i = 0; i < 2; i++) {
                tierIds8[44 + i] = 44;
            }
            // Add 5 instances of tier ID 47
            for (uint256 i = 0; i < 5; i++) {
                tierIds8[46 + i] = 47;
            }
            // Add 2 instances of tier ID 49
            for (uint256 i = 0; i < 2; i++) {
                tierIds8[51 + i] = 49;
            }
            address[] memory transferOwners8 = _getBaseTransferOwners8();
            MigrationContractBase8 migrationContract8 = new MigrationContractBase8(transferOwners8);
            console.log("Base migration contract 8 deployed at:", address(migrationContract8));
            
            // Mint chunk 8 assets to the contract address via pay()
            _mintViaPay(
                terminal,
                hook,
                projectId,
                tierIds8,
                address(migrationContract8)
            );
            console.log("Minted", tierIds8.length, "tokens to contract 8");
            
            migrationContract8.executeMigration(hookAddress, resolverAddress, v4HookAddress, v4ResolverAddress, v4ResolverFallback);
            
        } else 
        {
            revert("Unsupported chain for contract deployment");
        }
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

        if (upc == 1) return 1000000000000000000;
        if (upc == 2) return 100000000000000000;
        if (upc == 3) return 10000000000000000;
        if (upc == 4) return 100000000000000;
        if (upc == 5) return 10000000000000000;
        if (upc == 6) return 10000000000000000;
        if (upc == 7) return 10000000000000000;
        if (upc == 10) return 1000000000000000;
        if (upc == 11) return 10000000000000000;
        if (upc == 13) return 10000000000000000;
        if (upc == 14) return 10000000000000000;
        if (upc == 15) return 10000000000000000;
        if (upc == 16) return 100000000000000000;
        if (upc == 17) return 10000000000000000;
        if (upc == 18) return 10000000000000000;
        if (upc == 19) return 1000000000000000;
        if (upc == 20) return 10000000000000000;
        if (upc == 21) return 100000000000000000;
        if (upc == 23) return 10000000000000000;
        if (upc == 24) return 150000000000000000;
        if (upc == 25) return 1000000000000000;
        if (upc == 26) return 10000000000000000;
        if (upc == 27) return 100000000000000000;
        if (upc == 28) return 1000000000000000;
        if (upc == 29) return 100000000000000000;
        if (upc == 31) return 1000000000000000;
        if (upc == 32) return 10000000000000000;
        if (upc == 33) return 15000000000000000;
        if (upc == 34) return 10000000000000000;
        if (upc == 35) return 10000000000000000;
        if (upc == 37) return 10000000000000000;
        if (upc == 38) return 10000000000000000;
        if (upc == 39) return 10000000000000000;
        if (upc == 40) return 10000000000000000;
        if (upc == 41) return 10000000000000000;
        if (upc == 42) return 1000000000000000;
        if (upc == 43) return 1000000000000000;
        if (upc == 44) return 1787000000000000;
        if (upc == 45) return 100000000000000000;
        if (upc == 46) return 100000000000000000;
        if (upc == 47) return 1000000000000000;
        if (upc == 48) return 100000000000000000;
        if (upc == 49) return 1000000000000000;
        return 0;
    }
    
    function _calculateTotalPriceForTiers(uint16[] memory tierIds) internal pure returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < tierIds.length; i++) {
            total += _getPriceForUPC(tierIds[i]);
        }
        return total;
    }
}