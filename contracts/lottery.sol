pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    address[] private players;

    function Lottery() public {
        manager = msg.sender;
    }

    function enter() public payable {
        require(msg.value > .01 ether);
    
        players.push(msg.sender);
    }

    function psuedoRandomNumberGenerator() private view returns (uint) {
       return uint(keccak256(block.difficulty, now, players));
    }

    function pickWinner() public restricted {
        require(msg.sender == manager);

        uint index = psuedoRandomNumberGenerator() % players.length;
        players[index].transfer(this.balance);
        players = new address[](0);
    }

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    function getAllPlayers() public view returns (address[]) {
        return players;
    }
}