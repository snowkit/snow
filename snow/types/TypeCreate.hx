package snow.types;

#if macro

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Type;
import haxe.macro.TypeTools;

@:noCompletion 
class TypeCreate {

    static public function build() {

        var _pos = Context.currentPos();
        var _localtype = Context.getLocalType();

        var _source = switch(_localtype) {
            case TInst(_, [TInst(_.get() => { kind: KExpr({expr: EConst(CString(s))}) },_)]):
                s;
            case _: Context.fatalError("Error creating type!", _pos);
        }

        var _dest = switch(_source) {
            case 'UserConfig':      '${snow.types.Config.app_main}.UserConfig';
            case 'RuntimeConfig':   '${snow.types.Config.app_runtime}.RuntimeConfig';
            case 'FileHandle':      '${snow.types.Config.module_io}.FileHandle';
            case 'AudioHandle':     '${snow.types.Config.module_audio}.AudioHandle';
            case 'WindowHandle':    '${snow.types.Config.app_runtime}.WindowHandle';
            case 'AppHost':         '${snow.types.Config.app_main}';
            case 'AppRuntime':      '${snow.types.Config.app_runtime}';
            case 'ModuleIO':        '${snow.types.Config.module_io}';
            case 'ModuleAudio':     '${snow.types.Config.module_audio}';
            case 'ModuleAssets':    '${snow.types.Config.module_assets}';
            case _: return null;
        }

        // trace('$_source');
        // trace('$_dest');

        Context.defineType({
            pack: [], meta: [], params: [], fields: [],
            name: '${_source}Def',
            pos: _pos, isExtern: false,
            kind: TDAlias(TypeTools.toComplexType(Context.getType(_dest))),
        });

        return null;

    } //build

    macro public static function ext() : Array<Field> {
        
        if(snow.types.Config.extensions == null) snow.types.Config.extensions = [];
        for(_extension_type in snow.types.Config.extensions) {
            var _modules = Context.getModule(_extension_type);
                _modules = _modules.map(function(t){
                    return Context.follow(t);
                });
        }

        return Context.getBuildFields();

    }

} //TypeCreate

#end