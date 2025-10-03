// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "forge-std/Script.sol";
import "../src/TokenDistribution.sol";

contract DeployToken is Script {
    function run() external {
        uint256 deployerKey = vm.envUint("PRIVATE_KEY");

        // MetaMask wallets
        address wallet1 = 0x98D686f12cDe8B3006739EF50E2401E4bDC1d69A;
        address wallet2 = 0x321bF16523d5Ff1b0775677B8851938a64319577;
        address wallet3 = 0x11fB2A6dd15979a8421415019304968785cAE442;

        vm.startBroadcast(deployerKey);

        // Deploy token - name, symbol, totalSupply, wallets
        new TokenDistribution("TokenDistribution", "TKD", 1_000_000, wallet1, wallet2, wallet3);

        vm.stopBroadcast();
    }
}
