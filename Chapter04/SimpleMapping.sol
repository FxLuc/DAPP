//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

contract SimpleMapping {
    
    mapping(address => bool) public myAddressMapping;
    
    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }
    
}