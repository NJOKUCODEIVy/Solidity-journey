//SPDX-Licence-Identifier: MIT

pragma  solidity  ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


library priceConverter {
    function getPrice()  internal view returns(uint256){
//ABI
//Address 0xbCd195bDc976348e790E5457F6EF4ea9cfBa3Cd0
AggregatorV3Interface priceFeed =  AggregatorV3Interface(0xbCd195bDc976348e790E5457F6EF4ea9cfBa3Cd0);
 (,int256 price,,,) =  priceFeed.latestRoundData();
 // ETH in terms of USD
 // 3000.00000000
 return uint256(price * 1e10);
}
function getVersion() internal view returns (uint256){

AggregatorV3Interface priceFeed =  AggregatorV3Interface(0xbCd195bDc976348e790E5457F6EF4ea9cfBa3Cd0);
return priceFeed.version();
}





function getConversionRate(uint256 ethAmount) internal view returns (uint256){
uint256 ethPrice =getPrice();
uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
return ethAmountInUsd;

}
}