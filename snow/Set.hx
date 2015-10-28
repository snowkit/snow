package snow;

#if macro
    import haxe.macro.Compiler;
    import haxe.macro.Context;
    import haxe.macro.Expr;
    import haxe.macro.ExprTools;
    import haxe.macro.TypeTools;
    import haxe.macro.Type;
#end

@:allow(snow.types.TypeNames)
class Set {

    //Configs

        //set

            macro static function ident(_value:String) {
                snow.types.TypeNames.app_ident = _value;
                return macro {};
            } //ident

            macro static function config(_value:String) {
                snow.types.TypeNames.app_config = _value;
                return macro {};
            } //config

            macro static function main(_value:String) {
                // Context.warning('main: $_value', Context.currentPos());
                Compiler.keep(_value);
                snow.types.TypeNames.app_main = _value;
                return macro {};
            }

            macro static function runtime(_value:String) {
                // Context.warning('runtime: $_value', Context.currentPos());
                Compiler.keep(_value);
                snow.types.TypeNames.app_runtime = _value;
                return macro {};
            }

            macro static function assets(_value:String) {
                // Context.warning('assets: $_value', Context.currentPos());
                Compiler.keep(_value);
                snow.types.TypeNames.module_assets = _value;
                return macro {};
            }

            macro static function audio(_value:String) {
                // Context.warning('audio: $_value', Context.currentPos());
                Compiler.keep(_value);
                snow.types.TypeNames.module_audio = _value;
                return macro {};
            }

            macro static function io(_value:String) {
                Compiler.keep(_value);
                snow.types.TypeNames.module_io = _value;
                return macro {};
            }
            
    //Extensions

} //Set

