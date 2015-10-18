package snow;

#if macro
import haxe.macro.Compiler;
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.ExprTools;
import haxe.macro.Type;
#end

#if (!macro && !display)
        /** The compile time type of the user App main, used to instantiate the user type */
    typedef HostApp = haxe.macro.MacroType<[snow.Set.get_type('app_main')]>;
        /** The compile time type of the runtime instance, used to instantiate the runtime type */
    typedef HostRuntime = haxe.macro.MacroType<[snow.Set.get_type('app_runtime')]>;
        /** The compile time type of the asset module */
    typedef ModuleAssets = haxe.macro.MacroType<[snow.Set.get_type('module_assets')]>;
    typedef ModuleAudio  = haxe.macro.MacroType<[snow.Set.get_type('module_audio')]>;
    typedef ModuleInput  = haxe.macro.MacroType<[snow.Set.get_type('module_input')]>;
    typedef ModuleIO     = haxe.macro.MacroType<[snow.Set.get_type('module_io')]>;
    typedef ModuleWindow = haxe.macro.MacroType<[snow.Set.get_type('module_window')]>;
#end

@:allow(snow.App)
@:allow(snow.Snow)
class Set {

    #if !display

        public static var app_runtime : String = get_runtime();
        public static var app_config : String = get_config();
        public static var app_ident : String = get_ident();
        public static var app_main : String = get_main();

        public static var module_assets : String = get_module_assets();
        public static var module_audio : String = get_module_audio();
        public static var module_input : String = get_module_input();
        public static var module_io : String = get_module_io();
        public static var module_window : String = get_module_window();

//Configs
    //set
        macro static function ident(_value:String):Void     app_ident = _value;
        macro static function config(_value:String):Void    app_config = _value;

        macro static function main(_value:String):Void {
            // Context.warning('main: $_value', Context.currentPos());
            Compiler.include(_value); Compiler.keep(_value);
            Context.follow(Context.getType(_value));
            app_main = _value;
        }

        macro static function runtime(_value:String):Void {
            // Context.warning('runtime: $_value', Context.currentPos());
            Compiler.include(_value); Compiler.keep(_value);
            Context.follow(Context.getType(_value));
            app_runtime = _value;
        }

        macro static function assets(_value:String):Void {
            // Context.warning('assets: $_value', Context.currentPos());
            Compiler.include(_value); Compiler.keep(_value);
            Context.follow(Context.getType(_value));
            module_assets = _value;
        }

        macro static function audio(_value:String):Void {
            // Context.warning('audio: $_value', Context.currentPos());
            Compiler.include(_value); Compiler.keep(_value);
            Context.follow(Context.getType(_value));
            module_audio = _value;
        }

        macro static function input(_value:String):Void {
            // Context.warning('input: $_value', Context.currentPos());
            Compiler.include(_value); Compiler.keep(_value);
            Context.follow(Context.getType(_value));
            module_input = _value;
        }

        macro static function io(_value:String):Void {
            // Context.warning('io: $_value', Context.currentPos());
            Compiler.include(_value); Compiler.keep(_value);
            Context.follow(Context.getType(_value));
            module_io = _value;
        }

        macro static function window(_value:String):Void {
            // Context.warning('window: $_value', Context.currentPos());
            Compiler.include(_value); Compiler.keep(_value);
            Context.follow(Context.getType(_value));
            module_window = _value;
        }

        #if macro
        macro static function get_type(_value:String):Type {
            
            var _name:String = switch(_value) {
                case 'app_main': app_main;
                case 'app_runtime': app_runtime;
                case 'module_assets': module_assets;
                case 'module_audio': module_audio;
                case 'module_input': module_input;
                case 'module_io': module_io;
                case 'module_window': module_window;
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
        #end

    //get
        macro static function get_runtime():Expr return macro $v{app_runtime};
        macro static function get_config():Expr return macro $v{app_config};
        macro static function get_ident():Expr return macro $v{app_ident};
        macro static function get_main():Expr return macro $v{app_main};

        macro static function get_module_assets():Expr return macro $v{module_assets};
        macro static function get_module_audio():Expr return macro $v{module_audio};
        macro static function get_module_input():Expr return macro $v{module_input};
        macro static function get_module_io():Expr return macro $v{module_io};
        macro static function get_module_window():Expr return macro $v{module_window};

//Extensions
    //set

//Modules
    //set
        //:todo: how to pass the string to the other string thing
        macro static function module(name:String, type:String):Void {
            // snow.system.module.Module.set('$name', '$type');
        }
    
    #else
        macro static function ident(_value:String) { return macro ''; }
        macro static function config(_value:String){ return macro ''; }
        macro static function main(_value:String){ return macro ''; }
        macro static function runtime(_value:String){ return macro ''; }
        macro static function assets(_value:String){ return macro ''; }
        macro static function audio(_value:String){ return macro ''; }
        macro static function input(_value:String){ return macro ''; }
        macro static function io(_value:String){ return macro ''; }
        macro static function window(_value:String){ return macro ''; }
    #end

}

