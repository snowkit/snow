
import arguable.ArgParser;

import helpers.ProcessHelper;
import helpers.PathHelper;
import project.Haxelib;

class Run {

    public static var args : ArgValues;
    public static var sys_arg_list : Array<String>;

    public static var snow_lib : Haxelib;
    public static var run_path : String;
    public static var snow_path : String;
    public static var snow_repo : String = 'https://github.com/underscorediscovery/snow.git';
    public static var haxe_path : String;

    static function main() {

        snow_lib = new Haxelib('snow');
        haxe_path = Sys.getEnv("HAXEPATH");

        if(haxe_path != null) {
            haxe_path = haxe.io.Path.addTrailingSlash(haxe_path);
        } else {
            haxe_path = '';
        }

            //arg list from system needs filtering
        sys_arg_list = Sys.args();
            //remove cwd
        run_path = sys_arg_list.pop();
            //parse commands
        ArgParser.delimeter = '-';
        args = ArgParser.parse( sys_arg_list );


        if(args.has('snow')) {
            snow_path = args.get('snow').value;
            sys_arg_list.remove('-snow');
            sys_arg_list.remove(snow_path);
            if(snow_path == '') {
                Run._trace('error : -snow requires a path, `-snow /path/to/snow/root`');
                return;
            }
        } else {
                //if an explicit snow path was not set we ask haxelib for the path
            snow_path = PathHelper.getHaxelib( snow_lib );
            if(snow_path == '') {
                Run._trace('error : snow path cannot be found from haxelib and no path was given. Use `haxelib [install|dev|git] snow`, or pass the path with -snow');
                throw "config error";
            }
        }

            //make sure it has a trailing slash
        snow_path = haxe.io.Path.addTrailingSlash(snow_path);

        if(!args.any || args.has('help') || args.has('usage')) {
            print_usage();
            return;
        }

        if(args.has('version')) {
            print_version(false);
            return;
        }

        Run._trace('using snow from ${snow_path}');
        Run._trace('    running from ${run_path}');

            //now handle internal commands
        if(handled_internally()) {
            return;
        }

        pass_to_tools();

    } //main

    static function handled_internally() : Bool {

        if(args.has('rebuild')) {
            commands.Rebuild.run();
            return true;
        }

        if(args.has('push')) {
            commands.PushBinaries.run();
            return true;
        }

        if(args.has('install') || args.has('update')) {
            commands.Install.run();
            return true;
        }

        return false;

    } //handled_internally

    static function pass_to_tools() : Bool {

        var _command = ['run', 'lime-tools'].concat( sys_arg_list );

        Run._trace('running tools command haxelib ${_command.join(" ")}');

        ProcessHelper.runCommand( run_path, 'haxelib', _command );

        return true;

    } //pass_to_tools

    static function print_usage() {
        print_version(true);
        _trace(haxe.Resource.getString("usage"), false);
    } //print_usage

    static function print_version( ?adorned:Bool=true ) {
        _trace( (!adorned ? '' : 'version / ') + haxe.Resource.getString("version"));
    } //print_version

    public static function _trace(v:Dynamic, ?name:Bool=true) {
        Sys.println( (name ? '/ snow / ' : '') + v);
    } //_trace

} //Run
