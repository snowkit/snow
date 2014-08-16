[![Logo]({{{rel_path}}}images/logo.png)]({{{rel_path}}}index.html#guide)

---

##Code design

Code is designed for portability, maintainability and clarity.   
Naming should be clear and concise, not overly verbose.   




##Code conventions

General conventions to follow.

- **code is for humans ONLY.** write it that way.
- **always** always use braces. no exceptions.
- egyption style braces (same line open, close inline)
- closing brace comments when size of scope is more than a few lines
- closing brace comments on functions, classes, typedefs etc (as, these grow)
- single line code is not good. use multiple lines, they are free.
- try to comment WHY not what, code should be self describing
- always descriptive names, a, b, c are not names.

```
function example() {

        //bad. no braces, single line code.
    if(true) return;

        //good
    if(true) {
        return;
    }

} //example
```
---

####Classes

- public variables always first
- after public variables, group properties together
- private variables next
- methods - constructor/init first, then destroy/cleanup
- methods - public facing api higher up
- methods - internal api next
- methods - private/internal/utility functions last

class format guidelines

- two lines gap
    - between imports and package
    - between imports and class declaration
    - between class declaration and member declaration
    - between member declaration and functions
    - between last function and close brace
- one line gap at the end of the file



```
package example;


import things;
import more;


class Example {


    public var one : Int;
    public var two : Bool;

    public var property (get,set) : String;

    var three : String;


    public function new() {

    } //new

    public function destroy() {

    } //destroy

    function internal() {

    } //internal


} //Example

```

---

##Back

[To the guide]({{{rel_path}}}index.html#guide)

<br/><br/><br/>
<br/><br/><br/>