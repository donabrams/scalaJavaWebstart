var express = require("express");

var app = express();

app.use(function(req, res, next) {
	console.log("requesting " + req.path);
	next();
});

app.get("/test.jnlp", function(req,res) {
	res.set('Content-Type', 'application/x-java-jnlp-file');
	res.sendfile(__dirname + '/scalaWebstart.jnlp');
});
app.get("/", function(req,res) {
	res.set('Content-Type', 'text/html');
	res.sendfile(__dirname + '/index.html');
});
app.use(express.static(__dirname));
app.listen(8080);

console.log("server started");