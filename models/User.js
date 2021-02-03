const { Sequelize } = require('sequelize')

const db = require('../config/database')

const User = db.define('user_details', {
	first_name : {
		type: Sequelize.STRING,
		required: true
	},
	last_name : {
		type: Sequelize.STRING,
		required: true
	},
	email_address : {
		type: Sequelize.STRING,
		required: true
	},
	user_password : {
		type: Sequelize.STRING,
		required: true
	}
})

module.exports = User