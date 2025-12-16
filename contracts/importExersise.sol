// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Import the library
import "./SillyStringUtils.sol";

contract ImportsExercise {
    // Public instance of Haiku
    SillyStringUtils.Haiku public haiku;

    // ---------- Save Haiku ----------
    function saveHaiku(
        string memory _line1,
        string memory _line2,
        string memory _line3
    ) public {
        haiku = SillyStringUtils.Haiku({
            line1: _line1,
            line2: _line2,
            line3: _line3
        });
    }

    // ---------- Get Haiku ----------
    function getHaiku()
        public
        view
        returns (SillyStringUtils.Haiku memory)
    {
        return haiku;
    }

    // ---------- Shruggie Haiku ----------
    function shruggieHaiku()
        public
        view
        returns (SillyStringUtils.Haiku memory)
    {
        return SillyStringUtils.Haiku({
            line1: haiku.line1,
            line2: haiku.line2,
            line3: SillyStringUtils.shruggie(haiku.line3)
        });
    }
}
