const User = require('../models/User')
const _ = require("lodash")

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
        console.log(everyUsersNameArray);
        module.exports = everyUsersNameArray
    })