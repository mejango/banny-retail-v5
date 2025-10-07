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
        
        // Arbitrum migration - 205 items
        
        // Step 1: Assets are already minted to this contract by the deployer
        
        
        // Assets are already minted to this contract by the deployer
        
        // Create and populate the struct
        MintedIds memory sortedMintedIds;
        
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