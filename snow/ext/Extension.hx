package snow.extension;

#if macro

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
import haxe.macro.TypeTools;

#end

class Extension {

#if macro

    public static var ext_list:Array<String> = [];//new Map();

    macro public function use( name:String ) {

        var types = Context.getModule(name);
            types = types.map(function(t){
                return Context.follow(t);
            });

        if(ext_list.indexOf(name) == -1) {
            ext_list.push(name);
        }

        return macro null;

    } //set

#end

//code facing

    macro public static function list() : haxe.macro.Expr {
        return macro $v{ ${ext_list} };
    }


} //Extension

