// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract SimpleStorage {
    uint256 private number;

    constructor(uint256 _number) {
        number = _number;
    }

    function set(uint256 _number) external {
        number = _number;
    }

    function get() public view returns (uint256) {
        return number;
    }
}