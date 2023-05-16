# EVM Golf - Fibonacci

## Challenge

Create a contract that calculates the Fibonacci sequence. A user can call the contract and input a number, `n`, and the contract should return the `n`th Fibonacci number. The goal is to create a contract with the lowest codesize OR the lowest average runtime gas.

**Note**: Due to overflow, this challenge is limited to the first 300 values of `n`.

## How to Play

A [simple starting point](./Fibonacci.huff) has been provided along with a [test suite](./Fibonacci.t.sol). Be sure to modify the test `setUp` function to support whatever compilation method, or lack thereof, you choose.

Run `forge test -vv --ffi --match-test testFibonacci` to test your solution. Your average runtime gas and codesize will be logged to the console, e.g.:

```
[PASS] testFibonacci() (gas: 13900582)
Logs:
  Average runtime gas: 7328
  Codesize: 66
```

## Winning Solutions

The best solutions for both average runtime gas and lowest codesize will be listed here.