// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Rewards {
    uint256 public rate;
    function setRate(uint256 r) external { rate = r; }
}
