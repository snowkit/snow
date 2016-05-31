package snow.types;

#if macro

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Type;
import haxe.macro.TypeTools;

@:noCompletion
class TypeCreate {

    static public function makeTypedef(_source : String, _pos : Position) : TypeDefinition {
        var _dest : Array< String > = switch(_source) {
            case 'UserConfig':      [snow.types.Config.app_main, "UserConfig"];
            case 'RuntimeConfig':   [snow.types.Config.app_runtime, "RuntimeConfig"];
            case 'FileHandle':      [snow.types.Config.module_io, "FileHandle"];
            case 'AudioHandle':     [snow.types.Config.module_audio, "AudioHandle"];
            case 'WindowHandle':    [snow.types.Config.app_runtime, "WindowHandle"];
            case 'AppHost':         [snow.types.Config.app_main];
            case 'AppRuntime':      [snow.types.Config.app_runtime];
            case 'ModuleIO':        [snow.types.Config.module_io];
            case 'ModuleAudio':     [snow.types.Config.module_audio];
            case 'ModuleAssets':    [snow.types.Config.module_assets];
            case _: return null;
        }

        var _path = _dest[0].split('.');

        var _name = _path.pop();

        var t = ComplexType.TPath({
            sub: if (_dest.length > 1) _dest[1] else null,
            name: _name,
            pack: _path
        });

        return {
            pack: [], meta: [], params: [], fields: [],
            name: '${_source}Def',
            pos: _pos, isExtern: false,
            kind: TDAlias(t),
        };
    }

    static public function build() {

        var _pos = Context.currentPos();
        var _localtype = Context.getLocalType();

        var _source = switch(_localtype) {
            case TInst(_, [TInst(_.get() => { kind: KExpr({expr: EConst(CString(s))}) },_)]):
                s;
            case _: Context.fatalError("Error creating type!", _pos);
        }

        var td = makeTypedef(_source, _pos);
        Context.defineType(td);

        return null;

    } //build

    static public function buildConfig() {
        var types = [];

        var _pos = Context.currentPos();

        types.push(makeTypedef("UserConfig", _pos));
        types.push(makeTypedef("RuntimeConfig", _pos));
        types.push(makeTypedef("WindowHandle", _pos));
        types.push(makeTypedef("AppHost", _pos));
        types.push(makeTypedef("AppRuntime", _pos));
        types.push(makeTypedef("ModuleIO", _pos));
        types.push(makeTypedef("ModuleAudio", _pos));
        types.push(makeTypedef("ModuleAssets", _pos));
        types.push(makeTypedef("FileHandle", _pos));

        var mpath = Context.getLocalModule();
        Context.defineModule(mpath, types);

        return macro : Void;
    }

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