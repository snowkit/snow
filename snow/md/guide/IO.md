[![Logo]({{{rel_path}}}images/logo.png)]({{{rel_path}}}index.html#guide)

---

##IO

###IO platform features

As IO is often largely platform specific, most of the features in this class are available on certain platforms or sets of platforms.

For example, when attempting to use the native OS file dialogs, they will only exist on desktop platforms, as they do not exist elsewhere.

To alleviate frustration with missing API nodes, the IO functions are nested one depth below the user facing API in the `app.io.platform` instance instead. This means for example, if you wanted to use a file open dialog you would call `app.io.platform.dialog_open()` instead of `app.io.dialog_open`.

The full documentation of [public facing]({{{rel_path}}}api/snow/io/IO.html) and [platform specific]({{{rel_path}}}api/snow/io/IOSystemBinding.html) are linked here.

###IO and files 

**Remember that 99.9% of the time you should be using the [assets]({{{rel_path}}}guide/assets.html) class for IO!**

####use `app.assets.bytes('file.name');`

For if you really want low level file access,   
Know that haxe has it's own set of [IO classes](http://api.haxe.org/haxe/io/index.html),   
and that writing and reading files through haxe is possible and safe, on platforms where it makes sense. 

However, haxe io doesn't necessarily account for platforms where file IO is non-standard. The current only example of this is on Android, where file IO is handled from inside of the APK file at runtime.

Luckily, snow handles the details internally through SDL, and you can access reading file operations from the IOFile class, in the following way :

###Use the [assets]({{{rel_path}}}guide/assets.html) system for IO!
This is purely a low level example

```
override function ready() {
    
    //import snow.platform.native.io.IOFile;

        // _id:String, ?_mode:String="rb"
        // the mode matches c++ file IO modes

    var file : IOFile = IOFile.from_file( 'file.name', 'rb' );

    //file.read
    //file.write
    //file.seek
    //file.tell
    //file.close

} //ready
```

---

##Back

[To the guide]({{{rel_path}}}index.html#guide)

<br/><br/><br/>
<br/><br/><br/>