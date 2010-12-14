// Modified from Node.JS documentation: http://nodejs.org/docs/v0.2.5/api.html#http-client-183

var http = require('http');
var server = http.createClient(8124, '127.0.0.1');
var request = server.request('GET', '/', {'host': '127.0.0.1'});
request.end();
request.on('response', function (response) {
  console.log('STATUS: ' + response.statusCode);
  console.log('HEADERS: ' + JSON.stringify(response.headers));
  response.setEncoding('utf8');
  response.on('data', function (chunk) {
    console.log('BODY: ' + chunk);
  });
});