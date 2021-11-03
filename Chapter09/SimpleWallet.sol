// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./Allowance.sol";

contract SimpleWallet is Allowance {
    
    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount);
    
    function ownerWithdrawMoney(address payable _to, uint _amount) public onlyOwner {
        require(_amount <= address(this).balance, "There are not enough funds stored in the smart contract");
        emit MoneySent(_to, _amount);
        _to.transfer(_amount);
    }
        
    function withdrawMoney(address payable _to, uint _amount) public onlyAllowed(_amount) {
        require(_amount <= address(this).balance, "There are not enough funds stored in the smart contract");
        reduceAllowance(msg.sender, _amount);
        emit MoneySent(_to, _amount);
        _to.transfer(_amount);
    }
    
    function renounceOwnership() public override onlyOwner view {
        revert("Cannot renounce ownership here!");
    }
    
    receive() external payable {
        emit MoneyReceived(msg.sender, msg.value);
    }
    
    fallback () external payable {
    }
}