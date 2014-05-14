package commands;

import sys.FileSystem;
import helpers.ProcessHelper;
import helpers.PathHelper;

class Rebuild {

    static var archs : Array<String>;

    public static function run() {

        Run._trace('rebuilding...');

        var _target = Run.args.get('rebuild');
        var _arg_list = Run.sys_arg_list.copy();

        var _default_target = (Sys.systemName()).toLowerCase();
        var _chosen_target = _target.value;

            //strip these and pass the rest as is onto
            //hxcpp so it can handle them as it sees fit
        _arg_list.remove('-rebuild');

        if(_chosen_target != '') {
            _arg_list.remove(_chosen_target);
        } else {
            Run._trace('using default os target: ${_default_target} (use specific values for other targets)');
            _chosen_target = _default_target;
        }

            //now run per platform rebuild
        rebuild_target( _chosen_target, _arg_list );        

    } //run


    static function arch( _which:String ) {
        return archs.indexOf(_which) != -1;
    } //arch

    static function rebuild_target( _target:String, _args:Array<String> ) {

            //the list of build arguments to run
        var builds = [];    
            //per target archs will persist with multiple targets 
            //because they are in the Run.args list. 
            archs = [];

            //for now we only rebuild lumen target,
            //but this will be configured for stuff later
        var _path = Run.lumen_path + 'project/';

            //run a clean up if requested
        if(Run.args.has('clean')) {
            _args.remove('-clean');
            clean_hxcpp_build(_path);
        }

        if(Run.args.has('arch')) {
            var archstring = Run.args.get('arch').value;
            _args.remove('-arch');
            _args.remove(archstring);
            archs = archstring.split(',');
        }

        switch(_target) {

            case "ios", "android" :

                    var do_armv6 = true;
                    var do_armv7 = true;
                    var do_simulator = (_target == "ios");

                        //do armv7 but not 6?
                    if(arch('armv7') && !arch('armv6')) {
                        do_armv6 = false;
                    }

                        //do armv6 but not 7?
                    if(arch('armv6') && !arch('armv7')) {
                        do_armv7 = false;
                    }

                        //if only device asked
                    if(arch('device')) {
                        do_simulator = false;
                    }

                if(do_armv6) {
                    builds.push( add_target_flags(_args, _target) );
                }

                if(do_armv7) {
                    builds.push( add_target_flags(_args, _target, "armv7") );
                }

                if(do_simulator) {
                    builds.push( add_target_flags(_args, _target, "sim") );
                }

            case "mac", "linux", "windows":

                    var do_32bit = true;
                    var do_64bit = true;

                    if(_target == "mac") {
                        do_32bit = false;
                    }
                    
                    if(_target == "windows") {
                        do_64bit = false;
                    }

                        //32 bit asked, but not 64?
                    if(arch('32bit') && !arch('64bit')) {
                        do_64bit = false;
                    }

                        //64 bit asked, but not 32?
                    if(arch('64bit') && !arch('32bit')) {
                        do_32bit = false;
                    }

                if(do_64bit) {
                    builds.push( add_target_flags(_args, _target, "64bit") );
                }

                if(do_32bit) {
                    builds.push( add_target_flags(_args, _target, "32bit") );
                }

        } //switch target

        if(archs.length > 0) {
            Run._trace('building archs : ' + archs.join(' '));
        }

        for(build in builds) {
            run_hxcpp_build( _path, _target, build );
        }

    } //rebuild_target


    static function run_hxcpp_build( _path:String, _target:String, _args:Array<String> ) {

        var _final_args : Array<String> = [
            '-D${_target}',
            'Build.xml'
        ];

            //append passed in arguments
        _final_args = _final_args.concat(_args);

        Run._trace('build target ${_target}: haxelib run hxcpp ${_path} ${_final_args.join(" ")}');

            //run the builds
        // ProcessHelper.runCommand( _path, 'haxelib', ['run', 'hxcpp'].concat(_final_args) );
        Helper.haxelib_run(_path, 'hxcpp', _final_args);

    } //run_hxpp_build


    static function clean_hxcpp_build( _path:String ) {
        
        var directories = [ PathHelper.combine (_path, "obj") ];
        var files = [ PathHelper.combine (_path, "all_objs"), PathHelper.combine (_path, "vc100.pdb"), PathHelper.combine (_path, "vc110.pdb") ];

        Run._trace('running clean build...');

        for (directory in directories) {
            Helper.remove_directory (directory);
        }
        
        for (file in files) {
            if (FileSystem.exists (file)) {
                FileSystem.deleteFile (file);
            }
        }

    } //clean_hxcpp_build


    static function add_target_flags( _add_to_args:Array<String>, _target:String, ?_option:String="" ) : Array<String> {

        var _target_flags : Array<String> = [];

        switch(_target) {
            
            case "windows":
                
                if (Sys.environment().exists("VS110COMNTOOLS") && Sys.environment().exists("VS100COMNTOOLS")) {
                    Sys.putEnv("HXCPP_MSVC", Sys.getEnv("VS100COMNTOOLS"));
                }

            case "mac":

                //mac only
            
            case "linux":

                //linux only
            
            case "ios":

                    //ios only
                _target_flags.push('-DHXCPP_CPP11');

                switch(_option) {
                    case "sim":
                        _target_flags.push('-Diphonesim');
                }

            case "android":

                //android only

        } //switch target

            //now add cumulative ones for multiple targets
        if( _target == "android" || 
            _target == "ios" ) {

                switch(_option) {
                    case "armv7" : 
                        _target_flags.push('-DHXCPP_ARMV7');
                }

        } //android || ios

        if( _target == "linux" || 
            _target == "mac" ||
            _target == "windows" ) {
            
                switch(_option) {
                    case "64bit" :
                        _target_flags.push('-DHXCPP_M64');
                    case "32bit" :
                        //no additional flags
                }

        } //linux || mac || windows

        return _add_to_args.concat(_target_flags);

    } //add_target_flags


} //Rebuild