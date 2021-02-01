const mysql = require('mysql');
module.exports = mysql.createConnection({
	host     : 'localhost',
	user     : process.env.USER,
	password : process.env.PASSWORD,
	database : process.env.DATABASE
});
