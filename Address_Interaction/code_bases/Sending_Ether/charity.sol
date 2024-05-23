pragma solidity ^0.8.20;
SPDX-License-Identifier: MIT
contract Contract {
    address public owner;
    address public charity;
    
    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;
    }
    
    receive() external payable {
        // Ether is automatically added to the contract's balance
        // No additional steps required
    }

    function tip() public payable {
        require(msg.value > 0, "Tip amount must be greater than 0");
        (bool success, ) = owner.call{value: msg.value}("");
        require(success, "Tip transfer failed");
    }

    function donate() public {
        (bool success, ) = charity.call{value: address(this).balance}("");
        require(success, "Donation transfer failed");
    }
}