// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ErrorTriageExercise {
    
    // State variable for popWithReturn
    uint[] arr;

    /**
     * Finds the difference between each uint with it's neighbor (a to b, b to c, etc.)
     * and returns a uint array with the absolute integer difference of each pairing.
     */
    function diffWithNeighbor(
        uint _a,
        uint _b,
        uint _c,
        uint _d
    ) public pure returns (uint[] memory) {
        uint[] memory results = new uint[](3);
        
        // FIX: Use ternary operator to calculate absolute difference to prevent underflow
        results[0] = _a > _b ? _a - _b : _b - _a;
        results[1] = _b > _c ? _b - _c : _c - _b;
        results[2] = _c > _d ? _c - _d : _d - _c;
        
        return results;
    }

    /**
     * Changes the _base by the value of _modifier. Base is always >= 1000. 
     * Modifiers can be between positive and negative 100;
     */
    function applyModifier(
        uint _base,
        int _modifier
    ) public pure returns (uint) {
        // FIX: Cannot add uint and int directly. Use conditional logic for safe type conversion.
        return _modifier >= 0 
            ? _base + uint(_modifier) // If positive, cast to uint and add
            : _base - uint(-_modifier); // If negative, cast absolute value to uint and subtract
    }

    /**
     * Pop the last element from the supplied array, and return the popped
     * value (unlike the built-in function)
     */
    function popWithReturn() public returns (uint) {
        // FIX 1: Check if the array is empty before trying to access or pop
        require(arr.length > 0, "Array is empty");
        
        // FIX 2: Store the value *before* popping/deleting it
        uint poppedValue = arr[arr.length - 1];
        
        // FIX 3: Use the built-in pop() function to correctly reduce length
        arr.pop();
        
        return poppedValue; // Return the stored value
    }

    // The utility functions below are working as expected
    function addToArr(uint _num) public {
        arr.push(_num);
    }
    function getArr() public view returns (uint[] memory) {
        return arr;
    }
    function resetArr() public {
        delete arr;
    }
}