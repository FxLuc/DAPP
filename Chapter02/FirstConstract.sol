// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract FirstConstract{
    enum State { Created, Locked, Inactive}
    State public state;
    Person[] public people;
    struct Person{
        uint32 id;
        string name;
        uint8 age;
    }
    
    function addPerson(uint32 id, string memory name, uint8 age) public{
        people.push(Person(id, name, age));
        locked();
    }
    
    function locked() private{
        state = State.Locked;
    }
    
    function isLocker() public view returns(bool){
        return state==State.Locked;
    }

}