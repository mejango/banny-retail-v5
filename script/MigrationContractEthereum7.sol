// SPDX-License-Identifier: MIT
pragma solidity 0.8.23;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {JB721TiersHook} from "@bananapus/721-hook-v5/src/JB721TiersHook.sol";
import {Banny721TokenUriResolver} from "../src/Banny721TokenUriResolver.sol";

/// @notice Migration contract for Ethereum to handle standalone outfits and backgrounds
/// that are not worn/used by any banny. These assets are minted to this contract
/// and then transferred directly to their owners.
contract MigrationContractEthereum7 {
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
                v5TokenIds[0] = 5000000007; // Minted V5 Token ID
        v4TokenIds[0] = 5000000003; // Original V4 Token ID
        v5TokenIds[1] = 5000000008; // Minted V5 Token ID
        v4TokenIds[1] = 5000000007; // Original V4 Token ID
        v5TokenIds[2] = 6000000009; // Minted V5 Token ID
        v4TokenIds[2] = 6000000005; // Original V4 Token ID
        v5TokenIds[3] = 6000000010; // Minted V5 Token ID
        v4TokenIds[3] = 6000000006; // Original V4 Token ID
        v5TokenIds[4] = 6000000011; // Minted V5 Token ID
        v4TokenIds[4] = 6000000007; // Original V4 Token ID
        v5TokenIds[5] = 6000000012; // Minted V5 Token ID
        v4TokenIds[5] = 6000000008; // Original V4 Token ID
        v5TokenIds[6] = 6000000013; // Minted V5 Token ID
        v4TokenIds[6] = 6000000009; // Original V4 Token ID
        v5TokenIds[7] = 10000000007; // Minted V5 Token ID
        v4TokenIds[7] = 10000000004; // Original V4 Token ID
        v5TokenIds[8] = 10000000008; // Minted V5 Token ID
        v4TokenIds[8] = 10000000008; // Original V4 Token ID
        v5TokenIds[9] = 10000000009; // Minted V5 Token ID
        v4TokenIds[9] = 10000000009; // Original V4 Token ID
        v5TokenIds[10] = 10000000010; // Minted V5 Token ID
        v4TokenIds[10] = 10000000010; // Original V4 Token ID
        v5TokenIds[11] = 10000000011; // Minted V5 Token ID
        v4TokenIds[11] = 10000000011; // Original V4 Token ID
        v5TokenIds[12] = 10000000012; // Minted V5 Token ID
        v4TokenIds[12] = 10000000013; // Original V4 Token ID
        v5TokenIds[13] = 10000000013; // Minted V5 Token ID
        v4TokenIds[13] = 10000000014; // Original V4 Token ID
        v5TokenIds[14] = 11000000001; // Minted V5 Token ID
        v4TokenIds[14] = 11000000001; // Original V4 Token ID
        v5TokenIds[15] = 13000000003; // Minted V5 Token ID
        v4TokenIds[15] = 13000000002; // Original V4 Token ID
        v5TokenIds[16] = 13000000004; // Minted V5 Token ID
        v4TokenIds[16] = 13000000004; // Original V4 Token ID
        v5TokenIds[17] = 14000000004; // Minted V5 Token ID
        v4TokenIds[17] = 14000000002; // Original V4 Token ID
        v5TokenIds[18] = 14000000005; // Minted V5 Token ID
        v4TokenIds[18] = 14000000004; // Original V4 Token ID
        v5TokenIds[19] = 14000000006; // Minted V5 Token ID
        v4TokenIds[19] = 14000000006; // Original V4 Token ID
        v5TokenIds[20] = 17000000003; // Minted V5 Token ID
        v4TokenIds[20] = 17000000003; // Original V4 Token ID
        v5TokenIds[21] = 17000000004; // Minted V5 Token ID
        v4TokenIds[21] = 17000000004; // Original V4 Token ID
        v5TokenIds[22] = 17000000005; // Minted V5 Token ID
        v4TokenIds[22] = 17000000005; // Original V4 Token ID
        v5TokenIds[23] = 19000000016; // Minted V5 Token ID
        v4TokenIds[23] = 19000000001; // Original V4 Token ID
        v5TokenIds[24] = 19000000017; // Minted V5 Token ID
        v4TokenIds[24] = 19000000003; // Original V4 Token ID
        v5TokenIds[25] = 19000000018; // Minted V5 Token ID
        v4TokenIds[25] = 19000000006; // Original V4 Token ID
        v5TokenIds[26] = 19000000019; // Minted V5 Token ID
        v4TokenIds[26] = 19000000007; // Original V4 Token ID
        v5TokenIds[27] = 19000000020; // Minted V5 Token ID
        v4TokenIds[27] = 19000000010; // Original V4 Token ID
        v5TokenIds[28] = 19000000021; // Minted V5 Token ID
        v4TokenIds[28] = 19000000014; // Original V4 Token ID
        v5TokenIds[29] = 19000000022; // Minted V5 Token ID
        v4TokenIds[29] = 19000000022; // Original V4 Token ID
        v5TokenIds[30] = 20000000003; // Minted V5 Token ID
        v4TokenIds[30] = 20000000002; // Original V4 Token ID
        v5TokenIds[31] = 20000000004; // Minted V5 Token ID
        v4TokenIds[31] = 20000000003; // Original V4 Token ID
        v5TokenIds[32] = 20000000005; // Minted V5 Token ID
        v4TokenIds[32] = 20000000004; // Original V4 Token ID
        v5TokenIds[33] = 20000000006; // Minted V5 Token ID
        v4TokenIds[33] = 20000000005; // Original V4 Token ID
        v5TokenIds[34] = 20000000007; // Minted V5 Token ID
        v4TokenIds[34] = 20000000006; // Original V4 Token ID
        v5TokenIds[35] = 20000000008; // Minted V5 Token ID
        v4TokenIds[35] = 20000000007; // Original V4 Token ID
        v5TokenIds[36] = 21000000002; // Minted V5 Token ID
        v4TokenIds[36] = 21000000002; // Original V4 Token ID
        v5TokenIds[37] = 23000000007; // Minted V5 Token ID
        v4TokenIds[37] = 23000000006; // Original V4 Token ID
        v5TokenIds[38] = 23000000008; // Minted V5 Token ID
        v4TokenIds[38] = 23000000008; // Original V4 Token ID
        v5TokenIds[39] = 25000000010; // Minted V5 Token ID
        v4TokenIds[39] = 25000000001; // Original V4 Token ID
        v5TokenIds[40] = 25000000011; // Minted V5 Token ID
        v4TokenIds[40] = 25000000004; // Original V4 Token ID
        v5TokenIds[41] = 25000000012; // Minted V5 Token ID
        v4TokenIds[41] = 25000000012; // Original V4 Token ID
        v5TokenIds[42] = 26000000006; // Minted V5 Token ID
        v4TokenIds[42] = 26000000006; // Original V4 Token ID
        v5TokenIds[43] = 26000000007; // Minted V5 Token ID
        v4TokenIds[43] = 26000000007; // Original V4 Token ID
        v5TokenIds[44] = 28000000003; // Minted V5 Token ID
        v4TokenIds[44] = 28000000001; // Original V4 Token ID
        v5TokenIds[45] = 28000000004; // Minted V5 Token ID
        v4TokenIds[45] = 28000000003; // Original V4 Token ID
        v5TokenIds[46] = 28000000005; // Minted V5 Token ID
        v4TokenIds[46] = 28000000004; // Original V4 Token ID
        v5TokenIds[47] = 28000000006; // Minted V5 Token ID
        v4TokenIds[47] = 28000000005; // Original V4 Token ID
        v5TokenIds[48] = 28000000007; // Minted V5 Token ID
        v4TokenIds[48] = 28000000006; // Original V4 Token ID
        v5TokenIds[49] = 28000000008; // Minted V5 Token ID
        v4TokenIds[49] = 28000000007; // Original V4 Token ID
        v5TokenIds[50] = 28000000009; // Minted V5 Token ID
        v4TokenIds[50] = 28000000009; // Original V4 Token ID
        v5TokenIds[51] = 29000000003; // Minted V5 Token ID
        v4TokenIds[51] = 29000000001; // Original V4 Token ID
        v5TokenIds[52] = 31000000009; // Minted V5 Token ID
        v4TokenIds[52] = 31000000001; // Original V4 Token ID
        v5TokenIds[53] = 31000000010; // Minted V5 Token ID
        v4TokenIds[53] = 31000000004; // Original V4 Token ID
        v5TokenIds[54] = 31000000011; // Minted V5 Token ID
        v4TokenIds[54] = 31000000005; // Original V4 Token ID
        v5TokenIds[55] = 31000000012; // Minted V5 Token ID
        v4TokenIds[55] = 31000000008; // Original V4 Token ID
        v5TokenIds[56] = 31000000013; // Minted V5 Token ID
        v4TokenIds[56] = 31000000012; // Original V4 Token ID
        v5TokenIds[57] = 32000000004; // Minted V5 Token ID
        v4TokenIds[57] = 32000000004; // Original V4 Token ID
        v5TokenIds[58] = 32000000005; // Minted V5 Token ID
        v4TokenIds[58] = 32000000005; // Original V4 Token ID
        v5TokenIds[59] = 33000000002; // Minted V5 Token ID
        v4TokenIds[59] = 33000000002; // Original V4 Token ID
        v5TokenIds[60] = 35000000007; // Minted V5 Token ID
        v4TokenIds[60] = 35000000005; // Original V4 Token ID
        v5TokenIds[61] = 35000000008; // Minted V5 Token ID
        v4TokenIds[61] = 35000000008; // Original V4 Token ID
        v5TokenIds[62] = 35000000009; // Minted V5 Token ID
        v4TokenIds[62] = 35000000009; // Original V4 Token ID
        v5TokenIds[63] = 37000000003; // Minted V5 Token ID
        v4TokenIds[63] = 37000000002; // Original V4 Token ID
        v5TokenIds[64] = 37000000004; // Minted V5 Token ID
        v4TokenIds[64] = 37000000004; // Original V4 Token ID
        v5TokenIds[65] = 39000000004; // Minted V5 Token ID
        v4TokenIds[65] = 39000000004; // Original V4 Token ID
        v5TokenIds[66] = 40000000002; // Minted V5 Token ID
        v4TokenIds[66] = 40000000002; // Original V4 Token ID
        v5TokenIds[67] = 40000000003; // Minted V5 Token ID
        v4TokenIds[67] = 40000000003; // Original V4 Token ID
        v5TokenIds[68] = 41000000005; // Minted V5 Token ID
        v4TokenIds[68] = 41000000005; // Original V4 Token ID
        v5TokenIds[69] = 42000000004; // Minted V5 Token ID
        v4TokenIds[69] = 42000000001; // Original V4 Token ID
        v5TokenIds[70] = 42000000005; // Minted V5 Token ID
        v4TokenIds[70] = 42000000003; // Original V4 Token ID
        v5TokenIds[71] = 42000000006; // Minted V5 Token ID
        v4TokenIds[71] = 42000000005; // Original V4 Token ID
        v5TokenIds[72] = 42000000007; // Minted V5 Token ID
        v4TokenIds[72] = 42000000006; // Original V4 Token ID
        v5TokenIds[73] = 42000000008; // Minted V5 Token ID
        v4TokenIds[73] = 42000000008; // Original V4 Token ID
        v5TokenIds[74] = 42000000009; // Minted V5 Token ID
        v4TokenIds[74] = 42000000009; // Original V4 Token ID
        v5TokenIds[75] = 42000000010; // Minted V5 Token ID
        v4TokenIds[75] = 42000000010; // Original V4 Token ID
        v5TokenIds[76] = 42000000011; // Minted V5 Token ID
        v4TokenIds[76] = 42000000011; // Original V4 Token ID
        v5TokenIds[77] = 42000000012; // Minted V5 Token ID
        v4TokenIds[77] = 42000000012; // Original V4 Token ID
        v5TokenIds[78] = 42000000013; // Minted V5 Token ID
        v4TokenIds[78] = 42000000013; // Original V4 Token ID
        v5TokenIds[79] = 42000000014; // Minted V5 Token ID
        v4TokenIds[79] = 42000000014; // Original V4 Token ID
        v5TokenIds[80] = 42000000015; // Minted V5 Token ID
        v4TokenIds[80] = 42000000015; // Original V4 Token ID
        v5TokenIds[81] = 42000000016; // Minted V5 Token ID
        v4TokenIds[81] = 42000000016; // Original V4 Token ID
        v5TokenIds[82] = 42000000017; // Minted V5 Token ID
        v4TokenIds[82] = 42000000017; // Original V4 Token ID
        v5TokenIds[83] = 42000000018; // Minted V5 Token ID
        v4TokenIds[83] = 42000000018; // Original V4 Token ID
        v5TokenIds[84] = 42000000019; // Minted V5 Token ID
        v4TokenIds[84] = 42000000019; // Original V4 Token ID
        v5TokenIds[85] = 43000000008; // Minted V5 Token ID
        v4TokenIds[85] = 43000000001; // Original V4 Token ID
        v5TokenIds[86] = 43000000009; // Minted V5 Token ID
        v4TokenIds[86] = 43000000002; // Original V4 Token ID
        v5TokenIds[87] = 43000000010; // Minted V5 Token ID
        v4TokenIds[87] = 43000000004; // Original V4 Token ID
        v5TokenIds[88] = 43000000011; // Minted V5 Token ID
        v4TokenIds[88] = 43000000009; // Original V4 Token ID
        v5TokenIds[89] = 43000000012; // Minted V5 Token ID
        v4TokenIds[89] = 43000000010; // Original V4 Token ID
        v5TokenIds[90] = 43000000013; // Minted V5 Token ID
        v4TokenIds[90] = 43000000011; // Original V4 Token ID
        v5TokenIds[91] = 43000000014; // Minted V5 Token ID
        v4TokenIds[91] = 43000000012; // Original V4 Token ID
        v5TokenIds[92] = 43000000015; // Minted V5 Token ID
        v4TokenIds[92] = 43000000013; // Original V4 Token ID
        v5TokenIds[93] = 43000000016; // Minted V5 Token ID
        v4TokenIds[93] = 43000000014; // Original V4 Token ID
        v5TokenIds[94] = 43000000017; // Minted V5 Token ID
        v4TokenIds[94] = 43000000015; // Original V4 Token ID
        v5TokenIds[95] = 43000000018; // Minted V5 Token ID
        v4TokenIds[95] = 43000000016; // Original V4 Token ID
        v5TokenIds[96] = 44000000006; // Minted V5 Token ID
        v4TokenIds[96] = 44000000002; // Original V4 Token ID
        v5TokenIds[97] = 44000000007; // Minted V5 Token ID
        v4TokenIds[97] = 44000000005; // Original V4 Token ID
        v5TokenIds[98] = 44000000008; // Minted V5 Token ID
        v4TokenIds[98] = 44000000006; // Original V4 Token ID
        v5TokenIds[99] = 44000000009; // Minted V5 Token ID
        v4TokenIds[99] = 44000000007; // Original V4 Token ID
        v5TokenIds[100] = 44000000010; // Minted V5 Token ID
        v4TokenIds[100] = 44000000010; // Original V4 Token ID
        v5TokenIds[101] = 44000000011; // Minted V5 Token ID
        v4TokenIds[101] = 44000000011; // Original V4 Token ID
        v5TokenIds[102] = 44000000012; // Minted V5 Token ID
        v4TokenIds[102] = 44000000012; // Original V4 Token ID
        v5TokenIds[103] = 44000000013; // Minted V5 Token ID
        v4TokenIds[103] = 44000000013; // Original V4 Token ID
        v5TokenIds[104] = 44000000014; // Minted V5 Token ID
        v4TokenIds[104] = 44000000014; // Original V4 Token ID
        v5TokenIds[105] = 44000000015; // Minted V5 Token ID
        v4TokenIds[105] = 44000000015; // Original V4 Token ID
        v5TokenIds[106] = 44000000016; // Minted V5 Token ID
        v4TokenIds[106] = 44000000016; // Original V4 Token ID
        v5TokenIds[107] = 44000000017; // Minted V5 Token ID
        v4TokenIds[107] = 44000000017; // Original V4 Token ID
        v5TokenIds[108] = 44000000018; // Minted V5 Token ID
        v4TokenIds[108] = 44000000018; // Original V4 Token ID
        v5TokenIds[109] = 44000000019; // Minted V5 Token ID
        v4TokenIds[109] = 44000000019; // Original V4 Token ID
        v5TokenIds[110] = 44000000020; // Minted V5 Token ID
        v4TokenIds[110] = 44000000020; // Original V4 Token ID
        v5TokenIds[111] = 44000000021; // Minted V5 Token ID
        v4TokenIds[111] = 44000000021; // Original V4 Token ID
        v5TokenIds[112] = 44000000022; // Minted V5 Token ID
        v4TokenIds[112] = 44000000022; // Original V4 Token ID
        v5TokenIds[113] = 44000000023; // Minted V5 Token ID
        v4TokenIds[113] = 44000000023; // Original V4 Token ID
        v5TokenIds[114] = 44000000024; // Minted V5 Token ID
        v4TokenIds[114] = 44000000024; // Original V4 Token ID
        v5TokenIds[115] = 44000000025; // Minted V5 Token ID
        v4TokenIds[115] = 44000000025; // Original V4 Token ID
        v5TokenIds[116] = 44000000026; // Minted V5 Token ID
        v4TokenIds[116] = 44000000026; // Original V4 Token ID
        v5TokenIds[117] = 44000000027; // Minted V5 Token ID
        v4TokenIds[117] = 44000000027; // Original V4 Token ID
        v5TokenIds[118] = 44000000028; // Minted V5 Token ID
        v4TokenIds[118] = 44000000028; // Original V4 Token ID
        v5TokenIds[119] = 44000000029; // Minted V5 Token ID
        v4TokenIds[119] = 44000000029; // Original V4 Token ID
        v5TokenIds[120] = 44000000030; // Minted V5 Token ID
        v4TokenIds[120] = 44000000030; // Original V4 Token ID
        v5TokenIds[121] = 44000000031; // Minted V5 Token ID
        v4TokenIds[121] = 44000000031; // Original V4 Token ID
        v5TokenIds[122] = 44000000032; // Minted V5 Token ID
        v4TokenIds[122] = 44000000032; // Original V4 Token ID
        v5TokenIds[123] = 44000000033; // Minted V5 Token ID
        v4TokenIds[123] = 44000000033; // Original V4 Token ID
        v5TokenIds[124] = 44000000034; // Minted V5 Token ID
        v4TokenIds[124] = 44000000034; // Original V4 Token ID
        v5TokenIds[125] = 47000000003; // Minted V5 Token ID
        v4TokenIds[125] = 47000000001; // Original V4 Token ID
        v5TokenIds[126] = 47000000004; // Minted V5 Token ID
        v4TokenIds[126] = 47000000002; // Original V4 Token ID
        v5TokenIds[127] = 47000000005; // Minted V5 Token ID
        v4TokenIds[127] = 47000000004; // Original V4 Token ID
        v5TokenIds[128] = 47000000006; // Minted V5 Token ID
        v4TokenIds[128] = 47000000006; // Original V4 Token ID
        v5TokenIds[129] = 47000000007; // Minted V5 Token ID
        v4TokenIds[129] = 47000000007; // Original V4 Token ID
        v5TokenIds[130] = 47000000008; // Minted V5 Token ID
        v4TokenIds[130] = 47000000008; // Original V4 Token ID
        v5TokenIds[131] = 47000000009; // Minted V5 Token ID
        v4TokenIds[131] = 47000000009; // Original V4 Token ID
        v5TokenIds[132] = 47000000010; // Minted V5 Token ID
        v4TokenIds[132] = 47000000010; // Original V4 Token ID
        v5TokenIds[133] = 47000000011; // Minted V5 Token ID
        v4TokenIds[133] = 47000000011; // Original V4 Token ID
        v5TokenIds[134] = 47000000012; // Minted V5 Token ID
        v4TokenIds[134] = 47000000012; // Original V4 Token ID
        v5TokenIds[135] = 47000000013; // Minted V5 Token ID
        v4TokenIds[135] = 47000000013; // Original V4 Token ID
        v5TokenIds[136] = 47000000014; // Minted V5 Token ID
        v4TokenIds[136] = 47000000014; // Original V4 Token ID
        v5TokenIds[137] = 48000000006; // Minted V5 Token ID
        v4TokenIds[137] = 48000000004; // Original V4 Token ID
        v5TokenIds[138] = 49000000004; // Minted V5 Token ID
        v4TokenIds[138] = 49000000003; // Original V4 Token ID
        v5TokenIds[139] = 49000000005; // Minted V5 Token ID
        v4TokenIds[139] = 49000000005; // Original V4 Token ID
        v5TokenIds[140] = 49000000006; // Minted V5 Token ID
        v4TokenIds[140] = 49000000006; // Original V4 Token ID
        v5TokenIds[141] = 49000000007; // Minted V5 Token ID
        v4TokenIds[141] = 49000000007; // Original V4 Token ID
        v5TokenIds[142] = 49000000008; // Minted V5 Token ID
        v4TokenIds[142] = 49000000008; // Original V4 Token ID
        v5TokenIds[143] = 49000000009; // Minted V5 Token ID
        v4TokenIds[143] = 49000000009; // Original V4 Token ID
        v5TokenIds[144] = 49000000010; // Minted V5 Token ID
        v4TokenIds[144] = 49000000010; // Original V4 Token ID
        v5TokenIds[145] = 49000000011; // Minted V5 Token ID
        v4TokenIds[145] = 49000000011; // Original V4 Token ID
        v5TokenIds[146] = 49000000012; // Minted V5 Token ID
        v4TokenIds[146] = 49000000012; // Original V4 Token ID
        v5TokenIds[147] = 49000000013; // Minted V5 Token ID
        v4TokenIds[147] = 49000000013; // Original V4 Token ID
        v5TokenIds[148] = 49000000014; // Minted V5 Token ID
        v4TokenIds[148] = 49000000014; // Original V4 Token ID
        v5TokenIds[149] = 49000000015; // Minted V5 Token ID
        v4TokenIds[149] = 49000000015; // Original V4 Token ID
        v5TokenIds[150] = 49000000016; // Minted V5 Token ID
        v4TokenIds[150] = 49000000016; // Original V4 Token ID
        v5TokenIds[151] = 49000000017; // Minted V5 Token ID
        v4TokenIds[151] = 49000000017; // Original V4 Token ID
        v5TokenIds[152] = 49000000018; // Minted V5 Token ID
        v4TokenIds[152] = 49000000018; // Original V4 Token ID
        v5TokenIds[153] = 49000000019; // Minted V5 Token ID
        v4TokenIds[153] = 49000000019; // Original V4 Token ID
        v5TokenIds[154] = 49000000020; // Minted V5 Token ID
        v4TokenIds[154] = 49000000020; // Original V4 Token ID
        v5TokenIds[155] = 49000000021; // Minted V5 Token ID
        v4TokenIds[155] = 49000000021; // Original V4 Token ID
        v5TokenIds[156] = 49000000022; // Minted V5 Token ID
        v4TokenIds[156] = 49000000022; // Original V4 Token ID
        v5TokenIds[157] = 49000000023; // Minted V5 Token ID
        v4TokenIds[157] = 49000000023; // Original V4 Token ID
        v5TokenIds[158] = 49000000024; // Minted V5 Token ID
        v4TokenIds[158] = 49000000024; // Original V4 Token ID
        v5TokenIds[159] = 49000000025; // Minted V5 Token ID
        v4TokenIds[159] = 49000000025; // Original V4 Token ID
        v5TokenIds[160] = 49000000026; // Minted V5 Token ID
        v4TokenIds[160] = 49000000026; // Original V4 Token ID
        v5TokenIds[161] = 49000000027; // Minted V5 Token ID
        v4TokenIds[161] = 49000000027; // Original V4 Token ID
        v5TokenIds[162] = 49000000028; // Minted V5 Token ID
        v4TokenIds[162] = 49000000028; // Original V4 Token ID
        v5TokenIds[163] = 49000000029; // Minted V5 Token ID
        v4TokenIds[163] = 49000000029; // Original V4 Token ID
        v5TokenIds[164] = 49000000030; // Minted V5 Token ID
        v4TokenIds[164] = 49000000030; // Original V4 Token ID
        v5TokenIds[165] = 49000000031; // Minted V5 Token ID
        v4TokenIds[165] = 49000000031; // Original V4 Token ID
        v5TokenIds[166] = 49000000032; // Minted V5 Token ID
        v4TokenIds[166] = 49000000032; // Original V4 Token ID
        v5TokenIds[167] = 49000000033; // Minted V5 Token ID
        v4TokenIds[167] = 49000000033; // Original V4 Token ID
        v5TokenIds[168] = 49000000034; // Minted V5 Token ID
        v4TokenIds[168] = 49000000034; // Original V4 Token ID
        v5TokenIds[169] = 49000000035; // Minted V5 Token ID
        v4TokenIds[169] = 49000000035; // Original V4 Token ID
        v5TokenIds[170] = 49000000036; // Minted V5 Token ID
        v4TokenIds[170] = 49000000036; // Original V4 Token ID
        v5TokenIds[171] = 49000000037; // Minted V5 Token ID
        v4TokenIds[171] = 49000000037; // Original V4 Token ID
        v5TokenIds[172] = 49000000038; // Minted V5 Token ID
        v4TokenIds[172] = 49000000038; // Original V4 Token ID
        v5TokenIds[173] = 49000000039; // Minted V5 Token ID
        v4TokenIds[173] = 49000000039; // Original V4 Token ID
        v5TokenIds[174] = 49000000040; // Minted V5 Token ID
        v4TokenIds[174] = 49000000040; // Original V4 Token ID
        v5TokenIds[175] = 49000000041; // Minted V5 Token ID
        v4TokenIds[175] = 49000000041; // Original V4 Token ID
        v5TokenIds[176] = 49000000042; // Minted V5 Token ID
        v4TokenIds[176] = 49000000042; // Original V4 Token ID
        v5TokenIds[177] = 49000000043; // Minted V5 Token ID
        v4TokenIds[177] = 49000000043; // Original V4 Token ID
        v5TokenIds[178] = 49000000044; // Minted V5 Token ID
        v4TokenIds[178] = 49000000044; // Original V4 Token ID
        v5TokenIds[179] = 49000000045; // Minted V5 Token ID
        v4TokenIds[179] = 49000000045; // Original V4 Token ID
        v5TokenIds[180] = 49000000046; // Minted V5 Token ID
        v4TokenIds[180] = 49000000046; // Original V4 Token ID
        v5TokenIds[181] = 49000000047; // Minted V5 Token ID
        v4TokenIds[181] = 49000000047; // Original V4 Token ID
        v5TokenIds[182] = 49000000048; // Minted V5 Token ID
        v4TokenIds[182] = 49000000048; // Original V4 Token ID
        v5TokenIds[183] = 49000000049; // Minted V5 Token ID
        v4TokenIds[183] = 49000000049; // Original V4 Token ID
        v5TokenIds[184] = 49000000050; // Minted V5 Token ID
        v4TokenIds[184] = 49000000050; // Original V4 Token ID
        v5TokenIds[185] = 49000000051; // Minted V5 Token ID
        v4TokenIds[185] = 49000000051; // Original V4 Token ID
        v5TokenIds[186] = 49000000052; // Minted V5 Token ID
        v4TokenIds[186] = 49000000052; // Original V4 Token ID
        v5TokenIds[187] = 49000000053; // Minted V5 Token ID
        v4TokenIds[187] = 49000000053; // Original V4 Token ID
        v5TokenIds[188] = 49000000054; // Minted V5 Token ID
        v4TokenIds[188] = 49000000054; // Original V4 Token ID
        v5TokenIds[189] = 49000000055; // Minted V5 Token ID
        v4TokenIds[189] = 49000000055; // Original V4 Token ID
        v5TokenIds[190] = 49000000056; // Minted V5 Token ID
        v4TokenIds[190] = 49000000056; // Original V4 Token ID
        v5TokenIds[191] = 49000000057; // Minted V5 Token ID
        v4TokenIds[191] = 49000000057; // Original V4 Token ID
        v5TokenIds[192] = 49000000058; // Minted V5 Token ID
        v4TokenIds[192] = 49000000058; // Original V4 Token ID
        v5TokenIds[193] = 49000000059; // Minted V5 Token ID
        v4TokenIds[193] = 49000000059; // Original V4 Token ID
        v5TokenIds[194] = 49000000060; // Minted V5 Token ID
        v4TokenIds[194] = 49000000060; // Original V4 Token ID
        v5TokenIds[195] = 49000000061; // Minted V5 Token ID
        v4TokenIds[195] = 49000000061; // Original V4 Token ID
        v5TokenIds[196] = 49000000062; // Minted V5 Token ID
        v4TokenIds[196] = 49000000062; // Original V4 Token ID
        v5TokenIds[197] = 49000000063; // Minted V5 Token ID
        v4TokenIds[197] = 49000000063; // Original V4 Token ID
        v5TokenIds[198] = 49000000064; // Minted V5 Token ID
        v4TokenIds[198] = 49000000064; // Original V4 Token ID
        v5TokenIds[199] = 49000000065; // Minted V5 Token ID
        v4TokenIds[199] = 49000000065; // Original V4 Token ID
        v5TokenIds[200] = 49000000066; // Minted V5 Token ID
        v4TokenIds[200] = 49000000066; // Original V4 Token ID
        v5TokenIds[201] = 49000000067; // Minted V5 Token ID
        v4TokenIds[201] = 49000000067; // Original V4 Token ID
        v5TokenIds[202] = 49000000068; // Minted V5 Token ID
        v4TokenIds[202] = 49000000068; // Original V4 Token ID
        v5TokenIds[203] = 49000000069; // Minted V5 Token ID
        v4TokenIds[203] = 49000000069; // Original V4 Token ID
        v5TokenIds[204] = 49000000070; // Minted V5 Token ID
        v4TokenIds[204] = 49000000070; // Original V4 Token ID
        v5TokenIds[205] = 49000000071; // Minted V5 Token ID
        v4TokenIds[205] = 49000000071; // Original V4 Token ID
        v5TokenIds[206] = 49000000072; // Minted V5 Token ID
        v4TokenIds[206] = 49000000072; // Original V4 Token ID
        v5TokenIds[207] = 49000000073; // Minted V5 Token ID
        v4TokenIds[207] = 49000000073; // Original V4 Token ID
        v5TokenIds[208] = 49000000074; // Minted V5 Token ID
        v4TokenIds[208] = 49000000074; // Original V4 Token ID
        v5TokenIds[209] = 49000000075; // Minted V5 Token ID
        v4TokenIds[209] = 49000000075; // Original V4 Token ID
        v5TokenIds[210] = 49000000076; // Minted V5 Token ID
        v4TokenIds[210] = 49000000076; // Original V4 Token ID
        v5TokenIds[211] = 49000000077; // Minted V5 Token ID
        v4TokenIds[211] = 49000000077; // Original V4 Token ID
        v5TokenIds[212] = 49000000078; // Minted V5 Token ID
        v4TokenIds[212] = 49000000078; // Original V4 Token ID
        v5TokenIds[213] = 49000000079; // Minted V5 Token ID
        v4TokenIds[213] = 49000000079; // Original V4 Token ID
        v5TokenIds[214] = 49000000080; // Minted V5 Token ID
        v4TokenIds[214] = 49000000080; // Original V4 Token ID
        v5TokenIds[215] = 49000000081; // Minted V5 Token ID
        v4TokenIds[215] = 49000000081; // Original V4 Token ID
        v5TokenIds[216] = 49000000082; // Minted V5 Token ID
        v4TokenIds[216] = 49000000082; // Original V4 Token ID
        v5TokenIds[217] = 49000000083; // Minted V5 Token ID
        v4TokenIds[217] = 49000000083; // Original V4 Token ID
        v5TokenIds[218] = 49000000084; // Minted V5 Token ID
        v4TokenIds[218] = 49000000084; // Original V4 Token ID
        v5TokenIds[219] = 49000000085; // Minted V5 Token ID
        v4TokenIds[219] = 49000000085; // Original V4 Token ID
        v5TokenIds[220] = 49000000086; // Minted V5 Token ID
        v4TokenIds[220] = 49000000086; // Original V4 Token ID
        v5TokenIds[221] = 49000000087; // Minted V5 Token ID
        v4TokenIds[221] = 49000000087; // Original V4 Token ID
        v5TokenIds[222] = 49000000088; // Minted V5 Token ID
        v4TokenIds[222] = 49000000088; // Original V4 Token ID
        v5TokenIds[223] = 49000000089; // Minted V5 Token ID
        v4TokenIds[223] = 49000000089; // Original V4 Token ID
        v5TokenIds[224] = 49000000090; // Minted V5 Token ID
        v4TokenIds[224] = 49000000090; // Original V4 Token ID
        v5TokenIds[225] = 49000000091; // Minted V5 Token ID
        v4TokenIds[225] = 49000000091; // Original V4 Token ID
        v5TokenIds[226] = 49000000092; // Minted V5 Token ID
        v4TokenIds[226] = 49000000092; // Original V4 Token ID
        v5TokenIds[227] = 49000000093; // Minted V5 Token ID
        v4TokenIds[227] = 49000000093; // Original V4 Token ID
        v5TokenIds[228] = 49000000094; // Minted V5 Token ID
        v4TokenIds[228] = 49000000094; // Original V4 Token ID
        v5TokenIds[229] = 49000000095; // Minted V5 Token ID
        v4TokenIds[229] = 49000000095; // Original V4 Token ID
        v5TokenIds[230] = 49000000096; // Minted V5 Token ID
        v4TokenIds[230] = 49000000096; // Original V4 Token ID
        v5TokenIds[231] = 49000000097; // Minted V5 Token ID
        v4TokenIds[231] = 49000000097; // Original V4 Token ID
        v5TokenIds[232] = 49000000098; // Minted V5 Token ID
        v4TokenIds[232] = 49000000098; // Original V4 Token ID
        v5TokenIds[233] = 49000000099; // Minted V5 Token ID
        v4TokenIds[233] = 49000000099; // Original V4 Token ID
        v5TokenIds[234] = 49000000100; // Minted V5 Token ID
        v4TokenIds[234] = 49000000100; // Original V4 Token ID
        v5TokenIds[235] = 49000000101; // Minted V5 Token ID
        v4TokenIds[235] = 49000000101; // Original V4 Token ID
        v5TokenIds[236] = 49000000102; // Minted V5 Token ID
        v4TokenIds[236] = 49000000102; // Original V4 Token ID
        v5TokenIds[237] = 49000000103; // Minted V5 Token ID
        v4TokenIds[237] = 49000000103; // Original V4 Token ID
        v5TokenIds[238] = 49000000104; // Minted V5 Token ID
        v4TokenIds[238] = 49000000104; // Original V4 Token ID
        v5TokenIds[239] = 49000000105; // Minted V5 Token ID
        v4TokenIds[239] = 49000000105; // Original V4 Token ID
        v5TokenIds[240] = 49000000106; // Minted V5 Token ID
        v4TokenIds[240] = 49000000106; // Original V4 Token ID
        v5TokenIds[241] = 49000000107; // Minted V5 Token ID
        v4TokenIds[241] = 49000000107; // Original V4 Token ID
        v5TokenIds[242] = 49000000108; // Minted V5 Token ID
        v4TokenIds[242] = 49000000108; // Original V4 Token ID
        v5TokenIds[243] = 49000000109; // Minted V5 Token ID
        v4TokenIds[243] = 49000000109; // Original V4 Token ID
        v5TokenIds[244] = 49000000110; // Minted V5 Token ID
        v4TokenIds[244] = 49000000110; // Original V4 Token ID
        v5TokenIds[245] = 49000000111; // Minted V5 Token ID
        v4TokenIds[245] = 49000000111; // Original V4 Token ID
        v5TokenIds[246] = 49000000112; // Minted V5 Token ID
        v4TokenIds[246] = 49000000112; // Original V4 Token ID
        v5TokenIds[247] = 49000000113; // Minted V5 Token ID
        v4TokenIds[247] = 49000000113; // Original V4 Token ID
        v5TokenIds[248] = 49000000114; // Minted V5 Token ID
        v4TokenIds[248] = 49000000114; // Original V4 Token ID
        v5TokenIds[249] = 49000000115; // Minted V5 Token ID
        v4TokenIds[249] = 49000000115; // Original V4 Token ID
        v5TokenIds[250] = 49000000116; // Minted V5 Token ID
        v4TokenIds[250] = 49000000116; // Original V4 Token ID
        v5TokenIds[251] = 49000000117; // Minted V5 Token ID
        v4TokenIds[251] = 49000000117; // Original V4 Token ID
        v5TokenIds[252] = 49000000118; // Minted V5 Token ID
        v4TokenIds[252] = 49000000118; // Original V4 Token ID
        v5TokenIds[253] = 49000000119; // Minted V5 Token ID
        v4TokenIds[253] = 49000000119; // Original V4 Token ID
        v5TokenIds[254] = 49000000120; // Minted V5 Token ID
        v4TokenIds[254] = 49000000120; // Original V4 Token ID
        v5TokenIds[255] = 49000000121; // Minted V5 Token ID
        v4TokenIds[255] = 49000000121; // Original V4 Token ID
        v5TokenIds[256] = 49000000122; // Minted V5 Token ID
        v4TokenIds[256] = 49000000122; // Original V4 Token ID
        v5TokenIds[257] = 49000000123; // Minted V5 Token ID
        v4TokenIds[257] = 49000000123; // Original V4 Token ID
        v5TokenIds[258] = 49000000124; // Minted V5 Token ID
        v4TokenIds[258] = 49000000124; // Original V4 Token ID
        v5TokenIds[259] = 49000000125; // Minted V5 Token ID
        v4TokenIds[259] = 49000000125; // Original V4 Token ID
        v5TokenIds[260] = 49000000126; // Minted V5 Token ID
        v4TokenIds[260] = 49000000126; // Original V4 Token ID
        v5TokenIds[261] = 49000000127; // Minted V5 Token ID
        v4TokenIds[261] = 49000000127; // Original V4 Token ID
        v5TokenIds[262] = 49000000128; // Minted V5 Token ID
        v4TokenIds[262] = 49000000128; // Original V4 Token ID
        v5TokenIds[263] = 49000000129; // Minted V5 Token ID
        v4TokenIds[263] = 49000000129; // Original V4 Token ID
        v5TokenIds[264] = 49000000130; // Minted V5 Token ID
        v4TokenIds[264] = 49000000130; // Original V4 Token ID
        v5TokenIds[265] = 49000000131; // Minted V5 Token ID
        v4TokenIds[265] = 49000000131; // Original V4 Token ID
        v5TokenIds[266] = 49000000132; // Minted V5 Token ID
        v4TokenIds[266] = 49000000132; // Original V4 Token ID
        v5TokenIds[267] = 49000000133; // Minted V5 Token ID
        v4TokenIds[267] = 49000000133; // Original V4 Token ID
        v5TokenIds[268] = 49000000134; // Minted V5 Token ID
        v4TokenIds[268] = 49000000134; // Original V4 Token ID
        v5TokenIds[269] = 49000000135; // Minted V5 Token ID
        v4TokenIds[269] = 49000000135; // Original V4 Token ID
        v5TokenIds[270] = 49000000136; // Minted V5 Token ID
        v4TokenIds[270] = 49000000136; // Original V4 Token ID
        v5TokenIds[271] = 49000000137; // Minted V5 Token ID
        v4TokenIds[271] = 49000000137; // Original V4 Token ID
        v5TokenIds[272] = 49000000138; // Minted V5 Token ID
        v4TokenIds[272] = 49000000138; // Original V4 Token ID
        v5TokenIds[273] = 49000000139; // Minted V5 Token ID
        v4TokenIds[273] = 49000000139; // Original V4 Token ID
        v5TokenIds[274] = 49000000140; // Minted V5 Token ID
        v4TokenIds[274] = 49000000140; // Original V4 Token ID
        v5TokenIds[275] = 49000000141; // Minted V5 Token ID
        v4TokenIds[275] = 49000000141; // Original V4 Token ID
        v5TokenIds[276] = 49000000142; // Minted V5 Token ID
        v4TokenIds[276] = 49000000142; // Original V4 Token ID
        v5TokenIds[277] = 49000000143; // Minted V5 Token ID
        v4TokenIds[277] = 49000000143; // Original V4 Token ID
        v5TokenIds[278] = 49000000144; // Minted V5 Token ID
        v4TokenIds[278] = 49000000144; // Original V4 Token ID
        v5TokenIds[279] = 49000000145; // Minted V5 Token ID
        v4TokenIds[279] = 49000000145; // Original V4 Token ID

        
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
        address[] memory uniqueOwners = new address[](28);
        
        uniqueOwners[0] = 0x1Ae766cc5947e1E4C3538EE1F3f47063D2B40E79;
        uniqueOwners[1] = 0x823b92d6a4b2AED4b15675c7917c9f922ea8ADAD;
        uniqueOwners[2] = 0xa9d20b435A85fAAa002f32d66F7D21564130E9cf;
        uniqueOwners[3] = 0x15b61e9b0637f45dc0858f083cd240267924125d;
        uniqueOwners[4] = 0xaECD6D9172d602b93dBA3981991268b44af8096e;
        uniqueOwners[5] = 0xe21A272c4D22eD40678a0168b4acd006bca8A482;
        uniqueOwners[6] = 0x4A290F18c35bBFE97B2557cf765De9387726dE39;
        uniqueOwners[7] = 0xf0FE43a75Ff248FD2E75D33fa1ebde71c6d1abAd;
        uniqueOwners[8] = 0x7044d88283c8FFF0679b711C0cd81f1a6754C843;
        uniqueOwners[9] = 0x4A8a9147ab0DF5A8949f964bDBA22dc4583280E2;
        uniqueOwners[10] = 0x35a21F7c053Aed0Dcf9E24BfB100acA163aeDdB2;
        uniqueOwners[11] = 0x87084347AeBADc626e8569E0D386928dade2ba09;
        uniqueOwners[12] = 0x0447AD1BdC0fFA06f7029c8E63F4De21E65255d2;
        uniqueOwners[13] = 0x516cAfD745Ec780D20f61c0d71fe258eA765222D;
        uniqueOwners[14] = 0x08cF1208e638a5A3623be58d600e35c6199baa9C;
        uniqueOwners[15] = 0x289715fFBB2f4b482e2917D2f183FeAb564ec84F;
        uniqueOwners[16] = 0x79d1E7F1A6E0Bbb3278a9d2B782e3A8983444cb6;
        uniqueOwners[17] = 0xe7879a2D05dBA966Fcca34EE9C3F99eEe7eDEFd1;
        uniqueOwners[18] = 0x1c6d61F3d8976A8aCDd311ecdFa533B8ECd0AC61;
        uniqueOwners[19] = 0x21a8f5A6bF893D43d3964dDaf4E04766BBBE9b07;
        uniqueOwners[20] = 0x7bE8c264c9DCebA3A35990c78d5C4220D8724B6e;
        uniqueOwners[21] = 0x7a16eABD1413Bfd468aE9fEBF7C26c62f1fFdc59;
        uniqueOwners[22] = 0x08cEb8Bba685ee708C9c4c65576837cbE19B9dea;
        uniqueOwners[23] = 0x45C3d8Aacc0d537dAc234AD4C20Ef05d6041CeFe;
        uniqueOwners[24] = 0x961d4191965C49537c88F764D88318872CE405bE;
        uniqueOwners[25] = 0x1786D033D5CbCC235B673e872c7613c2F83DA583;
        uniqueOwners[26] = 0x38EED3CCeED88f380E436eb21811250797c453C5;
        uniqueOwners[27] = 0x7C3F14075F6477fea1aF6cf59f325afDfcD3Ddf7;
        
        // Collect unique tier IDs
        uint256[] memory uniqueTierIds = new uint256[](29);
        
        uniqueTierIds[0] = 5;
        uniqueTierIds[1] = 6;
        uniqueTierIds[2] = 10;
        uniqueTierIds[3] = 11;
        uniqueTierIds[4] = 13;
        uniqueTierIds[5] = 14;
        uniqueTierIds[6] = 17;
        uniqueTierIds[7] = 19;
        uniqueTierIds[8] = 20;
        uniqueTierIds[9] = 21;
        uniqueTierIds[10] = 23;
        uniqueTierIds[11] = 25;
        uniqueTierIds[12] = 26;
        uniqueTierIds[13] = 28;
        uniqueTierIds[14] = 29;
        uniqueTierIds[15] = 31;
        uniqueTierIds[16] = 32;
        uniqueTierIds[17] = 33;
        uniqueTierIds[18] = 35;
        uniqueTierIds[19] = 37;
        uniqueTierIds[20] = 39;
        uniqueTierIds[21] = 40;
        uniqueTierIds[22] = 41;
        uniqueTierIds[23] = 42;
        uniqueTierIds[24] = 43;
        uniqueTierIds[25] = 44;
        uniqueTierIds[26] = 47;
        uniqueTierIds[27] = 48;
        uniqueTierIds[28] = 49;
        
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