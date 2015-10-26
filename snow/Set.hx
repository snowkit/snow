package snow;

#if macro
    import haxe.macro.Compiler;
    import haxe.macro.Context;
    import haxe.macro.Expr;
    import haxe.macro.ExprTools;
    import haxe.macro.TypeTools;
    import haxe.macro.Type;
#end

class Set {

    public static var app_runtime : String #if !display = get_runtime() #end;
    public static var app_config : String #if !display = get_config() #end;
    public static var app_ident : String #if !display = get_ident() #end;
    public static var app_main : String #if !display = get_main() #end;

    public static var module_assets : String = #if !display get_module_assets() #end;
    public static var module_audio : String = #if !display get_module_audio() #end;
    public static var module_io : String = #if !display get_module_io() #end;

    //Configs

        //set

            macro static function ident(_value:String):Void {
                snow.Set.app_ident = _value;
            } //ident

            macro static function config(_value:String):Void {
                snow.Set.app_config = _value;
            } //config

            macro static function main(_value:String):Void {
                // Context.warning('main: $_value', Context.currentPos());
                Compiler.keep(_value);
                snow.Set.app_main = _value;
            }

            macro static function runtime(_value:String):Void {
                // Context.warning('runtime: $_value', Context.currentPos());
                Compiler.keep(_value);
                snow.Set.app_runtime = _value;
            }

            macro static function assets(_value:String):Void {
                // Context.warning('assets: $_value', Context.currentPos());
                Compiler.keep(_value);
                snow.Set.module_assets = _value;
            }

            macro static function audio(_value:String):Void {
                // Context.warning('audio: $_value', Context.currentPos());
                Compiler.keep(_value);
                snow.Set.module_audio = _value;
            }

            macro static function io(_value:String):Void {
                // Context.warning('io: $_value', Context.currentPos());
                Compiler.keep(_value);
                snow.Set.module_io = _value;
            }

        //get

            #if !display

                macro static function get_runtime():Expr return macro $v{snow.Set.app_runtime};
                macro static function get_config():Expr return macro $v{snow.Set.app_config};
                macro static function get_ident():Expr return macro $v{snow.Set.app_ident};
                macro static function get_main():Expr return macro $v{snow.Set.app_main};

                macro static function get_module_assets():Expr return macro $v{snow.Set.module_assets};
                macro static function get_module_audio():Expr return macro $v{snow.Set.module_audio};
                macro static function get_module_io():Expr return macro $v{snow.Set.module_io};

            #end
            
    //Extensions

        
    //Helpers

        macro static function get_type(_value:String):Type {

            var _name:String = switch(_value) {
                case 'app_main': snow.Set.app_main;
                case 'app_runtime': snow.Set.app_runtime;
                case 'module_assets': snow.Set.module_assets;
                case 'module_audio': snow.Set.module_audio;
                case 'module_io': snow.Set.module_io;
                case _: null;
            }
            
            if(_name == null) {
                // Context.fatalError('snow.Set.get_type: unknown type $_value', Context.currentPos());
                return null;
            }

            var _type = Context.getType(_name);
                _type = Context.follow(_type);
            
            return _type;

        }

}

#if !macro

    typedef HostApp      = haxe.macro.MacroType<[snow.Set.get_type('app_main')]>;
    typedef HostRuntime  = haxe.macro.MacroType<[snow.Set.get_type('app_runtime')]>;
    typedef ModuleAssets = haxe.macro.MacroType<[snow.Set.get_type('module_assets')]>;
    typedef ModuleAudio  = haxe.macro.MacroType<[snow.Set.get_type('module_audio')]>;
    typedef ModuleIO     = haxe.macro.MacroType<[snow.Set.get_type('module_io')]>;

#end

