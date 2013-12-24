`npm install decor` 0.0.2 <br />
`component install nomilous/decor` 0.0.2 <br />

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

### `decor.Q` 

* onward export of [q](https://github.com/kriskowal/q)
* so that it doesn't need to be installed twice by npm



Dev / Test
----------

```
# sudo npm install ipso-cli -g
npm install
ipso -m

```
