// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";

/// @notice Migration contract for Ethereum to handle standalone outfits and backgrounds
/// that are not worn/used by any banny. These assets are minted to this contract
/// and then transferred directly to their owners.
contract MigrationContractEthereum4 {
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
        
        // Ethereum migration - Standalone outfits and backgrounds (280 items)
        // These are assets that are NOT being worn/used by any banny
        
        // Assets are already minted to this contract by the deployer
        // V5 token IDs are calculated based on mint order (continuing from previous chunks)
        // V4 token IDs are the original token IDs from V4
        
        // Generate token IDs - store both V5 minted token IDs and original V4 token IDs
        uint256[] memory v5TokenIds = new uint256[](transferOwners.length);
        uint256[] memory v4TokenIds = new uint256[](transferOwners.length);
                v5TokenIds[0] = 10000000014; // Minted V5 Token ID
        v4TokenIds[0] = 10000000004; // Original V4 Token ID
        v5TokenIds[1] = 10000000015; // Minted V5 Token ID
        v4TokenIds[1] = 10000000008; // Original V4 Token ID
        v5TokenIds[2] = 10000000016; // Minted V5 Token ID
        v4TokenIds[2] = 10000000009; // Original V4 Token ID
        v5TokenIds[3] = 10000000017; // Minted V5 Token ID
        v4TokenIds[3] = 10000000010; // Original V4 Token ID
        v5TokenIds[4] = 10000000018; // Minted V5 Token ID
        v4TokenIds[4] = 10000000011; // Original V4 Token ID
        v5TokenIds[5] = 10000000019; // Minted V5 Token ID
        v4TokenIds[5] = 10000000013; // Original V4 Token ID
        v5TokenIds[6] = 10000000020; // Minted V5 Token ID
        v4TokenIds[6] = 10000000014; // Original V4 Token ID
        v5TokenIds[7] = 11000000001; // Minted V5 Token ID
        v4TokenIds[7] = 11000000001; // Original V4 Token ID
        v5TokenIds[8] = 13000000004; // Minted V5 Token ID
        v4TokenIds[8] = 13000000002; // Original V4 Token ID
        v5TokenIds[9] = 13000000005; // Minted V5 Token ID
        v4TokenIds[9] = 13000000004; // Original V4 Token ID
        v5TokenIds[10] = 14000000006; // Minted V5 Token ID
        v4TokenIds[10] = 14000000002; // Original V4 Token ID
        v5TokenIds[11] = 14000000007; // Minted V5 Token ID
        v4TokenIds[11] = 14000000004; // Original V4 Token ID
        v5TokenIds[12] = 14000000008; // Minted V5 Token ID
        v4TokenIds[12] = 14000000006; // Original V4 Token ID
        v5TokenIds[13] = 17000000005; // Minted V5 Token ID
        v4TokenIds[13] = 17000000003; // Original V4 Token ID
        v5TokenIds[14] = 17000000006; // Minted V5 Token ID
        v4TokenIds[14] = 17000000004; // Original V4 Token ID
        v5TokenIds[15] = 17000000007; // Minted V5 Token ID
        v4TokenIds[15] = 17000000005; // Original V4 Token ID
        v5TokenIds[16] = 19000000022; // Minted V5 Token ID
        v4TokenIds[16] = 19000000001; // Original V4 Token ID
        v5TokenIds[17] = 19000000023; // Minted V5 Token ID
        v4TokenIds[17] = 19000000003; // Original V4 Token ID
        v5TokenIds[18] = 19000000024; // Minted V5 Token ID
        v4TokenIds[18] = 19000000006; // Original V4 Token ID
        v5TokenIds[19] = 19000000025; // Minted V5 Token ID
        v4TokenIds[19] = 19000000007; // Original V4 Token ID
        v5TokenIds[20] = 19000000026; // Minted V5 Token ID
        v4TokenIds[20] = 19000000010; // Original V4 Token ID
        v5TokenIds[21] = 19000000027; // Minted V5 Token ID
        v4TokenIds[21] = 19000000014; // Original V4 Token ID
        v5TokenIds[22] = 19000000028; // Minted V5 Token ID
        v4TokenIds[22] = 19000000022; // Original V4 Token ID
        v5TokenIds[23] = 20000000008; // Minted V5 Token ID
        v4TokenIds[23] = 20000000002; // Original V4 Token ID
        v5TokenIds[24] = 20000000009; // Minted V5 Token ID
        v4TokenIds[24] = 20000000003; // Original V4 Token ID
        v5TokenIds[25] = 20000000010; // Minted V5 Token ID
        v4TokenIds[25] = 20000000004; // Original V4 Token ID
        v5TokenIds[26] = 20000000011; // Minted V5 Token ID
        v4TokenIds[26] = 20000000005; // Original V4 Token ID
        v5TokenIds[27] = 20000000012; // Minted V5 Token ID
        v4TokenIds[27] = 20000000006; // Original V4 Token ID
        v5TokenIds[28] = 20000000013; // Minted V5 Token ID
        v4TokenIds[28] = 20000000007; // Original V4 Token ID
        v5TokenIds[29] = 21000000002; // Minted V5 Token ID
        v4TokenIds[29] = 21000000002; // Original V4 Token ID
        v5TokenIds[30] = 23000000008; // Minted V5 Token ID
        v4TokenIds[30] = 23000000006; // Original V4 Token ID
        v5TokenIds[31] = 23000000009; // Minted V5 Token ID
        v4TokenIds[31] = 23000000008; // Original V4 Token ID
        v5TokenIds[32] = 25000000012; // Minted V5 Token ID
        v4TokenIds[32] = 25000000001; // Original V4 Token ID
        v5TokenIds[33] = 25000000013; // Minted V5 Token ID
        v4TokenIds[33] = 25000000004; // Original V4 Token ID
        v5TokenIds[34] = 25000000014; // Minted V5 Token ID
        v4TokenIds[34] = 25000000012; // Original V4 Token ID
        v5TokenIds[35] = 26000000007; // Minted V5 Token ID
        v4TokenIds[35] = 26000000006; // Original V4 Token ID
        v5TokenIds[36] = 26000000008; // Minted V5 Token ID
        v4TokenIds[36] = 26000000007; // Original V4 Token ID
        v5TokenIds[37] = 28000000009; // Minted V5 Token ID
        v4TokenIds[37] = 28000000001; // Original V4 Token ID
        v5TokenIds[38] = 28000000010; // Minted V5 Token ID
        v4TokenIds[38] = 28000000003; // Original V4 Token ID
        v5TokenIds[39] = 28000000011; // Minted V5 Token ID
        v4TokenIds[39] = 28000000004; // Original V4 Token ID
        v5TokenIds[40] = 28000000012; // Minted V5 Token ID
        v4TokenIds[40] = 28000000005; // Original V4 Token ID
        v5TokenIds[41] = 28000000013; // Minted V5 Token ID
        v4TokenIds[41] = 28000000006; // Original V4 Token ID
        v5TokenIds[42] = 28000000014; // Minted V5 Token ID
        v4TokenIds[42] = 28000000007; // Original V4 Token ID
        v5TokenIds[43] = 28000000015; // Minted V5 Token ID
        v4TokenIds[43] = 28000000009; // Original V4 Token ID
        v5TokenIds[44] = 29000000003; // Minted V5 Token ID
        v4TokenIds[44] = 29000000001; // Original V4 Token ID
        v5TokenIds[45] = 31000000013; // Minted V5 Token ID
        v4TokenIds[45] = 31000000001; // Original V4 Token ID
        v5TokenIds[46] = 31000000014; // Minted V5 Token ID
        v4TokenIds[46] = 31000000004; // Original V4 Token ID
        v5TokenIds[47] = 31000000015; // Minted V5 Token ID
        v4TokenIds[47] = 31000000005; // Original V4 Token ID
        v5TokenIds[48] = 31000000016; // Minted V5 Token ID
        v4TokenIds[48] = 31000000008; // Original V4 Token ID
        v5TokenIds[49] = 31000000017; // Minted V5 Token ID
        v4TokenIds[49] = 31000000012; // Original V4 Token ID
        v5TokenIds[50] = 32000000005; // Minted V5 Token ID
        v4TokenIds[50] = 32000000004; // Original V4 Token ID
        v5TokenIds[51] = 32000000006; // Minted V5 Token ID
        v4TokenIds[51] = 32000000005; // Original V4 Token ID
        v5TokenIds[52] = 33000000002; // Minted V5 Token ID
        v4TokenIds[52] = 33000000002; // Original V4 Token ID
        v5TokenIds[53] = 35000000009; // Minted V5 Token ID
        v4TokenIds[53] = 35000000005; // Original V4 Token ID
        v5TokenIds[54] = 35000000010; // Minted V5 Token ID
        v4TokenIds[54] = 35000000008; // Original V4 Token ID
        v5TokenIds[55] = 35000000011; // Minted V5 Token ID
        v4TokenIds[55] = 35000000009; // Original V4 Token ID
        v5TokenIds[56] = 37000000004; // Minted V5 Token ID
        v4TokenIds[56] = 37000000002; // Original V4 Token ID
        v5TokenIds[57] = 37000000005; // Minted V5 Token ID
        v4TokenIds[57] = 37000000004; // Original V4 Token ID
        v5TokenIds[58] = 39000000004; // Minted V5 Token ID
        v4TokenIds[58] = 39000000004; // Original V4 Token ID
        v5TokenIds[59] = 40000000003; // Minted V5 Token ID
        v4TokenIds[59] = 40000000002; // Original V4 Token ID
        v5TokenIds[60] = 40000000004; // Minted V5 Token ID
        v4TokenIds[60] = 40000000003; // Original V4 Token ID
        v5TokenIds[61] = 41000000005; // Minted V5 Token ID
        v4TokenIds[61] = 41000000005; // Original V4 Token ID
        v5TokenIds[62] = 42000000019; // Minted V5 Token ID
        v4TokenIds[62] = 42000000001; // Original V4 Token ID
        v5TokenIds[63] = 42000000020; // Minted V5 Token ID
        v4TokenIds[63] = 42000000003; // Original V4 Token ID
        v5TokenIds[64] = 42000000021; // Minted V5 Token ID
        v4TokenIds[64] = 42000000005; // Original V4 Token ID
        v5TokenIds[65] = 42000000022; // Minted V5 Token ID
        v4TokenIds[65] = 42000000006; // Original V4 Token ID
        v5TokenIds[66] = 42000000023; // Minted V5 Token ID
        v4TokenIds[66] = 42000000008; // Original V4 Token ID
        v5TokenIds[67] = 42000000024; // Minted V5 Token ID
        v4TokenIds[67] = 42000000009; // Original V4 Token ID
        v5TokenIds[68] = 42000000025; // Minted V5 Token ID
        v4TokenIds[68] = 42000000010; // Original V4 Token ID
        v5TokenIds[69] = 42000000026; // Minted V5 Token ID
        v4TokenIds[69] = 42000000011; // Original V4 Token ID
        v5TokenIds[70] = 42000000027; // Minted V5 Token ID
        v4TokenIds[70] = 42000000012; // Original V4 Token ID
        v5TokenIds[71] = 42000000028; // Minted V5 Token ID
        v4TokenIds[71] = 42000000013; // Original V4 Token ID
        v5TokenIds[72] = 42000000029; // Minted V5 Token ID
        v4TokenIds[72] = 42000000014; // Original V4 Token ID
        v5TokenIds[73] = 42000000030; // Minted V5 Token ID
        v4TokenIds[73] = 42000000015; // Original V4 Token ID
        v5TokenIds[74] = 42000000031; // Minted V5 Token ID
        v4TokenIds[74] = 42000000016; // Original V4 Token ID
        v5TokenIds[75] = 42000000032; // Minted V5 Token ID
        v4TokenIds[75] = 42000000017; // Original V4 Token ID
        v5TokenIds[76] = 42000000033; // Minted V5 Token ID
        v4TokenIds[76] = 42000000018; // Original V4 Token ID
        v5TokenIds[77] = 42000000034; // Minted V5 Token ID
        v4TokenIds[77] = 42000000019; // Original V4 Token ID
        v5TokenIds[78] = 43000000018; // Minted V5 Token ID
        v4TokenIds[78] = 43000000001; // Original V4 Token ID
        v5TokenIds[79] = 43000000019; // Minted V5 Token ID
        v4TokenIds[79] = 43000000002; // Original V4 Token ID
        v5TokenIds[80] = 43000000020; // Minted V5 Token ID
        v4TokenIds[80] = 43000000004; // Original V4 Token ID
        v5TokenIds[81] = 43000000021; // Minted V5 Token ID
        v4TokenIds[81] = 43000000009; // Original V4 Token ID
        v5TokenIds[82] = 43000000022; // Minted V5 Token ID
        v4TokenIds[82] = 43000000010; // Original V4 Token ID
        v5TokenIds[83] = 43000000023; // Minted V5 Token ID
        v4TokenIds[83] = 43000000011; // Original V4 Token ID
        v5TokenIds[84] = 43000000024; // Minted V5 Token ID
        v4TokenIds[84] = 43000000012; // Original V4 Token ID
        v5TokenIds[85] = 43000000025; // Minted V5 Token ID
        v4TokenIds[85] = 43000000013; // Original V4 Token ID
        v5TokenIds[86] = 43000000026; // Minted V5 Token ID
        v4TokenIds[86] = 43000000014; // Original V4 Token ID
        v5TokenIds[87] = 43000000027; // Minted V5 Token ID
        v4TokenIds[87] = 43000000015; // Original V4 Token ID
        v5TokenIds[88] = 43000000028; // Minted V5 Token ID
        v4TokenIds[88] = 43000000016; // Original V4 Token ID
        v5TokenIds[89] = 44000000034; // Minted V5 Token ID
        v4TokenIds[89] = 44000000002; // Original V4 Token ID
        v5TokenIds[90] = 44000000035; // Minted V5 Token ID
        v4TokenIds[90] = 44000000005; // Original V4 Token ID
        v5TokenIds[91] = 44000000036; // Minted V5 Token ID
        v4TokenIds[91] = 44000000006; // Original V4 Token ID
        v5TokenIds[92] = 44000000037; // Minted V5 Token ID
        v4TokenIds[92] = 44000000007; // Original V4 Token ID
        v5TokenIds[93] = 44000000038; // Minted V5 Token ID
        v4TokenIds[93] = 44000000010; // Original V4 Token ID
        v5TokenIds[94] = 44000000039; // Minted V5 Token ID
        v4TokenIds[94] = 44000000011; // Original V4 Token ID
        v5TokenIds[95] = 44000000040; // Minted V5 Token ID
        v4TokenIds[95] = 44000000012; // Original V4 Token ID
        v5TokenIds[96] = 44000000041; // Minted V5 Token ID
        v4TokenIds[96] = 44000000013; // Original V4 Token ID
        v5TokenIds[97] = 44000000042; // Minted V5 Token ID
        v4TokenIds[97] = 44000000014; // Original V4 Token ID
        v5TokenIds[98] = 44000000043; // Minted V5 Token ID
        v4TokenIds[98] = 44000000015; // Original V4 Token ID
        v5TokenIds[99] = 44000000044; // Minted V5 Token ID
        v4TokenIds[99] = 44000000016; // Original V4 Token ID
        v5TokenIds[100] = 44000000045; // Minted V5 Token ID
        v4TokenIds[100] = 44000000017; // Original V4 Token ID
        v5TokenIds[101] = 44000000046; // Minted V5 Token ID
        v4TokenIds[101] = 44000000018; // Original V4 Token ID
        v5TokenIds[102] = 44000000047; // Minted V5 Token ID
        v4TokenIds[102] = 44000000019; // Original V4 Token ID
        v5TokenIds[103] = 44000000048; // Minted V5 Token ID
        v4TokenIds[103] = 44000000020; // Original V4 Token ID
        v5TokenIds[104] = 44000000049; // Minted V5 Token ID
        v4TokenIds[104] = 44000000021; // Original V4 Token ID
        v5TokenIds[105] = 44000000050; // Minted V5 Token ID
        v4TokenIds[105] = 44000000022; // Original V4 Token ID
        v5TokenIds[106] = 44000000051; // Minted V5 Token ID
        v4TokenIds[106] = 44000000023; // Original V4 Token ID
        v5TokenIds[107] = 44000000052; // Minted V5 Token ID
        v4TokenIds[107] = 44000000024; // Original V4 Token ID
        v5TokenIds[108] = 44000000053; // Minted V5 Token ID
        v4TokenIds[108] = 44000000025; // Original V4 Token ID
        v5TokenIds[109] = 44000000054; // Minted V5 Token ID
        v4TokenIds[109] = 44000000026; // Original V4 Token ID
        v5TokenIds[110] = 44000000055; // Minted V5 Token ID
        v4TokenIds[110] = 44000000027; // Original V4 Token ID
        v5TokenIds[111] = 44000000056; // Minted V5 Token ID
        v4TokenIds[111] = 44000000028; // Original V4 Token ID
        v5TokenIds[112] = 44000000057; // Minted V5 Token ID
        v4TokenIds[112] = 44000000029; // Original V4 Token ID
        v5TokenIds[113] = 44000000058; // Minted V5 Token ID
        v4TokenIds[113] = 44000000030; // Original V4 Token ID
        v5TokenIds[114] = 44000000059; // Minted V5 Token ID
        v4TokenIds[114] = 44000000031; // Original V4 Token ID
        v5TokenIds[115] = 44000000060; // Minted V5 Token ID
        v4TokenIds[115] = 44000000032; // Original V4 Token ID
        v5TokenIds[116] = 44000000061; // Minted V5 Token ID
        v4TokenIds[116] = 44000000033; // Original V4 Token ID
        v5TokenIds[117] = 44000000062; // Minted V5 Token ID
        v4TokenIds[117] = 44000000034; // Original V4 Token ID
        v5TokenIds[118] = 47000000014; // Minted V5 Token ID
        v4TokenIds[118] = 47000000001; // Original V4 Token ID
        v5TokenIds[119] = 47000000015; // Minted V5 Token ID
        v4TokenIds[119] = 47000000002; // Original V4 Token ID
        v5TokenIds[120] = 47000000016; // Minted V5 Token ID
        v4TokenIds[120] = 47000000004; // Original V4 Token ID
        v5TokenIds[121] = 47000000017; // Minted V5 Token ID
        v4TokenIds[121] = 47000000006; // Original V4 Token ID
        v5TokenIds[122] = 47000000018; // Minted V5 Token ID
        v4TokenIds[122] = 47000000007; // Original V4 Token ID
        v5TokenIds[123] = 47000000019; // Minted V5 Token ID
        v4TokenIds[123] = 47000000008; // Original V4 Token ID
        v5TokenIds[124] = 47000000020; // Minted V5 Token ID
        v4TokenIds[124] = 47000000009; // Original V4 Token ID
        v5TokenIds[125] = 47000000021; // Minted V5 Token ID
        v4TokenIds[125] = 47000000010; // Original V4 Token ID
        v5TokenIds[126] = 47000000022; // Minted V5 Token ID
        v4TokenIds[126] = 47000000011; // Original V4 Token ID
        v5TokenIds[127] = 47000000023; // Minted V5 Token ID
        v4TokenIds[127] = 47000000012; // Original V4 Token ID
        v5TokenIds[128] = 47000000024; // Minted V5 Token ID
        v4TokenIds[128] = 47000000013; // Original V4 Token ID
        v5TokenIds[129] = 47000000025; // Minted V5 Token ID
        v4TokenIds[129] = 47000000014; // Original V4 Token ID
        v5TokenIds[130] = 48000000006; // Minted V5 Token ID
        v4TokenIds[130] = 48000000004; // Original V4 Token ID
        v5TokenIds[131] = 49000000145; // Minted V5 Token ID
        v4TokenIds[131] = 49000000003; // Original V4 Token ID
        v5TokenIds[132] = 49000000146; // Minted V5 Token ID
        v4TokenIds[132] = 49000000005; // Original V4 Token ID
        v5TokenIds[133] = 49000000147; // Minted V5 Token ID
        v4TokenIds[133] = 49000000006; // Original V4 Token ID
        v5TokenIds[134] = 49000000148; // Minted V5 Token ID
        v4TokenIds[134] = 49000000007; // Original V4 Token ID
        v5TokenIds[135] = 49000000149; // Minted V5 Token ID
        v4TokenIds[135] = 49000000008; // Original V4 Token ID
        v5TokenIds[136] = 49000000150; // Minted V5 Token ID
        v4TokenIds[136] = 49000000009; // Original V4 Token ID
        v5TokenIds[137] = 49000000151; // Minted V5 Token ID
        v4TokenIds[137] = 49000000010; // Original V4 Token ID
        v5TokenIds[138] = 49000000152; // Minted V5 Token ID
        v4TokenIds[138] = 49000000011; // Original V4 Token ID
        v5TokenIds[139] = 49000000153; // Minted V5 Token ID
        v4TokenIds[139] = 49000000012; // Original V4 Token ID
        v5TokenIds[140] = 49000000154; // Minted V5 Token ID
        v4TokenIds[140] = 49000000013; // Original V4 Token ID
        v5TokenIds[141] = 49000000155; // Minted V5 Token ID
        v4TokenIds[141] = 49000000014; // Original V4 Token ID
        v5TokenIds[142] = 49000000156; // Minted V5 Token ID
        v4TokenIds[142] = 49000000015; // Original V4 Token ID
        v5TokenIds[143] = 49000000157; // Minted V5 Token ID
        v4TokenIds[143] = 49000000016; // Original V4 Token ID
        v5TokenIds[144] = 49000000158; // Minted V5 Token ID
        v4TokenIds[144] = 49000000017; // Original V4 Token ID
        v5TokenIds[145] = 49000000159; // Minted V5 Token ID
        v4TokenIds[145] = 49000000018; // Original V4 Token ID
        v5TokenIds[146] = 49000000160; // Minted V5 Token ID
        v4TokenIds[146] = 49000000019; // Original V4 Token ID
        v5TokenIds[147] = 49000000161; // Minted V5 Token ID
        v4TokenIds[147] = 49000000020; // Original V4 Token ID
        v5TokenIds[148] = 49000000162; // Minted V5 Token ID
        v4TokenIds[148] = 49000000021; // Original V4 Token ID
        v5TokenIds[149] = 49000000163; // Minted V5 Token ID
        v4TokenIds[149] = 49000000022; // Original V4 Token ID
        v5TokenIds[150] = 49000000164; // Minted V5 Token ID
        v4TokenIds[150] = 49000000023; // Original V4 Token ID
        v5TokenIds[151] = 49000000165; // Minted V5 Token ID
        v4TokenIds[151] = 49000000024; // Original V4 Token ID
        v5TokenIds[152] = 49000000166; // Minted V5 Token ID
        v4TokenIds[152] = 49000000025; // Original V4 Token ID
        v5TokenIds[153] = 49000000167; // Minted V5 Token ID
        v4TokenIds[153] = 49000000026; // Original V4 Token ID
        v5TokenIds[154] = 49000000168; // Minted V5 Token ID
        v4TokenIds[154] = 49000000027; // Original V4 Token ID
        v5TokenIds[155] = 49000000169; // Minted V5 Token ID
        v4TokenIds[155] = 49000000028; // Original V4 Token ID
        v5TokenIds[156] = 49000000170; // Minted V5 Token ID
        v4TokenIds[156] = 49000000029; // Original V4 Token ID
        v5TokenIds[157] = 49000000171; // Minted V5 Token ID
        v4TokenIds[157] = 49000000030; // Original V4 Token ID
        v5TokenIds[158] = 49000000172; // Minted V5 Token ID
        v4TokenIds[158] = 49000000031; // Original V4 Token ID
        v5TokenIds[159] = 49000000173; // Minted V5 Token ID
        v4TokenIds[159] = 49000000032; // Original V4 Token ID
        v5TokenIds[160] = 49000000174; // Minted V5 Token ID
        v4TokenIds[160] = 49000000033; // Original V4 Token ID
        v5TokenIds[161] = 49000000175; // Minted V5 Token ID
        v4TokenIds[161] = 49000000034; // Original V4 Token ID
        v5TokenIds[162] = 49000000176; // Minted V5 Token ID
        v4TokenIds[162] = 49000000035; // Original V4 Token ID
        v5TokenIds[163] = 49000000177; // Minted V5 Token ID
        v4TokenIds[163] = 49000000036; // Original V4 Token ID
        v5TokenIds[164] = 49000000178; // Minted V5 Token ID
        v4TokenIds[164] = 49000000037; // Original V4 Token ID
        v5TokenIds[165] = 49000000179; // Minted V5 Token ID
        v4TokenIds[165] = 49000000038; // Original V4 Token ID
        v5TokenIds[166] = 49000000180; // Minted V5 Token ID
        v4TokenIds[166] = 49000000039; // Original V4 Token ID
        v5TokenIds[167] = 49000000181; // Minted V5 Token ID
        v4TokenIds[167] = 49000000040; // Original V4 Token ID
        v5TokenIds[168] = 49000000182; // Minted V5 Token ID
        v4TokenIds[168] = 49000000041; // Original V4 Token ID
        v5TokenIds[169] = 49000000183; // Minted V5 Token ID
        v4TokenIds[169] = 49000000042; // Original V4 Token ID
        v5TokenIds[170] = 49000000184; // Minted V5 Token ID
        v4TokenIds[170] = 49000000043; // Original V4 Token ID
        v5TokenIds[171] = 49000000185; // Minted V5 Token ID
        v4TokenIds[171] = 49000000044; // Original V4 Token ID
        v5TokenIds[172] = 49000000186; // Minted V5 Token ID
        v4TokenIds[172] = 49000000045; // Original V4 Token ID
        v5TokenIds[173] = 49000000187; // Minted V5 Token ID
        v4TokenIds[173] = 49000000046; // Original V4 Token ID
        v5TokenIds[174] = 49000000188; // Minted V5 Token ID
        v4TokenIds[174] = 49000000047; // Original V4 Token ID
        v5TokenIds[175] = 49000000189; // Minted V5 Token ID
        v4TokenIds[175] = 49000000048; // Original V4 Token ID
        v5TokenIds[176] = 49000000190; // Minted V5 Token ID
        v4TokenIds[176] = 49000000049; // Original V4 Token ID
        v5TokenIds[177] = 49000000191; // Minted V5 Token ID
        v4TokenIds[177] = 49000000050; // Original V4 Token ID
        v5TokenIds[178] = 49000000192; // Minted V5 Token ID
        v4TokenIds[178] = 49000000051; // Original V4 Token ID
        v5TokenIds[179] = 49000000193; // Minted V5 Token ID
        v4TokenIds[179] = 49000000052; // Original V4 Token ID
        v5TokenIds[180] = 49000000194; // Minted V5 Token ID
        v4TokenIds[180] = 49000000053; // Original V4 Token ID
        v5TokenIds[181] = 49000000195; // Minted V5 Token ID
        v4TokenIds[181] = 49000000054; // Original V4 Token ID
        v5TokenIds[182] = 49000000196; // Minted V5 Token ID
        v4TokenIds[182] = 49000000055; // Original V4 Token ID
        v5TokenIds[183] = 49000000197; // Minted V5 Token ID
        v4TokenIds[183] = 49000000056; // Original V4 Token ID
        v5TokenIds[184] = 49000000198; // Minted V5 Token ID
        v4TokenIds[184] = 49000000057; // Original V4 Token ID
        v5TokenIds[185] = 49000000199; // Minted V5 Token ID
        v4TokenIds[185] = 49000000058; // Original V4 Token ID
        v5TokenIds[186] = 49000000200; // Minted V5 Token ID
        v4TokenIds[186] = 49000000059; // Original V4 Token ID
        v5TokenIds[187] = 49000000201; // Minted V5 Token ID
        v4TokenIds[187] = 49000000060; // Original V4 Token ID
        v5TokenIds[188] = 49000000202; // Minted V5 Token ID
        v4TokenIds[188] = 49000000061; // Original V4 Token ID
        v5TokenIds[189] = 49000000203; // Minted V5 Token ID
        v4TokenIds[189] = 49000000062; // Original V4 Token ID
        v5TokenIds[190] = 49000000204; // Minted V5 Token ID
        v4TokenIds[190] = 49000000063; // Original V4 Token ID
        v5TokenIds[191] = 49000000205; // Minted V5 Token ID
        v4TokenIds[191] = 49000000064; // Original V4 Token ID
        v5TokenIds[192] = 49000000206; // Minted V5 Token ID
        v4TokenIds[192] = 49000000065; // Original V4 Token ID
        v5TokenIds[193] = 49000000207; // Minted V5 Token ID
        v4TokenIds[193] = 49000000066; // Original V4 Token ID
        v5TokenIds[194] = 49000000208; // Minted V5 Token ID
        v4TokenIds[194] = 49000000067; // Original V4 Token ID
        v5TokenIds[195] = 49000000209; // Minted V5 Token ID
        v4TokenIds[195] = 49000000068; // Original V4 Token ID
        v5TokenIds[196] = 49000000210; // Minted V5 Token ID
        v4TokenIds[196] = 49000000069; // Original V4 Token ID
        v5TokenIds[197] = 49000000211; // Minted V5 Token ID
        v4TokenIds[197] = 49000000070; // Original V4 Token ID
        v5TokenIds[198] = 49000000212; // Minted V5 Token ID
        v4TokenIds[198] = 49000000071; // Original V4 Token ID
        v5TokenIds[199] = 49000000213; // Minted V5 Token ID
        v4TokenIds[199] = 49000000072; // Original V4 Token ID
        v5TokenIds[200] = 49000000214; // Minted V5 Token ID
        v4TokenIds[200] = 49000000073; // Original V4 Token ID
        v5TokenIds[201] = 49000000215; // Minted V5 Token ID
        v4TokenIds[201] = 49000000074; // Original V4 Token ID
        v5TokenIds[202] = 49000000216; // Minted V5 Token ID
        v4TokenIds[202] = 49000000075; // Original V4 Token ID
        v5TokenIds[203] = 49000000217; // Minted V5 Token ID
        v4TokenIds[203] = 49000000076; // Original V4 Token ID
        v5TokenIds[204] = 49000000218; // Minted V5 Token ID
        v4TokenIds[204] = 49000000077; // Original V4 Token ID
        v5TokenIds[205] = 49000000219; // Minted V5 Token ID
        v4TokenIds[205] = 49000000078; // Original V4 Token ID
        v5TokenIds[206] = 49000000220; // Minted V5 Token ID
        v4TokenIds[206] = 49000000079; // Original V4 Token ID
        v5TokenIds[207] = 49000000221; // Minted V5 Token ID
        v4TokenIds[207] = 49000000080; // Original V4 Token ID
        v5TokenIds[208] = 49000000222; // Minted V5 Token ID
        v4TokenIds[208] = 49000000081; // Original V4 Token ID
        v5TokenIds[209] = 49000000223; // Minted V5 Token ID
        v4TokenIds[209] = 49000000082; // Original V4 Token ID
        v5TokenIds[210] = 49000000224; // Minted V5 Token ID
        v4TokenIds[210] = 49000000083; // Original V4 Token ID
        v5TokenIds[211] = 49000000225; // Minted V5 Token ID
        v4TokenIds[211] = 49000000084; // Original V4 Token ID
        v5TokenIds[212] = 49000000226; // Minted V5 Token ID
        v4TokenIds[212] = 49000000085; // Original V4 Token ID
        v5TokenIds[213] = 49000000227; // Minted V5 Token ID
        v4TokenIds[213] = 49000000086; // Original V4 Token ID
        v5TokenIds[214] = 49000000228; // Minted V5 Token ID
        v4TokenIds[214] = 49000000087; // Original V4 Token ID
        v5TokenIds[215] = 49000000229; // Minted V5 Token ID
        v4TokenIds[215] = 49000000088; // Original V4 Token ID
        v5TokenIds[216] = 49000000230; // Minted V5 Token ID
        v4TokenIds[216] = 49000000089; // Original V4 Token ID
        v5TokenIds[217] = 49000000231; // Minted V5 Token ID
        v4TokenIds[217] = 49000000090; // Original V4 Token ID
        v5TokenIds[218] = 49000000232; // Minted V5 Token ID
        v4TokenIds[218] = 49000000091; // Original V4 Token ID
        v5TokenIds[219] = 49000000233; // Minted V5 Token ID
        v4TokenIds[219] = 49000000092; // Original V4 Token ID
        v5TokenIds[220] = 49000000234; // Minted V5 Token ID
        v4TokenIds[220] = 49000000093; // Original V4 Token ID
        v5TokenIds[221] = 49000000235; // Minted V5 Token ID
        v4TokenIds[221] = 49000000094; // Original V4 Token ID
        v5TokenIds[222] = 49000000236; // Minted V5 Token ID
        v4TokenIds[222] = 49000000095; // Original V4 Token ID
        v5TokenIds[223] = 49000000237; // Minted V5 Token ID
        v4TokenIds[223] = 49000000096; // Original V4 Token ID
        v5TokenIds[224] = 49000000238; // Minted V5 Token ID
        v4TokenIds[224] = 49000000097; // Original V4 Token ID
        v5TokenIds[225] = 49000000239; // Minted V5 Token ID
        v4TokenIds[225] = 49000000098; // Original V4 Token ID
        v5TokenIds[226] = 49000000240; // Minted V5 Token ID
        v4TokenIds[226] = 49000000099; // Original V4 Token ID
        v5TokenIds[227] = 49000000241; // Minted V5 Token ID
        v4TokenIds[227] = 49000000100; // Original V4 Token ID
        v5TokenIds[228] = 49000000242; // Minted V5 Token ID
        v4TokenIds[228] = 49000000101; // Original V4 Token ID
        v5TokenIds[229] = 49000000243; // Minted V5 Token ID
        v4TokenIds[229] = 49000000102; // Original V4 Token ID
        v5TokenIds[230] = 49000000244; // Minted V5 Token ID
        v4TokenIds[230] = 49000000103; // Original V4 Token ID
        v5TokenIds[231] = 49000000245; // Minted V5 Token ID
        v4TokenIds[231] = 49000000104; // Original V4 Token ID
        v5TokenIds[232] = 49000000246; // Minted V5 Token ID
        v4TokenIds[232] = 49000000105; // Original V4 Token ID
        v5TokenIds[233] = 49000000247; // Minted V5 Token ID
        v4TokenIds[233] = 49000000106; // Original V4 Token ID
        v5TokenIds[234] = 49000000248; // Minted V5 Token ID
        v4TokenIds[234] = 49000000107; // Original V4 Token ID
        v5TokenIds[235] = 49000000249; // Minted V5 Token ID
        v4TokenIds[235] = 49000000108; // Original V4 Token ID
        v5TokenIds[236] = 49000000250; // Minted V5 Token ID
        v4TokenIds[236] = 49000000109; // Original V4 Token ID
        v5TokenIds[237] = 49000000251; // Minted V5 Token ID
        v4TokenIds[237] = 49000000110; // Original V4 Token ID
        v5TokenIds[238] = 49000000252; // Minted V5 Token ID
        v4TokenIds[238] = 49000000111; // Original V4 Token ID
        v5TokenIds[239] = 49000000253; // Minted V5 Token ID
        v4TokenIds[239] = 49000000112; // Original V4 Token ID
        v5TokenIds[240] = 49000000254; // Minted V5 Token ID
        v4TokenIds[240] = 49000000113; // Original V4 Token ID
        v5TokenIds[241] = 49000000255; // Minted V5 Token ID
        v4TokenIds[241] = 49000000114; // Original V4 Token ID
        v5TokenIds[242] = 49000000256; // Minted V5 Token ID
        v4TokenIds[242] = 49000000115; // Original V4 Token ID
        v5TokenIds[243] = 49000000257; // Minted V5 Token ID
        v4TokenIds[243] = 49000000116; // Original V4 Token ID
        v5TokenIds[244] = 49000000258; // Minted V5 Token ID
        v4TokenIds[244] = 49000000117; // Original V4 Token ID
        v5TokenIds[245] = 49000000259; // Minted V5 Token ID
        v4TokenIds[245] = 49000000118; // Original V4 Token ID
        v5TokenIds[246] = 49000000260; // Minted V5 Token ID
        v4TokenIds[246] = 49000000119; // Original V4 Token ID
        v5TokenIds[247] = 49000000261; // Minted V5 Token ID
        v4TokenIds[247] = 49000000120; // Original V4 Token ID
        v5TokenIds[248] = 49000000262; // Minted V5 Token ID
        v4TokenIds[248] = 49000000121; // Original V4 Token ID
        v5TokenIds[249] = 49000000263; // Minted V5 Token ID
        v4TokenIds[249] = 49000000122; // Original V4 Token ID
        v5TokenIds[250] = 49000000264; // Minted V5 Token ID
        v4TokenIds[250] = 49000000123; // Original V4 Token ID
        v5TokenIds[251] = 49000000265; // Minted V5 Token ID
        v4TokenIds[251] = 49000000124; // Original V4 Token ID
        v5TokenIds[252] = 49000000266; // Minted V5 Token ID
        v4TokenIds[252] = 49000000125; // Original V4 Token ID
        v5TokenIds[253] = 49000000267; // Minted V5 Token ID
        v4TokenIds[253] = 49000000126; // Original V4 Token ID
        v5TokenIds[254] = 49000000268; // Minted V5 Token ID
        v4TokenIds[254] = 49000000127; // Original V4 Token ID
        v5TokenIds[255] = 49000000269; // Minted V5 Token ID
        v4TokenIds[255] = 49000000128; // Original V4 Token ID
        v5TokenIds[256] = 49000000270; // Minted V5 Token ID
        v4TokenIds[256] = 49000000129; // Original V4 Token ID
        v5TokenIds[257] = 49000000271; // Minted V5 Token ID
        v4TokenIds[257] = 49000000130; // Original V4 Token ID
        v5TokenIds[258] = 49000000272; // Minted V5 Token ID
        v4TokenIds[258] = 49000000131; // Original V4 Token ID
        v5TokenIds[259] = 49000000273; // Minted V5 Token ID
        v4TokenIds[259] = 49000000132; // Original V4 Token ID
        v5TokenIds[260] = 49000000274; // Minted V5 Token ID
        v4TokenIds[260] = 49000000133; // Original V4 Token ID
        v5TokenIds[261] = 49000000275; // Minted V5 Token ID
        v4TokenIds[261] = 49000000134; // Original V4 Token ID
        v5TokenIds[262] = 49000000276; // Minted V5 Token ID
        v4TokenIds[262] = 49000000135; // Original V4 Token ID
        v5TokenIds[263] = 49000000277; // Minted V5 Token ID
        v4TokenIds[263] = 49000000136; // Original V4 Token ID
        v5TokenIds[264] = 49000000278; // Minted V5 Token ID
        v4TokenIds[264] = 49000000137; // Original V4 Token ID
        v5TokenIds[265] = 49000000279; // Minted V5 Token ID
        v4TokenIds[265] = 49000000138; // Original V4 Token ID
        v5TokenIds[266] = 49000000280; // Minted V5 Token ID
        v4TokenIds[266] = 49000000139; // Original V4 Token ID
        v5TokenIds[267] = 49000000281; // Minted V5 Token ID
        v4TokenIds[267] = 49000000140; // Original V4 Token ID
        v5TokenIds[268] = 49000000282; // Minted V5 Token ID
        v4TokenIds[268] = 49000000141; // Original V4 Token ID
        v5TokenIds[269] = 49000000283; // Minted V5 Token ID
        v4TokenIds[269] = 49000000142; // Original V4 Token ID
        v5TokenIds[270] = 49000000284; // Minted V5 Token ID
        v4TokenIds[270] = 49000000143; // Original V4 Token ID
        v5TokenIds[271] = 49000000285; // Minted V5 Token ID
        v4TokenIds[271] = 49000000144; // Original V4 Token ID
        v5TokenIds[272] = 49000000286; // Minted V5 Token ID
        v4TokenIds[272] = 49000000145; // Original V4 Token ID
        v5TokenIds[273] = 5000000008; // Minted V5 Token ID
        v4TokenIds[273] = 5000000003; // Original V4 Token ID
        v5TokenIds[274] = 5000000009; // Minted V5 Token ID
        v4TokenIds[274] = 5000000007; // Original V4 Token ID
        v5TokenIds[275] = 6000000013; // Minted V5 Token ID
        v4TokenIds[275] = 6000000005; // Original V4 Token ID
        v5TokenIds[276] = 6000000014; // Minted V5 Token ID
        v4TokenIds[276] = 6000000006; // Original V4 Token ID
        v5TokenIds[277] = 6000000015; // Minted V5 Token ID
        v4TokenIds[277] = 6000000007; // Original V4 Token ID
        v5TokenIds[278] = 6000000016; // Minted V5 Token ID
        v4TokenIds[278] = 6000000008; // Original V4 Token ID
        v5TokenIds[279] = 6000000017; // Minted V5 Token ID
        v4TokenIds[279] = 6000000009; // Original V4 Token ID

        
        for (uint256 i = 0; i < transferOwners.length; i++) {
            uint256 v5TokenId = v5TokenIds[i];
            uint256 v4TokenId = v4TokenIds[i];
            
            // Verify V4 ownership using the original V4 token ID
            address v4Owner = v4Hook.ownerOf(v4TokenId);
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
            
            // Verify this contract owns the V5 token before transferring
            require(hook.ownerOf(v5TokenId) == address(this), "Contract does not own token");
            
            // Transfer using the minted V5 token ID
            IERC721(address(hook)).safeTransferFrom(
                address(this), 
                transferOwners[i], 
                v5TokenId
            );
        }
    }
}