package commands;

class PushBinaries {
    
    public static function run() {

    	//lumen -push "ndlls/*" [-m "hello"]?

    	var _message = 'updating binaries';
    	var _path = Run.lumen_path + 'ndll/*';

    	var _push_value = Run.args.get('push').value;
    	var _message_value = Run.args.get('m').value;

    	if(_push_value != '') {
    		_path = _push_value;
    	}

    	if(_message != '') {
    		_message = _message_value;
    	}

    	Run._trace('attemping to push updated binaries to git repo...');
    	Run._trace(' running git commit -m "${_message_value}" ${_path} && git push' );

    	var commit_worked = true;

            //update in case other builds have affected the tree
        Helper.git_pull();

    	try {
    		Helper.git_commit(_message, _path); 
    		Run._trace('push / commit done');
    	} catch(e:Dynamic) {
    		commit_worked = false;
    		Run._trace('push / no commit available for that path. Not attempting to push');
    	}

    	if(commit_worked) {
    		try{ 
    			Helper.git_push(true);
    			Run._trace('push / push done');
    		} catch(e:Dynamic) {
    			Run._trace('push / FAILED TO PUSH. see log for details');
    		}
    	}

    } //run

} //PushBinaries
