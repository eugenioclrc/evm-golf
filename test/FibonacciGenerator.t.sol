// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "foundry-huff/HuffDeployer.sol";

contract FibonacciGeneratorTest is Test {
    address public fibonacciGenerator;

    function setUp() public {
        fibonacciGenerator = address(HuffDeployer.deploy("FibonacciGenerator"));
    }

    function testFibonacci(uint256 n) public {
        vm.assume(n < 100);

        (, bytes memory result) = fibonacciGenerator.call(abi.encode(n));
        assertEq(result, abi.encode(fib(n)));
    }

    function fib(uint256 n) internal pure returns (uint256) {
        if (n == 0) {
            return 0;
        } else if (n == 1) {
            return 1;
        } else {
            uint256 a = 0;
            uint256 b = 1;
            for (uint256 i = 2; i <= n; i++) {
                uint256 c = a + b;
                a = b;
                b = c;
            }
            return b;
        }
    }
}
