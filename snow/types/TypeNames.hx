package snow.types;

#if macro
    import haxe.macro.Expr;
#end

@:noCompletion
class TypeNames {
    
    public static var app_runtime : String #if (!macro && !display) = snow.types.TypeNames.get_runtime() #end;
    public static var app_config : String #if (!macro && !display) = snow.types.TypeNames.get_config() #end;
    public static var app_ident : String #if (!macro && !display) = snow.types.TypeNames.get_ident() #end;
    public static var app_main : String #if (!macro && !display) = snow.types.TypeNames.get_main() #end;

    public static var module_assets : String #if (!macro && !display) = snow.types.TypeNames.get_module_assets() #end;
    public static var module_audio : String #if (!macro && !display) = snow.types.TypeNames.get_module_audio() #end;
    public static var module_io : String #if (!macro && !display) = snow.types.TypeNames.get_module_io() #end;

    #if (!display || !macro) 
        macro static function get_runtime():Expr return macro $v{snow.types.TypeNames.app_runtime};
        macro static function get_config():Expr return macro $v{snow.types.TypeNames.app_config};
        macro static function get_ident():Expr return macro $v{snow.types.TypeNames.app_ident};
        macro static function get_main():Expr return macro $v{snow.types.TypeNames.app_main};

        macro static function get_module_assets():Expr return macro $v{snow.types.TypeNames.module_assets};
        macro static function get_module_audio():Expr return macro $v{snow.types.TypeNames.module_audio};
        macro static function get_module_io():Expr return macro $v{snow.types.TypeNames.module_io};
    #end

}