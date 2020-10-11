/**
 * Responds to any HTTP request.
 *
 * @param {!express:Request} req HTTP request context.
 * @param {!express:Response} res HTTP response context.
 */

const dns = require('dns');

function helloWorld(req, res) {
  dns.lookup('samos-it.com', (err, address, family) => {
    console.log('address: %j family: IPv%s', address, family);
    res.status(200).send("samos-it.com address: " + address);
  });
}

module.exports = { helloWorld }
