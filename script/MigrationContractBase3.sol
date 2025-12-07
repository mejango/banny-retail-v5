// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";
import {MigrationHelper} from "./helpers/MigrationHelper.sol";

contract MigrationContractBase3 {
    // Define struct to hold all UPC minted tokenIds
    struct MintedIds {
        uint256[35] upc4;
        uint256[2] upc5;
        uint256[1] upc10;
        uint256[1] upc13;
        uint256[2] upc19;
        uint256[1] upc20;
        uint256[2] upc25;
        uint256[1] upc27;
        uint256[1] upc28;
        uint256[1] upc35;
        uint256[1] upc38;
        uint256[1] upc39;
        uint256[1] upc41;
        uint256[3] upc43;
        uint256[1] upc44;
        uint256[1] upc48;
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
        address fallbackV4ResolverAddress
    ) external {
        
        // Validate addresses
        require(hookAddress != address(0), "Hook address not set");
        require(resolverAddress != address(0), "Resolver address not set");
        require(v4HookAddress != address(0), "V4 Hook address not set");
        require(v4ResolverAddress != address(0), "V4 Resolver address not set");
        require(fallbackV4ResolverAddress != address(0), "V4 fallback resolver address not set");
        
        JB721TiersHook hook = JB721TiersHook(hookAddress);
        Banny721TokenUriResolver resolver = Banny721TokenUriResolver(resolverAddress);
        IERC721 v4Hook = IERC721(v4HookAddress);
        Banny721TokenUriResolver v4Resolver = Banny721TokenUriResolver(v4ResolverAddress);
        Banny721TokenUriResolver fallbackV4Resolver = Banny721TokenUriResolver(fallbackV4ResolverAddress);
        
        // Base migration chunk 3/3 - 55 items
        
        // Step 1: Assets are already minted to this contract by the deployer
        
        
        // Assets are already minted to this contract by the deployer
        
        // Create and populate the struct
        // Token IDs follow formula: upc * 1000000000 + unitNumber (unitNumber starts at 1 per UPC)
        MintedIds memory sortedMintedIds;
        
        // Populate UPC 4 minted tokenIds (35 items)
            sortedMintedIds.upc4[0] = 4000000060; // Token ID: 4 * 1000000000 + 1
            sortedMintedIds.upc4[1] = 4000000061; // Token ID: 4 * 1000000000 + 2
            sortedMintedIds.upc4[2] = 4000000062; // Token ID: 4 * 1000000000 + 3
            sortedMintedIds.upc4[3] = 4000000063; // Token ID: 4 * 1000000000 + 4
            sortedMintedIds.upc4[4] = 4000000064; // Token ID: 4 * 1000000000 + 5
            sortedMintedIds.upc4[5] = 4000000065; // Token ID: 4 * 1000000000 + 6
            sortedMintedIds.upc4[6] = 4000000066; // Token ID: 4 * 1000000000 + 7
            sortedMintedIds.upc4[7] = 4000000067; // Token ID: 4 * 1000000000 + 8
            sortedMintedIds.upc4[8] = 4000000068; // Token ID: 4 * 1000000000 + 9
            sortedMintedIds.upc4[9] = 4000000069; // Token ID: 4 * 1000000000 + 10
            sortedMintedIds.upc4[10] = 4000000070; // Token ID: 4 * 1000000000 + 11
            sortedMintedIds.upc4[11] = 4000000071; // Token ID: 4 * 1000000000 + 12
            sortedMintedIds.upc4[12] = 4000000072; // Token ID: 4 * 1000000000 + 13
            sortedMintedIds.upc4[13] = 4000000073; // Token ID: 4 * 1000000000 + 14
            sortedMintedIds.upc4[14] = 4000000074; // Token ID: 4 * 1000000000 + 15
            sortedMintedIds.upc4[15] = 4000000075; // Token ID: 4 * 1000000000 + 16
            sortedMintedIds.upc4[16] = 4000000076; // Token ID: 4 * 1000000000 + 17
            sortedMintedIds.upc4[17] = 4000000077; // Token ID: 4 * 1000000000 + 18
            sortedMintedIds.upc4[18] = 4000000078; // Token ID: 4 * 1000000000 + 19
            sortedMintedIds.upc4[19] = 4000000079; // Token ID: 4 * 1000000000 + 20
            sortedMintedIds.upc4[20] = 4000000080; // Token ID: 4 * 1000000000 + 21
            sortedMintedIds.upc4[21] = 4000000081; // Token ID: 4 * 1000000000 + 22
            sortedMintedIds.upc4[22] = 4000000082; // Token ID: 4 * 1000000000 + 23
            sortedMintedIds.upc4[23] = 4000000083; // Token ID: 4 * 1000000000 + 24
            sortedMintedIds.upc4[24] = 4000000084; // Token ID: 4 * 1000000000 + 25
            sortedMintedIds.upc4[25] = 4000000085; // Token ID: 4 * 1000000000 + 26
            sortedMintedIds.upc4[26] = 4000000086; // Token ID: 4 * 1000000000 + 27
            sortedMintedIds.upc4[27] = 4000000087; // Token ID: 4 * 1000000000 + 28
            sortedMintedIds.upc4[28] = 4000000088; // Token ID: 4 * 1000000000 + 29
            sortedMintedIds.upc4[29] = 4000000089; // Token ID: 4 * 1000000000 + 30
            sortedMintedIds.upc4[30] = 4000000090; // Token ID: 4 * 1000000000 + 31
            sortedMintedIds.upc4[31] = 4000000091; // Token ID: 4 * 1000000000 + 32
            sortedMintedIds.upc4[32] = 4000000092; // Token ID: 4 * 1000000000 + 33
            sortedMintedIds.upc4[33] = 4000000093; // Token ID: 4 * 1000000000 + 34
            sortedMintedIds.upc4[34] = 4000000094; // Token ID: 4 * 1000000000 + 35
        // Populate UPC 5 minted tokenIds (2 items)
            sortedMintedIds.upc5[0] = 5000000002; // Token ID: 5 * 1000000000 + 1
            sortedMintedIds.upc5[1] = 5000000003; // Token ID: 5 * 1000000000 + 2
        // Populate UPC 10 minted tokenIds (1 items)
            sortedMintedIds.upc10[0] = 10000000005; // Token ID: 10 * 1000000000 + 1
        // Populate UPC 13 minted tokenIds (1 items)
            sortedMintedIds.upc13[0] = 13000000001; // Token ID: 13 * 1000000000 + 1
        // Populate UPC 19 minted tokenIds (2 items)
            sortedMintedIds.upc19[0] = 19000000006; // Token ID: 19 * 1000000000 + 1
            sortedMintedIds.upc19[1] = 19000000007; // Token ID: 19 * 1000000000 + 2
        // Populate UPC 20 minted tokenIds (1 items)
            sortedMintedIds.upc20[0] = 20000000001; // Token ID: 20 * 1000000000 + 1
        // Populate UPC 25 minted tokenIds (2 items)
            sortedMintedIds.upc25[0] = 25000000007; // Token ID: 25 * 1000000000 + 1
            sortedMintedIds.upc25[1] = 25000000008; // Token ID: 25 * 1000000000 + 2
        // Populate UPC 27 minted tokenIds (1 items)
            sortedMintedIds.upc27[0] = 27000000001; // Token ID: 27 * 1000000000 + 1
        // Populate UPC 28 minted tokenIds (1 items)
            sortedMintedIds.upc28[0] = 28000000006; // Token ID: 28 * 1000000000 + 1
        // Populate UPC 35 minted tokenIds (1 items)
            sortedMintedIds.upc35[0] = 35000000001; // Token ID: 35 * 1000000000 + 1
        // Populate UPC 38 minted tokenIds (1 items)
            sortedMintedIds.upc38[0] = 38000000002; // Token ID: 38 * 1000000000 + 1
        // Populate UPC 39 minted tokenIds (1 items)
            sortedMintedIds.upc39[0] = 39000000001; // Token ID: 39 * 1000000000 + 1
        // Populate UPC 41 minted tokenIds (1 items)
            sortedMintedIds.upc41[0] = 41000000001; // Token ID: 41 * 1000000000 + 1
        // Populate UPC 43 minted tokenIds (3 items)
            sortedMintedIds.upc43[0] = 43000000004; // Token ID: 43 * 1000000000 + 1
            sortedMintedIds.upc43[1] = 43000000005; // Token ID: 43 * 1000000000 + 2
            sortedMintedIds.upc43[2] = 43000000006; // Token ID: 43 * 1000000000 + 3
        // Populate UPC 44 minted tokenIds (1 items)
            sortedMintedIds.upc44[0] = 44000000003; // Token ID: 44 * 1000000000 + 1
        // Populate UPC 48 minted tokenIds (1 items)
            sortedMintedIds.upc48[0] = 48000000001; // Token ID: 48 * 1000000000 + 1
        // Step 1.5: Approve resolver to transfer all tokens owned by this contract
        // The resolver needs approval to transfer outfits and backgrounds to itself during decoration
        IERC721(address(hook)).setApprovalForAll(address(resolver), true);
        
        // Step 2: Process each Banny body and dress them
        
        // Dress Banny 4000000073 (Original)
        {
            uint256[] memory outfitIds = new uint256[](4);
            outfitIds[0] = 10000000005; // V4: 10000000007 -> V5: 10000000005
            outfitIds[1] = 19000000006; // V4: 19000000006 -> V5: 19000000006
            outfitIds[2] = 25000000007; // V4: 25000000006 -> V5: 25000000007
            outfitIds[3] = 43000000004; // V4: 43000000005 -> V5: 43000000004

            resolver.decorateBannyWith(
                address(hook),
                4000000073,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000073
            );
            
        }
        
        // Dress Banny 4000000079 (Original)
        {
            uint256[] memory outfitIds = new uint256[](3);
            outfitIds[0] = 27000000001; // V4: 27000000001 -> V5: 27000000001
            outfitIds[1] = 38000000002; // V4: 38000000002 -> V5: 38000000002
            outfitIds[2] = 48000000001; // V4: 48000000001 -> V5: 48000000001

            resolver.decorateBannyWith(
                address(hook),
                4000000079,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000079
            );
            
        }
        
        // Dress Banny 4000000080 (Original)
        {
            uint256[] memory outfitIds = new uint256[](3);
            outfitIds[0] = 13000000001; // V4: 13000000001 -> V5: 13000000001
            outfitIds[1] = 20000000001; // V4: 20000000001 -> V5: 20000000001
            outfitIds[2] = 44000000003; // V4: 44000000004 -> V5: 44000000003

            resolver.decorateBannyWith(
                address(hook),
                4000000080,
                5000000002,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000080
            );
            
        }
        
        // Dress Banny 4000000081 (Original)
        {
            uint256[] memory outfitIds = new uint256[](4);
            outfitIds[0] = 19000000007; // V4: 19000000008 -> V5: 19000000007
            outfitIds[1] = 25000000008; // V4: 25000000007 -> V5: 25000000008
            outfitIds[2] = 35000000001; // V4: 35000000002 -> V5: 35000000001
            outfitIds[3] = 43000000005; // V4: 43000000006 -> V5: 43000000005

            resolver.decorateBannyWith(
                address(hook),
                4000000081,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000081
            );
            
        }
        
        // Dress Banny 4000000082 (Original)
        {
            uint256[] memory outfitIds = new uint256[](1);
            outfitIds[0] = 43000000006; // V4: 43000000007 -> V5: 43000000006

            resolver.decorateBannyWith(
                address(hook),
                4000000082,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000082
            );
            
        }
        
        // Dress Banny 4000000084 (Original)
        {
            uint256[] memory outfitIds = new uint256[](2);
            outfitIds[0] = 39000000001; // V4: 39000000001 -> V5: 39000000001
            outfitIds[1] = 41000000001; // V4: 41000000001 -> V5: 41000000001

            resolver.decorateBannyWith(
                address(hook),
                4000000084,
                5000000003,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000084
            );
            
        }
        
        // Dress Banny 4000000085 (Original)
        {
            uint256[] memory outfitIds = new uint256[](1);
            outfitIds[0] = 28000000006; // V4: 28000000008 -> V5: 28000000006

            resolver.decorateBannyWith(
                address(hook),
                4000000085,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000085
            );
            
        }
        
        // Step 3: Transfer all assets to rightful owners using constructor data
        // Generate token IDs in the same order as items appear (matching mint order)
        // Token ID format: UPC * 1000000000 + unitNumber
        // Note: Only banny body token IDs are guaranteed to match between V4 and V5.
        // Outfits/backgrounds being worn by bannys may have different IDs, but that's OK
        // since they're not transferred (only used in decorateBannyWith calls).
        uint256[] memory generatedTokenIds = new uint256[](transferOwners.length);
        
        generatedTokenIds[0] = 4000000060; // Token ID (V4: 4000000060)
        generatedTokenIds[1] = 4000000061; // Token ID (V4: 4000000061)
        generatedTokenIds[2] = 4000000062; // Token ID (V4: 4000000062)
        generatedTokenIds[3] = 4000000063; // Token ID (V4: 4000000063)
        generatedTokenIds[4] = 4000000064; // Token ID (V4: 4000000064)
        generatedTokenIds[5] = 4000000065; // Token ID (V4: 4000000065)
        generatedTokenIds[6] = 4000000066; // Token ID (V4: 4000000066)
        generatedTokenIds[7] = 4000000067; // Token ID (V4: 4000000067)
        generatedTokenIds[8] = 4000000068; // Token ID (V4: 4000000068)
        generatedTokenIds[9] = 4000000069; // Token ID (V4: 4000000069)
        generatedTokenIds[10] = 4000000070; // Token ID (V4: 4000000070)
        generatedTokenIds[11] = 4000000071; // Token ID (V4: 4000000071)
        generatedTokenIds[12] = 4000000072; // Token ID (V4: 4000000072)
        generatedTokenIds[13] = 4000000073; // Token ID (V4: 4000000073)
        generatedTokenIds[14] = 4000000074; // Token ID (V4: 4000000074)
        generatedTokenIds[15] = 4000000075; // Token ID (V4: 4000000075)
        generatedTokenIds[16] = 4000000076; // Token ID (V4: 4000000076)
        generatedTokenIds[17] = 4000000077; // Token ID (V4: 4000000077)
        generatedTokenIds[18] = 4000000078; // Token ID (V4: 4000000078)
        generatedTokenIds[19] = 4000000079; // Token ID (V4: 4000000079)
        generatedTokenIds[20] = 4000000080; // Token ID (V4: 4000000080)
        generatedTokenIds[21] = 4000000081; // Token ID (V4: 4000000081)
        generatedTokenIds[22] = 4000000082; // Token ID (V4: 4000000082)
        generatedTokenIds[23] = 4000000083; // Token ID (V4: 4000000083)
        generatedTokenIds[24] = 4000000084; // Token ID (V4: 4000000084)
        generatedTokenIds[25] = 4000000085; // Token ID (V4: 4000000085)
        generatedTokenIds[26] = 4000000086; // Token ID (V4: 4000000086)
        generatedTokenIds[27] = 4000000087; // Token ID (V4: 4000000087)
        generatedTokenIds[28] = 4000000088; // Token ID (V4: 4000000088)
        generatedTokenIds[29] = 4000000089; // Token ID (V4: 4000000089)
        generatedTokenIds[30] = 4000000090; // Token ID (V4: 4000000090)
        generatedTokenIds[31] = 4000000091; // Token ID (V4: 4000000091)
        generatedTokenIds[32] = 4000000092; // Token ID (V4: 4000000092)
        generatedTokenIds[33] = 4000000093; // Token ID (V4: 4000000093)
        generatedTokenIds[34] = 4000000094; // Token ID (V4: 4000000094)
        
        uint256 successfulTransfers = 0;
        uint256 skippedResolverOwned = 0;
        
        for (uint256 i = 0; i < transferOwners.length; i++) {
            uint256 tokenId = generatedTokenIds[i];
            // Verify V4 ownership before transferring V5
            address v4Owner = v4Hook.ownerOf(tokenId);
            require(v4Owner == transferOwners[i] || v4Owner == address(fallbackV4ResolverAddress), "V4/V5 ownership mismatch for token");
            
            // Skip transfer if V4 owner is the resolver (resolver holds these tokens, we shouldn't transfer to resolver)
            if (v4Owner == address(v4ResolverAddress) || v4Owner == address(fallbackV4ResolverAddress)) {
                // Token is held by resolver, skip transfer
                skippedResolverOwned++;
                continue;
            }
            
            IERC721(address(hook)).safeTransferFrom(
                address(this), 
                transferOwners[i], 
                tokenId
            );
            successfulTransfers++;
        }
        
        // Verify all expected items were processed (transferred or skipped as expected)
        require(
            successfulTransfers + skippedResolverOwned == transferOwners.length,
            "Not all items were processed"
        );
        
        // Final verification: Ensure this contract no longer owns any tokens
        // This ensures all transfers completed successfully and no tokens were left behind
        require(hook.balanceOf(address(this)) == 0, "Contract still owns tokens after migration");
    }
}