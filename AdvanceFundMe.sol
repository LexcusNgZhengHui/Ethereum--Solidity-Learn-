// SPDX-License-Identifier: MIT
pragma solidity 0.8;

//this program is use to accept payment/fund
//and will use chainlink function to get other payment method
//there is 2 method to import the other contract code one is using import function:example here
//import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
//another is direct use the interface function 

interface AggregatorV3Interface {
  function decimals() external view returns (uint8);

  function description() external view returns (string memory);

  function version() external view returns (uint256);

  function getRoundData(
    uint80 _roundId
  ) external view returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);

  function latestRoundData()
    external
    view
    returns (uint80 roundId, int256 answer, uint256 startedAt, uint256 updatedAt, uint80 answeredInRound);
}

//ABI - Applicaiton Binary Interface , use to tell solidity or other programming language how to interact with other contract
//anytime you want interact with already deployed smartcontract then also need ABI
//interface is compile with ABI

contract FundMe {

    //let do a mapping for the address and the fund/value
    mapping(address => uint256) public addresstoAmountFund;


    //when function with payable it will provide do payment function
    function fund() public payable {
        //the msg.sender here mean who the sender, so in the deploy it require the sender address
        addresstoAmountFund[msg.sender]+= msg.value;
    }


  function getVersion() public view returns (uint256){
      AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
    return pricefeed.version();
  }

  function getPrice() public view returns(uint256){
    AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
     (, int256 answer, ,, )=pricefeed.latestRoundData();
      return uint256 (answer);
 
  }




}

contract GetConversion{


  function getPrice() public view returns(uint256){
    AggregatorV3Interface pricefeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
     (, int256 answer, ,, )=pricefeed.latestRoundData();
      return uint256 (answer);
 
  }
    function getConversionRate(uint256 ethAmount) public view returns(uint256){
    uint256 ethprice =getPrice();
    uint256 ethAmountinUSD =(ethprice * ethAmount);
    return ethAmountinUSD;




  }


}