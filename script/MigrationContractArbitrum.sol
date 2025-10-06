// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";

contract MigrationContractArbitrum {
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
        
        // Arbitrum migration - 205 items
        
        // Step 1: Mint all assets to deployer initially
        
        // Create array of all tierIds to mint
        uint256[] memory allTierIds = new uint256[](205);
        uint256 tierIndex = 0;
        
        // Add 2 instances of UPC 3
        for (uint256 i = 0; i < 2; i++) {
            allTierIds[tierIndex] = 3;
            tierIndex++;
        }
        // Add 9 instances of UPC 4
        for (uint256 i = 0; i < 9; i++) {
            allTierIds[tierIndex] = 4;
            tierIndex++;
        }
        // Add 3 instances of UPC 5
        for (uint256 i = 0; i < 3; i++) {
            allTierIds[tierIndex] = 5;
            tierIndex++;
        }
        // Add 1 instances of UPC 6
        for (uint256 i = 0; i < 1; i++) {
            allTierIds[tierIndex] = 6;
            tierIndex++;
        }
        // Add 2 instances of UPC 10
        for (uint256 i = 0; i < 2; i++) {
            allTierIds[tierIndex] = 10;
            tierIndex++;
        }
        // Add 1 instances of UPC 11
        for (uint256 i = 0; i < 1; i++) {
            allTierIds[tierIndex] = 11;
            tierIndex++;
        }
        // Add 4 instances of UPC 19
        for (uint256 i = 0; i < 4; i++) {
            allTierIds[tierIndex] = 19;
            tierIndex++;
        }
        // Add 2 instances of UPC 20
        for (uint256 i = 0; i < 2; i++) {
            allTierIds[tierIndex] = 20;
            tierIndex++;
        }
        // Add 1 instances of UPC 25
        for (uint256 i = 0; i < 1; i++) {
            allTierIds[tierIndex] = 25;
            tierIndex++;
        }
        // Add 2 instances of UPC 28
        for (uint256 i = 0; i < 2; i++) {
            allTierIds[tierIndex] = 28;
            tierIndex++;
        }
        // Add 2 instances of UPC 31
        for (uint256 i = 0; i < 2; i++) {
            allTierIds[tierIndex] = 31;
            tierIndex++;
        }
        // Add 1 instances of UPC 32
        for (uint256 i = 0; i < 1; i++) {
            allTierIds[tierIndex] = 32;
            tierIndex++;
        }
        // Add 1 instances of UPC 38
        for (uint256 i = 0; i < 1; i++) {
            allTierIds[tierIndex] = 38;
            tierIndex++;
        }
        // Add 1 instances of UPC 39
        for (uint256 i = 0; i < 1; i++) {
            allTierIds[tierIndex] = 39;
            tierIndex++;
        }
        // Add 1 instances of UPC 43
        for (uint256 i = 0; i < 1; i++) {
            allTierIds[tierIndex] = 43;
            tierIndex++;
        }
        // Add 27 instances of UPC 47
        for (uint256 i = 0; i < 27; i++) {
            allTierIds[tierIndex] = 47;
            tierIndex++;
        }
        // Add 145 instances of UPC 49
        for (uint256 i = 0; i < 145; i++) {
            allTierIds[tierIndex] = 49;
            tierIndex++;
        }
        
        // Mint all tierIds at once
        uint256[] memory mintedIds = hook.mintFor(allTierIds, deployer);
        
        // UPC 3 minted tokenIds (2 items)
        uint256[] memory upc3MintedIds = new uint256[](2);
        for (uint256 i = 0; i < 2; i++) {
            upc3MintedIds[i] = mintedIds[0 + i];
        }
        // UPC 4 minted tokenIds (9 items)
        uint256[] memory upc4MintedIds = new uint256[](9);
        for (uint256 i = 0; i < 9; i++) {
            upc4MintedIds[i] = mintedIds[2 + i];
        }
        // UPC 5 minted tokenIds (3 items)
        uint256[] memory upc5MintedIds = new uint256[](3);
        for (uint256 i = 0; i < 3; i++) {
            upc5MintedIds[i] = mintedIds[11 + i];
        }
        // UPC 6 minted tokenIds (1 items)
        uint256[] memory upc6MintedIds = new uint256[](1);
        for (uint256 i = 0; i < 1; i++) {
            upc6MintedIds[i] = mintedIds[14 + i];
        }
        // UPC 10 minted tokenIds (2 items)
        uint256[] memory upc10MintedIds = new uint256[](2);
        for (uint256 i = 0; i < 2; i++) {
            upc10MintedIds[i] = mintedIds[15 + i];
        }
        // UPC 11 minted tokenIds (1 items)
        uint256[] memory upc11MintedIds = new uint256[](1);
        for (uint256 i = 0; i < 1; i++) {
            upc11MintedIds[i] = mintedIds[17 + i];
        }
        // UPC 19 minted tokenIds (4 items)
        uint256[] memory upc19MintedIds = new uint256[](4);
        for (uint256 i = 0; i < 4; i++) {
            upc19MintedIds[i] = mintedIds[18 + i];
        }
        // UPC 20 minted tokenIds (2 items)
        uint256[] memory upc20MintedIds = new uint256[](2);
        for (uint256 i = 0; i < 2; i++) {
            upc20MintedIds[i] = mintedIds[22 + i];
        }
        // UPC 25 minted tokenIds (1 items)
        uint256[] memory upc25MintedIds = new uint256[](1);
        for (uint256 i = 0; i < 1; i++) {
            upc25MintedIds[i] = mintedIds[24 + i];
        }
        // UPC 28 minted tokenIds (2 items)
        uint256[] memory upc28MintedIds = new uint256[](2);
        for (uint256 i = 0; i < 2; i++) {
            upc28MintedIds[i] = mintedIds[25 + i];
        }
        // UPC 31 minted tokenIds (2 items)
        uint256[] memory upc31MintedIds = new uint256[](2);
        for (uint256 i = 0; i < 2; i++) {
            upc31MintedIds[i] = mintedIds[27 + i];
        }
        // UPC 32 minted tokenIds (1 items)
        uint256[] memory upc32MintedIds = new uint256[](1);
        for (uint256 i = 0; i < 1; i++) {
            upc32MintedIds[i] = mintedIds[29 + i];
        }
        // UPC 38 minted tokenIds (1 items)
        uint256[] memory upc38MintedIds = new uint256[](1);
        for (uint256 i = 0; i < 1; i++) {
            upc38MintedIds[i] = mintedIds[30 + i];
        }
        // UPC 39 minted tokenIds (1 items)
        uint256[] memory upc39MintedIds = new uint256[](1);
        for (uint256 i = 0; i < 1; i++) {
            upc39MintedIds[i] = mintedIds[31 + i];
        }
        // UPC 43 minted tokenIds (1 items)
        uint256[] memory upc43MintedIds = new uint256[](1);
        for (uint256 i = 0; i < 1; i++) {
            upc43MintedIds[i] = mintedIds[32 + i];
        }
        // UPC 47 minted tokenIds (27 items)
        uint256[] memory upc47MintedIds = new uint256[](27);
        for (uint256 i = 0; i < 27; i++) {
            upc47MintedIds[i] = mintedIds[33 + i];
        }
        // UPC 49 minted tokenIds (145 items)
        uint256[] memory upc49MintedIds = new uint256[](145);
        for (uint256 i = 0; i < 145; i++) {
            upc49MintedIds[i] = mintedIds[60 + i];
        }
        // Step 2: Process each Banny body and dress them
        
        // Dress Banny 3000000001 (Orange)
        {
            uint256[] memory outfitIds = new uint256[](4);
                        outfitIds[0] = upc19MintedIds[0]; // V4: 19000000001 -> V5: upc19MintedIds[0]
            outfitIds[1] = upc25MintedIds[0]; // V4: 25000000001 -> V5: upc25MintedIds[0]
            outfitIds[2] = upc38MintedIds[0]; // V4: 38000000001 -> V5: upc38MintedIds[0]
            outfitIds[3] = upc47MintedIds[0]; // V4: 47000000001 -> V5: upc47MintedIds[0]

            resolver.decorateBannyWith(
                address(hook),
                3000000001,
                upc5MintedIds[0],
                outfitIds
            );
        }
        
        // Dress Banny 4000000003 (Original)
        {
            uint256[] memory outfitIds = new uint256[](3);
                        outfitIds[0] = upc11MintedIds[0]; // V4: 11000000001 -> V5: upc11MintedIds[0]
            outfitIds[1] = upc19MintedIds[2]; // V4: 19000000003 -> V5: upc19MintedIds[2]
            outfitIds[2] = upc28MintedIds[0]; // V4: 28000000001 -> V5: upc28MintedIds[0]

            resolver.decorateBannyWith(
                address(hook),
                4000000003,
                upc6MintedIds[0],
                outfitIds
            );
        }
        
        // Dress Banny 4000000004 (Original)
        {
            uint256[] memory outfitIds = new uint256[](2);
                        outfitIds[0] = upc10MintedIds[0]; // V4: 10000000001 -> V5: upc10MintedIds[0]
            outfitIds[1] = upc20MintedIds[0]; // V4: 20000000001 -> V5: upc20MintedIds[0]

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
                        outfitIds[0] = upc31MintedIds[0]; // V4: 31000000001 -> V5: upc31MintedIds[0]
            outfitIds[1] = upc49MintedIds[1]; // V4: 49000000002 -> V5: upc49MintedIds[1]

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
                        outfitIds[0] = upc10MintedIds[1]; // V4: 10000000002 -> V5: upc10MintedIds[1]
            outfitIds[1] = upc20MintedIds[1]; // V4: 20000000002 -> V5: upc20MintedIds[1]
            outfitIds[2] = upc43MintedIds[0]; // V4: 43000000001 -> V5: upc43MintedIds[0]

            resolver.decorateBannyWith(
                address(hook),
                4000000007,
                upc5MintedIds[1],
                outfitIds
            );
        }
        
        // Dress Banny 4000000009 (Original)
        {
            uint256[] memory outfitIds = new uint256[](1);
                        outfitIds[0] = upc28MintedIds[1]; // V4: 28000000002 -> V5: upc28MintedIds[1]

            resolver.decorateBannyWith(
                address(hook),
                4000000009,
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