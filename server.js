var express = require('express'),
  fs = require('fs'),
  url = require('url'),
  app = express();

app.get('*', function (req, res) {
  res.sendfile(__dirname + '/www/' + req.url);
});

app.listen(3000);

console.log('Server running at http://127.0.0.1:3000/');