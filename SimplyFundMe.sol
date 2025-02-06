// SPDX-License-Identifier: MIT
pragma solidity 0.8;

//this program is use to accept payment/fund
contract FundMe{

    //when function with payable it will provide do payment function
    function fund() public payable {
        //the msg.sender here mean who the sender, so in the deploy it require the sender address
        addresstoAmountFund[msg.sender]+= msg.value;
    }

    //let do a mapping for the address and the fund/value
    mapping(address => uint256) public addresstoAmountFund;
}