// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";

contract MigrationContractBase {
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
        
        // Base migration - 228 items
        
        // Step 1: Mint all assets to deployer initially
        
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