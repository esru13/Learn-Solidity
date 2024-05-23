// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function makeContact(address hero) external {
        // Send some arbitrary calldata to trigger the hero's fallback function
        (bool success, ) = hero.call(abi.encodeWithSignature("fallback()"));
        require(success, "Contact failed");
    }
}
