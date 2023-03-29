// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "../lib/foundry-huff/src/HuffDeployer.sol";
import "../lib/forge-std/src/Test.sol";
import "../lib/forge-std/src/console.sol";

contract SimpleStoreTest is Test {
    /// @dev Address of the SimpleStore contract.
    SimpleStorage public simpleStore;

    /// @dev Setup the testing environment.
    function setUp() public {
        simpleStore = SimpleStorage(HuffDeployer.deploy("SimpleStorage"));
    }

    /// @dev Ensure that you can set and get the value.
    function testSetAndGetValue(uint256 value) public {
        simpleStore.setValue(value);
        console.log(value);
        console.log(simpleStore.getValue());
        assertEq(value, simpleStore.getValue());
    }
}

interface SimpleStorage {
    function setValue(uint256) external;
    function getValue() external returns (uint256);
}