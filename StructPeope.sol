// SPDX-License-Identifier: MIT
pragma solidity 0.8;

contract StructPeo{
  //let create a struct with few variable
     struct People{
        uint favouritenumber ;
        string name;

    }

    //let create sample to add data in the struc
    People public personadd = People ({favouritenumber: 1, name: "Jimmy"});
    //you able to see the data is store ina array form

    //now let create add variable with function to the array
    People [] public people;

    //in this function we will pass the 2 data string memory _name and uint256  _favouritenumber
    //the push function act as a put data in our array
    //the memory function is to store data
    //memory is only store data when execution (function or contract call only),after that will delete
    //another store function is call storage,it use to store forever
    //the reason using string memory is because:to handle the textual data in smart contracts
    function addpeople(string memory _name, uint256  _favouritenumber) public {
        //there are 2 method to push one is below: (to let people know what data put which data)
        people.push (People({favouritenumber: _favouritenumber, name: _name}));
        //or anothrer both are same 
        //people.push (People(_favouritenumber, _name));

        //now back from the mapping below
        nametoFavouritenumber[_name]=_favouritenumber;

    }

    //let use another struct call mapping
    //mapping like dictorary of data struc with 1 value per key
    //sample we want to know the string map to which number then we use this
    //don't forget to set as public and give a function name
    mapping(string => uint256) public nametoFavouritenumber;
    //if you just done at here you will notice nothing appear for the data, so back to addpeople there to some function


}
 