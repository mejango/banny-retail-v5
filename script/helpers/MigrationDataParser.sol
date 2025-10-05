// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

contract MigrationDataParser is Script {
    struct BannyData {
        uint256 tokenId;
        uint256 backgroundId;
        uint256[] outfitIds;
        address owner;
        string productName;
    }
    
    struct OutfitData {
        uint256 tokenId;
        uint256 category;
        string categoryName;
        address owner;
        string productName;
    }
    
    struct BackgroundData {
        uint256 tokenId;
        address owner;
        string productName;
    }
    
    // V4 to V5 category mapping
    // V4: [0: Banny body, 1: Background, 2: Backside, 4: Head, 5: Glasses, 6: Mouth, 7: Legs, 8: Suit, 9: Head top, 10: Fist]
    // V5: [0: Banny body, 1: Background, 2: Backside, 4: Head, 5: EYES, 6: Glasses, 7: Mouth, 8: Legs, 9: Suit, 10: Head top, 11: Fist]
    
    function parseRawData() public view returns (
        BannyData[] memory bannys,
        OutfitData[] memory outfits,
        BackgroundData[] memory backgrounds,
        uint256[] memory allTierIds
    ) {
        // Load the raw data
        string memory rawDataPath = "script/outfit_drop/raw.json";
        string memory rawData = vm.readFile(rawDataPath);
        
        // Parse the JSON data
        bytes memory data = vm.parseJson(rawData);
        
        // TODO: Implement proper JSON parsing
        // For now, return empty arrays
        bannys = new BannyData[](0);
        outfits = new OutfitData[](0);
        backgrounds = new BackgroundData[](0);
        allTierIds = new uint256[](0);
        
        return (bannys, outfits, backgrounds, allTierIds);
    }
    
    function getV5CategoryFromV4(uint256 v4Category) public pure returns (uint256) {
        // Map V4 categories to V5 categories
        // EYES is inserted at index 5, so categories 5+ are shifted up by 1
        
        if (v4Category < 5) {
            return v4Category; // Categories 0-4 remain the same
        } else {
            return v4Category + 1; // Categories 5+ are shifted up by 1
        }
    }
    
    function getOutfitCategoryFromTokenId(uint256 tokenId) public pure returns (uint256) {
        // Determine outfit category from tokenId based on the tokenId structure
        // Based on the data analysis:
        
        if (tokenId >= 10000000001 && tokenId < 17000000001) {
            return 4; // Head
        } else if (tokenId >= 17000000001 && tokenId < 26000000001) {
            return 5; // Glasses
        } else if (tokenId >= 26000000001 && tokenId < 46000000001) {
            return 6; // Mouth
        } else if (tokenId >= 46000000001 && tokenId < 60000000001) {
            return 7; // Legs
        } else if (tokenId >= 60000000001 && tokenId < 80000000001) {
            return 8; // Suit
        } else if (tokenId >= 80000000001 && tokenId < 90000000001) {
            return 9; // Head top
        } else if (tokenId >= 90000000001) {
            return 10; // Fist
        } else if (tokenId >= 7000000001 && tokenId < 10000000001) {
            return 2; // Backside
        } else if (tokenId >= 5000000001 && tokenId < 7000000001) {
            return 1; // Background
        } else {
            return 0; // Banny body or unknown
        }
    }
    
    function mapV4OutfitsToV5(uint256[] memory v4OutfitIds) public pure returns (uint256[] memory) {
        // Map V4 outfitIds to V5 categories
        // Categories 5+ need to be shifted up by 1 due to EYES insertion
        
        uint256[] memory v5OutfitIds = new uint256[](v4OutfitIds.length);
        
        for (uint256 i = 0; i < v4OutfitIds.length; i++) {
            uint256 outfitId = v4OutfitIds[i];
            uint256 v4Category = getOutfitCategoryFromTokenId(outfitId);
            uint256 v5Category = getV5CategoryFromV4(v4Category);
            
            // For now, we'll use the same outfitId
            // In a real implementation, you might need to create new V5 outfitIds
            // or have a mapping system
            v5OutfitIds[i] = outfitId;
        }
        
        return v5OutfitIds;
    }
    
    function generateMigrationScript() public view returns (string memory) {
        // This function would generate the actual migration script calls
        // based on the parsed data
        
        string memory script = "// Generated migration script\n";
        script = string(abi.encodePacked(script, "// TODO: Implement based on parsed data\n"));
        
        return script;
    }
}
