// load the http module
var http = require('http');
var port = process.env.PORT || 8000;

// configure our HTTP server
var server = http.createServer(function (request, response) {
  response.writeHead(200, {"Content-Type": "text/plain"});
  response.end("Hello getintodevops.com\n");
});

// listen on localhost:8000
server.listen(port, '0.0.0.0', () => {
  console.log(`Server running on port ${port}`);
});