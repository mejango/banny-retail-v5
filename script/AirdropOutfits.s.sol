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
        address resolverAddress = 0x47c011146A4498a70E0bF2E4585acF9CaDE85954;
        _processMigration(hookAddress, resolverAddress, 1); // Ethereum mainnet
    }
    
    function _runOptimism() internal {
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146A4498a70E0bF2E4585acF9CaDE85954;
        _processMigration(hookAddress, resolverAddress, 10); // Optimism
    }
    
    function _runBase() internal {
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146A4498a70E0bF2E4585acF9CaDE85954;
        _processMigration(hookAddress, resolverAddress, 8453); // Base
    }
    
    function _runArbitrum() internal {
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146A4498a70E0bF2E4585acF9CaDE85954;
        _processMigration(hookAddress, resolverAddress, 42161); // Arbitrum
    }
    
    function _runEthereumSepolia() internal {
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146A4498a70E0bF2E4585acF9CaDE85954;
        _processMigration(hookAddress, resolverAddress, 11155111); // Ethereum Sepolia
    }
    
    function _runOptimismSepolia() internal {
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146A4498a70E0bF2E4585acF9CaDE85954;
        _processMigration(hookAddress, resolverAddress, 11155420); // Optimism Sepolia
    }
    
    function _runBaseSepolia() internal {
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146A4498a70E0bF2E4585acF9CaDE85954;
        _processMigration(hookAddress, resolverAddress, 84532); // Base Sepolia
    }
    
    function _runArbitrumSepolia() internal {
        // Contract addresses are the same across all chains
        address hookAddress = 0xb4Ec363c2E7DB0cECA9AA1759338d7d1b49d1750;
        address resolverAddress = 0x47c011146A4498a70E0bF2E4585acF9CaDE85954;
        _processMigration(hookAddress, resolverAddress, 421614); // Arbitrum Sepolia
    }
    
    function _processMigration(address hookAddress, address resolverAddress, uint256 chainId) internal {
        // Validate addresses
        require(hookAddress != address(0), "Hook address not set");
        require(resolverAddress != address(0), "Resolver address not set");
        
        JB721TiersHook hook = JB721TiersHook(hookAddress);
        Banny721TokenUriResolver resolver = Banny721TokenUriResolver(resolverAddress);
        
        vm.startBroadcast();
        
        // Process the migration for this specific chain
        _executeMigration(hook, resolver, msg.sender, chainId);
        
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
            uint16[] memory allTierIds = new uint16[](536);
            uint16 tierIndex = 0;
            
            // Helper function to add UPC instances to allTierIds
            function _addUpcInstances(uint16 upc, uint256 quantity) internal {
                for (uint256 i = 0; i < quantity; i++) {
                    allTierIds[tierIndex] = upc;
                    tierIndex++;
                }
            }
            
            _addUpcInstances(1, 1); // Add 1 instances of UPC 1
            _addUpcInstances(2, 6); // Add 6 instances of UPC 2
            _addUpcInstances(3, 26); // Add 26 instances of UPC 3
            _addUpcInstances(4, 85); // Add 85 instances of UPC 4
            _addUpcInstances(5, 8); // Add 8 instances of UPC 5
            _addUpcInstances(6, 13); // Add 13 instances of UPC 6
            _addUpcInstances(7, 2); // Add 2 instances of UPC 7
            _addUpcInstances(10, 14); // Add 14 instances of UPC 10
            _addUpcInstances(11, 1); // Add 1 instances of UPC 11
            _addUpcInstances(13, 4); // Add 4 instances of UPC 13
            _addUpcInstances(14, 6); // Add 6 instances of UPC 14
            _addUpcInstances(15, 5); // Add 5 instances of UPC 15
            _addUpcInstances(16, 1); // Add 1 instances of UPC 16
            _addUpcInstances(17, 5); // Add 5 instances of UPC 17
            _addUpcInstances(18, 3); // Add 3 instances of UPC 18
            _addUpcInstances(19, 22); // Add 22 instances of UPC 19
            _addUpcInstances(20, 8); // Add 8 instances of UPC 20
            _addUpcInstances(21, 2); // Add 2 instances of UPC 21
            _addUpcInstances(23, 8); // Add 8 instances of UPC 23
            _addUpcInstances(25, 12); // Add 12 instances of UPC 25
            _addUpcInstances(26, 7); // Add 7 instances of UPC 26
            _addUpcInstances(28, 9); // Add 9 instances of UPC 28
            _addUpcInstances(29, 3); // Add 3 instances of UPC 29
            _addUpcInstances(31, 13); // Add 13 instances of UPC 31
            _addUpcInstances(32, 5); // Add 5 instances of UPC 32
            _addUpcInstances(33, 2); // Add 2 instances of UPC 33
            _addUpcInstances(35, 9); // Add 9 instances of UPC 35
            _addUpcInstances(37, 4); // Add 4 instances of UPC 37
            _addUpcInstances(38, 3); // Add 3 instances of UPC 38
            _addUpcInstances(39, 4); // Add 4 instances of UPC 39
            _addUpcInstances(40, 3); // Add 3 instances of UPC 40
            _addUpcInstances(41, 5); // Add 5 instances of UPC 41
            _addUpcInstances(42, 19); // Add 19 instances of UPC 42
            _addUpcInstances(43, 18); // Add 18 instances of UPC 43
            _addUpcInstances(44, 34); // Add 34 instances of UPC 44
            _addUpcInstances(46, 1); // Add 1 instances of UPC 46
            _addUpcInstances(47, 14); // Add 14 instances of UPC 47
            _addUpcInstances(48, 6); // Add 6 instances of UPC 48
            _addUpcInstances(49, 145); // Add 145 instances of UPC 49
            
            // Mint all tierIds at once
            uint256[] memory mintedIds = hook.mintFor(allTierIds, address(this));
            
            // Define struct to hold all UPC minted tokenIds
            struct MintedIds {
                uint256[1] upc1;
                uint256[6] upc2;
                uint256[26] upc3;
                uint256[85] upc4;
                uint256[8] upc5;
                uint256[13] upc6;
                uint256[2] upc7;
                uint256[14] upc10;
                uint256[1] upc11;
                uint256[4] upc13;
                uint256[6] upc14;
                uint256[5] upc15;
                uint256[1] upc16;
                uint256[5] upc17;
                uint256[3] upc18;
                uint256[22] upc19;
                uint256[8] upc20;
                uint256[2] upc21;
                uint256[8] upc23;
                uint256[12] upc25;
                uint256[7] upc26;
                uint256[9] upc28;
                uint256[3] upc29;
                uint256[13] upc31;
                uint256[5] upc32;
                uint256[2] upc33;
                uint256[9] upc35;
                uint256[4] upc37;
                uint256[3] upc38;
                uint256[4] upc39;
                uint256[3] upc40;
                uint256[5] upc41;
                uint256[19] upc42;
                uint256[18] upc43;
                uint256[34] upc44;
                uint256[1] upc46;
                uint256[14] upc47;
                uint256[6] upc48;
                uint256[145] upc49;
                            }
            
            // Create and populate the struct
            MintedIds memory formattedMintedIds;
            
            // Populate UPC 1 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc1[i] = mintedIds[0 + i];
            }
            // Populate UPC 2 minted tokenIds (6 items)
            for (uint256 i = 0; i < 6; i++) {
                sortedMintedIds.upc2[i] = mintedIds[1 + i];
            }
            // Populate UPC 3 minted tokenIds (26 items)
            for (uint256 i = 0; i < 26; i++) {
                sortedMintedIds.upc3[i] = mintedIds[7 + i];
            }
            // Populate UPC 4 minted tokenIds (85 items)
            for (uint256 i = 0; i < 85; i++) {
                sortedMintedIds.upc4[i] = mintedIds[33 + i];
            }
            // Populate UPC 5 minted tokenIds (8 items)
            for (uint256 i = 0; i < 8; i++) {
                sortedMintedIds.upc5[i] = mintedIds[118 + i];
            }
            // Populate UPC 6 minted tokenIds (13 items)
            for (uint256 i = 0; i < 13; i++) {
                sortedMintedIds.upc6[i] = mintedIds[126 + i];
            }
            // Populate UPC 7 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc7[i] = mintedIds[139 + i];
            }
            // Populate UPC 10 minted tokenIds (14 items)
            for (uint256 i = 0; i < 14; i++) {
                sortedMintedIds.upc10[i] = mintedIds[141 + i];
            }
            // Populate UPC 11 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc11[i] = mintedIds[155 + i];
            }
            // Populate UPC 13 minted tokenIds (4 items)
            for (uint256 i = 0; i < 4; i++) {
                sortedMintedIds.upc13[i] = mintedIds[156 + i];
            }
            // Populate UPC 14 minted tokenIds (6 items)
            for (uint256 i = 0; i < 6; i++) {
                sortedMintedIds.upc14[i] = mintedIds[160 + i];
            }
            // Populate UPC 15 minted tokenIds (5 items)
            for (uint256 i = 0; i < 5; i++) {
                sortedMintedIds.upc15[i] = mintedIds[166 + i];
            }
            // Populate UPC 16 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc16[i] = mintedIds[171 + i];
            }
            // Populate UPC 17 minted tokenIds (5 items)
            for (uint256 i = 0; i < 5; i++) {
                sortedMintedIds.upc17[i] = mintedIds[172 + i];
            }
            // Populate UPC 18 minted tokenIds (3 items)
            for (uint256 i = 0; i < 3; i++) {
                sortedMintedIds.upc18[i] = mintedIds[177 + i];
            }
            // Populate UPC 19 minted tokenIds (22 items)
            for (uint256 i = 0; i < 22; i++) {
                sortedMintedIds.upc19[i] = mintedIds[180 + i];
            }
            // Populate UPC 20 minted tokenIds (8 items)
            for (uint256 i = 0; i < 8; i++) {
                sortedMintedIds.upc20[i] = mintedIds[202 + i];
            }
            // Populate UPC 21 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc21[i] = mintedIds[210 + i];
            }
            // Populate UPC 23 minted tokenIds (8 items)
            for (uint256 i = 0; i < 8; i++) {
                sortedMintedIds.upc23[i] = mintedIds[212 + i];
            }
            // Populate UPC 25 minted tokenIds (12 items)
            for (uint256 i = 0; i < 12; i++) {
                sortedMintedIds.upc25[i] = mintedIds[220 + i];
            }
            // Populate UPC 26 minted tokenIds (7 items)
            for (uint256 i = 0; i < 7; i++) {
                sortedMintedIds.upc26[i] = mintedIds[232 + i];
            }
            // Populate UPC 28 minted tokenIds (9 items)
            for (uint256 i = 0; i < 9; i++) {
                sortedMintedIds.upc28[i] = mintedIds[239 + i];
            }
            // Populate UPC 29 minted tokenIds (3 items)
            for (uint256 i = 0; i < 3; i++) {
                sortedMintedIds.upc29[i] = mintedIds[248 + i];
            }
            // Populate UPC 31 minted tokenIds (13 items)
            for (uint256 i = 0; i < 13; i++) {
                sortedMintedIds.upc31[i] = mintedIds[251 + i];
            }
            // Populate UPC 32 minted tokenIds (5 items)
            for (uint256 i = 0; i < 5; i++) {
                sortedMintedIds.upc32[i] = mintedIds[264 + i];
            }
            // Populate UPC 33 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc33[i] = mintedIds[269 + i];
            }
            // Populate UPC 35 minted tokenIds (9 items)
            for (uint256 i = 0; i < 9; i++) {
                sortedMintedIds.upc35[i] = mintedIds[271 + i];
            }
            // Populate UPC 37 minted tokenIds (4 items)
            for (uint256 i = 0; i < 4; i++) {
                sortedMintedIds.upc37[i] = mintedIds[280 + i];
            }
            // Populate UPC 38 minted tokenIds (3 items)
            for (uint256 i = 0; i < 3; i++) {
                sortedMintedIds.upc38[i] = mintedIds[284 + i];
            }
            // Populate UPC 39 minted tokenIds (4 items)
            for (uint256 i = 0; i < 4; i++) {
                sortedMintedIds.upc39[i] = mintedIds[287 + i];
            }
            // Populate UPC 40 minted tokenIds (3 items)
            for (uint256 i = 0; i < 3; i++) {
                sortedMintedIds.upc40[i] = mintedIds[291 + i];
            }
            // Populate UPC 41 minted tokenIds (5 items)
            for (uint256 i = 0; i < 5; i++) {
                sortedMintedIds.upc41[i] = mintedIds[294 + i];
            }
            // Populate UPC 42 minted tokenIds (19 items)
            for (uint256 i = 0; i < 19; i++) {
                sortedMintedIds.upc42[i] = mintedIds[299 + i];
            }
            // Populate UPC 43 minted tokenIds (18 items)
            for (uint256 i = 0; i < 18; i++) {
                sortedMintedIds.upc43[i] = mintedIds[318 + i];
            }
            // Populate UPC 44 minted tokenIds (34 items)
            for (uint256 i = 0; i < 34; i++) {
                sortedMintedIds.upc44[i] = mintedIds[336 + i];
            }
            // Populate UPC 46 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc46[i] = mintedIds[370 + i];
            }
            // Populate UPC 47 minted tokenIds (14 items)
            for (uint256 i = 0; i < 14; i++) {
                sortedMintedIds.upc47[i] = mintedIds[371 + i];
            }
            // Populate UPC 48 minted tokenIds (6 items)
            for (uint256 i = 0; i < 6; i++) {
                sortedMintedIds.upc48[i] = mintedIds[385 + i];
            }
            // Populate UPC 49 minted tokenIds (145 items)
            for (uint256 i = 0; i < 145; i++) {
                sortedMintedIds.upc49[i] = mintedIds[391 + i];
            }
            // Step 2: Process each Banny body and dress them
            console.log("Processing 118 Banny bodies...");
            
            // Dress Banny 1000000001 (Alien)
            {
                uint256[] memory outfitIds = new uint256[](4);
                    outfitIds[0] = sortedMintedIds.upc7[1]; // V4: 7000000002 -> V5: sortedMintedIds.upc7[1]
                outfitIds[1] = sortedMintedIds.upc17[0]; // V4: 17000000001 -> V5: sortedMintedIds.upc17[0]
                outfitIds[2] = sortedMintedIds.upc26[3]; // V4: 26000000004 -> V5: sortedMintedIds.upc26[3]
                outfitIds[3] = sortedMintedIds.upc46[0]; // V4: 46000000001 -> V5: sortedMintedIds.upc46[0]

                resolver.decorateBannyWith(
                    address(hook),
                    1000000001,
                    sortedMintedIds.upc5[3],
                    outfitIds
                );
            }
            
            // Dress Banny 2000000002 (Pink)
            {
                uint256[] memory outfitIds = new uint256[](5);
                    outfitIds[0] = sortedMintedIds.upc7[0]; // V4: 7000000001 -> V5: sortedMintedIds.upc7[0]
                outfitIds[1] = sortedMintedIds.upc14[2]; // V4: 14000000003 -> V5: sortedMintedIds.upc14[2]
                outfitIds[2] = sortedMintedIds.upc19[11]; // V4: 19000000012 -> V5: sortedMintedIds.upc19[11]
                outfitIds[3] = sortedMintedIds.upc26[2]; // V4: 26000000003 -> V5: sortedMintedIds.upc26[2]
                outfitIds[4] = sortedMintedIds.upc35[5]; // V4: 35000000006 -> V5: sortedMintedIds.upc35[5]

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
                    outfitIds[0] = sortedMintedIds.upc18[1]; // V4: 18000000002 -> V5: sortedMintedIds.upc18[1]

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
                    outfitIds[0] = sortedMintedIds.upc21[0]; // V4: 21000000001 -> V5: sortedMintedIds.upc21[0]

                resolver.decorateBannyWith(
                    address(hook),
                    2000000005,
                    sortedMintedIds.upc5[4],
                    outfitIds
                );
            }
            
            // Dress Banny 2000000006 (Pink)
            {
                uint256[] memory outfitIds = new uint256[](2);
                    outfitIds[0] = sortedMintedIds.upc19[18]; // V4: 19000000019 -> V5: sortedMintedIds.upc19[18]
                outfitIds[1] = sortedMintedIds.upc25[8]; // V4: 25000000009 -> V5: sortedMintedIds.upc25[8]

                resolver.decorateBannyWith(
                    address(hook),
                    2000000006,
                    sortedMintedIds.upc5[7],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000001 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](3);
                    outfitIds[0] = sortedMintedIds.upc14[0]; // V4: 14000000001 -> V5: sortedMintedIds.upc14[0]
                outfitIds[1] = sortedMintedIds.upc26[0]; // V4: 26000000001 -> V5: sortedMintedIds.upc26[0]
                outfitIds[2] = sortedMintedIds.upc35[0]; // V4: 35000000001 -> V5: sortedMintedIds.upc35[0]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000001,
                    sortedMintedIds.upc6[0],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000003 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](2);
                    outfitIds[0] = sortedMintedIds.upc10[4]; // V4: 10000000005 -> V5: sortedMintedIds.upc10[4]
                outfitIds[1] = sortedMintedIds.upc44[2]; // V4: 44000000003 -> V5: sortedMintedIds.upc44[2]

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
                    outfitIds[0] = sortedMintedIds.upc32[0]; // V4: 32000000001 -> V5: sortedMintedIds.upc32[0]
                outfitIds[1] = sortedMintedIds.upc44[3]; // V4: 44000000004 -> V5: sortedMintedIds.upc44[3]

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
                    outfitIds[0] = sortedMintedIds.upc31[2]; // V4: 31000000003 -> V5: sortedMintedIds.upc31[2]
                outfitIds[1] = sortedMintedIds.upc47[2]; // V4: 47000000003 -> V5: sortedMintedIds.upc47[2]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000007,
                    sortedMintedIds.upc6[2],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000009 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](2);
                    outfitIds[0] = sortedMintedIds.upc35[1]; // V4: 35000000002 -> V5: sortedMintedIds.upc35[1]
                outfitIds[1] = sortedMintedIds.upc43[4]; // V4: 43000000005 -> V5: sortedMintedIds.upc43[4]

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
                    outfitIds[0] = sortedMintedIds.upc32[1]; // V4: 32000000002 -> V5: sortedMintedIds.upc32[1]
                outfitIds[1] = sortedMintedIds.upc35[3]; // V4: 35000000004 -> V5: sortedMintedIds.upc35[3]
                outfitIds[2] = sortedMintedIds.upc48[0]; // V4: 48000000001 -> V5: sortedMintedIds.upc48[0]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000010,
                    sortedMintedIds.upc6[3],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000011 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](3);
                    outfitIds[0] = sortedMintedIds.upc23[0]; // V4: 23000000001 -> V5: sortedMintedIds.upc23[0]
                outfitIds[1] = sortedMintedIds.upc39[0]; // V4: 39000000001 -> V5: sortedMintedIds.upc39[0]
                outfitIds[2] = sortedMintedIds.upc43[5]; // V4: 43000000006 -> V5: sortedMintedIds.upc43[5]

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
                    outfitIds[0] = sortedMintedIds.upc19[7]; // V4: 19000000008 -> V5: sortedMintedIds.upc19[7]
                outfitIds[1] = sortedMintedIds.upc31[5]; // V4: 31000000006 -> V5: sortedMintedIds.upc31[5]
                outfitIds[2] = sortedMintedIds.upc37[0]; // V4: 37000000001 -> V5: sortedMintedIds.upc37[0]
                outfitIds[3] = sortedMintedIds.upc43[6]; // V4: 43000000007 -> V5: sortedMintedIds.upc43[6]

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
                    outfitIds[0] = sortedMintedIds.upc25[4]; // V4: 25000000005 -> V5: sortedMintedIds.upc25[4]
                outfitIds[1] = sortedMintedIds.upc49[1]; // V4: 49000000002 -> V5: sortedMintedIds.upc49[1]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000017,
                    sortedMintedIds.upc5[1],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000022 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](3);
                    outfitIds[0] = sortedMintedIds.upc19[14]; // V4: 19000000015 -> V5: sortedMintedIds.upc19[14]
                outfitIds[1] = sortedMintedIds.upc38[1]; // V4: 38000000002 -> V5: sortedMintedIds.upc38[1]
                outfitIds[2] = sortedMintedIds.upc48[4]; // V4: 48000000005 -> V5: sortedMintedIds.upc48[4]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000022,
                    sortedMintedIds.upc6[10],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000023 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](4);
                    outfitIds[0] = sortedMintedIds.upc14[4]; // V4: 14000000005 -> V5: sortedMintedIds.upc14[4]
                outfitIds[1] = sortedMintedIds.upc25[7]; // V4: 25000000008 -> V5: sortedMintedIds.upc25[7]
                outfitIds[2] = sortedMintedIds.upc37[2]; // V4: 37000000003 -> V5: sortedMintedIds.upc37[2]
                outfitIds[3] = sortedMintedIds.upc42[6]; // V4: 42000000007 -> V5: sortedMintedIds.upc42[6]

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
                    outfitIds[0] = sortedMintedIds.upc15[3]; // V4: 15000000004 -> V5: sortedMintedIds.upc15[3]
                outfitIds[1] = sortedMintedIds.upc29[2]; // V4: 29000000003 -> V5: sortedMintedIds.upc29[2]
                outfitIds[2] = sortedMintedIds.upc39[2]; // V4: 39000000003 -> V5: sortedMintedIds.upc39[2]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000026,
                    sortedMintedIds.upc6[11],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000004 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                    outfitIds[0] = sortedMintedIds.upc28[1]; // V4: 28000000002 -> V5: sortedMintedIds.upc28[1]

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
                    outfitIds[0] = sortedMintedIds.upc10[0]; // V4: 10000000001 -> V5: sortedMintedIds.upc10[0]
                outfitIds[1] = sortedMintedIds.upc19[1]; // V4: 19000000002 -> V5: sortedMintedIds.upc19[1]
                outfitIds[2] = sortedMintedIds.upc25[1]; // V4: 25000000002 -> V5: sortedMintedIds.upc25[1]
                outfitIds[3] = sortedMintedIds.upc43[2]; // V4: 43000000003 -> V5: sortedMintedIds.upc43[2]

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
                    outfitIds[0] = sortedMintedIds.upc10[1]; // V4: 10000000002 -> V5: sortedMintedIds.upc10[1]
                outfitIds[1] = sortedMintedIds.upc18[0]; // V4: 18000000001 -> V5: sortedMintedIds.upc18[0]
                outfitIds[2] = sortedMintedIds.upc20[0]; // V4: 20000000001 -> V5: sortedMintedIds.upc20[0]
                outfitIds[3] = sortedMintedIds.upc44[0]; // V4: 44000000001 -> V5: sortedMintedIds.upc44[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000010,
                    sortedMintedIds.upc5[0],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000013 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                    outfitIds[0] = sortedMintedIds.upc31[1]; // V4: 31000000002 -> V5: sortedMintedIds.upc31[1]

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
                    outfitIds[0] = sortedMintedIds.upc10[5]; // V4: 10000000006 -> V5: sortedMintedIds.upc10[5]
                outfitIds[1] = sortedMintedIds.upc19[3]; // V4: 19000000004 -> V5: sortedMintedIds.upc19[3]
                outfitIds[2] = sortedMintedIds.upc25[2]; // V4: 25000000003 -> V5: sortedMintedIds.upc25[2]
                outfitIds[3] = sortedMintedIds.upc49[0]; // V4: 49000000001 -> V5: sortedMintedIds.upc49[0]

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
                    outfitIds[0] = sortedMintedIds.upc15[0]; // V4: 15000000001 -> V5: sortedMintedIds.upc15[0]
                outfitIds[1] = sortedMintedIds.upc26[1]; // V4: 26000000002 -> V5: sortedMintedIds.upc26[1]

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
                    outfitIds[0] = sortedMintedIds.upc10[6]; // V4: 10000000007 -> V5: sortedMintedIds.upc10[6]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000016,
                    sortedMintedIds.upc6[1],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000019 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                    outfitIds[0] = sortedMintedIds.upc19[4]; // V4: 19000000005 -> V5: sortedMintedIds.upc19[4]
                outfitIds[1] = sortedMintedIds.upc35[2]; // V4: 35000000003 -> V5: sortedMintedIds.upc35[2]
                outfitIds[2] = sortedMintedIds.upc42[1]; // V4: 42000000002 -> V5: sortedMintedIds.upc42[1]

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
                    outfitIds[0] = sortedMintedIds.upc31[6]; // V4: 31000000007 -> V5: sortedMintedIds.upc31[6]

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
                    outfitIds[0] = sortedMintedIds.upc19[8]; // V4: 19000000009 -> V5: sortedMintedIds.upc19[8]
                outfitIds[1] = sortedMintedIds.upc43[7]; // V4: 43000000008 -> V5: sortedMintedIds.upc43[7]

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
                    outfitIds[0] = sortedMintedIds.upc13[0]; // V4: 13000000001 -> V5: sortedMintedIds.upc13[0]
                outfitIds[1] = sortedMintedIds.upc19[10]; // V4: 19000000011 -> V5: sortedMintedIds.upc19[10]
                outfitIds[2] = sortedMintedIds.upc25[5]; // V4: 25000000006 -> V5: sortedMintedIds.upc25[5]
                outfitIds[3] = sortedMintedIds.upc42[3]; // V4: 42000000004 -> V5: sortedMintedIds.upc42[3]

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
                    outfitIds[0] = sortedMintedIds.upc25[6]; // V4: 25000000007 -> V5: sortedMintedIds.upc25[6]

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
                    outfitIds[0] = sortedMintedIds.upc16[0]; // V4: 16000000001 -> V5: sortedMintedIds.upc16[0]
                outfitIds[1] = sortedMintedIds.upc17[1]; // V4: 17000000002 -> V5: sortedMintedIds.upc17[1]
                outfitIds[2] = sortedMintedIds.upc31[8]; // V4: 31000000009 -> V5: sortedMintedIds.upc31[8]
                outfitIds[3] = sortedMintedIds.upc33[0]; // V4: 33000000001 -> V5: sortedMintedIds.upc33[0]
                outfitIds[4] = sortedMintedIds.upc48[1]; // V4: 48000000002 -> V5: sortedMintedIds.upc48[1]

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
                    outfitIds[0] = sortedMintedIds.upc32[2]; // V4: 32000000003 -> V5: sortedMintedIds.upc32[2]
                outfitIds[1] = sortedMintedIds.upc48[2]; // V4: 48000000003 -> V5: sortedMintedIds.upc48[2]

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
                    outfitIds[0] = sortedMintedIds.upc23[1]; // V4: 23000000002 -> V5: sortedMintedIds.upc23[1]
                outfitIds[1] = sortedMintedIds.upc41[0]; // V4: 41000000001 -> V5: sortedMintedIds.upc41[0]

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
                    outfitIds[0] = sortedMintedIds.upc23[3]; // V4: 23000000004 -> V5: sortedMintedIds.upc23[3]
                outfitIds[1] = sortedMintedIds.upc41[2]; // V4: 41000000003 -> V5: sortedMintedIds.upc41[2]

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
                    outfitIds[0] = sortedMintedIds.upc23[4]; // V4: 23000000005 -> V5: sortedMintedIds.upc23[4]
                outfitIds[1] = sortedMintedIds.upc41[3]; // V4: 41000000004 -> V5: sortedMintedIds.upc41[3]

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
                    outfitIds[0] = sortedMintedIds.upc23[2]; // V4: 23000000003 -> V5: sortedMintedIds.upc23[2]
                outfitIds[1] = sortedMintedIds.upc41[1]; // V4: 41000000002 -> V5: sortedMintedIds.upc41[1]

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
                    outfitIds[0] = sortedMintedIds.upc19[12]; // V4: 19000000013 -> V5: sortedMintedIds.upc19[12]
                outfitIds[1] = sortedMintedIds.upc31[9]; // V4: 31000000010 -> V5: sortedMintedIds.upc31[9]
                outfitIds[2] = sortedMintedIds.upc35[6]; // V4: 35000000007 -> V5: sortedMintedIds.upc35[6]
                outfitIds[3] = sortedMintedIds.upc47[4]; // V4: 47000000005 -> V5: sortedMintedIds.upc47[4]

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
                    outfitIds[0] = sortedMintedIds.upc10[11]; // V4: 10000000012 -> V5: sortedMintedIds.upc10[11]
                outfitIds[1] = sortedMintedIds.upc18[2]; // V4: 18000000003 -> V5: sortedMintedIds.upc18[2]
                outfitIds[2] = sortedMintedIds.upc20[7]; // V4: 20000000008 -> V5: sortedMintedIds.upc20[7]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000052,
                    sortedMintedIds.upc5[5],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000054 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                    outfitIds[0] = sortedMintedIds.upc15[1]; // V4: 15000000002 -> V5: sortedMintedIds.upc15[1]
                outfitIds[1] = sortedMintedIds.upc26[4]; // V4: 26000000005 -> V5: sortedMintedIds.upc26[4]
                outfitIds[2] = sortedMintedIds.upc44[7]; // V4: 44000000008 -> V5: sortedMintedIds.upc44[7]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000054,
                    sortedMintedIds.upc6[9],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000055 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                    outfitIds[0] = sortedMintedIds.upc19[15]; // V4: 19000000016 -> V5: sortedMintedIds.upc19[15]
                outfitIds[1] = sortedMintedIds.upc39[1]; // V4: 39000000002 -> V5: sortedMintedIds.upc39[1]
                outfitIds[2] = sortedMintedIds.upc44[8]; // V4: 44000000009 -> V5: sortedMintedIds.upc44[8]

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
                    outfitIds[0] = sortedMintedIds.upc15[2]; // V4: 15000000003 -> V5: sortedMintedIds.upc15[2]
                outfitIds[1] = sortedMintedIds.upc23[6]; // V4: 23000000007 -> V5: sortedMintedIds.upc23[6]
                outfitIds[2] = sortedMintedIds.upc40[0]; // V4: 40000000001 -> V5: sortedMintedIds.upc40[0]
                outfitIds[3] = sortedMintedIds.upc49[3]; // V4: 49000000004 -> V5: sortedMintedIds.upc49[3]

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
                    outfitIds[0] = sortedMintedIds.upc19[16]; // V4: 19000000017 -> V5: sortedMintedIds.upc19[16]
                outfitIds[1] = sortedMintedIds.upc28[7]; // V4: 28000000008 -> V5: sortedMintedIds.upc28[7]
                outfitIds[2] = sortedMintedIds.upc38[2]; // V4: 38000000003 -> V5: sortedMintedIds.upc38[2]

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
                    outfitIds[0] = sortedMintedIds.upc13[2]; // V4: 13000000003 -> V5: sortedMintedIds.upc13[2]
                outfitIds[1] = sortedMintedIds.upc48[5]; // V4: 48000000006 -> V5: sortedMintedIds.upc48[5]

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
                    outfitIds[0] = sortedMintedIds.upc19[17]; // V4: 19000000018 -> V5: sortedMintedIds.upc19[17]
                outfitIds[1] = sortedMintedIds.upc29[1]; // V4: 29000000002 -> V5: sortedMintedIds.upc29[1]
                outfitIds[2] = sortedMintedIds.upc38[0]; // V4: 38000000001 -> V5: sortedMintedIds.upc38[0]

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
                    outfitIds[0] = sortedMintedIds.upc31[10]; // V4: 31000000011 -> V5: sortedMintedIds.upc31[10]
                outfitIds[1] = sortedMintedIds.upc43[16]; // V4: 43000000017 -> V5: sortedMintedIds.upc43[16]

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
                    outfitIds[0] = sortedMintedIds.upc19[19]; // V4: 19000000020 -> V5: sortedMintedIds.upc19[19]
                outfitIds[1] = sortedMintedIds.upc25[9]; // V4: 25000000010 -> V5: sortedMintedIds.upc25[9]
                outfitIds[2] = sortedMintedIds.upc43[17]; // V4: 43000000018 -> V5: sortedMintedIds.upc43[17]

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
                    outfitIds[0] = sortedMintedIds.upc15[4]; // V4: 15000000005 -> V5: sortedMintedIds.upc15[4]
                outfitIds[1] = sortedMintedIds.upc19[20]; // V4: 19000000021 -> V5: sortedMintedIds.upc19[20]
                outfitIds[2] = sortedMintedIds.upc25[10]; // V4: 25000000011 -> V5: sortedMintedIds.upc25[10]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000080,
                    sortedMintedIds.upc6[12],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000085 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                    outfitIds[0] = sortedMintedIds.upc31[12]; // V4: 31000000013 -> V5: sortedMintedIds.upc31[12]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000085,
                    0,
                    outfitIds
                );
            }
            
            // Step 3: Transfer all assets to rightful owners
            console.log("Transferring %d tokens to rightful owners", mintedIds.length);
            
            // Transfer UPC 1 (minted tokenId mintedIds[0]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[0]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[1]) to 0xA2Fa6144168751D116336B58C5288feaF8bb12C1
            IERC721(address(hook)).transferFrom(address(this), 0xA2Fa6144168751D116336B58C5288feaF8bb12C1, mintedIds[1]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[2]) to 0x63A2368F4B509438ca90186cb1C15156713D5834
            IERC721(address(hook)).transferFrom(address(this), 0x63A2368F4B509438ca90186cb1C15156713D5834, mintedIds[2]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[3]) to 0x15b61e9b0637f45dc0858f083cd240267924125d
            IERC721(address(hook)).transferFrom(address(this), 0x15b61e9b0637f45dc0858f083cd240267924125d, mintedIds[3]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[4]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[4]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[5]) to 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe
            IERC721(address(hook)).transferFrom(address(this), 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe, mintedIds[5]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[6]) to 0x5dee86b297755b3F2ce65e09BA3A700579A9020B
            IERC721(address(hook)).transferFrom(address(this), 0x5dee86b297755b3F2ce65e09BA3A700579A9020B, mintedIds[6]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[7]) to 0x817738DC393d682Ca5fBb268707b99F2aAe96baE
            IERC721(address(hook)).transferFrom(address(this), 0x817738DC393d682Ca5fBb268707b99F2aAe96baE, mintedIds[7]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[8]) to 0xa13d49fCbf79EAF6A0a58cBDD3361422DB4eAfF1
            IERC721(address(hook)).transferFrom(address(this), 0xa13d49fCbf79EAF6A0a58cBDD3361422DB4eAfF1, mintedIds[8]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[9]) to 0x516cAfD745Ec780D20f61c0d71fe258eA765222D
            IERC721(address(hook)).transferFrom(address(this), 0x516cAfD745Ec780D20f61c0d71fe258eA765222D, mintedIds[9]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[10]) to 0x126eeFa566ABF5aC3EfDAeF52d79E962CFFdB448
            IERC721(address(hook)).transferFrom(address(this), 0x126eeFa566ABF5aC3EfDAeF52d79E962CFFdB448, mintedIds[10]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[11]) to 0x289715fFBB2f4b482e2917D2f183FeAb564ec84F
            IERC721(address(hook)).transferFrom(address(this), 0x289715fFBB2f4b482e2917D2f183FeAb564ec84F, mintedIds[11]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[12]) to 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb
            IERC721(address(hook)).transferFrom(address(this), 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb, mintedIds[12]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[13]) to 0x1786D033D5CbCC235B673e872c7613c2F83DA583
            IERC721(address(hook)).transferFrom(address(this), 0x1786D033D5CbCC235B673e872c7613c2F83DA583, mintedIds[13]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[14]) to 0x38EED3CCeED88f380E436eb21811250797c453C5
            IERC721(address(hook)).transferFrom(address(this), 0x38EED3CCeED88f380E436eb21811250797c453C5, mintedIds[14]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[15]) to 0xE16a238d207B9ac8B419C7A866b0De013c73357B
            IERC721(address(hook)).transferFrom(address(this), 0xE16a238d207B9ac8B419C7A866b0De013c73357B, mintedIds[15]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[16]) to 0x0b2c9E0ee3057f4B9b0c2e42894a3D5A9B32b5Af
            IERC721(address(hook)).transferFrom(address(this), 0x0b2c9E0ee3057f4B9b0c2e42894a3D5A9B32b5Af, mintedIds[16]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[17]) to 0x0Cb1D93daEc77Df2ED7Db31C040Fd2174452bD9F
            IERC721(address(hook)).transferFrom(address(this), 0x0Cb1D93daEc77Df2ED7Db31C040Fd2174452bD9F, mintedIds[17]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[18]) to 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf
            IERC721(address(hook)).transferFrom(address(this), 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf, mintedIds[18]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[19]) to 0x6a099Bb96DDF3963d5AddCAbDC0221914cF80b1F
            IERC721(address(hook)).transferFrom(address(this), 0x6a099Bb96DDF3963d5AddCAbDC0221914cF80b1F, mintedIds[19]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[20]) to 0x87084347AeBADc626e8569E0D386928dade2ba09
            IERC721(address(hook)).transferFrom(address(this), 0x87084347AeBADc626e8569E0D386928dade2ba09, mintedIds[20]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[21]) to 0x79d1E7F1A6E0Bbb3278a9d2B782e3A8983444cb6
            IERC721(address(hook)).transferFrom(address(this), 0x79d1E7F1A6E0Bbb3278a9d2B782e3A8983444cb6, mintedIds[21]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[22]) to 0x546B4A7A30b3193Badf70E1d43D8142928F3db0b
            IERC721(address(hook)).transferFrom(address(this), 0x546B4A7A30b3193Badf70E1d43D8142928F3db0b, mintedIds[22]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[23]) to 0x08cF1208e638a5A3623be58d600e35c6199baa9C
            IERC721(address(hook)).transferFrom(address(this), 0x08cF1208e638a5A3623be58d600e35c6199baa9C, mintedIds[23]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[24]) to 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79
            IERC721(address(hook)).transferFrom(address(this), 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79, mintedIds[24]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[25]) to 0xe21A272c4D22eD40678a0168b4acd006bca8A482
            IERC721(address(hook)).transferFrom(address(this), 0xe21A272c4D22eD40678a0168b4acd006bca8A482, mintedIds[25]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[26]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[26]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[27]) to 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe
            IERC721(address(hook)).transferFrom(address(this), 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe, mintedIds[27]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[28]) to 0x7D0068d0D8fC2Aa15d897448B348Fa9B30f6d4c9
            IERC721(address(hook)).transferFrom(address(this), 0x7D0068d0D8fC2Aa15d897448B348Fa9B30f6d4c9, mintedIds[28]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[29]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[29]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[30]) to 0x898e24EBC9dAf5a9930f10def8B6a373F859C101
            IERC721(address(hook)).transferFrom(address(this), 0x898e24EBC9dAf5a9930f10def8B6a373F859C101, mintedIds[30]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[31]) to 0x898e24EBC9dAf5a9930f10def8B6a373F859C101
            IERC721(address(hook)).transferFrom(address(this), 0x898e24EBC9dAf5a9930f10def8B6a373F859C101, mintedIds[31]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[32]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[32]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[33]) to 0x961d4191965C49537c88F764D88318872CE405bE
            IERC721(address(hook)).transferFrom(address(this), 0x961d4191965C49537c88F764D88318872CE405bE, mintedIds[33]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[34]) to 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07
            IERC721(address(hook)).transferFrom(address(this), 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07, mintedIds[34]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[35]) to 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59
            IERC721(address(hook)).transferFrom(address(this), 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59, mintedIds[35]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[36]) to 0x8b80755C441d355405CA7571443Bb9247B77Ec16
            IERC721(address(hook)).transferFrom(address(this), 0x8b80755C441d355405CA7571443Bb9247B77Ec16, mintedIds[36]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[37]) to 0x8b80755C441d355405CA7571443Bb9247B77Ec16
            IERC721(address(hook)).transferFrom(address(this), 0x8b80755C441d355405CA7571443Bb9247B77Ec16, mintedIds[37]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[38]) to 0xa13d49fCbf79EAF6A0a58cBDD3361422DB4eAfF1
            IERC721(address(hook)).transferFrom(address(this), 0xa13d49fCbf79EAF6A0a58cBDD3361422DB4eAfF1, mintedIds[38]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[39]) to 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1
            IERC721(address(hook)).transferFrom(address(this), 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1, mintedIds[39]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[40]) to 0x0447AD1BdC0fFA06f7029c8E63F4De21E65255d2
            IERC721(address(hook)).transferFrom(address(this), 0x0447AD1BdC0fFA06f7029c8E63F4De21E65255d2, mintedIds[40]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[41]) to 0x5706d5aD7A68bf8692bD341234bE44ca7Bf2f654
            IERC721(address(hook)).transferFrom(address(this), 0x5706d5aD7A68bf8692bD341234bE44ca7Bf2f654, mintedIds[41]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[42]) to 0x679d87D8640e66778c3419D164998E720D7495f6
            IERC721(address(hook)).transferFrom(address(this), 0x679d87D8640e66778c3419D164998E720D7495f6, mintedIds[42]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[43]) to 0x817738DC393d682Ca5fBb268707b99F2aAe96baE
            IERC721(address(hook)).transferFrom(address(this), 0x817738DC393d682Ca5fBb268707b99F2aAe96baE, mintedIds[43]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[44]) to 0x4A290F18c35bBFE97B2557cf765De9387726dE39
            IERC721(address(hook)).transferFrom(address(this), 0x4A290F18c35bBFE97B2557cf765De9387726dE39, mintedIds[44]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[45]) to 0x25171bD3cD3231c3057c96F38E32E3bA6681497a
            IERC721(address(hook)).transferFrom(address(this), 0x25171bD3cD3231c3057c96F38E32E3bA6681497a, mintedIds[45]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[46]) to 0xa7226e53F3100C093A0a5BCb6E3D0976EB3db1D6
            IERC721(address(hook)).transferFrom(address(this), 0xa7226e53F3100C093A0a5BCb6E3D0976EB3db1D6, mintedIds[46]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[47]) to 0x76A6D08b82034b397E7e09dAe4377C18F132BbB8
            IERC721(address(hook)).transferFrom(address(this), 0x76A6D08b82034b397E7e09dAe4377C18F132BbB8, mintedIds[47]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[48]) to 0x809C9f8dd8CA93A41c3adca4972Fa234C28F7714
            IERC721(address(hook)).transferFrom(address(this), 0x809C9f8dd8CA93A41c3adca4972Fa234C28F7714, mintedIds[48]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[49]) to 0x809C9f8dd8CA93A41c3adca4972Fa234C28F7714
            IERC721(address(hook)).transferFrom(address(this), 0x809C9f8dd8CA93A41c3adca4972Fa234C28F7714, mintedIds[49]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[50]) to 0x126eeFa566ABF5aC3EfDAeF52d79E962CFFdB448
            IERC721(address(hook)).transferFrom(address(this), 0x126eeFa566ABF5aC3EfDAeF52d79E962CFFdB448, mintedIds[50]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[51]) to 0x77fb4fa1ABA92576942aD34BC47834059b84e693
            IERC721(address(hook)).transferFrom(address(this), 0x77fb4fa1ABA92576942aD34BC47834059b84e693, mintedIds[51]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[52]) to 0x08cEb8Bba685ee708C9c4c65576837cbE19B9dea
            IERC721(address(hook)).transferFrom(address(this), 0x08cEb8Bba685ee708C9c4c65576837cbE19B9dea, mintedIds[52]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[53]) to 0x690C01b4b1389D9D9265820F77DCbD2A6Ad04e6c
            IERC721(address(hook)).transferFrom(address(this), 0x690C01b4b1389D9D9265820F77DCbD2A6Ad04e6c, mintedIds[53]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[54]) to 0x690C01b4b1389D9D9265820F77DCbD2A6Ad04e6c
            IERC721(address(hook)).transferFrom(address(this), 0x690C01b4b1389D9D9265820F77DCbD2A6Ad04e6c, mintedIds[54]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[55]) to 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e
            IERC721(address(hook)).transferFrom(address(this), 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e, mintedIds[55]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[56]) to 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e
            IERC721(address(hook)).transferFrom(address(this), 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e, mintedIds[56]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[57]) to 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e
            IERC721(address(hook)).transferFrom(address(this), 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e, mintedIds[57]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[58]) to 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e
            IERC721(address(hook)).transferFrom(address(this), 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e, mintedIds[58]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[59]) to 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e
            IERC721(address(hook)).transferFrom(address(this), 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e, mintedIds[59]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[60]) to 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e
            IERC721(address(hook)).transferFrom(address(this), 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e, mintedIds[60]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[61]) to 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e
            IERC721(address(hook)).transferFrom(address(this), 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e, mintedIds[61]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[62]) to 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e
            IERC721(address(hook)).transferFrom(address(this), 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e, mintedIds[62]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[63]) to 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e
            IERC721(address(hook)).transferFrom(address(this), 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e, mintedIds[63]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[64]) to 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e
            IERC721(address(hook)).transferFrom(address(this), 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e, mintedIds[64]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[65]) to 0x5A00e8683f37e8B08C744054a0EF606a18b1aEF7
            IERC721(address(hook)).transferFrom(address(this), 0x5A00e8683f37e8B08C744054a0EF606a18b1aEF7, mintedIds[65]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[66]) to 0x59E98040E53d7dC1900B4daf36D9Fbbd4a8f1dA2
            IERC721(address(hook)).transferFrom(address(this), 0x59E98040E53d7dC1900B4daf36D9Fbbd4a8f1dA2, mintedIds[66]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[67]) to 0x59E98040E53d7dC1900B4daf36D9Fbbd4a8f1dA2
            IERC721(address(hook)).transferFrom(address(this), 0x59E98040E53d7dC1900B4daf36D9Fbbd4a8f1dA2, mintedIds[67]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[68]) to 0x59E98040E53d7dC1900B4daf36D9Fbbd4a8f1dA2
            IERC721(address(hook)).transferFrom(address(this), 0x59E98040E53d7dC1900B4daf36D9Fbbd4a8f1dA2, mintedIds[68]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[69]) to 0x46f3cC6a1c00A5cD8864d2B92f128196CAE07D15
            IERC721(address(hook)).transferFrom(address(this), 0x46f3cC6a1c00A5cD8864d2B92f128196CAE07D15, mintedIds[69]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[70]) to 0x08cF1208e638a5A3623be58d600e35c6199baa9C
            IERC721(address(hook)).transferFrom(address(this), 0x08cF1208e638a5A3623be58d600e35c6199baa9C, mintedIds[70]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[71]) to 0x381CC779761212344f8400373a994d29E17522c6
            IERC721(address(hook)).transferFrom(address(this), 0x381CC779761212344f8400373a994d29E17522c6, mintedIds[71]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[72]) to 0x849151d7D0bF1F34b70d5caD5149D28CC2308bf1
            IERC721(address(hook)).transferFrom(address(this), 0x849151d7D0bF1F34b70d5caD5149D28CC2308bf1, mintedIds[72]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[73]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[73]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[74]) to 0x63A2368F4B509438ca90186cb1C15156713D5834
            IERC721(address(hook)).transferFrom(address(this), 0x63A2368F4B509438ca90186cb1C15156713D5834, mintedIds[74]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[75]) to 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54
            IERC721(address(hook)).transferFrom(address(this), 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54, mintedIds[75]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[76]) to 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54
            IERC721(address(hook)).transferFrom(address(this), 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54, mintedIds[76]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[77]) to 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54
            IERC721(address(hook)).transferFrom(address(this), 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54, mintedIds[77]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[78]) to 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54
            IERC721(address(hook)).transferFrom(address(this), 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54, mintedIds[78]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[79]) to 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54
            IERC721(address(hook)).transferFrom(address(this), 0x95E9A0c113AA9931a4230f91AdE08A491D3f8d54, mintedIds[79]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[80]) to 0xf32dd1Bd55bD14d929218499a2E7D106F72f79c7
            IERC721(address(hook)).transferFrom(address(this), 0xf32dd1Bd55bD14d929218499a2E7D106F72f79c7, mintedIds[80]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[81]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[81]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[82]) to 0xe21A272c4D22eD40678a0168b4acd006bca8A482
            IERC721(address(hook)).transferFrom(address(this), 0xe21A272c4D22eD40678a0168b4acd006bca8A482, mintedIds[82]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[83]) to 0xe21A272c4D22eD40678a0168b4acd006bca8A482
            IERC721(address(hook)).transferFrom(address(this), 0xe21A272c4D22eD40678a0168b4acd006bca8A482, mintedIds[83]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[84]) to 0x80581C6e88Ce00095F85cdf24bB760f16d6eC0D6
            IERC721(address(hook)).transferFrom(address(this), 0x80581C6e88Ce00095F85cdf24bB760f16d6eC0D6, mintedIds[84]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[85]) to 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2
            IERC721(address(hook)).transferFrom(address(this), 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2, mintedIds[85]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[86]) to 0x30670D81E487c80b9EDc54370e6EaF943B6EAB39
            IERC721(address(hook)).transferFrom(address(this), 0x30670D81E487c80b9EDc54370e6EaF943B6EAB39, mintedIds[86]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[87]) to 0x60535A6605958fFf6cEC5B1e92892601EFb3473b
            IERC721(address(hook)).transferFrom(address(this), 0x60535A6605958fFf6cEC5B1e92892601EFb3473b, mintedIds[87]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[88]) to 0x34724D71cE674FcD4d06e60Dd1BaA88c14D36b75
            IERC721(address(hook)).transferFrom(address(this), 0x34724D71cE674FcD4d06e60Dd1BaA88c14D36b75, mintedIds[88]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[89]) to 0xA99c384f43e72B65BB51fE33b85CE12A32C09526
            IERC721(address(hook)).transferFrom(address(this), 0xA99c384f43e72B65BB51fE33b85CE12A32C09526, mintedIds[89]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[90]) to 0x898e24EBC9dAf5a9930f10def8B6a373F859C101
            IERC721(address(hook)).transferFrom(address(this), 0x898e24EBC9dAf5a9930f10def8B6a373F859C101, mintedIds[90]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[91]) to 0x898e24EBC9dAf5a9930f10def8B6a373F859C101
            IERC721(address(hook)).transferFrom(address(this), 0x898e24EBC9dAf5a9930f10def8B6a373F859C101, mintedIds[91]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[92]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[92]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[93]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[93]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[94]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[94]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[95]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[95]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[96]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[96]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[97]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[97]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[98]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[98]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[99]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[99]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[100]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[100]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[101]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[101]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[102]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[102]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[103]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[103]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[104]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[104]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[105]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[105]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[106]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[106]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[107]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[107]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[108]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[108]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[109]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[109]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[110]) to 0xAAeD9fFF9858d48925904E391B77892BA5Fda824
            IERC721(address(hook)).transferFrom(address(this), 0xAAeD9fFF9858d48925904E391B77892BA5Fda824, mintedIds[110]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[111]) to 0x2feb329b9289b60064904Fa61Fc347157a5AEd6a
            IERC721(address(hook)).transferFrom(address(this), 0x2feb329b9289b60064904Fa61Fc347157a5AEd6a, mintedIds[111]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[112]) to 0xDfd60a8E1e17FBb78E8CA332906A822D862f3D57
            IERC721(address(hook)).transferFrom(address(this), 0xDfd60a8E1e17FBb78E8CA332906A822D862f3D57, mintedIds[112]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[113]) to 0xBD07B7Ab42cE411A752DB600604ECA7fE5501947
            IERC721(address(hook)).transferFrom(address(this), 0xBD07B7Ab42cE411A752DB600604ECA7fE5501947, mintedIds[113]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[114]) to 0x9f729294b308f79243285348A7Be3f58ae5ED31A
            IERC721(address(hook)).transferFrom(address(this), 0x9f729294b308f79243285348A7Be3f58ae5ED31A, mintedIds[114]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[115]) to 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2
            IERC721(address(hook)).transferFrom(address(this), 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2, mintedIds[115]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[116]) to 0x1c6d61F3d8976A8aCDd311ecdFa533B8ECd0AC61
            IERC721(address(hook)).transferFrom(address(this), 0x1c6d61F3d8976A8aCDd311ecdFa533B8ECd0AC61, mintedIds[116]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[117]) to 0x5138a42C3D5065debE950deBDa10C1f38150a908
            IERC721(address(hook)).transferFrom(address(this), 0x5138a42C3D5065debE950deBDa10C1f38150a908, mintedIds[117]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[118]) to 0xa5F8911d4CFd60a6697479f078409434424fe666
            IERC721(address(hook)).transferFrom(address(this), 0xa5F8911d4CFd60a6697479f078409434424fe666, mintedIds[118]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[119]) to 0x4A290F18c35bBFE97B2557cf765De9387726dE39
            IERC721(address(hook)).transferFrom(address(this), 0x4A290F18c35bBFE97B2557cf765De9387726dE39, mintedIds[119]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[120]) to 0xf0FE43a75Ff248FD2E75D33fa1ebde71c6d1abAd
            IERC721(address(hook)).transferFrom(address(this), 0xf0FE43a75Ff248FD2E75D33fa1ebde71c6d1abAd, mintedIds[120]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[121]) to 0x7044d88283c8FFF0679b711C0cd81f1a6754C843
            IERC721(address(hook)).transferFrom(address(this), 0x7044d88283c8FFF0679b711C0cd81f1a6754C843, mintedIds[121]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[122]) to 0xe21A272c4D22eD40678a0168b4acd006bca8A482
            IERC721(address(hook)).transferFrom(address(this), 0xe21A272c4D22eD40678a0168b4acd006bca8A482, mintedIds[122]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[123]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[123]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[124]) to 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2
            IERC721(address(hook)).transferFrom(address(this), 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2, mintedIds[124]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[125]) to 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2
            IERC721(address(hook)).transferFrom(address(this), 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2, mintedIds[125]);
            
            // Transfer UPC 11 (minted tokenId mintedIds[126]) to 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79
            IERC721(address(hook)).transferFrom(address(this), 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79, mintedIds[126]);
            
            // Transfer UPC 13 (minted tokenId mintedIds[127]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[127]);
            
            // Transfer UPC 13 (minted tokenId mintedIds[128]) to 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2
            IERC721(address(hook)).transferFrom(address(this), 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2, mintedIds[128]);
            
            // Transfer UPC 14 (minted tokenId mintedIds[129]) to 0x87084347AeBADc626e8569E0D386928dade2ba09
            IERC721(address(hook)).transferFrom(address(this), 0x87084347AeBADc626e8569E0D386928dade2ba09, mintedIds[129]);
            
            // Transfer UPC 14 (minted tokenId mintedIds[130]) to 0x15b61e9b0637f45dc0858f083cd240267924125d
            IERC721(address(hook)).transferFrom(address(this), 0x15b61e9b0637f45dc0858f083cd240267924125d, mintedIds[130]);
            
            // Transfer UPC 14 (minted tokenId mintedIds[131]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[131]);
            
            // Transfer UPC 17 (minted tokenId mintedIds[132]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[132]);
            
            // Transfer UPC 17 (minted tokenId mintedIds[133]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[133]);
            
            // Transfer UPC 17 (minted tokenId mintedIds[134]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[134]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[135]) to 0x0447AD1BdC0fFA06f7029c8E63F4De21E65255d2
            IERC721(address(hook)).transferFrom(address(this), 0x0447AD1BdC0fFA06f7029c8E63F4De21E65255d2, mintedIds[135]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[136]) to 0x516cAfD745Ec780D20f61c0d71fe258eA765222D
            IERC721(address(hook)).transferFrom(address(this), 0x516cAfD745Ec780D20f61c0d71fe258eA765222D, mintedIds[136]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[137]) to 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf
            IERC721(address(hook)).transferFrom(address(this), 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf, mintedIds[137]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[138]) to 0x87084347AeBADc626e8569E0D386928dade2ba09
            IERC721(address(hook)).transferFrom(address(this), 0x87084347AeBADc626e8569E0D386928dade2ba09, mintedIds[138]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[139]) to 0x08cF1208e638a5A3623be58d600e35c6199baa9C
            IERC721(address(hook)).transferFrom(address(this), 0x08cF1208e638a5A3623be58d600e35c6199baa9C, mintedIds[139]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[140]) to 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2
            IERC721(address(hook)).transferFrom(address(this), 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2, mintedIds[140]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[141]) to 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2
            IERC721(address(hook)).transferFrom(address(this), 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2, mintedIds[141]);
            
            // Transfer UPC 20 (minted tokenId mintedIds[142]) to 0x289715fFBB2f4b482e2917D2f183FeAb564ec84F
            IERC721(address(hook)).transferFrom(address(this), 0x289715fFBB2f4b482e2917D2f183FeAb564ec84F, mintedIds[142]);
            
            // Transfer UPC 20 (minted tokenId mintedIds[143]) to 0x79d1E7F1A6E0Bbb3278a9d2B782e3A8983444cb6
            IERC721(address(hook)).transferFrom(address(this), 0x79d1E7F1A6E0Bbb3278a9d2B782e3A8983444cb6, mintedIds[143]);
            
            // Transfer UPC 20 (minted tokenId mintedIds[144]) to 0x15b61e9b0637f45dc0858f083cd240267924125d
            IERC721(address(hook)).transferFrom(address(this), 0x15b61e9b0637f45dc0858f083cd240267924125d, mintedIds[144]);
            
            // Transfer UPC 20 (minted tokenId mintedIds[145]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[145]);
            
            // Transfer UPC 20 (minted tokenId mintedIds[146]) to 0xe21A272c4D22eD40678a0168b4acd006bca8A482
            IERC721(address(hook)).transferFrom(address(this), 0xe21A272c4D22eD40678a0168b4acd006bca8A482, mintedIds[146]);
            
            // Transfer UPC 20 (minted tokenId mintedIds[147]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[147]);
            
            // Transfer UPC 21 (minted tokenId mintedIds[148]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[148]);
            
            // Transfer UPC 23 (minted tokenId mintedIds[149]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[149]);
            
            // Transfer UPC 23 (minted tokenId mintedIds[150]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[150]);
            
            // Transfer UPC 25 (minted tokenId mintedIds[151]) to 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1
            IERC721(address(hook)).transferFrom(address(this), 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1, mintedIds[151]);
            
            // Transfer UPC 25 (minted tokenId mintedIds[152]) to 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf
            IERC721(address(hook)).transferFrom(address(this), 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf, mintedIds[152]);
            
            // Transfer UPC 25 (minted tokenId mintedIds[153]) to 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2
            IERC721(address(hook)).transferFrom(address(this), 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2, mintedIds[153]);
            
            // Transfer UPC 26 (minted tokenId mintedIds[154]) to 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2
            IERC721(address(hook)).transferFrom(address(this), 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2, mintedIds[154]);
            
            // Transfer UPC 26 (minted tokenId mintedIds[155]) to 0x1c6d61F3d8976A8aCDd311ecdFa533B8ECd0AC61
            IERC721(address(hook)).transferFrom(address(this), 0x1c6d61F3d8976A8aCDd311ecdFa533B8ECd0AC61, mintedIds[155]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[156]) to 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07
            IERC721(address(hook)).transferFrom(address(this), 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07, mintedIds[156]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[157]) to 0x0447AD1BdC0fFA06f7029c8E63F4De21E65255d2
            IERC721(address(hook)).transferFrom(address(this), 0x0447AD1BdC0fFA06f7029c8E63F4De21E65255d2, mintedIds[157]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[158]) to 0x87084347AeBADc626e8569E0D386928dade2ba09
            IERC721(address(hook)).transferFrom(address(this), 0x87084347AeBADc626e8569E0D386928dade2ba09, mintedIds[158]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[159]) to 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e
            IERC721(address(hook)).transferFrom(address(this), 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e, mintedIds[159]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[160]) to 0x08cF1208e638a5A3623be58d600e35c6199baa9C
            IERC721(address(hook)).transferFrom(address(this), 0x08cF1208e638a5A3623be58d600e35c6199baa9C, mintedIds[160]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[161]) to 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2
            IERC721(address(hook)).transferFrom(address(this), 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2, mintedIds[161]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[162]) to 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2
            IERC721(address(hook)).transferFrom(address(this), 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2, mintedIds[162]);
            
            // Transfer UPC 29 (minted tokenId mintedIds[163]) to 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79
            IERC721(address(hook)).transferFrom(address(this), 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79, mintedIds[163]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[164]) to 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59
            IERC721(address(hook)).transferFrom(address(this), 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59, mintedIds[164]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[165]) to 0xf0FE43a75Ff248FD2E75D33fa1ebde71c6d1abAd
            IERC721(address(hook)).transferFrom(address(this), 0xf0FE43a75Ff248FD2E75D33fa1ebde71c6d1abAd, mintedIds[165]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[166]) to 0x08cEb8Bba685ee708C9c4c65576837cbE19B9dea
            IERC721(address(hook)).transferFrom(address(this), 0x08cEb8Bba685ee708C9c4c65576837cbE19B9dea, mintedIds[166]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[167]) to 0x08cF1208e638a5A3623be58d600e35c6199baa9C
            IERC721(address(hook)).transferFrom(address(this), 0x08cF1208e638a5A3623be58d600e35c6199baa9C, mintedIds[167]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[168]) to 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2
            IERC721(address(hook)).transferFrom(address(this), 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2, mintedIds[168]);
            
            // Transfer UPC 32 (minted tokenId mintedIds[169]) to 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe
            IERC721(address(hook)).transferFrom(address(this), 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe, mintedIds[169]);
            
            // Transfer UPC 32 (minted tokenId mintedIds[170]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[170]);
            
            // Transfer UPC 33 (minted tokenId mintedIds[171]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[171]);
            
            // Transfer UPC 35 (minted tokenId mintedIds[172]) to 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf
            IERC721(address(hook)).transferFrom(address(this), 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf, mintedIds[172]);
            
            // Transfer UPC 35 (minted tokenId mintedIds[173]) to 0x15b61e9b0637f45dc0858f083cd240267924125d
            IERC721(address(hook)).transferFrom(address(this), 0x15b61e9b0637f45dc0858f083cd240267924125d, mintedIds[173]);
            
            // Transfer UPC 35 (minted tokenId mintedIds[174]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[174]);
            
            // Transfer UPC 37 (minted tokenId mintedIds[175]) to 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79
            IERC721(address(hook)).transferFrom(address(this), 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79, mintedIds[175]);
            
            // Transfer UPC 37 (minted tokenId mintedIds[176]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[176]);
            
            // Transfer UPC 39 (minted tokenId mintedIds[177]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[177]);
            
            // Transfer UPC 40 (minted tokenId mintedIds[178]) to 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2
            IERC721(address(hook)).transferFrom(address(this), 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2, mintedIds[178]);
            
            // Transfer UPC 40 (minted tokenId mintedIds[179]) to 0x1c6d61F3d8976A8aCDd311ecdFa533B8ECd0AC61
            IERC721(address(hook)).transferFrom(address(this), 0x1c6d61F3d8976A8aCDd311ecdFa533B8ECd0AC61, mintedIds[179]);
            
            // Transfer UPC 41 (minted tokenId mintedIds[180]) to 0x1c6d61F3d8976A8aCDd311ecdFa533B8ECd0AC61
            IERC721(address(hook)).transferFrom(address(this), 0x1c6d61F3d8976A8aCDd311ecdFa533B8ECd0AC61, mintedIds[180]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[181]) to 0x961d4191965C49537c88F764D88318872CE405bE
            IERC721(address(hook)).transferFrom(address(this), 0x961d4191965C49537c88F764D88318872CE405bE, mintedIds[181]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[182]) to 0xf0FE43a75Ff248FD2E75D33fa1ebde71c6d1abAd
            IERC721(address(hook)).transferFrom(address(this), 0xf0FE43a75Ff248FD2E75D33fa1ebde71c6d1abAd, mintedIds[182]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[183]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[183]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[184]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[184]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[185]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[185]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[186]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[186]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[187]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[187]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[188]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[188]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[189]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[189]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[190]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[190]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[191]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[191]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[192]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[192]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[193]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[193]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[194]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[194]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[195]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[195]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[196]) to 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2
            IERC721(address(hook)).transferFrom(address(this), 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2, mintedIds[196]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[197]) to 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07
            IERC721(address(hook)).transferFrom(address(this), 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07, mintedIds[197]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[198]) to 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1
            IERC721(address(hook)).transferFrom(address(this), 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1, mintedIds[198]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[199]) to 0x1786D033D5CbCC235B673e872c7613c2F83DA583
            IERC721(address(hook)).transferFrom(address(this), 0x1786D033D5CbCC235B673e872c7613c2F83DA583, mintedIds[199]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[200]) to 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79
            IERC721(address(hook)).transferFrom(address(this), 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79, mintedIds[200]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[201]) to 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2
            IERC721(address(hook)).transferFrom(address(this), 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2, mintedIds[201]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[202]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[202]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[203]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[203]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[204]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[204]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[205]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[205]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[206]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[206]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[207]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[207]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[208]) to 0x4A290F18c35bBFE97B2557cf765De9387726dE39
            IERC721(address(hook)).transferFrom(address(this), 0x4A290F18c35bBFE97B2557cf765De9387726dE39, mintedIds[208]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[209]) to 0x38EED3CCeED88f380E436eb21811250797c453C5
            IERC721(address(hook)).transferFrom(address(this), 0x38EED3CCeED88f380E436eb21811250797c453C5, mintedIds[209]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[210]) to 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf
            IERC721(address(hook)).transferFrom(address(this), 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf, mintedIds[210]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[211]) to 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe
            IERC721(address(hook)).transferFrom(address(this), 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe, mintedIds[211]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[212]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[212]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[213]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[213]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[214]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[214]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[215]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[215]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[216]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[216]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[217]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[217]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[218]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[218]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[219]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[219]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[220]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[220]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[221]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[221]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[222]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[222]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[223]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[223]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[224]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[224]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[225]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[225]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[226]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[226]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[227]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[227]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[228]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[228]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[229]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[229]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[230]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[230]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[231]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[231]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[232]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[232]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[233]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[233]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[234]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[234]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[235]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[235]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[236]) to 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2
            IERC721(address(hook)).transferFrom(address(this), 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2, mintedIds[236]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[237]) to 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59
            IERC721(address(hook)).transferFrom(address(this), 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59, mintedIds[237]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[238]) to 0x0447AD1BdC0fFA06f7029c8E63F4De21E65255d2
            IERC721(address(hook)).transferFrom(address(this), 0x0447AD1BdC0fFA06f7029c8E63F4De21E65255d2, mintedIds[238]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[239]) to 0x08cF1208e638a5A3623be58d600e35c6199baa9C
            IERC721(address(hook)).transferFrom(address(this), 0x08cF1208e638a5A3623be58d600e35c6199baa9C, mintedIds[239]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[240]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[240]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[241]) to 0xe21A272c4D22eD40678a0168b4acd006bca8A482
            IERC721(address(hook)).transferFrom(address(this), 0xe21A272c4D22eD40678a0168b4acd006bca8A482, mintedIds[241]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[242]) to 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe
            IERC721(address(hook)).transferFrom(address(this), 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe, mintedIds[242]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[243]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[243]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[244]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[244]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[245]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[245]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[246]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[246]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[247]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[247]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[248]) to 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2
            IERC721(address(hook)).transferFrom(address(this), 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2, mintedIds[248]);
            
            // Transfer UPC 48 (minted tokenId mintedIds[249]) to 0x15b61e9b0637f45dc0858f083cd240267924125d
            IERC721(address(hook)).transferFrom(address(this), 0x15b61e9b0637f45dc0858f083cd240267924125d, mintedIds[249]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[250]) to 0x08cF1208e638a5A3623be58d600e35c6199baa9C
            IERC721(address(hook)).transferFrom(address(this), 0x08cF1208e638a5A3623be58d600e35c6199baa9C, mintedIds[250]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[251]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[251]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[252]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[252]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[253]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[253]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[254]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[254]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[255]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[255]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[256]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[256]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[257]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[257]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[258]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[258]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[259]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[259]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[260]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[260]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[261]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[261]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[262]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[262]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[263]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[263]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[264]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[264]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[265]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[265]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[266]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[266]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[267]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[267]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[268]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[268]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[269]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[269]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[270]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[270]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[271]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[271]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[272]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[272]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[273]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[273]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[274]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[274]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[275]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[275]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[276]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[276]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[277]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[277]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[278]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[278]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[279]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[279]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[280]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[280]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[281]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[281]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[282]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[282]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[283]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[283]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[284]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[284]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[285]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[285]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[286]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[286]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[287]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[287]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[288]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[288]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[289]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[289]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[290]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[290]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[291]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[291]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[292]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[292]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[293]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[293]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[294]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[294]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[295]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[295]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[296]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[296]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[297]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[297]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[298]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[298]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[299]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[299]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[300]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[300]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[301]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[301]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[302]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[302]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[303]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[303]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[304]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[304]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[305]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[305]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[306]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[306]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[307]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[307]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[308]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[308]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[309]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[309]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[310]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[310]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[311]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[311]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[312]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[312]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[313]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[313]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[314]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[314]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[315]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[315]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[316]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[316]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[317]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[317]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[318]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[318]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[319]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[319]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[320]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[320]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[321]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[321]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[322]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[322]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[323]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[323]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[324]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[324]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[325]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[325]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[326]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[326]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[327]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[327]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[328]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[328]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[329]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[329]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[330]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[330]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[331]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[331]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[332]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[332]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[333]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[333]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[334]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[334]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[335]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[335]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[336]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[336]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[337]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[337]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[338]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[338]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[339]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[339]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[340]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[340]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[341]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[341]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[342]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[342]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[343]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[343]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[344]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[344]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[345]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[345]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[346]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[346]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[347]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[347]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[348]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[348]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[349]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[349]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[350]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[350]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[351]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[351]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[352]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[352]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[353]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[353]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[354]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[354]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[355]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[355]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[356]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[356]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[357]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[357]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[358]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[358]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[359]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[359]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[360]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[360]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[361]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[361]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[362]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[362]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[363]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[363]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[364]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[364]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[365]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[365]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[366]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[366]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[367]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[367]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[368]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[368]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[369]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[369]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[370]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[370]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[371]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[371]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[372]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[372]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[373]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[373]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[374]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[374]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[375]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[375]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[376]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[376]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[377]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[377]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[378]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[378]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[379]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[379]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[380]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[380]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[381]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[381]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[382]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[382]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[383]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[383]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[384]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[384]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[385]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[385]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[386]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[386]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[387]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[387]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[388]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[388]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[389]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[389]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[390]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[390]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[391]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[391]);
            
            // Transfer UPC 5 (minted tokenId mintedIds[392]) to 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79
            IERC721(address(hook)).transferFrom(address(this), 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79, mintedIds[392]);
            
            // Transfer UPC 5 (minted tokenId mintedIds[393]) to 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD
            IERC721(address(hook)).transferFrom(address(this), 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD, mintedIds[393]);
            
            // Transfer UPC 6 (minted tokenId mintedIds[394]) to 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf
            IERC721(address(hook)).transferFrom(address(this), 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf, mintedIds[394]);
            
            // Transfer UPC 6 (minted tokenId mintedIds[395]) to 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79
            IERC721(address(hook)).transferFrom(address(this), 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79, mintedIds[395]);
            
            // Transfer UPC 6 (minted tokenId mintedIds[396]) to 0x15b61e9b0637f45dc0858f083cd240267924125d
            IERC721(address(hook)).transferFrom(address(this), 0x15b61e9b0637f45dc0858f083cd240267924125d, mintedIds[396]);
            
            // Transfer UPC 6 (minted tokenId mintedIds[397]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[397]);
            
            // Transfer UPC 6 (minted tokenId mintedIds[398]) to 0xe21A272c4D22eD40678a0168b4acd006bca8A482
            IERC721(address(hook)).transferFrom(address(this), 0xe21A272c4D22eD40678a0168b4acd006bca8A482, mintedIds[398]);
            
            return;
        }
        if (chainId == 10) {
            // Optimism migration
            console.log("Migrating 11 items on Optimism");
            
            // Step 1: Mint all assets to deployer initially
            
            console.log("Minting tierIds to deployer");
            
            // Create array of all tierIds to mint
            uint16[] memory allTierIds = new uint16[](11);
            uint16 tierIndex = 0;
            
            // Helper function to add UPC instances to allTierIds
            function _addUpcInstances(uint16 upc, uint256 quantity) internal {
                for (uint256 i = 0; i < quantity; i++) {
                    allTierIds[tierIndex] = upc;
                    tierIndex++;
                }
            }
            
            _addUpcInstances(3, 2); // Add 2 instances of UPC 3
            _addUpcInstances(4, 3); // Add 3 instances of UPC 4
            _addUpcInstances(11, 1); // Add 1 instances of UPC 11
            _addUpcInstances(17, 1); // Add 1 instances of UPC 17
            _addUpcInstances(19, 1); // Add 1 instances of UPC 19
            _addUpcInstances(25, 1); // Add 1 instances of UPC 25
            _addUpcInstances(44, 1); // Add 1 instances of UPC 44
            _addUpcInstances(47, 1); // Add 1 instances of UPC 47
            
            // Mint all tierIds at once
            uint256[] memory mintedIds = hook.mintFor(allTierIds, address(this));
            
            // Define struct to hold all UPC minted tokenIds
            struct MintedIds {
                uint256[2] upc3;
                uint256[3] upc4;
                uint256[1] upc11;
                uint256[1] upc17;
                uint256[1] upc19;
                uint256[1] upc25;
                uint256[1] upc44;
                uint256[1] upc47;
                            }
            
            // Create and populate the struct
            MintedIds memory formattedMintedIds;
            
            // Populate UPC 3 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc3[i] = mintedIds[0 + i];
            }
            // Populate UPC 4 minted tokenIds (3 items)
            for (uint256 i = 0; i < 3; i++) {
                sortedMintedIds.upc4[i] = mintedIds[2 + i];
            }
            // Populate UPC 11 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc11[i] = mintedIds[5 + i];
            }
            // Populate UPC 17 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc17[i] = mintedIds[6 + i];
            }
            // Populate UPC 19 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc19[i] = mintedIds[7 + i];
            }
            // Populate UPC 25 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc25[i] = mintedIds[8 + i];
            }
            // Populate UPC 44 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc44[i] = mintedIds[9 + i];
            }
            // Populate UPC 47 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc47[i] = mintedIds[10 + i];
            }
            // Step 2: Process each Banny body and dress them
            console.log("Processing 5 Banny bodies...");
            
            // Dress Banny 3000000001 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](4);
                    outfitIds[0] = sortedMintedIds.upc11[0]; // V4: 11000000001 -> V5: sortedMintedIds.upc11[0]
                outfitIds[1] = sortedMintedIds.upc19[0]; // V4: 19000000001 -> V5: sortedMintedIds.upc19[0]
                outfitIds[2] = sortedMintedIds.upc25[0]; // V4: 25000000001 -> V5: sortedMintedIds.upc25[0]
                outfitIds[3] = sortedMintedIds.upc44[0]; // V4: 44000000001 -> V5: sortedMintedIds.upc44[0]

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
                    outfitIds[0] = sortedMintedIds.upc47[0]; // V4: 47000000001 -> V5: sortedMintedIds.upc47[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000001,
                    0,
                    outfitIds
                );
            }
            
            // Step 3: Transfer all assets to rightful owners
            console.log("Transferring %d tokens to rightful owners", mintedIds.length);
            
            // Transfer UPC 3 (minted tokenId mintedIds[0]) to 0x25910143C255828F623786f46fe9A8941B7983bB
            IERC721(address(hook)).transferFrom(address(this), 0x25910143C255828F623786f46fe9A8941B7983bB, mintedIds[0]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[1]) to 0x292ff025168D2B51f0Ef49f164D281c36761BA2b
            IERC721(address(hook)).transferFrom(address(this), 0x292ff025168D2B51f0Ef49f164D281c36761BA2b, mintedIds[1]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[2]) to 0xA7a5A2745f10D5C23d75a6fd228A408cEDe1CAE5
            IERC721(address(hook)).transferFrom(address(this), 0xA7a5A2745f10D5C23d75a6fd228A408cEDe1CAE5, mintedIds[2]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[3]) to 0x57700212B1cB7b67bD7DF3801DA43CA634513fE0
            IERC721(address(hook)).transferFrom(address(this), 0x57700212B1cB7b67bD7DF3801DA43CA634513fE0, mintedIds[3]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[4]) to 0x292ff025168D2B51f0Ef49f164D281c36761BA2b
            IERC721(address(hook)).transferFrom(address(this), 0x292ff025168D2B51f0Ef49f164D281c36761BA2b, mintedIds[4]);
            
            // Transfer UPC 17 (minted tokenId mintedIds[5]) to 0xA2Fa6144168751D116336B58C5288feaF8bb12C1
            IERC721(address(hook)).transferFrom(address(this), 0xA2Fa6144168751D116336B58C5288feaF8bb12C1, mintedIds[5]);
            
            return;
        }
        if (chainId == 8453) {
            // Base migration
            console.log("Migrating 228 items on Base");
            
            // Step 1: Mint all assets to deployer initially
            
            console.log("Minting tierIds to deployer");
            
            // Create array of all tierIds to mint
            uint16[] memory allTierIds = new uint16[](228);
            uint16 tierIndex = 0;
            
            // Helper function to add UPC instances to allTierIds
            function _addUpcInstances(uint16 upc, uint256 quantity) internal {
                for (uint256 i = 0; i < quantity; i++) {
                    allTierIds[tierIndex] = upc;
                    tierIndex++;
                }
            }
            
            _addUpcInstances(2, 3); // Add 3 instances of UPC 2
            _addUpcInstances(3, 10); // Add 10 instances of UPC 3
            _addUpcInstances(4, 94); // Add 94 instances of UPC 4
            _addUpcInstances(5, 5); // Add 5 instances of UPC 5
            _addUpcInstances(6, 5); // Add 5 instances of UPC 6
            _addUpcInstances(7, 1); // Add 1 instances of UPC 7
            _addUpcInstances(10, 11); // Add 11 instances of UPC 10
            _addUpcInstances(11, 3); // Add 3 instances of UPC 11
            _addUpcInstances(13, 2); // Add 2 instances of UPC 13
            _addUpcInstances(14, 4); // Add 4 instances of UPC 14
            _addUpcInstances(15, 2); // Add 2 instances of UPC 15
            _addUpcInstances(17, 1); // Add 1 instances of UPC 17
            _addUpcInstances(19, 12); // Add 12 instances of UPC 19
            _addUpcInstances(20, 1); // Add 1 instances of UPC 20
            _addUpcInstances(24, 1); // Add 1 instances of UPC 24
            _addUpcInstances(25, 9); // Add 9 instances of UPC 25
            _addUpcInstances(27, 1); // Add 1 instances of UPC 27
            _addUpcInstances(28, 10); // Add 10 instances of UPC 28
            _addUpcInstances(31, 6); // Add 6 instances of UPC 31
            _addUpcInstances(32, 2); // Add 2 instances of UPC 32
            _addUpcInstances(33, 1); // Add 1 instances of UPC 33
            _addUpcInstances(34, 1); // Add 1 instances of UPC 34
            _addUpcInstances(35, 4); // Add 4 instances of UPC 35
            _addUpcInstances(37, 2); // Add 2 instances of UPC 37
            _addUpcInstances(38, 3); // Add 3 instances of UPC 38
            _addUpcInstances(39, 2); // Add 2 instances of UPC 39
            _addUpcInstances(40, 3); // Add 3 instances of UPC 40
            _addUpcInstances(41, 2); // Add 2 instances of UPC 41
            _addUpcInstances(42, 2); // Add 2 instances of UPC 42
            _addUpcInstances(43, 8); // Add 8 instances of UPC 43
            _addUpcInstances(44, 5); // Add 5 instances of UPC 44
            _addUpcInstances(45, 1); // Add 1 instances of UPC 45
            _addUpcInstances(47, 8); // Add 8 instances of UPC 47
            _addUpcInstances(48, 1); // Add 1 instances of UPC 48
            _addUpcInstances(49, 2); // Add 2 instances of UPC 49
            
            // Mint all tierIds at once
            uint256[] memory mintedIds = hook.mintFor(allTierIds, address(this));
            
            // Define struct to hold all UPC minted tokenIds
            struct MintedIds {
                uint256[3] upc2;
                uint256[10] upc3;
                uint256[94] upc4;
                uint256[5] upc5;
                uint256[5] upc6;
                uint256[1] upc7;
                uint256[11] upc10;
                uint256[3] upc11;
                uint256[2] upc13;
                uint256[4] upc14;
                uint256[2] upc15;
                uint256[1] upc17;
                uint256[12] upc19;
                uint256[1] upc20;
                uint256[1] upc24;
                uint256[9] upc25;
                uint256[1] upc27;
                uint256[10] upc28;
                uint256[6] upc31;
                uint256[2] upc32;
                uint256[1] upc33;
                uint256[1] upc34;
                uint256[4] upc35;
                uint256[2] upc37;
                uint256[3] upc38;
                uint256[2] upc39;
                uint256[3] upc40;
                uint256[2] upc41;
                uint256[2] upc42;
                uint256[8] upc43;
                uint256[5] upc44;
                uint256[1] upc45;
                uint256[8] upc47;
                uint256[1] upc48;
                uint256[2] upc49;
                            }
            
            // Create and populate the struct
            MintedIds memory formattedMintedIds;
            
            // Populate UPC 2 minted tokenIds (3 items)
            for (uint256 i = 0; i < 3; i++) {
                sortedMintedIds.upc2[i] = mintedIds[0 + i];
            }
            // Populate UPC 3 minted tokenIds (10 items)
            for (uint256 i = 0; i < 10; i++) {
                sortedMintedIds.upc3[i] = mintedIds[3 + i];
            }
            // Populate UPC 4 minted tokenIds (94 items)
            for (uint256 i = 0; i < 94; i++) {
                sortedMintedIds.upc4[i] = mintedIds[13 + i];
            }
            // Populate UPC 5 minted tokenIds (5 items)
            for (uint256 i = 0; i < 5; i++) {
                sortedMintedIds.upc5[i] = mintedIds[107 + i];
            }
            // Populate UPC 6 minted tokenIds (5 items)
            for (uint256 i = 0; i < 5; i++) {
                sortedMintedIds.upc6[i] = mintedIds[112 + i];
            }
            // Populate UPC 7 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc7[i] = mintedIds[117 + i];
            }
            // Populate UPC 10 minted tokenIds (11 items)
            for (uint256 i = 0; i < 11; i++) {
                sortedMintedIds.upc10[i] = mintedIds[118 + i];
            }
            // Populate UPC 11 minted tokenIds (3 items)
            for (uint256 i = 0; i < 3; i++) {
                sortedMintedIds.upc11[i] = mintedIds[129 + i];
            }
            // Populate UPC 13 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc13[i] = mintedIds[132 + i];
            }
            // Populate UPC 14 minted tokenIds (4 items)
            for (uint256 i = 0; i < 4; i++) {
                sortedMintedIds.upc14[i] = mintedIds[134 + i];
            }
            // Populate UPC 15 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc15[i] = mintedIds[138 + i];
            }
            // Populate UPC 17 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc17[i] = mintedIds[140 + i];
            }
            // Populate UPC 19 minted tokenIds (12 items)
            for (uint256 i = 0; i < 12; i++) {
                sortedMintedIds.upc19[i] = mintedIds[141 + i];
            }
            // Populate UPC 20 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc20[i] = mintedIds[153 + i];
            }
            // Populate UPC 24 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc24[i] = mintedIds[154 + i];
            }
            // Populate UPC 25 minted tokenIds (9 items)
            for (uint256 i = 0; i < 9; i++) {
                sortedMintedIds.upc25[i] = mintedIds[155 + i];
            }
            // Populate UPC 27 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc27[i] = mintedIds[164 + i];
            }
            // Populate UPC 28 minted tokenIds (10 items)
            for (uint256 i = 0; i < 10; i++) {
                sortedMintedIds.upc28[i] = mintedIds[165 + i];
            }
            // Populate UPC 31 minted tokenIds (6 items)
            for (uint256 i = 0; i < 6; i++) {
                sortedMintedIds.upc31[i] = mintedIds[175 + i];
            }
            // Populate UPC 32 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc32[i] = mintedIds[181 + i];
            }
            // Populate UPC 33 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc33[i] = mintedIds[183 + i];
            }
            // Populate UPC 34 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc34[i] = mintedIds[184 + i];
            }
            // Populate UPC 35 minted tokenIds (4 items)
            for (uint256 i = 0; i < 4; i++) {
                sortedMintedIds.upc35[i] = mintedIds[185 + i];
            }
            // Populate UPC 37 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc37[i] = mintedIds[189 + i];
            }
            // Populate UPC 38 minted tokenIds (3 items)
            for (uint256 i = 0; i < 3; i++) {
                sortedMintedIds.upc38[i] = mintedIds[191 + i];
            }
            // Populate UPC 39 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc39[i] = mintedIds[194 + i];
            }
            // Populate UPC 40 minted tokenIds (3 items)
            for (uint256 i = 0; i < 3; i++) {
                sortedMintedIds.upc40[i] = mintedIds[196 + i];
            }
            // Populate UPC 41 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc41[i] = mintedIds[199 + i];
            }
            // Populate UPC 42 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc42[i] = mintedIds[201 + i];
            }
            // Populate UPC 43 minted tokenIds (8 items)
            for (uint256 i = 0; i < 8; i++) {
                sortedMintedIds.upc43[i] = mintedIds[203 + i];
            }
            // Populate UPC 44 minted tokenIds (5 items)
            for (uint256 i = 0; i < 5; i++) {
                sortedMintedIds.upc44[i] = mintedIds[211 + i];
            }
            // Populate UPC 45 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc45[i] = mintedIds[216 + i];
            }
            // Populate UPC 47 minted tokenIds (8 items)
            for (uint256 i = 0; i < 8; i++) {
                sortedMintedIds.upc47[i] = mintedIds[217 + i];
            }
            // Populate UPC 48 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc48[i] = mintedIds[225 + i];
            }
            // Populate UPC 49 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc49[i] = mintedIds[226 + i];
            }
            // Step 2: Process each Banny body and dress them
            console.log("Processing 107 Banny bodies...");
            
            // Dress Banny 2000000001 (Pink)
            {
                uint256[] memory outfitIds = new uint256[](2);
                    outfitIds[0] = sortedMintedIds.upc28[1]; // V4: 28000000002 -> V5: sortedMintedIds.upc28[1]
                outfitIds[1] = sortedMintedIds.upc37[0]; // V4: 37000000001 -> V5: sortedMintedIds.upc37[0]

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
                    outfitIds[0] = sortedMintedIds.upc14[1]; // V4: 14000000002 -> V5: sortedMintedIds.upc14[1]
                outfitIds[1] = sortedMintedIds.upc32[0]; // V4: 32000000001 -> V5: sortedMintedIds.upc32[0]

                resolver.decorateBannyWith(
                    address(hook),
                    2000000002,
                    sortedMintedIds.upc6[0],
                    outfitIds
                );
            }
            
            // Dress Banny 2000000003 (Pink)
            {
                uint256[] memory outfitIds = new uint256[](3);
                    outfitIds[0] = sortedMintedIds.upc25[7]; // V4: 25000000008 -> V5: sortedMintedIds.upc25[7]
                outfitIds[1] = sortedMintedIds.upc37[1]; // V4: 37000000002 -> V5: sortedMintedIds.upc37[1]
                outfitIds[2] = sortedMintedIds.upc45[0]; // V4: 45000000001 -> V5: sortedMintedIds.upc45[0]

                resolver.decorateBannyWith(
                    address(hook),
                    2000000003,
                    sortedMintedIds.upc6[3],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000001 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](2);
                    outfitIds[0] = sortedMintedIds.upc25[3]; // V4: 25000000004 -> V5: sortedMintedIds.upc25[3]
                outfitIds[1] = sortedMintedIds.upc47[2]; // V4: 47000000003 -> V5: sortedMintedIds.upc47[2]

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
                    outfitIds[0] = sortedMintedIds.upc31[1]; // V4: 31000000002 -> V5: sortedMintedIds.upc31[1]

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
                    outfitIds[0] = sortedMintedIds.upc10[4]; // V4: 10000000005 -> V5: sortedMintedIds.upc10[4]
                outfitIds[1] = sortedMintedIds.upc19[4]; // V4: 19000000005 -> V5: sortedMintedIds.upc19[4]
                outfitIds[2] = sortedMintedIds.upc28[4]; // V4: 28000000005 -> V5: sortedMintedIds.upc28[4]
                outfitIds[3] = sortedMintedIds.upc47[4]; // V4: 47000000005 -> V5: sortedMintedIds.upc47[4]

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
                    outfitIds[0] = sortedMintedIds.upc14[2]; // V4: 14000000003 -> V5: sortedMintedIds.upc14[2]
                outfitIds[1] = sortedMintedIds.upc19[6]; // V4: 19000000007 -> V5: sortedMintedIds.upc19[6]
                outfitIds[2] = sortedMintedIds.upc28[0]; // V4: 28000000001 -> V5: sortedMintedIds.upc28[0]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000006,
                    sortedMintedIds.upc6[2],
                    outfitIds
                );
            }
            
            // Dress Banny 3000000007 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](3);
                    outfitIds[0] = sortedMintedIds.upc19[8]; // V4: 19000000009 -> V5: sortedMintedIds.upc19[8]
                outfitIds[1] = sortedMintedIds.upc28[6]; // V4: 28000000007 -> V5: sortedMintedIds.upc28[6]
                outfitIds[2] = sortedMintedIds.upc44[4]; // V4: 44000000005 -> V5: sortedMintedIds.upc44[4]

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
                    outfitIds[0] = sortedMintedIds.upc15[1]; // V4: 15000000002 -> V5: sortedMintedIds.upc15[1]
                outfitIds[1] = sortedMintedIds.upc40[0]; // V4: 40000000001 -> V5: sortedMintedIds.upc40[0]

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
                    outfitIds[0] = sortedMintedIds.upc25[8]; // V4: 25000000009 -> V5: sortedMintedIds.upc25[8]
                outfitIds[1] = sortedMintedIds.upc43[7]; // V4: 43000000008 -> V5: sortedMintedIds.upc43[7]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000010,
                    sortedMintedIds.upc5[3],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000001 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                    outfitIds[0] = sortedMintedIds.upc15[0]; // V4: 15000000001 -> V5: sortedMintedIds.upc15[0]

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
                    outfitIds[0] = sortedMintedIds.upc11[0]; // V4: 11000000001 -> V5: sortedMintedIds.upc11[0]
                outfitIds[1] = sortedMintedIds.upc19[0]; // V4: 19000000001 -> V5: sortedMintedIds.upc19[0]
                outfitIds[2] = sortedMintedIds.upc25[0]; // V4: 25000000001 -> V5: sortedMintedIds.upc25[0]
                outfitIds[3] = sortedMintedIds.upc33[0]; // V4: 33000000001 -> V5: sortedMintedIds.upc33[0]
                outfitIds[4] = sortedMintedIds.upc44[0]; // V4: 44000000001 -> V5: sortedMintedIds.upc44[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000003,
                    sortedMintedIds.upc6[4],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000045 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                    outfitIds[0] = sortedMintedIds.upc10[0]; // V4: 10000000001 -> V5: sortedMintedIds.upc10[0]
                outfitIds[1] = sortedMintedIds.upc25[1]; // V4: 25000000002 -> V5: sortedMintedIds.upc25[1]
                outfitIds[2] = sortedMintedIds.upc43[1]; // V4: 43000000002 -> V5: sortedMintedIds.upc43[1]

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
                    outfitIds[0] = sortedMintedIds.upc47[0]; // V4: 47000000001 -> V5: sortedMintedIds.upc47[0]

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
                    outfitIds[0] = sortedMintedIds.upc10[2]; // V4: 10000000003 -> V5: sortedMintedIds.upc10[2]
                outfitIds[1] = sortedMintedIds.upc19[2]; // V4: 19000000003 -> V5: sortedMintedIds.upc19[2]
                outfitIds[2] = sortedMintedIds.upc28[3]; // V4: 28000000004 -> V5: sortedMintedIds.upc28[3]

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
                    outfitIds[0] = sortedMintedIds.upc10[3]; // V4: 10000000004 -> V5: sortedMintedIds.upc10[3]

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
                    outfitIds[0] = sortedMintedIds.upc14[0]; // V4: 14000000001 -> V5: sortedMintedIds.upc14[0]
                outfitIds[1] = sortedMintedIds.upc31[0]; // V4: 31000000001 -> V5: sortedMintedIds.upc31[0]
                outfitIds[2] = sortedMintedIds.upc38[0]; // V4: 38000000001 -> V5: sortedMintedIds.upc38[0]
                outfitIds[3] = sortedMintedIds.upc43[2]; // V4: 43000000003 -> V5: sortedMintedIds.upc43[2]

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
                    outfitIds[0] = sortedMintedIds.upc25[4]; // V4: 25000000005 -> V5: sortedMintedIds.upc25[4]

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
                    outfitIds[0] = sortedMintedIds.upc10[6]; // V4: 10000000007 -> V5: sortedMintedIds.upc10[6]
                outfitIds[1] = sortedMintedIds.upc19[5]; // V4: 19000000006 -> V5: sortedMintedIds.upc19[5]
                outfitIds[2] = sortedMintedIds.upc25[5]; // V4: 25000000006 -> V5: sortedMintedIds.upc25[5]
                outfitIds[3] = sortedMintedIds.upc43[4]; // V4: 43000000005 -> V5: sortedMintedIds.upc43[4]

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
                    outfitIds[0] = sortedMintedIds.upc27[0]; // V4: 27000000001 -> V5: sortedMintedIds.upc27[0]
                outfitIds[1] = sortedMintedIds.upc38[1]; // V4: 38000000002 -> V5: sortedMintedIds.upc38[1]
                outfitIds[2] = sortedMintedIds.upc48[0]; // V4: 48000000001 -> V5: sortedMintedIds.upc48[0]

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
                    outfitIds[0] = sortedMintedIds.upc13[0]; // V4: 13000000001 -> V5: sortedMintedIds.upc13[0]
                outfitIds[1] = sortedMintedIds.upc20[0]; // V4: 20000000001 -> V5: sortedMintedIds.upc20[0]
                outfitIds[2] = sortedMintedIds.upc44[3]; // V4: 44000000004 -> V5: sortedMintedIds.upc44[3]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000080,
                    sortedMintedIds.upc5[0],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000081 (Original)
            {
                uint256[] memory outfitIds = new uint256[](4);
                    outfitIds[0] = sortedMintedIds.upc19[7]; // V4: 19000000008 -> V5: sortedMintedIds.upc19[7]
                outfitIds[1] = sortedMintedIds.upc25[6]; // V4: 25000000007 -> V5: sortedMintedIds.upc25[6]
                outfitIds[2] = sortedMintedIds.upc35[1]; // V4: 35000000002 -> V5: sortedMintedIds.upc35[1]
                outfitIds[3] = sortedMintedIds.upc43[5]; // V4: 43000000006 -> V5: sortedMintedIds.upc43[5]

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
                    outfitIds[0] = sortedMintedIds.upc43[6]; // V4: 43000000007 -> V5: sortedMintedIds.upc43[6]

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
                    outfitIds[0] = sortedMintedIds.upc39[0]; // V4: 39000000001 -> V5: sortedMintedIds.upc39[0]
                outfitIds[1] = sortedMintedIds.upc41[0]; // V4: 41000000001 -> V5: sortedMintedIds.upc41[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000084,
                    sortedMintedIds.upc5[2],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000085 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                    outfitIds[0] = sortedMintedIds.upc28[7]; // V4: 28000000008 -> V5: sortedMintedIds.upc28[7]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000085,
                    0,
                    outfitIds
                );
            }
            
            // Step 3: Transfer all assets to rightful owners
            console.log("Transferring %d tokens to rightful owners", mintedIds.length);
            
            // Transfer UPC 2 (minted tokenId mintedIds[0]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[0]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[1]) to 0x565B93a15d38aCD79c120b15432D21E21eD274d6
            IERC721(address(hook)).transferFrom(address(this), 0x565B93a15d38aCD79c120b15432D21E21eD274d6, mintedIds[1]);
            
            // Transfer UPC 2 (minted tokenId mintedIds[2]) to 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F
            IERC721(address(hook)).transferFrom(address(this), 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F, mintedIds[2]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[3]) to 0x25171bD3cD3231c3057c96F38E32E3bA6681497a
            IERC721(address(hook)).transferFrom(address(this), 0x25171bD3cD3231c3057c96F38E32E3bA6681497a, mintedIds[3]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[4]) to 0x4718ce007293bCe1E514887E6F55ea71d9A992d6
            IERC721(address(hook)).transferFrom(address(this), 0x4718ce007293bCe1E514887E6F55ea71d9A992d6, mintedIds[4]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[5]) to 0x96D087aba8552A0e111D7fB4Feb2e7621213E244
            IERC721(address(hook)).transferFrom(address(this), 0x96D087aba8552A0e111D7fB4Feb2e7621213E244, mintedIds[5]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[6]) to 0x2830e21792019CE670fBc548AacB004b08c7f71f
            IERC721(address(hook)).transferFrom(address(this), 0x2830e21792019CE670fBc548AacB004b08c7f71f, mintedIds[6]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[7]) to 0x328809A567b87b6123462c3062e8438BBB75c1c5
            IERC721(address(hook)).transferFrom(address(this), 0x328809A567b87b6123462c3062e8438BBB75c1c5, mintedIds[7]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[8]) to 0xAAeD9fFF9858d48925904E391B77892BA5Fda824
            IERC721(address(hook)).transferFrom(address(this), 0xAAeD9fFF9858d48925904E391B77892BA5Fda824, mintedIds[8]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[9]) to 0xDf087B724174A3E4eD2338C0798193932E851F1b
            IERC721(address(hook)).transferFrom(address(this), 0xDf087B724174A3E4eD2338C0798193932E851F1b, mintedIds[9]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[10]) to 0x28C173B8F20488eEF1b0f48Df8453A2f59C38337
            IERC721(address(hook)).transferFrom(address(this), 0x28C173B8F20488eEF1b0f48Df8453A2f59C38337, mintedIds[10]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[11]) to 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F
            IERC721(address(hook)).transferFrom(address(this), 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F, mintedIds[11]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[12]) to 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12
            IERC721(address(hook)).transferFrom(address(this), 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12, mintedIds[12]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[13]) to 0x817738DC393d682Ca5fBb268707b99F2aAe96baE
            IERC721(address(hook)).transferFrom(address(this), 0x817738DC393d682Ca5fBb268707b99F2aAe96baE, mintedIds[13]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[14]) to 0xAAeD9fFF9858d48925904E391B77892BA5Fda824
            IERC721(address(hook)).transferFrom(address(this), 0xAAeD9fFF9858d48925904E391B77892BA5Fda824, mintedIds[14]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[15]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[15]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[16]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[16]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[17]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[17]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[18]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[18]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[19]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[19]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[20]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[20]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[21]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[21]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[22]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[22]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[23]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[23]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[24]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[24]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[25]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[25]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[26]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[26]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[27]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[27]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[28]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[28]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[29]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[29]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[30]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[30]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[31]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[31]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[32]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[32]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[33]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[33]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[34]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[34]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[35]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[35]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[36]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[36]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[37]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[37]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[38]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[38]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[39]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[39]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[40]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[40]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[41]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[41]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[42]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[42]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[43]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[43]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[44]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[44]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[45]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[45]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[46]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[46]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[47]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[47]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[48]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[48]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[49]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[49]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[50]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[50]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[51]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[51]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[52]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[52]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[53]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[53]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[54]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[54]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[55]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[55]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[56]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[56]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[57]) to 0x67BcBE602e870e2286C19E4E0044E583967c9665
            IERC721(address(hook)).transferFrom(address(this), 0x67BcBE602e870e2286C19E4E0044E583967c9665, mintedIds[57]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[58]) to 0x18deEE9699526f8C8a87004b2e4e55029Fb26b9a
            IERC721(address(hook)).transferFrom(address(this), 0x18deEE9699526f8C8a87004b2e4e55029Fb26b9a, mintedIds[58]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[59]) to 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3
            IERC721(address(hook)).transferFrom(address(this), 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3, mintedIds[59]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[60]) to 0xAcD59e854adf632d2322404198624F757C868C97
            IERC721(address(hook)).transferFrom(address(this), 0xAcD59e854adf632d2322404198624F757C868C97, mintedIds[60]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[61]) to 0xAcD59e854adf632d2322404198624F757C868C97
            IERC721(address(hook)).transferFrom(address(this), 0xAcD59e854adf632d2322404198624F757C868C97, mintedIds[61]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[62]) to 0xa13d49fCbf79EAF6A0a58cBDD3361422DB4eAfF1
            IERC721(address(hook)).transferFrom(address(this), 0xa13d49fCbf79EAF6A0a58cBDD3361422DB4eAfF1, mintedIds[62]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[63]) to 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb
            IERC721(address(hook)).transferFrom(address(this), 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb, mintedIds[63]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[64]) to 0xbeC26FFa12c90217943D1b2958f60A821aE6E549
            IERC721(address(hook)).transferFrom(address(this), 0xbeC26FFa12c90217943D1b2958f60A821aE6E549, mintedIds[64]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[65]) to 0x8Ec174c5d86469D1A74094E10485357eBFe2e08e
            IERC721(address(hook)).transferFrom(address(this), 0x8Ec174c5d86469D1A74094E10485357eBFe2e08e, mintedIds[65]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[66]) to 0xC5704f77f94087CC644d361A5A57295851d242aB
            IERC721(address(hook)).transferFrom(address(this), 0xC5704f77f94087CC644d361A5A57295851d242aB, mintedIds[66]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[67]) to 0x99Fa48ccEa8a38CDE6B437450fF9bBdDAFAA4Fc8
            IERC721(address(hook)).transferFrom(address(this), 0x99Fa48ccEa8a38CDE6B437450fF9bBdDAFAA4Fc8, mintedIds[67]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[68]) to 0xb6ECb51e3638Eb7aa0C6289ef058DCa27494Acb2
            IERC721(address(hook)).transferFrom(address(this), 0xb6ECb51e3638Eb7aa0C6289ef058DCa27494Acb2, mintedIds[68]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[69]) to 0x57700212B1cB7b67bD7DF3801DA43CA634513fE0
            IERC721(address(hook)).transferFrom(address(this), 0x57700212B1cB7b67bD7DF3801DA43CA634513fE0, mintedIds[69]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[70]) to 0x57700212B1cB7b67bD7DF3801DA43CA634513fE0
            IERC721(address(hook)).transferFrom(address(this), 0x57700212B1cB7b67bD7DF3801DA43CA634513fE0, mintedIds[70]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[71]) to 0x9342E2aC6dd4A907948E91E80D2734ecAC1D70eC
            IERC721(address(hook)).transferFrom(address(this), 0x9342E2aC6dd4A907948E91E80D2734ecAC1D70eC, mintedIds[71]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[72]) to 0x96D087aba8552A0e111D7fB4Feb2e7621213E244
            IERC721(address(hook)).transferFrom(address(this), 0x96D087aba8552A0e111D7fB4Feb2e7621213E244, mintedIds[72]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[73]) to 0x96D087aba8552A0e111D7fB4Feb2e7621213E244
            IERC721(address(hook)).transferFrom(address(this), 0x96D087aba8552A0e111D7fB4Feb2e7621213E244, mintedIds[73]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[74]) to 0x96D087aba8552A0e111D7fB4Feb2e7621213E244
            IERC721(address(hook)).transferFrom(address(this), 0x96D087aba8552A0e111D7fB4Feb2e7621213E244, mintedIds[74]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[75]) to 0x96D087aba8552A0e111D7fB4Feb2e7621213E244
            IERC721(address(hook)).transferFrom(address(this), 0x96D087aba8552A0e111D7fB4Feb2e7621213E244, mintedIds[75]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[76]) to 0x96D087aba8552A0e111D7fB4Feb2e7621213E244
            IERC721(address(hook)).transferFrom(address(this), 0x96D087aba8552A0e111D7fB4Feb2e7621213E244, mintedIds[76]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[77]) to 0x2830e21792019CE670fBc548AacB004b08c7f71f
            IERC721(address(hook)).transferFrom(address(this), 0x2830e21792019CE670fBc548AacB004b08c7f71f, mintedIds[77]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[78]) to 0x2830e21792019CE670fBc548AacB004b08c7f71f
            IERC721(address(hook)).transferFrom(address(this), 0x2830e21792019CE670fBc548AacB004b08c7f71f, mintedIds[78]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[79]) to 0x2830e21792019CE670fBc548AacB004b08c7f71f
            IERC721(address(hook)).transferFrom(address(this), 0x2830e21792019CE670fBc548AacB004b08c7f71f, mintedIds[79]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[80]) to 0x2830e21792019CE670fBc548AacB004b08c7f71f
            IERC721(address(hook)).transferFrom(address(this), 0x2830e21792019CE670fBc548AacB004b08c7f71f, mintedIds[80]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[81]) to 0x2830e21792019CE670fBc548AacB004b08c7f71f
            IERC721(address(hook)).transferFrom(address(this), 0x2830e21792019CE670fBc548AacB004b08c7f71f, mintedIds[81]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[82]) to 0x46f3cC6a1c00A5cD8864d2B92f128196CAE07D15
            IERC721(address(hook)).transferFrom(address(this), 0x46f3cC6a1c00A5cD8864d2B92f128196CAE07D15, mintedIds[82]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[83]) to 0x8e2B25dF2484000B9127b2D2F8E92079dcEE3E48
            IERC721(address(hook)).transferFrom(address(this), 0x8e2B25dF2484000B9127b2D2F8E92079dcEE3E48, mintedIds[83]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[84]) to 0x817738DC393d682Ca5fBb268707b99F2aAe96baE
            IERC721(address(hook)).transferFrom(address(this), 0x817738DC393d682Ca5fBb268707b99F2aAe96baE, mintedIds[84]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[85]) to 0x224aBa5D489675a7bD3CE07786FAda466b46FA0F
            IERC721(address(hook)).transferFrom(address(this), 0x224aBa5D489675a7bD3CE07786FAda466b46FA0F, mintedIds[85]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[86]) to 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe
            IERC721(address(hook)).transferFrom(address(this), 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe, mintedIds[86]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[87]) to 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe
            IERC721(address(hook)).transferFrom(address(this), 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe, mintedIds[87]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[88]) to 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe
            IERC721(address(hook)).transferFrom(address(this), 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe, mintedIds[88]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[89]) to 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe
            IERC721(address(hook)).transferFrom(address(this), 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe, mintedIds[89]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[90]) to 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe
            IERC721(address(hook)).transferFrom(address(this), 0x29f4aE3c24681940E537f72830b4Fe4076bDF9fe, mintedIds[90]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[91]) to 0x8b80755C441d355405CA7571443Bb9247B77Ec16
            IERC721(address(hook)).transferFrom(address(this), 0x8b80755C441d355405CA7571443Bb9247B77Ec16, mintedIds[91]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[92]) to 0x3c2736f995535b5a755F3CE2BEb754362820671e
            IERC721(address(hook)).transferFrom(address(this), 0x3c2736f995535b5a755F3CE2BEb754362820671e, mintedIds[92]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[93]) to 0x6877be9E00d0bc5886c28419901E8cC98C1c2739
            IERC721(address(hook)).transferFrom(address(this), 0x6877be9E00d0bc5886c28419901E8cC98C1c2739, mintedIds[93]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[94]) to 0x8DFBdEEC8c5d4970BB5F481C6ec7f73fa1C65be5
            IERC721(address(hook)).transferFrom(address(this), 0x8DFBdEEC8c5d4970BB5F481C6ec7f73fa1C65be5, mintedIds[94]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[95]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[95]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[96]) to 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F
            IERC721(address(hook)).transferFrom(address(this), 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F, mintedIds[96]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[97]) to 0x39a7B6fa1597BB6657Fe84e64E3B836c37d6F75d
            IERC721(address(hook)).transferFrom(address(this), 0x39a7B6fa1597BB6657Fe84e64E3B836c37d6F75d, mintedIds[97]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[98]) to 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12
            IERC721(address(hook)).transferFrom(address(this), 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12, mintedIds[98]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[99]) to 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12
            IERC721(address(hook)).transferFrom(address(this), 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12, mintedIds[99]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[100]) to 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12
            IERC721(address(hook)).transferFrom(address(this), 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12, mintedIds[100]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[101]) to 0xDdB4938755C243a4f60a2f2f8f95dF4F894c58Cc
            IERC721(address(hook)).transferFrom(address(this), 0xDdB4938755C243a4f60a2f2f8f95dF4F894c58Cc, mintedIds[101]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[102]) to 0x34aA3F359A9D614239015126635CE7732c18fDF3
            IERC721(address(hook)).transferFrom(address(this), 0x34aA3F359A9D614239015126635CE7732c18fDF3, mintedIds[102]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[103]) to 0x34aA3F359A9D614239015126635CE7732c18fDF3
            IERC721(address(hook)).transferFrom(address(this), 0x34aA3F359A9D614239015126635CE7732c18fDF3, mintedIds[103]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[104]) to 0x34aA3F359A9D614239015126635CE7732c18fDF3
            IERC721(address(hook)).transferFrom(address(this), 0x34aA3F359A9D614239015126635CE7732c18fDF3, mintedIds[104]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[105]) to 0xF6cC71878e23c05406B35946CD9d378E0f2f4f2F
            IERC721(address(hook)).transferFrom(address(this), 0xF6cC71878e23c05406B35946CD9d378E0f2f4f2F, mintedIds[105]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[106]) to 0xd2e44E40B5FB960A8A74dD7B9D6b7f14B805b50d
            IERC721(address(hook)).transferFrom(address(this), 0xd2e44E40B5FB960A8A74dD7B9D6b7f14B805b50d, mintedIds[106]);
            
            // Transfer UPC 7 (minted tokenId mintedIds[107]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[107]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[108]) to 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3
            IERC721(address(hook)).transferFrom(address(this), 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3, mintedIds[108]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[109]) to 0x328809A567b87b6123462c3062e8438BBB75c1c5
            IERC721(address(hook)).transferFrom(address(this), 0x328809A567b87b6123462c3062e8438BBB75c1c5, mintedIds[109]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[110]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[110]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[111]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[111]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[112]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[112]);
            
            // Transfer UPC 10 (minted tokenId mintedIds[113]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[113]);
            
            // Transfer UPC 11 (minted tokenId mintedIds[114]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[114]);
            
            // Transfer UPC 11 (minted tokenId mintedIds[115]) to 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F
            IERC721(address(hook)).transferFrom(address(this), 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F, mintedIds[115]);
            
            // Transfer UPC 13 (minted tokenId mintedIds[116]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[116]);
            
            // Transfer UPC 14 (minted tokenId mintedIds[117]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[117]);
            
            // Transfer UPC 17 (minted tokenId mintedIds[118]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[118]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[119]) to 0x18deEE9699526f8C8a87004b2e4e55029Fb26b9a
            IERC721(address(hook)).transferFrom(address(this), 0x18deEE9699526f8C8a87004b2e4e55029Fb26b9a, mintedIds[119]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[120]) to 0xbeC26FFa12c90217943D1b2958f60A821aE6E549
            IERC721(address(hook)).transferFrom(address(this), 0xbeC26FFa12c90217943D1b2958f60A821aE6E549, mintedIds[120]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[121]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[121]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[122]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[122]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[123]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[123]);
            
            // Transfer UPC 24 (minted tokenId mintedIds[124]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[124]);
            
            // Transfer UPC 25 (minted tokenId mintedIds[125]) to 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3
            IERC721(address(hook)).transferFrom(address(this), 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3, mintedIds[125]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[126]) to 0x18deEE9699526f8C8a87004b2e4e55029Fb26b9a
            IERC721(address(hook)).transferFrom(address(this), 0x18deEE9699526f8C8a87004b2e4e55029Fb26b9a, mintedIds[126]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[127]) to 0x328809A567b87b6123462c3062e8438BBB75c1c5
            IERC721(address(hook)).transferFrom(address(this), 0x328809A567b87b6123462c3062e8438BBB75c1c5, mintedIds[127]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[128]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[128]);
            
            // Transfer UPC 28 (minted tokenId mintedIds[129]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[129]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[130]) to 0x99Fa48ccEa8a38CDE6B437450fF9bBdDAFAA4Fc8
            IERC721(address(hook)).transferFrom(address(this), 0x99Fa48ccEa8a38CDE6B437450fF9bBdDAFAA4Fc8, mintedIds[130]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[131]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[131]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[132]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[132]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[133]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[133]);
            
            // Transfer UPC 32 (minted tokenId mintedIds[134]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[134]);
            
            // Transfer UPC 34 (minted tokenId mintedIds[135]) to 0xaECD6D9172d602b93dBA3981991268b44af8096e
            IERC721(address(hook)).transferFrom(address(this), 0xaECD6D9172d602b93dBA3981991268b44af8096e, mintedIds[135]);
            
            // Transfer UPC 35 (minted tokenId mintedIds[136]) to 0x565B93a15d38aCD79c120b15432D21E21eD274d6
            IERC721(address(hook)).transferFrom(address(this), 0x565B93a15d38aCD79c120b15432D21E21eD274d6, mintedIds[136]);
            
            // Transfer UPC 35 (minted tokenId mintedIds[137]) to 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F
            IERC721(address(hook)).transferFrom(address(this), 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F, mintedIds[137]);
            
            // Transfer UPC 35 (minted tokenId mintedIds[138]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[138]);
            
            // Transfer UPC 38 (minted tokenId mintedIds[139]) to 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F
            IERC721(address(hook)).transferFrom(address(this), 0xFd37f4625CA5816157D55a5b3F7Dd8DD5F8a0C2F, mintedIds[139]);
            
            // Transfer UPC 39 (minted tokenId mintedIds[140]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[140]);
            
            // Transfer UPC 40 (minted tokenId mintedIds[141]) to 0x8DFBdEEC8c5d4970BB5F481C6ec7f73fa1C65be5
            IERC721(address(hook)).transferFrom(address(this), 0x8DFBdEEC8c5d4970BB5F481C6ec7f73fa1C65be5, mintedIds[141]);
            
            // Transfer UPC 40 (minted tokenId mintedIds[142]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[142]);
            
            // Transfer UPC 41 (minted tokenId mintedIds[143]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[143]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[144]) to 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb
            IERC721(address(hook)).transferFrom(address(this), 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb, mintedIds[144]);
            
            // Transfer UPC 42 (minted tokenId mintedIds[145]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[145]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[146]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[146]);
            
            // Transfer UPC 43 (minted tokenId mintedIds[147]) to 0x328809A567b87b6123462c3062e8438BBB75c1c5
            IERC721(address(hook)).transferFrom(address(this), 0x328809A567b87b6123462c3062e8438BBB75c1c5, mintedIds[147]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[148]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[148]);
            
            // Transfer UPC 44 (minted tokenId mintedIds[149]) to 0xbeC26FFa12c90217943D1b2958f60A821aE6E549
            IERC721(address(hook)).transferFrom(address(this), 0xbeC26FFa12c90217943D1b2958f60A821aE6E549, mintedIds[149]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[150]) to 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3
            IERC721(address(hook)).transferFrom(address(this), 0xFB46349c0A3F04150E8c731B3A4fC415b0850CE3, mintedIds[150]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[151]) to 0x99Fa48ccEa8a38CDE6B437450fF9bBdDAFAA4Fc8
            IERC721(address(hook)).transferFrom(address(this), 0x99Fa48ccEa8a38CDE6B437450fF9bBdDAFAA4Fc8, mintedIds[151]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[152]) to 0x8b80755C441d355405CA7571443Bb9247B77Ec16
            IERC721(address(hook)).transferFrom(address(this), 0x8b80755C441d355405CA7571443Bb9247B77Ec16, mintedIds[152]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[153]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[153]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[154]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[154]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[155]) to 0x8b80755C441d355405CA7571443Bb9247B77Ec16
            IERC721(address(hook)).transferFrom(address(this), 0x8b80755C441d355405CA7571443Bb9247B77Ec16, mintedIds[155]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[156]) to 0x8b80755C441d355405CA7571443Bb9247B77Ec16
            IERC721(address(hook)).transferFrom(address(this), 0x8b80755C441d355405CA7571443Bb9247B77Ec16, mintedIds[156]);
            
            // Transfer UPC 5 (minted tokenId mintedIds[157]) to 0x8b80755C441d355405CA7571443Bb9247B77Ec16
            IERC721(address(hook)).transferFrom(address(this), 0x8b80755C441d355405CA7571443Bb9247B77Ec16, mintedIds[157]);
            
            // Transfer UPC 5 (minted tokenId mintedIds[158]) to 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041
            IERC721(address(hook)).transferFrom(address(this), 0xf7253A0E87E39d2cD6365919D4a3D56D431D0041, mintedIds[158]);
            
            // Transfer UPC 6 (minted tokenId mintedIds[159]) to 0x328809A567b87b6123462c3062e8438BBB75c1c5
            IERC721(address(hook)).transferFrom(address(this), 0x328809A567b87b6123462c3062e8438BBB75c1c5, mintedIds[159]);
            
            return;
        }
        if (chainId == 42161) {
            // Arbitrum migration
            console.log("Migrating 205 items on Arbitrum");
            
            // Step 1: Mint all assets to deployer initially
            
            console.log("Minting tierIds to deployer");
            
            // Create array of all tierIds to mint
            uint16[] memory allTierIds = new uint16[](205);
            uint16 tierIndex = 0;
            
            // Helper function to add UPC instances to allTierIds
            function _addUpcInstances(uint16 upc, uint256 quantity) internal {
                for (uint256 i = 0; i < quantity; i++) {
                    allTierIds[tierIndex] = upc;
                    tierIndex++;
                }
            }
            
            _addUpcInstances(3, 2); // Add 2 instances of UPC 3
            _addUpcInstances(4, 9); // Add 9 instances of UPC 4
            _addUpcInstances(5, 3); // Add 3 instances of UPC 5
            _addUpcInstances(6, 1); // Add 1 instances of UPC 6
            _addUpcInstances(10, 2); // Add 2 instances of UPC 10
            _addUpcInstances(11, 1); // Add 1 instances of UPC 11
            _addUpcInstances(19, 4); // Add 4 instances of UPC 19
            _addUpcInstances(20, 2); // Add 2 instances of UPC 20
            _addUpcInstances(25, 1); // Add 1 instances of UPC 25
            _addUpcInstances(28, 2); // Add 2 instances of UPC 28
            _addUpcInstances(31, 2); // Add 2 instances of UPC 31
            _addUpcInstances(32, 1); // Add 1 instances of UPC 32
            _addUpcInstances(38, 1); // Add 1 instances of UPC 38
            _addUpcInstances(39, 1); // Add 1 instances of UPC 39
            _addUpcInstances(43, 1); // Add 1 instances of UPC 43
            _addUpcInstances(47, 27); // Add 27 instances of UPC 47
            _addUpcInstances(49, 145); // Add 145 instances of UPC 49
            
            // Mint all tierIds at once
            uint256[] memory mintedIds = hook.mintFor(allTierIds, address(this));
            
            // Define struct to hold all UPC minted tokenIds
            struct MintedIds {
                uint256[2] upc3;
                uint256[9] upc4;
                uint256[3] upc5;
                uint256[1] upc6;
                uint256[2] upc10;
                uint256[1] upc11;
                uint256[4] upc19;
                uint256[2] upc20;
                uint256[1] upc25;
                uint256[2] upc28;
                uint256[2] upc31;
                uint256[1] upc32;
                uint256[1] upc38;
                uint256[1] upc39;
                uint256[1] upc43;
                uint256[27] upc47;
                uint256[145] upc49;
                            }
            
            // Create and populate the struct
            MintedIds memory formattedMintedIds;
            
            // Populate UPC 3 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc3[i] = mintedIds[0 + i];
            }
            // Populate UPC 4 minted tokenIds (9 items)
            for (uint256 i = 0; i < 9; i++) {
                sortedMintedIds.upc4[i] = mintedIds[2 + i];
            }
            // Populate UPC 5 minted tokenIds (3 items)
            for (uint256 i = 0; i < 3; i++) {
                sortedMintedIds.upc5[i] = mintedIds[11 + i];
            }
            // Populate UPC 6 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc6[i] = mintedIds[14 + i];
            }
            // Populate UPC 10 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc10[i] = mintedIds[15 + i];
            }
            // Populate UPC 11 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc11[i] = mintedIds[17 + i];
            }
            // Populate UPC 19 minted tokenIds (4 items)
            for (uint256 i = 0; i < 4; i++) {
                sortedMintedIds.upc19[i] = mintedIds[18 + i];
            }
            // Populate UPC 20 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc20[i] = mintedIds[22 + i];
            }
            // Populate UPC 25 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc25[i] = mintedIds[24 + i];
            }
            // Populate UPC 28 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc28[i] = mintedIds[25 + i];
            }
            // Populate UPC 31 minted tokenIds (2 items)
            for (uint256 i = 0; i < 2; i++) {
                sortedMintedIds.upc31[i] = mintedIds[27 + i];
            }
            // Populate UPC 32 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc32[i] = mintedIds[29 + i];
            }
            // Populate UPC 38 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc38[i] = mintedIds[30 + i];
            }
            // Populate UPC 39 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc39[i] = mintedIds[31 + i];
            }
            // Populate UPC 43 minted tokenIds (1 items)
            for (uint256 i = 0; i < 1; i++) {
                sortedMintedIds.upc43[i] = mintedIds[32 + i];
            }
            // Populate UPC 47 minted tokenIds (27 items)
            for (uint256 i = 0; i < 27; i++) {
                sortedMintedIds.upc47[i] = mintedIds[33 + i];
            }
            // Populate UPC 49 minted tokenIds (145 items)
            for (uint256 i = 0; i < 145; i++) {
                sortedMintedIds.upc49[i] = mintedIds[60 + i];
            }
            // Step 2: Process each Banny body and dress them
            console.log("Processing 11 Banny bodies...");
            
            // Dress Banny 3000000001 (Orange)
            {
                uint256[] memory outfitIds = new uint256[](4);
                    outfitIds[0] = sortedMintedIds.upc19[0]; // V4: 19000000001 -> V5: sortedMintedIds.upc19[0]
                outfitIds[1] = sortedMintedIds.upc25[0]; // V4: 25000000001 -> V5: sortedMintedIds.upc25[0]
                outfitIds[2] = sortedMintedIds.upc38[0]; // V4: 38000000001 -> V5: sortedMintedIds.upc38[0]
                outfitIds[3] = sortedMintedIds.upc47[0]; // V4: 47000000001 -> V5: sortedMintedIds.upc47[0]

                resolver.decorateBannyWith(
                    address(hook),
                    3000000001,
                    sortedMintedIds.upc5[0],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000003 (Original)
            {
                uint256[] memory outfitIds = new uint256[](3);
                    outfitIds[0] = sortedMintedIds.upc11[0]; // V4: 11000000001 -> V5: sortedMintedIds.upc11[0]
                outfitIds[1] = sortedMintedIds.upc19[2]; // V4: 19000000003 -> V5: sortedMintedIds.upc19[2]
                outfitIds[2] = sortedMintedIds.upc28[0]; // V4: 28000000001 -> V5: sortedMintedIds.upc28[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000003,
                    sortedMintedIds.upc6[0],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000004 (Original)
            {
                uint256[] memory outfitIds = new uint256[](2);
                    outfitIds[0] = sortedMintedIds.upc10[0]; // V4: 10000000001 -> V5: sortedMintedIds.upc10[0]
                outfitIds[1] = sortedMintedIds.upc20[0]; // V4: 20000000001 -> V5: sortedMintedIds.upc20[0]

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
                    outfitIds[0] = sortedMintedIds.upc31[0]; // V4: 31000000001 -> V5: sortedMintedIds.upc31[0]
                outfitIds[1] = sortedMintedIds.upc49[1]; // V4: 49000000002 -> V5: sortedMintedIds.upc49[1]

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
                    outfitIds[0] = sortedMintedIds.upc10[1]; // V4: 10000000002 -> V5: sortedMintedIds.upc10[1]
                outfitIds[1] = sortedMintedIds.upc20[1]; // V4: 20000000002 -> V5: sortedMintedIds.upc20[1]
                outfitIds[2] = sortedMintedIds.upc43[0]; // V4: 43000000001 -> V5: sortedMintedIds.upc43[0]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000007,
                    sortedMintedIds.upc5[1],
                    outfitIds
                );
            }
            
            // Dress Banny 4000000009 (Original)
            {
                uint256[] memory outfitIds = new uint256[](1);
                    outfitIds[0] = sortedMintedIds.upc28[1]; // V4: 28000000002 -> V5: sortedMintedIds.upc28[1]

                resolver.decorateBannyWith(
                    address(hook),
                    4000000009,
                    0,
                    outfitIds
                );
            }
            
            // Step 3: Transfer all assets to rightful owners
            console.log("Transferring %d tokens to rightful owners", mintedIds.length);
            
            // Transfer UPC 3 (minted tokenId mintedIds[0]) to 0x2aa64E6d80390F5C017F0313cB908051BE2FD35e
            IERC721(address(hook)).transferFrom(address(this), 0x2aa64E6d80390F5C017F0313cB908051BE2FD35e, mintedIds[0]);
            
            // Transfer UPC 3 (minted tokenId mintedIds[1]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[1]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[2]) to 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb
            IERC721(address(hook)).transferFrom(address(this), 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb, mintedIds[2]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[3]) to 0xfD282d9f4d06C4BDc6a41af1Ae920A0AD70D18a3
            IERC721(address(hook)).transferFrom(address(this), 0xfD282d9f4d06C4BDc6a41af1Ae920A0AD70D18a3, mintedIds[3]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[4]) to 0x08B3e694caA2F1fcF8eF71095CED1326f3454B89
            IERC721(address(hook)).transferFrom(address(this), 0x08B3e694caA2F1fcF8eF71095CED1326f3454B89, mintedIds[4]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[5]) to 0x9fDf876a50EA8f95017dCFC7709356887025B5BB
            IERC721(address(hook)).transferFrom(address(this), 0x9fDf876a50EA8f95017dCFC7709356887025B5BB, mintedIds[5]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[6]) to 0x187089B33E5812310Ed32A57F53B3fAD0383a19D
            IERC721(address(hook)).transferFrom(address(this), 0x187089B33E5812310Ed32A57F53B3fAD0383a19D, mintedIds[6]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[7]) to 0xc6404f24DB2f573F07F3A60758765caad198c0c3
            IERC721(address(hook)).transferFrom(address(this), 0xc6404f24DB2f573F07F3A60758765caad198c0c3, mintedIds[7]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[8]) to 0xB2d3900807094D4Fe47405871B0C8AdB58E10D42
            IERC721(address(hook)).transferFrom(address(this), 0xB2d3900807094D4Fe47405871B0C8AdB58E10D42, mintedIds[8]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[9]) to 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12
            IERC721(address(hook)).transferFrom(address(this), 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12, mintedIds[9]);
            
            // Transfer UPC 4 (minted tokenId mintedIds[10]) to 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12
            IERC721(address(hook)).transferFrom(address(this), 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12, mintedIds[10]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[11]) to 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb
            IERC721(address(hook)).transferFrom(address(this), 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb, mintedIds[11]);
            
            // Transfer UPC 19 (minted tokenId mintedIds[12]) to 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12
            IERC721(address(hook)).transferFrom(address(this), 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12, mintedIds[12]);
            
            // Transfer UPC 31 (minted tokenId mintedIds[13]) to 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12
            IERC721(address(hook)).transferFrom(address(this), 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12, mintedIds[13]);
            
            // Transfer UPC 32 (minted tokenId mintedIds[14]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[14]);
            
            // Transfer UPC 39 (minted tokenId mintedIds[15]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[15]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[16]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[16]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[17]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[17]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[18]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[18]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[19]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[19]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[20]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[20]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[21]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[21]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[22]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[22]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[23]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[23]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[24]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[24]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[25]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[25]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[26]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[26]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[27]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[27]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[28]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[28]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[29]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[29]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[30]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[30]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[31]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[31]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[32]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[32]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[33]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[33]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[34]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[34]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[35]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[35]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[36]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[36]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[37]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[37]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[38]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[38]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[39]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[39]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[40]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[40]);
            
            // Transfer UPC 47 (minted tokenId mintedIds[41]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[41]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[42]) to 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb
            IERC721(address(hook)).transferFrom(address(this), 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb, mintedIds[42]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[43]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[43]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[44]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[44]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[45]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[45]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[46]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[46]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[47]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[47]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[48]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[48]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[49]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[49]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[50]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[50]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[51]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[51]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[52]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[52]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[53]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[53]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[54]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[54]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[55]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[55]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[56]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[56]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[57]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[57]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[58]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[58]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[59]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[59]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[60]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[60]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[61]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[61]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[62]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[62]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[63]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[63]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[64]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[64]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[65]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[65]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[66]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[66]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[67]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[67]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[68]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[68]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[69]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[69]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[70]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[70]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[71]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[71]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[72]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[72]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[73]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[73]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[74]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[74]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[75]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[75]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[76]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[76]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[77]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[77]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[78]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[78]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[79]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[79]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[80]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[80]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[81]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[81]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[82]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[82]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[83]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[83]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[84]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[84]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[85]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[85]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[86]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[86]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[87]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[87]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[88]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[88]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[89]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[89]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[90]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[90]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[91]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[91]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[92]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[92]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[93]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[93]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[94]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[94]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[95]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[95]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[96]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[96]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[97]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[97]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[98]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[98]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[99]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[99]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[100]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[100]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[101]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[101]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[102]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[102]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[103]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[103]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[104]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[104]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[105]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[105]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[106]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[106]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[107]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[107]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[108]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[108]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[109]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[109]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[110]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[110]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[111]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[111]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[112]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[112]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[113]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[113]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[114]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[114]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[115]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[115]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[116]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[116]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[117]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[117]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[118]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[118]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[119]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[119]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[120]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[120]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[121]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[121]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[122]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[122]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[123]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[123]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[124]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[124]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[125]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[125]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[126]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[126]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[127]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[127]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[128]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[128]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[129]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[129]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[130]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[130]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[131]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[131]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[132]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[132]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[133]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[133]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[134]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[134]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[135]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[135]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[136]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[136]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[137]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[137]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[138]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[138]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[139]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[139]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[140]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[140]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[141]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[141]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[142]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[142]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[143]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[143]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[144]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[144]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[145]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[145]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[146]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[146]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[147]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[147]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[148]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[148]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[149]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[149]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[150]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[150]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[151]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[151]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[152]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[152]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[153]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[153]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[154]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[154]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[155]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[155]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[156]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[156]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[157]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[157]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[158]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[158]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[159]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[159]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[160]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[160]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[161]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[161]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[162]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[162]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[163]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[163]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[164]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[164]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[165]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[165]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[166]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[166]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[167]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[167]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[168]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[168]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[169]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[169]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[170]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[170]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[171]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[171]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[172]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[172]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[173]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[173]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[174]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[174]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[175]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[175]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[176]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[176]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[177]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[177]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[178]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[178]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[179]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[179]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[180]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[180]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[181]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[181]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[182]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[182]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[183]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[183]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[184]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[184]);
            
            // Transfer UPC 49 (minted tokenId mintedIds[185]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[185]);
            
            // Transfer UPC 5 (minted tokenId mintedIds[186]) to 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7
            IERC721(address(hook)).transferFrom(address(this), 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7, mintedIds[186]);
            
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
