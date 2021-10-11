// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.3;

contract SendMoney {

    uint public balanceReceived;
    
    function receiveMoney() public payable {
        balanceReceived += msg.value;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function msgSender() internal view virtual returns (address payable) {
        return payable(msg.sender); // added payable
    }

    function withdrawMoney() public {
        address payable to = msgSender();
        to.transfer(this.getBalance());
    }
    
    function withdrawMoneyTo(address payable _to) public {
        _to.transfer(this.getBalance());
    }

    // function sendMoney(address payable _to) public payable {
    //     // Call returns a boolean value indicating success or failure.
    //     (bool sent, bytes memory data) = _to.call{value: msg.value}("");
    //     require(sent, "Failed to send Ether");
    // }
}