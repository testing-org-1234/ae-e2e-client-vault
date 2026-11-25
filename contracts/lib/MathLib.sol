// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

library MathLib {
    /* Rounds down. */
    function mulDiv(uint256 a, uint256 b, uint256 c) internal pure returns (uint256) {
        return (a * b) / c;
    }
}
