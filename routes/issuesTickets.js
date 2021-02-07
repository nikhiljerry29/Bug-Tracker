const express = require("express")
const router = express.Router()
const ProductLogs = require("../models/ProductLogs")
const username = require("../exports/username")

function issueTicketData(foundLogs, req, res) {
	res.render("issueDetails", {
		date: require("../exports/date"),
		issueDetails: foundLogs,
		username: username(req.user),
	})
}
router.get("/", (req, res) => {
	res.redirect("/dashboard")
})

router.get("/create-new", (req, res) => {
	res.render("newIssuePage", {
		username: username(req.user)
	})
})

router.post("/create-new", (req, res) => {
	const {
		issue_name,
		project_id,
		priority,
		issue_description
	} = req.body;
	ProductLogs.create({
			issue_name,
			issue_description,
			project_id,
			priority
		}).then(newIssue => {
			req.flash('success_msg', `You have successfully added new issue BG${newIssue.id}!!`)
			res.redirect('/users/login')
		})
		.catch(err => console.log(err))
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