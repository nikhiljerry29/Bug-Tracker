const {
	Sequelize
} = require('sequelize')

const db = require('../config/database')

const ProductLog = db.define('product_logs', {
	status: {
		type: Sequelize.STRING,
		required: true
	},
	project_id: {
		type: Sequelize.STRING,
		required: true
	},
	issue_name: {
		type: Sequelize.STRING,
		required: true
	},
	issue_description: {
		type: Sequelize.STRING,
		required: true
	},
	priority: {
		type: Sequelize.STRING,
		required: true
	},
	closedOn: {
		type: Sequelize.DATE,
		required: false
	}
})

module.exports = ProductLog