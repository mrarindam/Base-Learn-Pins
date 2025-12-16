// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "./AddressBook.sol";

contract AddressBookFactory {
    function deploy() public returns (address) {
        // 🔥 owner directly set
        AddressBook book = new AddressBook(msg.sender);
        return address(book);
    }
}
