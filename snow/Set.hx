package snow;

#if macro
    import haxe.macro.Compiler;
    import haxe.macro.Context;
    import haxe.macro.Expr;
    import haxe.macro.ExprTools;
    import haxe.macro.TypeTools;
    import haxe.macro.Type;
#end

@:allow(snow.types.Config)
class Set {

    //Configs

        //set

            macro static function ident(_value:String) {
                // Context.warning('ident: $_value', Context.currentPos());
                snow.types.Config.app_ident = _value;
                return macro {};
            } //ident

            macro static function config(_value:String) {
                // Context.warning('config: $_value', Context.currentPos());
                snow.types.Config.app_config = _value;
                return macro {};
            } //config

            macro static function main(_value:String) {
                // Context.warning('main: $_value', Context.currentPos());
                Compiler.keep(_value);
                snow.types.Config.app_main = _value;
                return macro {};
            }

            macro static function runtime(_value:String) {
                // Context.warning('runtime: $_value', Context.currentPos());
                Compiler.keep(_value);
                snow.types.Config.app_runtime = _value;
                return macro {};
            }

            macro static function assets(_value:String) {
                // Context.warning('assets: $_value', Context.currentPos());
                Compiler.keep(_value);
                snow.types.Config.module_assets = _value;
                return macro {};
            }

            macro static function audio(_value:String) {
                // Context.warning('audio: $_value', Context.currentPos());
                Compiler.keep(_value);
                snow.types.Config.module_audio = _value;
                return macro {};
            }

            macro static function io(_value:String) {
                // Context.warning('io: $_value', Context.currentPos());
                Compiler.keep(_value);
                snow.types.Config.module_io = _value;
                return macro {};
            }
            
    //Extensions

        macro public function ext(_extension_type:String) {
            // Context.warning('ext: $_extension_type', Context.currentPos());

            Compiler.keep(_extension_type);

            if(snow.types.Config.extensions == null) snow.types.Config.extensions = [];
            if(snow.types.Config.extensions.indexOf(_extension_type) == -1) {
                snow.types.Config.extensions.push(_extension_type);
            }

            return macro null;

        } //ext

} //Set

