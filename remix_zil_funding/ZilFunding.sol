// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;


// here we actually import from the @chainlink/contracts npm package
// https://www.npmjs.com/package/@chainlink/contracts
// https://github.com/smartcontractkit/chainlink.git
// https://github.com/smartcontractkit/chainlink/blob/develop/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol

// the ABI tells solidity and other programming languages
// how it can interact with another contract

// Anytime you want to interact with an already deployed smart contract
// you will need that contract's ABI

// an Interface compiles down to an ABI

// and you always need an ABI to interact with a Contract

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";


contract ZilFunding {

    mapping(address => uint256) public addressToAmountFunded;

    //accept some type of payment
    function fund() public payable {
        addressToAmountFunded[msg.sender] += msg.value;
        // what the ETH -> USD conversion rate is?
        // this is where Oracles come in
        // we need a blockchain oracle

    }

    // 1 Wei = 10**-9 Gwei
    // 1 Wei = 10**-18 Eth

    // chainlink - modular decentralized oracle infrastructure, oracle network
    // the allows us to get data, and do external computation in a highly
    // civil resistant decentralized way

    // chainlink popular feature - data feeds or price feeds
    // data.chain.link
    // a whole number of different decentralized oracles that are returning data 
    // for different price feeds
    // decentralized network bring this data on chain and have it as a
    // reference point of definitive truth

    // these price feeds are being used by some of the top protocols in DeFi ecosystem
    // Synthetix, SushiSwap, Set Protocol, AAVE

    // docs.chain.link/docs/make-a-http-get-request/
    // docs.chain.link/docs/get-the-latest-price/
    // docs.chain.link/docs/link-token-contracts/
    // docs.chain.link/docs/ethereum-addresses/

    function getVersion() public view returns (uint256) {

        // here put the address of where this contract is located on the Rinkeby chain
        // https://docs.chain.link/docs/ethereum-addresses/#Rinkeby%20Testnet
        // ETH / USD 	0x8A753747A1Fa494EC906cE90E9f37563A8AF630e

        // The Rinkeby chain has this address so we need to deploy this contract
        // onto the Rinkeby testnet
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }

    // should return the latest price of Ethereum in terms of USD
    function getPrice() public view returns(uint256) {

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);

        // tuple used here
        (,int256 answer,,,) = priceFeed.latestRoundData();

        // typecasting used here
        return uint256(answer * 10000000000);

        // 1 ETH = 276506595448 => 2,765.06595448 USD
    }

    // 1 Wei = 10**-9 Gwei
    // 1 Wei = 10**-18 Eth

    // 1 gwei = 10**10 = 10000000000 
    // 2,779.8851063800000000000000000000


     // 1000000000
    function getConversionRate(uint256 ethAmount) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;   // 10**18
        return ethAmountInUsd;
    }
 
}
