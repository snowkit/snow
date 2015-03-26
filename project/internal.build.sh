#!/bin/bash
#fail on errors
set -e

#This file is used for continuous integration only and shouldn't be called directly.
echo "snow; Don't run this script directly, read inside the file for why."
#To build manually read the snow docs and run `flow build --options` as usual.
# https://underscorediscovery.github.io/snow/guide/native-layer.html

#64 bit if specified
if [ -n "$SNOW_BUILD_ARCH_64" ]
    then

    echo "snow; build; running arch 64..."
    haxelib run flow build --clean --project project/snow.flow --arch 64 --d static_link --log "$SNOW_BUILD_LOG_LEVEL"
    haxelib run flow build --clean --project project/snow.flow --arch 64 --d snow_dynamic_link --log "$SNOW_BUILD_LOG_LEVEL"

fi

if [ -n "$SNOW_BUILD_ARCH_32" ]
then

    echo "snow; build; running arch 32..."
    haxelib run flow build --clean --project project/snow.flow --arch 32 --d static_link --log "$SNOW_BUILD_LOG_LEVEL"
    haxelib run flow build --clean --project project/snow.flow --arch 32 --d snow_dynamic_link --log "$SNOW_BUILD_LOG_LEVEL"

fi

if [ -n "$SNOW_BUILD_ANDROID" ]
then

    echo "snow; build; running android archs armv6, armv7, x86 ..."
    haxelib run flow build android --clean --project project/snow.flow --arch armv6 --d snow_dynamic_link --log "$SNOW_BUILD_LOG_LEVEL"
    haxelib run flow build android --clean --project project/snow.flow --arch armv7 --d snow_dynamic_link --log "$SNOW_BUILD_LOG_LEVEL"
    haxelib run flow build android --clean --project project/snow.flow --arch x86 --d snow_dynamic_link --log "$SNOW_BUILD_LOG_LEVEL"

fi

if [ -n "$SNOW_BUILD_IOS" ]
then

    echo "snow; build; running android archs armv6, armv7, armv7s, arm64, sim, sim64 ..."
    haxelib run flow build ios --clean --project project/snow.flow --archs armv6,armv7,armv7s,arm64,sim,sim64 --d static_link --log "$SNOW_BUILD_LOG_LEVEL"

fi


if [ -n "$SNOW_BUILD_PACKAGE_BINARY" ]
then


SNOW_BUILD_DEST_PRE="latest"

    if [ "$BUILDKITE_BRANCH" -ne "master" ]
    then
        SNOW_BUILD_DEST_PRE="$BUILDKITE_BRANCH"
    fi

    mkdir -p ndll/all/ndll
    mkdir -p ndll/all/ndll/Android
    mkdir -p ndll/all/ndll/iPhone
    mkdir -p ndll/all/ndll/Mac
    mkdir -p ndll/all/ndll/Mac64
    mkdir -p ndll/all/ndll/Linux
    mkdir -p ndll/all/ndll/Linux64
    mkdir -p ndll/all/ndll/Windows
    mkdir -p ndll/all/ndll/Windows64

    buildkite-agent build-artifact download "ndll/*" ndll/all/ndll
    buildkite-agent build-artifact download "ndll\*" ndll/all/ndll

    cd ndll/all/ndll
    ls

    mv ndll\\Windows\\libsnow.lib Windows/libsnow.lib
    mv ndll\\Windows\\snow.ndll Windows/snow.ndll
    mv ndll\\Windows64\\libsnow.lib Windows64/libsnow.lib
    mv ndll\\Windows64\\snow.ndll Windows64/snow.ndll

    cd ..

    zip -r "$SNOW_BUILD_DEST_PRE".all.zip ndll/ -x ".*" -x "*/.*"
    zip -r "$SNOW_BUILD_DEST_PRE".mac.zip ndll/Mac ndll/Mac64 -x ".*" -x "*/.*"
    zip -r "$SNOW_BUILD_DEST_PRE".linux.zip ndll/Linux ndll/Linux64 -x ".*" -x "*/.*"
    zip -r "$SNOW_BUILD_DEST_PRE".android.zip ndll/Android -x ".*" -x "*/.*"
    zip -r "$SNOW_BUILD_DEST_PRE".ios.zip ndll/iPhone -x ".*" -x "*/.*"
    zip -r "$SNOW_BUILD_DEST_PRE".windows.zip ndll/Windows -x ".*" -x "*/.*"
    cd ../../
    cp ndll/all/"$SNOW_BUILD_DEST_PRE".all.zip /usr/share/nginx/html/snow/"$SNOW_BUILD_DEST_PRE".all.zip
    cp ndll/all/"$SNOW_BUILD_DEST_PRE".mac.zip /usr/share/nginx/html/snow/"$SNOW_BUILD_DEST_PRE".mac.zip
    cp ndll/all/"$SNOW_BUILD_DEST_PRE".linux.zip /usr/share/nginx/html/snow/"$SNOW_BUILD_DEST_PRE".linux.zip
    cp ndll/all/"$SNOW_BUILD_DEST_PRE".android.zip /usr/share/nginx/html/snow/"$SNOW_BUILD_DEST_PRE".android.zip
    cp ndll/all/"$SNOW_BUILD_DEST_PRE".ios.zip /usr/share/nginx/html/snow/"$SNOW_BUILD_DEST_PRE".ios.zip
    cp ndll/all/"$SNOW_BUILD_DEST_PRE".windows.zip /usr/share/nginx/html/snow/"$SNOW_BUILD_DEST_PRE".windows.zip

    echo "snow; build; done package"

fi

