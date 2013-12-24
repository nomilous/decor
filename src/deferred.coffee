Q = require 'q'

module.exports = (fn) -> (args...) ->

    deferral = Q.defer()

    args.unshift deferral

    fn.apply @, args

    return deferral.promise
