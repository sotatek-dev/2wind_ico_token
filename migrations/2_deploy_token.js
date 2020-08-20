require('dotenv').config();

const WindsCoinToken = artifacts.require('WindsCoinToken');

const Web3 = require('web3');

const web3 = new Web3();
let privateKey = process.env.PRIVATE_KEY || '';

if (!privateKey.startsWith('0x')) {
  privateKey = `0x${privateKey}`;
}

const account = web3.eth.accounts.privateKeyToAccount(privateKey);

module.exports = function (deployer) {
  deployer.deploy(WindsCoinToken, account.address);
};
// latest contract address
// 0x196d179Bf5318A1095Ee47354D86c9F7d1B0e770

