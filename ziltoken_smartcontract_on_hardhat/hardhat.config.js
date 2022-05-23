/**
 * @type import('hardhat/config').HardhatUserConfig
 */

require('@nomiclabs/hardhat-waffle')

const INFURA_URL = 'https://rinkeby.infura.io/v3/e0ce5fc98f4c4a568f688b316c7f825d';
const PRIVATE_KEY = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx';

module.exports = {
  solidity: "0.8.0",
  networks: {
    rinkeby: {
      url: INFURA_URL,
      accounts: [`0x${PRIVATE_KEY}`]
    }
  }
};

