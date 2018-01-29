const path = require('path');
const fs = require('fs');
const solc = require('solc');

const lotteryContractPath = path.resolve(__dirname, 'contracts', 'lottery.sol');
const source = fs.readFileSync(lotteryContractPath, 'utf8');

module.exports = solc.compile(source, 1).contracts[':Lottery'];