// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface IHero {
    function alert() external;
}

contract Sidekick {
    function sendAlert(address hero) external {
        // Manually forming the calldata by taking the first 4 bytes of the hash of the function signature
        bytes4 functionSignature = bytes4(keccak256("alert()"));
        
        // Manually call the hero contract using assembly
        assembly {
            // Load the function signature to memory
            let ptr := mload(0x40)
            mstore(ptr, functionSignature)
            
            // Call the hero contract
            let result := call(gas(), hero, 0, ptr, 0x4, 0, 0)
            
            // Check the result
            if eq(result, 0) {
                revert(0, 0)
            }
        }
    }
}
