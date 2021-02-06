const express = require("express")
const router = express.Router()
const _ = require("lodash")
const ProductLogs = require("../models/ProductLogs")

function issueTicketData(foundLogs, req, res) {
	res.render("issueDetails", {
		date: require("../exports/date"),
		issueDetails: foundLogs,
		username: _.capitalize(req.user.first_name) +
			" " +
			_.capitalize(req.user.last_name),
	})
}
router.get("/", (req, res) => {
    res.redirect("/dashboard")
})

router.get("/:issue_id", (req, res) => {
    const id = req.params.issue_id
	ProductLogs.findOne({
        where: {
            id
        }
    })
		.then((foundLogs) => {
			issueTicketData(foundLogs, req, res)
		})
		.catch((err) => console.log(err))
})

module.exports = router