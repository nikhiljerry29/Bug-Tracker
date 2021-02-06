const express = require('express')
const router = express.Router()
const { ensureAuthenticated } = require('../config/auth')

router.get('/', (req, res) => {
	if(req.isAuthenticated())
		res.redirect("/dashboard")
	else
		res.redirect("/home")
})

router.get('/home', (req, res) => {
	res.render("home")
})

router.use('/dashboard', ensureAuthenticated, require('./dashboard'))
// router.use('/dashboard', require('./dashboard'))

module.exports = router