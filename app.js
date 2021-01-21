const express = require("express");
const app = express();
app.use(express.static("public"));

const bodyParser = require("body-parser");
app.use(bodyParser.urlencoded({extended: true}));

const date = require(__dirname + "/date.js");
const sqlConnection = require(__dirname + "/sqlConnection.js");


const mysql = require("mysql");
let connection = mysql.createConnection(sqlConnection.credentialDetails)

connection.connect();

let data = [];

connection.query('SELECT * FROM PRODUCT_LOG', function (error, results, fields) {
	if (error) throw error;
	data = results;
});

connection.end();

app.set("view engine", "ejs");

app.get("/", function(req, res){
	res.render("dashboardAdmin", {
		dashboardAdminData : data,
		date : date
	});
});

const port = 8080;
app.listen(port, function() {
	console.log('Server started on port :: ' + port);
	console.log('localhost:' + port);
});
