const express = require("express");
const bodyParser = require("body-parser");

const app = express();
let data = require(__dirname + "/data");

app.set("view engine", "ejs");

app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static("public"));

app.get("/", function(req, res){
	res.render("dashboardAdmin", {
		dashboardAdminData : data.dashboardData
	});
});

const port = 8080;
app.listen(port, function() {
	console.log('Server started on port :: ' + port);
	console.log('localhost:' + port);
});
