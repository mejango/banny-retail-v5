// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";

contract MigrationContractEthereum {
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
        
        // Ethereum migration - 536 items
        
        // Step 1: Mint all assets to deployer initially
        
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
        
        // Step 3: Transfer all assets to rightful owners using constructor data
        for (uint256 i = 0; i < transferOwners.length; i++) {
            IERC721(address(hook)).transferFrom(
                deployer, 
                transferOwners[i], 
                mintedIds[i]
            );
        }
    }
}