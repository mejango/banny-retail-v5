// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {MigrationContractEthereum1} from "./MigrationContractEthereum1.sol";
import {MigrationContractEthereum2} from "./MigrationContractEthereum2.sol";
import {MigrationContractEthereum3} from "./MigrationContractEthereum3.sol";
import {MigrationContractOptimism} from "./MigrationContractOptimism.sol";
import {MigrationContractBase1} from "./MigrationContractBase1.sol";
import {MigrationContractBase2} from "./MigrationContractBase2.sol";
import {MigrationContractArbitrum} from "./MigrationContractArbitrum.sol";

import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {IJB721TiersHookStore} from "@bananapus/721-hook-v5/src/interfaces/IJB721TiersHookStore.sol";
import {Sphinx} from "@sphinx-labs/contracts/SphinxPlugin.sol";
import {IJBTerminal} from "@bananapus/core-v5/src/interfaces/IJBTerminal.sol";
import {JBConstants} from "@bananapus/core-v5/src/libraries/JBConstants.sol";
import {JBMetadataResolver} from "@bananapus/core-v5/src/libraries/JBMetadataResolver.sol";
import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";

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
    
    function _runOptimism() internal {
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
            10
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
    
    function _runArbitrum() internal {
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
            42161
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
    
    function _runOptimismSepolia() internal {
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
            11155420
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
    
    function _runArbitrumSepolia() internal {
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
            // Ethereum - 3 chunks
            
            // Deploy and execute contract 1
            uint16[] memory tierIds1 = new uint16[](96);
            
            // Add 1 instances of tier ID 1
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[0 + i] = 1;
            }
            // Add 6 instances of tier ID 2
            for (uint256 i = 0; i < 6; i++) {
                tierIds1[1 + i] = 2;
            }
            // Add 26 instances of tier ID 3
            for (uint256 i = 0; i < 26; i++) {
                tierIds1[7 + i] = 3;
            }
            // Add 7 instances of tier ID 4
            for (uint256 i = 0; i < 7; i++) {
                tierIds1[33 + i] = 4;
            }
            // Add 4 instances of tier ID 5
            for (uint256 i = 0; i < 4; i++) {
                tierIds1[40 + i] = 5;
            }
            // Add 5 instances of tier ID 6
            for (uint256 i = 0; i < 5; i++) {
                tierIds1[44 + i] = 6;
            }
            // Add 2 instances of tier ID 7
            for (uint256 i = 0; i < 2; i++) {
                tierIds1[49 + i] = 7;
            }
            // Add 1 instances of tier ID 10
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[51 + i] = 10;
            }
            // Add 3 instances of tier ID 14
            for (uint256 i = 0; i < 3; i++) {
                tierIds1[52 + i] = 14;
            }
            // Add 1 instances of tier ID 15
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[55 + i] = 15;
            }
            // Add 1 instances of tier ID 17
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[56 + i] = 17;
            }
            // Add 1 instances of tier ID 18
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[57 + i] = 18;
            }
            // Add 4 instances of tier ID 19
            for (uint256 i = 0; i < 4; i++) {
                tierIds1[58 + i] = 19;
            }
            // Add 1 instances of tier ID 21
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[62 + i] = 21;
            }
            // Add 1 instances of tier ID 23
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[63 + i] = 23;
            }
            // Add 3 instances of tier ID 25
            for (uint256 i = 0; i < 3; i++) {
                tierIds1[64 + i] = 25;
            }
            // Add 3 instances of tier ID 26
            for (uint256 i = 0; i < 3; i++) {
                tierIds1[67 + i] = 26;
            }
            // Add 1 instances of tier ID 28
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[70 + i] = 28;
            }
            // Add 1 instances of tier ID 29
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[71 + i] = 29;
            }
            // Add 2 instances of tier ID 31
            for (uint256 i = 0; i < 2; i++) {
                tierIds1[72 + i] = 31;
            }
            // Add 2 instances of tier ID 32
            for (uint256 i = 0; i < 2; i++) {
                tierIds1[74 + i] = 32;
            }
            // Add 4 instances of tier ID 35
            for (uint256 i = 0; i < 4; i++) {
                tierIds1[76 + i] = 35;
            }
            // Add 2 instances of tier ID 37
            for (uint256 i = 0; i < 2; i++) {
                tierIds1[80 + i] = 37;
            }
            // Add 1 instances of tier ID 38
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[82 + i] = 38;
            }
            // Add 2 instances of tier ID 39
            for (uint256 i = 0; i < 2; i++) {
                tierIds1[83 + i] = 39;
            }
            // Add 1 instances of tier ID 42
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[85 + i] = 42;
            }
            // Add 3 instances of tier ID 43
            for (uint256 i = 0; i < 3; i++) {
                tierIds1[86 + i] = 43;
            }
            // Add 2 instances of tier ID 44
            for (uint256 i = 0; i < 2; i++) {
                tierIds1[89 + i] = 44;
            }
            // Add 1 instances of tier ID 46
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[91 + i] = 46;
            }
            // Add 1 instances of tier ID 47
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[92 + i] = 47;
            }
            // Add 2 instances of tier ID 48
            for (uint256 i = 0; i < 2; i++) {
                tierIds1[93 + i] = 48;
            }
            // Add 1 instances of tier ID 49
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[95 + i] = 49;
            }
            address[] memory transferOwners1 = _getEthereumTransferOwners1();
            MigrationContractEthereum1 migrationContract1 = new MigrationContractEthereum1(transferOwners1);
            console.log("Ethereum migration contract 1 deployed at:", address(migrationContract1));
            
            // Mint chunk 1 assets to the contract address via pay()
            _mintViaPay(
                terminal,
                hook,
                projectId,
                tierIds1,
                address(migrationContract1)
            );
            console.log("Minted", tierIds1.length, "tokens to contract 1");
            
            migrationContract1.executeMigration(hookAddress, resolverAddress, v4HookAddress, v4ResolverAddress, v4ResolverFallback);
            
            // Deploy and execute contract 2
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
            
            // Deploy and execute contract 3
            uint16[] memory tierIds3 = new uint16[](75);
            
            // Add 38 instances of tier ID 4
            for (uint256 i = 0; i < 38; i++) {
                tierIds3[0 + i] = 4;
            }
            // Add 1 instances of tier ID 5
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[38 + i] = 5;
            }
            // Add 2 instances of tier ID 6
            for (uint256 i = 0; i < 2; i++) {
                tierIds3[39 + i] = 6;
            }
            // Add 1 instances of tier ID 10
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[41 + i] = 10;
            }
            // Add 1 instances of tier ID 13
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[42 + i] = 13;
            }
            // Add 3 instances of tier ID 15
            for (uint256 i = 0; i < 3; i++) {
                tierIds3[43 + i] = 15;
            }
            // Add 1 instances of tier ID 18
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[46 + i] = 18;
            }
            // Add 6 instances of tier ID 19
            for (uint256 i = 0; i < 6; i++) {
                tierIds3[47 + i] = 19;
            }
            // Add 1 instances of tier ID 20
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[53 + i] = 20;
            }
            // Add 1 instances of tier ID 23
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[54 + i] = 23;
            }
            // Add 2 instances of tier ID 25
            for (uint256 i = 0; i < 2; i++) {
                tierIds3[55 + i] = 25;
            }
            // Add 1 instances of tier ID 26
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[57 + i] = 26;
            }
            // Add 1 instances of tier ID 28
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[58 + i] = 28;
            }
            // Add 1 instances of tier ID 29
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[59 + i] = 29;
            }
            // Add 3 instances of tier ID 31
            for (uint256 i = 0; i < 3; i++) {
                tierIds3[60 + i] = 31;
            }
            // Add 1 instances of tier ID 35
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[63 + i] = 35;
            }
            // Add 2 instances of tier ID 38
            for (uint256 i = 0; i < 2; i++) {
                tierIds3[64 + i] = 38;
            }
            // Add 1 instances of tier ID 39
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[66 + i] = 39;
            }
            // Add 1 instances of tier ID 40
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[67 + i] = 40;
            }
            // Add 2 instances of tier ID 43
            for (uint256 i = 0; i < 2; i++) {
                tierIds3[68 + i] = 43;
            }
            // Add 2 instances of tier ID 44
            for (uint256 i = 0; i < 2; i++) {
                tierIds3[70 + i] = 44;
            }
            // Add 1 instances of tier ID 47
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[72 + i] = 47;
            }
            // Add 1 instances of tier ID 48
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[73 + i] = 48;
            }
            // Add 1 instances of tier ID 49
            for (uint256 i = 0; i < 1; i++) {
                tierIds3[74 + i] = 49;
            }
            address[] memory transferOwners3 = _getEthereumTransferOwners3();
            MigrationContractEthereum3 migrationContract3 = new MigrationContractEthereum3(transferOwners3);
            console.log("Ethereum migration contract 3 deployed at:", address(migrationContract3));
            
            // Mint chunk 3 assets to the contract address via pay()
            _mintViaPay(
                terminal,
                hook,
                projectId,
                tierIds3,
                address(migrationContract3)
            );
            console.log("Minted", tierIds3.length, "tokens to contract 3");
            
            migrationContract3.executeMigration(hookAddress, resolverAddress, v4HookAddress, v4ResolverAddress, v4ResolverFallback);
            
            // Sanity checks after all Ethereum migrations
            address[] memory ethereumMigrationContracts = new address[](3);
            ethereumMigrationContracts[0] = address(migrationContract1);
            ethereumMigrationContracts[1] = address(migrationContract2);
            ethereumMigrationContracts[2] = address(migrationContract3);
            
            // Combine all owners and tier IDs for verification
            address[] memory allEthereumOwners = new address[](tierIds1.length + tierIds2.length + tierIds3.length);
            uint16[] memory allEthereumTierIds = new uint16[](tierIds1.length + tierIds2.length + tierIds3.length);
            
            // Copy owners and tier IDs from chunk 1
            address[] memory owners1 = _getEthereumTransferOwners1();
            for (uint256 i = 0; i < owners1.length; i++) {
                allEthereumOwners[i] = owners1[i];
            }
            for (uint256 i = 0; i < tierIds1.length; i++) {
                allEthereumTierIds[i] = tierIds1[i];
            }
            
            // Copy owners and tier IDs from chunk 2
            address[] memory owners2 = _getEthereumTransferOwners2();
            for (uint256 i = 0; i < owners2.length; i++) {
                allEthereumOwners[owners1.length + i] = owners2[i];
            }
            for (uint256 i = 0; i < tierIds2.length; i++) {
                allEthereumTierIds[tierIds1.length + i] = tierIds2[i];
            }
            
            // Copy owners and tier IDs from chunk 3
            address[] memory owners3 = _getEthereumTransferOwners3();
            for (uint256 i = 0; i < owners3.length; i++) {
                allEthereumOwners[owners1.length + owners2.length + i] = owners3[i];
            }
            for (uint256 i = 0; i < tierIds3.length; i++) {
                allEthereumTierIds[tierIds1.length + tierIds2.length + i] = tierIds3[i];
            }
            
            _verifyTierBalancesMatch(hookAddress, v4HookAddress, allEthereumOwners, allEthereumTierIds);
            _verifyMigrationContractsEmpty(hookAddress, ethereumMigrationContracts);
            
        } else if (chainId == 10) {
            // Optimism tier IDs
            uint16[] memory allTierIds = new uint16[](11);
            
            // Add 2 instances of tier ID 3
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[0 + i] = 3;
            }
            // Add 3 instances of tier ID 4
            for (uint256 i = 0; i < 3; i++) {
                allTierIds[2 + i] = 4;
            }
            // Add 1 instances of tier ID 11
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[5 + i] = 11;
            }
            // Add 1 instances of tier ID 17
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[6 + i] = 17;
            }
            // Add 1 instances of tier ID 19
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[7 + i] = 19;
            }
            // Add 1 instances of tier ID 25
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[8 + i] = 25;
            }
            // Add 1 instances of tier ID 44
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[9 + i] = 44;
            }
            // Add 1 instances of tier ID 47
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[10 + i] = 47;
            }
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
            
            // Sanity checks after Optimism migration
            address[] memory optimismMigrationContracts = new address[](1);
            optimismMigrationContracts[0] = address(migrationContract);
            
            address[] memory optimismOwners = _getOptimismTransferOwners();
            _verifyTierBalancesMatch(hookAddress, v4HookAddress, optimismOwners, allTierIds);
            _verifyMigrationContractsEmpty(hookAddress, optimismMigrationContracts);
            
        } else if (chainId == 8453) {
            // Base - 2 chunks
            
            // Deploy and execute contract 1
            uint16[] memory tierIds1 = new uint16[](89);
            
            // Add 3 instances of tier ID 2
            for (uint256 i = 0; i < 3; i++) {
                tierIds1[0 + i] = 2;
            }
            // Add 10 instances of tier ID 3
            for (uint256 i = 0; i < 10; i++) {
                tierIds1[3 + i] = 3;
            }
            // Add 41 instances of tier ID 4
            for (uint256 i = 0; i < 41; i++) {
                tierIds1[13 + i] = 4;
            }
            // Add 1 instances of tier ID 5
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[54 + i] = 5;
            }
            // Add 4 instances of tier ID 6
            for (uint256 i = 0; i < 4; i++) {
                tierIds1[55 + i] = 6;
            }
            // Add 1 instances of tier ID 10
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[59 + i] = 10;
            }
            // Add 1 instances of tier ID 11
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[60 + i] = 11;
            }
            // Add 2 instances of tier ID 14
            for (uint256 i = 0; i < 2; i++) {
                tierIds1[61 + i] = 14;
            }
            // Add 2 instances of tier ID 15
            for (uint256 i = 0; i < 2; i++) {
                tierIds1[63 + i] = 15;
            }
            // Add 4 instances of tier ID 19
            for (uint256 i = 0; i < 4; i++) {
                tierIds1[65 + i] = 19;
            }
            // Add 4 instances of tier ID 25
            for (uint256 i = 0; i < 4; i++) {
                tierIds1[69 + i] = 25;
            }
            // Add 4 instances of tier ID 28
            for (uint256 i = 0; i < 4; i++) {
                tierIds1[73 + i] = 28;
            }
            // Add 1 instances of tier ID 31
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[77 + i] = 31;
            }
            // Add 1 instances of tier ID 32
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[78 + i] = 32;
            }
            // Add 1 instances of tier ID 33
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[79 + i] = 33;
            }
            // Add 2 instances of tier ID 37
            for (uint256 i = 0; i < 2; i++) {
                tierIds1[80 + i] = 37;
            }
            // Add 1 instances of tier ID 40
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[82 + i] = 40;
            }
            // Add 1 instances of tier ID 43
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[83 + i] = 43;
            }
            // Add 2 instances of tier ID 44
            for (uint256 i = 0; i < 2; i++) {
                tierIds1[84 + i] = 44;
            }
            // Add 1 instances of tier ID 45
            for (uint256 i = 0; i < 1; i++) {
                tierIds1[86 + i] = 45;
            }
            // Add 2 instances of tier ID 47
            for (uint256 i = 0; i < 2; i++) {
                tierIds1[87 + i] = 47;
            }
            address[] memory transferOwners1 = _getBaseTransferOwners1();
            MigrationContractBase1 migrationContract1 = new MigrationContractBase1(transferOwners1);
            console.log("Base migration contract 1 deployed at:", address(migrationContract1));
            
            // Mint chunk 1 assets to the contract address via pay()
            _mintViaPay(
                terminal,
                hook,
                projectId,
                tierIds1,
                address(migrationContract1)
            );
            console.log("Minted", tierIds1.length, "tokens to contract 1");
            
            migrationContract1.executeMigration(hookAddress, resolverAddress, v4HookAddress, v4ResolverAddress, v4ResolverFallback);
            
            // Deploy and execute contract 2
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
            
            // Sanity checks after all Base migrations
            address[] memory baseMigrationContracts = new address[](2);
            baseMigrationContracts[0] = address(migrationContract1);
            baseMigrationContracts[1] = address(migrationContract2);
            
            // Combine all owners and tier IDs for verification
            address[] memory allBaseOwners = new address[](tierIds1.length + tierIds2.length);
            uint16[] memory allBaseTierIds = new uint16[](tierIds1.length + tierIds2.length);
            
            // Copy owners and tier IDs from chunk 1
            address[] memory baseOwners1 = _getBaseTransferOwners1();
            for (uint256 i = 0; i < baseOwners1.length; i++) {
                allBaseOwners[i] = baseOwners1[i];
            }
            for (uint256 i = 0; i < tierIds1.length; i++) {
                allBaseTierIds[i] = tierIds1[i];
            }
            
            // Copy owners and tier IDs from chunk 2
            address[] memory baseOwners2 = _getBaseTransferOwners2();
            for (uint256 i = 0; i < baseOwners2.length; i++) {
                allBaseOwners[baseOwners1.length + i] = baseOwners2[i];
            }
            for (uint256 i = 0; i < tierIds2.length; i++) {
                allBaseTierIds[tierIds1.length + i] = tierIds2[i];
            }
            
            _verifyTierBalancesMatch(hookAddress, v4HookAddress, allBaseOwners, allBaseTierIds);
            _verifyMigrationContractsEmpty(hookAddress, baseMigrationContracts);
            
        } else if (chainId == 42161) {
            // Arbitrum tier IDs
            uint16[] memory allTierIds = new uint16[](205);
            
            // Add 2 instances of tier ID 3
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[0 + i] = 3;
            }
            // Add 9 instances of tier ID 4
            for (uint256 i = 0; i < 9; i++) {
                allTierIds[2 + i] = 4;
            }
            // Add 3 instances of tier ID 5
            for (uint256 i = 0; i < 3; i++) {
                allTierIds[11 + i] = 5;
            }
            // Add 1 instances of tier ID 6
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[14 + i] = 6;
            }
            // Add 2 instances of tier ID 10
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[15 + i] = 10;
            }
            // Add 1 instances of tier ID 11
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[17 + i] = 11;
            }
            // Add 4 instances of tier ID 19
            for (uint256 i = 0; i < 4; i++) {
                allTierIds[18 + i] = 19;
            }
            // Add 2 instances of tier ID 20
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[22 + i] = 20;
            }
            // Add 1 instances of tier ID 25
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[24 + i] = 25;
            }
            // Add 2 instances of tier ID 28
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[25 + i] = 28;
            }
            // Add 2 instances of tier ID 31
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[27 + i] = 31;
            }
            // Add 1 instances of tier ID 32
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[29 + i] = 32;
            }
            // Add 1 instances of tier ID 38
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[30 + i] = 38;
            }
            // Add 1 instances of tier ID 39
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[31 + i] = 39;
            }
            // Add 1 instances of tier ID 43
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[32 + i] = 43;
            }
            // Add 27 instances of tier ID 47
            for (uint256 i = 0; i < 27; i++) {
                allTierIds[33 + i] = 47;
            }
            // Add 145 instances of tier ID 49
            for (uint256 i = 0; i < 145; i++) {
                allTierIds[60 + i] = 49;
            }
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
            
            // Sanity checks after Arbitrum migration
            address[] memory arbitrumMigrationContracts = new address[](1);
            arbitrumMigrationContracts[0] = address(migrationContract);
            
            address[] memory arbitrumOwners = _getArbitrumTransferOwners();
            _verifyTierBalancesMatch(hookAddress, v4HookAddress, arbitrumOwners, allTierIds);
            _verifyMigrationContractsEmpty(hookAddress, arbitrumMigrationContracts);
            
        } else {
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
    function _getEthereumTransferOwners1() internal pure returns (address[] memory) {
        address[] memory transferOwners = new address[](40);
        
        transferOwners[0] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[1] = 0xA2Fa6144168751D116336B58C5288feaF8bb12C1;
        transferOwners[2] = 0x63A2368F4B509438ca90186cb1C15156713D5834;
        transferOwners[3] = 0x15b61e9b0637f45dc0858f083cd240267924125d;
        transferOwners[4] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[5] = 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe;
        transferOwners[6] = 0x5dee86b297755b3F2ce65e09BA3A700579A9020B;
        transferOwners[7] = 0x817738DC393d682Ca5fBb268707b99F2aAe96baE;
        transferOwners[8] = 0xa13d49fCbf79EAF6A0a58cBDD3361422DB4eAfF1;
        transferOwners[9] = 0x516cAfD745Ec780D20f61c0d71fe258eA765222D;
        transferOwners[10] = 0x126eeFa566ABF5aC3EfDAeF52d79E962CFFdB448;
        transferOwners[11] = 0x289715fFBB2f4b482e2917D2f183FeAb564ec84F;
        transferOwners[12] = 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb;
        transferOwners[13] = 0x1786D033D5CbCC235B673e872c7613c2F83DA583;
        transferOwners[14] = 0x38EED3CCeED88f380E436eb21811250797c453C5;
        transferOwners[15] = 0xE16a238d207B9ac8B419C7A866b0De013c73357B;
        transferOwners[16] = 0x0b2c9E0ee3057f4B9b0c2e42894a3D5A9B32b5Af;
        transferOwners[17] = 0x0Cb1D93daEc77Df2ED7Db31C040Fd2174452bD9F;
        transferOwners[18] = 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf;
        transferOwners[19] = 0x6a099Bb96DDF3963d5AddCAbDC0221914cF80b1F;
        transferOwners[20] = 0x87084347AeBADc626e8569E0D386928dade2ba09;
        transferOwners[21] = 0x79d1E7F1A6E0Bbb3278a9d2B782e3A8983444cb6;
        transferOwners[22] = 0x546B4A7A30b3193Badf70E1d43D8142928F3db0b;
        transferOwners[23] = 0x08cF1208e638a5A3623be58d600e35c6199baa9C;
        transferOwners[24] = 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79;
        transferOwners[25] = 0xe21A272c4D22eD40678a0168b4acd006bca8A482;
        transferOwners[26] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[27] = 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe;
        transferOwners[28] = 0x7D0068d0D8fC2Aa15d897448B348Fa9B30f6d4c9;
        transferOwners[29] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[30] = 0x898e24EBC9dAf5a9930f10def8B6a373F859C101;
        transferOwners[31] = 0x898e24EBC9dAf5a9930f10def8B6a373F859C101;
        transferOwners[32] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[33] = 0x961d4191965C49537c88F764D88318872CE405bE;
        transferOwners[34] = 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07;
        transferOwners[35] = 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59;
        transferOwners[36] = 0x8b80755C441d355405CA7571443Bb9247B77Ec16;
        transferOwners[37] = 0x8b80755C441d355405CA7571443Bb9247B77Ec16;
        transferOwners[38] = 0xa13d49fCbf79EAF6A0a58cBDD3361422DB4eAfF1;
        transferOwners[39] = 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1;
        return transferOwners;
    }
    
    function _getEthereumTransferOwners2() internal pure returns (address[] memory) {
        address[] memory transferOwners = new address[](40);
        
        transferOwners[0] = 0x0447AD1BdC0fFA06f7029c8E63F4De21E65255d2;
        transferOwners[1] = 0x5706d5aD7A68bf8692bD341234bE44ca7Bf2f654;
        transferOwners[2] = 0x679d87D8640e66778c3419D164998E720D7495f6;
        transferOwners[3] = 0x817738DC393d682Ca5fBb268707b99F2aAe96baE;
        transferOwners[4] = 0x4A290F18c35bBFE97B2557cf765De9387726dE39;
        transferOwners[5] = 0x25171bD3cD3231c3057c96F38E32E3bA6681497a;
        transferOwners[6] = 0xa7226e53F3100C093A0a5BCb6E3D0976EB3db1D6;
        transferOwners[7] = 0x76A6D08b82034b397E7e09dAe4377C18F132BbB8;
        transferOwners[8] = 0x809C9f8dd8CA93A41c3adca4972Fa234C28F7714;
        transferOwners[9] = 0x809C9f8dd8CA93A41c3adca4972Fa234C28F7714;
        transferOwners[10] = 0x126eeFa566ABF5aC3EfDAeF52d79E962CFFdB448;
        transferOwners[11] = 0x77fb4fa1ABA92576942aD34BC47834059b84e693;
        transferOwners[12] = 0x08cEb8Bba685ee708C9c4c65576837cbE19B9dea;
        transferOwners[13] = 0x690C01b4b1389D9D9265820F77DCbD2A6Ad04e6c;
        transferOwners[14] = 0x690C01b4b1389D9D9265820F77DCbD2A6Ad04e6c;
        transferOwners[15] = 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e;
        transferOwners[16] = 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e;
        transferOwners[17] = 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e;
        transferOwners[18] = 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e;
        transferOwners[19] = 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e;
        transferOwners[20] = 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e;
        transferOwners[21] = 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e;
        transferOwners[22] = 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e;
        transferOwners[23] = 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e;
        transferOwners[24] = 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e;
        transferOwners[25] = 0x5A00e8683f37e8B08C744054a0EF606a18b1aEF7;
        transferOwners[26] = 0x59E98040E53d7dC1900B4daf36D9Fbbd4a8f1dA2;
        transferOwners[27] = 0x59E98040E53d7dC1900B4daf36D9Fbbd4a8f1dA2;
        transferOwners[28] = 0x59E98040E53d7dC1900B4daf36D9Fbbd4a8f1dA2;
        transferOwners[29] = 0x46f3cC6a1c00A5cD8864d2B92f128196CAE07D15;
        transferOwners[30] = 0x08cF1208e638a5A3623be58d600e35c6199baa9C;
        transferOwners[31] = 0x381CC779761212344f8400373a994d29E17522c6;
        transferOwners[32] = 0x849151d7D0bF1F34b70d5caD5149D28CC2308bf1;
        transferOwners[33] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[34] = 0x63A2368F4B509438ca90186cb1C15156713D5834;
        transferOwners[35] = 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54;
        transferOwners[36] = 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54;
        transferOwners[37] = 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54;
        transferOwners[38] = 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54;
        transferOwners[39] = 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54;
        return transferOwners;
    }
    
    function _getEthereumTransferOwners3() internal pure returns (address[] memory) {
        address[] memory transferOwners = new address[](38);
        
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
        transferOwners[20] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[21] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[22] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[23] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[24] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[25] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[26] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[27] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        transferOwners[28] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[29] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[30] = 0xAAeD9fFF9858d48925904E391B77892BA5Fda824;
        transferOwners[31] = 0x2feb329b9289b60064904Fa61Fc347157a5AEd6a;
        transferOwners[32] = 0xDfd60a8E1e17FBb78E8CA332906A822D862f3D57;
        transferOwners[33] = 0xBD07B7Ab42cE411A752DB600604ECA7fE5501947;
        transferOwners[34] = 0x9f729294b308f79243285348A7Be3f58ae5ED31A;
        transferOwners[35] = 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2;
        transferOwners[36] = 0x1c6d61F3d8976A8aCDd311ecdFa533B8ECd0AC61;
        transferOwners[37] = 0x5138a42C3D5065debE950deBDa10C1f38150a908;
        return transferOwners;
    }
    
    function _getOptimismTransferOwners() internal pure returns (address[] memory) {
        address[] memory transferOwners = new address[](6);
        
        transferOwners[0] = 0x25910143C255828F623786f46fe9A8941B7983bB;
        transferOwners[1] = 0x292ff025168D2B51f0Ef49f164D281c36761BA2b;
        transferOwners[2] = 0xA7a5A2745f10D5C23d75a6fd228A408cEDe1CAE5;
        transferOwners[3] = 0x57700212B1cB7b67bD7DF3801DA43CA634513fE0;
        transferOwners[4] = 0x292ff025168D2B51f0Ef49f164D281c36761BA2b;
        transferOwners[5] = 0xA2Fa6144168751D116336B58C5288feaF8bb12C1;
        return transferOwners;
    }
    
    function _getBaseTransferOwners1() internal pure returns (address[] memory) {
        address[] memory transferOwners = new address[](54);
        
        transferOwners[0] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[1] = 0x565B93a15d38aCD79c120b15432D21E21eD274d6;
        transferOwners[2] = 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F;
        transferOwners[3] = 0x25171bD3cD3231c3057c96F38E32E3bA6681497a;
        transferOwners[4] = 0x4718ce007293bCe1E514887E6F55ea71d9A992d6;
        transferOwners[5] = 0x96D087aba8552A0e111D7fB4Feb2e7621213E244;
        transferOwners[6] = 0x2830e21792019CE670fBc548AacB004b08c7f71f;
        transferOwners[7] = 0x328809A567b87b6123462c3062e8438BBB75c1c5;
        transferOwners[8] = 0xAAeD9fFF9858d48925904E391B77892BA5Fda824;
        transferOwners[9] = 0xDf087B724174A3E4eD2338C0798193932E851F1b;
        transferOwners[10] = 0x28C173B8F20488eEF1b0f48Df8453A2f59C38337;
        transferOwners[11] = 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F;
        transferOwners[12] = 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12;
        transferOwners[13] = 0x817738DC393d682Ca5fBb268707b99F2aAe96baE;
        transferOwners[14] = 0xAAeD9fFF9858d48925904E391B77892BA5Fda824;
        transferOwners[15] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[16] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[17] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[18] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[19] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[20] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[21] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[22] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[23] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[24] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[25] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[26] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[27] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[28] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[29] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[30] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[31] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[32] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[33] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[34] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[35] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[36] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[37] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[38] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[39] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[40] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[41] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[42] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[43] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[44] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[45] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[46] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[47] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[48] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[49] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[50] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[51] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[52] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[53] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        return transferOwners;
    }
    
    function _getBaseTransferOwners2() internal pure returns (address[] memory) {
        address[] memory transferOwners = new address[](53);
        
        transferOwners[0] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[1] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[2] = 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041;
        transferOwners[3] = 0x67BcBE602e870e2286C19E4E0044E583967c9665;
        transferOwners[4] = 0x18deEE9699526f8C8a87004b2e4e55029Fb26b9a;
        transferOwners[5] = 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3;
        transferOwners[6] = 0xAcD59e854adf632d2322404198624F757C868C97;
        transferOwners[7] = 0xAcD59e854adf632d2322404198624F757C868C97;
        transferOwners[8] = 0xa13d49fCbf79EAF6A0a58cBDD3361422DB4eAfF1;
        transferOwners[9] = 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb;
        transferOwners[10] = 0xbeC26FFa12c90217943D1b2958f60A821aE6E549;
        transferOwners[11] = 0x8Ec174c5d86469D1A74094E10485357eBFe2e08e;
        transferOwners[12] = 0xC5704f77f94087CC644d361A5A57295851d242aB;
        transferOwners[13] = 0x99Fa48ccEa8a38CDE6B437450fF9bBdDAFAA4Fc8;
        transferOwners[14] = 0xb6ECb51e3638Eb7aa0C6289ef058DCa27494Acb2;
        transferOwners[15] = 0x57700212B1cB7b67bD7DF3801DA43CA634513fE0;
        transferOwners[16] = 0x57700212B1cB7b67bD7DF3801DA43CA634513fE0;
        transferOwners[17] = 0x9342E2aC6dd4A907948E91E80D2734ecAC1D70eC;
        transferOwners[18] = 0x96D087aba8552A0e111D7fB4Feb2e7621213E244;
        transferOwners[19] = 0x96D087aba8552A0e111D7fB4Feb2e7621213E244;
        transferOwners[20] = 0x96D087aba8552A0e111D7fB4Feb2e7621213E244;
        transferOwners[21] = 0x96D087aba8552A0e111D7fB4Feb2e7621213E244;
        transferOwners[22] = 0x96D087aba8552A0e111D7fB4Feb2e7621213E244;
        transferOwners[23] = 0x2830e21792019CE670fBc548AacB004b08c7f71f;
        transferOwners[24] = 0x2830e21792019CE670fBc548AacB004b08c7f71f;
        transferOwners[25] = 0x2830e21792019CE670fBc548AacB004b08c7f71f;
        transferOwners[26] = 0x2830e21792019CE670fBc548AacB004b08c7f71f;
        transferOwners[27] = 0x2830e21792019CE670fBc548AacB004b08c7f71f;
        transferOwners[28] = 0x46f3cC6a1c00A5cD8864d2B92f128196CAE07D15;
        transferOwners[29] = 0x8e2B25dF2484000B9127b2D2F8E92079dcEE3E48;
        transferOwners[30] = 0x817738DC393d682Ca5fBb268707b99F2aAe96baE;
        transferOwners[31] = 0x224aBa5D489675a7bD3CE07786FAda466b46FA0F;
        transferOwners[32] = 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe;
        transferOwners[33] = 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe;
        transferOwners[34] = 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe;
        transferOwners[35] = 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe;
        transferOwners[36] = 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe;
        transferOwners[37] = 0x8b80755C441d355405CA7571443Bb9247B77Ec16;
        transferOwners[38] = 0x3c2736f995535b5a755F3CE2BEb754362820671e;
        transferOwners[39] = 0x6877be9E00d0bc5886c28419901E8cC98C1c2739;
        transferOwners[40] = 0x8DFBdEEC8c5d4970BB5F481C6ec7f73fa1C65be5;
        transferOwners[41] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        transferOwners[42] = 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F;
        transferOwners[43] = 0x39a7B6fa1597BB6657Fe84e64E3B836c37d6F75d;
        transferOwners[44] = 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12;
        transferOwners[45] = 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12;
        transferOwners[46] = 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12;
        transferOwners[47] = 0xDdB4938755C243a4f60a2f2f8f95dF4F894c58Cc;
        transferOwners[48] = 0x34aA3F359A9D614239015126635CE7732c18fDF3;
        transferOwners[49] = 0x34aA3F359A9D614239015126635CE7732c18fDF3;
        transferOwners[50] = 0x34aA3F359A9D614239015126635CE7732c18fDF3;
        transferOwners[51] = 0xF6cC71878e23c05406B35946CD9d378E0f2f4f2F;
        transferOwners[52] = 0xd2e44E40B5FB960A8A74dD7B9D6b7f14B805b50d;
        return transferOwners;
    }
    
    function _getArbitrumTransferOwners() internal pure returns (address[] memory) {
        address[] memory transferOwners = new address[](187);
        
        transferOwners[0] = 0x2aa64E6d80390F5C017F0313cB908051BE2FD35e;
        transferOwners[1] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[2] = 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb;
        transferOwners[3] = 0xfD282d9f4d06C4BDc6a41af1Ae920A0AD70D18a3;
        transferOwners[4] = 0x08B3e694caA2F1fcF8eF71095CED1326f3454B89;
        transferOwners[5] = 0x9fDf876a50EA8f95017dCFC7709356887025B5BB;
        transferOwners[6] = 0x187089B33E5812310Ed32A57F53B3fAD0383a19D;
        transferOwners[7] = 0xc6404f24DB2f573F07F3A60758765caad198c0c3;
        transferOwners[8] = 0xB2d3900807094D4Fe47405871B0C8AdB58E10D42;
        transferOwners[9] = 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12;
        transferOwners[10] = 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12;
        transferOwners[11] = 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb;
        transferOwners[12] = 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12;
        transferOwners[13] = 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12;
        transferOwners[14] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[15] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[16] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[17] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[18] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[19] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[20] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[21] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[22] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[23] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[24] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[25] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[26] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[27] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[28] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[29] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[30] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[31] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[32] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[33] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[34] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[35] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[36] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[37] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[38] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[39] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[40] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[41] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[42] = 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb;
        transferOwners[43] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[44] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[45] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[46] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[47] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[48] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[49] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[50] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[51] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[52] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[53] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[54] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[55] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[56] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[57] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[58] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[59] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[60] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[61] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[62] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[63] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[64] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[65] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[66] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[67] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[68] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[69] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[70] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[71] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[72] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[73] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[74] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[75] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[76] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[77] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[78] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[79] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[80] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[81] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[82] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[83] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[84] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[85] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[86] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[87] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[88] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[89] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[90] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[91] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[92] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[93] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[94] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[95] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[96] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[97] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[98] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[99] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[100] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[101] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[102] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[103] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[104] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[105] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[106] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[107] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[108] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[109] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[110] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[111] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[112] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[113] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[114] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[115] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[116] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[117] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[118] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[119] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[120] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[121] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[122] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[123] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[124] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[125] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[126] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[127] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[128] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[129] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[130] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[131] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[132] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[133] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[134] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[135] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[136] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[137] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        transferOwners[138] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
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
        return transferOwners;
    }
    
    /// @notice Verify that tierBalanceOf in v5 STORE matches v4 STORE for all migrated owners and tier IDs
    /// @param hookAddress The v5 hook address
    /// @param v4HookAddress The v4 hook address
    /// @param owners Array of owner addresses to check
    /// @param tierIds Array of tier IDs to check (should match owners length)
    function _verifyTierBalancesMatch(
        address hookAddress,
        address v4HookAddress,
        address[] memory owners,
        uint16[] memory tierIds
    ) internal view {
        require(owners.length == tierIds.length, "Owners and tierIds arrays must have same length");
        
        JB721TiersHook hook = JB721TiersHook(hookAddress);
        JB721TiersHook v4Hook = JB721TiersHook(v4HookAddress);
        
        IJB721TiersHookStore v5Store = hook.STORE();
        IJB721TiersHookStore v4Store = v4Hook.STORE();
        
        console.log("Verifying tierBalanceOf matches between v4 and v5 stores...");
        
        for (uint256 i = 0; i < owners.length; i++) {
            address owner = owners[i];
            uint256 tierId = tierIds[i];
            
            uint256 v5Balance = v5Store.tierBalanceOf(hookAddress, owner, tierId);
            uint256 v4Balance = v4Store.tierBalanceOf(v4HookAddress, owner, tierId);
            
            require(
                v5Balance == v4Balance,
                string.concat(
                    "tierBalanceOf mismatch: owner=",
                    _addressToString(owner),
                    " tierId=",
                    _uint256ToString(tierId),
                    " v5=",
                    _uint256ToString(v5Balance),
                    " v4=",
                    _uint256ToString(v4Balance)
                )
            );
        }
        
        console.log("All tierBalanceOf checks passed!");
    }
    
    /// @notice Verify that migration contracts don't own any NFTs
    /// @param hookAddress The v5 hook address
    /// @param migrationContracts Array of migration contract addresses to check
    function _verifyMigrationContractsEmpty(
        address hookAddress,
        address[] memory migrationContracts
    ) internal view {
        IERC721 hook = IERC721(hookAddress);
        
        console.log("Verifying migration contracts don't own any NFTs...");
        
        for (uint256 i = 0; i < migrationContracts.length; i++) {
            address migrationContract = migrationContracts[i];
            uint256 balance = hook.balanceOf(migrationContract);
            
            require(
                balance == 0,
                string.concat(
                    "Migration contract still owns NFTs: contract=",
                    _addressToString(migrationContract),
                    " balance=",
                    _uint256ToString(balance)
                )
            );
        }
        
        console.log("All migration contracts verified empty!");
    }
    
    /// @notice Helper function to convert address to string
    function _addressToString(address addr) internal pure returns (string memory) {
        bytes32 value = bytes32(uint256(uint160(addr)));
        bytes memory alphabet = "0123456789abcdef";
        bytes memory str = new bytes(42);
        str[0] = '0';
        str[1] = 'x';
        for (uint256 i = 0; i < 20; i++) {
            str[2+i*2] = alphabet[uint8(value[i + 12] >> 4)];
            str[3+i*2] = alphabet[uint8(value[i + 12] & 0x0f)];
        }
        return string(str);
    }
    
    /// @notice Helper function to convert uint256 to string
    function _uint256ToString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
    
}