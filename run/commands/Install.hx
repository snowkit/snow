package commands;

class Install {

    public static function run() {

        var _command = 'install';

        if(!Run.args.has(_command)) {
            _command = 'update';
        }

        var _install = Run.args.get(_command);

            //the three versions are
                //stable : haxelib version
                //dev : 'stable' development builds
                //edge : 'bleeding edge' master
        switch(_install.value) {
            case 'dev':
                install_snow_dev();
            case 'edge':
                install_snow_edge();
            default:
                if(_command != 'update') {
                    install_snow();
                } else {
                    Run._trace('update requires `dev` or `edge`, run snow with no arguments for usage');
                }
        }

    }

    static function install_snow() {

        //install snow command
        Helper.haxelib_install('lime-tools');
        Helper.haxelib_install('hxcpp');

    } //install_snow

    static function install_snow_dev() {

            //try and download the latest dev build
        var _latest_dev_link = haxe.Resource.getString("dev");
        var _dev_regex = '(.*)(snow.dev.)(.*)(.zip)';
        var _dev_ereg = new EReg(_dev_regex, 'gi');

        if(!_dev_ereg.match(_latest_dev_link)) {
            Run._trace('Unable to find dev version, please report this! ${_latest_dev_link}');
            return;
        }

        var _full_path = _dev_ereg.matched(1);
        var _version = _dev_ereg.matched(3);
        var _zip_name = _dev_ereg.matched(2);

        var _ignore = ('snow' + _zip_name + _version);

            //check if the current dev version exists in the haxelib path
        var _haxelib_root = Helper.haxelib_config_path();
        var _haxelib_dest = _haxelib_root + 'snow/dev/';
        var _dest_zip = _haxelib_dest + _version;
        var _haxelib_out_dest = _haxelib_dest + _version + '/';

        var _version_exists = sys.FileSystem.exists( _dest_zip );

        if(_version_exists) {
            if(!Run.args.has('force')) {
                Run._trace('dev version is already up to date (${_version})');
                return;
            } else {
                Run._trace('dev version was up to date (${_version}) but -force was requested');
            }
        }

        var _local_path = _dest_zip + '.zip';

        if(Helper.download_file(_latest_dev_link, _local_path) != 'failed') {
            return;
        }

        sys.FileSystem.createDirectory(_haxelib_out_dest);
        Helper.unzip(_local_path, _dest_zip, _ignore);

        var _result = Helper.haxelib_dev('snow', _haxelib_out_dest);

        Run._trace(_result);

    } //install_snow_dev

    static function install_snow_edge() {

            //whether we want update or install
        var run_update = false;

            //used to see if it's installed in haxelib or dev etc
        var _haxelib_path = Helper.haxelib_config_path();
        var _existing_version = Helper.haxelib_current('snow');

            //first check if their dev path isn't set explicitly already
        if( Run.snow_path == _haxelib_path ) {
            run_update = true;
        }

            //then if they have a dev version already, try to update that
        if(_existing_version.indexOf('[dev:') != -1) {
            run_update = true;
        }

        var _git_path = _haxelib_path + 'snow/git/';
        var _existing_git = sys.FileSystem.exists( _git_path );

        if(_existing_git) {
            run_update = true;
        }

        if(run_update) {

                //let's first see if there is a .git folder in there
            var _no_braces = StringTools.replace( _existing_version, '[dev:','');
            _no_braces = StringTools.replace( _no_braces, ']','');
            _no_braces = haxe.io.Path.addTrailingSlash(_no_braces);

            Run._trace('existing version suspected, checking if it is a .git repo : ' + _no_braces);

            if( sys.FileSystem.exists(_no_braces + '.git') ) {
                if(!Run.args.has('force')) {
                    Run._trace('updating...');
                    Helper.haxelib_update('snow');
                } else {
                    Helper.haxelib_install_git('snow', Run.snow_repo);
                }
            } else {
                if(!Run.args.has('force')) {
                    Run._trace('set version is not a git repo, can\'t clobber things etc. run `haxelib git snow ${Run.snow_repo}` or manually clone, if you want to use edge.');
                } else {
                    Helper.haxelib_install_git('snow', Run.snow_repo);
                }
            }

        } else {
            Helper.haxelib_install_git('snow', Run.snow_repo);
        }

    } //install_snow_edge

} //Install
