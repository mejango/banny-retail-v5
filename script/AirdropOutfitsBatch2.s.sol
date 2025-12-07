// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {MigrationContractEthereum2} from "./MigrationContractEthereum2.sol";
import {MigrationContractBase2} from "./MigrationContractBase2.sol";

import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Sphinx} from "@sphinx-labs/contracts/SphinxPlugin.sol";
import {IJBTerminal} from "@bananapus/core-v5/src/interfaces/IJBTerminal.sol";
import {JBConstants} from "@bananapus/core-v5/src/libraries/JBConstants.sol";
import {JBMetadataResolver} from "@bananapus/core-v5/src/libraries/JBMetadataResolver.sol";

contract AirdropOutfitsBatch2Script is Script, Sphinx {
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
        
        if (chainId == 1) {
            // Ethereum Mainnet
            _runEthereum();
        } else if (chainId == 11155111) {
            // Ethereum Sepolia
            _runEthereumSepolia();
        } else if (chainId == 8453) {
            // Base
            _runBase();
        } else if (chainId == 84532) {
            // Base Sepolia
            _runBaseSepolia();
        } else {
            revert("Unsupported chain for batch 2");
        }
    }

    function _runEthereum() internal {
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
            1
        );
    }
    
    function _runEthereumSepolia() internal {
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
            11155111
        );
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
        
        if (chainId == 1 || chainId == 11155111) {
            // Ethereum - Batch 2 only
            uint16[] memory tierIds2 = new uint16[](84);
            
            // Add 40 instances of tier ID 4
            for (uint256 i = 0; i < 40; i++) {
                tierIds2[0 + i] = 4;
            }
            // Add 1 instances of tier ID 5
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[40 + i] = 5;
            }
            // Add 1 instances of tier ID 6
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[41 + i] = 6;
            }
            // Add 4 instances of tier ID 10
            for (uint256 i = 0; i < 4; i++) {
                tierIds2[42 + i] = 10;
            }
            // Add 1 instances of tier ID 13
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[46 + i] = 13;
            }
            // Add 1 instances of tier ID 15
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[47 + i] = 15;
            }
            // Add 1 instances of tier ID 16
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[48 + i] = 16;
            }
            // Add 1 instances of tier ID 17
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[49 + i] = 17;
            }
            // Add 1 instances of tier ID 18
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[50 + i] = 18;
            }
            // Add 5 instances of tier ID 19
            for (uint256 i = 0; i < 5; i++) {
                tierIds2[51 + i] = 19;
            }
            // Add 1 instances of tier ID 20
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[56 + i] = 20;
            }
            // Add 4 instances of tier ID 23
            for (uint256 i = 0; i < 4; i++) {
                tierIds2[57 + i] = 23;
            }
            // Add 4 instances of tier ID 25
            for (uint256 i = 0; i < 4; i++) {
                tierIds2[61 + i] = 25;
            }
            // Add 1 instances of tier ID 26
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[65 + i] = 26;
            }
            // Add 3 instances of tier ID 31
            for (uint256 i = 0; i < 3; i++) {
                tierIds2[66 + i] = 31;
            }
            // Add 1 instances of tier ID 32
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[69 + i] = 32;
            }
            // Add 1 instances of tier ID 33
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[70 + i] = 33;
            }
            // Add 1 instances of tier ID 35
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[71 + i] = 35;
            }
            // Add 4 instances of tier ID 41
            for (uint256 i = 0; i < 4; i++) {
                tierIds2[72 + i] = 41;
            }
            // Add 2 instances of tier ID 42
            for (uint256 i = 0; i < 2; i++) {
                tierIds2[76 + i] = 42;
            }
            // Add 2 instances of tier ID 43
            for (uint256 i = 0; i < 2; i++) {
                tierIds2[78 + i] = 43;
            }
            // Add 1 instances of tier ID 44
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[80 + i] = 44;
            }
            // Add 2 instances of tier ID 48
            for (uint256 i = 0; i < 2; i++) {
                tierIds2[81 + i] = 48;
            }
            // Add 1 instances of tier ID 49
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[83 + i] = 49;
            }
            address[] memory transferOwners2 = _getEthereumTransferOwners2();
            MigrationContractEthereum2 migrationContract2 = new MigrationContractEthereum2(transferOwners2);
            console.log("Ethereum migration contract 2 deployed at:", address(migrationContract2));
            
            // Mint chunk 2 assets to the contract address via pay()
            _mintViaPay(
                terminal,
                hook,
                projectId,
                tierIds2,
                address(migrationContract2)
            );
            console.log("Minted", tierIds2.length, "tokens to contract 2");
            
            migrationContract2.executeMigration(hookAddress, resolverAddress, v4HookAddress, v4ResolverAddress, v4ResolverFallback);
            
        } else 
        if (chainId == 8453 || chainId == 84532) {
            // Base - Batch 2 only
            uint16[] memory tierIds2 = new uint16[](86);
            
            // Add 53 instances of tier ID 4
            for (uint256 i = 0; i < 53; i++) {
                tierIds2[0 + i] = 4;
            }
            // Add 2 instances of tier ID 5
            for (uint256 i = 0; i < 2; i++) {
                tierIds2[53 + i] = 5;
            }
            // Add 4 instances of tier ID 10
            for (uint256 i = 0; i < 4; i++) {
                tierIds2[55 + i] = 10;
            }
            // Add 1 instances of tier ID 13
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[59 + i] = 13;
            }
            // Add 1 instances of tier ID 14
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[60 + i] = 14;
            }
            // Add 3 instances of tier ID 19
            for (uint256 i = 0; i < 3; i++) {
                tierIds2[61 + i] = 19;
            }
            // Add 1 instances of tier ID 20
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[64 + i] = 20;
            }
            // Add 4 instances of tier ID 25
            for (uint256 i = 0; i < 4; i++) {
                tierIds2[65 + i] = 25;
            }
            // Add 1 instances of tier ID 27
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[69 + i] = 27;
            }
            // Add 2 instances of tier ID 28
            for (uint256 i = 0; i < 2; i++) {
                tierIds2[70 + i] = 28;
            }
            // Add 1 instances of tier ID 31
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[72 + i] = 31;
            }
            // Add 1 instances of tier ID 35
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[73 + i] = 35;
            }
            // Add 2 instances of tier ID 38
            for (uint256 i = 0; i < 2; i++) {
                tierIds2[74 + i] = 38;
            }
            // Add 1 instances of tier ID 39
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[76 + i] = 39;
            }
            // Add 1 instances of tier ID 41
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[77 + i] = 41;
            }
            // Add 5 instances of tier ID 43
            for (uint256 i = 0; i < 5; i++) {
                tierIds2[78 + i] = 43;
            }
            // Add 1 instances of tier ID 44
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[83 + i] = 44;
            }
            // Add 1 instances of tier ID 47
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[84 + i] = 47;
            }
            // Add 1 instances of tier ID 48
            for (uint256 i = 0; i < 1; i++) {
                tierIds2[85 + i] = 48;
            }
            address[] memory transferOwners2 = _getBaseTransferOwners2();
            MigrationContractBase2 migrationContract2 = new MigrationContractBase2(transferOwners2);
            console.log("Base migration contract 2 deployed at:", address(migrationContract2));
            
            // Mint chunk 2 assets to the contract address via pay()
            _mintViaPay(
                terminal,
                hook,
                projectId,
                tierIds2,
                address(migrationContract2)
            );
            console.log("Minted", tierIds2.length, "tokens to contract 2");
            
            migrationContract2.executeMigration(hookAddress, resolverAddress, v4HookAddress, v4ResolverAddress, v4ResolverFallback);
            
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
    }function _getEthereumTransferOwners2() internal pure returns (address[] memory) {
        address[] memory transferOwners = new address[](24);
        
        transferOwners[0] = 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79;
        transferOwners[1] = 0xe21A272c4D22eD40678a0168b4acd006bca8A482;
        transferOwners[2] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[3] = 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe;
        transferOwners[4] = 0x7D0068d0D8fC2Aa15d897448B348Fa9B30f6d4c9;
        transferOwners[5] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[6] = 0x898e24EBC9dAf5a9930f10def8B6a373F859C101;
        transferOwners[7] = 0x898e24EBC9dAf5a9930f10def8B6a373F859C101;
        transferOwners[8] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[9] = 0x961d4191965C49537c88F764D88318872CE405bE;
        transferOwners[10] = 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07;
        transferOwners[11] = 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59;
        transferOwners[12] = 0x8b80755C441d355405CA7571443Bb9247B77Ec16;
        transferOwners[13] = 0x8b80755C441d355405CA7571443Bb9247B77Ec16;
        transferOwners[14] = 0xa13d49fCbf79EAF6A0a58cBDD3361422DB4eAfF1;
        transferOwners[15] = 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1;
        transferOwners[16] = 0x0447AD1BdC0fFA06f7029c8E63F4De21E65255d2;
        transferOwners[17] = 0x5706d5aD7A68bf8692bD341234bE44ca7Bf2f654;
        transferOwners[18] = 0x679d87D8640e66778c3419D164998E720D7495f6;
        transferOwners[19] = 0x817738DC393d682Ca5fBb268707b99F2aAe96baE;
        transferOwners[20] = 0x4A290F18c35bBFE97B2557cf765De9387726dE39;
        transferOwners[21] = 0x25171bD3cD3231c3057c96F38E32E3bA6681497a;
        transferOwners[22] = 0xa7226e53F3100C093A0a5BCb6E3D0976EB3db1D6;
        transferOwners[23] = 0x76A6D08b82034b397E7e09dAe4377C18F132BbB8;
        return transferOwners;
    }
    function _getBaseTransferOwners2() internal pure returns (address[] memory) {
        address[] memory transferOwners = new address[](36);
        
        transferOwners[0] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[1] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[2] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[3] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[4] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[5] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[6] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[7] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[8] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[9] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[10] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[11] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[12] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[13] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[14] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[15] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[16] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[17] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[18] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[19] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[20] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[21] = 0x67BcBE602e870e2286C19E4E0044E583967c9665;
        transferOwners[22] = 0x18deEE9699526f8C8a87004b2e4e55029Fb26b9a;
        transferOwners[23] = 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3;
        transferOwners[24] = 0xAcD59e854adf632d2322404198624F757C868C97;
        transferOwners[25] = 0xAcD59e854adf632d2322404198624F757C868C97;
        transferOwners[26] = 0xa13d49fCbf79EAF6A0a58cBDD3361422DB4eAfF1;
        transferOwners[27] = 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb;
        transferOwners[28] = 0xbeC26FFa12c90217943D1b2958f60A821aE6E549;
        transferOwners[29] = 0x8Ec174c5d86469D1A74094E10485357eBFe2e08e;
        transferOwners[30] = 0xC5704f77f94087CC644d361A5A57295851d242aB;
        transferOwners[31] = 0x99Fa48ccEa8a38CDE6B437450fF9bBdDAFAA4Fc8;
        transferOwners[32] = 0xb6ECb51e3638Eb7aa0C6289ef058DCa27494Acb2;
        transferOwners[33] = 0x57700212B1cB7b67bD7DF3801DA43CA634513fE0;
        transferOwners[34] = 0x57700212B1cB7b67bD7DF3801DA43CA634513fE0;
        transferOwners[35] = 0x9342E2aC6dd4A907948E91E80D2734ecAC1D70eC;
        return transferOwners;
    }
    
}