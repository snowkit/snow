[![Logo]({{{rel_path}}}images/logo.png)]({{{rel_path}}}index.html#guide)

---

##Utils

The utilities folder is for features that don't quite fit elsewhere in the framework, and often map to platform specific bindings.

This guide will give a brief overview of the more public facing utilities as there are many and may seem overwhelming.   
A good amount of these utilities were originally sourced from [nme](http://github.com/haxenme/nme) and [lime](http://github.com/openfl/lime), but have since been refactored, fixed up and tests written for the classes in question.

In all cases, the API docs will elaborate their features, and the tests/unit/ folder in snow has the use cases and test cases for the code.

### Timer

This is a simple timer class for repeating or single fire callbacks on a timer.

### Libs

The libs class is for loading native functions out of hxcpp build "ndll" files.

### Abstract Class

From [Andy Li](http://www.onthewings.net/), it's described as : 

> Old school abstract class.   
> Classes that implement it, and their sub-classes, will be able to declare abstract methods (methods that without body).
> There will be a check in compile-time such that no public constructor is allowed without all abstract methods implemented.

###Typed arrays

These [arrays](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Typed_arrays) are a flexible and useful set of arrays for use with bytes and data. They are used to map bytes from your application to the rendering pipeline or GPU for example, as they implement some interfaces that make this simpler for everything.

It's important to note that as these arrays leverage the haxe types, it is possible that the exact sizes and memory use may differ to their original spec, but the implementation and usage matches spec in full.

The following typed arrays are supported

- Int8Array
- Uint8Array
- Uint8ClampedArray
- Int16Array
- Uint16Array
- Int32Array
- Uint32Array
- Float32Array

The following typed arrays are not implemented due to blocking reasons, [follow the issue list updates](https://github.com/underscorediscovery/snow/issues/17)

- Float64Array

### ByteArray

This is a ByteArray that is the low level means of sending data around, when not using the Typed arrays. For example, on native, there is a ByteArray counterpart and operations that can be optimized through native calls will go through native code where applicable.



---

##Back

[To the guide]({{{rel_path}}}index.html#guide)

<br/><br/><br/>
<br/><br/><br/>