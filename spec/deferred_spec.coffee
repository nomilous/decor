{ipso} = require 'ipso'

describe 'Deferred', -> 



    it 'returns a promise when called', 

        ipso (Deferred, should) -> 

            fn = Deferred ->
            should.exist fn().then
            fn().then.should.be.an.instanceof Function