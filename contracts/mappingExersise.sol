// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract FavoriteRecords {
    // -------- Errors --------
    error NotApproved(string recordName);

    // -------- State Variables --------
    // approved album => true/false
    mapping(string => bool) public approvedRecords;

    // user => (album => true/false)
    mapping(address => mapping(string => bool)) public userFavorites;

    // helper arrays (needed to return lists)
    string[] private approvedList;
    mapping(address => string[]) private userFavoriteList;

    // -------- Constructor --------
    constructor() {
        _addApproved("Thriller");
        _addApproved("Back in Black");
        _addApproved("The Bodyguard");
        _addApproved("The Dark Side of the Moon");
        _addApproved("Their Greatest Hits (1971-1975)");
        _addApproved("Hotel California");
        _addApproved("Come On Over");
        _addApproved("Rumours");
        _addApproved("Saturday Night Fever");
    }

    // -------- Internal Helper --------
    function _addApproved(string memory _name) internal {
        approvedRecords[_name] = true;
        approvedList.push(_name);
    }

    // -------- Get Approved Records --------
    function getApprovedRecords() public view returns (string[] memory) {
        return approvedList;
    }

    // -------- Add Record to Favorites --------
    function addRecord(string memory _album) public {
        if (!approvedRecords[_album]) {
            revert NotApproved(_album);
        }

        // avoid duplicate entries
        if (!userFavorites[msg.sender][_album]) {
            userFavorites[msg.sender][_album] = true;
            userFavoriteList[msg.sender].push(_album);
        }
    }

    // -------- Users’ Lists --------
    function getUserFavorites(address _user)
        public
        view
        returns (string[] memory)
    {
        return userFavoriteList[_user];
    }

    // -------- Reset My Favorites --------
    function resetUserFavorites() public {
        string[] storage favs = userFavoriteList[msg.sender];

        for (uint i = 0; i < favs.length; i++) {
            userFavorites[msg.sender][favs[i]] = false;
        }

        delete userFavoriteList[msg.sender];
    }
}
