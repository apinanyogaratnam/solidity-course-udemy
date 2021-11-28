// SPDX identifier:
pragma solidity ^0.8.9;
// linter warnings (red underline) about pragma version can igonored!

// contract code will go here

contract Inbox {
    string public message;

    constructor Inbox(string initialMessage) {
        message = initialMessage;
    }

    function setMessage(string newMessage) public {
        message = newMessage;
    }
}
