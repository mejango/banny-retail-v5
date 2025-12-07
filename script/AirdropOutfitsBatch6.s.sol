// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {MigrationContractEthereum6} from "./MigrationContractEthereum6.sol";

import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Sphinx} from "@sphinx-labs/contracts/SphinxPlugin.sol";
import {IJBTerminal} from "@bananapus/core-v5/src/interfaces/IJBTerminal.sol";
import {JBConstants} from "@bananapus/core-v5/src/libraries/JBConstants.sol";
import {JBMetadataResolver} from "@bananapus/core-v5/src/libraries/JBMetadataResolver.sol";

contract AirdropOutfitsBatch6Script is Script, Sphinx {
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
        } else {
            revert("Unsupported chain for batch 6");
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
            // Ethereum - Batch 6 only
            uint16[] memory tierIds6 = new uint16[](280);
            
            // Add 2 instances of tier ID 5
            for (uint256 i = 0; i < 2; i++) {
                tierIds6[0 + i] = 5;
            }
            // Add 5 instances of tier ID 6
            for (uint256 i = 0; i < 5; i++) {
                tierIds6[2 + i] = 6;
            }
            // Add 7 instances of tier ID 10
            for (uint256 i = 0; i < 7; i++) {
                tierIds6[7 + i] = 10;
            }
            // Add 1 instances of tier ID 11
            for (uint256 i = 0; i < 1; i++) {
                tierIds6[14 + i] = 11;
            }
            // Add 2 instances of tier ID 13
            for (uint256 i = 0; i < 2; i++) {
                tierIds6[15 + i] = 13;
            }
            // Add 3 instances of tier ID 14
            for (uint256 i = 0; i < 3; i++) {
                tierIds6[17 + i] = 14;
            }
            // Add 3 instances of tier ID 17
            for (uint256 i = 0; i < 3; i++) {
                tierIds6[20 + i] = 17;
            }
            // Add 7 instances of tier ID 19
            for (uint256 i = 0; i < 7; i++) {
                tierIds6[23 + i] = 19;
            }
            // Add 6 instances of tier ID 20
            for (uint256 i = 0; i < 6; i++) {
                tierIds6[30 + i] = 20;
            }
            // Add 1 instances of tier ID 21
            for (uint256 i = 0; i < 1; i++) {
                tierIds6[36 + i] = 21;
            }
            // Add 2 instances of tier ID 23
            for (uint256 i = 0; i < 2; i++) {
                tierIds6[37 + i] = 23;
            }
            // Add 3 instances of tier ID 25
            for (uint256 i = 0; i < 3; i++) {
                tierIds6[39 + i] = 25;
            }
            // Add 2 instances of tier ID 26
            for (uint256 i = 0; i < 2; i++) {
                tierIds6[42 + i] = 26;
            }
            // Add 7 instances of tier ID 28
            for (uint256 i = 0; i < 7; i++) {
                tierIds6[44 + i] = 28;
            }
            // Add 1 instances of tier ID 29
            for (uint256 i = 0; i < 1; i++) {
                tierIds6[51 + i] = 29;
            }
            // Add 5 instances of tier ID 31
            for (uint256 i = 0; i < 5; i++) {
                tierIds6[52 + i] = 31;
            }
            // Add 2 instances of tier ID 32
            for (uint256 i = 0; i < 2; i++) {
                tierIds6[57 + i] = 32;
            }
            // Add 1 instances of tier ID 33
            for (uint256 i = 0; i < 1; i++) {
                tierIds6[59 + i] = 33;
            }
            // Add 3 instances of tier ID 35
            for (uint256 i = 0; i < 3; i++) {
                tierIds6[60 + i] = 35;
            }
            // Add 2 instances of tier ID 37
            for (uint256 i = 0; i < 2; i++) {
                tierIds6[63 + i] = 37;
            }
            // Add 1 instances of tier ID 39
            for (uint256 i = 0; i < 1; i++) {
                tierIds6[65 + i] = 39;
            }
            // Add 2 instances of tier ID 40
            for (uint256 i = 0; i < 2; i++) {
                tierIds6[66 + i] = 40;
            }
            // Add 1 instances of tier ID 41
            for (uint256 i = 0; i < 1; i++) {
                tierIds6[68 + i] = 41;
            }
            // Add 16 instances of tier ID 42
            for (uint256 i = 0; i < 16; i++) {
                tierIds6[69 + i] = 42;
            }
            // Add 11 instances of tier ID 43
            for (uint256 i = 0; i < 11; i++) {
                tierIds6[85 + i] = 43;
            }
            // Add 29 instances of tier ID 44
            for (uint256 i = 0; i < 29; i++) {
                tierIds6[96 + i] = 44;
            }
            // Add 12 instances of tier ID 47
            for (uint256 i = 0; i < 12; i++) {
                tierIds6[125 + i] = 47;
            }
            // Add 1 instances of tier ID 48
            for (uint256 i = 0; i < 1; i++) {
                tierIds6[137 + i] = 48;
            }
            // Add 142 instances of tier ID 49
            for (uint256 i = 0; i < 142; i++) {
                tierIds6[138 + i] = 49;
            }
            address[] memory transferOwners6 = _getEthereumTransferOwners6();
            MigrationContractEthereum6 migrationContract6 = new MigrationContractEthereum6(transferOwners6);
            console.log("Ethereum migration contract 6 deployed at:", address(migrationContract6));
            
            // Mint chunk 6 assets to the contract address via pay()
            _mintViaPay(
                terminal,
                hook,
                projectId,
                tierIds6,
                address(migrationContract6)
            );
            console.log("Minted", tierIds6.length, "tokens to contract 6");
            
            migrationContract6.executeMigration(hookAddress, resolverAddress, v4HookAddress, v4ResolverAddress, v4ResolverFallback);
            
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
    }function _getEthereumTransferOwners6() internal pure returns (address[] memory) {
        address[] memory transferOwners = new address[](280);
        
        transferOwners[0] = 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79;
        transferOwners[1] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[2] = 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf;
        transferOwners[3] = 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79;
        transferOwners[4] = 0x15b61e9b0637f45dc0858f083cd240267924125d;
        transferOwners[5] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[6] = 0xe21A272c4D22eD40678a0168b4acd006bca8A482;
        transferOwners[7] = 0x4A290F18c35bBFE97B2557cf765De9387726dE39;
        transferOwners[8] = 0xf0FE43a75Ff248FD2E75D33fa1ebde71c6d1abAd;
        transferOwners[9] = 0x7044d88283c8FFF0679b711C0cd81f1a6754C843;
        transferOwners[10] = 0xe21A272c4D22eD40678a0168b4acd006bca8A482;
        transferOwners[11] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[12] = 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2;
        transferOwners[13] = 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2;
        transferOwners[14] = 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79;
        transferOwners[15] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[16] = 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2;
        transferOwners[17] = 0x87084347AeBADc626e8569E0D386928dade2ba09;
        transferOwners[18] = 0x15b61e9b0637f45dc0858f083cd240267924125d;
        transferOwners[19] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[20] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[21] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[22] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[23] = 0x0447AD1BdC0fFA06f7029c8E63F4De21E65255d2;
        transferOwners[24] = 0x516cAfD745Ec780D20f61c0d71fe258eA765222D;
        transferOwners[25] = 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf;
        transferOwners[26] = 0x87084347AeBADc626e8569E0D386928dade2ba09;
        transferOwners[27] = 0x08cF1208e638a5A3623be58d600e35c6199baa9C;
        transferOwners[28] = 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2;
        transferOwners[29] = 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2;
        transferOwners[30] = 0x289715fFBB2f4b482e2917D2f183FeAb564ec84F;
        transferOwners[31] = 0x79d1E7F1A6E0Bbb3278a9d2B782e3A8983444cb6;
        transferOwners[32] = 0x15b61e9b0637f45dc0858f083cd240267924125d;
        transferOwners[33] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[34] = 0xe21A272c4D22eD40678a0168b4acd006bca8A482;
        transferOwners[35] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[36] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[37] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[38] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[39] = 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1;
        transferOwners[40] = 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf;
        transferOwners[41] = 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2;
        transferOwners[42] = 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2;
        transferOwners[43] = 0x1c6d61F3d8976A8aCDd311ecdFa533B8ECd0AC61;
        transferOwners[44] = 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07;
        transferOwners[45] = 0x0447AD1BdC0fFA06f7029c8E63F4De21E65255d2;
        transferOwners[46] = 0x87084347AeBADc626e8569E0D386928dade2ba09;
        transferOwners[47] = 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e;
        transferOwners[48] = 0x08cF1208e638a5A3623be58d600e35c6199baa9C;
        transferOwners[49] = 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2;
        transferOwners[50] = 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2;
        transferOwners[51] = 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79;
        transferOwners[52] = 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59;
        transferOwners[53] = 0xf0FE43a75Ff248FD2E75D33fa1ebde71c6d1abAd;
        transferOwners[54] = 0x08cEb8Bba685ee708C9c4c65576837cbE19B9dea;
        transferOwners[55] = 0x08cF1208e638a5A3623be58d600e35c6199baa9C;
        transferOwners[56] = 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2;
        transferOwners[57] = 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe;
        transferOwners[58] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[59] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[60] = 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf;
        transferOwners[61] = 0x15b61e9b0637f45dc0858f083cd240267924125d;
        transferOwners[62] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[63] = 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79;
        transferOwners[64] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[65] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[66] = 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2;
        transferOwners[67] = 0x1c6d61F3d8976A8aCDd311ecdFa533B8ECd0AC61;
        transferOwners[68] = 0x1c6d61F3d8976A8aCDd311ecdFa533B8ECd0AC61;
        transferOwners[69] = 0x961d4191965C49537c88F764D88318872CE405bE;
        transferOwners[70] = 0xf0FE43a75Ff248FD2E75D33fa1ebde71c6d1abAd;
        transferOwners[71] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[72] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[73] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[74] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[75] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[76] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[77] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[78] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[79] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[80] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[81] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[82] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[83] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[84] = 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2;
        transferOwners[85] = 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07;
        transferOwners[86] = 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1;
        transferOwners[87] = 0x1786D033D5CbCC235B673e872c7613c2F83DA583;
        transferOwners[88] = 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79;
        transferOwners[89] = 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2;
        transferOwners[90] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[91] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[92] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[93] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[94] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[95] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[96] = 0x4A290F18c35bBFE97B2557cf765De9387726dE39;
        transferOwners[97] = 0x38EED3CCeED88f380E436eb21811250797c453C5;
        transferOwners[98] = 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf;
        transferOwners[99] = 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe;
        transferOwners[100] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[101] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[102] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[103] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[104] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[105] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[106] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[107] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[108] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[109] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[110] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[111] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[112] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[113] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[114] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[115] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[116] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[117] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[118] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[119] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[120] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[121] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[122] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[123] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[124] = 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2;
        transferOwners[125] = 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59;
        transferOwners[126] = 0x0447AD1BdC0fFA06f7029c8E63F4De21E65255d2;
        transferOwners[127] = 0x08cF1208e638a5A3623be58d600e35c6199baa9C;
        transferOwners[128] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[129] = 0xe21A272c4D22eD40678a0168b4acd006bca8A482;
        transferOwners[130] = 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe;
        transferOwners[131] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[132] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[133] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[134] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[135] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[136] = 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2;
        transferOwners[137] = 0x15b61e9b0637f45dc0858f083cd240267924125d;
        transferOwners[138] = 0x08cF1208e638a5A3623be58d600e35c6199baa9C;
        transferOwners[139] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[140] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[141] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[142] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[143] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[144] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[145] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[146] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[147] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[148] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[149] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[150] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[151] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[152] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[153] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[154] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[155] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[156] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[157] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[158] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[159] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[160] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[161] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[162] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[163] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[164] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[165] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[166] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[167] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[168] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[169] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[170] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[171] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[172] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[173] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[174] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[175] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[176] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[177] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[178] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[179] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[180] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[181] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[182] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[183] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[184] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[185] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[186] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[187] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[188] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[189] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[190] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[191] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[192] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[193] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[194] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[195] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[196] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[197] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[198] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[199] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[200] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[201] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[202] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[203] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[204] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[205] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[206] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[207] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[208] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[209] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[210] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[211] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[212] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[213] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[214] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[215] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[216] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[217] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[218] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[219] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[220] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[221] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[222] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[223] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[224] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[225] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[226] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[227] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[228] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[229] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[230] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[231] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[232] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[233] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[234] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[235] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[236] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[237] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[238] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[239] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[240] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[241] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[242] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[243] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[244] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[245] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[246] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[247] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[248] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[249] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[250] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[251] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[252] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[253] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[254] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[255] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[256] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[257] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[258] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[259] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[260] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[261] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[262] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[263] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[264] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[265] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[266] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[267] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[268] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[269] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[270] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[271] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[272] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[273] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[274] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[275] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[276] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[277] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[278] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[279] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        return transferOwners;
    }
    
}