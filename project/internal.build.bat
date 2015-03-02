
REM This file is used for continuous integration only and shouldn't be called directly.
echo "snow; Don't run this script directly, read inside the file for why."
REM To build manually read the snow docs and run `flow build --options` as usual.
REM https://underscorediscovery.github.io/snow/guide/native-layer.html

git submodule update --init

if defined SNOW_BUILD_ARCH_32 (

    echo "snow; build; running arch 32..."
    haxelib run flow build --project project/snow.flow --arch 32 --d static_link --log %SNOW_BUILD_LOG_LEVEL%
    haxelib run flow build --project project/snow.flow --arch 32 --d snow_dynamic_link --log %SNOW_BUILD_LOG_LEVEL%

)