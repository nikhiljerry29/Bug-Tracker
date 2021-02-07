const express = require('express')
const router = express.Router()
const Projects = require('../models/Project')
const ProductLogs = require("../models/ProductLogs")
const username = require("../exports/username")
const User = require('../models/User')
const dashboardData = require("../exports/dashboardDataDisplay")

function dashboardDataAndDetails(viewPage, foundLogs, req, res) {
    User.findAll({
            attributes: ['id', 'first_name', 'last_name']
        })
        .then((foundUsers) => {
            const everyUsersNameArray = ["Initial"]
            foundUsers.forEach(user => {
                everyUsersNameArray.push(username(user))
            })
            res.render(viewPage, {
                dashboardProjectsData: foundLogs,
                date: require("../exports/date"),
                everyUsersName: everyUsersNameArray,
                username: username(req.user)
            })
        })
}

router.get('/', (req, res) => {
    Projects.findAll()
        .then((foundLogs) => {
            dashboardDataAndDetails('dashboardProjects', foundLogs, req, res)
        })
        .catch((err) => console.log(err));
})

router.get("/PR:project_id", (req, res) => {
    const id = req.params.project_id
    Projects.findOne({
            where: {
                id
            }
        })
        .then((foundLogs) => {
            dashboardDataAndDetails('projectDetails', foundLogs, req, res)
        })
        .catch((err) => console.log(err));
})

function isProjectIdPresent (id) {
    return Projects.count({ where: { id } })
      .then(count => {
        if (count != 0) {
          return false;
        }
        return true;
    });
}

router.get("/PR:project_id/all_issues", (req, res) => {
    const project_id = req.params.project_id
    ProductLogs.findAll({
        where: {
            project_id
        }
    })
		.then((foundLogs) => {
            if (foundLogs.length === 0) {
                if (isProjectIdPresent(project_id)) {
                    dashboardData(foundLogs, req, res)
                }
				req.flash("error_msg", "No such Project ID is present.")
				res.redirect("/dashboard")
			}
            dashboardData(foundLogs, req, res)
		})
		.catch((err) => console.log(err))
})

module.exports = router