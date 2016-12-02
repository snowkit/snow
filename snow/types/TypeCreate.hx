package snow.types;

#if macro

import haxe.macro.Expr;
import haxe.macro.Context;
import haxe.macro.Type;
import haxe.macro.TypeTools;

@:noCompletion
class TypeCreate {

    static var errors = [
        "UserConfig"    => "snow.Set.main",
        "RuntimeConfig" => "snow.Set.runtime",
        "WindowHandle"  => "snow.Set.runtime",
        "FileHandle"    => "snow.Set.io",
        "AudioHandle"   => "snow.Set.audio",
        "AppHost"       => "snow.Set.main",
        "AppRuntime"    => "snow.Set.runtime",
        "ModuleIO"      => "snow.Set.io",
        "ModuleAudio"   => "snow.Set.audio",
        "ModuleAssets"  => "snow.Set.assets",
    ];

    static public function build(_lookup:String) {

        var _source_name = '';
        var _source_pack = null;
        var _source_sub = null;

        inline function split(_s:String, _set_sub:Bool=true) {
            if(_s == null) return false;
            _source_pack = _s.split('.');
            _source_name = _source_pack.pop();
            _source_sub = _set_sub ? _lookup : null;
            return true;
        }

        var _found = switch(_lookup) {
            case 'UserConfig':      split(snow.types.Config.app_main);
            case 'RuntimeConfig':   split(snow.types.Config.app_runtime);
            case 'WindowHandle':    split(snow.types.Config.app_runtime);
            case 'FileHandle':      split(snow.types.Config.module_io);
            case 'AudioHandle':     split(snow.types.Config.module_audio);

            case 'AppHost':         split(snow.types.Config.app_main, false);
            case 'AppRuntime':      split(snow.types.Config.app_runtime, false);
            case 'ModuleIO':        split(snow.types.Config.module_io, false);
            case 'ModuleAudio':     split(snow.types.Config.module_audio, false);
            case 'ModuleAssets':    split(snow.types.Config.module_assets, false);
            case _:                 false;
        }

        if(!_found) {
            var err = if(!errors.exists(_lookup)) ''; else {
                '\nAre you missing a `--macro ${errors.get(_lookup)}("some.package.Class")` somewhere?';
            }

            Context.fatalError('snow: Type lookup failed for `$_lookup`$err', Context.currentPos());
        }

        Context.defineType({
            name: '$_lookup',
            pack: ['snow','types','user'],
            meta: [], params: [], fields: [], pos: Context.currentPos(), isExtern: false,
            kind: TDAlias(TPath({ name: _source_name, sub: _source_sub, pack:_source_pack })),
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