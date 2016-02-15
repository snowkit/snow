package snow.types;


#if macro
    import haxe.macro.Expr;
#end

/**
    The snow.types.Config class holds static variables 
    containing the currently configured modules and types
    that are configured by snow.Set at the initialization macro context.
*/
@:noCompletion
class Config {
    
    public static var app_runtime : String #if (!macro && !display) = snow.types.Config.get_runtime() #end;
    public static var app_config : String #if (!macro && !display) = snow.types.Config.get_config() #end;
    public static var app_ident : String #if (!macro && !display) = snow.types.Config.get_ident() #end;
    public static var app_main : String #if (!macro && !display) = snow.types.Config.get_main() #end;

    public static var module_assets : String #if (!macro && !display) = snow.types.Config.get_module_assets() #end;
    public static var module_audio : String #if (!macro && !display) = snow.types.Config.get_module_audio() #end;
    public static var module_io : String #if (!macro && !display) = snow.types.Config.get_module_io() #end;

    public static var extensions : Array<String> #if (!macro && !display) = snow.types.Config.get_extensions() #end;

    #if (!display || !macro) 
        macro static function get_runtime():Expr return macro $v{snow.types.Config.app_runtime};
        macro static function get_config():Expr return macro $v{snow.types.Config.app_config};
        macro static function get_ident():Expr return macro $v{snow.types.Config.app_ident};
        macro static function get_main():Expr return macro $v{snow.types.Config.app_main};

        macro static function get_module_assets():Expr return macro $v{snow.types.Config.module_assets};
        macro static function get_module_audio():Expr return macro $v{snow.types.Config.module_audio};
        macro static function get_module_io():Expr return macro $v{snow.types.Config.module_io};

        macro static function get_extensions():Expr return macro $v{ ${snow.types.Config.extensions} };
    #end

} //Config