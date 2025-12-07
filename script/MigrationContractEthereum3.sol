// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";
import {MigrationHelper} from "./helpers/MigrationHelper.sol";

contract MigrationContractEthereum3 {
    // Define struct to hold all UPC minted tokenIds
    struct MintedIds {
        uint256[20] upc4;
        uint256[1] upc5;
        uint256[1] upc6;
        uint256[4] upc10;
        uint256[1] upc15;
        uint256[1] upc18;
        uint256[3] upc19;
        uint256[1] upc20;
        uint256[2] upc25;
        uint256[1] upc26;
        uint256[2] upc31;
        uint256[1] upc35;
        uint256[1] upc42;
        uint256[1] upc43;
        uint256[1] upc44;
        uint256[1] upc49;
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
        
        // Ethereum migration chunk 3/6 - 42 items
        
        // Step 1: Assets are already minted to this contract by the deployer
        
        
        // Assets are already minted to this contract by the deployer
        
        // Create and populate the struct
        // Token IDs follow formula: upc * 1000000000 + unitNumber (unitNumber starts at 1 per UPC)
        MintedIds memory sortedMintedIds;
        
        // Populate UPC 4 minted tokenIds (20 items)
            sortedMintedIds.upc4[0] = 4000000008; // Token ID: 4 * 1000000000 + 1
            sortedMintedIds.upc4[1] = 4000000009; // Token ID: 4 * 1000000000 + 2
            sortedMintedIds.upc4[2] = 4000000010; // Token ID: 4 * 1000000000 + 3
            sortedMintedIds.upc4[3] = 4000000011; // Token ID: 4 * 1000000000 + 4
            sortedMintedIds.upc4[4] = 4000000012; // Token ID: 4 * 1000000000 + 5
            sortedMintedIds.upc4[5] = 4000000013; // Token ID: 4 * 1000000000 + 6
            sortedMintedIds.upc4[6] = 4000000014; // Token ID: 4 * 1000000000 + 7
            sortedMintedIds.upc4[7] = 4000000015; // Token ID: 4 * 1000000000 + 8
            sortedMintedIds.upc4[8] = 4000000016; // Token ID: 4 * 1000000000 + 9
            sortedMintedIds.upc4[9] = 4000000017; // Token ID: 4 * 1000000000 + 10
            sortedMintedIds.upc4[10] = 4000000018; // Token ID: 4 * 1000000000 + 11
            sortedMintedIds.upc4[11] = 4000000019; // Token ID: 4 * 1000000000 + 12
            sortedMintedIds.upc4[12] = 4000000020; // Token ID: 4 * 1000000000 + 13
            sortedMintedIds.upc4[13] = 4000000021; // Token ID: 4 * 1000000000 + 14
            sortedMintedIds.upc4[14] = 4000000022; // Token ID: 4 * 1000000000 + 15
            sortedMintedIds.upc4[15] = 4000000023; // Token ID: 4 * 1000000000 + 16
            sortedMintedIds.upc4[16] = 4000000024; // Token ID: 4 * 1000000000 + 17
            sortedMintedIds.upc4[17] = 4000000025; // Token ID: 4 * 1000000000 + 18
            sortedMintedIds.upc4[18] = 4000000026; // Token ID: 4 * 1000000000 + 19
            sortedMintedIds.upc4[19] = 4000000027; // Token ID: 4 * 1000000000 + 20
        // Populate UPC 5 minted tokenIds (1 items)
            sortedMintedIds.upc5[0] = 5000000005; // Token ID: 5 * 1000000000 + 1
        // Populate UPC 6 minted tokenIds (1 items)
            sortedMintedIds.upc6[0] = 6000000006; // Token ID: 6 * 1000000000 + 1
        // Populate UPC 10 minted tokenIds (4 items)
            sortedMintedIds.upc10[0] = 10000000002; // Token ID: 10 * 1000000000 + 1
            sortedMintedIds.upc10[1] = 10000000003; // Token ID: 10 * 1000000000 + 2
            sortedMintedIds.upc10[2] = 10000000004; // Token ID: 10 * 1000000000 + 3
            sortedMintedIds.upc10[3] = 10000000005; // Token ID: 10 * 1000000000 + 4
        // Populate UPC 15 minted tokenIds (1 items)
            sortedMintedIds.upc15[0] = 15000000002; // Token ID: 15 * 1000000000 + 1
        // Populate UPC 18 minted tokenIds (1 items)
            sortedMintedIds.upc18[0] = 18000000002; // Token ID: 18 * 1000000000 + 1
        // Populate UPC 19 minted tokenIds (3 items)
            sortedMintedIds.upc19[0] = 19000000005; // Token ID: 19 * 1000000000 + 1
            sortedMintedIds.upc19[1] = 19000000006; // Token ID: 19 * 1000000000 + 2
            sortedMintedIds.upc19[2] = 19000000007; // Token ID: 19 * 1000000000 + 3
        // Populate UPC 20 minted tokenIds (1 items)
            sortedMintedIds.upc20[0] = 20000000001; // Token ID: 20 * 1000000000 + 1
        // Populate UPC 25 minted tokenIds (2 items)
            sortedMintedIds.upc25[0] = 25000000004; // Token ID: 25 * 1000000000 + 1
            sortedMintedIds.upc25[1] = 25000000005; // Token ID: 25 * 1000000000 + 2
        // Populate UPC 26 minted tokenIds (1 items)
            sortedMintedIds.upc26[0] = 26000000004; // Token ID: 26 * 1000000000 + 1
        // Populate UPC 31 minted tokenIds (2 items)
            sortedMintedIds.upc31[0] = 31000000003; // Token ID: 31 * 1000000000 + 1
            sortedMintedIds.upc31[1] = 31000000004; // Token ID: 31 * 1000000000 + 2
        // Populate UPC 35 minted tokenIds (1 items)
            sortedMintedIds.upc35[0] = 35000000005; // Token ID: 35 * 1000000000 + 1
        // Populate UPC 42 minted tokenIds (1 items)
            sortedMintedIds.upc42[0] = 42000000002; // Token ID: 42 * 1000000000 + 1
        // Populate UPC 43 minted tokenIds (1 items)
            sortedMintedIds.upc43[0] = 43000000004; // Token ID: 43 * 1000000000 + 1
        // Populate UPC 44 minted tokenIds (1 items)
            sortedMintedIds.upc44[0] = 44000000003; // Token ID: 44 * 1000000000 + 1
        // Populate UPC 49 minted tokenIds (1 items)
            sortedMintedIds.upc49[0] = 49000000002; // Token ID: 49 * 1000000000 + 1
        // Step 1.5: Approve resolver to transfer all tokens owned by this contract
        // The resolver needs approval to transfer outfits and backgrounds to itself during decoration
        IERC721(address(hook)).setApprovalForAll(address(resolver), true);
        
        // Step 2: Process each Banny body and dress them
        
        // Dress Banny 4000000009 (Original)
        {
            uint256[] memory outfitIds = new uint256[](4);
            outfitIds[0] = 10000000002; // V4: 10000000001 -> V5: 10000000002
            outfitIds[1] = 19000000005; // V4: 19000000002 -> V5: 19000000005
            outfitIds[2] = 25000000004; // V4: 25000000002 -> V5: 25000000004
            outfitIds[3] = 43000000004; // V4: 43000000003 -> V5: 43000000004

            resolver.decorateBannyWith(
                address(hook),
                4000000009,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000009
            );
            
        }
        
        // Dress Banny 4000000010 (Original)
        {
            uint256[] memory outfitIds = new uint256[](4);
            outfitIds[0] = 10000000003; // V4: 10000000002 -> V5: 10000000003
            outfitIds[1] = 18000000002; // V4: 18000000001 -> V5: 18000000002
            outfitIds[2] = 20000000001; // V4: 20000000001 -> V5: 20000000001
            outfitIds[3] = 44000000003; // V4: 44000000001 -> V5: 44000000003

            resolver.decorateBannyWith(
                address(hook),
                4000000010,
                5000000005,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000010
            );
            
        }
        
        // Dress Banny 4000000013 (Original)
        {
            uint256[] memory outfitIds = new uint256[](1);
            outfitIds[0] = 31000000003; // V4: 31000000002 -> V5: 31000000003

            resolver.decorateBannyWith(
                address(hook),
                4000000013,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000013
            );
            
        }
        
        // Dress Banny 4000000014 (Original)
        {
            uint256[] memory outfitIds = new uint256[](4);
            outfitIds[0] = 10000000004; // V4: 10000000006 -> V5: 10000000004
            outfitIds[1] = 19000000006; // V4: 19000000004 -> V5: 19000000006
            outfitIds[2] = 25000000005; // V4: 25000000003 -> V5: 25000000005
            outfitIds[3] = 49000000002; // V4: 49000000001 -> V5: 49000000002

            resolver.decorateBannyWith(
                address(hook),
                4000000014,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000014
            );
            
        }
        
        // Dress Banny 4000000015 (Original)
        {
            uint256[] memory outfitIds = new uint256[](2);
            outfitIds[0] = 15000000002; // V4: 15000000001 -> V5: 15000000002
            outfitIds[1] = 26000000004; // V4: 26000000002 -> V5: 26000000004

            resolver.decorateBannyWith(
                address(hook),
                4000000015,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000015
            );
            
        }
        
        // Dress Banny 4000000016 (Original)
        {
            uint256[] memory outfitIds = new uint256[](1);
            outfitIds[0] = 10000000005; // V4: 10000000007 -> V5: 10000000005

            resolver.decorateBannyWith(
                address(hook),
                4000000016,
                6000000006,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000016
            );
            
        }
        
        // Dress Banny 4000000019 (Original)
        {
            uint256[] memory outfitIds = new uint256[](3);
            outfitIds[0] = 19000000007; // V4: 19000000005 -> V5: 19000000007
            outfitIds[1] = 35000000005; // V4: 35000000003 -> V5: 35000000005
            outfitIds[2] = 42000000002; // V4: 42000000002 -> V5: 42000000002

            resolver.decorateBannyWith(
                address(hook),
                4000000019,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000019
            );
            
        }
        
        // Dress Banny 4000000023 (Original)
        {
            uint256[] memory outfitIds = new uint256[](1);
            outfitIds[0] = 31000000004; // V4: 31000000007 -> V5: 31000000004

            resolver.decorateBannyWith(
                address(hook),
                4000000023,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000023
            );
            
        }
        
        // Step 3: Transfer all assets to rightful owners using constructor data
        // Generate token IDs in the same order as items appear (matching mint order)
        // Token ID format: UPC * 1000000000 + unitNumber
        // Note: Only banny body token IDs are guaranteed to match between V4 and V5.
        // Outfits/backgrounds being worn by bannys may have different IDs, but that's OK
        // since they're not transferred (only used in decorateBannyWith calls).
        uint256[] memory generatedTokenIds = new uint256[](transferOwners.length);
        
        generatedTokenIds[0] = 4000000008; // Token ID (V4: 4000000008)
        generatedTokenIds[1] = 4000000009; // Token ID (V4: 4000000009)
        generatedTokenIds[2] = 4000000010; // Token ID (V4: 4000000010)
        generatedTokenIds[3] = 4000000011; // Token ID (V4: 4000000011)
        generatedTokenIds[4] = 4000000012; // Token ID (V4: 4000000012)
        generatedTokenIds[5] = 4000000013; // Token ID (V4: 4000000013)
        generatedTokenIds[6] = 4000000014; // Token ID (V4: 4000000014)
        generatedTokenIds[7] = 4000000015; // Token ID (V4: 4000000015)
        generatedTokenIds[8] = 4000000016; // Token ID (V4: 4000000016)
        generatedTokenIds[9] = 4000000017; // Token ID (V4: 4000000017)
        generatedTokenIds[10] = 4000000018; // Token ID (V4: 4000000018)
        generatedTokenIds[11] = 4000000019; // Token ID (V4: 4000000019)
        generatedTokenIds[12] = 4000000020; // Token ID (V4: 4000000020)
        generatedTokenIds[13] = 4000000021; // Token ID (V4: 4000000021)
        generatedTokenIds[14] = 4000000022; // Token ID (V4: 4000000022)
        generatedTokenIds[15] = 4000000023; // Token ID (V4: 4000000023)
        generatedTokenIds[16] = 4000000024; // Token ID (V4: 4000000024)
        generatedTokenIds[17] = 4000000025; // Token ID (V4: 4000000025)
        generatedTokenIds[18] = 4000000026; // Token ID (V4: 4000000026)
        generatedTokenIds[19] = 4000000027; // Token ID (V4: 4000000027)
        
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