// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// 2️⃣ Set up a connection to the User Contract throught IUser in constructor
// 3️⃣ Call the createUser function with the correct inputs
//dont forget this fine is link to Interactio User.sol file, both file is use for Interaction exercise

interface IUser {
    function createUser(address userAddress, string memory username) external;
}

contract Game {
    uint public gameCount;
    IUser public userContract;

    constructor(address _userContractAddress) {
        // CODE HERE
        //We use the Interface IUser and use a paranthesis () to specific
        userContract = IUser (_userContractAddress);
    }

    function startGame(string memory username) external {
        // Create a user in the User contract
        gameCount++;
    
        // CODE HERE
        //now if select the createUser the system will auto give the default data, which we create  in the IUser above
        //but here we will change the useraddres to msg.sender
        userContract.createUser(msg.sender, username);

    }
}