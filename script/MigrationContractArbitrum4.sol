// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";
import {MigrationHelper} from "./helpers/MigrationHelper.sol";

/// @notice Migration contract for Arbitrum to handle standalone outfits and backgrounds
/// that are not worn/used by any banny. These assets are minted to this contract
/// and then transferred directly to their owners.
contract MigrationContractArbitrum4 {
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
        
        // Arbitrum migration - Standalone outfits and backgrounds (176 items)
        // These are assets that are NOT being worn/used by any banny
        
        // Assets are already minted to this contract by the deployer
        // V5 token IDs are calculated based on mint order (continuing from previous chunks)
        // V4 token IDs are the original token IDs from V4
        
        // Generate token IDs - store both V5 minted token IDs and original V4 token IDs
        uint256[] memory v5TokenIds = new uint256[](transferOwners.length);
        uint256[] memory v4TokenIds = new uint256[](transferOwners.length);
                v5TokenIds[0] = 5000000003; // Minted V5 Token ID
        v4TokenIds[0] = 5000000003; // Original V4 Token ID
        v5TokenIds[1] = 19000000003; // Minted V5 Token ID
        v4TokenIds[1] = 19000000002; // Original V4 Token ID
        v5TokenIds[2] = 19000000004; // Minted V5 Token ID
        v4TokenIds[2] = 19000000004; // Original V4 Token ID
        v5TokenIds[3] = 31000000002; // Minted V5 Token ID
        v4TokenIds[3] = 31000000002; // Original V4 Token ID
        v5TokenIds[4] = 32000000001; // Minted V5 Token ID
        v4TokenIds[4] = 32000000001; // Original V4 Token ID
        v5TokenIds[5] = 39000000001; // Minted V5 Token ID
        v4TokenIds[5] = 39000000001; // Original V4 Token ID
        v5TokenIds[6] = 47000000002; // Minted V5 Token ID
        v4TokenIds[6] = 47000000002; // Original V4 Token ID
        v5TokenIds[7] = 47000000003; // Minted V5 Token ID
        v4TokenIds[7] = 47000000003; // Original V4 Token ID
        v5TokenIds[8] = 47000000004; // Minted V5 Token ID
        v4TokenIds[8] = 47000000004; // Original V4 Token ID
        v5TokenIds[9] = 47000000005; // Minted V5 Token ID
        v4TokenIds[9] = 47000000005; // Original V4 Token ID
        v5TokenIds[10] = 47000000006; // Minted V5 Token ID
        v4TokenIds[10] = 47000000006; // Original V4 Token ID
        v5TokenIds[11] = 47000000007; // Minted V5 Token ID
        v4TokenIds[11] = 47000000007; // Original V4 Token ID
        v5TokenIds[12] = 47000000008; // Minted V5 Token ID
        v4TokenIds[12] = 47000000008; // Original V4 Token ID
        v5TokenIds[13] = 47000000009; // Minted V5 Token ID
        v4TokenIds[13] = 47000000009; // Original V4 Token ID
        v5TokenIds[14] = 47000000010; // Minted V5 Token ID
        v4TokenIds[14] = 47000000010; // Original V4 Token ID
        v5TokenIds[15] = 47000000011; // Minted V5 Token ID
        v4TokenIds[15] = 47000000011; // Original V4 Token ID
        v5TokenIds[16] = 47000000012; // Minted V5 Token ID
        v4TokenIds[16] = 47000000012; // Original V4 Token ID
        v5TokenIds[17] = 47000000013; // Minted V5 Token ID
        v4TokenIds[17] = 47000000013; // Original V4 Token ID
        v5TokenIds[18] = 47000000014; // Minted V5 Token ID
        v4TokenIds[18] = 47000000014; // Original V4 Token ID
        v5TokenIds[19] = 47000000015; // Minted V5 Token ID
        v4TokenIds[19] = 47000000015; // Original V4 Token ID
        v5TokenIds[20] = 47000000016; // Minted V5 Token ID
        v4TokenIds[20] = 47000000016; // Original V4 Token ID
        v5TokenIds[21] = 47000000017; // Minted V5 Token ID
        v4TokenIds[21] = 47000000017; // Original V4 Token ID
        v5TokenIds[22] = 47000000018; // Minted V5 Token ID
        v4TokenIds[22] = 47000000018; // Original V4 Token ID
        v5TokenIds[23] = 47000000019; // Minted V5 Token ID
        v4TokenIds[23] = 47000000019; // Original V4 Token ID
        v5TokenIds[24] = 47000000020; // Minted V5 Token ID
        v4TokenIds[24] = 47000000020; // Original V4 Token ID
        v5TokenIds[25] = 47000000021; // Minted V5 Token ID
        v4TokenIds[25] = 47000000021; // Original V4 Token ID
        v5TokenIds[26] = 47000000022; // Minted V5 Token ID
        v4TokenIds[26] = 47000000022; // Original V4 Token ID
        v5TokenIds[27] = 47000000023; // Minted V5 Token ID
        v4TokenIds[27] = 47000000023; // Original V4 Token ID
        v5TokenIds[28] = 47000000024; // Minted V5 Token ID
        v4TokenIds[28] = 47000000024; // Original V4 Token ID
        v5TokenIds[29] = 47000000025; // Minted V5 Token ID
        v4TokenIds[29] = 47000000025; // Original V4 Token ID
        v5TokenIds[30] = 47000000026; // Minted V5 Token ID
        v4TokenIds[30] = 47000000026; // Original V4 Token ID
        v5TokenIds[31] = 47000000027; // Minted V5 Token ID
        v4TokenIds[31] = 47000000027; // Original V4 Token ID
        v5TokenIds[32] = 49000000002; // Minted V5 Token ID
        v4TokenIds[32] = 49000000001; // Original V4 Token ID
        v5TokenIds[33] = 49000000003; // Minted V5 Token ID
        v4TokenIds[33] = 49000000003; // Original V4 Token ID
        v5TokenIds[34] = 49000000004; // Minted V5 Token ID
        v4TokenIds[34] = 49000000004; // Original V4 Token ID
        v5TokenIds[35] = 49000000005; // Minted V5 Token ID
        v4TokenIds[35] = 49000000005; // Original V4 Token ID
        v5TokenIds[36] = 49000000006; // Minted V5 Token ID
        v4TokenIds[36] = 49000000006; // Original V4 Token ID
        v5TokenIds[37] = 49000000007; // Minted V5 Token ID
        v4TokenIds[37] = 49000000007; // Original V4 Token ID
        v5TokenIds[38] = 49000000008; // Minted V5 Token ID
        v4TokenIds[38] = 49000000008; // Original V4 Token ID
        v5TokenIds[39] = 49000000009; // Minted V5 Token ID
        v4TokenIds[39] = 49000000009; // Original V4 Token ID
        v5TokenIds[40] = 49000000010; // Minted V5 Token ID
        v4TokenIds[40] = 49000000010; // Original V4 Token ID
        v5TokenIds[41] = 49000000011; // Minted V5 Token ID
        v4TokenIds[41] = 49000000011; // Original V4 Token ID
        v5TokenIds[42] = 49000000012; // Minted V5 Token ID
        v4TokenIds[42] = 49000000012; // Original V4 Token ID
        v5TokenIds[43] = 49000000013; // Minted V5 Token ID
        v4TokenIds[43] = 49000000013; // Original V4 Token ID
        v5TokenIds[44] = 49000000014; // Minted V5 Token ID
        v4TokenIds[44] = 49000000014; // Original V4 Token ID
        v5TokenIds[45] = 49000000015; // Minted V5 Token ID
        v4TokenIds[45] = 49000000015; // Original V4 Token ID
        v5TokenIds[46] = 49000000016; // Minted V5 Token ID
        v4TokenIds[46] = 49000000016; // Original V4 Token ID
        v5TokenIds[47] = 49000000017; // Minted V5 Token ID
        v4TokenIds[47] = 49000000017; // Original V4 Token ID
        v5TokenIds[48] = 49000000018; // Minted V5 Token ID
        v4TokenIds[48] = 49000000018; // Original V4 Token ID
        v5TokenIds[49] = 49000000019; // Minted V5 Token ID
        v4TokenIds[49] = 49000000019; // Original V4 Token ID
        v5TokenIds[50] = 49000000020; // Minted V5 Token ID
        v4TokenIds[50] = 49000000020; // Original V4 Token ID
        v5TokenIds[51] = 49000000021; // Minted V5 Token ID
        v4TokenIds[51] = 49000000021; // Original V4 Token ID
        v5TokenIds[52] = 49000000022; // Minted V5 Token ID
        v4TokenIds[52] = 49000000022; // Original V4 Token ID
        v5TokenIds[53] = 49000000023; // Minted V5 Token ID
        v4TokenIds[53] = 49000000023; // Original V4 Token ID
        v5TokenIds[54] = 49000000024; // Minted V5 Token ID
        v4TokenIds[54] = 49000000024; // Original V4 Token ID
        v5TokenIds[55] = 49000000025; // Minted V5 Token ID
        v4TokenIds[55] = 49000000025; // Original V4 Token ID
        v5TokenIds[56] = 49000000026; // Minted V5 Token ID
        v4TokenIds[56] = 49000000026; // Original V4 Token ID
        v5TokenIds[57] = 49000000027; // Minted V5 Token ID
        v4TokenIds[57] = 49000000027; // Original V4 Token ID
        v5TokenIds[58] = 49000000028; // Minted V5 Token ID
        v4TokenIds[58] = 49000000028; // Original V4 Token ID
        v5TokenIds[59] = 49000000029; // Minted V5 Token ID
        v4TokenIds[59] = 49000000029; // Original V4 Token ID
        v5TokenIds[60] = 49000000030; // Minted V5 Token ID
        v4TokenIds[60] = 49000000030; // Original V4 Token ID
        v5TokenIds[61] = 49000000031; // Minted V5 Token ID
        v4TokenIds[61] = 49000000031; // Original V4 Token ID
        v5TokenIds[62] = 49000000032; // Minted V5 Token ID
        v4TokenIds[62] = 49000000032; // Original V4 Token ID
        v5TokenIds[63] = 49000000033; // Minted V5 Token ID
        v4TokenIds[63] = 49000000033; // Original V4 Token ID
        v5TokenIds[64] = 49000000034; // Minted V5 Token ID
        v4TokenIds[64] = 49000000034; // Original V4 Token ID
        v5TokenIds[65] = 49000000035; // Minted V5 Token ID
        v4TokenIds[65] = 49000000035; // Original V4 Token ID
        v5TokenIds[66] = 49000000036; // Minted V5 Token ID
        v4TokenIds[66] = 49000000036; // Original V4 Token ID
        v5TokenIds[67] = 49000000037; // Minted V5 Token ID
        v4TokenIds[67] = 49000000037; // Original V4 Token ID
        v5TokenIds[68] = 49000000038; // Minted V5 Token ID
        v4TokenIds[68] = 49000000038; // Original V4 Token ID
        v5TokenIds[69] = 49000000039; // Minted V5 Token ID
        v4TokenIds[69] = 49000000039; // Original V4 Token ID
        v5TokenIds[70] = 49000000040; // Minted V5 Token ID
        v4TokenIds[70] = 49000000040; // Original V4 Token ID
        v5TokenIds[71] = 49000000041; // Minted V5 Token ID
        v4TokenIds[71] = 49000000041; // Original V4 Token ID
        v5TokenIds[72] = 49000000042; // Minted V5 Token ID
        v4TokenIds[72] = 49000000042; // Original V4 Token ID
        v5TokenIds[73] = 49000000043; // Minted V5 Token ID
        v4TokenIds[73] = 49000000043; // Original V4 Token ID
        v5TokenIds[74] = 49000000044; // Minted V5 Token ID
        v4TokenIds[74] = 49000000044; // Original V4 Token ID
        v5TokenIds[75] = 49000000045; // Minted V5 Token ID
        v4TokenIds[75] = 49000000045; // Original V4 Token ID
        v5TokenIds[76] = 49000000046; // Minted V5 Token ID
        v4TokenIds[76] = 49000000046; // Original V4 Token ID
        v5TokenIds[77] = 49000000047; // Minted V5 Token ID
        v4TokenIds[77] = 49000000047; // Original V4 Token ID
        v5TokenIds[78] = 49000000048; // Minted V5 Token ID
        v4TokenIds[78] = 49000000048; // Original V4 Token ID
        v5TokenIds[79] = 49000000049; // Minted V5 Token ID
        v4TokenIds[79] = 49000000049; // Original V4 Token ID
        v5TokenIds[80] = 49000000050; // Minted V5 Token ID
        v4TokenIds[80] = 49000000050; // Original V4 Token ID
        v5TokenIds[81] = 49000000051; // Minted V5 Token ID
        v4TokenIds[81] = 49000000051; // Original V4 Token ID
        v5TokenIds[82] = 49000000052; // Minted V5 Token ID
        v4TokenIds[82] = 49000000052; // Original V4 Token ID
        v5TokenIds[83] = 49000000053; // Minted V5 Token ID
        v4TokenIds[83] = 49000000053; // Original V4 Token ID
        v5TokenIds[84] = 49000000054; // Minted V5 Token ID
        v4TokenIds[84] = 49000000054; // Original V4 Token ID
        v5TokenIds[85] = 49000000055; // Minted V5 Token ID
        v4TokenIds[85] = 49000000055; // Original V4 Token ID
        v5TokenIds[86] = 49000000056; // Minted V5 Token ID
        v4TokenIds[86] = 49000000056; // Original V4 Token ID
        v5TokenIds[87] = 49000000057; // Minted V5 Token ID
        v4TokenIds[87] = 49000000057; // Original V4 Token ID
        v5TokenIds[88] = 49000000058; // Minted V5 Token ID
        v4TokenIds[88] = 49000000058; // Original V4 Token ID
        v5TokenIds[89] = 49000000059; // Minted V5 Token ID
        v4TokenIds[89] = 49000000059; // Original V4 Token ID
        v5TokenIds[90] = 49000000060; // Minted V5 Token ID
        v4TokenIds[90] = 49000000060; // Original V4 Token ID
        v5TokenIds[91] = 49000000061; // Minted V5 Token ID
        v4TokenIds[91] = 49000000061; // Original V4 Token ID
        v5TokenIds[92] = 49000000062; // Minted V5 Token ID
        v4TokenIds[92] = 49000000062; // Original V4 Token ID
        v5TokenIds[93] = 49000000063; // Minted V5 Token ID
        v4TokenIds[93] = 49000000063; // Original V4 Token ID
        v5TokenIds[94] = 49000000064; // Minted V5 Token ID
        v4TokenIds[94] = 49000000064; // Original V4 Token ID
        v5TokenIds[95] = 49000000065; // Minted V5 Token ID
        v4TokenIds[95] = 49000000065; // Original V4 Token ID
        v5TokenIds[96] = 49000000066; // Minted V5 Token ID
        v4TokenIds[96] = 49000000066; // Original V4 Token ID
        v5TokenIds[97] = 49000000067; // Minted V5 Token ID
        v4TokenIds[97] = 49000000067; // Original V4 Token ID
        v5TokenIds[98] = 49000000068; // Minted V5 Token ID
        v4TokenIds[98] = 49000000068; // Original V4 Token ID
        v5TokenIds[99] = 49000000069; // Minted V5 Token ID
        v4TokenIds[99] = 49000000069; // Original V4 Token ID
        v5TokenIds[100] = 49000000070; // Minted V5 Token ID
        v4TokenIds[100] = 49000000070; // Original V4 Token ID
        v5TokenIds[101] = 49000000071; // Minted V5 Token ID
        v4TokenIds[101] = 49000000071; // Original V4 Token ID
        v5TokenIds[102] = 49000000072; // Minted V5 Token ID
        v4TokenIds[102] = 49000000072; // Original V4 Token ID
        v5TokenIds[103] = 49000000073; // Minted V5 Token ID
        v4TokenIds[103] = 49000000073; // Original V4 Token ID
        v5TokenIds[104] = 49000000074; // Minted V5 Token ID
        v4TokenIds[104] = 49000000074; // Original V4 Token ID
        v5TokenIds[105] = 49000000075; // Minted V5 Token ID
        v4TokenIds[105] = 49000000075; // Original V4 Token ID
        v5TokenIds[106] = 49000000076; // Minted V5 Token ID
        v4TokenIds[106] = 49000000076; // Original V4 Token ID
        v5TokenIds[107] = 49000000077; // Minted V5 Token ID
        v4TokenIds[107] = 49000000077; // Original V4 Token ID
        v5TokenIds[108] = 49000000078; // Minted V5 Token ID
        v4TokenIds[108] = 49000000078; // Original V4 Token ID
        v5TokenIds[109] = 49000000079; // Minted V5 Token ID
        v4TokenIds[109] = 49000000079; // Original V4 Token ID
        v5TokenIds[110] = 49000000080; // Minted V5 Token ID
        v4TokenIds[110] = 49000000080; // Original V4 Token ID
        v5TokenIds[111] = 49000000081; // Minted V5 Token ID
        v4TokenIds[111] = 49000000081; // Original V4 Token ID
        v5TokenIds[112] = 49000000082; // Minted V5 Token ID
        v4TokenIds[112] = 49000000082; // Original V4 Token ID
        v5TokenIds[113] = 49000000083; // Minted V5 Token ID
        v4TokenIds[113] = 49000000083; // Original V4 Token ID
        v5TokenIds[114] = 49000000084; // Minted V5 Token ID
        v4TokenIds[114] = 49000000084; // Original V4 Token ID
        v5TokenIds[115] = 49000000085; // Minted V5 Token ID
        v4TokenIds[115] = 49000000085; // Original V4 Token ID
        v5TokenIds[116] = 49000000086; // Minted V5 Token ID
        v4TokenIds[116] = 49000000086; // Original V4 Token ID
        v5TokenIds[117] = 49000000087; // Minted V5 Token ID
        v4TokenIds[117] = 49000000087; // Original V4 Token ID
        v5TokenIds[118] = 49000000088; // Minted V5 Token ID
        v4TokenIds[118] = 49000000088; // Original V4 Token ID
        v5TokenIds[119] = 49000000089; // Minted V5 Token ID
        v4TokenIds[119] = 49000000089; // Original V4 Token ID
        v5TokenIds[120] = 49000000090; // Minted V5 Token ID
        v4TokenIds[120] = 49000000090; // Original V4 Token ID
        v5TokenIds[121] = 49000000091; // Minted V5 Token ID
        v4TokenIds[121] = 49000000091; // Original V4 Token ID
        v5TokenIds[122] = 49000000092; // Minted V5 Token ID
        v4TokenIds[122] = 49000000092; // Original V4 Token ID
        v5TokenIds[123] = 49000000093; // Minted V5 Token ID
        v4TokenIds[123] = 49000000093; // Original V4 Token ID
        v5TokenIds[124] = 49000000094; // Minted V5 Token ID
        v4TokenIds[124] = 49000000094; // Original V4 Token ID
        v5TokenIds[125] = 49000000095; // Minted V5 Token ID
        v4TokenIds[125] = 49000000095; // Original V4 Token ID
        v5TokenIds[126] = 49000000096; // Minted V5 Token ID
        v4TokenIds[126] = 49000000096; // Original V4 Token ID
        v5TokenIds[127] = 49000000097; // Minted V5 Token ID
        v4TokenIds[127] = 49000000097; // Original V4 Token ID
        v5TokenIds[128] = 49000000098; // Minted V5 Token ID
        v4TokenIds[128] = 49000000098; // Original V4 Token ID
        v5TokenIds[129] = 49000000099; // Minted V5 Token ID
        v4TokenIds[129] = 49000000099; // Original V4 Token ID
        v5TokenIds[130] = 49000000100; // Minted V5 Token ID
        v4TokenIds[130] = 49000000100; // Original V4 Token ID
        v5TokenIds[131] = 49000000101; // Minted V5 Token ID
        v4TokenIds[131] = 49000000101; // Original V4 Token ID
        v5TokenIds[132] = 49000000102; // Minted V5 Token ID
        v4TokenIds[132] = 49000000102; // Original V4 Token ID
        v5TokenIds[133] = 49000000103; // Minted V5 Token ID
        v4TokenIds[133] = 49000000103; // Original V4 Token ID
        v5TokenIds[134] = 49000000104; // Minted V5 Token ID
        v4TokenIds[134] = 49000000104; // Original V4 Token ID
        v5TokenIds[135] = 49000000105; // Minted V5 Token ID
        v4TokenIds[135] = 49000000105; // Original V4 Token ID
        v5TokenIds[136] = 49000000106; // Minted V5 Token ID
        v4TokenIds[136] = 49000000106; // Original V4 Token ID
        v5TokenIds[137] = 49000000107; // Minted V5 Token ID
        v4TokenIds[137] = 49000000107; // Original V4 Token ID
        v5TokenIds[138] = 49000000108; // Minted V5 Token ID
        v4TokenIds[138] = 49000000108; // Original V4 Token ID
        v5TokenIds[139] = 49000000109; // Minted V5 Token ID
        v4TokenIds[139] = 49000000109; // Original V4 Token ID
        v5TokenIds[140] = 49000000110; // Minted V5 Token ID
        v4TokenIds[140] = 49000000110; // Original V4 Token ID
        v5TokenIds[141] = 49000000111; // Minted V5 Token ID
        v4TokenIds[141] = 49000000111; // Original V4 Token ID
        v5TokenIds[142] = 49000000112; // Minted V5 Token ID
        v4TokenIds[142] = 49000000112; // Original V4 Token ID
        v5TokenIds[143] = 49000000113; // Minted V5 Token ID
        v4TokenIds[143] = 49000000113; // Original V4 Token ID
        v5TokenIds[144] = 49000000114; // Minted V5 Token ID
        v4TokenIds[144] = 49000000114; // Original V4 Token ID
        v5TokenIds[145] = 49000000115; // Minted V5 Token ID
        v4TokenIds[145] = 49000000115; // Original V4 Token ID
        v5TokenIds[146] = 49000000116; // Minted V5 Token ID
        v4TokenIds[146] = 49000000116; // Original V4 Token ID
        v5TokenIds[147] = 49000000117; // Minted V5 Token ID
        v4TokenIds[147] = 49000000117; // Original V4 Token ID
        v5TokenIds[148] = 49000000118; // Minted V5 Token ID
        v4TokenIds[148] = 49000000118; // Original V4 Token ID
        v5TokenIds[149] = 49000000119; // Minted V5 Token ID
        v4TokenIds[149] = 49000000119; // Original V4 Token ID
        v5TokenIds[150] = 49000000120; // Minted V5 Token ID
        v4TokenIds[150] = 49000000120; // Original V4 Token ID
        v5TokenIds[151] = 49000000121; // Minted V5 Token ID
        v4TokenIds[151] = 49000000121; // Original V4 Token ID
        v5TokenIds[152] = 49000000122; // Minted V5 Token ID
        v4TokenIds[152] = 49000000122; // Original V4 Token ID
        v5TokenIds[153] = 49000000123; // Minted V5 Token ID
        v4TokenIds[153] = 49000000123; // Original V4 Token ID
        v5TokenIds[154] = 49000000124; // Minted V5 Token ID
        v4TokenIds[154] = 49000000124; // Original V4 Token ID
        v5TokenIds[155] = 49000000125; // Minted V5 Token ID
        v4TokenIds[155] = 49000000125; // Original V4 Token ID
        v5TokenIds[156] = 49000000126; // Minted V5 Token ID
        v4TokenIds[156] = 49000000126; // Original V4 Token ID
        v5TokenIds[157] = 49000000127; // Minted V5 Token ID
        v4TokenIds[157] = 49000000127; // Original V4 Token ID
        v5TokenIds[158] = 49000000128; // Minted V5 Token ID
        v4TokenIds[158] = 49000000128; // Original V4 Token ID
        v5TokenIds[159] = 49000000129; // Minted V5 Token ID
        v4TokenIds[159] = 49000000129; // Original V4 Token ID
        v5TokenIds[160] = 49000000130; // Minted V5 Token ID
        v4TokenIds[160] = 49000000130; // Original V4 Token ID
        v5TokenIds[161] = 49000000131; // Minted V5 Token ID
        v4TokenIds[161] = 49000000131; // Original V4 Token ID
        v5TokenIds[162] = 49000000132; // Minted V5 Token ID
        v4TokenIds[162] = 49000000132; // Original V4 Token ID
        v5TokenIds[163] = 49000000133; // Minted V5 Token ID
        v4TokenIds[163] = 49000000133; // Original V4 Token ID
        v5TokenIds[164] = 49000000134; // Minted V5 Token ID
        v4TokenIds[164] = 49000000134; // Original V4 Token ID
        v5TokenIds[165] = 49000000135; // Minted V5 Token ID
        v4TokenIds[165] = 49000000135; // Original V4 Token ID
        v5TokenIds[166] = 49000000136; // Minted V5 Token ID
        v4TokenIds[166] = 49000000136; // Original V4 Token ID
        v5TokenIds[167] = 49000000137; // Minted V5 Token ID
        v4TokenIds[167] = 49000000137; // Original V4 Token ID
        v5TokenIds[168] = 49000000138; // Minted V5 Token ID
        v4TokenIds[168] = 49000000138; // Original V4 Token ID
        v5TokenIds[169] = 49000000139; // Minted V5 Token ID
        v4TokenIds[169] = 49000000139; // Original V4 Token ID
        v5TokenIds[170] = 49000000140; // Minted V5 Token ID
        v4TokenIds[170] = 49000000140; // Original V4 Token ID
        v5TokenIds[171] = 49000000141; // Minted V5 Token ID
        v4TokenIds[171] = 49000000141; // Original V4 Token ID
        v5TokenIds[172] = 49000000142; // Minted V5 Token ID
        v4TokenIds[172] = 49000000142; // Original V4 Token ID
        v5TokenIds[173] = 49000000143; // Minted V5 Token ID
        v4TokenIds[173] = 49000000143; // Original V4 Token ID
        v5TokenIds[174] = 49000000144; // Minted V5 Token ID
        v4TokenIds[174] = 49000000144; // Original V4 Token ID
        v5TokenIds[175] = 49000000145; // Minted V5 Token ID
        v4TokenIds[175] = 49000000145; // Original V4 Token ID

        
        uint256 successfulTransfers = 0;
        
        for (uint256 i = 0; i < transferOwners.length; i++) {
            uint256 v5TokenId = v5TokenIds[i];
            uint256 v4TokenId = v4TokenIds[i];
            
            // Verify V4 ownership using the original V4 token ID
            // This will revert if the token doesn't exist, which indicates a data issue
            address v4Owner = v4Hook.ownerOf(v4TokenId);
            address expectedOwner = transferOwners[i];
            
            // If V4 owner is the main resolver, this token is being worn/used and shouldn't be in unused assets contract
            require(
                v4Owner != address(v4ResolverAddress),
                "Token owned by main resolver in V4 - should not be in unused assets contract"
            );
            
            // Special case: If V4 owner is the fallback resolver BUT expected owner is NOT a resolver,
            // this is valid - the asset is being worn in V4 but we're minting directly to the actual owner in V5
            // raw.json already accounts for this and has the correct owner
            if (v4Owner == address(fallbackV4ResolverAddress)) {
                // Allow if expected owner is not a resolver (we're minting directly to owner in V5)
                require(
                    expectedOwner != address(v4ResolverAddress) && expectedOwner != address(fallbackV4ResolverAddress),
                    "Token owned by fallback resolver in V4 but expected owner is also a resolver - should not be in unused assets contract"
                );
                // Skip ownership verification in this case - we trust raw.json
            } else {
                // For all other cases, verify V4 owner matches expected owner
                require(v4Owner == expectedOwner, "V4/V5 ownership mismatch for token");
            }
            
            // Verify this contract owns the V5 token before transferring
            require(hook.ownerOf(v5TokenId) == address(this), "Contract does not own token");
            
            // Transfer using the minted V5 token ID
            IERC721(address(hook)).safeTransferFrom(
                address(this), 
                transferOwners[i], 
                v5TokenId
            );
            successfulTransfers++;
        }
        
        // Verify all expected items were transferred
        require(
            successfulTransfers == transferOwners.length,
            "Not all items were transferred"
        );
        
        // Final verification: Ensure this contract no longer owns any tokens
        // This ensures all transfers completed successfully and no tokens were left behind
        require(hook.balanceOf(address(this)) == 0, "Contract still owns tokens after migration");
        
        // Verify tier balances: V5 should never exceed V4 (except for tiers owned by fallback resolver in V4)
        
        // Collect unique owners
        address[] memory uniqueOwners = new address[](3);
        
        uniqueOwners[0] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        uniqueOwners[1] = 0x1C51517d8277C9aD6d701Fb5394ceC0C18219eDb;
        uniqueOwners[2] = 0x57a482EA32c7F75A9C0734206f5BD4f9BCb38e12;
        
        // Collect unique tier IDs
        uint256[] memory uniqueTierIds = new uint256[](7);
        
        uniqueTierIds[0] = 5;
        uniqueTierIds[1] = 19;
        uniqueTierIds[2] = 31;
        uniqueTierIds[3] = 32;
        uniqueTierIds[4] = 39;
        uniqueTierIds[5] = 47;
        uniqueTierIds[6] = 49;
        
        // Verify tier balances: V5 should never exceed V4 (except for tiers owned by fallback resolver in V4)
        MigrationHelper.verifyTierBalances(
            hookAddress,
            v4HookAddress,
            fallbackV4ResolverAddress,
            uniqueOwners,
            uniqueTierIds
        );
    }
}