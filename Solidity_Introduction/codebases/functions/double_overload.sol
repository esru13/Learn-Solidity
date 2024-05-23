pragma solidity ^0.8.20;

contract Contract {
    function double(uint a) public pure returns(uint x) {
        return a * 2;
    }

    function double(uint a, uint b) external pure returns(uint x, uint y) {
        return (double(a), double(b));
    }
}