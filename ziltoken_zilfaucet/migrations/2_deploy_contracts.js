var ZILToken = artifacts.require("ZILToken");
var ZILFaucet = artifacts.require("ZILFaucet");
var owner = web3.eth.accounts[0];

module.exports = function(deployer) {
  
  deployer.deploy(ZILToken, {from: owner}).then(function() {

    return deployer.deploy(ZILFaucet, ZILToken.address, owner);

  });

};
