// compile code will go here
const path = require('path');
const fs = require('fs');
const { SSL_OP_CIPHER_SERVER_PREFERENCE } = require('constants');

const inboxPath = path.resolve(__dirname, 'contracts', 'Inbox.sol');
const source = fs.readFileSync(inboxPath, 'utf8');

console.log(solc.compile(source, 1));
