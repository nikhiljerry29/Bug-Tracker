const _ = require("lodash")
module.exports = function (user) {
    return _.capitalize(user.first_name) +
        " " +
        _.capitalize(user.last_name)
}