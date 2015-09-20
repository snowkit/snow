package snow;

class Pre {

//Static configuration values (set via initialization macro)

    macro static function set(_key:String, _value:String) : Void {
        switch(_key) {
            case 'config': app_config = _value;
            case 'package': app_package = _value;
            case _:
        }
    }

    macro static function get(_key:String) : haxe.macro.Expr {
        var _result = switch(_key) {
            case 'config': app_config;
            case 'package': app_package;
            case _: '';
        }

        return macro $v{_result};
    }

    static var app_config : String = get('config');
    static var app_package : String = get('package');

}