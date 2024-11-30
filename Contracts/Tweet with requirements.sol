
// SPDX-License-Identifier: MIT
//Please review Simply Tweets as the original code file
pragma solidity 0.8.26;


//Task
//1.Requirements to limit the length of tweet to only 280 character
//2.create function to get the tweet without using _owner


contract Twitter {

    // constant mean the it can'tbe change
    uint16 constant MAX_TWEET_LENGTH=280;
    //define struct
    //struct with name Tweet and specify what kind of data key are going to create
    struct Tweet {
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;

    }

    
    mapping(address =>Tweet[]) public tweets;
    
    function createtweet(string memory _tweet) public {

        //add conditional
        //if tweet length <=280,then is good else we revert
        //require is the function,byte mean one byte to one character in ascii, and could add .length
        //now we can add the revert condition after the condition like this "Tweet too Long" 
        //if want to change the 280 to constant we can add at the begining of the contract Or directly give a number, please scroll up to view the uint16 constant data
        //sample: require(bytes(_tweet).length <=280, "Tweet too Long" );
        require(bytes(_tweet).length <=MAX_TWEET_LENGTH, "Tweet too Long" );


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

    // Change the delete the _owner in the function and the return _owner change to msg.sender
     function gettweet2( uint _i) public view returns  (Tweet memory) {

        return tweets[msg.sender][_i];

    }

    

}