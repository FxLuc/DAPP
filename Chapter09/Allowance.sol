// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.4/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v4.4/contracts/utils/math/SafeMath.sol";

contract Allowance is Ownable {
    
    using SafeMath for uint;
    
    event AllowanceChanged(address indexed _forWho, address indexed _fromWhom, uint _oldAmount, uint _newAmount);
    
    mapping(address => uint) public allowance;
    
    modifier onlyAllowed(uint _amount) {
        require(allowance[_msgSender()] >= _amount, "You are not allowed");
        _;
    }
    
    function ownerAddAllowance(address _who, uint _amount) public onlyOwner {
        addAllowance(_who, _amount);
    }
    
    function ownerReduceAllowance(address _who, uint _amount) public onlyOwner {
        reduceAllowance(_who, _amount);
    }
    
    function addAllowance(address _who, uint _amount) internal {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], _amount);
        allowance[_who] = allowance[_who].add(_amount);
    }
    
    function reduceAllowance(address _who, uint _amount) internal {
        emit AllowanceChanged(_who, msg.sender, allowance[_who], allowance[_who].sub(_amount));
        allowance[_who] = allowance[_who].sub(_amount);
    }
}