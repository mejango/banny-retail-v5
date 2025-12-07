// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {MigrationContractEthereum5} from "./MigrationContractEthereum5.sol";
import {MigrationContractBase5} from "./MigrationContractBase5.sol";

import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Sphinx} from "@sphinx-labs/contracts/SphinxPlugin.sol";
import {IJBTerminal} from "@bananapus/core-v5/src/interfaces/IJBTerminal.sol";
import {JBConstants} from "@bananapus/core-v5/src/libraries/JBConstants.sol";
import {JBMetadataResolver} from "@bananapus/core-v5/src/libraries/JBMetadataResolver.sol";

contract AirdropOutfitsBatch5Script is Script, Sphinx {
    // Maximum tier IDs per batch to avoid metadata size limit (255 words max)
    // Each tier ID takes 1 word, plus overhead for array length, boolean, and metadata structure
    // Using 100 as a safe batch size to stay well under the limit
    uint256 private constant BATCH_SIZE = 100;
    
    function configureSphinx() public override {
        sphinxConfig.projectName = "banny-core";
        sphinxConfig.mainnets = ["ethereum", "optimism", "base", "arbitrum"];
        sphinxConfig.testnets = [];
    }

    function run() public sphinx {
        uint256 chainId = block.chainid;
        
        if (chainId == 1) {
            // Ethereum Mainnet
            _runEthereum();
        } else if (chainId == 8453) {
            // Base
            _runBase();
        } else {
            revert("Unsupported chain for batch 5");
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
            // Ethereum - Batch 5 only
            uint16[] memory tierIds5 = new uint16[](44);
            
            // Add 20 instances of tier ID 4
            for (uint256 i = 0; i < 20; i++) {
                tierIds5[0 + i] = 4;
            }
            // Add 1 instances of tier ID 5
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[20 + i] = 5;
            }
            // Add 1 instances of tier ID 6
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[21 + i] = 6;
            }
            // Add 1 instances of tier ID 10
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[22 + i] = 10;
            }
            // Add 1 instances of tier ID 13
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[23 + i] = 13;
            }
            // Add 2 instances of tier ID 15
            for (uint256 i = 0; i < 2; i++) {
                tierIds5[24 + i] = 15;
            }
            // Add 1 instances of tier ID 18
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[26 + i] = 18;
            }
            // Add 3 instances of tier ID 19
            for (uint256 i = 0; i < 3; i++) {
                tierIds5[27 + i] = 19;
            }
            // Add 1 instances of tier ID 20
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[30 + i] = 20;
            }
            // Add 1 instances of tier ID 23
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[31 + i] = 23;
            }
            // Add 1 instances of tier ID 26
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[32 + i] = 26;
            }
            // Add 1 instances of tier ID 28
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[33 + i] = 28;
            }
            // Add 1 instances of tier ID 31
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[34 + i] = 31;
            }
            // Add 1 instances of tier ID 35
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[35 + i] = 35;
            }
            // Add 1 instances of tier ID 38
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[36 + i] = 38;
            }
            // Add 1 instances of tier ID 39
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[37 + i] = 39;
            }
            // Add 1 instances of tier ID 40
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[38 + i] = 40;
            }
            // Add 2 instances of tier ID 44
            for (uint256 i = 0; i < 2; i++) {
                tierIds5[39 + i] = 44;
            }
            // Add 1 instances of tier ID 47
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[41 + i] = 47;
            }
            // Add 1 instances of tier ID 48
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[42 + i] = 48;
            }
            // Add 1 instances of tier ID 49
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[43 + i] = 49;
            }
            address[] memory transferOwners5 = _getEthereumTransferOwners5();
            MigrationContractEthereum5 migrationContract5 = new MigrationContractEthereum5(transferOwners5);
            console.log("Ethereum migration contract 5 deployed at:", address(migrationContract5));
            
            // Mint chunk 5 assets to the contract address via pay()
            _mintViaPay(
                terminal,
                hook,
                projectId,
                tierIds5,
                address(migrationContract5)
            );
            console.log("Minted", tierIds5.length, "tokens to contract 5");
            
            migrationContract5.executeMigration(hookAddress, resolverAddress, v4HookAddress, v4ResolverAddress, v4ResolverFallback);
            
        } else 
        if (chainId == 8453) {
            // Base - Batch 5 only
            uint16[] memory tierIds5 = new uint16[](53);
            
            // Add 2 instances of tier ID 5
            for (uint256 i = 0; i < 2; i++) {
                tierIds5[0 + i] = 5;
            }
            // Add 1 instances of tier ID 6
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[2 + i] = 6;
            }
            // Add 1 instances of tier ID 7
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[3 + i] = 7;
            }
            // Add 6 instances of tier ID 10
            for (uint256 i = 0; i < 6; i++) {
                tierIds5[4 + i] = 10;
            }
            // Add 2 instances of tier ID 11
            for (uint256 i = 0; i < 2; i++) {
                tierIds5[10 + i] = 11;
            }
            // Add 1 instances of tier ID 13
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[12 + i] = 13;
            }
            // Add 1 instances of tier ID 14
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[13 + i] = 14;
            }
            // Add 1 instances of tier ID 17
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[14 + i] = 17;
            }
            // Add 5 instances of tier ID 19
            for (uint256 i = 0; i < 5; i++) {
                tierIds5[15 + i] = 19;
            }
            // Add 1 instances of tier ID 24
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[20 + i] = 24;
            }
            // Add 1 instances of tier ID 25
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[21 + i] = 25;
            }
            // Add 4 instances of tier ID 28
            for (uint256 i = 0; i < 4; i++) {
                tierIds5[22 + i] = 28;
            }
            // Add 4 instances of tier ID 31
            for (uint256 i = 0; i < 4; i++) {
                tierIds5[26 + i] = 31;
            }
            // Add 1 instances of tier ID 32
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[30 + i] = 32;
            }
            // Add 1 instances of tier ID 34
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[31 + i] = 34;
            }
            // Add 3 instances of tier ID 35
            for (uint256 i = 0; i < 3; i++) {
                tierIds5[32 + i] = 35;
            }
            // Add 1 instances of tier ID 38
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[35 + i] = 38;
            }
            // Add 1 instances of tier ID 39
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[36 + i] = 39;
            }
            // Add 2 instances of tier ID 40
            for (uint256 i = 0; i < 2; i++) {
                tierIds5[37 + i] = 40;
            }
            // Add 1 instances of tier ID 41
            for (uint256 i = 0; i < 1; i++) {
                tierIds5[39 + i] = 41;
            }
            // Add 2 instances of tier ID 42
            for (uint256 i = 0; i < 2; i++) {
                tierIds5[40 + i] = 42;
            }
            // Add 2 instances of tier ID 43
            for (uint256 i = 0; i < 2; i++) {
                tierIds5[42 + i] = 43;
            }
            // Add 2 instances of tier ID 44
            for (uint256 i = 0; i < 2; i++) {
                tierIds5[44 + i] = 44;
            }
            // Add 5 instances of tier ID 47
            for (uint256 i = 0; i < 5; i++) {
                tierIds5[46 + i] = 47;
            }
            // Add 2 instances of tier ID 49
            for (uint256 i = 0; i < 2; i++) {
                tierIds5[51 + i] = 49;
            }
            address[] memory transferOwners5 = _getBaseTransferOwners5();
            MigrationContractBase5 migrationContract5 = new MigrationContractBase5(transferOwners5);
            console.log("Base migration contract 5 deployed at:", address(migrationContract5));
            
            // Mint chunk 5 assets to the contract address via pay()
            _mintViaPay(
                terminal,
                hook,
                projectId,
                tierIds5,
                address(migrationContract5)
            );
            console.log("Minted", tierIds5.length, "tokens to contract 5");
            
            migrationContract5.executeMigration(hookAddress, resolverAddress, v4HookAddress, v4ResolverAddress, v4ResolverFallback);
            
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
    }function _getEthereumTransferOwners5() internal pure returns (address[] memory) {
        address[] memory transferOwners = new address[](20);
        
        transferOwners[0] = 0xf32dd1Bd55bD14d929218499a2E7D106F72f79c7;
        transferOwners[1] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[2] = 0xe21A272c4D22eD40678a0168b4acd006bca8A482;
        transferOwners[3] = 0xe21A272c4D22eD40678a0168b4acd006bca8A482;
        transferOwners[4] = 0x80581C6e88Ce00095F85cdf24bB760f16d6eC0D6;
        transferOwners[5] = 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2;
        transferOwners[6] = 0x30670D81E487c80b9EDc54370e6EaF943B6EAB39;
        transferOwners[7] = 0x60535A6605958fFf6cEC5B1e92892601EFb3473b;
        transferOwners[8] = 0x34724D71cE674FcD4d06e60Dd1BaA88c14D36b75;
        transferOwners[9] = 0xA99c384f43e72B65BB51fE33b85CE12A32C09526;
        transferOwners[10] = 0x898e24EBC9dAf5a9930f10def8B6a373F859C101;
        transferOwners[11] = 0x898e24EBC9dAf5a9930f10def8B6a373F859C101;
        transferOwners[12] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[13] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[14] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[15] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[16] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[17] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[18] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[19] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        return transferOwners;
    }
    function _getBaseTransferOwners5() internal pure returns (address[] memory) {
        address[] memory transferOwners = new address[](53);
        
        transferOwners[0] = 0x8b80755C441d355405CA7571443Bb9247B77Ec16;
        transferOwners[1] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[2] = 0x328809A567b87b6123462c3062e8438BBB75c1c5;
        transferOwners[3] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[4] = 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3;
        transferOwners[5] = 0x328809A567b87b6123462c3062e8438BBB75c1c5;
        transferOwners[6] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[7] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[8] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[9] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[10] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[11] = 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F;
        transferOwners[12] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[13] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[14] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[15] = 0x18deEE9699526f8C8a87004b2e4e55029Fb26b9a;
        transferOwners[16] = 0xbeC26FFa12c90217943D1b2958f60A821aE6E549;
        transferOwners[17] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[18] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[19] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[20] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[21] = 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3;
        transferOwners[22] = 0x18deEE9699526f8C8a87004b2e4e55029Fb26b9a;
        transferOwners[23] = 0x328809A567b87b6123462c3062e8438BBB75c1c5;
        transferOwners[24] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[25] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[26] = 0x99Fa48ccEa8a38CDE6B437450fF9bBdDAFAA4Fc8;
        transferOwners[27] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[28] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[29] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[30] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[31] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[32] = 0x565B93a15d38aCD79c120b15432D21E21eD274d6;
        transferOwners[33] = 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F;
        transferOwners[34] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[35] = 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F;
        transferOwners[36] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[37] = 0x8DFBdEEC8c5d4970BB5F481C6ec7f73fa1C65be5;
        transferOwners[38] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[39] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[40] = 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb;
        transferOwners[41] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[42] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[43] = 0x328809A567b87b6123462c3062e8438BBB75c1c5;
        transferOwners[44] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[45] = 0xbeC26FFa12c90217943D1b2958f60A821aE6E549;
        transferOwners[46] = 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3;
        transferOwners[47] = 0x99Fa48ccEa8a38CDE6B437450fF9bBdDAFAA4Fc8;
        transferOwners[48] = 0x8b80755C441d355405CA7571443Bb9247B77Ec16;
        transferOwners[49] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[50] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[51] = 0x8b80755C441d355405CA7571443Bb9247B77Ec16;
        transferOwners[52] = 0x8b80755C441d355405CA7571443Bb9247B77Ec16;
        return transferOwners;
    }
    
}