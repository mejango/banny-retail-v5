// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Banny721TokenUriResolver} from "../../src/Banny721TokenUriResolver.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {IJB721TiersHookStore} from "@bananapus/721-hook-v5/src/interfaces/IJB721TiersHookStore.sol";

library MigrationHelper {
    /// @notice Get the UPC (tier ID) from a token ID
    function _getUPC(address hook, uint256 tokenId) internal view returns (uint256) {
        IJB721TiersHookStore store = JB721TiersHook(hook).STORE();
        return store.tierOfTokenId({hook: hook, tokenId: tokenId, includeResolvedUri: false}).id;
    }
    
    function verifyV4AssetMatch(
        Banny721TokenUriResolver resolver,
        Banny721TokenUriResolver v4Resolver,
        Banny721TokenUriResolver fallbackV4Resolver,
        address hookAddress,
        address v4HookAddress,
        uint256 tokenId
    ) internal view {
        // Get V5 asset token IDs (from V5 hook)
        (uint256 v5BackgroundId, uint256[] memory v5OutfitIds) = resolver.assetIdsOf(hookAddress, tokenId);
        // Get V4 asset token IDs (from V4 hook)
        (uint256 v4BackgroundId, uint256[] memory v4OutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, tokenId);
        
        // Compare background UPCs (not token IDs, since they may differ)
        uint256 v5BackgroundUPC = v5BackgroundId == 0 ? 0 : _getUPC(hookAddress, v5BackgroundId);
        uint256 v4BackgroundUPC = v4BackgroundId == 0 ? 0 : _getUPC(v4HookAddress, v4BackgroundId);
        
        bool matches = v5BackgroundUPC == v4BackgroundUPC && v5OutfitIds.length == v4OutfitIds.length;
        
        if (matches) {
            // Compare outfit UPCs
            for (uint256 i = 0; i < v5OutfitIds.length; i++) {
                uint256 v5OutfitUPC = _getUPC(hookAddress, v5OutfitIds[i]);
                uint256 v4OutfitUPC = _getUPC(v4HookAddress, v4OutfitIds[i]);
                if (v5OutfitUPC != v4OutfitUPC) {
                    matches = false;
                    break;
                }
            }
        }
        
        if (!matches) {
            // Try fallback resolver
            (v4BackgroundId, v4OutfitIds) = fallbackV4Resolver.assetIdsOf(v4HookAddress, tokenId);
            v4BackgroundUPC = v4BackgroundId == 0 ? 0 : _getUPC(v4HookAddress, v4BackgroundId);
            
            require(
                v5BackgroundUPC == v4BackgroundUPC && 
                v5OutfitIds.length == v4OutfitIds.length,
                "V4/V5 asset mismatch"
            );
            
            for (uint256 i = 0; i < v5OutfitIds.length; i++) {
                uint256 v5OutfitUPC = _getUPC(hookAddress, v5OutfitIds[i]);
                uint256 v4OutfitUPC = _getUPC(v4HookAddress, v4OutfitIds[i]);
                require(v5OutfitUPC == v4OutfitUPC, "V4/V5 asset mismatch");
            }
        }
    }
}

