// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "./Allowance.sol";

contract SimpleWallet is Allowance {
    
    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyReceived(address indexed _from, uint _amount);
    
    receive() external payable hasValue {
        emit MoneyReceived(msg.sender, msg.value);
    }
    
    fallback() external payable {
        // emit MoneyReceived(msg.sender, msg.value);
    }
    
    modifier hasValue() {
        require(msg.value > 0, "You are not transfer any value!");
        _;
    }
    
    modifier enoughFunds(uint _amount) {
        require(
            _amount <= address(this).balance,
            "There are not enough funds stored in the smart contract"
        );
        _;
    }
    
    function deposit() public payable hasValue {
        emit MoneyReceived(msg.sender, msg.value);
        addAllowance(msg.sender, msg.value);
    }
    
    function ownerWithdrawMoney(address payable _to, uint _amount)
    public onlyOwner enoughFunds(_amount) {
        sentMoney(_to, _amount);
    }
    
    function selfDestruct(address payable _to) public onlyOwner {
        emit MoneySent(_to, address(this).balance);
        selfdestruct(_to);
    }
    
    function withdrawMoney(address payable _to, uint _amount)
    public onlyAllowed(_amount) enoughFunds(_amount) { 
        reduceAllowance(msg.sender, _amount);
        sentMoney(_to, _amount);
    }
    
    function renounceOwnership() public override onlyOwner view {
        revert("Cannot renounce ownership here!");
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    function sentMoney(address payable _to, uint _amount) private {
        emit MoneySent(_to, _amount);
        _to.transfer(_amount);
    }
}