module.exports =  (fn) -> -> 

    ### do ###
    test = 1
    do (test) -> console.log test 
    ### do ###
    
    fn.call @, arguments
