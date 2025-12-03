// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";
import {MigrationHelper} from "./helpers/MigrationHelper.sol";

contract MigrationContractEthereum1 {
    // Define struct to hold all UPC minted tokenIds
    struct MintedIds {
        uint256[1] upc1;
        uint256[6] upc2;
        uint256[26] upc3;
        uint256[7] upc4;
        uint256[4] upc5;
        uint256[5] upc6;
        uint256[2] upc7;
        uint256[1] upc10;
        uint256[3] upc14;
        uint256[1] upc15;
        uint256[1] upc17;
        uint256[1] upc18;
        uint256[4] upc19;
        uint256[1] upc21;
        uint256[1] upc23;
        uint256[3] upc25;
        uint256[3] upc26;
        uint256[1] upc28;
        uint256[1] upc29;
        uint256[2] upc31;
        uint256[2] upc32;
        uint256[4] upc35;
        uint256[2] upc37;
        uint256[1] upc38;
        uint256[2] upc39;
        uint256[1] upc42;
        uint256[3] upc43;
        uint256[2] upc44;
        uint256[1] upc46;
        uint256[1] upc47;
        uint256[2] upc48;
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
        
        // Ethereum migration chunk 1/3 - 96 items
        
        // Step 1: Assets are already minted to this contract by the deployer
        
        
        // Assets are already minted to this contract by the deployer
        
        // Create and populate the struct
        // Token IDs follow formula: upc * 1000000000 + unitNumber (unitNumber starts at 1 per UPC)
        MintedIds memory sortedMintedIds;
        
        // Populate UPC 1 minted tokenIds (1 items)
            sortedMintedIds.upc1[0] = 1000000001; // Token ID: 1 * 1000000000 + 1
        // Populate UPC 2 minted tokenIds (6 items)
            sortedMintedIds.upc2[0] = 2000000001; // Token ID: 2 * 1000000000 + 1
            sortedMintedIds.upc2[1] = 2000000002; // Token ID: 2 * 1000000000 + 2
            sortedMintedIds.upc2[2] = 2000000003; // Token ID: 2 * 1000000000 + 3
            sortedMintedIds.upc2[3] = 2000000004; // Token ID: 2 * 1000000000 + 4
            sortedMintedIds.upc2[4] = 2000000005; // Token ID: 2 * 1000000000 + 5
            sortedMintedIds.upc2[5] = 2000000006; // Token ID: 2 * 1000000000 + 6
        // Populate UPC 3 minted tokenIds (26 items)
            sortedMintedIds.upc3[0] = 3000000001; // Token ID: 3 * 1000000000 + 1
            sortedMintedIds.upc3[1] = 3000000002; // Token ID: 3 * 1000000000 + 2
            sortedMintedIds.upc3[2] = 3000000003; // Token ID: 3 * 1000000000 + 3
            sortedMintedIds.upc3[3] = 3000000004; // Token ID: 3 * 1000000000 + 4
            sortedMintedIds.upc3[4] = 3000000005; // Token ID: 3 * 1000000000 + 5
            sortedMintedIds.upc3[5] = 3000000006; // Token ID: 3 * 1000000000 + 6
            sortedMintedIds.upc3[6] = 3000000007; // Token ID: 3 * 1000000000 + 7
            sortedMintedIds.upc3[7] = 3000000008; // Token ID: 3 * 1000000000 + 8
            sortedMintedIds.upc3[8] = 3000000009; // Token ID: 3 * 1000000000 + 9
            sortedMintedIds.upc3[9] = 3000000010; // Token ID: 3 * 1000000000 + 10
            sortedMintedIds.upc3[10] = 3000000011; // Token ID: 3 * 1000000000 + 11
            sortedMintedIds.upc3[11] = 3000000012; // Token ID: 3 * 1000000000 + 12
            sortedMintedIds.upc3[12] = 3000000013; // Token ID: 3 * 1000000000 + 13
            sortedMintedIds.upc3[13] = 3000000014; // Token ID: 3 * 1000000000 + 14
            sortedMintedIds.upc3[14] = 3000000015; // Token ID: 3 * 1000000000 + 15
            sortedMintedIds.upc3[15] = 3000000016; // Token ID: 3 * 1000000000 + 16
            sortedMintedIds.upc3[16] = 3000000017; // Token ID: 3 * 1000000000 + 17
            sortedMintedIds.upc3[17] = 3000000018; // Token ID: 3 * 1000000000 + 18
            sortedMintedIds.upc3[18] = 3000000019; // Token ID: 3 * 1000000000 + 19
            sortedMintedIds.upc3[19] = 3000000020; // Token ID: 3 * 1000000000 + 20
            sortedMintedIds.upc3[20] = 3000000021; // Token ID: 3 * 1000000000 + 21
            sortedMintedIds.upc3[21] = 3000000022; // Token ID: 3 * 1000000000 + 22
            sortedMintedIds.upc3[22] = 3000000023; // Token ID: 3 * 1000000000 + 23
            sortedMintedIds.upc3[23] = 3000000024; // Token ID: 3 * 1000000000 + 24
            sortedMintedIds.upc3[24] = 3000000025; // Token ID: 3 * 1000000000 + 25
            sortedMintedIds.upc3[25] = 3000000026; // Token ID: 3 * 1000000000 + 26
        // Populate UPC 4 minted tokenIds (7 items)
            sortedMintedIds.upc4[0] = 4000000001; // Token ID: 4 * 1000000000 + 1
            sortedMintedIds.upc4[1] = 4000000002; // Token ID: 4 * 1000000000 + 2
            sortedMintedIds.upc4[2] = 4000000003; // Token ID: 4 * 1000000000 + 3
            sortedMintedIds.upc4[3] = 4000000004; // Token ID: 4 * 1000000000 + 4
            sortedMintedIds.upc4[4] = 4000000005; // Token ID: 4 * 1000000000 + 5
            sortedMintedIds.upc4[5] = 4000000006; // Token ID: 4 * 1000000000 + 6
            sortedMintedIds.upc4[6] = 4000000007; // Token ID: 4 * 1000000000 + 7
        // Populate UPC 5 minted tokenIds (4 items)
            sortedMintedIds.upc5[0] = 5000000001; // Token ID: 5 * 1000000000 + 1
            sortedMintedIds.upc5[1] = 5000000002; // Token ID: 5 * 1000000000 + 2
            sortedMintedIds.upc5[2] = 5000000003; // Token ID: 5 * 1000000000 + 3
            sortedMintedIds.upc5[3] = 5000000004; // Token ID: 5 * 1000000000 + 4
        // Populate UPC 6 minted tokenIds (5 items)
            sortedMintedIds.upc6[0] = 6000000001; // Token ID: 6 * 1000000000 + 1
            sortedMintedIds.upc6[1] = 6000000002; // Token ID: 6 * 1000000000 + 2
            sortedMintedIds.upc6[2] = 6000000003; // Token ID: 6 * 1000000000 + 3
            sortedMintedIds.upc6[3] = 6000000004; // Token ID: 6 * 1000000000 + 4
            sortedMintedIds.upc6[4] = 6000000005; // Token ID: 6 * 1000000000 + 5
        // Populate UPC 7 minted tokenIds (2 items)
            sortedMintedIds.upc7[0] = 7000000001; // Token ID: 7 * 1000000000 + 1
            sortedMintedIds.upc7[1] = 7000000002; // Token ID: 7 * 1000000000 + 2
        // Populate UPC 10 minted tokenIds (1 items)
            sortedMintedIds.upc10[0] = 10000000001; // Token ID: 10 * 1000000000 + 1
        // Populate UPC 14 minted tokenIds (3 items)
            sortedMintedIds.upc14[0] = 14000000001; // Token ID: 14 * 1000000000 + 1
            sortedMintedIds.upc14[1] = 14000000002; // Token ID: 14 * 1000000000 + 2
            sortedMintedIds.upc14[2] = 14000000003; // Token ID: 14 * 1000000000 + 3
        // Populate UPC 15 minted tokenIds (1 items)
            sortedMintedIds.upc15[0] = 15000000001; // Token ID: 15 * 1000000000 + 1
        // Populate UPC 17 minted tokenIds (1 items)
            sortedMintedIds.upc17[0] = 17000000001; // Token ID: 17 * 1000000000 + 1
        // Populate UPC 18 minted tokenIds (1 items)
            sortedMintedIds.upc18[0] = 18000000001; // Token ID: 18 * 1000000000 + 1
        // Populate UPC 19 minted tokenIds (4 items)
            sortedMintedIds.upc19[0] = 19000000001; // Token ID: 19 * 1000000000 + 1
            sortedMintedIds.upc19[1] = 19000000002; // Token ID: 19 * 1000000000 + 2
            sortedMintedIds.upc19[2] = 19000000003; // Token ID: 19 * 1000000000 + 3
            sortedMintedIds.upc19[3] = 19000000004; // Token ID: 19 * 1000000000 + 4
        // Populate UPC 21 minted tokenIds (1 items)
            sortedMintedIds.upc21[0] = 21000000001; // Token ID: 21 * 1000000000 + 1
        // Populate UPC 23 minted tokenIds (1 items)
            sortedMintedIds.upc23[0] = 23000000001; // Token ID: 23 * 1000000000 + 1
        // Populate UPC 25 minted tokenIds (3 items)
            sortedMintedIds.upc25[0] = 25000000001; // Token ID: 25 * 1000000000 + 1
            sortedMintedIds.upc25[1] = 25000000002; // Token ID: 25 * 1000000000 + 2
            sortedMintedIds.upc25[2] = 25000000003; // Token ID: 25 * 1000000000 + 3
        // Populate UPC 26 minted tokenIds (3 items)
            sortedMintedIds.upc26[0] = 26000000001; // Token ID: 26 * 1000000000 + 1
            sortedMintedIds.upc26[1] = 26000000002; // Token ID: 26 * 1000000000 + 2
            sortedMintedIds.upc26[2] = 26000000003; // Token ID: 26 * 1000000000 + 3
        // Populate UPC 28 minted tokenIds (1 items)
            sortedMintedIds.upc28[0] = 28000000001; // Token ID: 28 * 1000000000 + 1
        // Populate UPC 29 minted tokenIds (1 items)
            sortedMintedIds.upc29[0] = 29000000001; // Token ID: 29 * 1000000000 + 1
        // Populate UPC 31 minted tokenIds (2 items)
            sortedMintedIds.upc31[0] = 31000000001; // Token ID: 31 * 1000000000 + 1
            sortedMintedIds.upc31[1] = 31000000002; // Token ID: 31 * 1000000000 + 2
        // Populate UPC 32 minted tokenIds (2 items)
            sortedMintedIds.upc32[0] = 32000000001; // Token ID: 32 * 1000000000 + 1
            sortedMintedIds.upc32[1] = 32000000002; // Token ID: 32 * 1000000000 + 2
        // Populate UPC 35 minted tokenIds (4 items)
            sortedMintedIds.upc35[0] = 35000000001; // Token ID: 35 * 1000000000 + 1
            sortedMintedIds.upc35[1] = 35000000002; // Token ID: 35 * 1000000000 + 2
            sortedMintedIds.upc35[2] = 35000000003; // Token ID: 35 * 1000000000 + 3
            sortedMintedIds.upc35[3] = 35000000004; // Token ID: 35 * 1000000000 + 4
        // Populate UPC 37 minted tokenIds (2 items)
            sortedMintedIds.upc37[0] = 37000000001; // Token ID: 37 * 1000000000 + 1
            sortedMintedIds.upc37[1] = 37000000002; // Token ID: 37 * 1000000000 + 2
        // Populate UPC 38 minted tokenIds (1 items)
            sortedMintedIds.upc38[0] = 38000000001; // Token ID: 38 * 1000000000 + 1
        // Populate UPC 39 minted tokenIds (2 items)
            sortedMintedIds.upc39[0] = 39000000001; // Token ID: 39 * 1000000000 + 1
            sortedMintedIds.upc39[1] = 39000000002; // Token ID: 39 * 1000000000 + 2
        // Populate UPC 42 minted tokenIds (1 items)
            sortedMintedIds.upc42[0] = 42000000001; // Token ID: 42 * 1000000000 + 1
        // Populate UPC 43 minted tokenIds (3 items)
            sortedMintedIds.upc43[0] = 43000000001; // Token ID: 43 * 1000000000 + 1
            sortedMintedIds.upc43[1] = 43000000002; // Token ID: 43 * 1000000000 + 2
            sortedMintedIds.upc43[2] = 43000000003; // Token ID: 43 * 1000000000 + 3
        // Populate UPC 44 minted tokenIds (2 items)
            sortedMintedIds.upc44[0] = 44000000001; // Token ID: 44 * 1000000000 + 1
            sortedMintedIds.upc44[1] = 44000000002; // Token ID: 44 * 1000000000 + 2
        // Populate UPC 46 minted tokenIds (1 items)
            sortedMintedIds.upc46[0] = 46000000001; // Token ID: 46 * 1000000000 + 1
        // Populate UPC 47 minted tokenIds (1 items)
            sortedMintedIds.upc47[0] = 47000000001; // Token ID: 47 * 1000000000 + 1
        // Populate UPC 48 minted tokenIds (2 items)
            sortedMintedIds.upc48[0] = 48000000001; // Token ID: 48 * 1000000000 + 1
            sortedMintedIds.upc48[1] = 48000000002; // Token ID: 48 * 1000000000 + 2
        // Populate UPC 49 minted tokenIds (1 items)
            sortedMintedIds.upc49[0] = 49000000001; // Token ID: 49 * 1000000000 + 1
        // Step 1.5: Approve resolver to transfer all tokens owned by this contract
        // The resolver needs approval to transfer outfits and backgrounds to itself during decoration
        IERC721(address(hook)).setApprovalForAll(address(resolver), true);
        
        // Step 2: Process each Banny body and dress them
        
        // Dress Banny 1000000001 (Alien)
        {
            uint256[] memory outfitIds = new uint256[](4);
            outfitIds[0] = 7000000002; // V4: 7000000002 -> V5: 7000000002
            outfitIds[1] = 17000000001; // V4: 17000000001 -> V5: 17000000001
            outfitIds[2] = 26000000003; // V4: 26000000004 -> V5: 26000000003
            outfitIds[3] = 46000000001; // V4: 46000000001 -> V5: 46000000001

            resolver.decorateBannyWith(
                address(hook),
                1000000001,
                5000000002,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                1000000001
            );
            
        }
        
        // Dress Banny 2000000002 (Pink)
        {
            uint256[] memory outfitIds = new uint256[](5);
            outfitIds[0] = 7000000001; // V4: 7000000001 -> V5: 7000000001
            outfitIds[1] = 14000000002; // V4: 14000000003 -> V5: 14000000002
            outfitIds[2] = 19000000002; // V4: 19000000012 -> V5: 19000000002
            outfitIds[3] = 26000000002; // V4: 26000000003 -> V5: 26000000002
            outfitIds[4] = 35000000004; // V4: 35000000006 -> V5: 35000000004

            resolver.decorateBannyWith(
                address(hook),
                2000000002,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                2000000002
            );
            
        }
        
        // Dress Banny 2000000004 (Pink)
        {
            uint256[] memory outfitIds = new uint256[](1);
            outfitIds[0] = 18000000001; // V4: 18000000002 -> V5: 18000000001

            resolver.decorateBannyWith(
                address(hook),
                2000000004,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                2000000004
            );
            
        }
        
        // Dress Banny 2000000005 (Pink)
        {
            uint256[] memory outfitIds = new uint256[](1);
            outfitIds[0] = 21000000001; // V4: 21000000001 -> V5: 21000000001

            resolver.decorateBannyWith(
                address(hook),
                2000000005,
                5000000003,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                2000000005
            );
            
        }
        
        // Dress Banny 2000000006 (Pink)
        {
            uint256[] memory outfitIds = new uint256[](2);
            outfitIds[0] = 19000000004; // V4: 19000000019 -> V5: 19000000004
            outfitIds[1] = 25000000003; // V4: 25000000009 -> V5: 25000000003

            resolver.decorateBannyWith(
                address(hook),
                2000000006,
                5000000004,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                2000000006
            );
            
        }
        
        // Dress Banny 3000000001 (Orange)
        {
            uint256[] memory outfitIds = new uint256[](3);
            outfitIds[0] = 14000000001; // V4: 14000000001 -> V5: 14000000001
            outfitIds[1] = 26000000001; // V4: 26000000001 -> V5: 26000000001
            outfitIds[2] = 35000000001; // V4: 35000000001 -> V5: 35000000001

            resolver.decorateBannyWith(
                address(hook),
                3000000001,
                6000000001,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                3000000001
            );
            
        }
        
        // Dress Banny 3000000003 (Orange)
        {
            uint256[] memory outfitIds = new uint256[](2);
            outfitIds[0] = 10000000001; // V4: 10000000005 -> V5: 10000000001
            outfitIds[1] = 44000000001; // V4: 44000000003 -> V5: 44000000001

            resolver.decorateBannyWith(
                address(hook),
                3000000003,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                3000000003
            );
            
        }
        
        // Dress Banny 3000000006 (Orange)
        {
            uint256[] memory outfitIds = new uint256[](2);
            outfitIds[0] = 32000000001; // V4: 32000000001 -> V5: 32000000001
            outfitIds[1] = 44000000002; // V4: 44000000004 -> V5: 44000000002

            resolver.decorateBannyWith(
                address(hook),
                3000000006,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                3000000006
            );
            
        }
        
        // Dress Banny 3000000007 (Orange)
        {
            uint256[] memory outfitIds = new uint256[](2);
            outfitIds[0] = 31000000001; // V4: 31000000003 -> V5: 31000000001
            outfitIds[1] = 47000000001; // V4: 47000000003 -> V5: 47000000001

            resolver.decorateBannyWith(
                address(hook),
                3000000007,
                6000000002,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                3000000007
            );
            
        }
        
        // Dress Banny 3000000009 (Orange)
        {
            uint256[] memory outfitIds = new uint256[](2);
            outfitIds[0] = 35000000002; // V4: 35000000002 -> V5: 35000000002
            outfitIds[1] = 43000000001; // V4: 43000000005 -> V5: 43000000001

            resolver.decorateBannyWith(
                address(hook),
                3000000009,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                3000000009
            );
            
        }
        
        // Dress Banny 3000000010 (Orange)
        {
            uint256[] memory outfitIds = new uint256[](3);
            outfitIds[0] = 32000000002; // V4: 32000000002 -> V5: 32000000002
            outfitIds[1] = 35000000003; // V4: 35000000004 -> V5: 35000000003
            outfitIds[2] = 48000000001; // V4: 48000000001 -> V5: 48000000001

            resolver.decorateBannyWith(
                address(hook),
                3000000010,
                6000000003,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                3000000010
            );
            
        }
        
        // Dress Banny 3000000011 (Orange)
        {
            uint256[] memory outfitIds = new uint256[](3);
            outfitIds[0] = 23000000001; // V4: 23000000001 -> V5: 23000000001
            outfitIds[1] = 39000000001; // V4: 39000000001 -> V5: 39000000001
            outfitIds[2] = 43000000002; // V4: 43000000006 -> V5: 43000000002

            resolver.decorateBannyWith(
                address(hook),
                3000000011,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                3000000011
            );
            
        }
        
        // Dress Banny 3000000013 (Orange)
        {
            uint256[] memory outfitIds = new uint256[](4);
            outfitIds[0] = 19000000001; // V4: 19000000008 -> V5: 19000000001
            outfitIds[1] = 31000000002; // V4: 31000000006 -> V5: 31000000002
            outfitIds[2] = 37000000001; // V4: 37000000001 -> V5: 37000000001
            outfitIds[3] = 43000000003; // V4: 43000000007 -> V5: 43000000003

            resolver.decorateBannyWith(
                address(hook),
                3000000013,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                3000000013
            );
            
        }
        
        // Dress Banny 3000000017 (Orange)
        {
            uint256[] memory outfitIds = new uint256[](2);
            outfitIds[0] = 25000000001; // V4: 25000000005 -> V5: 25000000001
            outfitIds[1] = 49000000001; // V4: 49000000002 -> V5: 49000000001

            resolver.decorateBannyWith(
                address(hook),
                3000000017,
                5000000001,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                3000000017
            );
            
        }
        
        // Dress Banny 3000000022 (Orange)
        {
            uint256[] memory outfitIds = new uint256[](3);
            outfitIds[0] = 19000000003; // V4: 19000000015 -> V5: 19000000003
            outfitIds[1] = 38000000001; // V4: 38000000002 -> V5: 38000000001
            outfitIds[2] = 48000000002; // V4: 48000000005 -> V5: 48000000002

            resolver.decorateBannyWith(
                address(hook),
                3000000022,
                6000000004,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                3000000022
            );
            
        }
        
        // Dress Banny 3000000023 (Orange)
        {
            uint256[] memory outfitIds = new uint256[](4);
            outfitIds[0] = 14000000003; // V4: 14000000005 -> V5: 14000000003
            outfitIds[1] = 25000000002; // V4: 25000000008 -> V5: 25000000002
            outfitIds[2] = 37000000002; // V4: 37000000003 -> V5: 37000000002
            outfitIds[3] = 42000000001; // V4: 42000000007 -> V5: 42000000001

            resolver.decorateBannyWith(
                address(hook),
                3000000023,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                3000000023
            );
            
        }
        
        // Dress Banny 3000000026 (Orange)
        {
            uint256[] memory outfitIds = new uint256[](3);
            outfitIds[0] = 15000000001; // V4: 15000000004 -> V5: 15000000001
            outfitIds[1] = 29000000001; // V4: 29000000003 -> V5: 29000000001
            outfitIds[2] = 39000000002; // V4: 39000000003 -> V5: 39000000002

            resolver.decorateBannyWith(
                address(hook),
                3000000026,
                6000000005,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                3000000026
            );
            
        }
        
        // Dress Banny 4000000004 (Original)
        {
            uint256[] memory outfitIds = new uint256[](1);
            outfitIds[0] = 28000000001; // V4: 28000000002 -> V5: 28000000001

            resolver.decorateBannyWith(
                address(hook),
                4000000004,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                address(hook),
                v4HookAddress,
                4000000004
            );
            
        }
        
        // Step 3: Transfer all assets to rightful owners using constructor data
        // Generate token IDs in the same order as items appear (matching mint order)
        // Token ID format: UPC * 1000000000 + unitNumber
        // Note: Only banny body token IDs are guaranteed to match between V4 and V5.
        // Outfits/backgrounds being worn by bannys may have different IDs, but that's OK
        // since they're not transferred (only used in decorateBannyWith calls).
        uint256[] memory generatedTokenIds = new uint256[](transferOwners.length);
        
        generatedTokenIds[0] = 1000000001; // Token ID (V4: 1000000001)
        generatedTokenIds[1] = 2000000001; // Token ID (V4: 2000000001)
        generatedTokenIds[2] = 2000000002; // Token ID (V4: 2000000002)
        generatedTokenIds[3] = 2000000003; // Token ID (V4: 2000000003)
        generatedTokenIds[4] = 2000000004; // Token ID (V4: 2000000004)
        generatedTokenIds[5] = 2000000005; // Token ID (V4: 2000000005)
        generatedTokenIds[6] = 2000000006; // Token ID (V4: 2000000006)
        generatedTokenIds[7] = 3000000001; // Token ID (V4: 3000000001)
        generatedTokenIds[8] = 3000000002; // Token ID (V4: 3000000002)
        generatedTokenIds[9] = 3000000003; // Token ID (V4: 3000000003)
        generatedTokenIds[10] = 3000000004; // Token ID (V4: 3000000004)
        generatedTokenIds[11] = 3000000005; // Token ID (V4: 3000000005)
        generatedTokenIds[12] = 3000000006; // Token ID (V4: 3000000006)
        generatedTokenIds[13] = 3000000007; // Token ID (V4: 3000000007)
        generatedTokenIds[14] = 3000000008; // Token ID (V4: 3000000008)
        generatedTokenIds[15] = 3000000009; // Token ID (V4: 3000000009)
        generatedTokenIds[16] = 3000000010; // Token ID (V4: 3000000010)
        generatedTokenIds[17] = 3000000011; // Token ID (V4: 3000000011)
        generatedTokenIds[18] = 3000000012; // Token ID (V4: 3000000012)
        generatedTokenIds[19] = 3000000013; // Token ID (V4: 3000000013)
        generatedTokenIds[20] = 3000000014; // Token ID (V4: 3000000014)
        generatedTokenIds[21] = 3000000015; // Token ID (V4: 3000000015)
        generatedTokenIds[22] = 3000000016; // Token ID (V4: 3000000016)
        generatedTokenIds[23] = 3000000017; // Token ID (V4: 3000000017)
        generatedTokenIds[24] = 3000000018; // Token ID (V4: 3000000018)
        generatedTokenIds[25] = 3000000019; // Token ID (V4: 3000000019)
        generatedTokenIds[26] = 3000000020; // Token ID (V4: 3000000020)
        generatedTokenIds[27] = 3000000021; // Token ID (V4: 3000000021)
        generatedTokenIds[28] = 3000000022; // Token ID (V4: 3000000022)
        generatedTokenIds[29] = 3000000023; // Token ID (V4: 3000000023)
        generatedTokenIds[30] = 3000000024; // Token ID (V4: 3000000024)
        generatedTokenIds[31] = 3000000025; // Token ID (V4: 3000000025)
        generatedTokenIds[32] = 3000000026; // Token ID (V4: 3000000026)
        generatedTokenIds[33] = 4000000001; // Token ID (V4: 4000000001)
        generatedTokenIds[34] = 4000000002; // Token ID (V4: 4000000002)
        generatedTokenIds[35] = 4000000003; // Token ID (V4: 4000000003)
        generatedTokenIds[36] = 4000000004; // Token ID (V4: 4000000004)
        generatedTokenIds[37] = 4000000005; // Token ID (V4: 4000000005)
        generatedTokenIds[38] = 4000000006; // Token ID (V4: 4000000006)
        generatedTokenIds[39] = 4000000007; // Token ID (V4: 4000000007)
        
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