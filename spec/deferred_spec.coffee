{ipso} = require 'ipso'

describe 'Deferred', -> 

    it 'decorates the function', 

        ipso (Deferred) -> 

            fn = Deferred (arg) -> "returned #{arg}"
            fn('ARG1').should.equal 'returned ARG1'

