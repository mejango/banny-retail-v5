// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";

contract MigrationContractArbitrum {
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
        
        // Arbitrum migration - 205 items
        
        // Step 1: Assets are already minted to this contract by the deployer
        
        
        // Assets are already minted to this contract by the deployer
        
        // Create and populate the struct
        // Token IDs are generated as: UPC * 1000000000 + unitNumber (where unitNumber starts at 1)
        MintedIds memory sortedMintedIds;
        
        // Populate UPC 3 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc3[i] = 3 * 1000000000 + (i + 1);
        }
        // Populate UPC 4 minted tokenIds (9 items)
        for (uint256 i = 0; i < 9; i++) {
            sortedMintedIds.upc4[i] = 4 * 1000000000 + (i + 1);
        }
        // Populate UPC 5 minted tokenIds (3 items)
        for (uint256 i = 0; i < 3; i++) {
            sortedMintedIds.upc5[i] = 5 * 1000000000 + (i + 1);
        }
        // Populate UPC 6 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc6[i] = 6 * 1000000000 + (i + 1);
        }
        // Populate UPC 10 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc10[i] = 10 * 1000000000 + (i + 1);
        }
        // Populate UPC 11 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc11[i] = 11 * 1000000000 + (i + 1);
        }
        // Populate UPC 19 minted tokenIds (4 items)
        for (uint256 i = 0; i < 4; i++) {
            sortedMintedIds.upc19[i] = 19 * 1000000000 + (i + 1);
        }
        // Populate UPC 20 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc20[i] = 20 * 1000000000 + (i + 1);
        }
        // Populate UPC 25 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc25[i] = 25 * 1000000000 + (i + 1);
        }
        // Populate UPC 28 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc28[i] = 28 * 1000000000 + (i + 1);
        }
        // Populate UPC 31 minted tokenIds (2 items)
        for (uint256 i = 0; i < 2; i++) {
            sortedMintedIds.upc31[i] = 31 * 1000000000 + (i + 1);
        }
        // Populate UPC 32 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc32[i] = 32 * 1000000000 + (i + 1);
        }
        // Populate UPC 38 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc38[i] = 38 * 1000000000 + (i + 1);
        }
        // Populate UPC 39 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc39[i] = 39 * 1000000000 + (i + 1);
        }
        // Populate UPC 43 minted tokenIds (1 items)
        for (uint256 i = 0; i < 1; i++) {
            sortedMintedIds.upc43[i] = 43 * 1000000000 + (i + 1);
        }
        // Populate UPC 47 minted tokenIds (27 items)
        for (uint256 i = 0; i < 27; i++) {
            sortedMintedIds.upc47[i] = 47 * 1000000000 + (i + 1);
        }
        // Populate UPC 49 minted tokenIds (145 items)
        for (uint256 i = 0; i < 145; i++) {
            sortedMintedIds.upc49[i] = 49 * 1000000000 + (i + 1);
        }
        // Step 1.5: Approve resolver to transfer outfit and background assets (not banny bodies)
        // The resolver needs approval to transfer outfits and backgrounds to itself during decoration
        
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc19[0]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc25[0]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc38[0]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc47[0]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc5[0]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc11[0]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc19[2]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc28[0]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc6[0]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc10[0]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc20[0]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc31[0]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc49[1]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc10[1]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc20[1]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc43[0]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc5[1]);
        IERC721(address(hook)).approve(address(resolver), sortedMintedIds.upc28[1]);
        
        // Step 2: Process each Banny body and dress them
        
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000001);
            require(v4BackgroundId == 5000000001, "V4/V5 background mismatch for Banny 3000000001");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 3000000001");
            
            require(v4OutfitIds[0] == 19000000001, "V4/V5 outfit 0 mismatch for Banny 3000000001");
            require(v4OutfitIds[1] == 25000000001, "V4/V5 outfit 1 mismatch for Banny 3000000001");
            require(v4OutfitIds[2] == 38000000001, "V4/V5 outfit 2 mismatch for Banny 3000000001");
            require(v4OutfitIds[3] == 47000000001, "V4/V5 outfit 3 mismatch for Banny 3000000001");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000003);
            require(v4BackgroundId == 6000000001, "V4/V5 background mismatch for Banny 4000000003");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 4000000003");
            
            require(v4OutfitIds[0] == 11000000001, "V4/V5 outfit 0 mismatch for Banny 4000000003");
            require(v4OutfitIds[1] == 19000000003, "V4/V5 outfit 1 mismatch for Banny 4000000003");
            require(v4OutfitIds[2] == 28000000001, "V4/V5 outfit 2 mismatch for Banny 4000000003");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000004);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000004");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 4000000004");
            
            require(v4OutfitIds[0] == 10000000001, "V4/V5 outfit 0 mismatch for Banny 4000000004");
            require(v4OutfitIds[1] == 20000000001, "V4/V5 outfit 1 mismatch for Banny 4000000004");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000005);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000005");
            require(v4OutfitIds.length == 2, "V4/V5 outfit count mismatch for Banny 4000000005");
            
            require(v4OutfitIds[0] == 31000000001, "V4/V5 outfit 0 mismatch for Banny 4000000005");
            require(v4OutfitIds[1] == 49000000002, "V4/V5 outfit 1 mismatch for Banny 4000000005");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000007);
            require(v4BackgroundId == 5000000002, "V4/V5 background mismatch for Banny 4000000007");
            require(v4OutfitIds.length == 3, "V4/V5 outfit count mismatch for Banny 4000000007");
            
            require(v4OutfitIds[0] == 10000000002, "V4/V5 outfit 0 mismatch for Banny 4000000007");
            require(v4OutfitIds[1] == 20000000002, "V4/V5 outfit 1 mismatch for Banny 4000000007");
            require(v4OutfitIds[2] == 43000000001, "V4/V5 outfit 2 mismatch for Banny 4000000007");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000009);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000009");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000009");
            
            require(v4OutfitIds[0] == 28000000002, "V4/V5 outfit 0 mismatch for Banny 4000000009");
        }
        
        // Step 3: Transfer all assets to rightful owners using constructor data
        // Generate token IDs in the same order as items appear (matching mint order)
        // Token ID format: UPC * 1000000000 + unitNumber
        uint256[] memory generatedTokenIds = new uint256[](transferOwners.length);
        
        generatedTokenIds[0] = 3000000001; // UPC 3, unit 1 (V4: 3000000001)
        generatedTokenIds[1] = 3000000002; // UPC 3, unit 2 (V4: 3000000002)
        generatedTokenIds[2] = 4000000001; // UPC 4, unit 1 (V4: 4000000001)
        generatedTokenIds[3] = 4000000002; // UPC 4, unit 2 (V4: 4000000002)
        generatedTokenIds[4] = 4000000003; // UPC 4, unit 3 (V4: 4000000003)
        generatedTokenIds[5] = 4000000004; // UPC 4, unit 4 (V4: 4000000004)
        generatedTokenIds[6] = 4000000005; // UPC 4, unit 5 (V4: 4000000005)
        generatedTokenIds[7] = 4000000006; // UPC 4, unit 6 (V4: 4000000006)
        generatedTokenIds[8] = 4000000007; // UPC 4, unit 7 (V4: 4000000007)
        generatedTokenIds[9] = 4000000008; // UPC 4, unit 8 (V4: 4000000008)
        generatedTokenIds[10] = 4000000009; // UPC 4, unit 9 (V4: 4000000009)
        generatedTokenIds[11] = 19000000002; // UPC 19, unit 2 (V4: 19000000002)
        generatedTokenIds[12] = 19000000004; // UPC 19, unit 4 (V4: 19000000004)
        generatedTokenIds[13] = 31000000002; // UPC 31, unit 2 (V4: 31000000002)
        generatedTokenIds[14] = 32000000001; // UPC 32, unit 1 (V4: 32000000001)
        generatedTokenIds[15] = 39000000001; // UPC 39, unit 1 (V4: 39000000001)
        generatedTokenIds[16] = 47000000002; // UPC 47, unit 2 (V4: 47000000002)
        generatedTokenIds[17] = 47000000003; // UPC 47, unit 3 (V4: 47000000003)
        generatedTokenIds[18] = 47000000004; // UPC 47, unit 4 (V4: 47000000004)
        generatedTokenIds[19] = 47000000005; // UPC 47, unit 5 (V4: 47000000005)
        generatedTokenIds[20] = 47000000006; // UPC 47, unit 6 (V4: 47000000006)
        generatedTokenIds[21] = 47000000007; // UPC 47, unit 7 (V4: 47000000007)
        generatedTokenIds[22] = 47000000008; // UPC 47, unit 8 (V4: 47000000008)
        generatedTokenIds[23] = 47000000009; // UPC 47, unit 9 (V4: 47000000009)
        generatedTokenIds[24] = 47000000010; // UPC 47, unit 10 (V4: 47000000010)
        generatedTokenIds[25] = 47000000011; // UPC 47, unit 11 (V4: 47000000011)
        generatedTokenIds[26] = 47000000012; // UPC 47, unit 12 (V4: 47000000012)
        generatedTokenIds[27] = 47000000013; // UPC 47, unit 13 (V4: 47000000013)
        generatedTokenIds[28] = 47000000014; // UPC 47, unit 14 (V4: 47000000014)
        generatedTokenIds[29] = 47000000015; // UPC 47, unit 15 (V4: 47000000015)
        generatedTokenIds[30] = 47000000016; // UPC 47, unit 16 (V4: 47000000016)
        generatedTokenIds[31] = 47000000017; // UPC 47, unit 17 (V4: 47000000017)
        generatedTokenIds[32] = 47000000018; // UPC 47, unit 18 (V4: 47000000018)
        generatedTokenIds[33] = 47000000019; // UPC 47, unit 19 (V4: 47000000019)
        generatedTokenIds[34] = 47000000020; // UPC 47, unit 20 (V4: 47000000020)
        generatedTokenIds[35] = 47000000021; // UPC 47, unit 21 (V4: 47000000021)
        generatedTokenIds[36] = 47000000022; // UPC 47, unit 22 (V4: 47000000022)
        generatedTokenIds[37] = 47000000023; // UPC 47, unit 23 (V4: 47000000023)
        generatedTokenIds[38] = 47000000024; // UPC 47, unit 24 (V4: 47000000024)
        generatedTokenIds[39] = 47000000025; // UPC 47, unit 25 (V4: 47000000025)
        generatedTokenIds[40] = 47000000026; // UPC 47, unit 26 (V4: 47000000026)
        generatedTokenIds[41] = 47000000027; // UPC 47, unit 27 (V4: 47000000027)
        generatedTokenIds[42] = 49000000001; // UPC 49, unit 1 (V4: 49000000001)
        generatedTokenIds[43] = 49000000003; // UPC 49, unit 3 (V4: 49000000003)
        generatedTokenIds[44] = 49000000004; // UPC 49, unit 4 (V4: 49000000004)
        generatedTokenIds[45] = 49000000005; // UPC 49, unit 5 (V4: 49000000005)
        generatedTokenIds[46] = 49000000006; // UPC 49, unit 6 (V4: 49000000006)
        generatedTokenIds[47] = 49000000007; // UPC 49, unit 7 (V4: 49000000007)
        generatedTokenIds[48] = 49000000008; // UPC 49, unit 8 (V4: 49000000008)
        generatedTokenIds[49] = 49000000009; // UPC 49, unit 9 (V4: 49000000009)
        generatedTokenIds[50] = 49000000010; // UPC 49, unit 10 (V4: 49000000010)
        generatedTokenIds[51] = 49000000011; // UPC 49, unit 11 (V4: 49000000011)
        generatedTokenIds[52] = 49000000012; // UPC 49, unit 12 (V4: 49000000012)
        generatedTokenIds[53] = 49000000013; // UPC 49, unit 13 (V4: 49000000013)
        generatedTokenIds[54] = 49000000014; // UPC 49, unit 14 (V4: 49000000014)
        generatedTokenIds[55] = 49000000015; // UPC 49, unit 15 (V4: 49000000015)
        generatedTokenIds[56] = 49000000016; // UPC 49, unit 16 (V4: 49000000016)
        generatedTokenIds[57] = 49000000017; // UPC 49, unit 17 (V4: 49000000017)
        generatedTokenIds[58] = 49000000018; // UPC 49, unit 18 (V4: 49000000018)
        generatedTokenIds[59] = 49000000019; // UPC 49, unit 19 (V4: 49000000019)
        generatedTokenIds[60] = 49000000020; // UPC 49, unit 20 (V4: 49000000020)
        generatedTokenIds[61] = 49000000021; // UPC 49, unit 21 (V4: 49000000021)
        generatedTokenIds[62] = 49000000022; // UPC 49, unit 22 (V4: 49000000022)
        generatedTokenIds[63] = 49000000023; // UPC 49, unit 23 (V4: 49000000023)
        generatedTokenIds[64] = 49000000024; // UPC 49, unit 24 (V4: 49000000024)
        generatedTokenIds[65] = 49000000025; // UPC 49, unit 25 (V4: 49000000025)
        generatedTokenIds[66] = 49000000026; // UPC 49, unit 26 (V4: 49000000026)
        generatedTokenIds[67] = 49000000027; // UPC 49, unit 27 (V4: 49000000027)
        generatedTokenIds[68] = 49000000028; // UPC 49, unit 28 (V4: 49000000028)
        generatedTokenIds[69] = 49000000029; // UPC 49, unit 29 (V4: 49000000029)
        generatedTokenIds[70] = 49000000030; // UPC 49, unit 30 (V4: 49000000030)
        generatedTokenIds[71] = 49000000031; // UPC 49, unit 31 (V4: 49000000031)
        generatedTokenIds[72] = 49000000032; // UPC 49, unit 32 (V4: 49000000032)
        generatedTokenIds[73] = 49000000033; // UPC 49, unit 33 (V4: 49000000033)
        generatedTokenIds[74] = 49000000034; // UPC 49, unit 34 (V4: 49000000034)
        generatedTokenIds[75] = 49000000035; // UPC 49, unit 35 (V4: 49000000035)
        generatedTokenIds[76] = 49000000036; // UPC 49, unit 36 (V4: 49000000036)
        generatedTokenIds[77] = 49000000037; // UPC 49, unit 37 (V4: 49000000037)
        generatedTokenIds[78] = 49000000038; // UPC 49, unit 38 (V4: 49000000038)
        generatedTokenIds[79] = 49000000039; // UPC 49, unit 39 (V4: 49000000039)
        generatedTokenIds[80] = 49000000040; // UPC 49, unit 40 (V4: 49000000040)
        generatedTokenIds[81] = 49000000041; // UPC 49, unit 41 (V4: 49000000041)
        generatedTokenIds[82] = 49000000042; // UPC 49, unit 42 (V4: 49000000042)
        generatedTokenIds[83] = 49000000043; // UPC 49, unit 43 (V4: 49000000043)
        generatedTokenIds[84] = 49000000044; // UPC 49, unit 44 (V4: 49000000044)
        generatedTokenIds[85] = 49000000045; // UPC 49, unit 45 (V4: 49000000045)
        generatedTokenIds[86] = 49000000046; // UPC 49, unit 46 (V4: 49000000046)
        generatedTokenIds[87] = 49000000047; // UPC 49, unit 47 (V4: 49000000047)
        generatedTokenIds[88] = 49000000048; // UPC 49, unit 48 (V4: 49000000048)
        generatedTokenIds[89] = 49000000049; // UPC 49, unit 49 (V4: 49000000049)
        generatedTokenIds[90] = 49000000050; // UPC 49, unit 50 (V4: 49000000050)
        generatedTokenIds[91] = 49000000051; // UPC 49, unit 51 (V4: 49000000051)
        generatedTokenIds[92] = 49000000052; // UPC 49, unit 52 (V4: 49000000052)
        generatedTokenIds[93] = 49000000053; // UPC 49, unit 53 (V4: 49000000053)
        generatedTokenIds[94] = 49000000054; // UPC 49, unit 54 (V4: 49000000054)
        generatedTokenIds[95] = 49000000055; // UPC 49, unit 55 (V4: 49000000055)
        generatedTokenIds[96] = 49000000056; // UPC 49, unit 56 (V4: 49000000056)
        generatedTokenIds[97] = 49000000057; // UPC 49, unit 57 (V4: 49000000057)
        generatedTokenIds[98] = 49000000058; // UPC 49, unit 58 (V4: 49000000058)
        generatedTokenIds[99] = 49000000059; // UPC 49, unit 59 (V4: 49000000059)
        generatedTokenIds[100] = 49000000060; // UPC 49, unit 60 (V4: 49000000060)
        generatedTokenIds[101] = 49000000061; // UPC 49, unit 61 (V4: 49000000061)
        generatedTokenIds[102] = 49000000062; // UPC 49, unit 62 (V4: 49000000062)
        generatedTokenIds[103] = 49000000063; // UPC 49, unit 63 (V4: 49000000063)
        generatedTokenIds[104] = 49000000064; // UPC 49, unit 64 (V4: 49000000064)
        generatedTokenIds[105] = 49000000065; // UPC 49, unit 65 (V4: 49000000065)
        generatedTokenIds[106] = 49000000066; // UPC 49, unit 66 (V4: 49000000066)
        generatedTokenIds[107] = 49000000067; // UPC 49, unit 67 (V4: 49000000067)
        generatedTokenIds[108] = 49000000068; // UPC 49, unit 68 (V4: 49000000068)
        generatedTokenIds[109] = 49000000069; // UPC 49, unit 69 (V4: 49000000069)
        generatedTokenIds[110] = 49000000070; // UPC 49, unit 70 (V4: 49000000070)
        generatedTokenIds[111] = 49000000071; // UPC 49, unit 71 (V4: 49000000071)
        generatedTokenIds[112] = 49000000072; // UPC 49, unit 72 (V4: 49000000072)
        generatedTokenIds[113] = 49000000073; // UPC 49, unit 73 (V4: 49000000073)
        generatedTokenIds[114] = 49000000074; // UPC 49, unit 74 (V4: 49000000074)
        generatedTokenIds[115] = 49000000075; // UPC 49, unit 75 (V4: 49000000075)
        generatedTokenIds[116] = 49000000076; // UPC 49, unit 76 (V4: 49000000076)
        generatedTokenIds[117] = 49000000077; // UPC 49, unit 77 (V4: 49000000077)
        generatedTokenIds[118] = 49000000078; // UPC 49, unit 78 (V4: 49000000078)
        generatedTokenIds[119] = 49000000079; // UPC 49, unit 79 (V4: 49000000079)
        generatedTokenIds[120] = 49000000080; // UPC 49, unit 80 (V4: 49000000080)
        generatedTokenIds[121] = 49000000081; // UPC 49, unit 81 (V4: 49000000081)
        generatedTokenIds[122] = 49000000082; // UPC 49, unit 82 (V4: 49000000082)
        generatedTokenIds[123] = 49000000083; // UPC 49, unit 83 (V4: 49000000083)
        generatedTokenIds[124] = 49000000084; // UPC 49, unit 84 (V4: 49000000084)
        generatedTokenIds[125] = 49000000085; // UPC 49, unit 85 (V4: 49000000085)
        generatedTokenIds[126] = 49000000086; // UPC 49, unit 86 (V4: 49000000086)
        generatedTokenIds[127] = 49000000087; // UPC 49, unit 87 (V4: 49000000087)
        generatedTokenIds[128] = 49000000088; // UPC 49, unit 88 (V4: 49000000088)
        generatedTokenIds[129] = 49000000089; // UPC 49, unit 89 (V4: 49000000089)
        generatedTokenIds[130] = 49000000090; // UPC 49, unit 90 (V4: 49000000090)
        generatedTokenIds[131] = 49000000091; // UPC 49, unit 91 (V4: 49000000091)
        generatedTokenIds[132] = 49000000092; // UPC 49, unit 92 (V4: 49000000092)
        generatedTokenIds[133] = 49000000093; // UPC 49, unit 93 (V4: 49000000093)
        generatedTokenIds[134] = 49000000094; // UPC 49, unit 94 (V4: 49000000094)
        generatedTokenIds[135] = 49000000095; // UPC 49, unit 95 (V4: 49000000095)
        generatedTokenIds[136] = 49000000096; // UPC 49, unit 96 (V4: 49000000096)
        generatedTokenIds[137] = 49000000097; // UPC 49, unit 97 (V4: 49000000097)
        generatedTokenIds[138] = 49000000098; // UPC 49, unit 98 (V4: 49000000098)
        generatedTokenIds[139] = 49000000099; // UPC 49, unit 99 (V4: 49000000099)
        generatedTokenIds[140] = 49000000100; // UPC 49, unit 100 (V4: 49000000100)
        generatedTokenIds[141] = 49000000101; // UPC 49, unit 101 (V4: 49000000101)
        generatedTokenIds[142] = 49000000102; // UPC 49, unit 102 (V4: 49000000102)
        generatedTokenIds[143] = 49000000103; // UPC 49, unit 103 (V4: 49000000103)
        generatedTokenIds[144] = 49000000104; // UPC 49, unit 104 (V4: 49000000104)
        generatedTokenIds[145] = 49000000105; // UPC 49, unit 105 (V4: 49000000105)
        generatedTokenIds[146] = 49000000106; // UPC 49, unit 106 (V4: 49000000106)
        generatedTokenIds[147] = 49000000107; // UPC 49, unit 107 (V4: 49000000107)
        generatedTokenIds[148] = 49000000108; // UPC 49, unit 108 (V4: 49000000108)
        generatedTokenIds[149] = 49000000109; // UPC 49, unit 109 (V4: 49000000109)
        generatedTokenIds[150] = 49000000110; // UPC 49, unit 110 (V4: 49000000110)
        generatedTokenIds[151] = 49000000111; // UPC 49, unit 111 (V4: 49000000111)
        generatedTokenIds[152] = 49000000112; // UPC 49, unit 112 (V4: 49000000112)
        generatedTokenIds[153] = 49000000113; // UPC 49, unit 113 (V4: 49000000113)
        generatedTokenIds[154] = 49000000114; // UPC 49, unit 114 (V4: 49000000114)
        generatedTokenIds[155] = 49000000115; // UPC 49, unit 115 (V4: 49000000115)
        generatedTokenIds[156] = 49000000116; // UPC 49, unit 116 (V4: 49000000116)
        generatedTokenIds[157] = 49000000117; // UPC 49, unit 117 (V4: 49000000117)
        generatedTokenIds[158] = 49000000118; // UPC 49, unit 118 (V4: 49000000118)
        generatedTokenIds[159] = 49000000119; // UPC 49, unit 119 (V4: 49000000119)
        generatedTokenIds[160] = 49000000120; // UPC 49, unit 120 (V4: 49000000120)
        generatedTokenIds[161] = 49000000121; // UPC 49, unit 121 (V4: 49000000121)
        generatedTokenIds[162] = 49000000122; // UPC 49, unit 122 (V4: 49000000122)
        generatedTokenIds[163] = 49000000123; // UPC 49, unit 123 (V4: 49000000123)
        generatedTokenIds[164] = 49000000124; // UPC 49, unit 124 (V4: 49000000124)
        generatedTokenIds[165] = 49000000125; // UPC 49, unit 125 (V4: 49000000125)
        generatedTokenIds[166] = 49000000126; // UPC 49, unit 126 (V4: 49000000126)
        generatedTokenIds[167] = 49000000127; // UPC 49, unit 127 (V4: 49000000127)
        generatedTokenIds[168] = 49000000128; // UPC 49, unit 128 (V4: 49000000128)
        generatedTokenIds[169] = 49000000129; // UPC 49, unit 129 (V4: 49000000129)
        generatedTokenIds[170] = 49000000130; // UPC 49, unit 130 (V4: 49000000130)
        generatedTokenIds[171] = 49000000131; // UPC 49, unit 131 (V4: 49000000131)
        generatedTokenIds[172] = 49000000132; // UPC 49, unit 132 (V4: 49000000132)
        generatedTokenIds[173] = 49000000133; // UPC 49, unit 133 (V4: 49000000133)
        generatedTokenIds[174] = 49000000134; // UPC 49, unit 134 (V4: 49000000134)
        generatedTokenIds[175] = 49000000135; // UPC 49, unit 135 (V4: 49000000135)
        generatedTokenIds[176] = 49000000136; // UPC 49, unit 136 (V4: 49000000136)
        generatedTokenIds[177] = 49000000137; // UPC 49, unit 137 (V4: 49000000137)
        generatedTokenIds[178] = 49000000138; // UPC 49, unit 138 (V4: 49000000138)
        generatedTokenIds[179] = 49000000139; // UPC 49, unit 139 (V4: 49000000139)
        generatedTokenIds[180] = 49000000140; // UPC 49, unit 140 (V4: 49000000140)
        generatedTokenIds[181] = 49000000141; // UPC 49, unit 141 (V4: 49000000141)
        generatedTokenIds[182] = 49000000142; // UPC 49, unit 142 (V4: 49000000142)
        generatedTokenIds[183] = 49000000143; // UPC 49, unit 143 (V4: 49000000143)
        generatedTokenIds[184] = 49000000144; // UPC 49, unit 144 (V4: 49000000144)
        generatedTokenIds[185] = 49000000145; // UPC 49, unit 145 (V4: 49000000145)
        generatedTokenIds[186] = 5000000003; // UPC 5, unit 3 (V4: 5000000003)
        
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