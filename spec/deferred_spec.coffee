{ipso} = require 'ipso'

describe 'Deferred', -> 


    it 'returns the provided function decorated to return a promise when called', 

        ipso (Deferred) -> 

            fn = Deferred ->
            fn().then.should.be.an.instanceof Function


    it 'passes the promise handle into the function at arg 1', 

        ipso (facto, Deferred) -> 

            fn = Deferred (handle) -> 

                handle.resolve.should.be.an.instanceof Function
                handle.reject.should.be.an.instanceof Function
                handle.notify.should.be.an.instanceof Function
                facto()

            fn()



    it 'preserves further args into position2 and onward', 

        ipso (facto, Deferred) -> 

            fn = Deferred (handle, arg1, arg2) ->

                arg1.should.equal 1
                arg2.should.equal 2
                facto()

            fn 1, 2



    xit 'returns before the function call', 

        ipso (facto, Deferred) -> 

            order = []
            fn = Deferred (handle) -> order.push 2
            fn()
            order.push 1

            order.should.eql [1, 2]

                #
                # it does not, this could create unexpectednesses
                # 

