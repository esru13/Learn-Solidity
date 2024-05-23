// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    event Approved(uint balanceSent);

    constructor(address _arbiter, address _beneficiary) payable {
        arbiter = _arbiter;
        beneficiary = _beneficiary;
        depositor = msg.sender;
    }

    modifier onlyArbiter() {
        require(msg.sender == arbiter, "Only arbiter can call this function");
        _;
    }

    function approve() external onlyArbiter {
        uint balanceSent = address(this).balance;
        payable(beneficiary).transfer(balanceSent);
        emit Approved(balanceSent);
    }
}
