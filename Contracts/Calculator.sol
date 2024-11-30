

// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

//1.Create a contract
//2.Create result variable to store result
//3.Create function add,subtract,multiple
//4.Create function to get result

contract Calculator{

    uint256 result = 0;

    //create function add(), with public for public use or see
    //function structure Function name (add()),Function Type (public/private),Return Type
    function add(uint256 num) public {

        result += num;

    }

    function substract(uint256 num)public {

        result -= num;
    }

    function multiple(uint256 num) public {

        result *= num;
    }

    //to put view at here is because we do not changing the state inside this function
    function get() public view  returns (uint256 ){
       return result; 
    }

}

