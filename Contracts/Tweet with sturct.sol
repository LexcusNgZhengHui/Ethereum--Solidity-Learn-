
// SPDX-License-Identifier: MIT
//Please review Simply Tweets as the original code file
pragma solidity 0.8.26;


//Task
//1.Define a Tweet Struct with author,content,timestamp,likes
//2.Add struct to array
//3.Test Tweets

contract Twitter {

    //define struct
    //struct with name Tweet and specify what kind of data key are going to create
    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;

    }

    //to use the struct we change the string type to the Tweet struct we created just now
    mapping(address =>Tweet[]) public tweets;
    
    function createtweet(string memory _tweet) public {
//  add ()parenthesess then {} to consit the struct 
//Tweet in the front is link back to the struct 
       Tweet memory newTweet = Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0


       });

        tweets[msg.sender].push(newTweet);

    }
   
    //so we using struct instead of string so the string all will change to struct we created Tweet

    function gettweet(address _owner, uint _i) public view returns  (Tweet memory) {

        return tweets[_owner][_i];

    }

    function getalltweet (address _owner) public view returns (Tweet[] memory){

        return tweets[_owner];

    }

}