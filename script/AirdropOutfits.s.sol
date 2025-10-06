// SPDX-License-Identifier: MIT
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
        
        if (chainId == 1) {
            // Ethereum migration
            console.log("Migrating 536 items on Ethereum");
            
            // Step 1: Mint all assets to deployer initially
            
            console.log("Minting tierIds to deployer");
            
            // Create array of all tierIds to mint
            uint256[] memory allTierIds = new uint256[](536);
            uint256 tierIndex = 0;
            
            // Add 1 instances of UPC 1
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 1;
                tierIndex++;
            }
            // Add 6 instances of UPC 2
            for (uint256 i = 0; i < 6; i++) {
                allTierIds[tierIndex] = 2;
                tierIndex++;
            }
            // Add 26 instances of UPC 3
            for (uint256 i = 0; i < 26; i++) {
                allTierIds[tierIndex] = 3;
                tierIndex++;
            }
            // Add 85 instances of UPC 4
            for (uint256 i = 0; i < 85; i++) {
                allTierIds[tierIndex] = 4;
                tierIndex++;
            }
            // Add 8 instances of UPC 5
            for (uint256 i = 0; i < 8; i++) {
                allTierIds[tierIndex] = 5;
                tierIndex++;
            }
            // Add 13 instances of UPC 6
            for (uint256 i = 0; i < 13; i++) {
                allTierIds[tierIndex] = 6;
                tierIndex++;
            }
            // Add 2 instances of UPC 7
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 7;
                tierIndex++;
            }
            // Add 14 instances of UPC 10
            for (uint256 i = 0; i < 14; i++) {
                allTierIds[tierIndex] = 10;
                tierIndex++;
            }
            // Add 1 instances of UPC 11
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 11;
                tierIndex++;
            }
            // Add 4 instances of UPC 13
            for (uint256 i = 0; i < 4; i++) {
                allTierIds[tierIndex] = 13;
                tierIndex++;
            }
            // Add 6 instances of UPC 14
            for (uint256 i = 0; i < 6; i++) {
                allTierIds[tierIndex] = 14;
                tierIndex++;
            }
            // Add 5 instances of UPC 15
            for (uint256 i = 0; i < 5; i++) {
                allTierIds[tierIndex] = 15;
                tierIndex++;
            }
            // Add 1 instances of UPC 16
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 16;
                tierIndex++;
            }
            // Add 5 instances of UPC 17
            for (uint256 i = 0; i < 5; i++) {
                allTierIds[tierIndex] = 17;
                tierIndex++;
            }
            // Add 3 instances of UPC 18
            for (uint256 i = 0; i < 3; i++) {
                allTierIds[tierIndex] = 18;
                tierIndex++;
            }
            // Add 22 instances of UPC 19
            for (uint256 i = 0; i < 22; i++) {
                allTierIds[tierIndex] = 19;
                tierIndex++;
            }
            // Add 8 instances of UPC 20
            for (uint256 i = 0; i < 8; i++) {
                allTierIds[tierIndex] = 20;
                tierIndex++;
            }
            // Add 2 instances of UPC 21
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 21;
                tierIndex++;
            }
            // Add 8 instances of UPC 23
            for (uint256 i = 0; i < 8; i++) {
                allTierIds[tierIndex] = 23;
                tierIndex++;
            }
            // Add 12 instances of UPC 25
            for (uint256 i = 0; i < 12; i++) {
                allTierIds[tierIndex] = 25;
                tierIndex++;
            }
            // Add 7 instances of UPC 26
            for (uint256 i = 0; i < 7; i++) {
                allTierIds[tierIndex] = 26;
                tierIndex++;
            }
            // Add 9 instances of UPC 28
            for (uint256 i = 0; i < 9; i++) {
                allTierIds[tierIndex] = 28;
                tierIndex++;
            }
            // Add 3 instances of UPC 29
            for (uint256 i = 0; i < 3; i++) {
                allTierIds[tierIndex] = 29;
                tierIndex++;
            }
            // Add 13 instances of UPC 31
            for (uint256 i = 0; i < 13; i++) {
                allTierIds[tierIndex] = 31;
                tierIndex++;
            }
            // Add 5 instances of UPC 32
            for (uint256 i = 0; i < 5; i++) {
                allTierIds[tierIndex] = 32;
                tierIndex++;
            }
            // Add 2 instances of UPC 33
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 33;
                tierIndex++;
            }
            // Add 9 instances of UPC 35
            for (uint256 i = 0; i < 9; i++) {
                allTierIds[tierIndex] = 35;
                tierIndex++;
            }
            // Add 4 instances of UPC 37
            for (uint256 i = 0; i < 4; i++) {
                allTierIds[tierIndex] = 37;
                tierIndex++;
            }
            // Add 3 instances of UPC 38
            for (uint256 i = 0; i < 3; i++) {
                allTierIds[tierIndex] = 38;
                tierIndex++;
            }
            // Add 4 instances of UPC 39
            for (uint256 i = 0; i < 4; i++) {
                allTierIds[tierIndex] = 39;
                tierIndex++;
            }
            // Add 3 instances of UPC 40
            for (uint256 i = 0; i < 3; i++) {
                allTierIds[tierIndex] = 40;
                tierIndex++;
            }
            // Add 5 instances of UPC 41
            for (uint256 i = 0; i < 5; i++) {
                allTierIds[tierIndex] = 41;
                tierIndex++;
            }
            // Add 19 instances of UPC 42
            for (uint256 i = 0; i < 19; i++) {
                allTierIds[tierIndex] = 42;
                tierIndex++;
            }
            // Add 18 instances of UPC 43
            for (uint256 i = 0; i < 18; i++) {
                allTierIds[tierIndex] = 43;
                tierIndex++;
            }
            // Add 34 instances of UPC 44
            for (uint256 i = 0; i < 34; i++) {
                allTierIds[tierIndex] = 44;
                tierIndex++;
            }
            // Add 1 instances of UPC 46
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 46;
                tierIndex++;
            }
            // Add 14 instances of UPC 47
            for (uint256 i = 0; i < 14; i++) {
                allTierIds[tierIndex] = 47;
                tierIndex++;
            }
            // Add 6 instances of UPC 48
            for (uint256 i = 0; i < 6; i++) {
                allTierIds[tierIndex] = 48;
                tierIndex++;
            }
            // Add 145 instances of UPC 49
            for (uint256 i = 0; i < 145; i++) {
                allTierIds[tierIndex] = 49;
                tierIndex++;
            }
            
            // Mint all tierIds at once
            uint256[] memory mintedIds = hook.mintFor(allTierIds, deployer);
            
            // UPC 1 minted tokenIds (1 items)
            uint256[] memory upc1MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc1MintedIds[i] = mintedIds[0 + i];
            }
            // UPC 2 minted tokenIds (6 items)
            uint256[] memory upc2MintedIds = new uint256[](6);
            for (uint256 i = 0; i < 6; i++) {
                upc2MintedIds[i] = mintedIds[1 + i];
            }
            // UPC 3 minted tokenIds (26 items)
            uint256[] memory upc3MintedIds = new uint256[](26);
            for (uint256 i = 0; i < 26; i++) {
                upc3MintedIds[i] = mintedIds[7 + i];
            }
            // UPC 4 minted tokenIds (85 items)
            uint256[] memory upc4MintedIds = new uint256[](85);
            for (uint256 i = 0; i < 85; i++) {
                upc4MintedIds[i] = mintedIds[33 + i];
            }
            // UPC 5 minted tokenIds (8 items)
            uint256[] memory upc5MintedIds = new uint256[](8);
            for (uint256 i = 0; i < 8; i++) {
                upc5MintedIds[i] = mintedIds[118 + i];
            }
            // UPC 6 minted tokenIds (13 items)
            uint256[] memory upc6MintedIds = new uint256[](13);
            for (uint256 i = 0; i < 13; i++) {
                upc6MintedIds[i] = mintedIds[126 + i];
            }
            // UPC 7 minted tokenIds (2 items)
            uint256[] memory upc7MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc7MintedIds[i] = mintedIds[139 + i];
            }
            // UPC 10 minted tokenIds (14 items)
            uint256[] memory upc10MintedIds = new uint256[](14);
            for (uint256 i = 0; i < 14; i++) {
                upc10MintedIds[i] = mintedIds[141 + i];
            }
            // UPC 11 minted tokenIds (1 items)
            uint256[] memory upc11MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc11MintedIds[i] = mintedIds[155 + i];
            }
            // UPC 13 minted tokenIds (4 items)
            uint256[] memory upc13MintedIds = new uint256[](4);
            for (uint256 i = 0; i < 4; i++) {
                upc13MintedIds[i] = mintedIds[156 + i];
            }
            // UPC 14 minted tokenIds (6 items)
            uint256[] memory upc14MintedIds = new uint256[](6);
            for (uint256 i = 0; i < 6; i++) {
                upc14MintedIds[i] = mintedIds[160 + i];
            }
            // UPC 15 minted tokenIds (5 items)
            uint256[] memory upc15MintedIds = new uint256[](5);
            for (uint256 i = 0; i < 5; i++) {
                upc15MintedIds[i] = mintedIds[166 + i];
            }
            // UPC 16 minted tokenIds (1 items)
            uint256[] memory upc16MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc16MintedIds[i] = mintedIds[171 + i];
            }
            // UPC 17 minted tokenIds (5 items)
            uint256[] memory upc17MintedIds = new uint256[](5);
            for (uint256 i = 0; i < 5; i++) {
                upc17MintedIds[i] = mintedIds[172 + i];
            }
            // UPC 18 minted tokenIds (3 items)
            uint256[] memory upc18MintedIds = new uint256[](3);
            for (uint256 i = 0; i < 3; i++) {
                upc18MintedIds[i] = mintedIds[177 + i];
            }
            // UPC 19 minted tokenIds (22 items)
            uint256[] memory upc19MintedIds = new uint256[](22);
            for (uint256 i = 0; i < 22; i++) {
                upc19MintedIds[i] = mintedIds[180 + i];
            }
            // UPC 20 minted tokenIds (8 items)
            uint256[] memory upc20MintedIds = new uint256[](8);
            for (uint256 i = 0; i < 8; i++) {
                upc20MintedIds[i] = mintedIds[202 + i];
            }
            // UPC 21 minted tokenIds (2 items)
            uint256[] memory upc21MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc21MintedIds[i] = mintedIds[210 + i];
            }
            // UPC 23 minted tokenIds (8 items)
            uint256[] memory upc23MintedIds = new uint256[](8);
            for (uint256 i = 0; i < 8; i++) {
                upc23MintedIds[i] = mintedIds[212 + i];
            }
            // UPC 25 minted tokenIds (12 items)
            uint256[] memory upc25MintedIds = new uint256[](12);
            for (uint256 i = 0; i < 12; i++) {
                upc25MintedIds[i] = mintedIds[220 + i];
            }
            // UPC 26 minted tokenIds (7 items)
            uint256[] memory upc26MintedIds = new uint256[](7);
            for (uint256 i = 0; i < 7; i++) {
                upc26MintedIds[i] = mintedIds[232 + i];
            }
            // UPC 28 minted tokenIds (9 items)
            uint256[] memory upc28MintedIds = new uint256[](9);
            for (uint256 i = 0; i < 9; i++) {
                upc28MintedIds[i] = mintedIds[239 + i];
            }
            // UPC 29 minted tokenIds (3 items)
            uint256[] memory upc29MintedIds = new uint256[](3);
            for (uint256 i = 0; i < 3; i++) {
                upc29MintedIds[i] = mintedIds[248 + i];
            }
            // UPC 31 minted tokenIds (13 items)
            uint256[] memory upc31MintedIds = new uint256[](13);
            for (uint256 i = 0; i < 13; i++) {
                upc31MintedIds[i] = mintedIds[251 + i];
            }
            // UPC 32 minted tokenIds (5 items)
            uint256[] memory upc32MintedIds = new uint256[](5);
            for (uint256 i = 0; i < 5; i++) {
                upc32MintedIds[i] = mintedIds[264 + i];
            }
            // UPC 33 minted tokenIds (2 items)
            uint256[] memory upc33MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc33MintedIds[i] = mintedIds[269 + i];
            }
            // UPC 35 minted tokenIds (9 items)
            uint256[] memory upc35MintedIds = new uint256[](9);
            for (uint256 i = 0; i < 9; i++) {
                upc35MintedIds[i] = mintedIds[271 + i];
            }
            // UPC 37 minted tokenIds (4 items)
            uint256[] memory upc37MintedIds = new uint256[](4);
            for (uint256 i = 0; i < 4; i++) {
                upc37MintedIds[i] = mintedIds[280 + i];
            }
            // UPC 38 minted tokenIds (3 items)
            uint256[] memory upc38MintedIds = new uint256[](3);
            for (uint256 i = 0; i < 3; i++) {
                upc38MintedIds[i] = mintedIds[284 + i];
            }
            // UPC 39 minted tokenIds (4 items)
            uint256[] memory upc39MintedIds = new uint256[](4);
            for (uint256 i = 0; i < 4; i++) {
                upc39MintedIds[i] = mintedIds[287 + i];
            }
            // UPC 40 minted tokenIds (3 items)
            uint256[] memory upc40MintedIds = new uint256[](3);
            for (uint256 i = 0; i < 3; i++) {
                upc40MintedIds[i] = mintedIds[291 + i];
            }
            // UPC 41 minted tokenIds (5 items)
            uint256[] memory upc41MintedIds = new uint256[](5);
            for (uint256 i = 0; i < 5; i++) {
                upc41MintedIds[i] = mintedIds[294 + i];
            }
            // UPC 42 minted tokenIds (19 items)
            uint256[] memory upc42MintedIds = new uint256[](19);
            for (uint256 i = 0; i < 19; i++) {
                upc42MintedIds[i] = mintedIds[299 + i];
            }
            // UPC 43 minted tokenIds (18 items)
            uint256[] memory upc43MintedIds = new uint256[](18);
            for (uint256 i = 0; i < 18; i++) {
                upc43MintedIds[i] = mintedIds[318 + i];
            }
            // UPC 44 minted tokenIds (34 items)
            uint256[] memory upc44MintedIds = new uint256[](34);
            for (uint256 i = 0; i < 34; i++) {
                upc44MintedIds[i] = mintedIds[336 + i];
            }
            // UPC 46 minted tokenIds (1 items)
            uint256[] memory upc46MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc46MintedIds[i] = mintedIds[370 + i];
            }
            // UPC 47 minted tokenIds (14 items)
            uint256[] memory upc47MintedIds = new uint256[](14);
            for (uint256 i = 0; i < 14; i++) {
                upc47MintedIds[i] = mintedIds[371 + i];
            }
            // UPC 48 minted tokenIds (6 items)
            uint256[] memory upc48MintedIds = new uint256[](6);
            for (uint256 i = 0; i < 6; i++) {
                upc48MintedIds[i] = mintedIds[385 + i];
            }
            // UPC 49 minted tokenIds (145 items)
            uint256[] memory upc49MintedIds = new uint256[](145);
            for (uint256 i = 0; i < 145; i++) {
                upc49MintedIds[i] = mintedIds[391 + i];
            }
            // Step 2: Process each Banny body and dress them
            console.log("Processing 118 Banny bodies...");
            
            // Dress Banny 1000000001 (Alien)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc7MintedIds[1]; // V4: 7000000002 -> V5: upc7MintedIds[1]
                outfitIds[1] = upc17MintedIds[0]; // V4: 17000000001 -> V5: upc17MintedIds[0]
                outfitIds[2] = upc26MintedIds[3]; // V4: 26000000004 -> V5: upc26MintedIds[3]
                outfitIds[3] = upc46MintedIds[0]; // V4: 46000000001 -> V5: upc46MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    1000000001,
                    upc5MintedIds[3],
                    outfitIds
                );
            }
            
            // Dress Banny 2000000002 (Pink)
            {
                uint256[] memory outfitIds = new uint256[](5);
                                outfitIds[0] = upc7MintedIds[0]; // V4: 7000000001 -> V5: upc7MintedIds[0]
                outfitIds[1] = upc14MintedIds[2]; // V4: 14000000003 -> V5: upc14MintedIds[2]
                outfitIds[2] = upc19MintedIds[11]; // V4: 19000000012 -> V5: upc19MintedIds[11]
                outfitIds[3] = upc26MintedIds[2]; // V4: 26000000003 -> V5: upc26MintedIds[2]
                outfitIds[4] = upc35MintedIds[5]; // V4: 35000000006 -> V5: upc35MintedIds[5]

                resolver.decorateBannyWith(
                    address(hook),
                    2000000002,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 2000000004 (Pink)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc18MintedIds[1]; // V4: 18000000002 -> V5: upc18MintedIds[1]

                resolver.decorateBannyWith(
                    address(hook),
                    2000000004,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 2000000005 (Pink)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc21MintedIds[0]; // V4: 21000000001 -> V5: upc21MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    2000000005,
                    upc5MintedIds[4],
                    outfitIds
                );
            }
            
            // Dress Banny 2000000006 (Pink)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc19MintedIds[18]; // V4: 19000000019 -> V5: upc19MintedIds[18]
                outfitIds[1] = upc25MintedIds[8]; // V4: 25000000009 -> V5: upc25MintedIds[8]

                resolver.decorateBannyWith(
                    address(hook),
                    2000000006,
                    upc5MintedIds[7],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000001 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc14MintedIds[0]; // V4: 14000000001 -> V5: upc14MintedIds[0]
                outfitIds[1] = upc26MintedIds[0]; // V4: 26000000001 -> V5: upc26MintedIds[0]
                outfitIds[2] = upc35MintedIds[0]; // V4: 35000000001 -> V5: upc35MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000001,
                    upc6MintedIds[0],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000003 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc10MintedIds[4]; // V4: 10000000005 -> V5: upc10MintedIds[4]
                outfitIds[1] = upc44MintedIds[2]; // V4: 44000000003 -> V5: upc44MintedIds[2]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000003,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 3000000006 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc32MintedIds[0]; // V4: 32000000001 -> V5: upc32MintedIds[0]
                outfitIds[1] = upc44MintedIds[3]; // V4: 44000000004 -> V5: upc44MintedIds[3]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000006,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 3000000007 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc31MintedIds[2]; // V4: 31000000003 -> V5: upc31MintedIds[2]
                outfitIds[1] = upc47MintedIds[2]; // V4: 47000000003 -> V5: upc47MintedIds[2]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000007,
                    upc6MintedIds[2],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000009 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc35MintedIds[1]; // V4: 35000000002 -> V5: upc35MintedIds[1]
                outfitIds[1] = upc43MintedIds[4]; // V4: 43000000005 -> V5: upc43MintedIds[4]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000009,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 3000000010 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc32MintedIds[1]; // V4: 32000000002 -> V5: upc32MintedIds[1]
                outfitIds[1] = upc35MintedIds[3]; // V4: 35000000004 -> V5: upc35MintedIds[3]
                outfitIds[2] = upc48MintedIds[0]; // V4: 48000000001 -> V5: upc48MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000010,
                    upc6MintedIds[3],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000011 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc23MintedIds[0]; // V4: 23000000001 -> V5: upc23MintedIds[0]
                outfitIds[1] = upc39MintedIds[0]; // V4: 39000000001 -> V5: upc39MintedIds[0]
                outfitIds[2] = upc43MintedIds[5]; // V4: 43000000006 -> V5: upc43MintedIds[5]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000011,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 3000000013 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc19MintedIds[7]; // V4: 19000000008 -> V5: upc19MintedIds[7]
                outfitIds[1] = upc31MintedIds[5]; // V4: 31000000006 -> V5: upc31MintedIds[5]
                outfitIds[2] = upc37MintedIds[0]; // V4: 37000000001 -> V5: upc37MintedIds[0]
                outfitIds[3] = upc43MintedIds[6]; // V4: 43000000007 -> V5: upc43MintedIds[6]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000013,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 3000000017 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc25MintedIds[4]; // V4: 25000000005 -> V5: upc25MintedIds[4]
                outfitIds[1] = upc49MintedIds[1]; // V4: 49000000002 -> V5: upc49MintedIds[1]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000017,
                    upc5MintedIds[1],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000022 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc19MintedIds[14]; // V4: 19000000015 -> V5: upc19MintedIds[14]
                outfitIds[1] = upc38MintedIds[1]; // V4: 38000000002 -> V5: upc38MintedIds[1]
                outfitIds[2] = upc48MintedIds[4]; // V4: 48000000005 -> V5: upc48MintedIds[4]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000022,
                    upc6MintedIds[10],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000023 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc14MintedIds[4]; // V4: 14000000005 -> V5: upc14MintedIds[4]
                outfitIds[1] = upc25MintedIds[7]; // V4: 25000000008 -> V5: upc25MintedIds[7]
                outfitIds[2] = upc37MintedIds[2]; // V4: 37000000003 -> V5: upc37MintedIds[2]
                outfitIds[3] = upc42MintedIds[6]; // V4: 42000000007 -> V5: upc42MintedIds[6]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000023,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 3000000026 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc15MintedIds[3]; // V4: 15000000004 -> V5: upc15MintedIds[3]
                outfitIds[1] = upc29MintedIds[2]; // V4: 29000000003 -> V5: upc29MintedIds[2]
                outfitIds[2] = upc39MintedIds[2]; // V4: 39000000003 -> V5: upc39MintedIds[2]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000026,
                    upc6MintedIds[11],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000004 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc28MintedIds[1]; // V4: 28000000002 -> V5: upc28MintedIds[1]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000004,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000009 (Original)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc10MintedIds[0]; // V4: 10000000001 -> V5: upc10MintedIds[0]
                outfitIds[1] = upc19MintedIds[1]; // V4: 19000000002 -> V5: upc19MintedIds[1]
                outfitIds[2] = upc25MintedIds[1]; // V4: 25000000002 -> V5: upc25MintedIds[1]
                outfitIds[3] = upc43MintedIds[2]; // V4: 43000000003 -> V5: upc43MintedIds[2]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000009,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000010 (Original)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc10MintedIds[1]; // V4: 10000000002 -> V5: upc10MintedIds[1]
                outfitIds[1] = upc18MintedIds[0]; // V4: 18000000001 -> V5: upc18MintedIds[0]
                outfitIds[2] = upc20MintedIds[0]; // V4: 20000000001 -> V5: upc20MintedIds[0]
                outfitIds[3] = upc44MintedIds[0]; // V4: 44000000001 -> V5: upc44MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000010,
                    upc5MintedIds[0],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000013 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc31MintedIds[1]; // V4: 31000000002 -> V5: upc31MintedIds[1]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000013,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000014 (Original)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc10MintedIds[5]; // V4: 10000000006 -> V5: upc10MintedIds[5]
                outfitIds[1] = upc19MintedIds[3]; // V4: 19000000004 -> V5: upc19MintedIds[3]
                outfitIds[2] = upc25MintedIds[2]; // V4: 25000000003 -> V5: upc25MintedIds[2]
                outfitIds[3] = upc49MintedIds[0]; // V4: 49000000001 -> V5: upc49MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000014,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000015 (Original)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc15MintedIds[0]; // V4: 15000000001 -> V5: upc15MintedIds[0]
                outfitIds[1] = upc26MintedIds[1]; // V4: 26000000002 -> V5: upc26MintedIds[1]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000015,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000016 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc10MintedIds[6]; // V4: 10000000007 -> V5: upc10MintedIds[6]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000016,
                    upc6MintedIds[1],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000019 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc19MintedIds[4]; // V4: 19000000005 -> V5: upc19MintedIds[4]
                outfitIds[1] = upc35MintedIds[2]; // V4: 35000000003 -> V5: upc35MintedIds[2]
                outfitIds[2] = upc42MintedIds[1]; // V4: 42000000002 -> V5: upc42MintedIds[1]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000019,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000023 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc31MintedIds[6]; // V4: 31000000007 -> V5: upc31MintedIds[6]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000023,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000033 (Original)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc19MintedIds[8]; // V4: 19000000009 -> V5: upc19MintedIds[8]
                outfitIds[1] = upc43MintedIds[7]; // V4: 43000000008 -> V5: upc43MintedIds[7]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000033,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000039 (Original)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc13MintedIds[0]; // V4: 13000000001 -> V5: upc13MintedIds[0]
                outfitIds[1] = upc19MintedIds[10]; // V4: 19000000011 -> V5: upc19MintedIds[10]
                outfitIds[2] = upc25MintedIds[5]; // V4: 25000000006 -> V5: upc25MintedIds[5]
                outfitIds[3] = upc42MintedIds[3]; // V4: 42000000004 -> V5: upc42MintedIds[3]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000039,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000040 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc25MintedIds[6]; // V4: 25000000007 -> V5: upc25MintedIds[6]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000040,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000041 (Original)
            {
                uint256[] memory outfitIds = new uint256[](5);
                                outfitIds[0] = upc16MintedIds[0]; // V4: 16000000001 -> V5: upc16MintedIds[0]
                outfitIds[1] = upc17MintedIds[1]; // V4: 17000000002 -> V5: upc17MintedIds[1]
                outfitIds[2] = upc31MintedIds[8]; // V4: 31000000009 -> V5: upc31MintedIds[8]
                outfitIds[3] = upc33MintedIds[0]; // V4: 33000000001 -> V5: upc33MintedIds[0]
                outfitIds[4] = upc48MintedIds[1]; // V4: 48000000002 -> V5: upc48MintedIds[1]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000041,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000043 (Original)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc32MintedIds[2]; // V4: 32000000003 -> V5: upc32MintedIds[2]
                outfitIds[1] = upc48MintedIds[2]; // V4: 48000000003 -> V5: upc48MintedIds[2]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000043,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000044 (Original)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc23MintedIds[1]; // V4: 23000000002 -> V5: upc23MintedIds[1]
                outfitIds[1] = upc41MintedIds[0]; // V4: 41000000001 -> V5: upc41MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000044,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000045 (Original)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc23MintedIds[3]; // V4: 23000000004 -> V5: upc23MintedIds[3]
                outfitIds[1] = upc41MintedIds[2]; // V4: 41000000003 -> V5: upc41MintedIds[2]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000045,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000046 (Original)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc23MintedIds[4]; // V4: 23000000005 -> V5: upc23MintedIds[4]
                outfitIds[1] = upc41MintedIds[3]; // V4: 41000000004 -> V5: upc41MintedIds[3]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000046,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000047 (Original)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc23MintedIds[2]; // V4: 23000000003 -> V5: upc23MintedIds[2]
                outfitIds[1] = upc41MintedIds[1]; // V4: 41000000002 -> V5: upc41MintedIds[1]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000047,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000048 (Original)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc19MintedIds[12]; // V4: 19000000013 -> V5: upc19MintedIds[12]
                outfitIds[1] = upc31MintedIds[9]; // V4: 31000000010 -> V5: upc31MintedIds[9]
                outfitIds[2] = upc35MintedIds[6]; // V4: 35000000007 -> V5: upc35MintedIds[6]
                outfitIds[3] = upc47MintedIds[4]; // V4: 47000000005 -> V5: upc47MintedIds[4]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000048,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000052 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc10MintedIds[11]; // V4: 10000000012 -> V5: upc10MintedIds[11]
                outfitIds[1] = upc18MintedIds[2]; // V4: 18000000003 -> V5: upc18MintedIds[2]
                outfitIds[2] = upc20MintedIds[7]; // V4: 20000000008 -> V5: upc20MintedIds[7]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000052,
                    upc5MintedIds[5],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000054 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc15MintedIds[1]; // V4: 15000000002 -> V5: upc15MintedIds[1]
                outfitIds[1] = upc26MintedIds[4]; // V4: 26000000005 -> V5: upc26MintedIds[4]
                outfitIds[2] = upc44MintedIds[7]; // V4: 44000000008 -> V5: upc44MintedIds[7]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000054,
                    upc6MintedIds[9],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000055 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc19MintedIds[15]; // V4: 19000000016 -> V5: upc19MintedIds[15]
                outfitIds[1] = upc39MintedIds[1]; // V4: 39000000002 -> V5: upc39MintedIds[1]
                outfitIds[2] = upc44MintedIds[8]; // V4: 44000000009 -> V5: upc44MintedIds[8]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000055,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000056 (Original)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc15MintedIds[2]; // V4: 15000000003 -> V5: upc15MintedIds[2]
                outfitIds[1] = upc23MintedIds[6]; // V4: 23000000007 -> V5: upc23MintedIds[6]
                outfitIds[2] = upc40MintedIds[0]; // V4: 40000000001 -> V5: upc40MintedIds[0]
                outfitIds[3] = upc49MintedIds[3]; // V4: 49000000004 -> V5: upc49MintedIds[3]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000056,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000057 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc19MintedIds[16]; // V4: 19000000017 -> V5: upc19MintedIds[16]
                outfitIds[1] = upc28MintedIds[7]; // V4: 28000000008 -> V5: upc28MintedIds[7]
                outfitIds[2] = upc38MintedIds[2]; // V4: 38000000003 -> V5: upc38MintedIds[2]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000057,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000060 (Original)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc13MintedIds[2]; // V4: 13000000003 -> V5: upc13MintedIds[2]
                outfitIds[1] = upc48MintedIds[5]; // V4: 48000000006 -> V5: upc48MintedIds[5]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000060,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000076 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc19MintedIds[17]; // V4: 19000000018 -> V5: upc19MintedIds[17]
                outfitIds[1] = upc29MintedIds[1]; // V4: 29000000002 -> V5: upc29MintedIds[1]
                outfitIds[2] = upc38MintedIds[0]; // V4: 38000000001 -> V5: upc38MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000076,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000078 (Original)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc31MintedIds[10]; // V4: 31000000011 -> V5: upc31MintedIds[10]
                outfitIds[1] = upc43MintedIds[16]; // V4: 43000000017 -> V5: upc43MintedIds[16]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000078,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000079 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc19MintedIds[19]; // V4: 19000000020 -> V5: upc19MintedIds[19]
                outfitIds[1] = upc25MintedIds[9]; // V4: 25000000010 -> V5: upc25MintedIds[9]
                outfitIds[2] = upc43MintedIds[17]; // V4: 43000000018 -> V5: upc43MintedIds[17]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000079,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000080 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc15MintedIds[4]; // V4: 15000000005 -> V5: upc15MintedIds[4]
                outfitIds[1] = upc19MintedIds[20]; // V4: 19000000021 -> V5: upc19MintedIds[20]
                outfitIds[2] = upc25MintedIds[10]; // V4: 25000000011 -> V5: upc25MintedIds[10]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000080,
                    upc6MintedIds[12],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000085 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc31MintedIds[12]; // V4: 31000000013 -> V5: upc31MintedIds[12]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000085,
                    0,
                    outfitIds
                );
            }
            
            // Step 3: Transfer all assets to rightful owners
            console.log("Transferring %d tokens to rightful owners", mintedIds.length);
            
            // Transfer UPC 1 (minted tokenId mintedIds[0]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[0]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[1]) to 0xa2fa6144168751d116336b58c5288feaf8bb12c1
            IERC721(address(hook)).transferFrom(deployer, 0xa2fa6144168751d116336b58c5288feaf8bb12c1, mintedIds[1]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[2]) to 0x63a2368f4b509438ca90186cb1c15156713d5834
            IERC721(address(hook)).transferFrom(deployer, 0x63a2368f4b509438ca90186cb1c15156713d5834, mintedIds[2]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[3]) to 0x15b61e9b0637f45dc0858f083cd240267924125d
            IERC721(address(hook)).transferFrom(deployer, 0x15b61e9b0637f45dc0858f083cd240267924125d, mintedIds[3]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[4]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[4]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[5]) to 0x45c3d8aacc0d537dac234ad4c20ef05d6041cefe
            IERC721(address(hook)).transferFrom(deployer, 0x45c3d8aacc0d537dac234ad4c20ef05d6041cefe, mintedIds[5]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[6]) to 0x5dee86b297755b3f2ce65e09ba3a700579a9020b
            IERC721(address(hook)).transferFrom(deployer, 0x5dee86b297755b3f2ce65e09ba3a700579a9020b, mintedIds[6]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[7]) to 0x817738dc393d682ca5fbb268707b99f2aae96bae
            IERC721(address(hook)).transferFrom(deployer, 0x817738dc393d682ca5fbb268707b99f2aae96bae, mintedIds[7]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[8]) to 0xa13d49fcbf79eaf6a0a58cbdd3361422db4eaff1
            IERC721(address(hook)).transferFrom(deployer, 0xa13d49fcbf79eaf6a0a58cbdd3361422db4eaff1, mintedIds[8]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[9]) to 0x516cafd745ec780d20f61c0d71fe258ea765222d
            IERC721(address(hook)).transferFrom(deployer, 0x516cafd745ec780d20f61c0d71fe258ea765222d, mintedIds[9]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[10]) to 0x126eefa566abf5ac3efdaef52d79e962cffdb448
            IERC721(address(hook)).transferFrom(deployer, 0x126eefa566abf5ac3efdaef52d79e962cffdb448, mintedIds[10]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[11]) to 0x289715ffbb2f4b482e2917d2f183feab564ec84f
            IERC721(address(hook)).transferFrom(deployer, 0x289715ffbb2f4b482e2917d2f183feab564ec84f, mintedIds[11]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[12]) to 0x1c51517d8277c9ad6d701fb5394cec0c18219edb
            IERC721(address(hook)).transferFrom(deployer, 0x1c51517d8277c9ad6d701fb5394cec0c18219edb, mintedIds[12]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[13]) to 0x1786d033d5cbcc235b673e872c7613c2f83da583
            IERC721(address(hook)).transferFrom(deployer, 0x1786d033d5cbcc235b673e872c7613c2f83da583, mintedIds[13]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[14]) to 0x38eed3cceed88f380e436eb21811250797c453c5
            IERC721(address(hook)).transferFrom(deployer, 0x38eed3cceed88f380e436eb21811250797c453c5, mintedIds[14]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[15]) to 0xe16a238d207b9ac8b419c7a866b0de013c73357b
            IERC721(address(hook)).transferFrom(deployer, 0xe16a238d207b9ac8b419c7a866b0de013c73357b, mintedIds[15]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[16]) to 0x0b2c9e0ee3057f4b9b0c2e42894a3d5a9b32b5af
            IERC721(address(hook)).transferFrom(deployer, 0x0b2c9e0ee3057f4b9b0c2e42894a3d5a9b32b5af, mintedIds[16]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[17]) to 0x0cb1d93daec77df2ed7db31c040fd2174452bd9f
            IERC721(address(hook)).transferFrom(deployer, 0x0cb1d93daec77df2ed7db31c040fd2174452bd9f, mintedIds[17]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[18]) to 0xa9d20b435a85faaa002f32d66f7d21564130e9cf
            IERC721(address(hook)).transferFrom(deployer, 0xa9d20b435a85faaa002f32d66f7d21564130e9cf, mintedIds[18]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[19]) to 0x6a099bb96ddf3963d5addcabdc0221914cf80b1f
            IERC721(address(hook)).transferFrom(deployer, 0x6a099bb96ddf3963d5addcabdc0221914cf80b1f, mintedIds[19]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[20]) to 0x87084347aebadc626e8569e0d386928dade2ba09
            IERC721(address(hook)).transferFrom(deployer, 0x87084347aebadc626e8569e0d386928dade2ba09, mintedIds[20]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[21]) to 0x79d1e7f1a6e0bbb3278a9d2b782e3a8983444cb6
            IERC721(address(hook)).transferFrom(deployer, 0x79d1e7f1a6e0bbb3278a9d2b782e3a8983444cb6, mintedIds[21]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[22]) to 0x546b4a7a30b3193badf70e1d43d8142928f3db0b
            IERC721(address(hook)).transferFrom(deployer, 0x546b4a7a30b3193badf70e1d43d8142928f3db0b, mintedIds[22]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[23]) to 0x08cf1208e638a5a3623be58d600e35c6199baa9c
            IERC721(address(hook)).transferFrom(deployer, 0x08cf1208e638a5a3623be58d600e35c6199baa9c, mintedIds[23]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[24]) to 0x1ae766cc5947e1e4c3538ee1f3f47063d2b40e79
            IERC721(address(hook)).transferFrom(deployer, 0x1ae766cc5947e1e4c3538ee1f3f47063d2b40e79, mintedIds[24]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[25]) to 0xe21a272c4d22ed40678a0168b4acd006bca8a482
            IERC721(address(hook)).transferFrom(deployer, 0xe21a272c4d22ed40678a0168b4acd006bca8a482, mintedIds[25]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[26]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[26]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[27]) to 0x45c3d8aacc0d537dac234ad4c20ef05d6041cefe
            IERC721(address(hook)).transferFrom(deployer, 0x45c3d8aacc0d537dac234ad4c20ef05d6041cefe, mintedIds[27]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[28]) to 0x7d0068d0d8fc2aa15d897448b348fa9b30f6d4c9
            IERC721(address(hook)).transferFrom(deployer, 0x7d0068d0d8fc2aa15d897448b348fa9b30f6d4c9, mintedIds[28]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[29]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[29]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[30]) to 0x898e24ebc9daf5a9930f10def8b6a373f859c101
            IERC721(address(hook)).transferFrom(deployer, 0x898e24ebc9daf5a9930f10def8b6a373f859c101, mintedIds[30]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[31]) to 0x898e24ebc9daf5a9930f10def8b6a373f859c101
            IERC721(address(hook)).transferFrom(deployer, 0x898e24ebc9daf5a9930f10def8b6a373f859c101, mintedIds[31]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[32]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[32]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[33]) to 0x961d4191965c49537c88f764d88318872ce405be
            IERC721(address(hook)).transferFrom(deployer, 0x961d4191965c49537c88f764d88318872ce405be, mintedIds[33]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[34]) to 0x21a8f5a6bf893d43d3964ddaf4e04766bbbe9b07
            IERC721(address(hook)).transferFrom(deployer, 0x21a8f5a6bf893d43d3964ddaf4e04766bbbe9b07, mintedIds[34]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[35]) to 0x7a16eabd1413bfd468ae9febf7c26c62f1ffdc59
            IERC721(address(hook)).transferFrom(deployer, 0x7a16eabd1413bfd468ae9febf7c26c62f1ffdc59, mintedIds[35]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[36]) to 0x8b80755c441d355405ca7571443bb9247b77ec16
            IERC721(address(hook)).transferFrom(deployer, 0x8b80755c441d355405ca7571443bb9247b77ec16, mintedIds[36]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[37]) to 0x8b80755c441d355405ca7571443bb9247b77ec16
            IERC721(address(hook)).transferFrom(deployer, 0x8b80755c441d355405ca7571443bb9247b77ec16, mintedIds[37]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[38]) to 0xa13d49fcbf79eaf6a0a58cbdd3361422db4eaff1
            IERC721(address(hook)).transferFrom(deployer, 0xa13d49fcbf79eaf6a0a58cbdd3361422db4eaff1, mintedIds[38]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[39]) to 0xe7879a2d05dba966fcca34ee9c3f99eee7edefd1
            IERC721(address(hook)).transferFrom(deployer, 0xe7879a2d05dba966fcca34ee9c3f99eee7edefd1, mintedIds[39]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[40]) to 0x0447ad1bdc0ffa06f7029c8e63f4de21e65255d2
            IERC721(address(hook)).transferFrom(deployer, 0x0447ad1bdc0ffa06f7029c8e63f4de21e65255d2, mintedIds[40]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[41]) to 0x5706d5ad7a68bf8692bd341234be44ca7bf2f654
            IERC721(address(hook)).transferFrom(deployer, 0x5706d5ad7a68bf8692bd341234be44ca7bf2f654, mintedIds[41]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[42]) to 0x679d87d8640e66778c3419d164998e720d7495f6
            IERC721(address(hook)).transferFrom(deployer, 0x679d87d8640e66778c3419d164998e720d7495f6, mintedIds[42]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[43]) to 0x817738dc393d682ca5fbb268707b99f2aae96bae
            IERC721(address(hook)).transferFrom(deployer, 0x817738dc393d682ca5fbb268707b99f2aae96bae, mintedIds[43]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[44]) to 0x4a290f18c35bbfe97b2557cf765de9387726de39
            IERC721(address(hook)).transferFrom(deployer, 0x4a290f18c35bbfe97b2557cf765de9387726de39, mintedIds[44]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[45]) to 0x25171bd3cd3231c3057c96f38e32e3ba6681497a
            IERC721(address(hook)).transferFrom(deployer, 0x25171bd3cd3231c3057c96f38e32e3ba6681497a, mintedIds[45]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[46]) to 0xa7226e53f3100c093a0a5bcb6e3d0976eb3db1d6
            IERC721(address(hook)).transferFrom(deployer, 0xa7226e53f3100c093a0a5bcb6e3d0976eb3db1d6, mintedIds[46]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[47]) to 0x76a6d08b82034b397e7e09dae4377c18f132bbb8
            IERC721(address(hook)).transferFrom(deployer, 0x76a6d08b82034b397e7e09dae4377c18f132bbb8, mintedIds[47]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[48]) to 0x809c9f8dd8ca93a41c3adca4972fa234c28f7714
            IERC721(address(hook)).transferFrom(deployer, 0x809c9f8dd8ca93a41c3adca4972fa234c28f7714, mintedIds[48]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[49]) to 0x809c9f8dd8ca93a41c3adca4972fa234c28f7714
            IERC721(address(hook)).transferFrom(deployer, 0x809c9f8dd8ca93a41c3adca4972fa234c28f7714, mintedIds[49]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[50]) to 0x126eefa566abf5ac3efdaef52d79e962cffdb448
            IERC721(address(hook)).transferFrom(deployer, 0x126eefa566abf5ac3efdaef52d79e962cffdb448, mintedIds[50]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[51]) to 0x77fb4fa1aba92576942ad34bc47834059b84e693
            IERC721(address(hook)).transferFrom(deployer, 0x77fb4fa1aba92576942ad34bc47834059b84e693, mintedIds[51]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[52]) to 0x08ceb8bba685ee708c9c4c65576837cbe19b9dea
            IERC721(address(hook)).transferFrom(deployer, 0x08ceb8bba685ee708c9c4c65576837cbe19b9dea, mintedIds[52]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[53]) to 0x690c01b4b1389d9d9265820f77dcbd2a6ad04e6c
            IERC721(address(hook)).transferFrom(deployer, 0x690c01b4b1389d9d9265820f77dcbd2a6ad04e6c, mintedIds[53]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[54]) to 0x690c01b4b1389d9d9265820f77dcbd2a6ad04e6c
            IERC721(address(hook)).transferFrom(deployer, 0x690c01b4b1389d9d9265820f77dcbd2a6ad04e6c, mintedIds[54]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[55]) to 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e
            IERC721(address(hook)).transferFrom(deployer, 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e, mintedIds[55]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[56]) to 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e
            IERC721(address(hook)).transferFrom(deployer, 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e, mintedIds[56]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[57]) to 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e
            IERC721(address(hook)).transferFrom(deployer, 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e, mintedIds[57]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[58]) to 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e
            IERC721(address(hook)).transferFrom(deployer, 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e, mintedIds[58]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[59]) to 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e
            IERC721(address(hook)).transferFrom(deployer, 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e, mintedIds[59]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[60]) to 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e
            IERC721(address(hook)).transferFrom(deployer, 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e, mintedIds[60]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[61]) to 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e
            IERC721(address(hook)).transferFrom(deployer, 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e, mintedIds[61]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[62]) to 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e
            IERC721(address(hook)).transferFrom(deployer, 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e, mintedIds[62]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[63]) to 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e
            IERC721(address(hook)).transferFrom(deployer, 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e, mintedIds[63]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[64]) to 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e
            IERC721(address(hook)).transferFrom(deployer, 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e, mintedIds[64]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[65]) to 0x5a00e8683f37e8b08c744054a0ef606a18b1aef7
            IERC721(address(hook)).transferFrom(deployer, 0x5a00e8683f37e8b08c744054a0ef606a18b1aef7, mintedIds[65]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[66]) to 0x59e98040e53d7dc1900b4daf36d9fbbd4a8f1da2
            IERC721(address(hook)).transferFrom(deployer, 0x59e98040e53d7dc1900b4daf36d9fbbd4a8f1da2, mintedIds[66]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[67]) to 0x59e98040e53d7dc1900b4daf36d9fbbd4a8f1da2
            IERC721(address(hook)).transferFrom(deployer, 0x59e98040e53d7dc1900b4daf36d9fbbd4a8f1da2, mintedIds[67]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[68]) to 0x59e98040e53d7dc1900b4daf36d9fbbd4a8f1da2
            IERC721(address(hook)).transferFrom(deployer, 0x59e98040e53d7dc1900b4daf36d9fbbd4a8f1da2, mintedIds[68]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[69]) to 0x46f3cc6a1c00a5cd8864d2b92f128196cae07d15
            IERC721(address(hook)).transferFrom(deployer, 0x46f3cc6a1c00a5cd8864d2b92f128196cae07d15, mintedIds[69]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[70]) to 0x08cf1208e638a5a3623be58d600e35c6199baa9c
            IERC721(address(hook)).transferFrom(deployer, 0x08cf1208e638a5a3623be58d600e35c6199baa9c, mintedIds[70]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[71]) to 0x381cc779761212344f8400373a994d29e17522c6
            IERC721(address(hook)).transferFrom(deployer, 0x381cc779761212344f8400373a994d29e17522c6, mintedIds[71]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[72]) to 0x849151d7d0bf1f34b70d5cad5149d28cc2308bf1
            IERC721(address(hook)).transferFrom(deployer, 0x849151d7d0bf1f34b70d5cad5149d28cc2308bf1, mintedIds[72]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[73]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[73]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[74]) to 0x63a2368f4b509438ca90186cb1c15156713d5834
            IERC721(address(hook)).transferFrom(deployer, 0x63a2368f4b509438ca90186cb1c15156713d5834, mintedIds[74]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[75]) to 0x95e9a0c113aa9931a4230f91ade08a491d3f8d54
            IERC721(address(hook)).transferFrom(deployer, 0x95e9a0c113aa9931a4230f91ade08a491d3f8d54, mintedIds[75]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[76]) to 0x95e9a0c113aa9931a4230f91ade08a491d3f8d54
            IERC721(address(hook)).transferFrom(deployer, 0x95e9a0c113aa9931a4230f91ade08a491d3f8d54, mintedIds[76]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[77]) to 0x95e9a0c113aa9931a4230f91ade08a491d3f8d54
            IERC721(address(hook)).transferFrom(deployer, 0x95e9a0c113aa9931a4230f91ade08a491d3f8d54, mintedIds[77]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[78]) to 0x95e9a0c113aa9931a4230f91ade08a491d3f8d54
            IERC721(address(hook)).transferFrom(deployer, 0x95e9a0c113aa9931a4230f91ade08a491d3f8d54, mintedIds[78]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[79]) to 0x95e9a0c113aa9931a4230f91ade08a491d3f8d54
            IERC721(address(hook)).transferFrom(deployer, 0x95e9a0c113aa9931a4230f91ade08a491d3f8d54, mintedIds[79]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[80]) to 0xf32dd1bd55bd14d929218499a2e7d106f72f79c7
            IERC721(address(hook)).transferFrom(deployer, 0xf32dd1bd55bd14d929218499a2e7d106f72f79c7, mintedIds[80]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[81]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[81]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[82]) to 0xe21a272c4d22ed40678a0168b4acd006bca8a482
            IERC721(address(hook)).transferFrom(deployer, 0xe21a272c4d22ed40678a0168b4acd006bca8a482, mintedIds[82]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[83]) to 0xe21a272c4d22ed40678a0168b4acd006bca8a482
            IERC721(address(hook)).transferFrom(deployer, 0xe21a272c4d22ed40678a0168b4acd006bca8a482, mintedIds[83]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[84]) to 0x80581c6e88ce00095f85cdf24bb760f16d6ec0d6
            IERC721(address(hook)).transferFrom(deployer, 0x80581c6e88ce00095f85cdf24bb760f16d6ec0d6, mintedIds[84]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[85]) to 0x4a8a9147ab0df5a8949f964bdba22dc4583280e2
            IERC721(address(hook)).transferFrom(deployer, 0x4a8a9147ab0df5a8949f964bdba22dc4583280e2, mintedIds[85]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[86]) to 0x30670d81e487c80b9edc54370e6eaf943b6eab39
            IERC721(address(hook)).transferFrom(deployer, 0x30670d81e487c80b9edc54370e6eaf943b6eab39, mintedIds[86]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[87]) to 0x60535a6605958fff6cec5b1e92892601efb3473b
            IERC721(address(hook)).transferFrom(deployer, 0x60535a6605958fff6cec5b1e92892601efb3473b, mintedIds[87]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[88]) to 0x34724d71ce674fcd4d06e60dd1baa88c14d36b75
            IERC721(address(hook)).transferFrom(deployer, 0x34724d71ce674fcd4d06e60dd1baa88c14d36b75, mintedIds[88]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[89]) to 0xa99c384f43e72b65bb51fe33b85ce12a32c09526
            IERC721(address(hook)).transferFrom(deployer, 0xa99c384f43e72b65bb51fe33b85ce12a32c09526, mintedIds[89]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[90]) to 0x898e24ebc9daf5a9930f10def8b6a373f859c101
            IERC721(address(hook)).transferFrom(deployer, 0x898e24ebc9daf5a9930f10def8b6a373f859c101, mintedIds[90]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[91]) to 0x898e24ebc9daf5a9930f10def8b6a373f859c101
            IERC721(address(hook)).transferFrom(deployer, 0x898e24ebc9daf5a9930f10def8b6a373f859c101, mintedIds[91]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[92]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[92]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[93]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[93]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[94]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[94]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[95]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[95]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[96]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[96]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[97]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[97]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[98]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[98]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[99]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[99]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[100]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[100]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[101]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[101]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[102]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[102]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[103]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[103]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[104]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[104]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[105]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[105]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[106]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[106]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[107]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[107]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[108]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[108]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[109]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[109]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[110]) to 0xaaed9fff9858d48925904e391b77892ba5fda824
            IERC721(address(hook)).transferFrom(deployer, 0xaaed9fff9858d48925904e391b77892ba5fda824, mintedIds[110]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[111]) to 0x2feb329b9289b60064904fa61fc347157a5aed6a
            IERC721(address(hook)).transferFrom(deployer, 0x2feb329b9289b60064904fa61fc347157a5aed6a, mintedIds[111]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[112]) to 0xdfd60a8e1e17fbb78e8ca332906a822d862f3d57
            IERC721(address(hook)).transferFrom(deployer, 0xdfd60a8e1e17fbb78e8ca332906a822d862f3d57, mintedIds[112]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[113]) to 0xbd07b7ab42ce411a752db600604eca7fe5501947
            IERC721(address(hook)).transferFrom(deployer, 0xbd07b7ab42ce411a752db600604eca7fe5501947, mintedIds[113]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[114]) to 0x9f729294b308f79243285348a7be3f58ae5ed31a
            IERC721(address(hook)).transferFrom(deployer, 0x9f729294b308f79243285348a7be3f58ae5ed31a, mintedIds[114]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[115]) to 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2
            IERC721(address(hook)).transferFrom(deployer, 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2, mintedIds[115]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[116]) to 0x1c6d61f3d8976a8acdd311ecdfa533b8ecd0ac61
            IERC721(address(hook)).transferFrom(deployer, 0x1c6d61f3d8976a8acdd311ecdfa533b8ecd0ac61, mintedIds[116]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[117]) to 0x5138a42c3d5065debe950debda10c1f38150a908
            IERC721(address(hook)).transferFrom(deployer, 0x5138a42c3d5065debe950debda10c1f38150a908, mintedIds[117]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[118]) to 0xa5f8911d4cfd60a6697479f078409434424fe666
            IERC721(address(hook)).transferFrom(deployer, 0xa5f8911d4cfd60a6697479f078409434424fe666, mintedIds[118]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[119]) to 0x4a290f18c35bbfe97b2557cf765de9387726de39
            IERC721(address(hook)).transferFrom(deployer, 0x4a290f18c35bbfe97b2557cf765de9387726de39, mintedIds[119]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[120]) to 0xf0fe43a75ff248fd2e75d33fa1ebde71c6d1abad
            IERC721(address(hook)).transferFrom(deployer, 0xf0fe43a75ff248fd2e75d33fa1ebde71c6d1abad, mintedIds[120]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[121]) to 0x7044d88283c8fff0679b711c0cd81f1a6754c843
            IERC721(address(hook)).transferFrom(deployer, 0x7044d88283c8fff0679b711c0cd81f1a6754c843, mintedIds[121]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[122]) to 0xe21a272c4d22ed40678a0168b4acd006bca8a482
            IERC721(address(hook)).transferFrom(deployer, 0xe21a272c4d22ed40678a0168b4acd006bca8a482, mintedIds[122]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[123]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[123]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[124]) to 0x4a8a9147ab0df5a8949f964bdba22dc4583280e2
            IERC721(address(hook)).transferFrom(deployer, 0x4a8a9147ab0df5a8949f964bdba22dc4583280e2, mintedIds[124]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[125]) to 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2
            IERC721(address(hook)).transferFrom(deployer, 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2, mintedIds[125]);
            
            // Transfer UPC 11 (minted tokenId mintedIds[126]) to 0x1ae766cc5947e1e4c3538ee1f3f47063d2b40e79
            IERC721(address(hook)).transferFrom(deployer, 0x1ae766cc5947e1e4c3538ee1f3f47063d2b40e79, mintedIds[126]);
            
            // Transfer UPC 13 (minted tokenId mintedIds[127]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[127]);
            
            // Transfer UPC 13 (minted tokenId mintedIds[128]) to 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2
            IERC721(address(hook)).transferFrom(deployer, 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2, mintedIds[128]);
            
            // Transfer UPC 14 (minted tokenId mintedIds[129]) to 0x87084347aebadc626e8569e0d386928dade2ba09
            IERC721(address(hook)).transferFrom(deployer, 0x87084347aebadc626e8569e0d386928dade2ba09, mintedIds[129]);
            
            // Transfer UPC 14 (minted tokenId mintedIds[130]) to 0x15b61e9b0637f45dc0858f083cd240267924125d
            IERC721(address(hook)).transferFrom(deployer, 0x15b61e9b0637f45dc0858f083cd240267924125d, mintedIds[130]);
            
            // Transfer UPC 14 (minted tokenId mintedIds[131]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[131]);
            
            // Transfer UPC 17 (minted tokenId mintedIds[132]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[132]);
            
            // Transfer UPC 17 (minted tokenId mintedIds[133]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[133]);
            
            // Transfer UPC 17 (minted tokenId mintedIds[134]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[134]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[135]) to 0x0447ad1bdc0ffa06f7029c8e63f4de21e65255d2
            IERC721(address(hook)).transferFrom(deployer, 0x0447ad1bdc0ffa06f7029c8e63f4de21e65255d2, mintedIds[135]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[136]) to 0x516cafd745ec780d20f61c0d71fe258ea765222d
            IERC721(address(hook)).transferFrom(deployer, 0x516cafd745ec780d20f61c0d71fe258ea765222d, mintedIds[136]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[137]) to 0xa9d20b435a85faaa002f32d66f7d21564130e9cf
            IERC721(address(hook)).transferFrom(deployer, 0xa9d20b435a85faaa002f32d66f7d21564130e9cf, mintedIds[137]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[138]) to 0x87084347aebadc626e8569e0d386928dade2ba09
            IERC721(address(hook)).transferFrom(deployer, 0x87084347aebadc626e8569e0d386928dade2ba09, mintedIds[138]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[139]) to 0x08cf1208e638a5a3623be58d600e35c6199baa9c
            IERC721(address(hook)).transferFrom(deployer, 0x08cf1208e638a5a3623be58d600e35c6199baa9c, mintedIds[139]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[140]) to 0x4a8a9147ab0df5a8949f964bdba22dc4583280e2
            IERC721(address(hook)).transferFrom(deployer, 0x4a8a9147ab0df5a8949f964bdba22dc4583280e2, mintedIds[140]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[141]) to 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2
            IERC721(address(hook)).transferFrom(deployer, 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2, mintedIds[141]);
            
            // Transfer UPC 20 (minted tokenId mintedIds[142]) to 0x289715ffbb2f4b482e2917d2f183feab564ec84f
            IERC721(address(hook)).transferFrom(deployer, 0x289715ffbb2f4b482e2917d2f183feab564ec84f, mintedIds[142]);
            
            // Transfer UPC 20 (minted tokenId mintedIds[143]) to 0x79d1e7f1a6e0bbb3278a9d2b782e3a8983444cb6
            IERC721(address(hook)).transferFrom(deployer, 0x79d1e7f1a6e0bbb3278a9d2b782e3a8983444cb6, mintedIds[143]);
            
            // Transfer UPC 20 (minted tokenId mintedIds[144]) to 0x15b61e9b0637f45dc0858f083cd240267924125d
            IERC721(address(hook)).transferFrom(deployer, 0x15b61e9b0637f45dc0858f083cd240267924125d, mintedIds[144]);
            
            // Transfer UPC 20 (minted tokenId mintedIds[145]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[145]);
            
            // Transfer UPC 20 (minted tokenId mintedIds[146]) to 0xe21a272c4d22ed40678a0168b4acd006bca8a482
            IERC721(address(hook)).transferFrom(deployer, 0xe21a272c4d22ed40678a0168b4acd006bca8a482, mintedIds[146]);
            
            // Transfer UPC 20 (minted tokenId mintedIds[147]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[147]);
            
            // Transfer UPC 21 (minted tokenId mintedIds[148]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[148]);
            
            // Transfer UPC 23 (minted tokenId mintedIds[149]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[149]);
            
            // Transfer UPC 23 (minted tokenId mintedIds[150]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[150]);
            
            // Transfer UPC 25 (minted tokenId mintedIds[151]) to 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1
            IERC721(address(hook)).transferFrom(deployer, 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1, mintedIds[151]);
            
            // Transfer UPC 25 (minted tokenId mintedIds[152]) to 0xa9d20b435a85faaa002f32d66f7d21564130e9cf
            IERC721(address(hook)).transferFrom(deployer, 0xa9d20b435a85faaa002f32d66f7d21564130e9cf, mintedIds[152]);
            
            // Transfer UPC 25 (minted tokenId mintedIds[153]) to 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2
            IERC721(address(hook)).transferFrom(deployer, 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2, mintedIds[153]);
            
            // Transfer UPC 26 (minted tokenId mintedIds[154]) to 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2
            IERC721(address(hook)).transferFrom(deployer, 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2, mintedIds[154]);
            
            // Transfer UPC 26 (minted tokenId mintedIds[155]) to 0x1c6d61f3d8976a8acdd311ecdfa533b8ecd0ac61
            IERC721(address(hook)).transferFrom(deployer, 0x1c6d61f3d8976a8acdd311ecdfa533b8ecd0ac61, mintedIds[155]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[156]) to 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07
            IERC721(address(hook)).transferFrom(deployer, 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07, mintedIds[156]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[157]) to 0x0447ad1bdc0ffa06f7029c8e63f4de21e65255d2
            IERC721(address(hook)).transferFrom(deployer, 0x0447ad1bdc0ffa06f7029c8e63f4de21e65255d2, mintedIds[157]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[158]) to 0x87084347aebadc626e8569e0d386928dade2ba09
            IERC721(address(hook)).transferFrom(deployer, 0x87084347aebadc626e8569e0d386928dade2ba09, mintedIds[158]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[159]) to 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e
            IERC721(address(hook)).transferFrom(deployer, 0x7be8c264c9dceba3a35990c78d5c4220d8724b6e, mintedIds[159]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[160]) to 0x08cf1208e638a5a3623be58d600e35c6199baa9c
            IERC721(address(hook)).transferFrom(deployer, 0x08cf1208e638a5a3623be58d600e35c6199baa9c, mintedIds[160]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[161]) to 0x4a8a9147ab0df5a8949f964bdba22dc4583280e2
            IERC721(address(hook)).transferFrom(deployer, 0x4a8a9147ab0df5a8949f964bdba22dc4583280e2, mintedIds[161]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[162]) to 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2
            IERC721(address(hook)).transferFrom(deployer, 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2, mintedIds[162]);
            
            // Transfer UPC 29 (minted tokenId mintedIds[163]) to 0x1ae766cc5947e1e4c3538ee1f3f47063d2b40e79
            IERC721(address(hook)).transferFrom(deployer, 0x1ae766cc5947e1e4c3538ee1f3f47063d2b40e79, mintedIds[163]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[164]) to 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59
            IERC721(address(hook)).transferFrom(deployer, 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59, mintedIds[164]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[165]) to 0xf0fe43a75ff248fd2e75d33fa1ebde71c6d1abad
            IERC721(address(hook)).transferFrom(deployer, 0xf0fe43a75ff248fd2e75d33fa1ebde71c6d1abad, mintedIds[165]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[166]) to 0x08ceb8bba685ee708c9c4c65576837cbe19b9dea
            IERC721(address(hook)).transferFrom(deployer, 0x08ceb8bba685ee708c9c4c65576837cbe19b9dea, mintedIds[166]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[167]) to 0x08cf1208e638a5a3623be58d600e35c6199baa9c
            IERC721(address(hook)).transferFrom(deployer, 0x08cf1208e638a5a3623be58d600e35c6199baa9c, mintedIds[167]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[168]) to 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2
            IERC721(address(hook)).transferFrom(deployer, 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2, mintedIds[168]);
            
            // Transfer UPC 32 (minted tokenId mintedIds[169]) to 0x45c3d8aacc0d537dac234ad4c20ef05d6041cefe
            IERC721(address(hook)).transferFrom(deployer, 0x45c3d8aacc0d537dac234ad4c20ef05d6041cefe, mintedIds[169]);
            
            // Transfer UPC 32 (minted tokenId mintedIds[170]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[170]);
            
            // Transfer UPC 33 (minted tokenId mintedIds[171]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[171]);
            
            // Transfer UPC 35 (minted tokenId mintedIds[172]) to 0xa9d20b435a85faaa002f32d66f7d21564130e9cf
            IERC721(address(hook)).transferFrom(deployer, 0xa9d20b435a85faaa002f32d66f7d21564130e9cf, mintedIds[172]);
            
            // Transfer UPC 35 (minted tokenId mintedIds[173]) to 0x15b61e9b0637f45dc0858f083cd240267924125d
            IERC721(address(hook)).transferFrom(deployer, 0x15b61e9b0637f45dc0858f083cd240267924125d, mintedIds[173]);
            
            // Transfer UPC 35 (minted tokenId mintedIds[174]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[174]);
            
            // Transfer UPC 37 (minted tokenId mintedIds[175]) to 0x1ae766cc5947e1e4c3538ee1f3f47063d2b40e79
            IERC721(address(hook)).transferFrom(deployer, 0x1ae766cc5947e1e4c3538ee1f3f47063d2b40e79, mintedIds[175]);
            
            // Transfer UPC 37 (minted tokenId mintedIds[176]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[176]);
            
            // Transfer UPC 39 (minted tokenId mintedIds[177]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[177]);
            
            // Transfer UPC 40 (minted tokenId mintedIds[178]) to 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2
            IERC721(address(hook)).transferFrom(deployer, 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2, mintedIds[178]);
            
            // Transfer UPC 40 (minted tokenId mintedIds[179]) to 0x1c6d61f3d8976a8acdd311ecdfa533b8ecd0ac61
            IERC721(address(hook)).transferFrom(deployer, 0x1c6d61f3d8976a8acdd311ecdfa533b8ecd0ac61, mintedIds[179]);
            
            // Transfer UPC 41 (minted tokenId mintedIds[180]) to 0x1c6d61f3d8976a8acdd311ecdfa533b8ecd0ac61
            IERC721(address(hook)).transferFrom(deployer, 0x1c6d61f3d8976a8acdd311ecdfa533b8ecd0ac61, mintedIds[180]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[181]) to 0x961d4191965c49537c88f764d88318872ce405be
            IERC721(address(hook)).transferFrom(deployer, 0x961d4191965c49537c88f764d88318872ce405be, mintedIds[181]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[182]) to 0xf0fe43a75ff248fd2e75d33fa1ebde71c6d1abad
            IERC721(address(hook)).transferFrom(deployer, 0xf0fe43a75ff248fd2e75d33fa1ebde71c6d1abad, mintedIds[182]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[183]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[183]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[184]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[184]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[185]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[185]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[186]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[186]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[187]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[187]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[188]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[188]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[189]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[189]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[190]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[190]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[191]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[191]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[192]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[192]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[193]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[193]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[194]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[194]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[195]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[195]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[196]) to 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2
            IERC721(address(hook)).transferFrom(deployer, 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2, mintedIds[196]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[197]) to 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07
            IERC721(address(hook)).transferFrom(deployer, 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07, mintedIds[197]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[198]) to 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1
            IERC721(address(hook)).transferFrom(deployer, 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1, mintedIds[198]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[199]) to 0x1786d033d5cbcc235b673e872c7613c2f83da583
            IERC721(address(hook)).transferFrom(deployer, 0x1786d033d5cbcc235b673e872c7613c2f83da583, mintedIds[199]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[200]) to 0x1ae766cc5947e1e4c3538ee1f3f47063d2b40e79
            IERC721(address(hook)).transferFrom(deployer, 0x1ae766cc5947e1e4c3538ee1f3f47063d2b40e79, mintedIds[200]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[201]) to 0x4a8a9147ab0df5a8949f964bdba22dc4583280e2
            IERC721(address(hook)).transferFrom(deployer, 0x4a8a9147ab0df5a8949f964bdba22dc4583280e2, mintedIds[201]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[202]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[202]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[203]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[203]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[204]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[204]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[205]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[205]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[206]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[206]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[207]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[207]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[208]) to 0x4a290f18c35bbfe97b2557cf765de9387726de39
            IERC721(address(hook)).transferFrom(deployer, 0x4a290f18c35bbfe97b2557cf765de9387726de39, mintedIds[208]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[209]) to 0x38eed3cceed88f380e436eb21811250797c453c5
            IERC721(address(hook)).transferFrom(deployer, 0x38eed3cceed88f380e436eb21811250797c453c5, mintedIds[209]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[210]) to 0xa9d20b435a85faaa002f32d66f7d21564130e9cf
            IERC721(address(hook)).transferFrom(deployer, 0xa9d20b435a85faaa002f32d66f7d21564130e9cf, mintedIds[210]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[211]) to 0x45c3d8aacc0d537dac234ad4c20ef05d6041cefe
            IERC721(address(hook)).transferFrom(deployer, 0x45c3d8aacc0d537dac234ad4c20ef05d6041cefe, mintedIds[211]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[212]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[212]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[213]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[213]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[214]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[214]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[215]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[215]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[216]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[216]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[217]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[217]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[218]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[218]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[219]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[219]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[220]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[220]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[221]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[221]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[222]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[222]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[223]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[223]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[224]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[224]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[225]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[225]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[226]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[226]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[227]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[227]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[228]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[228]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[229]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[229]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[230]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[230]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[231]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[231]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[232]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[232]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[233]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[233]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[234]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[234]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[235]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[235]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[236]) to 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2
            IERC721(address(hook)).transferFrom(deployer, 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2, mintedIds[236]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[237]) to 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59
            IERC721(address(hook)).transferFrom(deployer, 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59, mintedIds[237]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[238]) to 0x0447ad1bdc0ffa06f7029c8e63f4de21e65255d2
            IERC721(address(hook)).transferFrom(deployer, 0x0447ad1bdc0ffa06f7029c8e63f4de21e65255d2, mintedIds[238]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[239]) to 0x08cf1208e638a5a3623be58d600e35c6199baa9c
            IERC721(address(hook)).transferFrom(deployer, 0x08cf1208e638a5a3623be58d600e35c6199baa9c, mintedIds[239]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[240]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[240]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[241]) to 0xe21a272c4d22ed40678a0168b4acd006bca8a482
            IERC721(address(hook)).transferFrom(deployer, 0xe21a272c4d22ed40678a0168b4acd006bca8a482, mintedIds[241]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[242]) to 0x45c3d8aacc0d537dac234ad4c20ef05d6041cefe
            IERC721(address(hook)).transferFrom(deployer, 0x45c3d8aacc0d537dac234ad4c20ef05d6041cefe, mintedIds[242]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[243]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[243]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[244]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[244]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[245]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[245]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[246]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[246]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[247]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[247]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[248]) to 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2
            IERC721(address(hook)).transferFrom(deployer, 0x35a21f7c053aed0dcf9e24bfb100aca163aeddb2, mintedIds[248]);
            
            // Transfer UPC 48 (minted tokenId mintedIds[249]) to 0x15b61e9b0637f45dc0858f083cd240267924125d
            IERC721(address(hook)).transferFrom(deployer, 0x15b61e9b0637f45dc0858f083cd240267924125d, mintedIds[249]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[250]) to 0x08cf1208e638a5a3623be58d600e35c6199baa9c
            IERC721(address(hook)).transferFrom(deployer, 0x08cf1208e638a5a3623be58d600e35c6199baa9c, mintedIds[250]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[251]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[251]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[252]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[252]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[253]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[253]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[254]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[254]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[255]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[255]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[256]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[256]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[257]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[257]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[258]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[258]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[259]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[259]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[260]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[260]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[261]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[261]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[262]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[262]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[263]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[263]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[264]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[264]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[265]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[265]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[266]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[266]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[267]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[267]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[268]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[268]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[269]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[269]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[270]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[270]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[271]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[271]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[272]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[272]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[273]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[273]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[274]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[274]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[275]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[275]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[276]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[276]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[277]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[277]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[278]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[278]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[279]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[279]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[280]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[280]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[281]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[281]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[282]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[282]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[283]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[283]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[284]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[284]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[285]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[285]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[286]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[286]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[287]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[287]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[288]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[288]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[289]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[289]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[290]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[290]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[291]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[291]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[292]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[292]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[293]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[293]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[294]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[294]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[295]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[295]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[296]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[296]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[297]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[297]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[298]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[298]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[299]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[299]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[300]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[300]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[301]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[301]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[302]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[302]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[303]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[303]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[304]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[304]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[305]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[305]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[306]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[306]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[307]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[307]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[308]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[308]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[309]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[309]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[310]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[310]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[311]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[311]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[312]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[312]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[313]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[313]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[314]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[314]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[315]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[315]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[316]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[316]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[317]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[317]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[318]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[318]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[319]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[319]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[320]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[320]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[321]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[321]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[322]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[322]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[323]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[323]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[324]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[324]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[325]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[325]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[326]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[326]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[327]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[327]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[328]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[328]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[329]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[329]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[330]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[330]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[331]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[331]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[332]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[332]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[333]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[333]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[334]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[334]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[335]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[335]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[336]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[336]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[337]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[337]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[338]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[338]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[339]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[339]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[340]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[340]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[341]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[341]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[342]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[342]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[343]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[343]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[344]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[344]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[345]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[345]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[346]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[346]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[347]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[347]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[348]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[348]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[349]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[349]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[350]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[350]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[351]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[351]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[352]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[352]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[353]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[353]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[354]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[354]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[355]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[355]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[356]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[356]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[357]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[357]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[358]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[358]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[359]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[359]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[360]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[360]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[361]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[361]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[362]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[362]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[363]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[363]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[364]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[364]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[365]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[365]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[366]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[366]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[367]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[367]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[368]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[368]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[369]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[369]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[370]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[370]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[371]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[371]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[372]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[372]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[373]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[373]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[374]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[374]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[375]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[375]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[376]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[376]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[377]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[377]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[378]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[378]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[379]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[379]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[380]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[380]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[381]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[381]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[382]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[382]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[383]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[383]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[384]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[384]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[385]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[385]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[386]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[386]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[387]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[387]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[388]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[388]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[389]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[389]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[390]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[390]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[391]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[391]);
            
            // Transfer UPC 5 (minted tokenId mintedIds[392]) to 0x1ae766cc5947e1e4c3538ee1f3f47063d2b40e79
            IERC721(address(hook)).transferFrom(deployer, 0x1ae766cc5947e1e4c3538ee1f3f47063d2b40e79, mintedIds[392]);
            
            // Transfer UPC 5 (minted tokenId mintedIds[393]) to 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad
            IERC721(address(hook)).transferFrom(deployer, 0x823b92d6a4b2aed4b15675c7917c9f922ea8adad, mintedIds[393]);
            
            // Transfer UPC 6 (minted tokenId mintedIds[394]) to 0xa9d20b435a85faaa002f32d66f7d21564130e9cf
            IERC721(address(hook)).transferFrom(deployer, 0xa9d20b435a85faaa002f32d66f7d21564130e9cf, mintedIds[394]);
            
            // Transfer UPC 6 (minted tokenId mintedIds[395]) to 0x1ae766cc5947e1e4c3538ee1f3f47063d2b40e79
            IERC721(address(hook)).transferFrom(deployer, 0x1ae766cc5947e1e4c3538ee1f3f47063d2b40e79, mintedIds[395]);
            
            // Transfer UPC 6 (minted tokenId mintedIds[396]) to 0x15b61e9b0637f45dc0858f083cd240267924125d
            IERC721(address(hook)).transferFrom(deployer, 0x15b61e9b0637f45dc0858f083cd240267924125d, mintedIds[396]);
            
            // Transfer UPC 6 (minted tokenId mintedIds[397]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[397]);
            
            // Transfer UPC 6 (minted tokenId mintedIds[398]) to 0xe21a272c4d22ed40678a0168b4acd006bca8a482
            IERC721(address(hook)).transferFrom(deployer, 0xe21a272c4d22ed40678a0168b4acd006bca8a482, mintedIds[398]);
            
            return;
        }
        if (chainId == 10) {
            // Optimism migration
            console.log("Migrating 11 items on Optimism");
            
            // Step 1: Mint all assets to deployer initially
            
            console.log("Minting tierIds to deployer");
            
            // Create array of all tierIds to mint
            uint256[] memory allTierIds = new uint256[](11);
            uint256 tierIndex = 0;
            
            // Add 2 instances of UPC 3
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 3;
                tierIndex++;
            }
            // Add 3 instances of UPC 4
            for (uint256 i = 0; i < 3; i++) {
                allTierIds[tierIndex] = 4;
                tierIndex++;
            }
            // Add 1 instances of UPC 11
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 11;
                tierIndex++;
            }
            // Add 1 instances of UPC 17
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 17;
                tierIndex++;
            }
            // Add 1 instances of UPC 19
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 19;
                tierIndex++;
            }
            // Add 1 instances of UPC 25
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 25;
                tierIndex++;
            }
            // Add 1 instances of UPC 44
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 44;
                tierIndex++;
            }
            // Add 1 instances of UPC 47
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 47;
                tierIndex++;
            }
            
            // Mint all tierIds at once
            uint256[] memory mintedIds = hook.mintFor(allTierIds, deployer);
            
            // UPC 3 minted tokenIds (2 items)
            uint256[] memory upc3MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc3MintedIds[i] = mintedIds[0 + i];
            }
            // UPC 4 minted tokenIds (3 items)
            uint256[] memory upc4MintedIds = new uint256[](3);
            for (uint256 i = 0; i < 3; i++) {
                upc4MintedIds[i] = mintedIds[2 + i];
            }
            // UPC 11 minted tokenIds (1 items)
            uint256[] memory upc11MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc11MintedIds[i] = mintedIds[5 + i];
            }
            // UPC 17 minted tokenIds (1 items)
            uint256[] memory upc17MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc17MintedIds[i] = mintedIds[6 + i];
            }
            // UPC 19 minted tokenIds (1 items)
            uint256[] memory upc19MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc19MintedIds[i] = mintedIds[7 + i];
            }
            // UPC 25 minted tokenIds (1 items)
            uint256[] memory upc25MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc25MintedIds[i] = mintedIds[8 + i];
            }
            // UPC 44 minted tokenIds (1 items)
            uint256[] memory upc44MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc44MintedIds[i] = mintedIds[9 + i];
            }
            // UPC 47 minted tokenIds (1 items)
            uint256[] memory upc47MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc47MintedIds[i] = mintedIds[10 + i];
            }
            // Step 2: Process each Banny body and dress them
            console.log("Processing 5 Banny bodies...");
            
            // Dress Banny 3000000001 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc11MintedIds[0]; // V4: 11000000001 -> V5: upc11MintedIds[0]
                outfitIds[1] = upc19MintedIds[0]; // V4: 19000000001 -> V5: upc19MintedIds[0]
                outfitIds[2] = upc25MintedIds[0]; // V4: 25000000001 -> V5: upc25MintedIds[0]
                outfitIds[3] = upc44MintedIds[0]; // V4: 44000000001 -> V5: upc44MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000001,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000001 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc47MintedIds[0]; // V4: 47000000001 -> V5: upc47MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000001,
                    0,
                    outfitIds
                );
            }
            
            // Step 3: Transfer all assets to rightful owners
            console.log("Transferring %d tokens to rightful owners", mintedIds.length);
            
            // Transfer UPC 3 (minted tokenId mintedIds[0]) to 0x25910143c255828f623786f46fe9a8941b7983bb
            IERC721(address(hook)).transferFrom(deployer, 0x25910143c255828f623786f46fe9a8941b7983bb, mintedIds[0]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[1]) to 0x292ff025168d2b51f0ef49f164d281c36761ba2b
            IERC721(address(hook)).transferFrom(deployer, 0x292ff025168d2b51f0ef49f164d281c36761ba2b, mintedIds[1]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[2]) to 0xa7a5a2745f10d5c23d75a6fd228a408cede1cae5
            IERC721(address(hook)).transferFrom(deployer, 0xa7a5a2745f10d5c23d75a6fd228a408cede1cae5, mintedIds[2]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[3]) to 0x57700212b1cb7b67bd7df3801da43ca634513fe0
            IERC721(address(hook)).transferFrom(deployer, 0x57700212b1cb7b67bd7df3801da43ca634513fe0, mintedIds[3]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[4]) to 0x292ff025168d2b51f0ef49f164d281c36761ba2b
            IERC721(address(hook)).transferFrom(deployer, 0x292ff025168d2b51f0ef49f164d281c36761ba2b, mintedIds[4]);
            
            // Transfer UPC 17 (minted tokenId mintedIds[5]) to 0xa2fa6144168751d116336b58c5288feaf8bb12c1
            IERC721(address(hook)).transferFrom(deployer, 0xa2fa6144168751d116336b58c5288feaf8bb12c1, mintedIds[5]);
            
            return;
        }
        if (chainId == 8453) {
            // Base migration
            console.log("Migrating 228 items on Base");
            
            // Step 1: Mint all assets to deployer initially
            
            console.log("Minting tierIds to deployer");
            
            // Create array of all tierIds to mint
            uint256[] memory allTierIds = new uint256[](228);
            uint256 tierIndex = 0;
            
            // Add 3 instances of UPC 2
            for (uint256 i = 0; i < 3; i++) {
                allTierIds[tierIndex] = 2;
                tierIndex++;
            }
            // Add 10 instances of UPC 3
            for (uint256 i = 0; i < 10; i++) {
                allTierIds[tierIndex] = 3;
                tierIndex++;
            }
            // Add 94 instances of UPC 4
            for (uint256 i = 0; i < 94; i++) {
                allTierIds[tierIndex] = 4;
                tierIndex++;
            }
            // Add 5 instances of UPC 5
            for (uint256 i = 0; i < 5; i++) {
                allTierIds[tierIndex] = 5;
                tierIndex++;
            }
            // Add 5 instances of UPC 6
            for (uint256 i = 0; i < 5; i++) {
                allTierIds[tierIndex] = 6;
                tierIndex++;
            }
            // Add 1 instances of UPC 7
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 7;
                tierIndex++;
            }
            // Add 11 instances of UPC 10
            for (uint256 i = 0; i < 11; i++) {
                allTierIds[tierIndex] = 10;
                tierIndex++;
            }
            // Add 3 instances of UPC 11
            for (uint256 i = 0; i < 3; i++) {
                allTierIds[tierIndex] = 11;
                tierIndex++;
            }
            // Add 2 instances of UPC 13
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 13;
                tierIndex++;
            }
            // Add 4 instances of UPC 14
            for (uint256 i = 0; i < 4; i++) {
                allTierIds[tierIndex] = 14;
                tierIndex++;
            }
            // Add 2 instances of UPC 15
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 15;
                tierIndex++;
            }
            // Add 1 instances of UPC 17
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 17;
                tierIndex++;
            }
            // Add 12 instances of UPC 19
            for (uint256 i = 0; i < 12; i++) {
                allTierIds[tierIndex] = 19;
                tierIndex++;
            }
            // Add 1 instances of UPC 20
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 20;
                tierIndex++;
            }
            // Add 1 instances of UPC 24
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 24;
                tierIndex++;
            }
            // Add 9 instances of UPC 25
            for (uint256 i = 0; i < 9; i++) {
                allTierIds[tierIndex] = 25;
                tierIndex++;
            }
            // Add 1 instances of UPC 27
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 27;
                tierIndex++;
            }
            // Add 10 instances of UPC 28
            for (uint256 i = 0; i < 10; i++) {
                allTierIds[tierIndex] = 28;
                tierIndex++;
            }
            // Add 6 instances of UPC 31
            for (uint256 i = 0; i < 6; i++) {
                allTierIds[tierIndex] = 31;
                tierIndex++;
            }
            // Add 2 instances of UPC 32
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 32;
                tierIndex++;
            }
            // Add 1 instances of UPC 33
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 33;
                tierIndex++;
            }
            // Add 1 instances of UPC 34
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 34;
                tierIndex++;
            }
            // Add 4 instances of UPC 35
            for (uint256 i = 0; i < 4; i++) {
                allTierIds[tierIndex] = 35;
                tierIndex++;
            }
            // Add 2 instances of UPC 37
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 37;
                tierIndex++;
            }
            // Add 3 instances of UPC 38
            for (uint256 i = 0; i < 3; i++) {
                allTierIds[tierIndex] = 38;
                tierIndex++;
            }
            // Add 2 instances of UPC 39
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 39;
                tierIndex++;
            }
            // Add 3 instances of UPC 40
            for (uint256 i = 0; i < 3; i++) {
                allTierIds[tierIndex] = 40;
                tierIndex++;
            }
            // Add 2 instances of UPC 41
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 41;
                tierIndex++;
            }
            // Add 2 instances of UPC 42
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 42;
                tierIndex++;
            }
            // Add 8 instances of UPC 43
            for (uint256 i = 0; i < 8; i++) {
                allTierIds[tierIndex] = 43;
                tierIndex++;
            }
            // Add 5 instances of UPC 44
            for (uint256 i = 0; i < 5; i++) {
                allTierIds[tierIndex] = 44;
                tierIndex++;
            }
            // Add 1 instances of UPC 45
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 45;
                tierIndex++;
            }
            // Add 8 instances of UPC 47
            for (uint256 i = 0; i < 8; i++) {
                allTierIds[tierIndex] = 47;
                tierIndex++;
            }
            // Add 1 instances of UPC 48
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 48;
                tierIndex++;
            }
            // Add 2 instances of UPC 49
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 49;
                tierIndex++;
            }
            
            // Mint all tierIds at once
            uint256[] memory mintedIds = hook.mintFor(allTierIds, deployer);
            
            // UPC 2 minted tokenIds (3 items)
            uint256[] memory upc2MintedIds = new uint256[](3);
            for (uint256 i = 0; i < 3; i++) {
                upc2MintedIds[i] = mintedIds[0 + i];
            }
            // UPC 3 minted tokenIds (10 items)
            uint256[] memory upc3MintedIds = new uint256[](10);
            for (uint256 i = 0; i < 10; i++) {
                upc3MintedIds[i] = mintedIds[3 + i];
            }
            // UPC 4 minted tokenIds (94 items)
            uint256[] memory upc4MintedIds = new uint256[](94);
            for (uint256 i = 0; i < 94; i++) {
                upc4MintedIds[i] = mintedIds[13 + i];
            }
            // UPC 5 minted tokenIds (5 items)
            uint256[] memory upc5MintedIds = new uint256[](5);
            for (uint256 i = 0; i < 5; i++) {
                upc5MintedIds[i] = mintedIds[107 + i];
            }
            // UPC 6 minted tokenIds (5 items)
            uint256[] memory upc6MintedIds = new uint256[](5);
            for (uint256 i = 0; i < 5; i++) {
                upc6MintedIds[i] = mintedIds[112 + i];
            }
            // UPC 7 minted tokenIds (1 items)
            uint256[] memory upc7MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc7MintedIds[i] = mintedIds[117 + i];
            }
            // UPC 10 minted tokenIds (11 items)
            uint256[] memory upc10MintedIds = new uint256[](11);
            for (uint256 i = 0; i < 11; i++) {
                upc10MintedIds[i] = mintedIds[118 + i];
            }
            // UPC 11 minted tokenIds (3 items)
            uint256[] memory upc11MintedIds = new uint256[](3);
            for (uint256 i = 0; i < 3; i++) {
                upc11MintedIds[i] = mintedIds[129 + i];
            }
            // UPC 13 minted tokenIds (2 items)
            uint256[] memory upc13MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc13MintedIds[i] = mintedIds[132 + i];
            }
            // UPC 14 minted tokenIds (4 items)
            uint256[] memory upc14MintedIds = new uint256[](4);
            for (uint256 i = 0; i < 4; i++) {
                upc14MintedIds[i] = mintedIds[134 + i];
            }
            // UPC 15 minted tokenIds (2 items)
            uint256[] memory upc15MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc15MintedIds[i] = mintedIds[138 + i];
            }
            // UPC 17 minted tokenIds (1 items)
            uint256[] memory upc17MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc17MintedIds[i] = mintedIds[140 + i];
            }
            // UPC 19 minted tokenIds (12 items)
            uint256[] memory upc19MintedIds = new uint256[](12);
            for (uint256 i = 0; i < 12; i++) {
                upc19MintedIds[i] = mintedIds[141 + i];
            }
            // UPC 20 minted tokenIds (1 items)
            uint256[] memory upc20MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc20MintedIds[i] = mintedIds[153 + i];
            }
            // UPC 24 minted tokenIds (1 items)
            uint256[] memory upc24MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc24MintedIds[i] = mintedIds[154 + i];
            }
            // UPC 25 minted tokenIds (9 items)
            uint256[] memory upc25MintedIds = new uint256[](9);
            for (uint256 i = 0; i < 9; i++) {
                upc25MintedIds[i] = mintedIds[155 + i];
            }
            // UPC 27 minted tokenIds (1 items)
            uint256[] memory upc27MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc27MintedIds[i] = mintedIds[164 + i];
            }
            // UPC 28 minted tokenIds (10 items)
            uint256[] memory upc28MintedIds = new uint256[](10);
            for (uint256 i = 0; i < 10; i++) {
                upc28MintedIds[i] = mintedIds[165 + i];
            }
            // UPC 31 minted tokenIds (6 items)
            uint256[] memory upc31MintedIds = new uint256[](6);
            for (uint256 i = 0; i < 6; i++) {
                upc31MintedIds[i] = mintedIds[175 + i];
            }
            // UPC 32 minted tokenIds (2 items)
            uint256[] memory upc32MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc32MintedIds[i] = mintedIds[181 + i];
            }
            // UPC 33 minted tokenIds (1 items)
            uint256[] memory upc33MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc33MintedIds[i] = mintedIds[183 + i];
            }
            // UPC 34 minted tokenIds (1 items)
            uint256[] memory upc34MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc34MintedIds[i] = mintedIds[184 + i];
            }
            // UPC 35 minted tokenIds (4 items)
            uint256[] memory upc35MintedIds = new uint256[](4);
            for (uint256 i = 0; i < 4; i++) {
                upc35MintedIds[i] = mintedIds[185 + i];
            }
            // UPC 37 minted tokenIds (2 items)
            uint256[] memory upc37MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc37MintedIds[i] = mintedIds[189 + i];
            }
            // UPC 38 minted tokenIds (3 items)
            uint256[] memory upc38MintedIds = new uint256[](3);
            for (uint256 i = 0; i < 3; i++) {
                upc38MintedIds[i] = mintedIds[191 + i];
            }
            // UPC 39 minted tokenIds (2 items)
            uint256[] memory upc39MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc39MintedIds[i] = mintedIds[194 + i];
            }
            // UPC 40 minted tokenIds (3 items)
            uint256[] memory upc40MintedIds = new uint256[](3);
            for (uint256 i = 0; i < 3; i++) {
                upc40MintedIds[i] = mintedIds[196 + i];
            }
            // UPC 41 minted tokenIds (2 items)
            uint256[] memory upc41MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc41MintedIds[i] = mintedIds[199 + i];
            }
            // UPC 42 minted tokenIds (2 items)
            uint256[] memory upc42MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc42MintedIds[i] = mintedIds[201 + i];
            }
            // UPC 43 minted tokenIds (8 items)
            uint256[] memory upc43MintedIds = new uint256[](8);
            for (uint256 i = 0; i < 8; i++) {
                upc43MintedIds[i] = mintedIds[203 + i];
            }
            // UPC 44 minted tokenIds (5 items)
            uint256[] memory upc44MintedIds = new uint256[](5);
            for (uint256 i = 0; i < 5; i++) {
                upc44MintedIds[i] = mintedIds[211 + i];
            }
            // UPC 45 minted tokenIds (1 items)
            uint256[] memory upc45MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc45MintedIds[i] = mintedIds[216 + i];
            }
            // UPC 47 minted tokenIds (8 items)
            uint256[] memory upc47MintedIds = new uint256[](8);
            for (uint256 i = 0; i < 8; i++) {
                upc47MintedIds[i] = mintedIds[217 + i];
            }
            // UPC 48 minted tokenIds (1 items)
            uint256[] memory upc48MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc48MintedIds[i] = mintedIds[225 + i];
            }
            // UPC 49 minted tokenIds (2 items)
            uint256[] memory upc49MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc49MintedIds[i] = mintedIds[226 + i];
            }
            // Step 2: Process each Banny body and dress them
            console.log("Processing 107 Banny bodies...");
            
            // Dress Banny 2000000001 (Pink)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc28MintedIds[1]; // V4: 28000000002 -> V5: upc28MintedIds[1]
                outfitIds[1] = upc37MintedIds[0]; // V4: 37000000001 -> V5: upc37MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    2000000001,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 2000000002 (Pink)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc14MintedIds[1]; // V4: 14000000002 -> V5: upc14MintedIds[1]
                outfitIds[1] = upc32MintedIds[0]; // V4: 32000000001 -> V5: upc32MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    2000000002,
                    upc6MintedIds[0],
                    outfitIds
                );
            }
            
            // Dress Banny 2000000003 (Pink)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc25MintedIds[7]; // V4: 25000000008 -> V5: upc25MintedIds[7]
                outfitIds[1] = upc37MintedIds[1]; // V4: 37000000002 -> V5: upc37MintedIds[1]
                outfitIds[2] = upc45MintedIds[0]; // V4: 45000000001 -> V5: upc45MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    2000000003,
                    upc6MintedIds[3],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000001 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc25MintedIds[3]; // V4: 25000000004 -> V5: upc25MintedIds[3]
                outfitIds[1] = upc47MintedIds[2]; // V4: 47000000003 -> V5: upc47MintedIds[2]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000001,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 3000000002 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc31MintedIds[1]; // V4: 31000000002 -> V5: upc31MintedIds[1]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000002,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 3000000003 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc10MintedIds[4]; // V4: 10000000005 -> V5: upc10MintedIds[4]
                outfitIds[1] = upc19MintedIds[4]; // V4: 19000000005 -> V5: upc19MintedIds[4]
                outfitIds[2] = upc28MintedIds[4]; // V4: 28000000005 -> V5: upc28MintedIds[4]
                outfitIds[3] = upc47MintedIds[4]; // V4: 47000000005 -> V5: upc47MintedIds[4]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000003,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 3000000006 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc14MintedIds[2]; // V4: 14000000003 -> V5: upc14MintedIds[2]
                outfitIds[1] = upc19MintedIds[6]; // V4: 19000000007 -> V5: upc19MintedIds[6]
                outfitIds[2] = upc28MintedIds[0]; // V4: 28000000001 -> V5: upc28MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000006,
                    upc6MintedIds[2],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000007 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc19MintedIds[8]; // V4: 19000000009 -> V5: upc19MintedIds[8]
                outfitIds[1] = upc28MintedIds[6]; // V4: 28000000007 -> V5: upc28MintedIds[6]
                outfitIds[2] = upc44MintedIds[4]; // V4: 44000000005 -> V5: upc44MintedIds[4]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000007,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 3000000008 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc15MintedIds[1]; // V4: 15000000002 -> V5: upc15MintedIds[1]
                outfitIds[1] = upc40MintedIds[0]; // V4: 40000000001 -> V5: upc40MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000008,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 3000000010 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc25MintedIds[8]; // V4: 25000000009 -> V5: upc25MintedIds[8]
                outfitIds[1] = upc43MintedIds[7]; // V4: 43000000008 -> V5: upc43MintedIds[7]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000010,
                    upc5MintedIds[3],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000001 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc15MintedIds[0]; // V4: 15000000001 -> V5: upc15MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000001,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000003 (Original)
            {
                uint256[] memory outfitIds = new uint256[](5);
                                outfitIds[0] = upc11MintedIds[0]; // V4: 11000000001 -> V5: upc11MintedIds[0]
                outfitIds[1] = upc19MintedIds[0]; // V4: 19000000001 -> V5: upc19MintedIds[0]
                outfitIds[2] = upc25MintedIds[0]; // V4: 25000000001 -> V5: upc25MintedIds[0]
                outfitIds[3] = upc33MintedIds[0]; // V4: 33000000001 -> V5: upc33MintedIds[0]
                outfitIds[4] = upc44MintedIds[0]; // V4: 44000000001 -> V5: upc44MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000003,
                    upc6MintedIds[4],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000045 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc10MintedIds[0]; // V4: 10000000001 -> V5: upc10MintedIds[0]
                outfitIds[1] = upc25MintedIds[1]; // V4: 25000000002 -> V5: upc25MintedIds[1]
                outfitIds[2] = upc43MintedIds[1]; // V4: 43000000002 -> V5: upc43MintedIds[1]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000045,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000046 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc47MintedIds[0]; // V4: 47000000001 -> V5: upc47MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000046,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000048 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc10MintedIds[2]; // V4: 10000000003 -> V5: upc10MintedIds[2]
                outfitIds[1] = upc19MintedIds[2]; // V4: 19000000003 -> V5: upc19MintedIds[2]
                outfitIds[2] = upc28MintedIds[3]; // V4: 28000000004 -> V5: upc28MintedIds[3]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000048,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000049 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc10MintedIds[3]; // V4: 10000000004 -> V5: upc10MintedIds[3]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000049,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000050 (Original)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc14MintedIds[0]; // V4: 14000000001 -> V5: upc14MintedIds[0]
                outfitIds[1] = upc31MintedIds[0]; // V4: 31000000001 -> V5: upc31MintedIds[0]
                outfitIds[2] = upc38MintedIds[0]; // V4: 38000000001 -> V5: upc38MintedIds[0]
                outfitIds[3] = upc43MintedIds[2]; // V4: 43000000003 -> V5: upc43MintedIds[2]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000050,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000054 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc25MintedIds[4]; // V4: 25000000005 -> V5: upc25MintedIds[4]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000054,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000060 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = 0; // Fallback: using V4 outfitId

                resolver.decorateBannyWith(
                    address(hook),
                    4000000060,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000073 (Original)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc10MintedIds[6]; // V4: 10000000007 -> V5: upc10MintedIds[6]
                outfitIds[1] = upc19MintedIds[5]; // V4: 19000000006 -> V5: upc19MintedIds[5]
                outfitIds[2] = upc25MintedIds[5]; // V4: 25000000006 -> V5: upc25MintedIds[5]
                outfitIds[3] = upc43MintedIds[4]; // V4: 43000000005 -> V5: upc43MintedIds[4]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000073,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000079 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc27MintedIds[0]; // V4: 27000000001 -> V5: upc27MintedIds[0]
                outfitIds[1] = upc38MintedIds[1]; // V4: 38000000002 -> V5: upc38MintedIds[1]
                outfitIds[2] = upc48MintedIds[0]; // V4: 48000000001 -> V5: upc48MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000079,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000080 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc13MintedIds[0]; // V4: 13000000001 -> V5: upc13MintedIds[0]
                outfitIds[1] = upc20MintedIds[0]; // V4: 20000000001 -> V5: upc20MintedIds[0]
                outfitIds[2] = upc44MintedIds[3]; // V4: 44000000004 -> V5: upc44MintedIds[3]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000080,
                    upc5MintedIds[0],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000081 (Original)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc19MintedIds[7]; // V4: 19000000008 -> V5: upc19MintedIds[7]
                outfitIds[1] = upc25MintedIds[6]; // V4: 25000000007 -> V5: upc25MintedIds[6]
                outfitIds[2] = upc35MintedIds[1]; // V4: 35000000002 -> V5: upc35MintedIds[1]
                outfitIds[3] = upc43MintedIds[5]; // V4: 43000000006 -> V5: upc43MintedIds[5]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000081,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000082 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc43MintedIds[6]; // V4: 43000000007 -> V5: upc43MintedIds[6]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000082,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000084 (Original)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc39MintedIds[0]; // V4: 39000000001 -> V5: upc39MintedIds[0]
                outfitIds[1] = upc41MintedIds[0]; // V4: 41000000001 -> V5: upc41MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000084,
                    upc5MintedIds[2],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000085 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc28MintedIds[7]; // V4: 28000000008 -> V5: upc28MintedIds[7]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000085,
                    0,
                    outfitIds
                );
            }
            
            // Step 3: Transfer all assets to rightful owners
            console.log("Transferring %d tokens to rightful owners", mintedIds.length);
            
            // Transfer UPC 2 (minted tokenId mintedIds[0]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[0]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[1]) to 0x565b93a15d38acd79c120b15432d21e21ed274d6
            IERC721(address(hook)).transferFrom(deployer, 0x565b93a15d38acd79c120b15432d21e21ed274d6, mintedIds[1]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[2]) to 0xfd37f4625ca5816157d55a5b3f7dd8dd5f8a0c2f
            IERC721(address(hook)).transferFrom(deployer, 0xfd37f4625ca5816157d55a5b3f7dd8dd5f8a0c2f, mintedIds[2]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[3]) to 0x25171bd3cd3231c3057c96f38e32e3ba6681497a
            IERC721(address(hook)).transferFrom(deployer, 0x25171bd3cd3231c3057c96f38e32e3ba6681497a, mintedIds[3]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[4]) to 0x4718ce007293bce1e514887e6f55ea71d9a992d6
            IERC721(address(hook)).transferFrom(deployer, 0x4718ce007293bce1e514887e6f55ea71d9a992d6, mintedIds[4]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[5]) to 0x96d087aba8552a0e111d7fb4feb2e7621213e244
            IERC721(address(hook)).transferFrom(deployer, 0x96d087aba8552a0e111d7fb4feb2e7621213e244, mintedIds[5]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[6]) to 0x2830e21792019ce670fbc548aacb004b08c7f71f
            IERC721(address(hook)).transferFrom(deployer, 0x2830e21792019ce670fbc548aacb004b08c7f71f, mintedIds[6]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[7]) to 0x328809a567b87b6123462c3062e8438bbb75c1c5
            IERC721(address(hook)).transferFrom(deployer, 0x328809a567b87b6123462c3062e8438bbb75c1c5, mintedIds[7]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[8]) to 0xaaed9fff9858d48925904e391b77892ba5fda824
            IERC721(address(hook)).transferFrom(deployer, 0xaaed9fff9858d48925904e391b77892ba5fda824, mintedIds[8]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[9]) to 0xdf087b724174a3e4ed2338c0798193932e851f1b
            IERC721(address(hook)).transferFrom(deployer, 0xdf087b724174a3e4ed2338c0798193932e851f1b, mintedIds[9]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[10]) to 0x28c173b8f20488eef1b0f48df8453a2f59c38337
            IERC721(address(hook)).transferFrom(deployer, 0x28c173b8f20488eef1b0f48df8453a2f59c38337, mintedIds[10]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[11]) to 0xfd37f4625ca5816157d55a5b3f7dd8dd5f8a0c2f
            IERC721(address(hook)).transferFrom(deployer, 0xfd37f4625ca5816157d55a5b3f7dd8dd5f8a0c2f, mintedIds[11]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[12]) to 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12
            IERC721(address(hook)).transferFrom(deployer, 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12, mintedIds[12]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[13]) to 0x817738dc393d682ca5fbb268707b99f2aae96bae
            IERC721(address(hook)).transferFrom(deployer, 0x817738dc393d682ca5fbb268707b99f2aae96bae, mintedIds[13]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[14]) to 0xaaed9fff9858d48925904e391b77892ba5fda824
            IERC721(address(hook)).transferFrom(deployer, 0xaaed9fff9858d48925904e391b77892ba5fda824, mintedIds[14]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[15]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[15]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[16]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[16]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[17]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[17]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[18]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[18]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[19]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[19]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[20]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[20]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[21]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[21]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[22]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[22]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[23]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[23]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[24]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[24]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[25]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[25]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[26]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[26]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[27]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[27]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[28]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[28]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[29]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[29]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[30]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[30]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[31]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[31]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[32]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[32]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[33]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[33]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[34]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[34]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[35]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[35]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[36]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[36]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[37]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[37]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[38]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[38]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[39]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[39]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[40]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[40]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[41]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[41]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[42]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[42]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[43]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[43]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[44]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[44]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[45]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[45]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[46]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[46]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[47]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[47]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[48]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[48]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[49]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[49]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[50]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[50]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[51]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[51]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[52]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[52]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[53]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[53]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[54]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[54]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[55]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[55]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[56]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[56]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[57]) to 0x67bcbe602e870e2286c19e4e0044e583967c9665
            IERC721(address(hook)).transferFrom(deployer, 0x67bcbe602e870e2286c19e4e0044e583967c9665, mintedIds[57]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[58]) to 0x18deee9699526f8c8a87004b2e4e55029fb26b9a
            IERC721(address(hook)).transferFrom(deployer, 0x18deee9699526f8c8a87004b2e4e55029fb26b9a, mintedIds[58]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[59]) to 0xfb46349c0a3f04150e8c731b3a4fc415b0850ce3
            IERC721(address(hook)).transferFrom(deployer, 0xfb46349c0a3f04150e8c731b3a4fc415b0850ce3, mintedIds[59]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[60]) to 0xacd59e854adf632d2322404198624f757c868c97
            IERC721(address(hook)).transferFrom(deployer, 0xacd59e854adf632d2322404198624f757c868c97, mintedIds[60]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[61]) to 0xacd59e854adf632d2322404198624f757c868c97
            IERC721(address(hook)).transferFrom(deployer, 0xacd59e854adf632d2322404198624f757c868c97, mintedIds[61]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[62]) to 0xa13d49fcbf79eaf6a0a58cbdd3361422db4eaff1
            IERC721(address(hook)).transferFrom(deployer, 0xa13d49fcbf79eaf6a0a58cbdd3361422db4eaff1, mintedIds[62]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[63]) to 0x1c51517d8277c9ad6d701fb5394cec0c18219edb
            IERC721(address(hook)).transferFrom(deployer, 0x1c51517d8277c9ad6d701fb5394cec0c18219edb, mintedIds[63]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[64]) to 0xbec26ffa12c90217943d1b2958f60a821ae6e549
            IERC721(address(hook)).transferFrom(deployer, 0xbec26ffa12c90217943d1b2958f60a821ae6e549, mintedIds[64]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[65]) to 0x8ec174c5d86469d1a74094e10485357ebfe2e08e
            IERC721(address(hook)).transferFrom(deployer, 0x8ec174c5d86469d1a74094e10485357ebfe2e08e, mintedIds[65]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[66]) to 0xc5704f77f94087cc644d361a5a57295851d242ab
            IERC721(address(hook)).transferFrom(deployer, 0xc5704f77f94087cc644d361a5a57295851d242ab, mintedIds[66]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[67]) to 0x99fa48ccea8a38cde6b437450ff9bbddafaa4fc8
            IERC721(address(hook)).transferFrom(deployer, 0x99fa48ccea8a38cde6b437450ff9bbddafaa4fc8, mintedIds[67]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[68]) to 0xb6ecb51e3638eb7aa0c6289ef058dca27494acb2
            IERC721(address(hook)).transferFrom(deployer, 0xb6ecb51e3638eb7aa0c6289ef058dca27494acb2, mintedIds[68]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[69]) to 0x57700212b1cb7b67bd7df3801da43ca634513fe0
            IERC721(address(hook)).transferFrom(deployer, 0x57700212b1cb7b67bd7df3801da43ca634513fe0, mintedIds[69]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[70]) to 0x57700212b1cb7b67bd7df3801da43ca634513fe0
            IERC721(address(hook)).transferFrom(deployer, 0x57700212b1cb7b67bd7df3801da43ca634513fe0, mintedIds[70]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[71]) to 0x9342e2ac6dd4a907948e91e80d2734ecac1d70ec
            IERC721(address(hook)).transferFrom(deployer, 0x9342e2ac6dd4a907948e91e80d2734ecac1d70ec, mintedIds[71]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[72]) to 0x96d087aba8552a0e111d7fb4feb2e7621213e244
            IERC721(address(hook)).transferFrom(deployer, 0x96d087aba8552a0e111d7fb4feb2e7621213e244, mintedIds[72]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[73]) to 0x96d087aba8552a0e111d7fb4feb2e7621213e244
            IERC721(address(hook)).transferFrom(deployer, 0x96d087aba8552a0e111d7fb4feb2e7621213e244, mintedIds[73]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[74]) to 0x96d087aba8552a0e111d7fb4feb2e7621213e244
            IERC721(address(hook)).transferFrom(deployer, 0x96d087aba8552a0e111d7fb4feb2e7621213e244, mintedIds[74]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[75]) to 0x96d087aba8552a0e111d7fb4feb2e7621213e244
            IERC721(address(hook)).transferFrom(deployer, 0x96d087aba8552a0e111d7fb4feb2e7621213e244, mintedIds[75]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[76]) to 0x96d087aba8552a0e111d7fb4feb2e7621213e244
            IERC721(address(hook)).transferFrom(deployer, 0x96d087aba8552a0e111d7fb4feb2e7621213e244, mintedIds[76]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[77]) to 0x2830e21792019ce670fbc548aacb004b08c7f71f
            IERC721(address(hook)).transferFrom(deployer, 0x2830e21792019ce670fbc548aacb004b08c7f71f, mintedIds[77]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[78]) to 0x2830e21792019ce670fbc548aacb004b08c7f71f
            IERC721(address(hook)).transferFrom(deployer, 0x2830e21792019ce670fbc548aacb004b08c7f71f, mintedIds[78]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[79]) to 0x2830e21792019ce670fbc548aacb004b08c7f71f
            IERC721(address(hook)).transferFrom(deployer, 0x2830e21792019ce670fbc548aacb004b08c7f71f, mintedIds[79]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[80]) to 0x2830e21792019ce670fbc548aacb004b08c7f71f
            IERC721(address(hook)).transferFrom(deployer, 0x2830e21792019ce670fbc548aacb004b08c7f71f, mintedIds[80]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[81]) to 0x2830e21792019ce670fbc548aacb004b08c7f71f
            IERC721(address(hook)).transferFrom(deployer, 0x2830e21792019ce670fbc548aacb004b08c7f71f, mintedIds[81]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[82]) to 0x46f3cc6a1c00a5cd8864d2b92f128196cae07d15
            IERC721(address(hook)).transferFrom(deployer, 0x46f3cc6a1c00a5cd8864d2b92f128196cae07d15, mintedIds[82]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[83]) to 0x8e2b25df2484000b9127b2d2f8e92079dcee3e48
            IERC721(address(hook)).transferFrom(deployer, 0x8e2b25df2484000b9127b2d2f8e92079dcee3e48, mintedIds[83]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[84]) to 0x817738dc393d682ca5fbb268707b99f2aae96bae
            IERC721(address(hook)).transferFrom(deployer, 0x817738dc393d682ca5fbb268707b99f2aae96bae, mintedIds[84]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[85]) to 0x224aba5d489675a7bd3ce07786fada466b46fa0f
            IERC721(address(hook)).transferFrom(deployer, 0x224aba5d489675a7bd3ce07786fada466b46fa0f, mintedIds[85]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[86]) to 0x29f4ae3c24681940e537f72830b4fe4076bdf9fe
            IERC721(address(hook)).transferFrom(deployer, 0x29f4ae3c24681940e537f72830b4fe4076bdf9fe, mintedIds[86]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[87]) to 0x29f4ae3c24681940e537f72830b4fe4076bdf9fe
            IERC721(address(hook)).transferFrom(deployer, 0x29f4ae3c24681940e537f72830b4fe4076bdf9fe, mintedIds[87]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[88]) to 0x29f4ae3c24681940e537f72830b4fe4076bdf9fe
            IERC721(address(hook)).transferFrom(deployer, 0x29f4ae3c24681940e537f72830b4fe4076bdf9fe, mintedIds[88]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[89]) to 0x29f4ae3c24681940e537f72830b4fe4076bdf9fe
            IERC721(address(hook)).transferFrom(deployer, 0x29f4ae3c24681940e537f72830b4fe4076bdf9fe, mintedIds[89]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[90]) to 0x29f4ae3c24681940e537f72830b4fe4076bdf9fe
            IERC721(address(hook)).transferFrom(deployer, 0x29f4ae3c24681940e537f72830b4fe4076bdf9fe, mintedIds[90]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[91]) to 0x8b80755c441d355405ca7571443bb9247b77ec16
            IERC721(address(hook)).transferFrom(deployer, 0x8b80755c441d355405ca7571443bb9247b77ec16, mintedIds[91]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[92]) to 0x3c2736f995535b5a755f3ce2beb754362820671e
            IERC721(address(hook)).transferFrom(deployer, 0x3c2736f995535b5a755f3ce2beb754362820671e, mintedIds[92]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[93]) to 0x6877be9e00d0bc5886c28419901e8cc98c1c2739
            IERC721(address(hook)).transferFrom(deployer, 0x6877be9e00d0bc5886c28419901e8cc98c1c2739, mintedIds[93]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[94]) to 0x8dfbdeec8c5d4970bb5f481c6ec7f73fa1c65be5
            IERC721(address(hook)).transferFrom(deployer, 0x8dfbdeec8c5d4970bb5f481c6ec7f73fa1c65be5, mintedIds[94]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[95]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[95]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[96]) to 0xfd37f4625ca5816157d55a5b3f7dd8dd5f8a0c2f
            IERC721(address(hook)).transferFrom(deployer, 0xfd37f4625ca5816157d55a5b3f7dd8dd5f8a0c2f, mintedIds[96]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[97]) to 0x39a7b6fa1597bb6657fe84e64e3b836c37d6f75d
            IERC721(address(hook)).transferFrom(deployer, 0x39a7b6fa1597bb6657fe84e64e3b836c37d6f75d, mintedIds[97]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[98]) to 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12
            IERC721(address(hook)).transferFrom(deployer, 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12, mintedIds[98]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[99]) to 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12
            IERC721(address(hook)).transferFrom(deployer, 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12, mintedIds[99]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[100]) to 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12
            IERC721(address(hook)).transferFrom(deployer, 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12, mintedIds[100]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[101]) to 0xddb4938755c243a4f60a2f2f8f95df4f894c58cc
            IERC721(address(hook)).transferFrom(deployer, 0xddb4938755c243a4f60a2f2f8f95df4f894c58cc, mintedIds[101]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[102]) to 0x34aa3f359a9d614239015126635ce7732c18fdf3
            IERC721(address(hook)).transferFrom(deployer, 0x34aa3f359a9d614239015126635ce7732c18fdf3, mintedIds[102]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[103]) to 0x34aa3f359a9d614239015126635ce7732c18fdf3
            IERC721(address(hook)).transferFrom(deployer, 0x34aa3f359a9d614239015126635ce7732c18fdf3, mintedIds[103]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[104]) to 0x34aa3f359a9d614239015126635ce7732c18fdf3
            IERC721(address(hook)).transferFrom(deployer, 0x34aa3f359a9d614239015126635ce7732c18fdf3, mintedIds[104]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[105]) to 0xf6cc71878e23c05406b35946cd9d378e0f2f4f2f
            IERC721(address(hook)).transferFrom(deployer, 0xf6cc71878e23c05406b35946cd9d378e0f2f4f2f, mintedIds[105]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[106]) to 0xd2e44e40b5fb960a8a74dd7b9d6b7f14b805b50d
            IERC721(address(hook)).transferFrom(deployer, 0xd2e44e40b5fb960a8a74dd7b9d6b7f14b805b50d, mintedIds[106]);
            
            // Transfer UPC 7 (minted tokenId mintedIds[107]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[107]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[108]) to 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3
            IERC721(address(hook)).transferFrom(deployer, 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3, mintedIds[108]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[109]) to 0x328809a567b87b6123462c3062e8438bbb75c1c5
            IERC721(address(hook)).transferFrom(deployer, 0x328809a567b87b6123462c3062e8438bbb75c1c5, mintedIds[109]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[110]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[110]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[111]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[111]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[112]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[112]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[113]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[113]);
            
            // Transfer UPC 11 (minted tokenId mintedIds[114]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[114]);
            
            // Transfer UPC 11 (minted tokenId mintedIds[115]) to 0xfd37f4625ca5816157d55a5b3f7dd8dd5f8a0c2f
            IERC721(address(hook)).transferFrom(deployer, 0xfd37f4625ca5816157d55a5b3f7dd8dd5f8a0c2f, mintedIds[115]);
            
            // Transfer UPC 13 (minted tokenId mintedIds[116]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[116]);
            
            // Transfer UPC 14 (minted tokenId mintedIds[117]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[117]);
            
            // Transfer UPC 17 (minted tokenId mintedIds[118]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[118]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[119]) to 0x18deee9699526f8c8a87004b2e4e55029fb26b9a
            IERC721(address(hook)).transferFrom(deployer, 0x18deee9699526f8c8a87004b2e4e55029fb26b9a, mintedIds[119]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[120]) to 0xbec26ffa12c90217943d1b2958f60a821ae6e549
            IERC721(address(hook)).transferFrom(deployer, 0xbec26ffa12c90217943d1b2958f60a821ae6e549, mintedIds[120]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[121]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[121]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[122]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[122]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[123]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[123]);
            
            // Transfer UPC 24 (minted tokenId mintedIds[124]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[124]);
            
            // Transfer UPC 25 (minted tokenId mintedIds[125]) to 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3
            IERC721(address(hook)).transferFrom(deployer, 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3, mintedIds[125]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[126]) to 0x18deee9699526f8c8a87004b2e4e55029fb26b9a
            IERC721(address(hook)).transferFrom(deployer, 0x18deee9699526f8c8a87004b2e4e55029fb26b9a, mintedIds[126]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[127]) to 0x328809a567b87b6123462c3062e8438bbb75c1c5
            IERC721(address(hook)).transferFrom(deployer, 0x328809a567b87b6123462c3062e8438bbb75c1c5, mintedIds[127]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[128]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[128]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[129]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[129]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[130]) to 0x99fa48ccea8a38cde6b437450ff9bbddafaa4fc8
            IERC721(address(hook)).transferFrom(deployer, 0x99fa48ccea8a38cde6b437450ff9bbddafaa4fc8, mintedIds[130]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[131]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[131]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[132]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[132]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[133]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[133]);
            
            // Transfer UPC 32 (minted tokenId mintedIds[134]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[134]);
            
            // Transfer UPC 34 (minted tokenId mintedIds[135]) to 0xaecd6d9172d602b93dba3981991268b44af8096e
            IERC721(address(hook)).transferFrom(deployer, 0xaecd6d9172d602b93dba3981991268b44af8096e, mintedIds[135]);
            
            // Transfer UPC 35 (minted tokenId mintedIds[136]) to 0x565b93a15d38acd79c120b15432d21e21ed274d6
            IERC721(address(hook)).transferFrom(deployer, 0x565b93a15d38acd79c120b15432d21e21ed274d6, mintedIds[136]);
            
            // Transfer UPC 35 (minted tokenId mintedIds[137]) to 0xfd37f4625ca5816157d55a5b3f7dd8dd5f8a0c2f
            IERC721(address(hook)).transferFrom(deployer, 0xfd37f4625ca5816157d55a5b3f7dd8dd5f8a0c2f, mintedIds[137]);
            
            // Transfer UPC 35 (minted tokenId mintedIds[138]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[138]);
            
            // Transfer UPC 38 (minted tokenId mintedIds[139]) to 0xfd37f4625ca5816157d55a5b3f7dd8dd5f8a0c2f
            IERC721(address(hook)).transferFrom(deployer, 0xfd37f4625ca5816157d55a5b3f7dd8dd5f8a0c2f, mintedIds[139]);
            
            // Transfer UPC 39 (minted tokenId mintedIds[140]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[140]);
            
            // Transfer UPC 40 (minted tokenId mintedIds[141]) to 0x8dfbdeec8c5d4970bb5f481c6ec7f73fa1c65be5
            IERC721(address(hook)).transferFrom(deployer, 0x8dfbdeec8c5d4970bb5f481c6ec7f73fa1c65be5, mintedIds[141]);
            
            // Transfer UPC 40 (minted tokenId mintedIds[142]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[142]);
            
            // Transfer UPC 41 (minted tokenId mintedIds[143]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[143]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[144]) to 0x1c51517d8277c9ad6d701fb5394cec0c18219edb
            IERC721(address(hook)).transferFrom(deployer, 0x1c51517d8277c9ad6d701fb5394cec0c18219edb, mintedIds[144]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[145]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[145]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[146]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[146]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[147]) to 0x328809a567b87b6123462c3062e8438bbb75c1c5
            IERC721(address(hook)).transferFrom(deployer, 0x328809a567b87b6123462c3062e8438bbb75c1c5, mintedIds[147]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[148]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[148]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[149]) to 0xbec26ffa12c90217943d1b2958f60a821ae6e549
            IERC721(address(hook)).transferFrom(deployer, 0xbec26ffa12c90217943d1b2958f60a821ae6e549, mintedIds[149]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[150]) to 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3
            IERC721(address(hook)).transferFrom(deployer, 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3, mintedIds[150]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[151]) to 0x99fa48ccea8a38cde6b437450ff9bbddafaa4fc8
            IERC721(address(hook)).transferFrom(deployer, 0x99fa48ccea8a38cde6b437450ff9bbddafaa4fc8, mintedIds[151]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[152]) to 0x8b80755c441d355405ca7571443bb9247b77ec16
            IERC721(address(hook)).transferFrom(deployer, 0x8b80755c441d355405ca7571443bb9247b77ec16, mintedIds[152]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[153]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[153]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[154]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[154]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[155]) to 0x8b80755c441d355405ca7571443bb9247b77ec16
            IERC721(address(hook)).transferFrom(deployer, 0x8b80755c441d355405ca7571443bb9247b77ec16, mintedIds[155]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[156]) to 0x8b80755c441d355405ca7571443bb9247b77ec16
            IERC721(address(hook)).transferFrom(deployer, 0x8b80755c441d355405ca7571443bb9247b77ec16, mintedIds[156]);
            
            // Transfer UPC 5 (minted tokenId mintedIds[157]) to 0x8b80755c441d355405ca7571443bb9247b77ec16
            IERC721(address(hook)).transferFrom(deployer, 0x8b80755c441d355405ca7571443bb9247b77ec16, mintedIds[157]);
            
            // Transfer UPC 5 (minted tokenId mintedIds[158]) to 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041
            IERC721(address(hook)).transferFrom(deployer, 0xf7253a0e87e39d2cd6365919d4a3d56d431d0041, mintedIds[158]);
            
            // Transfer UPC 6 (minted tokenId mintedIds[159]) to 0x328809a567b87b6123462c3062e8438bbb75c1c5
            IERC721(address(hook)).transferFrom(deployer, 0x328809a567b87b6123462c3062e8438bbb75c1c5, mintedIds[159]);
            
            return;
        }
        if (chainId == 42161) {
            // Arbitrum migration
            console.log("Migrating 205 items on Arbitrum");
            
            // Step 1: Mint all assets to deployer initially
            
            console.log("Minting tierIds to deployer");
            
            // Create array of all tierIds to mint
            uint256[] memory allTierIds = new uint256[](205);
            uint256 tierIndex = 0;
            
            // Add 2 instances of UPC 3
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 3;
                tierIndex++;
            }
            // Add 9 instances of UPC 4
            for (uint256 i = 0; i < 9; i++) {
                allTierIds[tierIndex] = 4;
                tierIndex++;
            }
            // Add 3 instances of UPC 5
            for (uint256 i = 0; i < 3; i++) {
                allTierIds[tierIndex] = 5;
                tierIndex++;
            }
            // Add 1 instances of UPC 6
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 6;
                tierIndex++;
            }
            // Add 2 instances of UPC 10
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 10;
                tierIndex++;
            }
            // Add 1 instances of UPC 11
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 11;
                tierIndex++;
            }
            // Add 4 instances of UPC 19
            for (uint256 i = 0; i < 4; i++) {
                allTierIds[tierIndex] = 19;
                tierIndex++;
            }
            // Add 2 instances of UPC 20
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 20;
                tierIndex++;
            }
            // Add 1 instances of UPC 25
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 25;
                tierIndex++;
            }
            // Add 2 instances of UPC 28
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 28;
                tierIndex++;
            }
            // Add 2 instances of UPC 31
            for (uint256 i = 0; i < 2; i++) {
                allTierIds[tierIndex] = 31;
                tierIndex++;
            }
            // Add 1 instances of UPC 32
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 32;
                tierIndex++;
            }
            // Add 1 instances of UPC 38
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 38;
                tierIndex++;
            }
            // Add 1 instances of UPC 39
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 39;
                tierIndex++;
            }
            // Add 1 instances of UPC 43
            for (uint256 i = 0; i < 1; i++) {
                allTierIds[tierIndex] = 43;
                tierIndex++;
            }
            // Add 27 instances of UPC 47
            for (uint256 i = 0; i < 27; i++) {
                allTierIds[tierIndex] = 47;
                tierIndex++;
            }
            // Add 145 instances of UPC 49
            for (uint256 i = 0; i < 145; i++) {
                allTierIds[tierIndex] = 49;
                tierIndex++;
            }
            
            // Mint all tierIds at once
            uint256[] memory mintedIds = hook.mintFor(allTierIds, deployer);
            
            // UPC 3 minted tokenIds (2 items)
            uint256[] memory upc3MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc3MintedIds[i] = mintedIds[0 + i];
            }
            // UPC 4 minted tokenIds (9 items)
            uint256[] memory upc4MintedIds = new uint256[](9);
            for (uint256 i = 0; i < 9; i++) {
                upc4MintedIds[i] = mintedIds[2 + i];
            }
            // UPC 5 minted tokenIds (3 items)
            uint256[] memory upc5MintedIds = new uint256[](3);
            for (uint256 i = 0; i < 3; i++) {
                upc5MintedIds[i] = mintedIds[11 + i];
            }
            // UPC 6 minted tokenIds (1 items)
            uint256[] memory upc6MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc6MintedIds[i] = mintedIds[14 + i];
            }
            // UPC 10 minted tokenIds (2 items)
            uint256[] memory upc10MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc10MintedIds[i] = mintedIds[15 + i];
            }
            // UPC 11 minted tokenIds (1 items)
            uint256[] memory upc11MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc11MintedIds[i] = mintedIds[17 + i];
            }
            // UPC 19 minted tokenIds (4 items)
            uint256[] memory upc19MintedIds = new uint256[](4);
            for (uint256 i = 0; i < 4; i++) {
                upc19MintedIds[i] = mintedIds[18 + i];
            }
            // UPC 20 minted tokenIds (2 items)
            uint256[] memory upc20MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc20MintedIds[i] = mintedIds[22 + i];
            }
            // UPC 25 minted tokenIds (1 items)
            uint256[] memory upc25MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc25MintedIds[i] = mintedIds[24 + i];
            }
            // UPC 28 minted tokenIds (2 items)
            uint256[] memory upc28MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc28MintedIds[i] = mintedIds[25 + i];
            }
            // UPC 31 minted tokenIds (2 items)
            uint256[] memory upc31MintedIds = new uint256[](2);
            for (uint256 i = 0; i < 2; i++) {
                upc31MintedIds[i] = mintedIds[27 + i];
            }
            // UPC 32 minted tokenIds (1 items)
            uint256[] memory upc32MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc32MintedIds[i] = mintedIds[29 + i];
            }
            // UPC 38 minted tokenIds (1 items)
            uint256[] memory upc38MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc38MintedIds[i] = mintedIds[30 + i];
            }
            // UPC 39 minted tokenIds (1 items)
            uint256[] memory upc39MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc39MintedIds[i] = mintedIds[31 + i];
            }
            // UPC 43 minted tokenIds (1 items)
            uint256[] memory upc43MintedIds = new uint256[](1);
            for (uint256 i = 0; i < 1; i++) {
                upc43MintedIds[i] = mintedIds[32 + i];
            }
            // UPC 47 minted tokenIds (27 items)
            uint256[] memory upc47MintedIds = new uint256[](27);
            for (uint256 i = 0; i < 27; i++) {
                upc47MintedIds[i] = mintedIds[33 + i];
            }
            // UPC 49 minted tokenIds (145 items)
            uint256[] memory upc49MintedIds = new uint256[](145);
            for (uint256 i = 0; i < 145; i++) {
                upc49MintedIds[i] = mintedIds[60 + i];
            }
            // Step 2: Process each Banny body and dress them
            console.log("Processing 11 Banny bodies...");
            
            // Dress Banny 3000000001 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](4);
                                outfitIds[0] = upc19MintedIds[0]; // V4: 19000000001 -> V5: upc19MintedIds[0]
                outfitIds[1] = upc25MintedIds[0]; // V4: 25000000001 -> V5: upc25MintedIds[0]
                outfitIds[2] = upc38MintedIds[0]; // V4: 38000000001 -> V5: upc38MintedIds[0]
                outfitIds[3] = upc47MintedIds[0]; // V4: 47000000001 -> V5: upc47MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000001,
                    upc5MintedIds[0],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000003 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc11MintedIds[0]; // V4: 11000000001 -> V5: upc11MintedIds[0]
                outfitIds[1] = upc19MintedIds[2]; // V4: 19000000003 -> V5: upc19MintedIds[2]
                outfitIds[2] = upc28MintedIds[0]; // V4: 28000000001 -> V5: upc28MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000003,
                    upc6MintedIds[0],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000004 (Original)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc10MintedIds[0]; // V4: 10000000001 -> V5: upc10MintedIds[0]
                outfitIds[1] = upc20MintedIds[0]; // V4: 20000000001 -> V5: upc20MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000004,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000005 (Original)
            {
                uint256[] memory outfitIds = new uint256[](2);
                                outfitIds[0] = upc31MintedIds[0]; // V4: 31000000001 -> V5: upc31MintedIds[0]
                outfitIds[1] = upc49MintedIds[1]; // V4: 49000000002 -> V5: upc49MintedIds[1]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000005,
                    0,
                    outfitIds
                );
            }
            
            // Dress Banny 4000000007 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                                outfitIds[0] = upc10MintedIds[1]; // V4: 10000000002 -> V5: upc10MintedIds[1]
                outfitIds[1] = upc20MintedIds[1]; // V4: 20000000002 -> V5: upc20MintedIds[1]
                outfitIds[2] = upc43MintedIds[0]; // V4: 43000000001 -> V5: upc43MintedIds[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000007,
                    upc5MintedIds[1],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000009 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                                outfitIds[0] = upc28MintedIds[1]; // V4: 28000000002 -> V5: upc28MintedIds[1]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000009,
                    0,
                    outfitIds
                );
            }
            
            // Step 3: Transfer all assets to rightful owners
            console.log("Transferring %d tokens to rightful owners", mintedIds.length);
            
            // Transfer UPC 3 (minted tokenId mintedIds[0]) to 0x2aa64e6d80390f5c017f0313cb908051be2fd35e
            IERC721(address(hook)).transferFrom(deployer, 0x2aa64e6d80390f5c017f0313cb908051be2fd35e, mintedIds[0]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[1]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[1]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[2]) to 0x1c51517d8277c9ad6d701fb5394cec0c18219edb
            IERC721(address(hook)).transferFrom(deployer, 0x1c51517d8277c9ad6d701fb5394cec0c18219edb, mintedIds[2]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[3]) to 0xfd282d9f4d06c4bdc6a41af1ae920a0ad70d18a3
            IERC721(address(hook)).transferFrom(deployer, 0xfd282d9f4d06c4bdc6a41af1ae920a0ad70d18a3, mintedIds[3]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[4]) to 0x08b3e694caa2f1fcf8ef71095ced1326f3454b89
            IERC721(address(hook)).transferFrom(deployer, 0x08b3e694caa2f1fcf8ef71095ced1326f3454b89, mintedIds[4]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[5]) to 0x9fdf876a50ea8f95017dcfc7709356887025b5bb
            IERC721(address(hook)).transferFrom(deployer, 0x9fdf876a50ea8f95017dcfc7709356887025b5bb, mintedIds[5]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[6]) to 0x187089b33e5812310ed32a57f53b3fad0383a19d
            IERC721(address(hook)).transferFrom(deployer, 0x187089b33e5812310ed32a57f53b3fad0383a19d, mintedIds[6]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[7]) to 0xc6404f24db2f573f07f3a60758765caad198c0c3
            IERC721(address(hook)).transferFrom(deployer, 0xc6404f24db2f573f07f3a60758765caad198c0c3, mintedIds[7]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[8]) to 0xb2d3900807094d4fe47405871b0c8adb58e10d42
            IERC721(address(hook)).transferFrom(deployer, 0xb2d3900807094d4fe47405871b0c8adb58e10d42, mintedIds[8]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[9]) to 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12
            IERC721(address(hook)).transferFrom(deployer, 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12, mintedIds[9]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[10]) to 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12
            IERC721(address(hook)).transferFrom(deployer, 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12, mintedIds[10]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[11]) to 0x1c51517d8277c9ad6d701fb5394cec0c18219edb
            IERC721(address(hook)).transferFrom(deployer, 0x1c51517d8277c9ad6d701fb5394cec0c18219edb, mintedIds[11]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[12]) to 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12
            IERC721(address(hook)).transferFrom(deployer, 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12, mintedIds[12]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[13]) to 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12
            IERC721(address(hook)).transferFrom(deployer, 0x57a482ea32c7f75a9c0734206f5bd4f9bcb38e12, mintedIds[13]);
            
            // Transfer UPC 32 (minted tokenId mintedIds[14]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[14]);
            
            // Transfer UPC 39 (minted tokenId mintedIds[15]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[15]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[16]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[16]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[17]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[17]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[18]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[18]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[19]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[19]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[20]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[20]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[21]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[21]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[22]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[22]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[23]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[23]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[24]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[24]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[25]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[25]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[26]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[26]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[27]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[27]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[28]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[28]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[29]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[29]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[30]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[30]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[31]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[31]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[32]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[32]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[33]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[33]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[34]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[34]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[35]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[35]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[36]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[36]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[37]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[37]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[38]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[38]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[39]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[39]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[40]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[40]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[41]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[41]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[42]) to 0x1c51517d8277c9ad6d701fb5394cec0c18219edb
            IERC721(address(hook)).transferFrom(deployer, 0x1c51517d8277c9ad6d701fb5394cec0c18219edb, mintedIds[42]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[43]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[43]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[44]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[44]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[45]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[45]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[46]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[46]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[47]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[47]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[48]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[48]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[49]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[49]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[50]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[50]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[51]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[51]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[52]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[52]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[53]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[53]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[54]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[54]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[55]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[55]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[56]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[56]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[57]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[57]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[58]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[58]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[59]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[59]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[60]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[60]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[61]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[61]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[62]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[62]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[63]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[63]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[64]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[64]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[65]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[65]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[66]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[66]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[67]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[67]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[68]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[68]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[69]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[69]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[70]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[70]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[71]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[71]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[72]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[72]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[73]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[73]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[74]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[74]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[75]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[75]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[76]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[76]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[77]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[77]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[78]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[78]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[79]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[79]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[80]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[80]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[81]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[81]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[82]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[82]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[83]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[83]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[84]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[84]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[85]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[85]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[86]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[86]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[87]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[87]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[88]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[88]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[89]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[89]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[90]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[90]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[91]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[91]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[92]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[92]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[93]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[93]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[94]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[94]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[95]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[95]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[96]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[96]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[97]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[97]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[98]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[98]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[99]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[99]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[100]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[100]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[101]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[101]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[102]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[102]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[103]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[103]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[104]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[104]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[105]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[105]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[106]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[106]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[107]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[107]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[108]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[108]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[109]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[109]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[110]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[110]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[111]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[111]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[112]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[112]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[113]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[113]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[114]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[114]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[115]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[115]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[116]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[116]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[117]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[117]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[118]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[118]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[119]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[119]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[120]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[120]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[121]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[121]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[122]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[122]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[123]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[123]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[124]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[124]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[125]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[125]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[126]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[126]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[127]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[127]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[128]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[128]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[129]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[129]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[130]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[130]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[131]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[131]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[132]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[132]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[133]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[133]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[134]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[134]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[135]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[135]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[136]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[136]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[137]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[137]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[138]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[138]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[139]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[139]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[140]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[140]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[141]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[141]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[142]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[142]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[143]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[143]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[144]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[144]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[145]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[145]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[146]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[146]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[147]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[147]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[148]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[148]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[149]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[149]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[150]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[150]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[151]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[151]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[152]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[152]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[153]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[153]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[154]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[154]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[155]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[155]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[156]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[156]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[157]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[157]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[158]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[158]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[159]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[159]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[160]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[160]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[161]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[161]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[162]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[162]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[163]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[163]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[164]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[164]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[165]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[165]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[166]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[166]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[167]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[167]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[168]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[168]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[169]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[169]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[170]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[170]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[171]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[171]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[172]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[172]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[173]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[173]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[174]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[174]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[175]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[175]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[176]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[176]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[177]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[177]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[178]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[178]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[179]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[179]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[180]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[180]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[181]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[181]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[182]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[182]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[183]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[183]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[184]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[184]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[185]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[185]);
            
            // Transfer UPC 5 (minted tokenId mintedIds[186]) to 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7
            IERC721(address(hook)).transferFrom(deployer, 0x7c3f14075f6477fea1af6cf59f325afdfcd3ddf7, mintedIds[186]);
            
            return;
        }
        if (chainId == 11155111) {
            // No items found for EthereumSepolia
            console.log("No items to migrate on EthereumSepolia");
            return;
        }
        if (chainId == 11155420) {
            // No items found for OptimismSepolia
            console.log("No items to migrate on OptimismSepolia");
            return;
        }
        if (chainId == 84532) {
            // No items found for BaseSepolia
            console.log("No items to migrate on BaseSepolia");
            return;
        }
        if (chainId == 421614) {
            // No items found for ArbitrumSepolia
            console.log("No items to migrate on ArbitrumSepolia");
            return;
        }
    }
}
