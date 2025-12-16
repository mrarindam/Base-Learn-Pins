// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract ArraysExercise {
    // ---------- Starter Array ----------
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];

    // ---------- Timestamp Storage ----------
    address[] public senders;
    uint[] public timestamps;

    // ---------- Return Complete Array ----------
    function getNumbers() public view returns (uint[] memory) {
        return numbers;
    }

    // ---------- Reset Numbers ----------
    function resetNumbers() public {
        numbers = [1,2,3,4,5,6,7,8,9,10];
    }

    // ---------- Append to Existing Array ----------
    function appendToNumbers(uint[] calldata _toAppend) public {
        for (uint i = 0; i < _toAppend.length; i++) {
            numbers.push(_toAppend[i]);
        }
    }

    // ---------- Timestamp Saving ----------
    function saveTimestamp(uint _unixTimestamp) public {
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    // ---------- Timestamp Filtering ----------
    function afterY2K()
        public
        view
        returns (uint[] memory recentTimestamps, address[] memory recentSenders)
    {
        uint count;

        // First pass: count valid timestamps
        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > 946702800) {
                count++;
            }
        }

        // Create exact-sized arrays
        recentTimestamps = new uint[](count);
        recentSenders = new address[](count);

        uint index;
        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > 946702800) {
                recentTimestamps[index] = timestamps[i];
                recentSenders[index] = senders[i];
                index++;
            }
        }
    }

    // ---------- Resets ----------
    function resetSenders() public {
        delete senders;
    }

    function resetTimestamps() public {
        delete timestamps;
    }
}
