// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";

contract MigrationContractBase {
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
        
        // Base migration - 228 items
        
        // Step 1: Assets are already minted to this contract by the deployer
        
        
        // Assets are already minted to this contract by the deployer
        
        // Create and populate the struct
        // Token IDs are generated as: UPC * 1000000000 + unitNumber (where unitNumber starts at 1)
        MintedIds memory sortedMintedIds;
        
        // Populate UPC 2 minted tokenIds (3 items)
        for (uint256 i = 0; i < 3; i++) {
            sortedMintedIds.upc2[i] = 2 * 1000000000 + (i + 1);
        }
        // Populate UPC 3 minted tokenIds (10 items)
        for (uint256 i = 0; i < 10; i++) {
            sortedMintedIds.upc3[i] = 3 * 1000000000 + (i + 1);
        }
        // Populate UPC 4 minted tokenIds (94 items)
        for (uint256 i = 0; i < 94; i++) {
            sortedMintedIds.upc4[i] = 4 * 1000000000 + (i + 1);
        }
        // Populate UPC 5 minted tokenIds (5 items)
        for (uint256 i = 0; i < 5; i++) {
            sortedMintedIds.upc5[i] = 5 * 1000000000 + (i + 1);
        }
        // Populate UPC 6 minted tokenIds (5 items)
        for (uint256 i = 0; i < 5; i++) {
            sortedMintedIds.upc6[i] = 6 * 1000000000 + (i + 1);
        }
        // Populate UPC 7 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc7[i] = 7 * 1000000000 + (i + 1);
        }
        // Populate UPC 10 minted tokenIds (11 items)
        for (uint256 i = 0; i < 11; i++) {
            sortedMintedIds.upc10[i] = 10 * 1000000000 + (i + 1);
        }
        // Populate UPC 11 minted tokenIds (3 items)
        for (uint256 i = 0; i < 3; i++) {
            sortedMintedIds.upc11[i] = 11 * 1000000000 + (i + 1);
        }
        // Populate UPC 13 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc13[i] = 13 * 1000000000 + (i + 1);
        }
        // Populate UPC 14 minted tokenIds (4 items)
        for (uint256 i = 0; i < 4; i++) {
            sortedMintedIds.upc14[i] = 14 * 1000000000 + (i + 1);
        }
        // Populate UPC 15 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc15[i] = 15 * 1000000000 + (i + 1);
        }
        // Populate UPC 17 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc17[i] = 17 * 1000000000 + (i + 1);
        }
        // Populate UPC 19 minted tokenIds (12 items)
        for (uint256 i = 0; i < 12; i++) {
            sortedMintedIds.upc19[i] = 19 * 1000000000 + (i + 1);
        }
        // Populate UPC 20 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc20[i] = 20 * 1000000000 + (i + 1);
        }
        // Populate UPC 24 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc24[i] = 24 * 1000000000 + (i + 1);
        }
        // Populate UPC 25 minted tokenIds (9 items)
        for (uint256 i = 0; i < 9; i++) {
            sortedMintedIds.upc25[i] = 25 * 1000000000 + (i + 1);
        }
        // Populate UPC 27 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc27[i] = 27 * 1000000000 + (i + 1);
        }
        // Populate UPC 28 minted tokenIds (10 items)
        for (uint256 i = 0; i < 10; i++) {
            sortedMintedIds.upc28[i] = 28 * 1000000000 + (i + 1);
        }
        // Populate UPC 31 minted tokenIds (6 items)
        for (uint256 i = 0; i < 6; i++) {
            sortedMintedIds.upc31[i] = 31 * 1000000000 + (i + 1);
        }
        // Populate UPC 32 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc32[i] = 32 * 1000000000 + (i + 1);
        }
        // Populate UPC 33 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc33[i] = 33 * 1000000000 + (i + 1);
        }
        // Populate UPC 34 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc34[i] = 34 * 1000000000 + (i + 1);
        }
        // Populate UPC 35 minted tokenIds (4 items)
        for (uint256 i = 0; i < 4; i++) {
            sortedMintedIds.upc35[i] = 35 * 1000000000 + (i + 1);
        }
        // Populate UPC 37 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc37[i] = 37 * 1000000000 + (i + 1);
        }
        // Populate UPC 38 minted tokenIds (3 items)
        for (uint256 i = 0; i < 3; i++) {
            sortedMintedIds.upc38[i] = 38 * 1000000000 + (i + 1);
        }
        // Populate UPC 39 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc39[i] = 39 * 1000000000 + (i + 1);
        }
        // Populate UPC 40 minted tokenIds (3 items)
        for (uint256 i = 0; i < 3; i++) {
            sortedMintedIds.upc40[i] = 40 * 1000000000 + (i + 1);
        }
        // Populate UPC 41 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc41[i] = 41 * 1000000000 + (i + 1);
        }
        // Populate UPC 42 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc42[i] = 42 * 1000000000 + (i + 1);
        }
        // Populate UPC 43 minted tokenIds (8 items)
        for (uint256 i = 0; i < 8; i++) {
            sortedMintedIds.upc43[i] = 43 * 1000000000 + (i + 1);
        }
        // Populate UPC 44 minted tokenIds (5 items)
        for (uint256 i = 0; i < 5; i++) {
            sortedMintedIds.upc44[i] = 44 * 1000000000 + (i + 1);
        }
        // Populate UPC 45 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc45[i] = 45 * 1000000000 + (i + 1);
        }
        // Populate UPC 47 minted tokenIds (8 items)
        for (uint256 i = 0; i < 8; i++) {
            sortedMintedIds.upc47[i] = 47 * 1000000000 + (i + 1);
        }
        // Populate UPC 48 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc48[i] = 48 * 1000000000 + (i + 1);
        }
        // Populate UPC 49 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc49[i] = 49 * 1000000000 + (i + 1);
        }
        // Step 1.5: Approve resolver to transfer all tokens owned by this contract
        // The resolver needs approval to transfer outfits and backgrounds to itself during decoration
        IERC721(address(hook)).setApprovalForAll(address(resolver), true);
        
        // Step 2: Process each Banny body and dress them
        
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 2000000001);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 2000000001");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 2000000001");
            
            require(v4OutfitIds[0] == 28000000002, "V4/V5 outfit 0 mismatch for Banny 2000000001");
            require(v4OutfitIds[1] == 37000000001, "V4/V5 outfit 1 mismatch for Banny 2000000001");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 2000000002);
            require(v4BackgroundId == 6000000001, "V4/V5 background mismatch for Banny 2000000002");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 2000000002");
            
            require(v4OutfitIds[0] == 14000000002, "V4/V5 outfit 0 mismatch for Banny 2000000002");
            require(v4OutfitIds[1] == 32000000001, "V4/V5 outfit 1 mismatch for Banny 2000000002");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 2000000003);
            require(v4BackgroundId == 6000000004, "V4/V5 background mismatch for Banny 2000000003");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 2000000003");
            
            require(v4OutfitIds[0] == 25000000008, "V4/V5 outfit 0 mismatch for Banny 2000000003");
            require(v4OutfitIds[1] == 37000000002, "V4/V5 outfit 1 mismatch for Banny 2000000003");
            require(v4OutfitIds[2] == 45000000001, "V4/V5 outfit 2 mismatch for Banny 2000000003");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000001);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 3000000001");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 3000000001");
            
            require(v4OutfitIds[0] == 25000000004, "V4/V5 outfit 0 mismatch for Banny 3000000001");
            require(v4OutfitIds[1] == 47000000003, "V4/V5 outfit 1 mismatch for Banny 3000000001");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000002);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 3000000002");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 3000000002");
            
            require(v4OutfitIds[0] == 31000000002, "V4/V5 outfit 0 mismatch for Banny 3000000002");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000003);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 3000000003");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 3000000003");
            
            require(v4OutfitIds[0] == 10000000005, "V4/V5 outfit 0 mismatch for Banny 3000000003");
            require(v4OutfitIds[1] == 19000000005, "V4/V5 outfit 1 mismatch for Banny 3000000003");
            require(v4OutfitIds[2] == 28000000005, "V4/V5 outfit 2 mismatch for Banny 3000000003");
            require(v4OutfitIds[3] == 47000000005, "V4/V5 outfit 3 mismatch for Banny 3000000003");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000006);
            require(v4BackgroundId == 6000000003, "V4/V5 background mismatch for Banny 3000000006");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 3000000006");
            
            require(v4OutfitIds[0] == 14000000003, "V4/V5 outfit 0 mismatch for Banny 3000000006");
            require(v4OutfitIds[1] == 19000000007, "V4/V5 outfit 1 mismatch for Banny 3000000006");
            require(v4OutfitIds[2] == 28000000001, "V4/V5 outfit 2 mismatch for Banny 3000000006");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000007);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 3000000007");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 3000000007");
            
            require(v4OutfitIds[0] == 19000000009, "V4/V5 outfit 0 mismatch for Banny 3000000007");
            require(v4OutfitIds[1] == 28000000007, "V4/V5 outfit 1 mismatch for Banny 3000000007");
            require(v4OutfitIds[2] == 44000000005, "V4/V5 outfit 2 mismatch for Banny 3000000007");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000008);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 3000000008");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 3000000008");
            
            require(v4OutfitIds[0] == 15000000002, "V4/V5 outfit 0 mismatch for Banny 3000000008");
            require(v4OutfitIds[1] == 40000000001, "V4/V5 outfit 1 mismatch for Banny 3000000008");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000010);
            require(v4BackgroundId == 5000000004, "V4/V5 background mismatch for Banny 3000000010");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 3000000010");
            
            require(v4OutfitIds[0] == 25000000009, "V4/V5 outfit 0 mismatch for Banny 3000000010");
            require(v4OutfitIds[1] == 43000000008, "V4/V5 outfit 1 mismatch for Banny 3000000010");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000001);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000001");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000001");
            
            require(v4OutfitIds[0] == 15000000001, "V4/V5 outfit 0 mismatch for Banny 4000000001");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000003);
            require(v4BackgroundId == 6000000005, "V4/V5 background mismatch for Banny 4000000003");
            require(v4OutfitIds.length == 5, "V4/V5 outfit count mismatch for Banny 4000000003");
            
            require(v4OutfitIds[0] == 11000000001, "V4/V5 outfit 0 mismatch for Banny 4000000003");
            require(v4OutfitIds[1] == 19000000001, "V4/V5 outfit 1 mismatch for Banny 4000000003");
            require(v4OutfitIds[2] == 25000000001, "V4/V5 outfit 2 mismatch for Banny 4000000003");
            require(v4OutfitIds[3] == 33000000001, "V4/V5 outfit 3 mismatch for Banny 4000000003");
            require(v4OutfitIds[4] == 44000000001, "V4/V5 outfit 4 mismatch for Banny 4000000003");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000045);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000045");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 4000000045");
            
            require(v4OutfitIds[0] == 10000000001, "V4/V5 outfit 0 mismatch for Banny 4000000045");
            require(v4OutfitIds[1] == 25000000002, "V4/V5 outfit 1 mismatch for Banny 4000000045");
            require(v4OutfitIds[2] == 43000000002, "V4/V5 outfit 2 mismatch for Banny 4000000045");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000046);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000046");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000046");
            
            require(v4OutfitIds[0] == 47000000001, "V4/V5 outfit 0 mismatch for Banny 4000000046");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000048);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000048");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 4000000048");
            
            require(v4OutfitIds[0] == 10000000003, "V4/V5 outfit 0 mismatch for Banny 4000000048");
            require(v4OutfitIds[1] == 19000000003, "V4/V5 outfit 1 mismatch for Banny 4000000048");
            require(v4OutfitIds[2] == 28000000004, "V4/V5 outfit 2 mismatch for Banny 4000000048");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000049);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000049");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000049");
            
            require(v4OutfitIds[0] == 10000000004, "V4/V5 outfit 0 mismatch for Banny 4000000049");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000050);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000050");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 4000000050");
            
            require(v4OutfitIds[0] == 14000000001, "V4/V5 outfit 0 mismatch for Banny 4000000050");
            require(v4OutfitIds[1] == 31000000001, "V4/V5 outfit 1 mismatch for Banny 4000000050");
            require(v4OutfitIds[2] == 38000000001, "V4/V5 outfit 2 mismatch for Banny 4000000050");
            require(v4OutfitIds[3] == 43000000003, "V4/V5 outfit 3 mismatch for Banny 4000000050");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000054);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000054");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000054");
            
            require(v4OutfitIds[0] == 25000000005, "V4/V5 outfit 0 mismatch for Banny 4000000054");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000060);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000060");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000060");
            
            require(v4OutfitIds[0] == 0, "V4/V5 outfit 0 mismatch for Banny 4000000060");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000073);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000073");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 4000000073");
            
            require(v4OutfitIds[0] == 10000000007, "V4/V5 outfit 0 mismatch for Banny 4000000073");
            require(v4OutfitIds[1] == 19000000006, "V4/V5 outfit 1 mismatch for Banny 4000000073");
            require(v4OutfitIds[2] == 25000000006, "V4/V5 outfit 2 mismatch for Banny 4000000073");
            require(v4OutfitIds[3] == 43000000005, "V4/V5 outfit 3 mismatch for Banny 4000000073");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000079);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000079");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 4000000079");
            
            require(v4OutfitIds[0] == 27000000001, "V4/V5 outfit 0 mismatch for Banny 4000000079");
            require(v4OutfitIds[1] == 38000000002, "V4/V5 outfit 1 mismatch for Banny 4000000079");
            require(v4OutfitIds[2] == 48000000001, "V4/V5 outfit 2 mismatch for Banny 4000000079");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000080);
            require(v4BackgroundId == 5000000001, "V4/V5 background mismatch for Banny 4000000080");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 4000000080");
            
            require(v4OutfitIds[0] == 13000000001, "V4/V5 outfit 0 mismatch for Banny 4000000080");
            require(v4OutfitIds[1] == 20000000001, "V4/V5 outfit 1 mismatch for Banny 4000000080");
            require(v4OutfitIds[2] == 44000000004, "V4/V5 outfit 2 mismatch for Banny 4000000080");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000081);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000081");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 4000000081");
            
            require(v4OutfitIds[0] == 19000000008, "V4/V5 outfit 0 mismatch for Banny 4000000081");
            require(v4OutfitIds[1] == 25000000007, "V4/V5 outfit 1 mismatch for Banny 4000000081");
            require(v4OutfitIds[2] == 35000000002, "V4/V5 outfit 2 mismatch for Banny 4000000081");
            require(v4OutfitIds[3] == 43000000006, "V4/V5 outfit 3 mismatch for Banny 4000000081");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000082);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000082");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000082");
            
            require(v4OutfitIds[0] == 43000000007, "V4/V5 outfit 0 mismatch for Banny 4000000082");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000084);
            require(v4BackgroundId == 5000000003, "V4/V5 background mismatch for Banny 4000000084");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 4000000084");
            
            require(v4OutfitIds[0] == 39000000001, "V4/V5 outfit 0 mismatch for Banny 4000000084");
            require(v4OutfitIds[1] == 41000000001, "V4/V5 outfit 1 mismatch for Banny 4000000084");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000085);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000085");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000085");
            
            require(v4OutfitIds[0] == 28000000008, "V4/V5 outfit 0 mismatch for Banny 4000000085");
        }
        
        // Step 3: Transfer all assets to rightful owners using constructor data
        // Generate token IDs in the same order as items appear (matching mint order)
        // Token ID format: UPC * 1000000000 + unitNumber
        uint256[] memory generatedTokenIds = new uint256[](transferOwners.length);
        
        generatedTokenIds[0] = 2000000001; // UPC 2, unit 1 (V4: 2000000001)
        generatedTokenIds[1] = 2000000002; // UPC 2, unit 2 (V4: 2000000002)
        generatedTokenIds[2] = 2000000003; // UPC 2, unit 3 (V4: 2000000003)
        generatedTokenIds[3] = 3000000001; // UPC 3, unit 1 (V4: 3000000001)
        generatedTokenIds[4] = 3000000002; // UPC 3, unit 2 (V4: 3000000002)
        generatedTokenIds[5] = 3000000003; // UPC 3, unit 3 (V4: 3000000003)
        generatedTokenIds[6] = 3000000004; // UPC 3, unit 4 (V4: 3000000004)
        generatedTokenIds[7] = 3000000005; // UPC 3, unit 5 (V4: 3000000005)
        generatedTokenIds[8] = 3000000006; // UPC 3, unit 6 (V4: 3000000006)
        generatedTokenIds[9] = 3000000007; // UPC 3, unit 7 (V4: 3000000007)
        generatedTokenIds[10] = 3000000008; // UPC 3, unit 8 (V4: 3000000008)
        generatedTokenIds[11] = 3000000009; // UPC 3, unit 9 (V4: 3000000009)
        generatedTokenIds[12] = 3000000010; // UPC 3, unit 10 (V4: 3000000010)
        generatedTokenIds[13] = 4000000001; // UPC 4, unit 1 (V4: 4000000001)
        generatedTokenIds[14] = 4000000002; // UPC 4, unit 2 (V4: 4000000002)
        generatedTokenIds[15] = 4000000003; // UPC 4, unit 3 (V4: 4000000003)
        generatedTokenIds[16] = 4000000004; // UPC 4, unit 4 (V4: 4000000004)
        generatedTokenIds[17] = 4000000005; // UPC 4, unit 5 (V4: 4000000005)
        generatedTokenIds[18] = 4000000006; // UPC 4, unit 6 (V4: 4000000006)
        generatedTokenIds[19] = 4000000007; // UPC 4, unit 7 (V4: 4000000007)
        generatedTokenIds[20] = 4000000008; // UPC 4, unit 8 (V4: 4000000008)
        generatedTokenIds[21] = 4000000009; // UPC 4, unit 9 (V4: 4000000009)
        generatedTokenIds[22] = 4000000010; // UPC 4, unit 10 (V4: 4000000010)
        generatedTokenIds[23] = 4000000011; // UPC 4, unit 11 (V4: 4000000011)
        generatedTokenIds[24] = 4000000012; // UPC 4, unit 12 (V4: 4000000012)
        generatedTokenIds[25] = 4000000013; // UPC 4, unit 13 (V4: 4000000013)
        generatedTokenIds[26] = 4000000014; // UPC 4, unit 14 (V4: 4000000014)
        generatedTokenIds[27] = 4000000015; // UPC 4, unit 15 (V4: 4000000015)
        generatedTokenIds[28] = 4000000016; // UPC 4, unit 16 (V4: 4000000016)
        generatedTokenIds[29] = 4000000017; // UPC 4, unit 17 (V4: 4000000017)
        generatedTokenIds[30] = 4000000018; // UPC 4, unit 18 (V4: 4000000018)
        generatedTokenIds[31] = 4000000019; // UPC 4, unit 19 (V4: 4000000019)
        generatedTokenIds[32] = 4000000020; // UPC 4, unit 20 (V4: 4000000020)
        generatedTokenIds[33] = 4000000021; // UPC 4, unit 21 (V4: 4000000021)
        generatedTokenIds[34] = 4000000022; // UPC 4, unit 22 (V4: 4000000022)
        generatedTokenIds[35] = 4000000023; // UPC 4, unit 23 (V4: 4000000023)
        generatedTokenIds[36] = 4000000024; // UPC 4, unit 24 (V4: 4000000024)
        generatedTokenIds[37] = 4000000025; // UPC 4, unit 25 (V4: 4000000025)
        generatedTokenIds[38] = 4000000026; // UPC 4, unit 26 (V4: 4000000026)
        generatedTokenIds[39] = 4000000027; // UPC 4, unit 27 (V4: 4000000027)
        generatedTokenIds[40] = 4000000028; // UPC 4, unit 28 (V4: 4000000028)
        generatedTokenIds[41] = 4000000029; // UPC 4, unit 29 (V4: 4000000029)
        generatedTokenIds[42] = 4000000030; // UPC 4, unit 30 (V4: 4000000030)
        generatedTokenIds[43] = 4000000031; // UPC 4, unit 31 (V4: 4000000031)
        generatedTokenIds[44] = 4000000032; // UPC 4, unit 32 (V4: 4000000032)
        generatedTokenIds[45] = 4000000033; // UPC 4, unit 33 (V4: 4000000033)
        generatedTokenIds[46] = 4000000034; // UPC 4, unit 34 (V4: 4000000034)
        generatedTokenIds[47] = 4000000035; // UPC 4, unit 35 (V4: 4000000035)
        generatedTokenIds[48] = 4000000036; // UPC 4, unit 36 (V4: 4000000036)
        generatedTokenIds[49] = 4000000037; // UPC 4, unit 37 (V4: 4000000037)
        generatedTokenIds[50] = 4000000038; // UPC 4, unit 38 (V4: 4000000038)
        generatedTokenIds[51] = 4000000039; // UPC 4, unit 39 (V4: 4000000039)
        generatedTokenIds[52] = 4000000040; // UPC 4, unit 40 (V4: 4000000040)
        generatedTokenIds[53] = 4000000041; // UPC 4, unit 41 (V4: 4000000041)
        generatedTokenIds[54] = 4000000042; // UPC 4, unit 42 (V4: 4000000042)
        generatedTokenIds[55] = 4000000043; // UPC 4, unit 43 (V4: 4000000043)
        generatedTokenIds[56] = 4000000044; // UPC 4, unit 44 (V4: 4000000044)
        generatedTokenIds[57] = 4000000045; // UPC 4, unit 45 (V4: 4000000045)
        generatedTokenIds[58] = 4000000046; // UPC 4, unit 46 (V4: 4000000046)
        generatedTokenIds[59] = 4000000047; // UPC 4, unit 47 (V4: 4000000047)
        generatedTokenIds[60] = 4000000048; // UPC 4, unit 48 (V4: 4000000048)
        generatedTokenIds[61] = 4000000049; // UPC 4, unit 49 (V4: 4000000049)
        generatedTokenIds[62] = 4000000050; // UPC 4, unit 50 (V4: 4000000050)
        generatedTokenIds[63] = 4000000051; // UPC 4, unit 51 (V4: 4000000051)
        generatedTokenIds[64] = 4000000052; // UPC 4, unit 52 (V4: 4000000052)
        generatedTokenIds[65] = 4000000053; // UPC 4, unit 53 (V4: 4000000053)
        generatedTokenIds[66] = 4000000054; // UPC 4, unit 54 (V4: 4000000054)
        generatedTokenIds[67] = 4000000055; // UPC 4, unit 55 (V4: 4000000055)
        generatedTokenIds[68] = 4000000056; // UPC 4, unit 56 (V4: 4000000056)
        generatedTokenIds[69] = 4000000057; // UPC 4, unit 57 (V4: 4000000057)
        generatedTokenIds[70] = 4000000058; // UPC 4, unit 58 (V4: 4000000058)
        generatedTokenIds[71] = 4000000059; // UPC 4, unit 59 (V4: 4000000059)
        generatedTokenIds[72] = 4000000060; // UPC 4, unit 60 (V4: 4000000060)
        generatedTokenIds[73] = 4000000061; // UPC 4, unit 61 (V4: 4000000061)
        generatedTokenIds[74] = 4000000062; // UPC 4, unit 62 (V4: 4000000062)
        generatedTokenIds[75] = 4000000063; // UPC 4, unit 63 (V4: 4000000063)
        generatedTokenIds[76] = 4000000064; // UPC 4, unit 64 (V4: 4000000064)
        generatedTokenIds[77] = 4000000065; // UPC 4, unit 65 (V4: 4000000065)
        generatedTokenIds[78] = 4000000066; // UPC 4, unit 66 (V4: 4000000066)
        generatedTokenIds[79] = 4000000067; // UPC 4, unit 67 (V4: 4000000067)
        generatedTokenIds[80] = 4000000068; // UPC 4, unit 68 (V4: 4000000068)
        generatedTokenIds[81] = 4000000069; // UPC 4, unit 69 (V4: 4000000069)
        generatedTokenIds[82] = 4000000070; // UPC 4, unit 70 (V4: 4000000070)
        generatedTokenIds[83] = 4000000071; // UPC 4, unit 71 (V4: 4000000071)
        generatedTokenIds[84] = 4000000072; // UPC 4, unit 72 (V4: 4000000072)
        generatedTokenIds[85] = 4000000073; // UPC 4, unit 73 (V4: 4000000073)
        generatedTokenIds[86] = 4000000074; // UPC 4, unit 74 (V4: 4000000074)
        generatedTokenIds[87] = 4000000075; // UPC 4, unit 75 (V4: 4000000075)
        generatedTokenIds[88] = 4000000076; // UPC 4, unit 76 (V4: 4000000076)
        generatedTokenIds[89] = 4000000077; // UPC 4, unit 77 (V4: 4000000077)
        generatedTokenIds[90] = 4000000078; // UPC 4, unit 78 (V4: 4000000078)
        generatedTokenIds[91] = 4000000079; // UPC 4, unit 79 (V4: 4000000079)
        generatedTokenIds[92] = 4000000080; // UPC 4, unit 80 (V4: 4000000080)
        generatedTokenIds[93] = 4000000081; // UPC 4, unit 81 (V4: 4000000081)
        generatedTokenIds[94] = 4000000082; // UPC 4, unit 82 (V4: 4000000082)
        generatedTokenIds[95] = 4000000083; // UPC 4, unit 83 (V4: 4000000083)
        generatedTokenIds[96] = 4000000084; // UPC 4, unit 84 (V4: 4000000084)
        generatedTokenIds[97] = 4000000085; // UPC 4, unit 85 (V4: 4000000085)
        generatedTokenIds[98] = 4000000086; // UPC 4, unit 86 (V4: 4000000086)
        generatedTokenIds[99] = 4000000087; // UPC 4, unit 87 (V4: 4000000087)
        generatedTokenIds[100] = 4000000088; // UPC 4, unit 88 (V4: 4000000088)
        generatedTokenIds[101] = 4000000089; // UPC 4, unit 89 (V4: 4000000089)
        generatedTokenIds[102] = 4000000090; // UPC 4, unit 90 (V4: 4000000090)
        generatedTokenIds[103] = 4000000091; // UPC 4, unit 91 (V4: 4000000091)
        generatedTokenIds[104] = 4000000092; // UPC 4, unit 92 (V4: 4000000092)
        generatedTokenIds[105] = 4000000093; // UPC 4, unit 93 (V4: 4000000093)
        generatedTokenIds[106] = 4000000094; // UPC 4, unit 94 (V4: 4000000094)
        generatedTokenIds[107] = 7000000001; // UPC 7, unit 1 (V4: 7000000001)
        generatedTokenIds[108] = 10000000002; // UPC 10, unit 2 (V4: 10000000002)
        generatedTokenIds[109] = 10000000006; // UPC 10, unit 6 (V4: 10000000006)
        generatedTokenIds[110] = 10000000008; // UPC 10, unit 8 (V4: 10000000008)
        generatedTokenIds[111] = 10000000009; // UPC 10, unit 9 (V4: 10000000009)
        generatedTokenIds[112] = 10000000010; // UPC 10, unit 10 (V4: 10000000010)
        generatedTokenIds[113] = 10000000011; // UPC 10, unit 11 (V4: 10000000011)
        generatedTokenIds[114] = 11000000002; // UPC 11, unit 2 (V4: 11000000002)
        generatedTokenIds[115] = 11000000003; // UPC 11, unit 3 (V4: 11000000003)
        generatedTokenIds[116] = 13000000002; // UPC 13, unit 2 (V4: 13000000002)
        generatedTokenIds[117] = 14000000004; // UPC 14, unit 4 (V4: 14000000004)
        generatedTokenIds[118] = 17000000001; // UPC 17, unit 1 (V4: 17000000001)
        generatedTokenIds[119] = 19000000002; // UPC 19, unit 2 (V4: 19000000002)
        generatedTokenIds[120] = 19000000004; // UPC 19, unit 4 (V4: 19000000004)
        generatedTokenIds[121] = 19000000010; // UPC 19, unit 10 (V4: 19000000010)
        generatedTokenIds[122] = 19000000011; // UPC 19, unit 11 (V4: 19000000011)
        generatedTokenIds[123] = 19000000012; // UPC 19, unit 12 (V4: 19000000012)
        generatedTokenIds[124] = 24000000001; // UPC 24, unit 1 (V4: 24000000001)
        generatedTokenIds[125] = 25000000003; // UPC 25, unit 3 (V4: 25000000003)
        generatedTokenIds[126] = 28000000003; // UPC 28, unit 3 (V4: 28000000003)
        generatedTokenIds[127] = 28000000006; // UPC 28, unit 6 (V4: 28000000006)
        generatedTokenIds[128] = 28000000009; // UPC 28, unit 9 (V4: 28000000009)
        generatedTokenIds[129] = 28000000010; // UPC 28, unit 10 (V4: 28000000010)
        generatedTokenIds[130] = 31000000003; // UPC 31, unit 3 (V4: 31000000003)
        generatedTokenIds[131] = 31000000004; // UPC 31, unit 4 (V4: 31000000004)
        generatedTokenIds[132] = 31000000005; // UPC 31, unit 5 (V4: 31000000005)
        generatedTokenIds[133] = 31000000006; // UPC 31, unit 6 (V4: 31000000006)
        generatedTokenIds[134] = 32000000002; // UPC 32, unit 2 (V4: 32000000002)
        generatedTokenIds[135] = 34000000001; // UPC 34, unit 1 (V4: 34000000001)
        generatedTokenIds[136] = 35000000001; // UPC 35, unit 1 (V4: 35000000001)
        generatedTokenIds[137] = 35000000003; // UPC 35, unit 3 (V4: 35000000003)
        generatedTokenIds[138] = 35000000004; // UPC 35, unit 4 (V4: 35000000004)
        generatedTokenIds[139] = 38000000003; // UPC 38, unit 3 (V4: 38000000003)
        generatedTokenIds[140] = 39000000002; // UPC 39, unit 2 (V4: 39000000002)
        generatedTokenIds[141] = 40000000002; // UPC 40, unit 2 (V4: 40000000002)
        generatedTokenIds[142] = 40000000003; // UPC 40, unit 3 (V4: 40000000003)
        generatedTokenIds[143] = 41000000002; // UPC 41, unit 2 (V4: 41000000002)
        generatedTokenIds[144] = 42000000001; // UPC 42, unit 1 (V4: 42000000001)
        generatedTokenIds[145] = 42000000002; // UPC 42, unit 2 (V4: 42000000002)
        generatedTokenIds[146] = 43000000001; // UPC 43, unit 1 (V4: 43000000001)
        generatedTokenIds[147] = 43000000004; // UPC 43, unit 4 (V4: 43000000004)
        generatedTokenIds[148] = 44000000002; // UPC 44, unit 2 (V4: 44000000002)
        generatedTokenIds[149] = 44000000003; // UPC 44, unit 3 (V4: 44000000003)
        generatedTokenIds[150] = 47000000002; // UPC 47, unit 2 (V4: 47000000002)
        generatedTokenIds[151] = 47000000004; // UPC 47, unit 4 (V4: 47000000004)
        generatedTokenIds[152] = 47000000006; // UPC 47, unit 6 (V4: 47000000006)
        generatedTokenIds[153] = 47000000007; // UPC 47, unit 7 (V4: 47000000007)
        generatedTokenIds[154] = 47000000008; // UPC 47, unit 8 (V4: 47000000008)
        generatedTokenIds[155] = 49000000001; // UPC 49, unit 1 (V4: 49000000001)
        generatedTokenIds[156] = 49000000002; // UPC 49, unit 2 (V4: 49000000002)
        generatedTokenIds[157] = 5000000002; // UPC 5, unit 2 (V4: 5000000002)
        generatedTokenIds[158] = 5000000005; // UPC 5, unit 5 (V4: 5000000005)
        generatedTokenIds[159] = 6000000002; // UPC 6, unit 2 (V4: 6000000002)
        
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