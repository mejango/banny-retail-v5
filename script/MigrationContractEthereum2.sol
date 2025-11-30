// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";
import {MigrationHelper} from "./helpers/MigrationHelper.sol";

contract MigrationContractEthereum2 {
    // Define struct to hold all UPC minted tokenIds
    struct MintedIds {
        uint256[40] upc4;
        uint256[1] upc5;
        uint256[1] upc6;
        uint256[4] upc10;
        uint256[1] upc13;
        uint256[1] upc15;
        uint256[1] upc16;
        uint256[1] upc17;
        uint256[1] upc18;
        uint256[5] upc19;
        uint256[1] upc20;
        uint256[4] upc23;
        uint256[4] upc25;
        uint256[1] upc26;
        uint256[3] upc31;
        uint256[1] upc32;
        uint256[1] upc33;
        uint256[1] upc35;
        uint256[4] upc41;
        uint256[2] upc42;
        uint256[2] upc43;
        uint256[1] upc44;
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
        
        // Ethereum migration chunk 2/3 - 84 items
        
        // Step 1: Assets are already minted to this contract by the deployer
        
        
        // Assets are already minted to this contract by the deployer
        
        // Create and populate the struct
        // Token IDs follow formula: upc * 1000000000 + unitNumber (unitNumber starts at 1 per UPC)
        MintedIds memory sortedMintedIds;
        
        // Populate UPC 4 minted tokenIds (40 items)
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
            sortedMintedIds.upc4[20] = 4000000028; // Token ID: 4 * 1000000000 + 21
            sortedMintedIds.upc4[21] = 4000000029; // Token ID: 4 * 1000000000 + 22
            sortedMintedIds.upc4[22] = 4000000030; // Token ID: 4 * 1000000000 + 23
            sortedMintedIds.upc4[23] = 4000000031; // Token ID: 4 * 1000000000 + 24
            sortedMintedIds.upc4[24] = 4000000032; // Token ID: 4 * 1000000000 + 25
            sortedMintedIds.upc4[25] = 4000000033; // Token ID: 4 * 1000000000 + 26
            sortedMintedIds.upc4[26] = 4000000034; // Token ID: 4 * 1000000000 + 27
            sortedMintedIds.upc4[27] = 4000000035; // Token ID: 4 * 1000000000 + 28
            sortedMintedIds.upc4[28] = 4000000036; // Token ID: 4 * 1000000000 + 29
            sortedMintedIds.upc4[29] = 4000000037; // Token ID: 4 * 1000000000 + 30
            sortedMintedIds.upc4[30] = 4000000038; // Token ID: 4 * 1000000000 + 31
            sortedMintedIds.upc4[31] = 4000000039; // Token ID: 4 * 1000000000 + 32
            sortedMintedIds.upc4[32] = 4000000040; // Token ID: 4 * 1000000000 + 33
            sortedMintedIds.upc4[33] = 4000000041; // Token ID: 4 * 1000000000 + 34
            sortedMintedIds.upc4[34] = 4000000042; // Token ID: 4 * 1000000000 + 35
            sortedMintedIds.upc4[35] = 4000000043; // Token ID: 4 * 1000000000 + 36
            sortedMintedIds.upc4[36] = 4000000044; // Token ID: 4 * 1000000000 + 37
            sortedMintedIds.upc4[37] = 4000000045; // Token ID: 4 * 1000000000 + 38
            sortedMintedIds.upc4[38] = 4000000046; // Token ID: 4 * 1000000000 + 39
            sortedMintedIds.upc4[39] = 4000000047; // Token ID: 4 * 1000000000 + 40
        // Populate UPC 5 minted tokenIds (1 items)
            sortedMintedIds.upc5[0] = 5000000005; // Token ID: 5 * 1000000000 + 1
        // Populate UPC 6 minted tokenIds (1 items)
            sortedMintedIds.upc6[0] = 6000000006; // Token ID: 6 * 1000000000 + 1
        // Populate UPC 10 minted tokenIds (4 items)
            sortedMintedIds.upc10[0] = 10000000002; // Token ID: 10 * 1000000000 + 1
            sortedMintedIds.upc10[1] = 10000000003; // Token ID: 10 * 1000000000 + 2
            sortedMintedIds.upc10[2] = 10000000004; // Token ID: 10 * 1000000000 + 3
            sortedMintedIds.upc10[3] = 10000000005; // Token ID: 10 * 1000000000 + 4
        // Populate UPC 13 minted tokenIds (1 items)
            sortedMintedIds.upc13[0] = 13000000001; // Token ID: 13 * 1000000000 + 1
        // Populate UPC 15 minted tokenIds (1 items)
            sortedMintedIds.upc15[0] = 15000000002; // Token ID: 15 * 1000000000 + 1
        // Populate UPC 16 minted tokenIds (1 items)
            sortedMintedIds.upc16[0] = 16000000001; // Token ID: 16 * 1000000000 + 1
        // Populate UPC 17 minted tokenIds (1 items)
            sortedMintedIds.upc17[0] = 17000000002; // Token ID: 17 * 1000000000 + 1
        // Populate UPC 18 minted tokenIds (1 items)
            sortedMintedIds.upc18[0] = 18000000002; // Token ID: 18 * 1000000000 + 1
        // Populate UPC 19 minted tokenIds (5 items)
            sortedMintedIds.upc19[0] = 19000000005; // Token ID: 19 * 1000000000 + 1
            sortedMintedIds.upc19[1] = 19000000006; // Token ID: 19 * 1000000000 + 2
            sortedMintedIds.upc19[2] = 19000000007; // Token ID: 19 * 1000000000 + 3
            sortedMintedIds.upc19[3] = 19000000008; // Token ID: 19 * 1000000000 + 4
            sortedMintedIds.upc19[4] = 19000000009; // Token ID: 19 * 1000000000 + 5
        // Populate UPC 20 minted tokenIds (1 items)
            sortedMintedIds.upc20[0] = 20000000001; // Token ID: 20 * 1000000000 + 1
        // Populate UPC 23 minted tokenIds (4 items)
            sortedMintedIds.upc23[0] = 23000000002; // Token ID: 23 * 1000000000 + 1
            sortedMintedIds.upc23[1] = 23000000003; // Token ID: 23 * 1000000000 + 2
            sortedMintedIds.upc23[2] = 23000000004; // Token ID: 23 * 1000000000 + 3
            sortedMintedIds.upc23[3] = 23000000005; // Token ID: 23 * 1000000000 + 4
        // Populate UPC 25 minted tokenIds (4 items)
            sortedMintedIds.upc25[0] = 25000000004; // Token ID: 25 * 1000000000 + 1
            sortedMintedIds.upc25[1] = 25000000005; // Token ID: 25 * 1000000000 + 2
            sortedMintedIds.upc25[2] = 25000000006; // Token ID: 25 * 1000000000 + 3
            sortedMintedIds.upc25[3] = 25000000007; // Token ID: 25 * 1000000000 + 4
        // Populate UPC 26 minted tokenIds (1 items)
            sortedMintedIds.upc26[0] = 26000000004; // Token ID: 26 * 1000000000 + 1
        // Populate UPC 31 minted tokenIds (3 items)
            sortedMintedIds.upc31[0] = 31000000003; // Token ID: 31 * 1000000000 + 1
            sortedMintedIds.upc31[1] = 31000000004; // Token ID: 31 * 1000000000 + 2
            sortedMintedIds.upc31[2] = 31000000005; // Token ID: 31 * 1000000000 + 3
        // Populate UPC 32 minted tokenIds (1 items)
            sortedMintedIds.upc32[0] = 32000000003; // Token ID: 32 * 1000000000 + 1
        // Populate UPC 33 minted tokenIds (1 items)
            sortedMintedIds.upc33[0] = 33000000001; // Token ID: 33 * 1000000000 + 1
        // Populate UPC 35 minted tokenIds (1 items)
            sortedMintedIds.upc35[0] = 35000000005; // Token ID: 35 * 1000000000 + 1
        // Populate UPC 41 minted tokenIds (4 items)
            sortedMintedIds.upc41[0] = 41000000001; // Token ID: 41 * 1000000000 + 1
            sortedMintedIds.upc41[1] = 41000000002; // Token ID: 41 * 1000000000 + 2
            sortedMintedIds.upc41[2] = 41000000003; // Token ID: 41 * 1000000000 + 3
            sortedMintedIds.upc41[3] = 41000000004; // Token ID: 41 * 1000000000 + 4
        // Populate UPC 42 minted tokenIds (2 items)
            sortedMintedIds.upc42[0] = 42000000002; // Token ID: 42 * 1000000000 + 1
            sortedMintedIds.upc42[1] = 42000000003; // Token ID: 42 * 1000000000 + 2
        // Populate UPC 43 minted tokenIds (2 items)
            sortedMintedIds.upc43[0] = 43000000004; // Token ID: 43 * 1000000000 + 1
            sortedMintedIds.upc43[1] = 43000000005; // Token ID: 43 * 1000000000 + 2
        // Populate UPC 44 minted tokenIds (1 items)
            sortedMintedIds.upc44[0] = 44000000003; // Token ID: 44 * 1000000000 + 1
        // Populate UPC 48 minted tokenIds (2 items)
            sortedMintedIds.upc48[0] = 48000000003; // Token ID: 48 * 1000000000 + 1
            sortedMintedIds.upc48[1] = 48000000004; // Token ID: 48 * 1000000000 + 2
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
                v4HookAddress,
                4000000023
            );
            
        }
        
        // Dress Banny 4000000033 (Original)
        {
            uint256[] memory outfitIds = new uint256[](2);
            outfitIds[0] = 19000000008; // V4: 19000000009 -> V5: 19000000008
            outfitIds[1] = 43000000005; // V4: 43000000008 -> V5: 43000000005

            resolver.decorateBannyWith(
                address(hook),
                4000000033,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                v4HookAddress,
                4000000033
            );
            
        }
        
        // Dress Banny 4000000039 (Original)
        {
            uint256[] memory outfitIds = new uint256[](4);
            outfitIds[0] = 13000000001; // V4: 13000000001 -> V5: 13000000001
            outfitIds[1] = 19000000009; // V4: 19000000011 -> V5: 19000000009
            outfitIds[2] = 25000000006; // V4: 25000000006 -> V5: 25000000006
            outfitIds[3] = 42000000003; // V4: 42000000004 -> V5: 42000000003

            resolver.decorateBannyWith(
                address(hook),
                4000000039,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                v4HookAddress,
                4000000039
            );
            
        }
        
        // Dress Banny 4000000040 (Original)
        {
            uint256[] memory outfitIds = new uint256[](1);
            outfitIds[0] = 25000000007; // V4: 25000000007 -> V5: 25000000007

            resolver.decorateBannyWith(
                address(hook),
                4000000040,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                v4HookAddress,
                4000000040
            );
            
        }
        
        // Dress Banny 4000000041 (Original)
        {
            uint256[] memory outfitIds = new uint256[](5);
            outfitIds[0] = 16000000001; // V4: 16000000001 -> V5: 16000000001
            outfitIds[1] = 17000000002; // V4: 17000000002 -> V5: 17000000002
            outfitIds[2] = 31000000005; // V4: 31000000009 -> V5: 31000000005
            outfitIds[3] = 33000000001; // V4: 33000000001 -> V5: 33000000001
            outfitIds[4] = 48000000003; // V4: 48000000002 -> V5: 48000000003

            resolver.decorateBannyWith(
                address(hook),
                4000000041,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                v4HookAddress,
                4000000041
            );
            
        }
        
        // Dress Banny 4000000043 (Original)
        {
            uint256[] memory outfitIds = new uint256[](2);
            outfitIds[0] = 32000000003; // V4: 32000000003 -> V5: 32000000003
            outfitIds[1] = 48000000004; // V4: 48000000003 -> V5: 48000000004

            resolver.decorateBannyWith(
                address(hook),
                4000000043,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                v4HookAddress,
                4000000043
            );
            
        }
        
        // Dress Banny 4000000044 (Original)
        {
            uint256[] memory outfitIds = new uint256[](2);
            outfitIds[0] = 23000000002; // V4: 23000000002 -> V5: 23000000002
            outfitIds[1] = 41000000001; // V4: 41000000001 -> V5: 41000000001

            resolver.decorateBannyWith(
                address(hook),
                4000000044,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                v4HookAddress,
                4000000044
            );
            
        }
        
        // Dress Banny 4000000045 (Original)
        {
            uint256[] memory outfitIds = new uint256[](2);
            outfitIds[0] = 23000000004; // V4: 23000000004 -> V5: 23000000004
            outfitIds[1] = 41000000003; // V4: 41000000003 -> V5: 41000000003

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
                v4HookAddress,
                4000000045
            );
            
        }
        
        // Dress Banny 4000000046 (Original)
        {
            uint256[] memory outfitIds = new uint256[](2);
            outfitIds[0] = 23000000005; // V4: 23000000005 -> V5: 23000000005
            outfitIds[1] = 41000000004; // V4: 41000000004 -> V5: 41000000004

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
                v4HookAddress,
                4000000046
            );
            
        }
        
        // Dress Banny 4000000047 (Original)
        {
            uint256[] memory outfitIds = new uint256[](2);
            outfitIds[0] = 23000000003; // V4: 23000000003 -> V5: 23000000003
            outfitIds[1] = 41000000002; // V4: 41000000002 -> V5: 41000000002

            resolver.decorateBannyWith(
                address(hook),
                4000000047,
                0,
                outfitIds
            );
            
            MigrationHelper.verifyV4AssetMatch(
                resolver,
                v4Resolver,
                fallbackV4Resolver,
                v4HookAddress,
                4000000047
            );
            
        }
        
        // Step 3: Transfer all assets to rightful owners using constructor data
        // Generate token IDs in the same order as items appear (matching mint order)
        // Token ID format: UPC * 1000000000 + unitNumber
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
        generatedTokenIds[20] = 4000000028; // Token ID (V4: 4000000028)
        generatedTokenIds[21] = 4000000029; // Token ID (V4: 4000000029)
        generatedTokenIds[22] = 4000000030; // Token ID (V4: 4000000030)
        generatedTokenIds[23] = 4000000031; // Token ID (V4: 4000000031)
        generatedTokenIds[24] = 4000000032; // Token ID (V4: 4000000032)
        generatedTokenIds[25] = 4000000033; // Token ID (V4: 4000000033)
        generatedTokenIds[26] = 4000000034; // Token ID (V4: 4000000034)
        generatedTokenIds[27] = 4000000035; // Token ID (V4: 4000000035)
        generatedTokenIds[28] = 4000000036; // Token ID (V4: 4000000036)
        generatedTokenIds[29] = 4000000037; // Token ID (V4: 4000000037)
        generatedTokenIds[30] = 4000000038; // Token ID (V4: 4000000038)
        generatedTokenIds[31] = 4000000039; // Token ID (V4: 4000000039)
        generatedTokenIds[32] = 4000000040; // Token ID (V4: 4000000040)
        generatedTokenIds[33] = 4000000041; // Token ID (V4: 4000000041)
        generatedTokenIds[34] = 4000000042; // Token ID (V4: 4000000042)
        generatedTokenIds[35] = 4000000043; // Token ID (V4: 4000000043)
        generatedTokenIds[36] = 4000000044; // Token ID (V4: 4000000044)
        generatedTokenIds[37] = 4000000045; // Token ID (V4: 4000000045)
        generatedTokenIds[38] = 4000000046; // Token ID (V4: 4000000046)
        generatedTokenIds[39] = 4000000047; // Token ID (V4: 4000000047)
        
        for (uint256 i = 0; i < transferOwners.length; i++) {
            uint256 tokenId = generatedTokenIds[i];
            // Verify V4 ownership before transferring V5
            address v4Owner = v4Hook.ownerOf(tokenId);
            require(v4Owner == transferOwners[i] || v4Owner == address(fallbackV4ResolverAddress), "V4/V5 ownership mismatch for token");
            
            // Skip transfer if V4 owner is the resolver (resolver holds these tokens, we shouldn't transfer to resolver)
            if (v4Owner == address(v4ResolverAddress) || v4Owner == address(fallbackV4ResolverAddress)) {
                // Token is held by resolver, skip transfer
                continue;
            }
            
            IERC721(address(hook)).safeTransferFrom(
                address(this), 
                transferOwners[i], 
                tokenId
            );
        }
    }
}