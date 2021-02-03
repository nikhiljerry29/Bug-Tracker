const { Sequelize } = require('sequelize');
module.exports = new Sequelize(process.env.MYSQLURI)