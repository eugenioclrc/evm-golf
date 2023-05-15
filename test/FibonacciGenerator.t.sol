// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "foundry-huff/HuffDeployer.sol";

contract CounterTest is Test {
    address public fibonacciGenerator;

    function setUp() public {
        fibonacciGenerator = address(HuffDeployer.deploy("src/FibonacciGenerator.huff"));
    }
}
