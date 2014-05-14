
import haxe.Http;
import sys.FileSystem;
import helpers.ProcessHelper;
import helpers.PathHelper;
import sys.io.File;

class Helper {

    public static function remove_directory(directory:String):Void {
        
        if (FileSystem.exists (directory) && FileSystem.isDirectory (directory)) {
            
            for (file in FileSystem.readDirectory (directory)) {
                var path = directory + "/" + file;

                if (FileSystem.isDirectory (path)) {
                    remove_directory (path);
                } else {
                    FileSystem.deleteFile (path);
                }
            }
            
            FileSystem.deleteDirectory (directory);
        }

    } // remove_directory

    public static function unzip( _path:String, _dest:String, ignoreRootFolder:String = "" ) {

        var _in_file = sys.io.File.read( _path );
        var _entries = haxe.zip.Reader.readZip( _in_file );
            _in_file.close();

        for(_entry in _entries) {
            var fileName = _entry.fileName;
            if (fileName.charAt (0) != "/" && fileName.charAt (0) != "\\" && fileName.split ("..").length <= 1) {
                var dirs = ~/[\/\\]/g.split(fileName);
                if ((ignoreRootFolder != "" && dirs.length > 1) || ignoreRootFolder == "") {
                    if (ignoreRootFolder != "") {
                        dirs.shift ();
                    }
                
                    var path = "";
                    var file = dirs.pop();
                    for( d in dirs ) {
                        path += d;
                        PathHelper.mkdir (_dest + "/" + path);
                        path += "/";
                    }
                
                    if( file == "" ) {
                        if( path != "" ) Run._trace("created " + path);
                        continue; // was just a directory
                    }
                    path += file;
                    Run._trace("unzip " + path);
                
                    var data = haxe.zip.Reader.unzip(_entry);
                    var f = File.write (_dest + "/" + path, true);
                    f.write(data);
                    f.close();
                }
            }
        } //_entry

        Sys.println('');
        Run._trace('unzipped successfully to ${_dest}');

    } //unzip

    static inline function read_line() {
        return Sys.stdin().readLine();
    } //read_line
    
    private static function ask (question:String):String {
        while (true) {
            Run._trace(question + " [y/n/s/a]?");
            switch (read_line()) {
                case "n": return 'no';
                case "y": return 'yes';
                case "a": return 'always';
                case "s": return 'skip';
            }
        }
        return null;
    } //ask

    public static function download_file( remotePath:String, localPath:String = "", followingLocation:Bool = false) : String {
        
        if (localPath == "") {
            localPath = haxe.io.Path.withoutDirectory(remotePath);
        }
        
        if (!followingLocation && FileSystem.exists(localPath)) {
            var answer = ask("file found. use existing file?");
            if (answer != 'no') {
                return answer;
            }
        }

        var out = File.write(localPath, true);
        var progress = new Progress(out);
        var h = new Http(remotePath);
        
        h.cnxTimeout = 30;
        
        h.onError = function (e) {
            progress.close();
            FileSystem.deleteFile(localPath);
            Run._trace('downloading failed... ${e}');
            return;
        };
        
        if (!followingLocation) {
            Run._trace('downloading ${localPath} from ${remotePath}...');
        }
        
        h.customRequest (false, progress);
        
        if (h.responseHeaders != null && h.responseHeaders.exists ("Location")) {
            var location = h.responseHeaders.get ("Location");
            if (location != remotePath) {
                download_file (location, localPath, true);
            }
        }

        return '';
        
    } //download_file

    public static function haxelib_current( haxelib:String ) : String {

        var list = haxelib_list();

        // var repo_match : EReg = new EReg("("+haxelib+":).*(\[.*\])", 'gi');
        var reg = '(${haxelib}:)(.*)(\\[.*\\])';
        var repo_match : EReg = new EReg(reg,'gi');
        var repo_version = '';

        if(repo_match.match(list)) {
            repo_version = repo_match.matched(3);
        }

        return repo_version;
        
    } //

    public static function haxelib_list() : String {
        var _command = "haxelib";
        return ProcessHelper.runProcess( Run.haxe_path, _command, ["list"] );
    }

    public static function haxelib_dev( haxelib:String, dest:String ) : String {
        var _command = "haxelib";
        return ProcessHelper.runProcess( Run.haxe_path, _command, ["dev", haxelib, dest] );
    }

    public static function haxelib_config_path() : String {

        var _command = "haxelib";

        return StringTools.trim(ProcessHelper.runProcess( Run.haxe_path, _command, ["config"] ));

    } //haxelib_config_path

    public static function haxelib_install( haxelib:String, ?version:String='' ) {

        var _command = "haxelib";
        var _name = haxelib + ((version == '') ? '' : ':' + version );

        ProcessHelper.runCommand( Run.haxe_path, _command, [ "install", _name ] );

    } //haxelib_install

    public static function haxelib_install_git( haxelib:String, repo:String ) {

        var _command = "haxelib";

        ProcessHelper.runCommand( Run.haxe_path, _command, [ "git", haxelib, repo ] );

    } //haxelib_install_git

    public static function haxelib_run( path:String, haxelib:String, args:Array<String> ) {

        var _command = Run.haxe_path + "haxelib";

        ProcessHelper.runCommand( path, _command, [ "run", haxelib ].concat(args) );

    } //haxelib_run

    public static function haxelib_update( haxelib:String ) {

        var _command = "haxelib";

        ProcessHelper.runCommand( Run.haxe_path, _command, [ "update", haxelib ] );

    } //haxelib_update


} //Helper

class Progress extends haxe.io.Output {

    var o : haxe.io.Output;
    var cur : Int;
    var max : Int;
    var start : Float;

    public function new(o) {
        this.o = o;
        cur = 0;
        start = haxe.Timer.stamp();
    }

    function bytes(n) {
        cur += n;
        if( max == null )
            neko.Lib.print(cur+" bytes\r");
        else {
            neko.Lib.print(cur+"/"+max+" ("+Std.int((cur*100.0)/max)+"%)\r");
        }
    }

    public override function writeByte(c) {
        o.writeByte(c);
        bytes(1);
    }

    public override function writeBytes(s,p,l) {
        var r = o.writeBytes(s,p,l);
        bytes(r);
        return r;
    }

    public override function close() {

        super.close();
        o.close();
        var time = haxe.Timer.stamp() - start;
        var speed = (cur / time) / 1024;
        time = Std.int(time * 10) / 10;
        speed = Std.int(speed * 10) / 10;
        
        // When the path is a redirect, we don't want to display that the download completed
        
        if (cur > 400) {
            Run._trace("download complete : " + cur + " bytes in " + time + "s (" + speed + "KB/s)");
        }
        
    }

    public override function prepare(m) {
        max = m;
    }

}