// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract AdvancedContract {
    
    string public className;
    uint256 public numberOfStudents;
    uint256 public year;

    event Set(string className, uint256 indexed numberOfStudents, uint256 indexed year);

    function setClass(string memory _name, uint256 _numberOfStudents, uint256 _year) public {
        className = _name;
        numberOfStudents = _numberOfStudents;
        year = _year;

        emit Set(className, numberOfStudents, year);
        
    }
}


// using struct
contract ClassDetails {

    struct Class {
        string name;
        uint256 numberOfStudent;
        uint256 year;
    }
    
    function setClass(string memory _name, uint256 _numberOfStudent, uint256 _year) public pure returns (Class memory) {
        return Class({name: _name, numberOfStudent: _numberOfStudent, year: _year});
    }

   
}


