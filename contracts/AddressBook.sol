// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/access/Ownable.sol";

contract AddressBook is Ownable {
    // -------- Errors --------
    error ContactNotFound(uint id);

    struct Contact {
        uint id;
        string firstName;
        string lastName;
        uint[] phoneNumbers;
        bool exists;
    }

    mapping(uint => Contact) private contacts;
    uint[] private contactIds;

    // 🔥 IMPORTANT: pass owner to Ownable
    constructor(address initialOwner) Ownable(initialOwner) {}

    function addContact(
        uint _id,
        string memory _firstName,
        string memory _lastName,
        uint[] memory _phoneNumbers
    ) public onlyOwner {
        contacts[_id] = Contact({
            id: _id,
            firstName: _firstName,
            lastName: _lastName,
            phoneNumbers: _phoneNumbers,
            exists: true
        });

        contactIds.push(_id);
    }

    function deleteContact(uint _id) public onlyOwner {
        if (!contacts[_id].exists) {
            revert ContactNotFound(_id);
        }
        delete contacts[_id];
    }

    function getContact(uint _id) public view returns (Contact memory) {
        if (!contacts[_id].exists) {
            revert ContactNotFound(_id);
        }
        return contacts[_id];
    }

    function getAllContacts() public view returns (Contact[] memory) {
        uint count;
        for (uint i = 0; i < contactIds.length; i++) {
            if (contacts[contactIds[i]].exists) count++;
        }

        Contact[] memory result = new Contact[](count);
        uint index;

        for (uint i = 0; i < contactIds.length; i++) {
            if (contacts[contactIds[i]].exists) {
                result[index] = contacts[contactIds[i]];
                index++;
            }
        }

        return result;
    }
}
