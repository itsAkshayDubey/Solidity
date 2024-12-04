// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title sort given array using Bogo sort.
 * @author [Akshay Dubey](https://github.com/itsAkshayDubey)
 * @dev Contract to demonstrate working of bogo sort.
 */

contract BogoSort {
    
    // Function to generate a random number between 0 and the given number
    function random(uint256 _limit) private view returns (uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao))) % _limit;
    }

    // Function to shuffle the array randomly (helper for bogo sort)
    function shuffle(uint256[] memory arr) private view {
        uint256 n = arr.length;
        for (uint256 i = 0; i < n; i++) {
            uint256 j = random(n);
            // Swap elements at indices i and j
            (arr[i], arr[j]) = (arr[j], arr[i]);
        }
    }

    // Function to check if the array is sorted
    function isSorted(uint256[] memory arr) private pure returns (bool) {
        uint256 n = arr.length;
        for (uint256 i = 1; i < n; i++) {
            if (arr[i - 1] > arr[i]) {
                return false;
            }
        }
        return true;
    }

    // Main Bogo Sort algorithm
    function bogoSort(uint256[] memory arr) public view returns (uint256[] memory) {
        while (!isSorted(arr)) {
            shuffle(arr);
        }
        return arr;
    }
}
