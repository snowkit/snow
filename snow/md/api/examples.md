
> snow.api.Promise.new

```
new Promise(function(resolve, reject) {
    var value = get_value();
    if(value != null) {
        resolve(value);
    } else {
        reject(Error(...));
    }
});
```
> snow.api.Promise.then

```
var load = promise_returning_function();

load.then(function(value:Type) {
    //use value
}).error(function(error:Error) {
    //use error
});
```
