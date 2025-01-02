//get funds from users
//withdraw funds 
//set a mininum funding value in USDT

// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
import "./priceConverter.sol";


contract FundMe  {
using priceConverter for uint256;
   
uint256 public minimumUsd =50 * 1e18;


address[] public  funders;

  
mapping(address => uint256) public addressToAmountFunded;


   function fund() public payable{
// want to be able to set minimum fund amount
//1. how do we send ETH to this contract
require(msg.value.getConversionRate() >= minimumUsd,"Didnt send enough");
funders.push(msg.sender);
addressToAmountFunded[msg.sender] = msg.value;
   }

   //function withdraw(){}



}