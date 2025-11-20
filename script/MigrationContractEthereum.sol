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
        address v4ResolverAddress
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
        // Token IDs are generated as: UPC * 1000000000 + unitNumber (where unitNumber starts at 1)
        MintedIds memory sortedMintedIds;
        
        // Populate UPC 1 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc1[i] = 1 * 1000000000 + (i + 1);
        }
        // Populate UPC 2 minted tokenIds (6 items)
        for (uint256 i = 0; i < 6; i++) {
            sortedMintedIds.upc2[i] = 2 * 1000000000 + (i + 1);
        }
        // Populate UPC 3 minted tokenIds (26 items)
        for (uint256 i = 0; i < 26; i++) {
            sortedMintedIds.upc3[i] = 3 * 1000000000 + (i + 1);
        }
        // Populate UPC 4 minted tokenIds (85 items)
        for (uint256 i = 0; i < 85; i++) {
            sortedMintedIds.upc4[i] = 4 * 1000000000 + (i + 1);
        }
        // Populate UPC 5 minted tokenIds (8 items)
        for (uint256 i = 0; i < 8; i++) {
            sortedMintedIds.upc5[i] = 5 * 1000000000 + (i + 1);
        }
        // Populate UPC 6 minted tokenIds (13 items)
        for (uint256 i = 0; i < 13; i++) {
            sortedMintedIds.upc6[i] = 6 * 1000000000 + (i + 1);
        }
        // Populate UPC 7 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc7[i] = 7 * 1000000000 + (i + 1);
        }
        // Populate UPC 10 minted tokenIds (14 items)
        for (uint256 i = 0; i < 14; i++) {
            sortedMintedIds.upc10[i] = 10 * 1000000000 + (i + 1);
        }
        // Populate UPC 11 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc11[i] = 11 * 1000000000 + (i + 1);
        }
        // Populate UPC 13 minted tokenIds (4 items)
        for (uint256 i = 0; i < 4; i++) {
            sortedMintedIds.upc13[i] = 13 * 1000000000 + (i + 1);
        }
        // Populate UPC 14 minted tokenIds (6 items)
        for (uint256 i = 0; i < 6; i++) {
            sortedMintedIds.upc14[i] = 14 * 1000000000 + (i + 1);
        }
        // Populate UPC 15 minted tokenIds (5 items)
        for (uint256 i = 0; i < 5; i++) {
            sortedMintedIds.upc15[i] = 15 * 1000000000 + (i + 1);
        }
        // Populate UPC 16 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc16[i] = 16 * 1000000000 + (i + 1);
        }
        // Populate UPC 17 minted tokenIds (5 items)
        for (uint256 i = 0; i < 5; i++) {
            sortedMintedIds.upc17[i] = 17 * 1000000000 + (i + 1);
        }
        // Populate UPC 18 minted tokenIds (3 items)
        for (uint256 i = 0; i < 3; i++) {
            sortedMintedIds.upc18[i] = 18 * 1000000000 + (i + 1);
        }
        // Populate UPC 19 minted tokenIds (22 items)
        for (uint256 i = 0; i < 22; i++) {
            sortedMintedIds.upc19[i] = 19 * 1000000000 + (i + 1);
        }
        // Populate UPC 20 minted tokenIds (8 items)
        for (uint256 i = 0; i < 8; i++) {
            sortedMintedIds.upc20[i] = 20 * 1000000000 + (i + 1);
        }
        // Populate UPC 21 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc21[i] = 21 * 1000000000 + (i + 1);
        }
        // Populate UPC 23 minted tokenIds (8 items)
        for (uint256 i = 0; i < 8; i++) {
            sortedMintedIds.upc23[i] = 23 * 1000000000 + (i + 1);
        }
        // Populate UPC 25 minted tokenIds (12 items)
        for (uint256 i = 0; i < 12; i++) {
            sortedMintedIds.upc25[i] = 25 * 1000000000 + (i + 1);
        }
        // Populate UPC 26 minted tokenIds (7 items)
        for (uint256 i = 0; i < 7; i++) {
            sortedMintedIds.upc26[i] = 26 * 1000000000 + (i + 1);
        }
        // Populate UPC 28 minted tokenIds (9 items)
        for (uint256 i = 0; i < 9; i++) {
            sortedMintedIds.upc28[i] = 28 * 1000000000 + (i + 1);
        }
        // Populate UPC 29 minted tokenIds (3 items)
        for (uint256 i = 0; i < 3; i++) {
            sortedMintedIds.upc29[i] = 29 * 1000000000 + (i + 1);
        }
        // Populate UPC 31 minted tokenIds (13 items)
        for (uint256 i = 0; i < 13; i++) {
            sortedMintedIds.upc31[i] = 31 * 1000000000 + (i + 1);
        }
        // Populate UPC 32 minted tokenIds (5 items)
        for (uint256 i = 0; i < 5; i++) {
            sortedMintedIds.upc32[i] = 32 * 1000000000 + (i + 1);
        }
        // Populate UPC 33 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc33[i] = 33 * 1000000000 + (i + 1);
        }
        // Populate UPC 35 minted tokenIds (9 items)
        for (uint256 i = 0; i < 9; i++) {
            sortedMintedIds.upc35[i] = 35 * 1000000000 + (i + 1);
        }
        // Populate UPC 37 minted tokenIds (4 items)
        for (uint256 i = 0; i < 4; i++) {
            sortedMintedIds.upc37[i] = 37 * 1000000000 + (i + 1);
        }
        // Populate UPC 38 minted tokenIds (3 items)
        for (uint256 i = 0; i < 3; i++) {
            sortedMintedIds.upc38[i] = 38 * 1000000000 + (i + 1);
        }
        // Populate UPC 39 minted tokenIds (4 items)
        for (uint256 i = 0; i < 4; i++) {
            sortedMintedIds.upc39[i] = 39 * 1000000000 + (i + 1);
        }
        // Populate UPC 40 minted tokenIds (3 items)
        for (uint256 i = 0; i < 3; i++) {
            sortedMintedIds.upc40[i] = 40 * 1000000000 + (i + 1);
        }
        // Populate UPC 41 minted tokenIds (5 items)
        for (uint256 i = 0; i < 5; i++) {
            sortedMintedIds.upc41[i] = 41 * 1000000000 + (i + 1);
        }
        // Populate UPC 42 minted tokenIds (19 items)
        for (uint256 i = 0; i < 19; i++) {
            sortedMintedIds.upc42[i] = 42 * 1000000000 + (i + 1);
        }
        // Populate UPC 43 minted tokenIds (18 items)
        for (uint256 i = 0; i < 18; i++) {
            sortedMintedIds.upc43[i] = 43 * 1000000000 + (i + 1);
        }
        // Populate UPC 44 minted tokenIds (34 items)
        for (uint256 i = 0; i < 34; i++) {
            sortedMintedIds.upc44[i] = 44 * 1000000000 + (i + 1);
        }
        // Populate UPC 46 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc46[i] = 46 * 1000000000 + (i + 1);
        }
        // Populate UPC 47 minted tokenIds (14 items)
        for (uint256 i = 0; i < 14; i++) {
            sortedMintedIds.upc47[i] = 47 * 1000000000 + (i + 1);
        }
        // Populate UPC 48 minted tokenIds (6 items)
        for (uint256 i = 0; i < 6; i++) {
            sortedMintedIds.upc48[i] = 48 * 1000000000 + (i + 1);
        }
        // Populate UPC 49 minted tokenIds (145 items)
        for (uint256 i = 0; i < 145; i++) {
            sortedMintedIds.upc49[i] = 49 * 1000000000 + (i + 1);
        }
        // Step 1.5: Approve resolver to transfer all tokens owned by this contract
        // The resolver needs approval to transfer outfits and backgrounds to itself during decoration
        IERC721(address(hook)).setApprovalForAll(address(resolver), true);
        
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
        // Generate token IDs in the same order as items appear (matching mint order)
        // Token ID format: UPC * 1000000000 + unitNumber
        uint256[] memory generatedTokenIds = new uint256[](transferOwners.length);
        
        generatedTokenIds[0] = 1000000001; // UPC 1, unit 1 (V4: 1000000001)
        generatedTokenIds[1] = 2000000001; // UPC 2, unit 1 (V4: 2000000001)
        generatedTokenIds[2] = 2000000002; // UPC 2, unit 2 (V4: 2000000002)
        generatedTokenIds[3] = 2000000003; // UPC 2, unit 3 (V4: 2000000003)
        generatedTokenIds[4] = 2000000004; // UPC 2, unit 4 (V4: 2000000004)
        generatedTokenIds[5] = 2000000005; // UPC 2, unit 5 (V4: 2000000005)
        generatedTokenIds[6] = 2000000006; // UPC 2, unit 6 (V4: 2000000006)
        generatedTokenIds[7] = 3000000001; // UPC 3, unit 1 (V4: 3000000001)
        generatedTokenIds[8] = 3000000002; // UPC 3, unit 2 (V4: 3000000002)
        generatedTokenIds[9] = 3000000003; // UPC 3, unit 3 (V4: 3000000003)
        generatedTokenIds[10] = 3000000004; // UPC 3, unit 4 (V4: 3000000004)
        generatedTokenIds[11] = 3000000005; // UPC 3, unit 5 (V4: 3000000005)
        generatedTokenIds[12] = 3000000006; // UPC 3, unit 6 (V4: 3000000006)
        generatedTokenIds[13] = 3000000007; // UPC 3, unit 7 (V4: 3000000007)
        generatedTokenIds[14] = 3000000008; // UPC 3, unit 8 (V4: 3000000008)
        generatedTokenIds[15] = 3000000009; // UPC 3, unit 9 (V4: 3000000009)
        generatedTokenIds[16] = 3000000010; // UPC 3, unit 10 (V4: 3000000010)
        generatedTokenIds[17] = 3000000011; // UPC 3, unit 11 (V4: 3000000011)
        generatedTokenIds[18] = 3000000012; // UPC 3, unit 12 (V4: 3000000012)
        generatedTokenIds[19] = 3000000013; // UPC 3, unit 13 (V4: 3000000013)
        generatedTokenIds[20] = 3000000014; // UPC 3, unit 14 (V4: 3000000014)
        generatedTokenIds[21] = 3000000015; // UPC 3, unit 15 (V4: 3000000015)
        generatedTokenIds[22] = 3000000016; // UPC 3, unit 16 (V4: 3000000016)
        generatedTokenIds[23] = 3000000017; // UPC 3, unit 17 (V4: 3000000017)
        generatedTokenIds[24] = 3000000018; // UPC 3, unit 18 (V4: 3000000018)
        generatedTokenIds[25] = 3000000019; // UPC 3, unit 19 (V4: 3000000019)
        generatedTokenIds[26] = 3000000020; // UPC 3, unit 20 (V4: 3000000020)
        generatedTokenIds[27] = 3000000021; // UPC 3, unit 21 (V4: 3000000021)
        generatedTokenIds[28] = 3000000022; // UPC 3, unit 22 (V4: 3000000022)
        generatedTokenIds[29] = 3000000023; // UPC 3, unit 23 (V4: 3000000023)
        generatedTokenIds[30] = 3000000024; // UPC 3, unit 24 (V4: 3000000024)
        generatedTokenIds[31] = 3000000025; // UPC 3, unit 25 (V4: 3000000025)
        generatedTokenIds[32] = 3000000026; // UPC 3, unit 26 (V4: 3000000026)
        generatedTokenIds[33] = 4000000001; // UPC 4, unit 1 (V4: 4000000001)
        generatedTokenIds[34] = 4000000002; // UPC 4, unit 2 (V4: 4000000002)
        generatedTokenIds[35] = 4000000003; // UPC 4, unit 3 (V4: 4000000003)
        generatedTokenIds[36] = 4000000004; // UPC 4, unit 4 (V4: 4000000004)
        generatedTokenIds[37] = 4000000005; // UPC 4, unit 5 (V4: 4000000005)
        generatedTokenIds[38] = 4000000006; // UPC 4, unit 6 (V4: 4000000006)
        generatedTokenIds[39] = 4000000007; // UPC 4, unit 7 (V4: 4000000007)
        generatedTokenIds[40] = 4000000008; // UPC 4, unit 8 (V4: 4000000008)
        generatedTokenIds[41] = 4000000009; // UPC 4, unit 9 (V4: 4000000009)
        generatedTokenIds[42] = 4000000010; // UPC 4, unit 10 (V4: 4000000010)
        generatedTokenIds[43] = 4000000011; // UPC 4, unit 11 (V4: 4000000011)
        generatedTokenIds[44] = 4000000012; // UPC 4, unit 12 (V4: 4000000012)
        generatedTokenIds[45] = 4000000013; // UPC 4, unit 13 (V4: 4000000013)
        generatedTokenIds[46] = 4000000014; // UPC 4, unit 14 (V4: 4000000014)
        generatedTokenIds[47] = 4000000015; // UPC 4, unit 15 (V4: 4000000015)
        generatedTokenIds[48] = 4000000016; // UPC 4, unit 16 (V4: 4000000016)
        generatedTokenIds[49] = 4000000017; // UPC 4, unit 17 (V4: 4000000017)
        generatedTokenIds[50] = 4000000018; // UPC 4, unit 18 (V4: 4000000018)
        generatedTokenIds[51] = 4000000019; // UPC 4, unit 19 (V4: 4000000019)
        generatedTokenIds[52] = 4000000020; // UPC 4, unit 20 (V4: 4000000020)
        generatedTokenIds[53] = 4000000021; // UPC 4, unit 21 (V4: 4000000021)
        generatedTokenIds[54] = 4000000022; // UPC 4, unit 22 (V4: 4000000022)
        generatedTokenIds[55] = 4000000023; // UPC 4, unit 23 (V4: 4000000023)
        generatedTokenIds[56] = 4000000024; // UPC 4, unit 24 (V4: 4000000024)
        generatedTokenIds[57] = 4000000025; // UPC 4, unit 25 (V4: 4000000025)
        generatedTokenIds[58] = 4000000026; // UPC 4, unit 26 (V4: 4000000026)
        generatedTokenIds[59] = 4000000027; // UPC 4, unit 27 (V4: 4000000027)
        generatedTokenIds[60] = 4000000028; // UPC 4, unit 28 (V4: 4000000028)
        generatedTokenIds[61] = 4000000029; // UPC 4, unit 29 (V4: 4000000029)
        generatedTokenIds[62] = 4000000030; // UPC 4, unit 30 (V4: 4000000030)
        generatedTokenIds[63] = 4000000031; // UPC 4, unit 31 (V4: 4000000031)
        generatedTokenIds[64] = 4000000032; // UPC 4, unit 32 (V4: 4000000032)
        generatedTokenIds[65] = 4000000033; // UPC 4, unit 33 (V4: 4000000033)
        generatedTokenIds[66] = 4000000034; // UPC 4, unit 34 (V4: 4000000034)
        generatedTokenIds[67] = 4000000035; // UPC 4, unit 35 (V4: 4000000035)
        generatedTokenIds[68] = 4000000036; // UPC 4, unit 36 (V4: 4000000036)
        generatedTokenIds[69] = 4000000037; // UPC 4, unit 37 (V4: 4000000037)
        generatedTokenIds[70] = 4000000038; // UPC 4, unit 38 (V4: 4000000038)
        generatedTokenIds[71] = 4000000039; // UPC 4, unit 39 (V4: 4000000039)
        generatedTokenIds[72] = 4000000040; // UPC 4, unit 40 (V4: 4000000040)
        generatedTokenIds[73] = 4000000041; // UPC 4, unit 41 (V4: 4000000041)
        generatedTokenIds[74] = 4000000042; // UPC 4, unit 42 (V4: 4000000042)
        generatedTokenIds[75] = 4000000043; // UPC 4, unit 43 (V4: 4000000043)
        generatedTokenIds[76] = 4000000044; // UPC 4, unit 44 (V4: 4000000044)
        generatedTokenIds[77] = 4000000045; // UPC 4, unit 45 (V4: 4000000045)
        generatedTokenIds[78] = 4000000046; // UPC 4, unit 46 (V4: 4000000046)
        generatedTokenIds[79] = 4000000047; // UPC 4, unit 47 (V4: 4000000047)
        generatedTokenIds[80] = 4000000048; // UPC 4, unit 48 (V4: 4000000048)
        generatedTokenIds[81] = 4000000049; // UPC 4, unit 49 (V4: 4000000049)
        generatedTokenIds[82] = 4000000050; // UPC 4, unit 50 (V4: 4000000050)
        generatedTokenIds[83] = 4000000051; // UPC 4, unit 51 (V4: 4000000051)
        generatedTokenIds[84] = 4000000052; // UPC 4, unit 52 (V4: 4000000052)
        generatedTokenIds[85] = 4000000053; // UPC 4, unit 53 (V4: 4000000053)
        generatedTokenIds[86] = 4000000054; // UPC 4, unit 54 (V4: 4000000054)
        generatedTokenIds[87] = 4000000055; // UPC 4, unit 55 (V4: 4000000055)
        generatedTokenIds[88] = 4000000056; // UPC 4, unit 56 (V4: 4000000056)
        generatedTokenIds[89] = 4000000057; // UPC 4, unit 57 (V4: 4000000057)
        generatedTokenIds[90] = 4000000058; // UPC 4, unit 58 (V4: 4000000058)
        generatedTokenIds[91] = 4000000059; // UPC 4, unit 59 (V4: 4000000059)
        generatedTokenIds[92] = 4000000060; // UPC 4, unit 60 (V4: 4000000060)
        generatedTokenIds[93] = 4000000061; // UPC 4, unit 61 (V4: 4000000061)
        generatedTokenIds[94] = 4000000062; // UPC 4, unit 62 (V4: 4000000062)
        generatedTokenIds[95] = 4000000063; // UPC 4, unit 63 (V4: 4000000063)
        generatedTokenIds[96] = 4000000064; // UPC 4, unit 64 (V4: 4000000064)
        generatedTokenIds[97] = 4000000065; // UPC 4, unit 65 (V4: 4000000065)
        generatedTokenIds[98] = 4000000066; // UPC 4, unit 66 (V4: 4000000066)
        generatedTokenIds[99] = 4000000067; // UPC 4, unit 67 (V4: 4000000067)
        generatedTokenIds[100] = 4000000068; // UPC 4, unit 68 (V4: 4000000068)
        generatedTokenIds[101] = 4000000069; // UPC 4, unit 69 (V4: 4000000069)
        generatedTokenIds[102] = 4000000070; // UPC 4, unit 70 (V4: 4000000070)
        generatedTokenIds[103] = 4000000071; // UPC 4, unit 71 (V4: 4000000071)
        generatedTokenIds[104] = 4000000072; // UPC 4, unit 72 (V4: 4000000072)
        generatedTokenIds[105] = 4000000073; // UPC 4, unit 73 (V4: 4000000073)
        generatedTokenIds[106] = 4000000074; // UPC 4, unit 74 (V4: 4000000074)
        generatedTokenIds[107] = 4000000075; // UPC 4, unit 75 (V4: 4000000075)
        generatedTokenIds[108] = 4000000076; // UPC 4, unit 76 (V4: 4000000076)
        generatedTokenIds[109] = 4000000077; // UPC 4, unit 77 (V4: 4000000077)
        generatedTokenIds[110] = 4000000078; // UPC 4, unit 78 (V4: 4000000078)
        generatedTokenIds[111] = 4000000079; // UPC 4, unit 79 (V4: 4000000079)
        generatedTokenIds[112] = 4000000080; // UPC 4, unit 80 (V4: 4000000080)
        generatedTokenIds[113] = 4000000081; // UPC 4, unit 81 (V4: 4000000081)
        generatedTokenIds[114] = 4000000082; // UPC 4, unit 82 (V4: 4000000082)
        generatedTokenIds[115] = 4000000083; // UPC 4, unit 83 (V4: 4000000083)
        generatedTokenIds[116] = 4000000084; // UPC 4, unit 84 (V4: 4000000084)
        generatedTokenIds[117] = 4000000085; // UPC 4, unit 85 (V4: 4000000085)
        generatedTokenIds[118] = 10000000003; // UPC 10, unit 3 (V4: 10000000003)
        generatedTokenIds[119] = 10000000004; // UPC 10, unit 4 (V4: 10000000004)
        generatedTokenIds[120] = 10000000008; // UPC 10, unit 8 (V4: 10000000008)
        generatedTokenIds[121] = 10000000009; // UPC 10, unit 9 (V4: 10000000009)
        generatedTokenIds[122] = 10000000010; // UPC 10, unit 10 (V4: 10000000010)
        generatedTokenIds[123] = 10000000011; // UPC 10, unit 11 (V4: 10000000011)
        generatedTokenIds[124] = 10000000013; // UPC 10, unit 13 (V4: 10000000013)
        generatedTokenIds[125] = 10000000014; // UPC 10, unit 14 (V4: 10000000014)
        generatedTokenIds[126] = 11000000001; // UPC 11, unit 1 (V4: 11000000001)
        generatedTokenIds[127] = 13000000002; // UPC 13, unit 2 (V4: 13000000002)
        generatedTokenIds[128] = 13000000004; // UPC 13, unit 4 (V4: 13000000004)
        generatedTokenIds[129] = 14000000002; // UPC 14, unit 2 (V4: 14000000002)
        generatedTokenIds[130] = 14000000004; // UPC 14, unit 4 (V4: 14000000004)
        generatedTokenIds[131] = 14000000006; // UPC 14, unit 6 (V4: 14000000006)
        generatedTokenIds[132] = 17000000003; // UPC 17, unit 3 (V4: 17000000003)
        generatedTokenIds[133] = 17000000004; // UPC 17, unit 4 (V4: 17000000004)
        generatedTokenIds[134] = 17000000005; // UPC 17, unit 5 (V4: 17000000005)
        generatedTokenIds[135] = 19000000001; // UPC 19, unit 1 (V4: 19000000001)
        generatedTokenIds[136] = 19000000003; // UPC 19, unit 3 (V4: 19000000003)
        generatedTokenIds[137] = 19000000006; // UPC 19, unit 6 (V4: 19000000006)
        generatedTokenIds[138] = 19000000007; // UPC 19, unit 7 (V4: 19000000007)
        generatedTokenIds[139] = 19000000010; // UPC 19, unit 10 (V4: 19000000010)
        generatedTokenIds[140] = 19000000014; // UPC 19, unit 14 (V4: 19000000014)
        generatedTokenIds[141] = 19000000022; // UPC 19, unit 22 (V4: 19000000022)
        generatedTokenIds[142] = 20000000002; // UPC 20, unit 2 (V4: 20000000002)
        generatedTokenIds[143] = 20000000003; // UPC 20, unit 3 (V4: 20000000003)
        generatedTokenIds[144] = 20000000004; // UPC 20, unit 4 (V4: 20000000004)
        generatedTokenIds[145] = 20000000005; // UPC 20, unit 5 (V4: 20000000005)
        generatedTokenIds[146] = 20000000006; // UPC 20, unit 6 (V4: 20000000006)
        generatedTokenIds[147] = 20000000007; // UPC 20, unit 7 (V4: 20000000007)
        generatedTokenIds[148] = 21000000002; // UPC 21, unit 2 (V4: 21000000002)
        generatedTokenIds[149] = 23000000006; // UPC 23, unit 6 (V4: 23000000006)
        generatedTokenIds[150] = 23000000008; // UPC 23, unit 8 (V4: 23000000008)
        generatedTokenIds[151] = 25000000001; // UPC 25, unit 1 (V4: 25000000001)
        generatedTokenIds[152] = 25000000004; // UPC 25, unit 4 (V4: 25000000004)
        generatedTokenIds[153] = 25000000012; // UPC 25, unit 12 (V4: 25000000012)
        generatedTokenIds[154] = 26000000006; // UPC 26, unit 6 (V4: 26000000006)
        generatedTokenIds[155] = 26000000007; // UPC 26, unit 7 (V4: 26000000007)
        generatedTokenIds[156] = 28000000001; // UPC 28, unit 1 (V4: 28000000001)
        generatedTokenIds[157] = 28000000003; // UPC 28, unit 3 (V4: 28000000003)
        generatedTokenIds[158] = 28000000004; // UPC 28, unit 4 (V4: 28000000004)
        generatedTokenIds[159] = 28000000005; // UPC 28, unit 5 (V4: 28000000005)
        generatedTokenIds[160] = 28000000006; // UPC 28, unit 6 (V4: 28000000006)
        generatedTokenIds[161] = 28000000007; // UPC 28, unit 7 (V4: 28000000007)
        generatedTokenIds[162] = 28000000009; // UPC 28, unit 9 (V4: 28000000009)
        generatedTokenIds[163] = 29000000001; // UPC 29, unit 1 (V4: 29000000001)
        generatedTokenIds[164] = 31000000001; // UPC 31, unit 1 (V4: 31000000001)
        generatedTokenIds[165] = 31000000004; // UPC 31, unit 4 (V4: 31000000004)
        generatedTokenIds[166] = 31000000005; // UPC 31, unit 5 (V4: 31000000005)
        generatedTokenIds[167] = 31000000008; // UPC 31, unit 8 (V4: 31000000008)
        generatedTokenIds[168] = 31000000012; // UPC 31, unit 12 (V4: 31000000012)
        generatedTokenIds[169] = 32000000004; // UPC 32, unit 4 (V4: 32000000004)
        generatedTokenIds[170] = 32000000005; // UPC 32, unit 5 (V4: 32000000005)
        generatedTokenIds[171] = 33000000002; // UPC 33, unit 2 (V4: 33000000002)
        generatedTokenIds[172] = 35000000005; // UPC 35, unit 5 (V4: 35000000005)
        generatedTokenIds[173] = 35000000008; // UPC 35, unit 8 (V4: 35000000008)
        generatedTokenIds[174] = 35000000009; // UPC 35, unit 9 (V4: 35000000009)
        generatedTokenIds[175] = 37000000002; // UPC 37, unit 2 (V4: 37000000002)
        generatedTokenIds[176] = 37000000004; // UPC 37, unit 4 (V4: 37000000004)
        generatedTokenIds[177] = 39000000004; // UPC 39, unit 4 (V4: 39000000004)
        generatedTokenIds[178] = 40000000002; // UPC 40, unit 2 (V4: 40000000002)
        generatedTokenIds[179] = 40000000003; // UPC 40, unit 3 (V4: 40000000003)
        generatedTokenIds[180] = 41000000005; // UPC 41, unit 5 (V4: 41000000005)
        generatedTokenIds[181] = 42000000001; // UPC 42, unit 1 (V4: 42000000001)
        generatedTokenIds[182] = 42000000003; // UPC 42, unit 3 (V4: 42000000003)
        generatedTokenIds[183] = 42000000005; // UPC 42, unit 5 (V4: 42000000005)
        generatedTokenIds[184] = 42000000006; // UPC 42, unit 6 (V4: 42000000006)
        generatedTokenIds[185] = 42000000008; // UPC 42, unit 8 (V4: 42000000008)
        generatedTokenIds[186] = 42000000009; // UPC 42, unit 9 (V4: 42000000009)
        generatedTokenIds[187] = 42000000010; // UPC 42, unit 10 (V4: 42000000010)
        generatedTokenIds[188] = 42000000011; // UPC 42, unit 11 (V4: 42000000011)
        generatedTokenIds[189] = 42000000012; // UPC 42, unit 12 (V4: 42000000012)
        generatedTokenIds[190] = 42000000013; // UPC 42, unit 13 (V4: 42000000013)
        generatedTokenIds[191] = 42000000014; // UPC 42, unit 14 (V4: 42000000014)
        generatedTokenIds[192] = 42000000015; // UPC 42, unit 15 (V4: 42000000015)
        generatedTokenIds[193] = 42000000016; // UPC 42, unit 16 (V4: 42000000016)
        generatedTokenIds[194] = 42000000017; // UPC 42, unit 17 (V4: 42000000017)
        generatedTokenIds[195] = 42000000018; // UPC 42, unit 18 (V4: 42000000018)
        generatedTokenIds[196] = 42000000019; // UPC 42, unit 19 (V4: 42000000019)
        generatedTokenIds[197] = 43000000001; // UPC 43, unit 1 (V4: 43000000001)
        generatedTokenIds[198] = 43000000002; // UPC 43, unit 2 (V4: 43000000002)
        generatedTokenIds[199] = 43000000004; // UPC 43, unit 4 (V4: 43000000004)
        generatedTokenIds[200] = 43000000009; // UPC 43, unit 9 (V4: 43000000009)
        generatedTokenIds[201] = 43000000010; // UPC 43, unit 10 (V4: 43000000010)
        generatedTokenIds[202] = 43000000011; // UPC 43, unit 11 (V4: 43000000011)
        generatedTokenIds[203] = 43000000012; // UPC 43, unit 12 (V4: 43000000012)
        generatedTokenIds[204] = 43000000013; // UPC 43, unit 13 (V4: 43000000013)
        generatedTokenIds[205] = 43000000014; // UPC 43, unit 14 (V4: 43000000014)
        generatedTokenIds[206] = 43000000015; // UPC 43, unit 15 (V4: 43000000015)
        generatedTokenIds[207] = 43000000016; // UPC 43, unit 16 (V4: 43000000016)
        generatedTokenIds[208] = 44000000002; // UPC 44, unit 2 (V4: 44000000002)
        generatedTokenIds[209] = 44000000005; // UPC 44, unit 5 (V4: 44000000005)
        generatedTokenIds[210] = 44000000006; // UPC 44, unit 6 (V4: 44000000006)
        generatedTokenIds[211] = 44000000007; // UPC 44, unit 7 (V4: 44000000007)
        generatedTokenIds[212] = 44000000010; // UPC 44, unit 10 (V4: 44000000010)
        generatedTokenIds[213] = 44000000011; // UPC 44, unit 11 (V4: 44000000011)
        generatedTokenIds[214] = 44000000012; // UPC 44, unit 12 (V4: 44000000012)
        generatedTokenIds[215] = 44000000013; // UPC 44, unit 13 (V4: 44000000013)
        generatedTokenIds[216] = 44000000014; // UPC 44, unit 14 (V4: 44000000014)
        generatedTokenIds[217] = 44000000015; // UPC 44, unit 15 (V4: 44000000015)
        generatedTokenIds[218] = 44000000016; // UPC 44, unit 16 (V4: 44000000016)
        generatedTokenIds[219] = 44000000017; // UPC 44, unit 17 (V4: 44000000017)
        generatedTokenIds[220] = 44000000018; // UPC 44, unit 18 (V4: 44000000018)
        generatedTokenIds[221] = 44000000019; // UPC 44, unit 19 (V4: 44000000019)
        generatedTokenIds[222] = 44000000020; // UPC 44, unit 20 (V4: 44000000020)
        generatedTokenIds[223] = 44000000021; // UPC 44, unit 21 (V4: 44000000021)
        generatedTokenIds[224] = 44000000022; // UPC 44, unit 22 (V4: 44000000022)
        generatedTokenIds[225] = 44000000023; // UPC 44, unit 23 (V4: 44000000023)
        generatedTokenIds[226] = 44000000024; // UPC 44, unit 24 (V4: 44000000024)
        generatedTokenIds[227] = 44000000025; // UPC 44, unit 25 (V4: 44000000025)
        generatedTokenIds[228] = 44000000026; // UPC 44, unit 26 (V4: 44000000026)
        generatedTokenIds[229] = 44000000027; // UPC 44, unit 27 (V4: 44000000027)
        generatedTokenIds[230] = 44000000028; // UPC 44, unit 28 (V4: 44000000028)
        generatedTokenIds[231] = 44000000029; // UPC 44, unit 29 (V4: 44000000029)
        generatedTokenIds[232] = 44000000030; // UPC 44, unit 30 (V4: 44000000030)
        generatedTokenIds[233] = 44000000031; // UPC 44, unit 31 (V4: 44000000031)
        generatedTokenIds[234] = 44000000032; // UPC 44, unit 32 (V4: 44000000032)
        generatedTokenIds[235] = 44000000033; // UPC 44, unit 33 (V4: 44000000033)
        generatedTokenIds[236] = 44000000034; // UPC 44, unit 34 (V4: 44000000034)
        generatedTokenIds[237] = 47000000001; // UPC 47, unit 1 (V4: 47000000001)
        generatedTokenIds[238] = 47000000002; // UPC 47, unit 2 (V4: 47000000002)
        generatedTokenIds[239] = 47000000004; // UPC 47, unit 4 (V4: 47000000004)
        generatedTokenIds[240] = 47000000006; // UPC 47, unit 6 (V4: 47000000006)
        generatedTokenIds[241] = 47000000007; // UPC 47, unit 7 (V4: 47000000007)
        generatedTokenIds[242] = 47000000008; // UPC 47, unit 8 (V4: 47000000008)
        generatedTokenIds[243] = 47000000009; // UPC 47, unit 9 (V4: 47000000009)
        generatedTokenIds[244] = 47000000010; // UPC 47, unit 10 (V4: 47000000010)
        generatedTokenIds[245] = 47000000011; // UPC 47, unit 11 (V4: 47000000011)
        generatedTokenIds[246] = 47000000012; // UPC 47, unit 12 (V4: 47000000012)
        generatedTokenIds[247] = 47000000013; // UPC 47, unit 13 (V4: 47000000013)
        generatedTokenIds[248] = 47000000014; // UPC 47, unit 14 (V4: 47000000014)
        generatedTokenIds[249] = 48000000004; // UPC 48, unit 4 (V4: 48000000004)
        generatedTokenIds[250] = 49000000003; // UPC 49, unit 3 (V4: 49000000003)
        generatedTokenIds[251] = 49000000005; // UPC 49, unit 5 (V4: 49000000005)
        generatedTokenIds[252] = 49000000006; // UPC 49, unit 6 (V4: 49000000006)
        generatedTokenIds[253] = 49000000007; // UPC 49, unit 7 (V4: 49000000007)
        generatedTokenIds[254] = 49000000008; // UPC 49, unit 8 (V4: 49000000008)
        generatedTokenIds[255] = 49000000009; // UPC 49, unit 9 (V4: 49000000009)
        generatedTokenIds[256] = 49000000010; // UPC 49, unit 10 (V4: 49000000010)
        generatedTokenIds[257] = 49000000011; // UPC 49, unit 11 (V4: 49000000011)
        generatedTokenIds[258] = 49000000012; // UPC 49, unit 12 (V4: 49000000012)
        generatedTokenIds[259] = 49000000013; // UPC 49, unit 13 (V4: 49000000013)
        generatedTokenIds[260] = 49000000014; // UPC 49, unit 14 (V4: 49000000014)
        generatedTokenIds[261] = 49000000015; // UPC 49, unit 15 (V4: 49000000015)
        generatedTokenIds[262] = 49000000016; // UPC 49, unit 16 (V4: 49000000016)
        generatedTokenIds[263] = 49000000017; // UPC 49, unit 17 (V4: 49000000017)
        generatedTokenIds[264] = 49000000018; // UPC 49, unit 18 (V4: 49000000018)
        generatedTokenIds[265] = 49000000019; // UPC 49, unit 19 (V4: 49000000019)
        generatedTokenIds[266] = 49000000020; // UPC 49, unit 20 (V4: 49000000020)
        generatedTokenIds[267] = 49000000021; // UPC 49, unit 21 (V4: 49000000021)
        generatedTokenIds[268] = 49000000022; // UPC 49, unit 22 (V4: 49000000022)
        generatedTokenIds[269] = 49000000023; // UPC 49, unit 23 (V4: 49000000023)
        generatedTokenIds[270] = 49000000024; // UPC 49, unit 24 (V4: 49000000024)
        generatedTokenIds[271] = 49000000025; // UPC 49, unit 25 (V4: 49000000025)
        generatedTokenIds[272] = 49000000026; // UPC 49, unit 26 (V4: 49000000026)
        generatedTokenIds[273] = 49000000027; // UPC 49, unit 27 (V4: 49000000027)
        generatedTokenIds[274] = 49000000028; // UPC 49, unit 28 (V4: 49000000028)
        generatedTokenIds[275] = 49000000029; // UPC 49, unit 29 (V4: 49000000029)
        generatedTokenIds[276] = 49000000030; // UPC 49, unit 30 (V4: 49000000030)
        generatedTokenIds[277] = 49000000031; // UPC 49, unit 31 (V4: 49000000031)
        generatedTokenIds[278] = 49000000032; // UPC 49, unit 32 (V4: 49000000032)
        generatedTokenIds[279] = 49000000033; // UPC 49, unit 33 (V4: 49000000033)
        generatedTokenIds[280] = 49000000034; // UPC 49, unit 34 (V4: 49000000034)
        generatedTokenIds[281] = 49000000035; // UPC 49, unit 35 (V4: 49000000035)
        generatedTokenIds[282] = 49000000036; // UPC 49, unit 36 (V4: 49000000036)
        generatedTokenIds[283] = 49000000037; // UPC 49, unit 37 (V4: 49000000037)
        generatedTokenIds[284] = 49000000038; // UPC 49, unit 38 (V4: 49000000038)
        generatedTokenIds[285] = 49000000039; // UPC 49, unit 39 (V4: 49000000039)
        generatedTokenIds[286] = 49000000040; // UPC 49, unit 40 (V4: 49000000040)
        generatedTokenIds[287] = 49000000041; // UPC 49, unit 41 (V4: 49000000041)
        generatedTokenIds[288] = 49000000042; // UPC 49, unit 42 (V4: 49000000042)
        generatedTokenIds[289] = 49000000043; // UPC 49, unit 43 (V4: 49000000043)
        generatedTokenIds[290] = 49000000044; // UPC 49, unit 44 (V4: 49000000044)
        generatedTokenIds[291] = 49000000045; // UPC 49, unit 45 (V4: 49000000045)
        generatedTokenIds[292] = 49000000046; // UPC 49, unit 46 (V4: 49000000046)
        generatedTokenIds[293] = 49000000047; // UPC 49, unit 47 (V4: 49000000047)
        generatedTokenIds[294] = 49000000048; // UPC 49, unit 48 (V4: 49000000048)
        generatedTokenIds[295] = 49000000049; // UPC 49, unit 49 (V4: 49000000049)
        generatedTokenIds[296] = 49000000050; // UPC 49, unit 50 (V4: 49000000050)
        generatedTokenIds[297] = 49000000051; // UPC 49, unit 51 (V4: 49000000051)
        generatedTokenIds[298] = 49000000052; // UPC 49, unit 52 (V4: 49000000052)
        generatedTokenIds[299] = 49000000053; // UPC 49, unit 53 (V4: 49000000053)
        generatedTokenIds[300] = 49000000054; // UPC 49, unit 54 (V4: 49000000054)
        generatedTokenIds[301] = 49000000055; // UPC 49, unit 55 (V4: 49000000055)
        generatedTokenIds[302] = 49000000056; // UPC 49, unit 56 (V4: 49000000056)
        generatedTokenIds[303] = 49000000057; // UPC 49, unit 57 (V4: 49000000057)
        generatedTokenIds[304] = 49000000058; // UPC 49, unit 58 (V4: 49000000058)
        generatedTokenIds[305] = 49000000059; // UPC 49, unit 59 (V4: 49000000059)
        generatedTokenIds[306] = 49000000060; // UPC 49, unit 60 (V4: 49000000060)
        generatedTokenIds[307] = 49000000061; // UPC 49, unit 61 (V4: 49000000061)
        generatedTokenIds[308] = 49000000062; // UPC 49, unit 62 (V4: 49000000062)
        generatedTokenIds[309] = 49000000063; // UPC 49, unit 63 (V4: 49000000063)
        generatedTokenIds[310] = 49000000064; // UPC 49, unit 64 (V4: 49000000064)
        generatedTokenIds[311] = 49000000065; // UPC 49, unit 65 (V4: 49000000065)
        generatedTokenIds[312] = 49000000066; // UPC 49, unit 66 (V4: 49000000066)
        generatedTokenIds[313] = 49000000067; // UPC 49, unit 67 (V4: 49000000067)
        generatedTokenIds[314] = 49000000068; // UPC 49, unit 68 (V4: 49000000068)
        generatedTokenIds[315] = 49000000069; // UPC 49, unit 69 (V4: 49000000069)
        generatedTokenIds[316] = 49000000070; // UPC 49, unit 70 (V4: 49000000070)
        generatedTokenIds[317] = 49000000071; // UPC 49, unit 71 (V4: 49000000071)
        generatedTokenIds[318] = 49000000072; // UPC 49, unit 72 (V4: 49000000072)
        generatedTokenIds[319] = 49000000073; // UPC 49, unit 73 (V4: 49000000073)
        generatedTokenIds[320] = 49000000074; // UPC 49, unit 74 (V4: 49000000074)
        generatedTokenIds[321] = 49000000075; // UPC 49, unit 75 (V4: 49000000075)
        generatedTokenIds[322] = 49000000076; // UPC 49, unit 76 (V4: 49000000076)
        generatedTokenIds[323] = 49000000077; // UPC 49, unit 77 (V4: 49000000077)
        generatedTokenIds[324] = 49000000078; // UPC 49, unit 78 (V4: 49000000078)
        generatedTokenIds[325] = 49000000079; // UPC 49, unit 79 (V4: 49000000079)
        generatedTokenIds[326] = 49000000080; // UPC 49, unit 80 (V4: 49000000080)
        generatedTokenIds[327] = 49000000081; // UPC 49, unit 81 (V4: 49000000081)
        generatedTokenIds[328] = 49000000082; // UPC 49, unit 82 (V4: 49000000082)
        generatedTokenIds[329] = 49000000083; // UPC 49, unit 83 (V4: 49000000083)
        generatedTokenIds[330] = 49000000084; // UPC 49, unit 84 (V4: 49000000084)
        generatedTokenIds[331] = 49000000085; // UPC 49, unit 85 (V4: 49000000085)
        generatedTokenIds[332] = 49000000086; // UPC 49, unit 86 (V4: 49000000086)
        generatedTokenIds[333] = 49000000087; // UPC 49, unit 87 (V4: 49000000087)
        generatedTokenIds[334] = 49000000088; // UPC 49, unit 88 (V4: 49000000088)
        generatedTokenIds[335] = 49000000089; // UPC 49, unit 89 (V4: 49000000089)
        generatedTokenIds[336] = 49000000090; // UPC 49, unit 90 (V4: 49000000090)
        generatedTokenIds[337] = 49000000091; // UPC 49, unit 91 (V4: 49000000091)
        generatedTokenIds[338] = 49000000092; // UPC 49, unit 92 (V4: 49000000092)
        generatedTokenIds[339] = 49000000093; // UPC 49, unit 93 (V4: 49000000093)
        generatedTokenIds[340] = 49000000094; // UPC 49, unit 94 (V4: 49000000094)
        generatedTokenIds[341] = 49000000095; // UPC 49, unit 95 (V4: 49000000095)
        generatedTokenIds[342] = 49000000096; // UPC 49, unit 96 (V4: 49000000096)
        generatedTokenIds[343] = 49000000097; // UPC 49, unit 97 (V4: 49000000097)
        generatedTokenIds[344] = 49000000098; // UPC 49, unit 98 (V4: 49000000098)
        generatedTokenIds[345] = 49000000099; // UPC 49, unit 99 (V4: 49000000099)
        generatedTokenIds[346] = 49000000100; // UPC 49, unit 100 (V4: 49000000100)
        generatedTokenIds[347] = 49000000101; // UPC 49, unit 101 (V4: 49000000101)
        generatedTokenIds[348] = 49000000102; // UPC 49, unit 102 (V4: 49000000102)
        generatedTokenIds[349] = 49000000103; // UPC 49, unit 103 (V4: 49000000103)
        generatedTokenIds[350] = 49000000104; // UPC 49, unit 104 (V4: 49000000104)
        generatedTokenIds[351] = 49000000105; // UPC 49, unit 105 (V4: 49000000105)
        generatedTokenIds[352] = 49000000106; // UPC 49, unit 106 (V4: 49000000106)
        generatedTokenIds[353] = 49000000107; // UPC 49, unit 107 (V4: 49000000107)
        generatedTokenIds[354] = 49000000108; // UPC 49, unit 108 (V4: 49000000108)
        generatedTokenIds[355] = 49000000109; // UPC 49, unit 109 (V4: 49000000109)
        generatedTokenIds[356] = 49000000110; // UPC 49, unit 110 (V4: 49000000110)
        generatedTokenIds[357] = 49000000111; // UPC 49, unit 111 (V4: 49000000111)
        generatedTokenIds[358] = 49000000112; // UPC 49, unit 112 (V4: 49000000112)
        generatedTokenIds[359] = 49000000113; // UPC 49, unit 113 (V4: 49000000113)
        generatedTokenIds[360] = 49000000114; // UPC 49, unit 114 (V4: 49000000114)
        generatedTokenIds[361] = 49000000115; // UPC 49, unit 115 (V4: 49000000115)
        generatedTokenIds[362] = 49000000116; // UPC 49, unit 116 (V4: 49000000116)
        generatedTokenIds[363] = 49000000117; // UPC 49, unit 117 (V4: 49000000117)
        generatedTokenIds[364] = 49000000118; // UPC 49, unit 118 (V4: 49000000118)
        generatedTokenIds[365] = 49000000119; // UPC 49, unit 119 (V4: 49000000119)
        generatedTokenIds[366] = 49000000120; // UPC 49, unit 120 (V4: 49000000120)
        generatedTokenIds[367] = 49000000121; // UPC 49, unit 121 (V4: 49000000121)
        generatedTokenIds[368] = 49000000122; // UPC 49, unit 122 (V4: 49000000122)
        generatedTokenIds[369] = 49000000123; // UPC 49, unit 123 (V4: 49000000123)
        generatedTokenIds[370] = 49000000124; // UPC 49, unit 124 (V4: 49000000124)
        generatedTokenIds[371] = 49000000125; // UPC 49, unit 125 (V4: 49000000125)
        generatedTokenIds[372] = 49000000126; // UPC 49, unit 126 (V4: 49000000126)
        generatedTokenIds[373] = 49000000127; // UPC 49, unit 127 (V4: 49000000127)
        generatedTokenIds[374] = 49000000128; // UPC 49, unit 128 (V4: 49000000128)
        generatedTokenIds[375] = 49000000129; // UPC 49, unit 129 (V4: 49000000129)
        generatedTokenIds[376] = 49000000130; // UPC 49, unit 130 (V4: 49000000130)
        generatedTokenIds[377] = 49000000131; // UPC 49, unit 131 (V4: 49000000131)
        generatedTokenIds[378] = 49000000132; // UPC 49, unit 132 (V4: 49000000132)
        generatedTokenIds[379] = 49000000133; // UPC 49, unit 133 (V4: 49000000133)
        generatedTokenIds[380] = 49000000134; // UPC 49, unit 134 (V4: 49000000134)
        generatedTokenIds[381] = 49000000135; // UPC 49, unit 135 (V4: 49000000135)
        generatedTokenIds[382] = 49000000136; // UPC 49, unit 136 (V4: 49000000136)
        generatedTokenIds[383] = 49000000137; // UPC 49, unit 137 (V4: 49000000137)
        generatedTokenIds[384] = 49000000138; // UPC 49, unit 138 (V4: 49000000138)
        generatedTokenIds[385] = 49000000139; // UPC 49, unit 139 (V4: 49000000139)
        generatedTokenIds[386] = 49000000140; // UPC 49, unit 140 (V4: 49000000140)
        generatedTokenIds[387] = 49000000141; // UPC 49, unit 141 (V4: 49000000141)
        generatedTokenIds[388] = 49000000142; // UPC 49, unit 142 (V4: 49000000142)
        generatedTokenIds[389] = 49000000143; // UPC 49, unit 143 (V4: 49000000143)
        generatedTokenIds[390] = 49000000144; // UPC 49, unit 144 (V4: 49000000144)
        generatedTokenIds[391] = 49000000145; // UPC 49, unit 145 (V4: 49000000145)
        generatedTokenIds[392] = 5000000003; // UPC 5, unit 3 (V4: 5000000003)
        generatedTokenIds[393] = 5000000007; // UPC 5, unit 7 (V4: 5000000007)
        generatedTokenIds[394] = 6000000005; // UPC 6, unit 5 (V4: 6000000005)
        generatedTokenIds[395] = 6000000006; // UPC 6, unit 6 (V4: 6000000006)
        generatedTokenIds[396] = 6000000007; // UPC 6, unit 7 (V4: 6000000007)
        generatedTokenIds[397] = 6000000008; // UPC 6, unit 8 (V4: 6000000008)
        generatedTokenIds[398] = 6000000009; // UPC 6, unit 9 (V4: 6000000009)
        
        for (uint256 i = 0; i < transferOwners.length; i++) {
            uint256 tokenId = generatedTokenIds[i];
            // Verify V4 ownership before transferring V5
            address v4Owner = v4Hook.ownerOf(tokenId);
            require(v4Owner == transferOwners[i], "V4/V5 ownership mismatch for token");
            
            IERC721(address(hook)).transferFrom(
                address(this), 
                transferOwners[i], 
                tokenId
            );
        }
    }
}