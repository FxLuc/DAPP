// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;
contract FirstConstract {
    enum State { Created, Locked, Inactive } 
    State public state;

    function isLocked() public view returns(bool){
        return state == State.Locked;
    }
}