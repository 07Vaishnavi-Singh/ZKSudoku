require("@nomicfoundation/hardhat-toolbox");
require("@nomiclabs/hardhat-ethers")
require("dotenv").config({ path: ".env" });

const QUICKNODE_HTTP_URL = "";
const PRIVATE_KEY = "";

module.exports = {
  solidity: "0.8.4",
  networks: {
    hardhat: {
      // Other configurations...
    },
    localhost: {
      url: "http://localhost:8545",
    },
    // Other networks...
  },
  };