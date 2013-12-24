Q = require 'q'

module.exports = (fn) -> (args...) ->

    deferral = Q.defer()

    args.unshift deferral

    #
    # * To keep the flow clean this should probably setTimeout/nextTick the 
    #   fn call so that the promise is returned before the function using it 
    #   is run.
    #
    # * Not doing so tho, (or not yet), the fewer handles in the scheduler 
    #   the better.
    # 
    #   see test: 'Deferred returns before the function call'
    # 
    # * Q should still carry the resolution / rejection into .then(), even 
    #   if the resolve comes first.
    # 

    fn.apply @, args

    return deferral.promise
