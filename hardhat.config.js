/**
 * @type import('hardhat/config').HardhatUserConfig
 */

require("dotenv").config();
require("@nomiclabs/hardhat-ethers");

const { PRIVATE_KEY } = process.env;

module.exports = {
  solidity: "0.8.11",
  defaultNetwork: "ganache",
  networks: {
    hardhat: {},
    ganache: {
      url: "http://127.0.0.1:7545",
      accounts: [
        "0x04ae9ad9c2b02f8b547de550fd4a8ddb7b6b6148b368864f71495463fbe57b32",
      ],
      gas: 2100000,
      gasPrice: 8000000000,
    },
  },
};
