pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    address[] players;

    function Lottery() public {
        // msg.sender is the address of the person
        // who deploys the contract
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > 0.01 ether);
        // msg.sender is the player's address
        // since they are involking the function
        players.push(msg.sender);
    }
}
