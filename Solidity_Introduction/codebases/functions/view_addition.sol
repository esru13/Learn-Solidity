pragma solidity ^0.8.20;

contract Contract {
    uint public x;

    constructor(uint a) {
        x = a;
    }

    function increment() external {
        x++;
    }

    function add(uint a) external returns(uint) {
        return x + a;
    } 
}