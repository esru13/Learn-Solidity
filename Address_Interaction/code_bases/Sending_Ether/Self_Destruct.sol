
//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

contract Contract {
    address public owner;
    address payable public charity; // Updated to be payable

    constructor(address _charity) {
        owner = msg.sender;
        charity = payable(_charity); // Casting to payable
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
        // Trigger self-destruct and send remaining balance to charity address
        selfdestruct(charity);
    }
}

