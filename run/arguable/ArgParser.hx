package arguable;

import arguable.Stack;

typedef Arg = {
    var name : String;
    var value : String;
};

class ArgValues {
    public var any : Bool;
    public var length : Int;
    public var invalid : Array<Arg>;
    public var valid : Array<Arg>;

    public function new(_any:Bool, _length:Int, _valid:Array<Arg>, _invalid:Array<Arg> ) {
        any = _any;
        length = _length;
        valid = _valid;
        invalid = _invalid;
    }

    public function has(arg:String) : Bool {
        return get(arg) != null;
    }

    public function get(arg:String) : Arg {
        var _found = valid.filter(function(_arg:Arg) {
            return _arg.name == arg;
        });
        if(_found.length > 0) {
            return _found[0];
        } else {
            return null;
        }
    }

    public function getAll(arg:String) : Array<Arg> {
        var _found = valid.filter(function(_arg:Arg) {
            return _arg.name == arg;
        });
        return _found;
    }

}

class ArgParser {

    public static var delimeter : String = '--';
    public static function parse( args:Array<String> ) : ArgValues {

        var _stack : Stack<String> = new Stack<String>();

        var _results : ArgValues;
        var _args_invalid : Array<Arg> = [];
        var _args_valid : Array<Arg> = [];

        if(args.length > 0) {
            for(_arg in args) {

                if(_arg.substr(0, delimeter.length) == delimeter) {

                    if(!_stack.empty()) {
                        if(_stack.length == 2) {
                            _args_valid.push({
                                value : _stack.pop(),
                                name : _stack.pop()
                            });
                        } else {
                            _args_valid.push({
                                value : '',
                                name : _stack.pop()
                            });
                        }
                    }

                    _stack.push( _arg.substr(ArgParser.delimeter.length, _arg.length - ArgParser.delimeter.length ) );
                } else {

                    if(_stack.length == 2) {
                            //push invalid one 
                        _args_invalid.push({ name : _arg, value:'' });
                            //this is a mistaken arg position, so pop the existing first
                        _args_valid.push({
                            value : _stack.pop(),
                            name : _stack.pop()
                        });

                    } else if(_stack.length == 0) {
                            //push invalid one 
                        _args_invalid.push({ name : _arg, value:'' });

                    } else {
                        _stack.push( _arg );
                    }
                }
            } //for each arg
        } //args.length

        if(!_stack.empty()) {
            if(_stack.length == 2) {
                _args_valid.push({
                    value : _stack.pop(),
                    name : _stack.pop()
                });
            } else {
                _args_valid.push({
                    value : '',
                    name : _stack.pop()
                });
            }
        } //existing items?

        return new ArgValues( (_args_valid.length > 0) || (_args_invalid.length > 0),
                                _args_valid.length,
                                _args_valid,
                                _args_invalid );

    } //parse
}
