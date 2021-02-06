const express = require("express")
const router = express.Router()
const _ = require("lodash")
const ProductLogs = require("../models/ProductLogs")

function dashboardData(foundLogs, req, res) {
	res.render("dashboardAdmin", {
		date: require("../exports/date"),
		dashboardAdminData: foundLogs,
		username: _.capitalize(req.user.first_name) +
			" " +
			_.capitalize(req.user.last_name),
	})
}

router.get("/", (req, res) => {
	ProductLogs.findAll()
		.then((foundLogs) => {
			dashboardData(foundLogs, req, res)
		})
		.catch((err) => console.log(err))
})

router.get("/search", (req, res) => {
	res.redirect("/dashboard")
})

router.post("/search", (req, res) => {
	if (req.body.ticketSearchId === "") {
		req.flash("error_msg", "Please Enter Valid Ticket ID.")
		res.redirect("/dashboard")
	}

	const ticketID = req.body.ticketSearchId.toUpperCase()
	const id = Number(ticketID.substring(2, ticketID.length))
	ProductLogs.findAll({
			where: {
				id
			}
		})
		.then((foundLogs) => {
			if (foundLogs.length === 0) {
				req.flash("error_msg", "No Such Ticket ID is present.")
				res.redirect("/dashboard")
			}
			dashboardData(foundLogs, req, res)
		})
		.catch((err) => console.log(err))
})

router.use('/projects', require('./projects'))
router.use('/BG', require('./issuesTickets'))

module.exports = router