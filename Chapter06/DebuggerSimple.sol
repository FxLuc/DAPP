pragma solidity ^0.5.13;

contract DebuggerSimple {
    uint public myUint;
    
    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }
}