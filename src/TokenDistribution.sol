// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenDistribution is ERC20, Ownable {
    constructor(
        string memory name_,
        string memory symbol_,
        uint256 totalSupply_,
        address wallet1,
        address wallet2,
        address wallet3
    ) ERC20(name_, symbol_) Ownable(msg.sender) {
        uint256 amount = totalSupply_ * 1e18; // 1 million tokens

        // deployer is owner
        _mint(msg.sender, amount);

        // distributing 20 % of 1 million to each wallet
        uint256 share = (amount * 20) / 100;

        _transfer(msg.sender, wallet1, share);
        _transfer(msg.sender, wallet2, share);
        _transfer(msg.sender, wallet3, share);

        // owner keeps 40%
    }

    // Burn tokens
    function burn(uint256 amount) external {
        _burn(msg.sender, amount);
    }
}
