// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "foundry-huff/HuffDeployer.sol";

contract FibonacciTest is Test {
    address public fibonacci;

    function setUp() public {
        fibonacci = address(HuffDeployer.deploy("Fibonacci/Fibonacci"));
    }

    function testFibonacci() public {
        uint256 gasSum;

        for (uint256 i; i < 100; ++i) {
            uint256 gasBefore = gasleft();
            (, bytes memory result) = fibonacci.call(abi.encode(i));
            uint256 gasAfter = gasleft();

            gasSum += gasBefore - gasAfter;

            assertEq(result, abi.encode(fib(i)));
        }

        console.log("Average runtime gas: %s", gasSum / 100);

        uint256 size;
        assembly {
            size := extcodesize(sload(fibonacci.slot))
        }

        console.log("Codesize: %s", size);
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
