// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract BasicMath {
    function adder(uint256 a, uint256 b)
        external
        pure
        returns (uint256, bool)
    {
        unchecked {
            uint256 sum = a + b;
            if (sum < a) {
                // overflow happened
                return (0, true);
            }
            return (sum, false);
        }
    }

    function subtractor(uint256 a, uint256 b)
        external
        pure
        returns (uint256, bool)
    {
        if (b > a) {
            // underflow case
            return (0, true);
        }
        return (a - b, false);
    }
}
