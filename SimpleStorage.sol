// SPDX-License-Identifier:MIT
pragma solidity ^0.8.8;

contract  SimpleStorage {
 //this gets initialized to zero
   uint256 accountNumber;
   mapping(string => uint256)  public nameToAccountNumber;

 struct People{
   uint256 accountNumber;
   string name;
   string bank;

 }
People[] public people;




function store(uint256 _accountNumber) public virtual  {
accountNumber = _accountNumber;
     }
     //view, pure
   function retrieve() public view returns(uint256){ 
return accountNumber;

   }
   function addPerson( string memory _name, uint256 _accountNumber, string memory _bank) public{
    People memory newPerson = People({accountNumber: _accountNumber, name: _name , bank: _bank} );
     people.push(newPerson);
     nameToAccountNumber[_name] = _accountNumber;
   }
 
}


//0xd9145CCE52D386f254917e481eB44e9943F39138
 