// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    struct User {
        uint balance;
        bool isActive;
    }

    mapping(address => User) public users;

    function createUser() external {
        require(!users[msg.sender].isActive, "User already exists");
        users[msg.sender] = User(100, true);
    }

    function transfer(address _recipient, uint _amount) external {
        require(users[msg.sender].isActive, "Sender is not an active user");
        require(users[_recipient].isActive, "Recipient is not an active user");
        require(users[msg.sender].balance >= _amount, "Insufficient balance");

        users[msg.sender].balance -= _amount;
        users[_recipient].balance += _amount;
    }
}
