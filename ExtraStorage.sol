// SPDX-license-Identifier:MIT

pragma solidity ^0.8.8;
import "./SimpleStorage.sol";

contract  ExtraStorage is SimpleStorage{
    function store(uint256 _accountNumber)  public override  {
        accountNumber = _accountNumber + 5;
    }
}