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
        // Token IDs are the same for V4 and V5 (using original token IDs from V4)
        
        // Generate token IDs (V4 and V5 use the same token IDs)
        uint256[] memory tokenIds = new uint256[](transferOwners.length);
                tokenIds[0] = 7000000001; // Token ID (V4: 7000000001, should match)
        tokenIds[1] = 10000000011; // Token ID (V4: 10000000002, should match)
        tokenIds[2] = 10000000012; // Token ID (V4: 10000000006, should match)
        tokenIds[3] = 10000000013; // Token ID (V4: 10000000008, should match)
        tokenIds[4] = 10000000014; // Token ID (V4: 10000000009, should match)
        tokenIds[5] = 10000000015; // Token ID (V4: 10000000010, should match)
        tokenIds[6] = 10000000016; // Token ID (V4: 10000000011, should match)
        tokenIds[7] = 11000000003; // Token ID (V4: 11000000002, should match)
        tokenIds[8] = 11000000004; // Token ID (V4: 11000000003, should match)
        tokenIds[9] = 13000000002; // Token ID (V4: 13000000002, should match)
        tokenIds[10] = 14000000004; // Token ID (V4: 14000000004, should match)
        tokenIds[11] = 17000000001; // Token ID (V4: 17000000001, should match)
        tokenIds[12] = 19000000012; // Token ID (V4: 19000000002, should match)
        tokenIds[13] = 19000000013; // Token ID (V4: 19000000004, should match)
        tokenIds[14] = 19000000014; // Token ID (V4: 19000000010, should match)
        tokenIds[15] = 19000000015; // Token ID (V4: 19000000011, should match)
        tokenIds[16] = 19000000016; // Token ID (V4: 19000000012, should match)
        tokenIds[17] = 24000000001; // Token ID (V4: 24000000001, should match)
        tokenIds[18] = 25000000009; // Token ID (V4: 25000000003, should match)
        tokenIds[19] = 28000000010; // Token ID (V4: 28000000003, should match)
        tokenIds[20] = 28000000011; // Token ID (V4: 28000000006, should match)
        tokenIds[21] = 28000000012; // Token ID (V4: 28000000009, should match)
        tokenIds[22] = 28000000013; // Token ID (V4: 28000000010, should match)
        tokenIds[23] = 31000000006; // Token ID (V4: 31000000003, should match)
        tokenIds[24] = 31000000007; // Token ID (V4: 31000000004, should match)
        tokenIds[25] = 31000000008; // Token ID (V4: 31000000005, should match)
        tokenIds[26] = 31000000009; // Token ID (V4: 31000000006, should match)
        tokenIds[27] = 32000000002; // Token ID (V4: 32000000002, should match)
        tokenIds[28] = 34000000001; // Token ID (V4: 34000000001, should match)
        tokenIds[29] = 35000000004; // Token ID (V4: 35000000001, should match)
        tokenIds[30] = 35000000005; // Token ID (V4: 35000000003, should match)
        tokenIds[31] = 35000000006; // Token ID (V4: 35000000004, should match)
        tokenIds[32] = 38000000003; // Token ID (V4: 38000000003, should match)
        tokenIds[33] = 39000000002; // Token ID (V4: 39000000002, should match)
        tokenIds[34] = 40000000003; // Token ID (V4: 40000000002, should match)
        tokenIds[35] = 40000000004; // Token ID (V4: 40000000003, should match)
        tokenIds[36] = 41000000002; // Token ID (V4: 41000000002, should match)
        tokenIds[37] = 42000000002; // Token ID (V4: 42000000001, should match)
        tokenIds[38] = 42000000003; // Token ID (V4: 42000000002, should match)
        tokenIds[39] = 43000000008; // Token ID (V4: 43000000001, should match)
        tokenIds[40] = 43000000009; // Token ID (V4: 43000000004, should match)
        tokenIds[41] = 44000000005; // Token ID (V4: 44000000002, should match)
        tokenIds[42] = 44000000006; // Token ID (V4: 44000000003, should match)
        tokenIds[43] = 47000000008; // Token ID (V4: 47000000002, should match)
        tokenIds[44] = 47000000009; // Token ID (V4: 47000000004, should match)
        tokenIds[45] = 47000000010; // Token ID (V4: 47000000006, should match)
        tokenIds[46] = 47000000011; // Token ID (V4: 47000000007, should match)
        tokenIds[47] = 47000000012; // Token ID (V4: 47000000008, should match)
        tokenIds[48] = 49000000002; // Token ID (V4: 49000000001, should match)
        tokenIds[49] = 49000000003; // Token ID (V4: 49000000002, should match)
        tokenIds[50] = 5000000005; // Token ID (V4: 5000000002, should match)
        tokenIds[51] = 5000000006; // Token ID (V4: 5000000005, should match)
        tokenIds[52] = 6000000005; // Token ID (V4: 6000000002, should match)

        
        for (uint256 i = 0; i < transferOwners.length; i++) {
            uint256 tokenId = tokenIds[i];
            
            // Verify V4 ownership before transferring V5 (V4 and V5 token IDs are the same)
            address v4Owner = v4Hook.ownerOf(tokenId);
            // Allow ownership by the expected owner or either resolver (resolver holds worn/used tokens)
            require(
                v4Owner == transferOwners[i] || 
                v4Owner == address(v4ResolverAddress) || 
                v4Owner == address(fallbackV4ResolverAddress), 
                "V4/V5 ownership mismatch for token"
            );
            
            // Skip transfer if V4 owner is the resolver (resolver holds these tokens, we shouldn't transfer to resolver)
            if (v4Owner == address(v4ResolverAddress) || v4Owner == address(fallbackV4ResolverAddress)) {
                // Token is held by resolver, skip transfer
                continue;
            }
            
            // Verify this contract owns the token before transferring
            require(hook.ownerOf(tokenId) == address(this), "Contract does not own token");
            
            // Transfer using the same token ID (V4 and V5 are the same)
            IERC721(address(hook)).safeTransferFrom(
                address(this), 
                transferOwners[i], 
                tokenId
            );
        }
    }
}