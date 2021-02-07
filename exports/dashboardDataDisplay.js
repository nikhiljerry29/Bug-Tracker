const express = require("express")
const username = require("./username")

module.exports = function (foundLogs, req, res, viewPage = "dashboardAdmin") {
	res.render(viewPage, {
		date: require("../exports/date"),
		dashboardAdminData: foundLogs,
		username: username(req.user)
	})
}