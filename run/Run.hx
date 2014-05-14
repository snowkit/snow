
import arguable.ArgParser;

import helpers.ProcessHelper;
import helpers.PathHelper;
import project.Haxelib;

class Run {

    public static var args : ArgValues;
    public static var sys_arg_list : Array<String>;

    public static var lumen_lib : Haxelib;
    public static var lumen_path : String;
    public static var lumen_repo : String = 'https://github.com/underscorediscovery/lumen.git';
    public static var haxe_path : String;

    static function main() {

        lumen_lib = new Haxelib('lumen');
        lumen_path = PathHelper.getHaxelib( lumen_lib );
        haxe_path = Sys.getEnv("HAXEPATH");

        lumen_path = haxe.io.Path.addTrailingSlash(lumen_path);

        if(haxe_path != null) {
            haxe_path = haxe.io.Path.addTrailingSlash(haxe_path);
        } else { 
            haxe_path = '';
        }

            //arg list from system needs filtering
        sys_arg_list = Sys.args();
                //remove wd
        var _cwd = sys_arg_list.pop();

        ArgParser.delimeter = '-';
        args = ArgParser.parse( sys_arg_list );

        if(!args.any || args.has('help') || args.has('usage')) {
            print_usage();
            return;
        }

        if(args.has('version')) {
            print_version(false);
            return;
        }

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

        if(args.has('install') || args.has('update')) {
            commands.Install.run();
            return true;
        }

        return false;

    } //handled_internally

    static function pass_to_tools() : Bool {
        ProcessHelper.runCommand('.', 'haxelib', ['run', 'lime-tools'].concat( sys_arg_list ) );
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
        Sys.println( (name ? '/ lumen / ' : '') + v);
    } //_trace

} //Run
