{ipso} = require 'ipso'

describe 'Decor', -> 

    it 'exports deferred', 

        ipso (Decor, Deferred) -> 

            Decor.deferred.should.equal Deferred

    it 'exports q as Q', 

        ipso (Decor) -> 

            Decor.Q.should.equal require 'q'

    xit 'exports do', 

        ipso (Decor, Do) -> 

            Decor.do.should.equal Do


    context 'examples', -> 

        it 'can quickly array asyncs into parallel', 

            ipso (facto, Decor, should) -> 

                # {Q, deferred} = require 'decor'
                {Q, deferred} = Decor


                fourth = deferred ({resolve}) -> resolve 'result4'
                fifth  = deferred ({resolve}) -> resolve 'result5'


                Q.all([

                    do deferred ({resolve}) -> 

                        setTimeout (-> 

                            # console.log 'result1'
                            resolve('result1')

                        ), 100

                    do deferred ({resolve}) -> 

                        setTimeout (->

                            # console.log 'result2'
                            resolve('result2')

                        ), 20 # this one's quicker

                    
                    do deferred ({resolve}) -> resolve()

                    do fourth

                    fifth()

                ]).spread (one, two, three, four, five) -> 

                    one.should.equal 'result1'
                    two.should.equal 'result2'
                    should.not.exist three
                    four.should.equal 'result4'
                    five.should.equal 'result5'
                    facto()

