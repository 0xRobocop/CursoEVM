// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "../lib/foundry-huff/src/HuffDeployer.sol";
import "../lib/forge-std/src/Test.sol";
import "../lib/forge-std/src/console.sol";

contract ArithmeticOperationTest is Test {
    /// @dev Address of the ArithmeticOP contract.
    ArithmeticOP public arithmeticOperations;

    /// @dev Setup the testing environment.
    function setUp() public {
        arithmeticOperations = ArithmeticOP(HuffDeployer.deploy("ArithmeticOP"));
    }

    function testAdd() public {
        uint256 suma = arithmeticOperations.addTwo(2,3);
        
        assertEq(suma, 5);
    }

    function testSub() public {
        uint256 resta = arithmeticOperations.subTwo(10,3);
        
        assertEq(resta, 7);
    }

    function testMul() public {
        uint256 mul = arithmeticOperations.mulTwo(2,3);
        
        assertEq(mul, 6);
    }

    function testDiv() public {
        uint256 div = arithmeticOperations.divTwo(14,2);
        
        assertEq(div, 7);
    }
}

interface ArithmeticOP {
    function addTwo(uint256,uint256) external view returns(uint256);
    function subTwo(uint256,uint256) external view returns(uint256);
    function mulTwo(uint256,uint256) external view returns(uint256);
    function divTwo(uint256,uint256) external view returns(uint256);
}