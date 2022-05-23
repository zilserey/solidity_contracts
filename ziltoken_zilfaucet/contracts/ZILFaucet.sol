pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol';


// A faucet for ERC20 token ZIL
contract ZILFaucet {


  StandardToken public ZILToken;
  address public ZILOwner;


  // ZILFaucet constructor, provide the address of ZILToken contract and
  // the owner address we will be approved to transferFrom
  constructor(address _ZILToken, address _ZILOwner) public {

    // Initialize the ZILToken from the address provided
    ZILToken = StandardToken(_ZILToken);
    ZILOwner = _ZILOwner;

  }


  function withdraw(uint withdraw_amount) public {

    // Limit withdrawal amount to 10 ZIL
    require(withdraw_amount <= 1000);

    ZILToken.transferFrom(ZILOwner, msg.sender, withdraw_amount);

  }


  // REJECT any incoming ether
  function () public payable { revert(); }


}


















