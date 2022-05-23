pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol';


contract ZILToken is StandardToken {

  string public constant name = 'ZIL Token';
  string public constant symbol = 'ZIL';
  uint8 public constant decimals = 2;
  uint constant _initial_supply = 2100000000;


  constructor() public {

    totalSupply_ = _initial_supply;
    balances[msg.sender] = _initial_supply;
    emit Transfer(address(0), msg.sender, _initial_supply);

  }

}
