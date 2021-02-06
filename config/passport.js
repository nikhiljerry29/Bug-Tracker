const LocalStrategy = require('passport-local').Strategy
const bcrypt = require('bcryptjs')
const User = require('../models/User')

module.exports = (passport) => {
	passport.use (
		new LocalStrategy({ usernameField: 'email_address', passwordField: 'user_password' }, (email_address, user_password, done) => {
			User.findOne({ where: { email_address } })
			.then(user => {
				if(!user) {
					return done(null, false, { message: 'That email is not registered'})
				}

				bcrypt.compare(user_password, user.user_password, (err, foundUser)=> {
					if (err) throw err
						if (foundUser)
							return done(null, user)
						else
							return done(null, false, { message: 'Password incorrect'})
					})
			})
			.catch(err => console.log(err))
		})
		)
	
	passport.serializeUser(function(user, done) {
		done(null, user.get('id'));
	});

	passport.deserializeUser(function(id, done) {
		User.findByPk(id).then(function(user) {
			done(null, user);
		}).catch(function(err) {
			if (err) {
				throw err;
			}
		});
	});
}