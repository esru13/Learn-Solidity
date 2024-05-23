pragma solidity ^0.8.20

contract Contract {
    enum Foods { Apple, Pizza, Bagel, Banana }

    food public food1 = Foods.Pizza;
    food public food2 = Foods.Banana;
    food public food3 = Foods.Bagel;
    food public food4 = Foods.Apple;
}