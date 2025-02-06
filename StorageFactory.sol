// SPDX-License-Identifier: MIT

pragma solidity 0.8;

//this program will use to import function to get all thing in SimplyStorage.sol file
//you can also use import to import other file
//in the deploy you will able to see 2 contract appear, then you can choose which contract you want deploy
//sample: import "path of the file and file", if it in the same folder you can do like this:
import "./SimplyStorage.sol";
import "./StructPeope.sol";

contract StorageFac{
    //let create a function to deloy a contract from a contract
    //if you just deploy like this, we can't see any data, if you want to see it need to use block explorer to see the data
    function createSimplyStorageContract() public {
    //create an object of type SimplyStorage and rename it simplysto to a new SimplyStorage
        SimplyStorage simplysto = new SimplyStorage();
    }

    //so to see the data we can do something like this 
    SimplyStorage[]public simplyStorageArray;

    function createSimplyStorageContract2() public {
    //create an object of type SimplyStorage and rename it simplysto to a new SimplyStorage
        SimplyStorage simplysto2 = new SimplyStorage();
        simplyStorageArray.push(simplysto2);
    }
    //if you run this simplyStorageArray, and you put anything inside then you will get a address
    //this address is which this contract deploy another contract on blockchain


    //now let use create call function
    //the reason use simplestorageindex is to choose which simplystorage contract  want to interact
    //the reason use _simpleStorageNumber is to call the store function in simplystorage
    function sftstore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public {
        //there are 2 key thing require which is Address and ABI
         SimplyStorage simplysto2 = SimplyStorage (address(simplyStorageArray[_simpleStorageIndex]));
        simplysto2.store(_simpleStorageNumber);
    }
    //when deploy you can see any data due to doest not have function to retrive it

    //now let get a get function to retrieve the data
    function sftget(uint256 _simplyStorageIndex) public view returns(uint256) {
        SimplyStorage simplysto2 = SimplyStorage(address(simplyStorageArray[_simplyStorageIndex]));
        return simplysto2.retrieve();
    }
    
}

//now you could use inheritance function
//which you can let a contract having all the function of another contract with using in function
//sample below

contract StorageFac2 is StructPeo{
//you may review the deploy there
}