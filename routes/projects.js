const express = require('express')
const router = express.Router()
const Projects = require('../models/Project')
const _ = require("lodash");
const User = require('../models/User')


function dashboardDataAndDetails(viewPage, foundLogs, req, res) {
    User.findAll({
            attributes: ['id', 'first_name', 'last_name']
        })
        .then((foundUsers) => {
            const everyUsersNameArray = ["Initial"]
            foundUsers.forEach(user => {
                everyUsersNameArray.push(_.capitalize(user.first_name) +
                    " " +
                    _.capitalize(user.last_name))
            })
            res.render(viewPage, {
                dashboardProjectsData: foundLogs,
                date: require("../exports/date"),
                everyUsersName: everyUsersNameArray,
                username: _.capitalize(req.user.first_name) +
                    " " +
                    _.capitalize(req.user.last_name)
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


module.exports = router