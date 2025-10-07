// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";

contract MigrationContractEthereum {
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
    
    address[] private transferOwners;
    
    constructor(address[] memory _transferOwners) {
        transferOwners = _transferOwners;
    }
    
    function executeMigration(
        address hookAddress,
        address resolverAddress,
        address v4HookAddress,
        address v4ResolverAddress,
        uint256[] memory mintedIds
    ) external {
        
        // Validate addresses
        require(hookAddress != address(0), "Hook address not set");
        require(resolverAddress != address(0), "Resolver address not set");
        require(v4HookAddress != address(0), "V4 Hook address not set");
        require(v4ResolverAddress != address(0), "V4 Resolver address not set");
        
        JB721TiersHook hook = JB721TiersHook(hookAddress);
        Banny721TokenUriResolver resolver = Banny721TokenUriResolver(resolverAddress);
        IERC721 v4Hook = IERC721(v4HookAddress);
        Banny721TokenUriResolver v4Resolver = Banny721TokenUriResolver(v4ResolverAddress);
        
        // Ethereum migration - 536 items
        
        // Step 1: Assets are already minted to this contract by the deployer
        
        
        // Assets are already minted to this contract by the deployer
        
        // Create and populate the struct
        MintedIds memory sortedMintedIds;
        
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 1000000001);
            require(v4BackgroundId == 5000000004, "V4/V5 background mismatch for Banny 1000000001");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 1000000001");
            
            require(v4OutfitIds[0] == 7000000002, "V4/V5 outfit 0 mismatch for Banny 1000000001");
            require(v4OutfitIds[1] == 17000000001, "V4/V5 outfit 1 mismatch for Banny 1000000001");
            require(v4OutfitIds[2] == 26000000004, "V4/V5 outfit 2 mismatch for Banny 1000000001");
            require(v4OutfitIds[3] == 46000000001, "V4/V5 outfit 3 mismatch for Banny 1000000001");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 2000000002);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 2000000002");
            require(v4OutfitIds.length == 5, "V4/V5 outfit count mismatch for Banny 2000000002");
            
            require(v4OutfitIds[0] == 7000000001, "V4/V5 outfit 0 mismatch for Banny 2000000002");
            require(v4OutfitIds[1] == 14000000003, "V4/V5 outfit 1 mismatch for Banny 2000000002");
            require(v4OutfitIds[2] == 19000000012, "V4/V5 outfit 2 mismatch for Banny 2000000002");
            require(v4OutfitIds[3] == 26000000003, "V4/V5 outfit 3 mismatch for Banny 2000000002");
            require(v4OutfitIds[4] == 35000000006, "V4/V5 outfit 4 mismatch for Banny 2000000002");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 2000000004);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 2000000004");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 2000000004");
            
            require(v4OutfitIds[0] == 18000000002, "V4/V5 outfit 0 mismatch for Banny 2000000004");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 2000000005);
            require(v4BackgroundId == 5000000005, "V4/V5 background mismatch for Banny 2000000005");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 2000000005");
            
            require(v4OutfitIds[0] == 21000000001, "V4/V5 outfit 0 mismatch for Banny 2000000005");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 2000000006);
            require(v4BackgroundId == 5000000008, "V4/V5 background mismatch for Banny 2000000006");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 2000000006");
            
            require(v4OutfitIds[0] == 19000000019, "V4/V5 outfit 0 mismatch for Banny 2000000006");
            require(v4OutfitIds[1] == 25000000009, "V4/V5 outfit 1 mismatch for Banny 2000000006");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000001);
            require(v4BackgroundId == 6000000001, "V4/V5 background mismatch for Banny 3000000001");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 3000000001");
            
            require(v4OutfitIds[0] == 14000000001, "V4/V5 outfit 0 mismatch for Banny 3000000001");
            require(v4OutfitIds[1] == 26000000001, "V4/V5 outfit 1 mismatch for Banny 3000000001");
            require(v4OutfitIds[2] == 35000000001, "V4/V5 outfit 2 mismatch for Banny 3000000001");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000003);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 3000000003");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 3000000003");
            
            require(v4OutfitIds[0] == 10000000005, "V4/V5 outfit 0 mismatch for Banny 3000000003");
            require(v4OutfitIds[1] == 44000000003, "V4/V5 outfit 1 mismatch for Banny 3000000003");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000006);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 3000000006");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 3000000006");
            
            require(v4OutfitIds[0] == 32000000001, "V4/V5 outfit 0 mismatch for Banny 3000000006");
            require(v4OutfitIds[1] == 44000000004, "V4/V5 outfit 1 mismatch for Banny 3000000006");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000007);
            require(v4BackgroundId == 6000000003, "V4/V5 background mismatch for Banny 3000000007");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 3000000007");
            
            require(v4OutfitIds[0] == 31000000003, "V4/V5 outfit 0 mismatch for Banny 3000000007");
            require(v4OutfitIds[1] == 47000000003, "V4/V5 outfit 1 mismatch for Banny 3000000007");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000009);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 3000000009");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 3000000009");
            
            require(v4OutfitIds[0] == 35000000002, "V4/V5 outfit 0 mismatch for Banny 3000000009");
            require(v4OutfitIds[1] == 43000000005, "V4/V5 outfit 1 mismatch for Banny 3000000009");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000010);
            require(v4BackgroundId == 6000000004, "V4/V5 background mismatch for Banny 3000000010");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 3000000010");
            
            require(v4OutfitIds[0] == 32000000002, "V4/V5 outfit 0 mismatch for Banny 3000000010");
            require(v4OutfitIds[1] == 35000000004, "V4/V5 outfit 1 mismatch for Banny 3000000010");
            require(v4OutfitIds[2] == 48000000001, "V4/V5 outfit 2 mismatch for Banny 3000000010");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000011);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 3000000011");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 3000000011");
            
            require(v4OutfitIds[0] == 23000000001, "V4/V5 outfit 0 mismatch for Banny 3000000011");
            require(v4OutfitIds[1] == 39000000001, "V4/V5 outfit 1 mismatch for Banny 3000000011");
            require(v4OutfitIds[2] == 43000000006, "V4/V5 outfit 2 mismatch for Banny 3000000011");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000013);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 3000000013");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 3000000013");
            
            require(v4OutfitIds[0] == 19000000008, "V4/V5 outfit 0 mismatch for Banny 3000000013");
            require(v4OutfitIds[1] == 31000000006, "V4/V5 outfit 1 mismatch for Banny 3000000013");
            require(v4OutfitIds[2] == 37000000001, "V4/V5 outfit 2 mismatch for Banny 3000000013");
            require(v4OutfitIds[3] == 43000000007, "V4/V5 outfit 3 mismatch for Banny 3000000013");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000017);
            require(v4BackgroundId == 5000000002, "V4/V5 background mismatch for Banny 3000000017");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 3000000017");
            
            require(v4OutfitIds[0] == 25000000005, "V4/V5 outfit 0 mismatch for Banny 3000000017");
            require(v4OutfitIds[1] == 49000000002, "V4/V5 outfit 1 mismatch for Banny 3000000017");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000022);
            require(v4BackgroundId == 6000000011, "V4/V5 background mismatch for Banny 3000000022");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 3000000022");
            
            require(v4OutfitIds[0] == 19000000015, "V4/V5 outfit 0 mismatch for Banny 3000000022");
            require(v4OutfitIds[1] == 38000000002, "V4/V5 outfit 1 mismatch for Banny 3000000022");
            require(v4OutfitIds[2] == 48000000005, "V4/V5 outfit 2 mismatch for Banny 3000000022");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000023);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 3000000023");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 3000000023");
            
            require(v4OutfitIds[0] == 14000000005, "V4/V5 outfit 0 mismatch for Banny 3000000023");
            require(v4OutfitIds[1] == 25000000008, "V4/V5 outfit 1 mismatch for Banny 3000000023");
            require(v4OutfitIds[2] == 37000000003, "V4/V5 outfit 2 mismatch for Banny 3000000023");
            require(v4OutfitIds[3] == 42000000007, "V4/V5 outfit 3 mismatch for Banny 3000000023");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000026);
            require(v4BackgroundId == 6000000012, "V4/V5 background mismatch for Banny 3000000026");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 3000000026");
            
            require(v4OutfitIds[0] == 15000000004, "V4/V5 outfit 0 mismatch for Banny 3000000026");
            require(v4OutfitIds[1] == 29000000003, "V4/V5 outfit 1 mismatch for Banny 3000000026");
            require(v4OutfitIds[2] == 39000000003, "V4/V5 outfit 2 mismatch for Banny 3000000026");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000004);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000004");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000004");
            
            require(v4OutfitIds[0] == 28000000002, "V4/V5 outfit 0 mismatch for Banny 4000000004");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000009);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000009");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 4000000009");
            
            require(v4OutfitIds[0] == 10000000001, "V4/V5 outfit 0 mismatch for Banny 4000000009");
            require(v4OutfitIds[1] == 19000000002, "V4/V5 outfit 1 mismatch for Banny 4000000009");
            require(v4OutfitIds[2] == 25000000002, "V4/V5 outfit 2 mismatch for Banny 4000000009");
            require(v4OutfitIds[3] == 43000000003, "V4/V5 outfit 3 mismatch for Banny 4000000009");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000010);
            require(v4BackgroundId == 5000000001, "V4/V5 background mismatch for Banny 4000000010");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 4000000010");
            
            require(v4OutfitIds[0] == 10000000002, "V4/V5 outfit 0 mismatch for Banny 4000000010");
            require(v4OutfitIds[1] == 18000000001, "V4/V5 outfit 1 mismatch for Banny 4000000010");
            require(v4OutfitIds[2] == 20000000001, "V4/V5 outfit 2 mismatch for Banny 4000000010");
            require(v4OutfitIds[3] == 44000000001, "V4/V5 outfit 3 mismatch for Banny 4000000010");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000013);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000013");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000013");
            
            require(v4OutfitIds[0] == 31000000002, "V4/V5 outfit 0 mismatch for Banny 4000000013");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000014);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000014");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 4000000014");
            
            require(v4OutfitIds[0] == 10000000006, "V4/V5 outfit 0 mismatch for Banny 4000000014");
            require(v4OutfitIds[1] == 19000000004, "V4/V5 outfit 1 mismatch for Banny 4000000014");
            require(v4OutfitIds[2] == 25000000003, "V4/V5 outfit 2 mismatch for Banny 4000000014");
            require(v4OutfitIds[3] == 49000000001, "V4/V5 outfit 3 mismatch for Banny 4000000014");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000015);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000015");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 4000000015");
            
            require(v4OutfitIds[0] == 15000000001, "V4/V5 outfit 0 mismatch for Banny 4000000015");
            require(v4OutfitIds[1] == 26000000002, "V4/V5 outfit 1 mismatch for Banny 4000000015");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000016);
            require(v4BackgroundId == 6000000002, "V4/V5 background mismatch for Banny 4000000016");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000016");
            
            require(v4OutfitIds[0] == 10000000007, "V4/V5 outfit 0 mismatch for Banny 4000000016");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000019);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000019");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 4000000019");
            
            require(v4OutfitIds[0] == 19000000005, "V4/V5 outfit 0 mismatch for Banny 4000000019");
            require(v4OutfitIds[1] == 35000000003, "V4/V5 outfit 1 mismatch for Banny 4000000019");
            require(v4OutfitIds[2] == 42000000002, "V4/V5 outfit 2 mismatch for Banny 4000000019");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000023);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000023");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000023");
            
            require(v4OutfitIds[0] == 31000000007, "V4/V5 outfit 0 mismatch for Banny 4000000023");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000033);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000033");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 4000000033");
            
            require(v4OutfitIds[0] == 19000000009, "V4/V5 outfit 0 mismatch for Banny 4000000033");
            require(v4OutfitIds[1] == 43000000008, "V4/V5 outfit 1 mismatch for Banny 4000000033");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000039);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000039");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 4000000039");
            
            require(v4OutfitIds[0] == 13000000001, "V4/V5 outfit 0 mismatch for Banny 4000000039");
            require(v4OutfitIds[1] == 19000000011, "V4/V5 outfit 1 mismatch for Banny 4000000039");
            require(v4OutfitIds[2] == 25000000006, "V4/V5 outfit 2 mismatch for Banny 4000000039");
            require(v4OutfitIds[3] == 42000000004, "V4/V5 outfit 3 mismatch for Banny 4000000039");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000040);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000040");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000040");
            
            require(v4OutfitIds[0] == 25000000007, "V4/V5 outfit 0 mismatch for Banny 4000000040");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000041);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000041");
            require(v4OutfitIds.length == 5, "V4/V5 outfit count mismatch for Banny 4000000041");
            
            require(v4OutfitIds[0] == 16000000001, "V4/V5 outfit 0 mismatch for Banny 4000000041");
            require(v4OutfitIds[1] == 17000000002, "V4/V5 outfit 1 mismatch for Banny 4000000041");
            require(v4OutfitIds[2] == 31000000009, "V4/V5 outfit 2 mismatch for Banny 4000000041");
            require(v4OutfitIds[3] == 33000000001, "V4/V5 outfit 3 mismatch for Banny 4000000041");
            require(v4OutfitIds[4] == 48000000002, "V4/V5 outfit 4 mismatch for Banny 4000000041");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000043);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000043");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 4000000043");
            
            require(v4OutfitIds[0] == 32000000003, "V4/V5 outfit 0 mismatch for Banny 4000000043");
            require(v4OutfitIds[1] == 48000000003, "V4/V5 outfit 1 mismatch for Banny 4000000043");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000044);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000044");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 4000000044");
            
            require(v4OutfitIds[0] == 23000000002, "V4/V5 outfit 0 mismatch for Banny 4000000044");
            require(v4OutfitIds[1] == 41000000001, "V4/V5 outfit 1 mismatch for Banny 4000000044");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000045);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000045");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 4000000045");
            
            require(v4OutfitIds[0] == 23000000004, "V4/V5 outfit 0 mismatch for Banny 4000000045");
            require(v4OutfitIds[1] == 41000000003, "V4/V5 outfit 1 mismatch for Banny 4000000045");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000046);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000046");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 4000000046");
            
            require(v4OutfitIds[0] == 23000000005, "V4/V5 outfit 0 mismatch for Banny 4000000046");
            require(v4OutfitIds[1] == 41000000004, "V4/V5 outfit 1 mismatch for Banny 4000000046");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000047);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000047");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 4000000047");
            
            require(v4OutfitIds[0] == 23000000003, "V4/V5 outfit 0 mismatch for Banny 4000000047");
            require(v4OutfitIds[1] == 41000000002, "V4/V5 outfit 1 mismatch for Banny 4000000047");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000048);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000048");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 4000000048");
            
            require(v4OutfitIds[0] == 19000000013, "V4/V5 outfit 0 mismatch for Banny 4000000048");
            require(v4OutfitIds[1] == 31000000010, "V4/V5 outfit 1 mismatch for Banny 4000000048");
            require(v4OutfitIds[2] == 35000000007, "V4/V5 outfit 2 mismatch for Banny 4000000048");
            require(v4OutfitIds[3] == 47000000005, "V4/V5 outfit 3 mismatch for Banny 4000000048");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000052);
            require(v4BackgroundId == 5000000006, "V4/V5 background mismatch for Banny 4000000052");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 4000000052");
            
            require(v4OutfitIds[0] == 10000000012, "V4/V5 outfit 0 mismatch for Banny 4000000052");
            require(v4OutfitIds[1] == 18000000003, "V4/V5 outfit 1 mismatch for Banny 4000000052");
            require(v4OutfitIds[2] == 20000000008, "V4/V5 outfit 2 mismatch for Banny 4000000052");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000054);
            require(v4BackgroundId == 6000000010, "V4/V5 background mismatch for Banny 4000000054");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 4000000054");
            
            require(v4OutfitIds[0] == 15000000002, "V4/V5 outfit 0 mismatch for Banny 4000000054");
            require(v4OutfitIds[1] == 26000000005, "V4/V5 outfit 1 mismatch for Banny 4000000054");
            require(v4OutfitIds[2] == 44000000008, "V4/V5 outfit 2 mismatch for Banny 4000000054");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000055);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000055");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 4000000055");
            
            require(v4OutfitIds[0] == 19000000016, "V4/V5 outfit 0 mismatch for Banny 4000000055");
            require(v4OutfitIds[1] == 39000000002, "V4/V5 outfit 1 mismatch for Banny 4000000055");
            require(v4OutfitIds[2] == 44000000009, "V4/V5 outfit 2 mismatch for Banny 4000000055");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000056);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000056");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 4000000056");
            
            require(v4OutfitIds[0] == 15000000003, "V4/V5 outfit 0 mismatch for Banny 4000000056");
            require(v4OutfitIds[1] == 23000000007, "V4/V5 outfit 1 mismatch for Banny 4000000056");
            require(v4OutfitIds[2] == 40000000001, "V4/V5 outfit 2 mismatch for Banny 4000000056");
            require(v4OutfitIds[3] == 49000000004, "V4/V5 outfit 3 mismatch for Banny 4000000056");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000057);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000057");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 4000000057");
            
            require(v4OutfitIds[0] == 19000000017, "V4/V5 outfit 0 mismatch for Banny 4000000057");
            require(v4OutfitIds[1] == 28000000008, "V4/V5 outfit 1 mismatch for Banny 4000000057");
            require(v4OutfitIds[2] == 38000000003, "V4/V5 outfit 2 mismatch for Banny 4000000057");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000060);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000060");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 4000000060");
            
            require(v4OutfitIds[0] == 13000000003, "V4/V5 outfit 0 mismatch for Banny 4000000060");
            require(v4OutfitIds[1] == 48000000006, "V4/V5 outfit 1 mismatch for Banny 4000000060");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000076);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000076");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 4000000076");
            
            require(v4OutfitIds[0] == 19000000018, "V4/V5 outfit 0 mismatch for Banny 4000000076");
            require(v4OutfitIds[1] == 29000000002, "V4/V5 outfit 1 mismatch for Banny 4000000076");
            require(v4OutfitIds[2] == 38000000001, "V4/V5 outfit 2 mismatch for Banny 4000000076");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000078);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000078");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 4000000078");
            
            require(v4OutfitIds[0] == 31000000011, "V4/V5 outfit 0 mismatch for Banny 4000000078");
            require(v4OutfitIds[1] == 43000000017, "V4/V5 outfit 1 mismatch for Banny 4000000078");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000079);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000079");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 4000000079");
            
            require(v4OutfitIds[0] == 19000000020, "V4/V5 outfit 0 mismatch for Banny 4000000079");
            require(v4OutfitIds[1] == 25000000010, "V4/V5 outfit 1 mismatch for Banny 4000000079");
            require(v4OutfitIds[2] == 43000000018, "V4/V5 outfit 2 mismatch for Banny 4000000079");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000080);
            require(v4BackgroundId == 6000000013, "V4/V5 background mismatch for Banny 4000000080");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 4000000080");
            
            require(v4OutfitIds[0] == 15000000005, "V4/V5 outfit 0 mismatch for Banny 4000000080");
            require(v4OutfitIds[1] == 19000000021, "V4/V5 outfit 1 mismatch for Banny 4000000080");
            require(v4OutfitIds[2] == 25000000011, "V4/V5 outfit 2 mismatch for Banny 4000000080");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000085);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000085");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000085");
            
            require(v4OutfitIds[0] == 31000000013, "V4/V5 outfit 0 mismatch for Banny 4000000085");
        }
        
        // Step 3: Transfer all assets to rightful owners using constructor data
        for (uint256 i = 0; i < transferOwners.length; i++) {
            // Verify V4 ownership before transferring V5
            address v4Owner = v4Hook.ownerOf(mintedIds[i]);
            require(v4Owner == transferOwners[i], "V4/V5 ownership mismatch for token");
            
            IERC721(address(hook)).transferFrom(
                address(this), 
                transferOwners[i], 
                mintedIds[i]
            );
        }
    }
}