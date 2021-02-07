const express = require("express")
const _ = require("lodash")

module.exports = function (foundLogs, req, res, viewPage = "dashboardAdmin") {
	res.render(viewPage, {
		date: require("../exports/date"),
		dashboardAdminData: foundLogs,
		username: _.capitalize(req.user.first_name) +
			" " +
			_.capitalize(req.user.last_name),
	})
}