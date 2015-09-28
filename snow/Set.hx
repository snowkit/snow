package snow;

#if macro
import haxe.macro.Compiler;
import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.ExprTools;
#end

@:allow(snow.App)
@:allow(snow.Snow)
class Set {

    public static var app_platform : String = get_platform();
    public static var app_config : String = get_config();
    public static var app_ident : String = get_ident();
    public static var app_main : String = get_main();

//Configs
    //set
        macro static function ident(_value:String):Void     app_ident = _value;
        macro static function config(_value:String):Void    app_config = _value;

        macro static function main(_value:String):Void {
            Compiler.include(_value);
            Compiler.keep(_value);
            var t = Context.getType(_value);
            Context.follow(t);
            app_main = _value;
        }

        macro static function platform(_value:String):Void {
            Compiler.include(_value);
            Compiler.keep(_value);
            var t = Context.getType(_value);
            Context.follow(t);
            app_platform = _value;
        }

    //get
        macro static function get_platform():Expr return macro $v{app_platform};
        macro static function get_config():Expr return macro $v{app_config};
        macro static function get_ident():Expr return macro $v{app_ident};
        macro static function get_main():Expr return macro $v{app_main};
//Extensions
    //set

//Modules
    //set
        //:todo: how to pass the string to the other string thing
        macro static function module(name:String, type:String):Void {
            // snow.system.module.Module.set('$name', '$type');
        }

}

