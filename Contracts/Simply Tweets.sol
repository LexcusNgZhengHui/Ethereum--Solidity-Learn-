
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;


// Task
//1.Create Twitter Contract
//2.Create Mapping between user and tweet
//3.Add a function to create tweet and save it to mapping
//4.Create function to get tweet


contract Twitter {

    //add code
    //mapping is function , address mean user and address is the etheereum address in this case, then do'tforget ;to end the function
    //for the current is just having 1 tweet only
    mapping(address =>string) public tweets;
    //                   string memory here mean it save the _tweet data in a temporary memory
    function createtweet(string memory _tweet) public {

        // msg.sender is function basic/directly from blockchain, msg is a stored your blockchain address and other information is soted on this message object
        //msg.sender can see as a key that saving your blockchain address that having value of _tweet
        tweets[msg.sender] = _tweet;

    }
    // when return something need to specify what type of data return, and not only the type and also where to store the data temporary therefore string is the type and memory is the temporay placee to store the data 
    // memory also used to tell solidity  where to temporary store the data
    //at the public we put a view, due to we in this function we do not modify any data, we just simply get and return data only
    //same time using view can more effiently on gas 
    function gettweet(address _owner) public view returns  (string memory) {

        return tweets[_owner];

    }

}