const express = require("express")
const router = express.Router()
const ProductLogs = require("../models/ProductLogs")
const dashboardData = require("../exports/dashboardDataDisplay")

router.get("/", (req, res) => {
	ProductLogs.findAll({
			order: [
				['status', 'DESC'],
				['createdAt', 'DESC']
			]
		})
		.then((foundLogs) => {
			dashboardData(foundLogs, req, res)
		})
		.catch((err) => console.log(err))
})

router.get("/search", (req, res) => {
	res.redirect("/dashboard")
})

router.post("/search", (req, res) => {
	const ticketID = req.body.ticketSearchId.toUpperCase()
	const idCharValue = ticketID.substring(0, 2)
	const id = Number(ticketID.substring(2, ticketID.length))

	if (ticketID === "" || (idCharValue !== 'PR' && idCharValue !== 'BG')) {
		req.flash("error_msg", "Please Enter Valid Ticket ID.")
		res.redirect("/dashboard")
	}

	if (idCharValue === 'PR')
		res.redirect(`/dashboard/projects/PR${id}/all_issues`)

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