Q = require 'q'

module.exports = (fn) -> ->

    deferral = Q.defer()

    fn.apply @, arguments

    return deferral.promise
