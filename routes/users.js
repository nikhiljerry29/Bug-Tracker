const express = require('express')
const router = express.Router()
const User = require('../models/User')
const bcrypt = require('bcryptjs')
const passport = require('passport')

router.get('/login', (req, res) => {
	if(req.isAuthenticated()){
		req.flash('success_msg', `You are already logged In as ${req.user.email_address}!!`)
		res.redirect("/dashboard")
	}
	else
		res.render("login")
})

router.get('/register', (req, res) => {
	if(req.isAuthenticated()){
		req.flash('success_msg', `You are logged out from previous session`)
		req.logout()
	}
	res.render('register')
})

router.get('/logout', (req, res) => {
	req.logout()
	req.flash('success_msg', 'You are logged out !!')
	res.redirect('/users/login')
})

router.post('/login', (req, res, next) =>{
	passport.authenticate('local', {
		successRedirect: '/dashboard',
		failureRedirect: '/users/login',
		failureFlash: true
	})(req, res, next);
})

router.post('/register', (req, res) => {
	let errorMsg = []
	const { first_name, last_name, email_address, user_password } = req.body;
	User.findOne({ where: { email_address } }).then(foundUser => {
		if(foundUser) {
			errorMsg.push({ existingUserMsg: "Email is already registered!!"})
			console.log('Email is already registered!!')
			res.render('register', {errorMsg})
		}
		else {
			bcrypt.genSalt(Number(process.env.SALTROUNDS), (err, salt) => {
				bcrypt.hash(user_password, salt, (err, hash) => {
					User.create({
						first_name,
						last_name,
						email_address,
						user_password : hash
					})
					.then(user => {
						req.flash('success_msg', 'You are now registered and can login!')
						res.redirect('/users/login')
					})
					.catch(err => console.log(err))
				})
			})
		}
	})
})

module.exports = router