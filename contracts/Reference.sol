// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Reference {

    address public  owner;

    // errors
    error InsufficientAmount(uint amount, address addr);

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Not the Owner");
        _;
    }

    // Mapping an address
    mapping(address => uint256) public balances;

    // Function for withdraw and only onwer can call this function
    function withdraw(address _to) public onlyOwner {
        uint bal = address(this).balance;
        (bool sent,) = _to.call{value:bal}("");
        require(sent, "Failed to send Ether");
    }

    string public name = "Hello Kaia Developer";

    // Comparison of strings on solidity
    function compereString(string memory _name) public view  returns (bool) {
        return keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked(name));
    }

    function add(uint _x, uint _y) public pure returns (uint) {
        return _x +_y;
    }

    // Deposit function to allow users to send Ether
    function deposit() public payable {
        require(msg.value >= 1 ether, InsufficientAmount(msg.value, msg.sender));
        balances[msg.sender] += msg.value;
    }

}

contract Complex is Reference {
    
}