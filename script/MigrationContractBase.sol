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
        
        // Step 1: Mint all assets to deployer initially
        
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
        uint256[] memory mintedIds = hook.mintFor(allTierIds, deployer);
        
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
        MintedIds memory sortedMintedIds;
        
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