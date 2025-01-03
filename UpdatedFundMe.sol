//get funds from users
//withdraw funds 
//set a mininum funding value in USDT

// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;
import "./priceConverter.sol";


contract UpdatedFundMe  {
using priceConverter for uint256;
   
uint256 public minimumUsd =50 * 1e18;


address[] public  funders;
mapping(address => uint256) public addressToAmountFunded;
address public owner;

constructor(){
   owner = msg.sender;
}

   function fund() public payable{
// want to be able to set minimum fund amount
//1. how do we send ETH to this contract
require(msg.value.getConversionRate() >= minimumUsd,"Didnt send enough");
funders.push(msg.sender);
addressToAmountFunded[msg.sender] = msg.value;
   }

 function withdraw() public onlyOwner{
     /* starting index, ending index, step amount*/
for(uint256 funderIndex = 0; funderIndex< funders.length; funderIndex++ ){
   address funder = funders[funderIndex];
   addressToAmountFunded[funder] = 0;

}
//reset the array 
funders =  new  address[](0);
/*actually withdraw the funds
//transfer
payable(msg.sender).transfer(address(this).balance);
//send 
bool sendSuccess = payable(msg.sender).send(address(this).balance);
require(sendSuccess, "Send Failed");*/
//call
(bool callSuccess,) = payable(msg.sender).call{value: address(this).balance}("");
require(callSuccess,"call Failed");
 
   }

   modifier  onlyOwner {
      require(msg.sender == owner, "sender is not the Owner!");
      _;// then read the rest of the code
   }

}