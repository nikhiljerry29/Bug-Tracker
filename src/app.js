require('dotenv').config()
const express = require("express")
const app = express()
const bodyParser = require("body-parser")
const { Sequelize, DataTypes, QueryTypes } = require('sequelize')

app.set("view engine", "ejs")
app.use(bodyParser.urlencoded({extended: true}))
app.use(express.static("public"))

const date = require(__dirname + "/date.js")

const sequelize = new Sequelize(process.env.DATABASE, process.env.USER, process.env.PASSWORD, {
	host: 'localhost',
	dialect: 'mysql'
})

sequelize.authenticate()
.then(() => console.log('Database Connected ...'))
.catch(err => console.log(`Error : ${err}`))

const ProductLog = sequelize.define('PRODUCT_LOGS', {
	tickets: {
		type: DataTypes.STRING,
		allowNull: false
	},
	status: {
		type: DataTypes.STRING
	},
	project_id: {
		type: DataTypes.STRING
	},
	priority: {
		type: DataTypes.STRING
	},
	opened_on: {
		type: DataTypes.DATEONLY
	},
	closed_on: {
		type: DataTypes.DATEONLY
	}
})


let data = []

app.get("/", function(req, res){
	const productLogs = sequelize.query("SELECT * FROM `product_logs`", { type: QueryTypes.SELECT });
	console.log("All productLogs:", productLogs);

	res.render("dashboardAdmin", {
		dashboardAdminData : data,
		date : date
	})
})

const port = process.env.PORT || 8080
app.listen(port, function() {
	console.log(`Server started on port :: ${port}`)
})
