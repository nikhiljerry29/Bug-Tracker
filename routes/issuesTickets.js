const express = require("express")
const router = express.Router()
const ProductLogs = require("../models/ProductLogs")
const Project = require("../models/Project")
const username = require("../exports/username")

function issueTicketData(foundLogs, req, res, isStatusUpdated = false) {
	res.render("issueDetails", {
		date: require("../exports/date"),
		issueDetails: foundLogs,
		username: username(req.user),
		isStatusUpdated: isStatusUpdated,
	})
}
router.get("/", (req, res) => {
	res.redirect("/dashboard")
})

router.get("/create-new", (req, res) => {
	Project.findAll()
		.then(foundLogs => res.render("newIssuePage", {
			username: username(req.user),
			projects: foundLogs
		}))
		.catch(err => console.log(err))
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



router.get("/update:issue_id", (req, res) => {
	const id = req.params.issue_id
	ProductLogs.findOne({
			where: {
				id
			}
		})
		.then((foundLogs) => {
			issueTicketData(foundLogs, req, res, true)
		})
		.catch((err) => console.log(err))
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

router.post("/:issue_id", (req, res) => {
	const id = req.params.issue_id
	const {
		status
	} = req.body;
	console.log(status);
	ProductLogs.update({
		status
	}, {
		where: {
			id
		}
	}).catch(err => console.log(err))

	if (status === "Closed") {
		ProductLogs.update({
			closedOn : new Date().toLocaleString()
		}, {
			where: {
				id
			}
		}).catch(err => console.log(err))
	} else if (status === "Opened") {
		ProductLogs.update({
			closedOn : null
		}, {
			where: {
				id
			}
		}).catch(err => console.log(err))
	}


	req.flash('success_msg', `You have successfully changed the status of BG${id} to ${status}.`)
	res.header('Cache-Control', 'no-cache, private, no-store, must-revalidate, max-stale=0, post-check=0, pre-check=0');
	res.redirect("/dashboard")
})

module.exports = router