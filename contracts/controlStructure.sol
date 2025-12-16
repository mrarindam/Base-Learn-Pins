// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ControlStructures {
    // Custom error for after-hours
    error AfterHours(uint time);

    // ---------- Smart Contract FizzBuzz ----------
    function fizzBuzz(uint _number) public pure returns (string memory) {
        if (_number % 3 == 0 && _number % 5 == 0) {
            return "FizzBuzz";
        } else if (_number % 3 == 0) {
            return "Fizz";
        } else if (_number % 5 == 0) {
            return "Buzz";
        } else {
            return "Splat";
        }
    }

    // ---------- Do Not Disturb ----------
    function doNotDisturb(uint _time) public pure returns (string memory) {
        // Panic condition
        assert(_time < 2400);

        // After hours
        if (_time > 2200 || _time < 800) {
            revert AfterHours(_time);
        }

        // Lunch time
        if (_time >= 1200 && _time <= 1259) {
            revert("At lunch!");
        }

        // Morning
        if (_time >= 800 && _time <= 1199) {
            return "Morning!";
        }

        // Afternoon
        if (_time >= 1300 && _time <= 1799) {
            return "Afternoon!";
        }

        // Evening
        if (_time >= 1800 && _time <= 2200) {
            return "Evening!";
        }

        // Fallback (should never reach here)
        return "";
    }
}
