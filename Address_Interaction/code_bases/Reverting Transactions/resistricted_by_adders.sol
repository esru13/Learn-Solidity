pragma solidity ^0.8.20;

contract Contract {
    address public deployer; // Store the address of the contract deployer
    
    // Constructor to set the deployer address and require 1 ether
    constructor() payable {
        deployer = msg.sender; // Set the deployer to the address deploying the contract
        require(msg.value >= 1 ether, "Insufficient ether sent");
    }
    
    // Modifier to restrict access to the deployer only
    modifier onlyDeployer() {
        require(msg.sender == deployer, "Only the deployer can call this function");
        _; // Continue executing the function after the modifier
    }
    
    // Function to withdraw all funds from the contract and send them to the deployer
    function withdraw() external onlyDeployer {
        // Get the contract balance
        uint256 contractBalance = address(this).balance;
        // Transfer the balance to the deployer
        payable(msg.sender).transfer(contractBalance);
    }
    
    // Function to get the contract balance
    function getContractBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
