// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";

/// @notice Migration contract for Base to handle standalone outfits and backgrounds
/// that are not worn/used by any banny. These assets are minted to this contract
/// and then transferred directly to their owners.
contract MigrationContractBase3 {
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
        IERC721 v4Hook = IERC721(v4HookAddress);
        
        // Base migration - Standalone outfits and backgrounds (53 items)
        // These are assets that are NOT being worn/used by any banny
        
        // Assets are already minted to this contract by the deployer
        // Token IDs follow formula: upc * 1000000000 + unitNumber (unitNumber starts at 1 per UPC)
        
        // Generate token IDs in the same order as items appear (matching mint order)
        uint256[] memory generatedTokenIds = new uint256[](transferOwners.length);
                generatedTokenIds[0] = 7000000001; // Token ID (V4: 7000000001)
        generatedTokenIds[1] = 10000000005; // Token ID (V4: 10000000002)
        generatedTokenIds[2] = 10000000006; // Token ID (V4: 10000000006)
        generatedTokenIds[3] = 10000000007; // Token ID (V4: 10000000008)
        generatedTokenIds[4] = 10000000008; // Token ID (V4: 10000000009)
        generatedTokenIds[5] = 10000000009; // Token ID (V4: 10000000010)
        generatedTokenIds[6] = 10000000010; // Token ID (V4: 10000000011)
        generatedTokenIds[7] = 11000000001; // Token ID (V4: 11000000002)
        generatedTokenIds[8] = 11000000002; // Token ID (V4: 11000000003)
        generatedTokenIds[9] = 13000000001; // Token ID (V4: 13000000002)
        generatedTokenIds[10] = 14000000003; // Token ID (V4: 14000000004)
        generatedTokenIds[11] = 17000000001; // Token ID (V4: 17000000001)
        generatedTokenIds[12] = 19000000007; // Token ID (V4: 19000000002)
        generatedTokenIds[13] = 19000000008; // Token ID (V4: 19000000004)
        generatedTokenIds[14] = 19000000009; // Token ID (V4: 19000000010)
        generatedTokenIds[15] = 19000000010; // Token ID (V4: 19000000011)
        generatedTokenIds[16] = 19000000011; // Token ID (V4: 19000000012)
        generatedTokenIds[17] = 24000000001; // Token ID (V4: 24000000001)
        generatedTokenIds[18] = 25000000008; // Token ID (V4: 25000000003)
        generatedTokenIds[19] = 28000000006; // Token ID (V4: 28000000003)
        generatedTokenIds[20] = 28000000007; // Token ID (V4: 28000000006)
        generatedTokenIds[21] = 28000000008; // Token ID (V4: 28000000009)
        generatedTokenIds[22] = 28000000009; // Token ID (V4: 28000000010)
        generatedTokenIds[23] = 31000000002; // Token ID (V4: 31000000003)
        generatedTokenIds[24] = 31000000003; // Token ID (V4: 31000000004)
        generatedTokenIds[25] = 31000000004; // Token ID (V4: 31000000005)
        generatedTokenIds[26] = 31000000005; // Token ID (V4: 31000000006)
        generatedTokenIds[27] = 32000000001; // Token ID (V4: 32000000002)
        generatedTokenIds[28] = 34000000001; // Token ID (V4: 34000000001)
        generatedTokenIds[29] = 35000000001; // Token ID (V4: 35000000001)
        generatedTokenIds[30] = 35000000002; // Token ID (V4: 35000000003)
        generatedTokenIds[31] = 35000000003; // Token ID (V4: 35000000004)
        generatedTokenIds[32] = 38000000002; // Token ID (V4: 38000000003)
        generatedTokenIds[33] = 39000000001; // Token ID (V4: 39000000002)
        generatedTokenIds[34] = 40000000001; // Token ID (V4: 40000000002)
        generatedTokenIds[35] = 40000000002; // Token ID (V4: 40000000003)
        generatedTokenIds[36] = 41000000001; // Token ID (V4: 41000000002)
        generatedTokenIds[37] = 42000000001; // Token ID (V4: 42000000001)
        generatedTokenIds[38] = 42000000002; // Token ID (V4: 42000000002)
        generatedTokenIds[39] = 43000000006; // Token ID (V4: 43000000001)
        generatedTokenIds[40] = 43000000007; // Token ID (V4: 43000000004)
        generatedTokenIds[41] = 44000000003; // Token ID (V4: 44000000002)
        generatedTokenIds[42] = 44000000004; // Token ID (V4: 44000000003)
        generatedTokenIds[43] = 47000000003; // Token ID (V4: 47000000002)
        generatedTokenIds[44] = 47000000004; // Token ID (V4: 47000000004)
        generatedTokenIds[45] = 47000000005; // Token ID (V4: 47000000006)
        generatedTokenIds[46] = 47000000006; // Token ID (V4: 47000000007)
        generatedTokenIds[47] = 47000000007; // Token ID (V4: 47000000008)
        generatedTokenIds[48] = 49000000001; // Token ID (V4: 49000000001)
        generatedTokenIds[49] = 49000000002; // Token ID (V4: 49000000002)
        generatedTokenIds[50] = 5000000003; // Token ID (V4: 5000000002)
        generatedTokenIds[51] = 5000000004; // Token ID (V4: 5000000005)
        generatedTokenIds[52] = 6000000004; // Token ID (V4: 6000000002)

        
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