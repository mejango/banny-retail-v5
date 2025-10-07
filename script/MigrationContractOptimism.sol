// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";

contract MigrationContractOptimism {
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
        
        // Optimism migration - 11 items
        
        // Step 1: Mint all assets to deployer initially
        
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
        uint256[] memory mintedIds = hook.mintFor(allTierIds, deployer);
        
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
        MintedIds memory sortedMintedIds;
        
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 3000000001);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 3000000001");
            require(v4OutfitIds.length == 4, "V4/V5 outfit count mismatch for Banny 3000000001");
            
            require(v4OutfitIds[0] == 11000000001, "V4/V5 outfit 0 mismatch for Banny 3000000001");
            require(v4OutfitIds[1] == 19000000001, "V4/V5 outfit 1 mismatch for Banny 3000000001");
            require(v4OutfitIds[2] == 25000000001, "V4/V5 outfit 2 mismatch for Banny 3000000001");
            require(v4OutfitIds[3] == 44000000001, "V4/V5 outfit 3 mismatch for Banny 3000000001");
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
            
            // Verify V4 to V5 dressing consistency for this Banny
            (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, 4000000001);
            require(v4BackgroundId == 0, "V4/V5 background mismatch for Banny 4000000001");
            require(v4OutfitIds.length == 1, "V4/V5 outfit count mismatch for Banny 4000000001");
            
            require(v4OutfitIds[0] == 47000000001, "V4/V5 outfit 0 mismatch for Banny 4000000001");
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