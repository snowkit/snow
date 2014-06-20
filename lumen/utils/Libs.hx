package lumen.utils;

class Libs {

        //for Load function
    @:noCompletion static var __moduleNames:Map<String, String> = null;

    static function tryLoad( name:String, library:String, func:String, args:Int ) : Dynamic {

        #if lumen_native

            try {

                #if cpp
                    var result = cpp.Lib.load( name, func, args );
                #elseif (neko)
                    var result = neko.Lib.load( name, func, args );
                #else
                    return null;
                #end

                if (result != null) {

                    loaderTrace ("Got result " + name);
                    __moduleNames.set (library, name);

                    return result;

                } //result != null

            } catch (e:Dynamic) {

                loaderTrace ("Failed to load : " + name);

            } //catch

        #end //lumen_native

        return null;

    } //tryLoad

    #if neko

        static function loadNekoAPI ():Void {

            var init = load ("lumen", "neko_init", 5);

            if (init != null) {

                loaderTrace ("Found nekoapi @ " + __moduleNames.get ("lumen"));
                init (function(s) return new String (s), function (len:Int) { var r = []; if (len > 0) r[len - 1] = null; return r; }, null, true, false);

            } else {

                throw ("Could not find NekoAPI interface.");

            }

        }

    #end //neko

    static function findHaxeLib( library:String ) : String {

        try {

            #if lumen_native

                var proc = new sys.io.Process ("haxelib", [ "path", library ]);

                if (proc != null) {

                    var stream = proc.stdout;

                    try {

                        while (true) {

                            var s = stream.readLine ();

                            if (s.substr (0, 1) != "-") {

                                stream.close ();
                                proc.close ();
                                loaderTrace ("Found haxelib " + s);
                                return s;

                            }

                        }

                    } catch(e:Dynamic) { }

                    stream.close ();
                    proc.close ();

                }

            #end //lumen_native

        } catch (e:Dynamic) { }

        return "";

    } //findHaxeLib

    static function get_system_name() : String {

        #if lumen_native
            #if cpp
                var sys_string = cpp.Lib.load ("std", "sys_string", 0);
                return sys_string();
            #else
                return Sys.systemName();
            #end
        #end

        #if lumen_html5
            // /todo/ get browser info here?
            return "lumen_browser_webgl";
        #end

    } //get_system_name

#if lumen_html5

    public static var _html5_libs:Map<String,Dynamic>;

    public static function html5_add_lib( library:String, root:Dynamic ) {

        if(_html5_libs == null) {
            _html5_libs = new Map<String,Dynamic>();
        }

        _html5_libs.set( library, root );

        return true;

    } //html5_add_lib

    public static function html5_lib_load(library:String, method:String) {

        if(_html5_libs == null) {
             _html5_libs = new Map<String,Dynamic>();
        }

        var _root = _html5_libs.get(library);
        if(_root != null) {
            return Reflect.field(_root, method);
        }

        return null;

    } //html5_lib_load

#end //lumen_html5

    public static function load (library:String, method:String, args:Int = 0):Dynamic {

        #if (iphone || emscripten || android)
            return cpp.Lib.load( library, method, args );
        #end

        #if lumen_html5
            var found_in_html5_libs = html5_lib_load( library, method );
            if(found_in_html5_libs) {
                return found_in_html5_libs;
            }
        #end //lumen_html5

        if (__moduleNames == null) __moduleNames = new Map<String, String> ();
        if (__moduleNames.exists (library)) {

            #if cpp
                return cpp.Lib.load (__moduleNames.get (library), method, args);
            #elseif neko
                return neko.Lib.load (__moduleNames.get (library), method, args);
            #end

        }

        __moduleNames.set (library, library);

        var result:Dynamic = tryLoad ("./" + library, library, method, args);

        if (result == null) {
            result = tryLoad (".\\" + library, library, method, args);
        }

        if (result == null) {
            result = tryLoad (library, library, method, args);
        }

        if (result == null) {

            var slash = (get_system_name ().substr (7).toLowerCase () == "windows") ? "\\" : "/";
            var haxelib = findHaxeLib ("lumen");

            if (haxelib != "") {
                result = tryLoad (haxelib + slash + "ndll" + slash + get_system_name () + slash + library, library, method, args);
                if (result == null) {
                    result = tryLoad (haxelib + slash + "ndll" + slash + get_system_name() + "64" + slash + library, library, method, args);
                }
            }

        } //result == null

        loaderTrace ("Result : " + result);

        #if neko
            if (library == "lumen") {
                loadNekoAPI();
            }
        #end

        return result;

    } //load

    static function loaderTrace( message:String ) {

        #if lumen_native

            #if cpp

                var get_env = cpp.Lib.load ("std", "get_env", 1);
                var debug = (get_env ("OPENFL_LOAD_DEBUG") != null);

            #else //# not cpp

                var debug = (Sys.getEnv ("OPENFL_LOAD_DEBUG") !=null);

            #end //# if cpp

            if (debug) {
                Sys.println (message);
            } //if debug

        #end //lumen_native


        #if lumen_html5
            //todo leverage console.log somehow?
        #end //lumen_html5

    } //loaderTrace

} //Libs
