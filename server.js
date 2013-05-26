var express = require('express'),
  app = express();

app.get('*', function (req, res) {
  res.sendfile('www' + req.url);
});

var port = process.env.PORT || 3000;
app.listen(port, function() {
  console.log('Server running at' + port);
});
