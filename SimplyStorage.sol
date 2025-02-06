// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract SimplyStorage{

    //sample data for each type
    uint256 favoritenumber = 5;
    bool favoritebool = false;
    string favoritestring = "String";
    int256 favoriteInt = -5;
    address favoriteAddress = 0xcB2a1Ed86d0Fb7d94933EF172d2b972DaDFCdab0;
    bytes32 favoriteByte = "cat";

    //if doest not mention any data in the type it will initale as 0
    uint256 favoritenumber2 ;

    


    //function 1
    //this function is to store the data into favoritenumber2
    //this function is public 
    //public can be call by any function or variable, it use visibility of the function to everyone
    //there is another functioncall external,internal,private
    //external can only call by other contract,it call use in the same contract
    //sample function for this few type of call
    function store(uint256 _storefavoritenumber2) public{
        favoritenumber2 = _storefavoritenumber2;
    }

    //if you just do the above function1 ,you can't see what kind data is store to the variable
    //if you want to see the data you could add a public in the variable :sample below
    uint256 public  favoritenumber3 ;

     function store2(uint256 _storefavoritenumber3) public{
        favoritenumber3 = _storefavoritenumber3;
    } 

    //if you don't want to show the data from the storage,you could add a internal in the variable :sample below
    uint256 internal favoritenumber4 ;
      function store3(uint256 _storefavoritenumber4) internal{
        favoritenumber4 = _storefavoritenumber4;
    }   
    //if you don't want to show the data from the storage,you could add a private in the variable :sample below
      uint256 private favoritenumber5 ;
        function store4(uint256 _storefavoritenumber5) private{
            favoritenumber5 = _storefavoritenumber5;
        }  
        //if you don't want to show the data from the storage,you could add a external in the variable :sample below
    uint256 favoritenumber6 ;
     function store5(uint256 _storefavoritenumber6) external{
        favoritenumber6 = _storefavoritenumber6;
    }      

//------------------------------------------------------------------------------------------------------
    //function for retrieve data
    //now we will use sample for store2 function
    
    function retrieve()public view returns(uint256){
        return favoritenumber3;
    }
    //after deploy this function, at the deployed contracts there will notice that the function have turn to blue colour 
    //this is because the "view" we have add in the function
    //this also mean this view is just use to read the transaction on blockchain, it doest not bring any changing on blockchain
    //anoher same function keyword is "pure"

    //pure function is keyword to do sometype of math 
    //sample here
    // function retrieve2(uint256 favoritenumber3)public pure {
    //    favoritenumber3 + favoritenumber3;
        
   // }

  
}



