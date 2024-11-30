// SPDX-License-Identifier: MIT

// 1️⃣ Create Event for creating the tweet, called TweetCreated ✅
// USE parameters like id, author, content, timestamp
// 2️⃣ Emit the Event in the createTweet() function below  ✅
// 3️⃣ Create Event for liking the tweet, called TweetLiked ✅ 
// USE parameters like liker, tweetAuthor, tweetId, newLikeCount
// 4️⃣ Emit the event in the likeTweet() function below  ✅

pragma solidity ^0.8.26;

contract Twitter {

    uint16 public MAX_TWEET_LENGTH = 280;

    struct Tweet {
        uint256 id;
        address author;
        string content;
        uint256 timestamp;
        uint256 likes;
    }
    mapping(address => Tweet[] ) public tweets;
    address public owner;

    // Define the events here 👇
    //so in this event will get the data of below and it sourced form the struct Tweet above
    event tweetCreated(uint256 id, address author, string content, uint256 timestamp);
    event tweetlikes (address liker, address author, uint256 tweetid, uint256 newlikeaccount);
    event tweetunlikes(address unliker, address authir, uint256 tweetid, uint256 newlikeaccount);


    

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "YOU ARE NOT THE OWNER!");
        _;
    }

    function changeTweetLength(uint16 newTweetLength) public onlyOwner {
        MAX_TWEET_LENGTH = newTweetLength;
    }

    function createTweet(string memory _tweet) public {
        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet is too long bro!" );

        Tweet memory newTweet = Tweet({
            id: tweets[msg.sender].length,
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0
        });

        tweets[msg.sender].push(newTweet);

        //for this tweetcreated is link back to the event tweetcreated
        emit tweetCreated(newTweet.id, newTweet.author, newTweet.content, newTweet.timestamp);


    }

   


    function likeTweet(address author, uint256 id) external {  
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");

        tweets[author][id].likes++;

        emit tweetlikes(msg.sender, author, id, tweets[author][id].likes);

    }

    function unlikeTweet(address author, uint256 id) external {
        require(tweets[author][id].id == id, "TWEET DOES NOT EXIST");
        require(tweets[author][id].likes > 0, "TWEET HAS NO LIKES");
        
        tweets[author][id].likes--;

         emit tweetunlikes(msg.sender, author, id, tweets[author][id].likes);

    }

    function getTweet( uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory ){
        return tweets[_owner];
    }

}


