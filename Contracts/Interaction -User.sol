// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 1️⃣ Create a new Player and save it to players mapping with the given data
//dont forget this fine is link to Interactio Games.sol file, both file is use for Interaction exercise

contract User {
    struct Player {
        address playerAddress;
        string username;
        uint256 score;
    }

    mapping(address => Player) public players;

    function createUser(address userAddress, string memory username) external {
        require(players[userAddress].playerAddress == address(0), "User already exists");

        // Create a new player here 👇
        //Player is the struct and memory mean temporarily, newplayer is the name of this add new player
        // next the Player is the struct then structural data
       Player memory newplayer = Player({
        playerAddress: userAddress,
        username : username,
        score : 0

       });

       players[userAddress] = newplayer;

    }
}