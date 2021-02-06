const {
    Sequelize
} = require('sequelize')

const db = require('../config/database')

const Project = db.define('projects', {
    project_name: {
        type: Sequelize.STRING
    },
    project_description: {
        type: Sequelize.STRING
    },
    manager_id: {
        type: Sequelize.INTEGER
    },
    developer_id: {
        type: Sequelize.INTEGER
    },
    tester_id: {
        type: Sequelize.INTEGER
    },
})

module.exports = Project