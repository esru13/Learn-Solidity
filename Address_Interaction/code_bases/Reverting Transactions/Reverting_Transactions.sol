pragma solidity ^0.8.20;

contract Contract {
    // Define a payable constructor method
    constructor() payable {
        // Require 1 ether to be sent to the constructor
        require(msg.value >= 1 ether, "Insufficient ether sent");
    }
}
