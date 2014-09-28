[![Logo]({{{rel_path}}}images/logo.png)]({{{rel_path}}}index.html#guide)

---

##Build, modify, fix the native support layer

On native platforms, snow is built using c++ code and is bound via the haxe api. You can read the [structure guide]({{{rel_path}}}guide/structure.html) for more insight here.

##Note 
you **do not** need to recompile snow to use it! There are prebuilt versions bundled for each platform alongside the code.

### Auto fetch dependencies

snow uses git submodules to hold dependency libs. **These are required to build snow.**

To fetch them, simply run `git submodule update --init` from **within the snow folder**

This will ensure all build dependencies are fetched.

### Recompile snow native code

If something has been changed in the native layer, chances are the code will need to be rebuilt. To do this is very simple, you use flow.

- `cd path/to/snow/project/` and then `flow build <target>` OR
- `flow build <target> --project path/to/snow/project/snow.flow`

The first command is like running your project from it's working folder. The second, runs the rebuild from anywhere using the explicit project path to tell flow what to build.

In both cases, target is the platform for which you want to build. If you wanted to rebuild the platform you are on, it can be ommitted.

### Notes

Sometimes, when modifying the snow code, you may change code inside of a header file, and hxcpp will not know that it has been modified (as it builds cpp/c files). This means that if you modify snow_core.h you will likely have to touch or save snow_hx_bindings.cpp so that hxcpp will compile the new library with the updated change.

This is being investigated to be made simpler.

###Platform Notes

- `mac` - snow is linked statically, as libsnow.a
- `windows` - snow is linked statically as libsnow.lib
- `linux` - snow is linked dynamically as snow.ndll due to GTK dependencies
- `ios` - snow is linked statically as libsnow.a
- `android` - snow is linked dynamically as libsnow.so

###Platform requirements

The only platform that has requirements above the regular builds, is linux.

To rebuild snow on linux, you will additionally need to install

`libgtk-3-dev`

or define SNOW_NO_GTK to avoid the dependency using the snow/project/Build.xml

