// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Banny721TokenUriResolver} from "../../src/Banny721TokenUriResolver.sol";

library MigrationHelper {
    function verifyV4AssetMatch(
        Banny721TokenUriResolver resolver,
        Banny721TokenUriResolver v4Resolver,
        Banny721TokenUriResolver fallbackV4Resolver,
        address v4HookAddress,
        uint256 tokenId
    ) internal view {
        (uint256 mintedBackgroundId, uint256[] memory mintedOutfitIds) = resolver.assetIdsOf(v4HookAddress, tokenId);
        (uint256 expectedBackgroundId, uint256[] memory expectedOutfitIds) = v4Resolver.assetIdsOf(v4HookAddress, tokenId);
        
        bool matches = mintedBackgroundId == expectedBackgroundId && mintedOutfitIds.length == expectedOutfitIds.length;
        if (matches) {
            for (uint256 i = 0; i < mintedOutfitIds.length; i++) {
                if (mintedOutfitIds[i] != expectedOutfitIds[i]) {
                    matches = false;
                    break;
                }
            }
        }
        
        if (!matches) {
            (expectedBackgroundId, expectedOutfitIds) = fallbackV4Resolver.assetIdsOf(v4HookAddress, tokenId);
            require(
                mintedBackgroundId == expectedBackgroundId && 
                mintedOutfitIds.length == expectedOutfitIds.length,
                "V4/V5 asset mismatch"
            );
            for (uint256 i = 0; i < mintedOutfitIds.length; i++) {
                require(mintedOutfitIds[i] == expectedOutfitIds[i], "V4/V5 asset mismatch");
            }
        }
    }
}

