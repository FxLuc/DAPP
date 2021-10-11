//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;
contract Variables {
    bool public myBool;
    
    function setMyBool(bool _myBool) public {
        myBool = _myBool;
    }

    uint public myUint;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
    
    int8 public myInt8;
    
    function incrementUint() public {
        myInt8++;
    }
    
    function decrementUint() public {
        myInt8--;
    }

    address public myAddress;
    
    function setAddress(address _myAddress) public {
        myAddress = _myAddress;
    }
    
    function getBalanceOfAddress() public view returns(uint) {
        return myAddress.balance;
    }

    string public myString ="Hello the real world!!!!!";
    
    function setMyString(string memory _myString) public {
        myString = _myString;
    }
}