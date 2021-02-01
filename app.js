require('dotenv').config()
const express = require("express")
const app = express()
const bodyParser = require("body-parser")

app.set("view engine", "ejs")
app.use(bodyParser.urlencoded({extended: true}))
app.use(express.static("public"))

const date = require("./exports/date.js")

const connection = require("./config/database")

connection.connect();

app.get("/", (req, res) => {
	res.redirect("/home")
})

app.get("/home", (req, res) => {
	res.render("home");
})

app.get("/login", (req, res) => {
	res.render("authentication/login");
})

app.get("/dashboard", (req, res) => {
	connection.query('SELECT * FROM PRODUCT_LOGS', function (error, results, fields) {
		if (error) throw error;
		res.render("dashboardAdmin", {
			username : "Username",
			dashboardAdminData : results,
			date : date
		})
	})	
})

const port = process.env.PORT || 8080
app.listen(port, function() {
	console.log(`Server started on port :: ${port}`)
})
