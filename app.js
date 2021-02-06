require('dotenv').config()
const express = require('express')
const expressLayouts = require('express-ejs-layouts')
const flash = require('connect-flash')
const session = require('express-session')

const passport = require('passport')
require('./config/passport')(passport)

// MySQL Conncetion
const db = require('./config/database')
db.authenticate()
.then(() => console.log('Database Connected'))
.catch(err => console.log('Error :: ' + err))

// Express & View Engines
const app = express()
app.use(expressLayouts)
app.set("view engine", "ejs")
app.use(express.urlencoded({extended: true}))
app.use(express.static("public"))

// Express Session
app.use(session({
  secret: process.env.SECRET,
  resave: true,
  saveUninitialized: true,
}))

// passport middleware
app.use(passport.initialize());
app.use(passport.session());

app.use(flash());

// Global Vars
app.use((req, res, next) => {
	res.locals.success_msg = req.flash('success_msg')
	res.locals.error_msg = req.flash('error_msg')
	res.locals.error = req.flash('error')
	next()
})


// Routes
app.use('/', require('./routes/index'))
app.use('/users', require('./routes/users'))

app.get('/test', (req, res) => {
	// res.render("details", {
	// 	username : "Username"
	// })
})


const port = 8080
app.listen(8080, () => {
	console.log("Server Started on port :: " + port)
})