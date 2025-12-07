// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";
import {MigrationHelper} from "./helpers/MigrationHelper.sol";

contract MigrationContractBase2 {
    // Define struct to hold all UPC minted tokenIds
    struct MintedIds {
        uint256[36] upc4;
        uint256[3] upc10;
        uint256[1] upc14;
        uint256[1] upc19;
        uint256[2] upc25;
        uint256[1] upc28;
        uint256[1] upc31;
        uint256[1] upc38;
        uint256[2] upc43;
        uint256[1] upc47;
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
        
        // Base migration chunk 2/3 - 49 items
        
        // Step 1: Assets are already minted to this contract by the deployer
        
        
        // Assets are already minted to this contract by the deployer
        
        // Create and populate the struct
        // Token IDs follow formula: upc * 1000000000 + unitNumber (unitNumber starts at 1 per UPC)
        MintedIds memory sortedMintedIds;
        
        // Populate UPC 4 minted tokenIds (36 items)
            sortedMintedIds.upc4[0] = 4000000024; // Token ID: 4 * 1000000000 + 1
            sortedMintedIds.upc4[1] = 4000000025; // Token ID: 4 * 1000000000 + 2
            sortedMintedIds.upc4[2] = 4000000026; // Token ID: 4 * 1000000000 + 3
            sortedMintedIds.upc4[3] = 4000000027; // Token ID: 4 * 1000000000 + 4
            sortedMintedIds.upc4[4] = 4000000028; // Token ID: 4 * 1000000000 + 5
            sortedMintedIds.upc4[5] = 4000000029; // Token ID: 4 * 1000000000 + 6
            sortedMintedIds.upc4[6] = 4000000030; // Token ID: 4 * 1000000000 + 7
            sortedMintedIds.upc4[7] = 4000000031; // Token ID: 4 * 1000000000 + 8
            sortedMintedIds.upc4[8] = 4000000032; // Token ID: 4 * 1000000000 + 9
            sortedMintedIds.upc4[9] = 4000000033; // Token ID: 4 * 1000000000 + 10
            sortedMintedIds.upc4[10] = 4000000034; // Token ID: 4 * 1000000000 + 11
            sortedMintedIds.upc4[11] = 4000000035; // Token ID: 4 * 1000000000 + 12
            sortedMintedIds.upc4[12] = 4000000036; // Token ID: 4 * 1000000000 + 13
            sortedMintedIds.upc4[13] = 4000000037; // Token ID: 4 * 1000000000 + 14
            sortedMintedIds.upc4[14] = 4000000038; // Token ID: 4 * 1000000000 + 15
            sortedMintedIds.upc4[15] = 4000000039; // Token ID: 4 * 1000000000 + 16
            sortedMintedIds.upc4[16] = 4000000040; // Token ID: 4 * 1000000000 + 17
            sortedMintedIds.upc4[17] = 4000000041; // Token ID: 4 * 1000000000 + 18
            sortedMintedIds.upc4[18] = 4000000042; // Token ID: 4 * 1000000000 + 19
            sortedMintedIds.upc4[19] = 4000000043; // Token ID: 4 * 1000000000 + 20
            sortedMintedIds.upc4[20] = 4000000044; // Token ID: 4 * 1000000000 + 21
            sortedMintedIds.upc4[21] = 4000000045; // Token ID: 4 * 1000000000 + 22
            sortedMintedIds.upc4[22] = 4000000046; // Token ID: 4 * 1000000000 + 23
            sortedMintedIds.upc4[23] = 4000000047; // Token ID: 4 * 1000000000 + 24
            sortedMintedIds.upc4[24] = 4000000048; // Token ID: 4 * 1000000000 + 25
            sortedMintedIds.upc4[25] = 4000000049; // Token ID: 4 * 1000000000 + 26
            sortedMintedIds.upc4[26] = 4000000050; // Token ID: 4 * 1000000000 + 27
            sortedMintedIds.upc4[27] = 4000000051; // Token ID: 4 * 1000000000 + 28
            sortedMintedIds.upc4[28] = 4000000052; // Token ID: 4 * 1000000000 + 29
            sortedMintedIds.upc4[29] = 4000000053; // Token ID: 4 * 1000000000 + 30
            sortedMintedIds.upc4[30] = 4000000054; // Token ID: 4 * 1000000000 + 31
            sortedMintedIds.upc4[31] = 4000000055; // Token ID: 4 * 1000000000 + 32
            sortedMintedIds.upc4[32] = 4000000056; // Token ID: 4 * 1000000000 + 33
            sortedMintedIds.upc4[33] = 4000000057; // Token ID: 4 * 1000000000 + 34
            sortedMintedIds.upc4[34] = 4000000058; // Token ID: 4 * 1000000000 + 35
            sortedMintedIds.upc4[35] = 4000000059; // Token ID: 4 * 1000000000 + 36
        // Populate UPC 10 minted tokenIds (3 items)
            sortedMintedIds.upc10[0] = 10000000002; // Token ID: 10 * 1000000000 + 1
            sortedMintedIds.upc10[1] = 10000000003; // Token ID: 10 * 1000000000 + 2
            sortedMintedIds.upc10[2] = 10000000004; // Token ID: 10 * 1000000000 + 3
        // Populate UPC 14 minted tokenIds (1 items)
            sortedMintedIds.upc14[0] = 14000000003; // Token ID: 14 * 1000000000 + 1
        // Populate UPC 19 minted tokenIds (1 items)
            sortedMintedIds.upc19[0] = 19000000005; // Token ID: 19 * 1000000000 + 1
        // Populate UPC 25 minted tokenIds (2 items)
            sortedMintedIds.upc25[0] = 25000000005; // Token ID: 25 * 1000000000 + 1
            sortedMintedIds.upc25[1] = 25000000006; // Token ID: 25 * 1000000000 + 2
        // Populate UPC 28 minted tokenIds (1 items)
            sortedMintedIds.upc28[0] = 28000000005; // Token ID: 28 * 1000000000 + 1
        // Populate UPC 31 minted tokenIds (1 items)
            sortedMintedIds.upc31[0] = 31000000002; // Token ID: 31 * 1000000000 + 1
        // Populate UPC 38 minted tokenIds (1 items)
            sortedMintedIds.upc38[0] = 38000000001; // Token ID: 38 * 1000000000 + 1
        // Populate UPC 43 minted tokenIds (2 items)
            sortedMintedIds.upc43[0] = 43000000002; // Token ID: 43 * 1000000000 + 1
            sortedMintedIds.upc43[1] = 43000000003; // Token ID: 43 * 1000000000 + 2
        // Populate UPC 47 minted tokenIds (1 items)
            sortedMintedIds.upc47[0] = 47000000003; // Token ID: 47 * 1000000000 + 1
        // Step 1.5: Approve resolver to transfer all tokens owned by this contract
        // The resolver needs approval to transfer outfits and backgrounds to itself during decoration
        IERC721(address(hook)).setApprovalForAll(address(resolver), true);
        
        // Step 2: Process each Banny body and dress them
        
        // Dress Banny 4000000045 (Original)
        {
            uint256[] memory outfitIds = new uint256[](3);
            outfitIds[0] = 10000000002; // V4: 10000000001 -> V5: 10000000002
            outfitIds[1] = 25000000005; // V4: 25000000002 -> V5: 25000000005
            outfitIds[2] = 43000000002; // V4: 43000000002 -> V5: 43000000002

            resolver.decorateBannyWith(
                address(hook),
                4000000045,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000045
            );
            
        }
        
        // Dress Banny 4000000046 (Original)
        {
            uint256[] memory outfitIds = new uint256[](1);
            outfitIds[0] = 47000000003; // V4: 47000000001 -> V5: 47000000003

            resolver.decorateBannyWith(
                address(hook),
                4000000046,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000046
            );
            
        }
        
        // Dress Banny 4000000048 (Original)
        {
            uint256[] memory outfitIds = new uint256[](3);
            outfitIds[0] = 10000000003; // V4: 10000000003 -> V5: 10000000003
            outfitIds[1] = 19000000005; // V4: 19000000003 -> V5: 19000000005
            outfitIds[2] = 28000000005; // V4: 28000000004 -> V5: 28000000005

            resolver.decorateBannyWith(
                address(hook),
                4000000048,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000048
            );
            
        }
        
        // Dress Banny 4000000049 (Original)
        {
            uint256[] memory outfitIds = new uint256[](1);
            outfitIds[0] = 10000000004; // V4: 10000000004 -> V5: 10000000004

            resolver.decorateBannyWith(
                address(hook),
                4000000049,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000049
            );
            
        }
        
        // Dress Banny 4000000050 (Original)
        {
            uint256[] memory outfitIds = new uint256[](4);
            outfitIds[0] = 14000000003; // V4: 14000000001 -> V5: 14000000003
            outfitIds[1] = 31000000002; // V4: 31000000001 -> V5: 31000000002
            outfitIds[2] = 38000000001; // V4: 38000000001 -> V5: 38000000001
            outfitIds[3] = 43000000003; // V4: 43000000003 -> V5: 43000000003

            resolver.decorateBannyWith(
                address(hook),
                4000000050,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000050
            );
            
        }
        
        // Dress Banny 4000000054 (Original)
        {
            uint256[] memory outfitIds = new uint256[](1);
            outfitIds[0] = 25000000006; // V4: 25000000005 -> V5: 25000000006

            resolver.decorateBannyWith(
                address(hook),
                4000000054,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000054
            );
            
        }
        
        // Step 3: Transfer all assets to rightful owners using constructor data
        // Generate token IDs in the same order as items appear (matching mint order)
        // Token ID format: UPC * 1000000000 + unitNumber
        // Note: Only banny body token IDs are guaranteed to match between V4 and V5.
        // Outfits/backgrounds being worn by bannys may have different IDs, but that's OK
        // since they're not transferred (only used in decorateBannyWith calls).
        uint256[] memory generatedTokenIds = new uint256[](transferOwners.length);
        
        generatedTokenIds[0] = 4000000024; // Token ID (V4: 4000000024)
        generatedTokenIds[1] = 4000000025; // Token ID (V4: 4000000025)
        generatedTokenIds[2] = 4000000026; // Token ID (V4: 4000000026)
        generatedTokenIds[3] = 4000000027; // Token ID (V4: 4000000027)
        generatedTokenIds[4] = 4000000028; // Token ID (V4: 4000000028)
        generatedTokenIds[5] = 4000000029; // Token ID (V4: 4000000029)
        generatedTokenIds[6] = 4000000030; // Token ID (V4: 4000000030)
        generatedTokenIds[7] = 4000000031; // Token ID (V4: 4000000031)
        generatedTokenIds[8] = 4000000032; // Token ID (V4: 4000000032)
        generatedTokenIds[9] = 4000000033; // Token ID (V4: 4000000033)
        generatedTokenIds[10] = 4000000034; // Token ID (V4: 4000000034)
        generatedTokenIds[11] = 4000000035; // Token ID (V4: 4000000035)
        generatedTokenIds[12] = 4000000036; // Token ID (V4: 4000000036)
        generatedTokenIds[13] = 4000000037; // Token ID (V4: 4000000037)
        generatedTokenIds[14] = 4000000038; // Token ID (V4: 4000000038)
        generatedTokenIds[15] = 4000000039; // Token ID (V4: 4000000039)
        generatedTokenIds[16] = 4000000040; // Token ID (V4: 4000000040)
        generatedTokenIds[17] = 4000000041; // Token ID (V4: 4000000041)
        generatedTokenIds[18] = 4000000042; // Token ID (V4: 4000000042)
        generatedTokenIds[19] = 4000000043; // Token ID (V4: 4000000043)
        generatedTokenIds[20] = 4000000044; // Token ID (V4: 4000000044)
        generatedTokenIds[21] = 4000000045; // Token ID (V4: 4000000045)
        generatedTokenIds[22] = 4000000046; // Token ID (V4: 4000000046)
        generatedTokenIds[23] = 4000000047; // Token ID (V4: 4000000047)
        generatedTokenIds[24] = 4000000048; // Token ID (V4: 4000000048)
        generatedTokenIds[25] = 4000000049; // Token ID (V4: 4000000049)
        generatedTokenIds[26] = 4000000050; // Token ID (V4: 4000000050)
        generatedTokenIds[27] = 4000000051; // Token ID (V4: 4000000051)
        generatedTokenIds[28] = 4000000052; // Token ID (V4: 4000000052)
        generatedTokenIds[29] = 4000000053; // Token ID (V4: 4000000053)
        generatedTokenIds[30] = 4000000054; // Token ID (V4: 4000000054)
        generatedTokenIds[31] = 4000000055; // Token ID (V4: 4000000055)
        generatedTokenIds[32] = 4000000056; // Token ID (V4: 4000000056)
        generatedTokenIds[33] = 4000000057; // Token ID (V4: 4000000057)
        generatedTokenIds[34] = 4000000058; // Token ID (V4: 4000000058)
        generatedTokenIds[35] = 4000000059; // Token ID (V4: 4000000059)
        
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