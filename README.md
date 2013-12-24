`npm install decor` 0.0.1 <br />
`component install nomilous/decor` 0.0.1 <br />

decor
=====

assorted function decorators


### `decor.deferred(fn)`

* Decorates a function to be promisable
* Injects as **a new first argument** the promise handler (`action`)
* action. `resolve()`, `reject()` and `notify()` as usual from within
* calling the decorated function returns the promise, availing `.then` to the caller
* using [q](https://github.com/kriskowal/q) for the promising

```coffee

{deferred} = require 'decor'

promisingFunction = deferred (action, arg1, argN) -> 
    
    doSomethingAsync arg1, (err, res) -> 

        # action.notify('50% complete')
        return action.reject err if err?
        return action.resolve res


promisingFunction( 'arg1' ).then -> # as usual

#
# or, more fully
#

promisingFunction( 'arg1' ).then(

    (result) -> 
    (error)  -> 
    (notify) -> 

)

```

#### Before and After

**Before**

```coffee

{defer} = require 'q'

fn = (arg1) ->

    deferral = defer()

    doSomethingAsync arg1, (err, res) -> 
        
       deferral.resolve res

    return deferral.promise

fn('arg1').then ...

```

**After**

```coffee

{deferred} = require 'decor'

fn = deferred ({resolve, reject}, arg1) -> 
    
    doSomethingAsync arg1, (err, res) -> 

        resolve res

fn('arg1').then ...

```



### Dev

```
# sudo npm install ipso-cli -g
ipso -m

```
