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

    function random() private view returns (uint) {
        // sha3() is the same as keccak256()
        // sha3() has been deprecated in favor of keccak256()
        return uint(keccak256(block.difficulty, now, players));
    }

    function pickWinner() public restricted {
        uint index = random() % players.length;
        // this.balance is the all the money the contract
        // has been given
        players[index].transfer(this.balance);
        // creates an empty array with length of 0
        players = new address[](0);
    }

    modifier restricted() {
        require(msg.sender == manager);
        // the _; means run all of the code that uses the modifier
        // ex: all of pickWinner() code will be ran at _; since
        // pickWinner() uses restricted modifier
        _;
    }

    function getPlayers() public view returns (address[]) {
        return players;
    }
}
