// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IERC20} from "./Token.sol";
import {MathLib} from "./lib/MathLib.sol";

/// @notice A tiny invented vault for a test audit.
contract Vault {
    IERC20 public immutable asset;
    mapping(address => uint256) public shares;
    uint256 public totalShares;

    constructor(IERC20 _asset) {
        asset = _asset;
    }

    function deposit(uint256 amount) external returns (uint256 minted) {
        uint256 balance = asset.balanceOf(address(this));
        minted = totalShares == 0 ? amount : MathLib.mulDiv(amount, totalShares, balance);
        shares[msg.sender] += minted;
        totalShares += minted;
        asset.transferFrom(msg.sender, address(this), amount);
    }

    function withdraw(uint256 shareAmount) external returns (uint256 out) {
        uint256 balance = asset.balanceOf(address(this));
        out = MathLib.mulDiv(shareAmount, balance, totalShares);
        shares[msg.sender] -= shareAmount;
        totalShares -= shareAmount;
        asset.transfer(msg.sender, out);
    }
}
