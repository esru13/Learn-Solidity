// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IHero {
    function alert() external;
}

contract Sidekick {
    function sendAlert(address hero) external {
        // Casting address to IHero interface and calling the alert function
        IHero(hero).alert();
    }
}
