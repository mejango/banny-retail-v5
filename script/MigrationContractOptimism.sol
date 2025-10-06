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
        address resolverAddress
    ) external {
        address deployer = msg.sender;
        
        // Validate addresses
        require(hookAddress != address(0), "Hook address not set");
        require(resolverAddress != address(0), "Resolver address not set");
        
        JB721TiersHook hook = JB721TiersHook(hookAddress);
        Banny721TokenUriResolver resolver = Banny721TokenUriResolver(resolverAddress);
        
        // Optimism migration - 11 items
        
        // Step 1: Mint all assets to deployer initially
        
        // Create array of all tierIds to mint
        uint256[] memory allTierIds = new uint256[](11);
        uint256 tierIndex = 0;
        
        // Add 2 instances of UPC 3
        for (uint256 i = 0; i < 2; i++) {
            allTierIds[tierIndex] = 3;
            tierIndex++;
        }
        // Add 3 instances of UPC 4
        for (uint256 i = 0; i < 3; i++) {
            allTierIds[tierIndex] = 4;
            tierIndex++;
        }
        // Add 1 instances of UPC 11
        for (uint256 i = 0; i < 1; i++) {
            allTierIds[tierIndex] = 11;
            tierIndex++;
        }
        // Add 1 instances of UPC 17
        for (uint256 i = 0; i < 1; i++) {
            allTierIds[tierIndex] = 17;
            tierIndex++;
        }
        // Add 1 instances of UPC 19
        for (uint256 i = 0; i < 1; i++) {
            allTierIds[tierIndex] = 19;
            tierIndex++;
        }
        // Add 1 instances of UPC 25
        for (uint256 i = 0; i < 1; i++) {
            allTierIds[tierIndex] = 25;
            tierIndex++;
        }
        // Add 1 instances of UPC 44
        for (uint256 i = 0; i < 1; i++) {
            allTierIds[tierIndex] = 44;
            tierIndex++;
        }
        // Add 1 instances of UPC 47
        for (uint256 i = 0; i < 1; i++) {
            allTierIds[tierIndex] = 47;
            tierIndex++;
        }
        
        // Mint all tierIds at once
        uint256[] memory mintedIds = hook.mintFor(allTierIds, deployer);
        
        // UPC 3 minted tokenIds (2 items)
        uint256[] memory upc3MintedIds = new uint256[](2);
        for (uint256 i = 0; i < 2; i++) {
            upc3MintedIds[i] = mintedIds[0 + i];
        }
        // UPC 4 minted tokenIds (3 items)
        uint256[] memory upc4MintedIds = new uint256[](3);
        for (uint256 i = 0; i < 3; i++) {
            upc4MintedIds[i] = mintedIds[2 + i];
        }
        // UPC 11 minted tokenIds (1 items)
        uint256[] memory upc11MintedIds = new uint256[](1);
        for (uint256 i = 0; i < 1; i++) {
            upc11MintedIds[i] = mintedIds[5 + i];
        }
        // UPC 17 minted tokenIds (1 items)
        uint256[] memory upc17MintedIds = new uint256[](1);
        for (uint256 i = 0; i < 1; i++) {
            upc17MintedIds[i] = mintedIds[6 + i];
        }
        // UPC 19 minted tokenIds (1 items)
        uint256[] memory upc19MintedIds = new uint256[](1);
        for (uint256 i = 0; i < 1; i++) {
            upc19MintedIds[i] = mintedIds[7 + i];
        }
        // UPC 25 minted tokenIds (1 items)
        uint256[] memory upc25MintedIds = new uint256[](1);
        for (uint256 i = 0; i < 1; i++) {
            upc25MintedIds[i] = mintedIds[8 + i];
        }
        // UPC 44 minted tokenIds (1 items)
        uint256[] memory upc44MintedIds = new uint256[](1);
        for (uint256 i = 0; i < 1; i++) {
            upc44MintedIds[i] = mintedIds[9 + i];
        }
        // UPC 47 minted tokenIds (1 items)
        uint256[] memory upc47MintedIds = new uint256[](1);
        for (uint256 i = 0; i < 1; i++) {
            upc47MintedIds[i] = mintedIds[10 + i];
        }
        // Step 2: Process each Banny body and dress them
        
        // Dress Banny 3000000001 (Orange)
        {
            uint256[] memory outfitIds = new uint256[](4);
                        outfitIds[0] = upc11MintedIds[0]; // V4: 11000000001 -> V5: upc11MintedIds[0]
            outfitIds[1] = upc19MintedIds[0]; // V4: 19000000001 -> V5: upc19MintedIds[0]
            outfitIds[2] = upc25MintedIds[0]; // V4: 25000000001 -> V5: upc25MintedIds[0]
            outfitIds[3] = upc44MintedIds[0]; // V4: 44000000001 -> V5: upc44MintedIds[0]

            resolver.decorateBannyWith(
                address(hook),
                3000000001,
                0,
                outfitIds
            );
        }
        
        // Dress Banny 4000000001 (Original)
        {
            uint256[] memory outfitIds = new uint256[](1);
                        outfitIds[0] = upc47MintedIds[0]; // V4: 47000000001 -> V5: upc47MintedIds[0]

            resolver.decorateBannyWith(
                address(hook),
                4000000001,
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