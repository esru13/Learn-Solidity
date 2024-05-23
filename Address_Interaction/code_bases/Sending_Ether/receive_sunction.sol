//SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    receive() external payable {
        // Ether is automatically added to the contract's balance
        // No additional steps required
    }
}