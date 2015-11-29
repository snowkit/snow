package snow.types;

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Type;
import haxe.macro.TypeTools;

@:noCompletion 
class TypeCreate {

    static public function build() {

        var _pos = Context.currentPos();
        var _localtype = Context.getLocalType();

        // trace(t);
        var _source = switch(_localtype) {
            case TInst(_, [TInst(_.get() => { kind: KExpr({expr: EConst(CString(s))}) },_)]):
                s;
            case _:
                Context.fatalError("Something went wrong", _pos);
        }

        var _dest = switch(_source) {
            case 'UserConfig':      '${snow.types.TypeNames.app_main}.UserConfig';
            case 'RuntimeConfig':   '${snow.types.TypeNames.app_runtime}.RuntimeConfig';
            case 'FileHandle':      '${snow.types.TypeNames.module_io}.FileHandle';
            case 'AudioHandle':     '${snow.types.TypeNames.module_audio}.AudioHandle';
            case 'WindowHandle':    '${snow.types.TypeNames.app_runtime}.WindowHandle';
            case 'AppHost':         '${snow.types.TypeNames.app_main}';
            case 'AppRuntime':      '${snow.types.TypeNames.app_runtime}';
            case 'ModuleIO':        '${snow.types.TypeNames.module_io}';
            case 'ModuleAudio':     '${snow.types.TypeNames.module_audio}';
            case 'ModuleAssets':    '${snow.types.TypeNames.module_assets}';
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

    }
}