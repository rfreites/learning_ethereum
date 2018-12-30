pragma solidity ^0.4.24;

import "./Ownable.sol";

contract MessageStore is Ownable {
    
    string private message;
    
    function setMessageByOwner(string newMessage) public isOwner {
        message = newMessage;
    }
    
    function setMessageByGuess(string newMessage) public payable {
        require(msg.value == 3 ether);
        message = newMessage;
    }
    
    function getMessage() public view returns (string) {
        return message;
    }
    
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
    
    function getBalanceInEther() public view returns (uint) {
        return getBalance() / 1e18;
    }
}
