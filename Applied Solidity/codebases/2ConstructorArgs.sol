// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./Hero.sol";
import "./Enemy.sol";

contract Mage is Hero {
    constructor() Hero(50) {
        // Initializes Mage with 50 health
    }

    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Spell);
        super.attack(enemy); // Call the base contract's attack function
    }
}

contract Warrior is Hero {
    constructor() Hero(200) {
        // Initializes Warrior with 200 health
    }

    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Brawl);
        super.attack(enemy); // Call the base contract's attack function
    }
}
