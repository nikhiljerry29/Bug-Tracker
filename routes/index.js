const express = require('express')
const router = express.Router()
const { ensureAuthenticated } = require('../config/auth')
const _ = require('lodash');
const ProductLogs = require('../models/ProductLogs')

router.get('/', (req, res) => {
	if(req.isAuthenticated())
		res.redirect("/dashboard")
	else
		res.redirect("/home")
})

router.get('/home', (req, res) => {
	res.render("home")
})


router.get('/dashboard', ensureAuthenticated ,(req, res) => {
	ProductLogs.findAll()
	.then(foundLogs => {
		res.render("dashboardAdmin", {
			date : require('../exports/date'),
			dashboardAdminData : foundLogs,
			username : _.capitalize(req.user.first_name) + " " + _.capitalize(req.user.last_name)
		})
	})
	.catch(err => console.log(err))
})

module.exports = router