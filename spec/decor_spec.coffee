{ipso} = require 'ipso'

describe 'Decor', -> 

    it 'exports deferred', 

        ipso (Decor, Deferred) -> 

            Decor.deferred.should.equal Deferred
