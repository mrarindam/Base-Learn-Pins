// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract GarageManager {
    // -------- Errors --------
    error BadCarIndex(uint index);

    // -------- Struct --------
    struct Car {
        string make;
        string model;
        string color;
        uint numberOfDoors;
    }

    // -------- Storage --------
    // user => list of cars
    mapping(address => Car[]) public garage;

    // -------- Add Car --------
    function addCar(
        string memory _make,
        string memory _model,
        string memory _color,
        uint _numberOfDoors
    ) public {
        garage[msg.sender].push(
            Car({
                make: _make,
                model: _model,
                color: _color,
                numberOfDoors: _numberOfDoors
            })
        );
    }

    // -------- Get My Cars --------
    function getMyCars() public view returns (Car[] memory) {
        return garage[msg.sender];
    }

    // -------- Get User Cars --------
    function getUserCars(address _user)
        public
        view
        returns (Car[] memory)
    {
        return garage[_user];
    }

    // -------- Update Car --------
    function updateCar(
        uint _index,
        string memory _make,
        string memory _model,
        string memory _color,
        uint _numberOfDoors
    ) public {
        if (_index >= garage[msg.sender].length) {
            revert BadCarIndex(_index);
        }

        garage[msg.sender][_index] = Car({
            make: _make,
            model: _model,
            color: _color,
            numberOfDoors: _numberOfDoors
        });
    }

    // -------- Reset My Garage --------
    function resetMyGarage() public {
        delete garage[msg.sender];
    }
}
