
import snow.Snow;

import snow.modules.opengl.GL;

import snow.api.buffers.Uint8Array;
import snow.api.buffers.Float32Array;

import snow.system.audio.Sound;
import snow.system.window.Window;

import snow.types.Types;
import snow.api.Debug.*;

class Main extends snow.App.AppFixedTimestep {

    var imageUniform:GLUniformLocation;
    var modelViewMatrixUniform:GLUniformLocation;
    var projectionMatrixUniform:GLUniformLocation;
    var shaderProgram:GLProgram;
    var texCoordAttribute:Int;
    var texCoordBuffer:GLBuffer;
    var vertexAttribute:Int;
    var vertexBuffer:GLBuffer;
    var textures: Array<GLTexture>;
    var current_texture : GLTexture = null;
    var tex_index : Int = 0;
    var files : Array<String>;

    var size : Int = 128;
    var texture_time : Float = 1.0;
    var positionX : Float = 0;
    var positionY : Float = 0;
    var dirX : Float = 1;
    var speed : Float = 100;

    var projectionMatrix : Float32Array;
    var modelViewMatrix : Float32Array;

        //left or right pan?
    var left : Bool = false;

    override function config( config:AppConfig ) : AppConfig {

            //make sure the config window values are sound
        assertnull(config.runtime.window);
        assertnull(config.runtime.window.width);
        assertnull(config.runtime.window.height);

            //here we can change the config.window and config.runtime values
            //before they are used by the framework, i.e verifying the runtime config values
            //and rejecting/updating invalid ones
        config.window.width = Std.int(config.runtime.window.width);
        config.window.height = Std.int(config.runtime.window.height);

        return config;

    } //config

    override function onevent( _event:SystemEvent ) {

        if(_event.type == SystemEventType.file) {
            var type = _event.file.type;
            log('File event type:${type}, path:${_event.file.path} ts:${_event.file.timestamp}');
        }

    } //on_event

    override function ready() {

        log('/ HOST / ready');

        log(GL.getContextAttributes());
        log("app config is loaded as : " + app.config.runtime );

        if(app.config.runtime.size != null) size = app.config.runtime.size;
        if(app.config.runtime.movespeed != null) speed = app.config.runtime.movespeed;
        if(app.config.runtime.texture_time != null) texture_time = app.config.runtime.texture_time;
        if(app.config.runtime.timescale != null) timescale = app.config.runtime.timescale;

        var dcount : Int = app.windowing.display_count();
        log('A total of ${dcount} displays were found');
        for(i in 0 ... dcount) {
            var bounds = app.windowing.display_bounds(i);
            var name = app.windowing.display_name(i);
            log('display ${i}, name: ${name} bounds: ${bounds} modes:' );

                //get list of modes for this display
            var modecount = app.windowing.display_mode_count(i);

            var modes = 'modes ';
            for(j in 0 ... modecount) {
                var mode = app.windowing.display_mode(i,j);
                modes += ' | ${mode.width} x ${mode.height}  @  ${mode.refresh_rate}hz';
            }

            log(modes);

        }

        log("desktop native resolution of primary display : " + app.windowing.display_native_mode(0) );
        log("OpenGL reports version " + GL.versionString());
        // log("OpenGL reports extensions " + GL.getSupportedExtensions());

        initializeShaders();
        createBuffers();

        log("done with shaders and buffers");

        textures = [];

        files = [
            'assets/test.bmp',
            'assets/test.gif',
            'assets/test.jpg',
            'assets/test.png',
            'assets/test.psd',
            'assets/test.tga',
        ];

        for(f in files) {
            app.assets.image(f)
                .then(
                    function(asset:AssetImage){
                        if(asset != null) {
                            log('loaded $f with ${asset.image.width}x${asset.image.height}x${asset.image.bpp} (source bpp:${asset.image.bpp_source}) mem:${asset.image.pixels.length}');
                            textures.push( createTexture( asset ) );
                            if(current_texture == null) {
                                current_texture = textures[0];
                            }
                        }
                    }
                );
        }

            //this is temp testing, just hook into the window render directly
        app.window.onrender = onrender;

        next_tex_tick = texture_time;

        positionY = (app.window.height - size) / 2;

        app.audio.create("assets/sound.pcm", 'sound1');
        app.audio.create("assets/sound.wav", 'wav');

        app.audio.create("assets/200308__liveware__sony-nex-7-double-shutter.ogg", 'shutter').then(function(sound:Sound){
            log('shutter sound / loaded');
            sound.on('end', function(_) {
                log('shutter / on end!');
            });
        });

        app.audio.create("assets/244028__lennyboy__rain001.ogg", 'rain', true).then(function(sound:Sound) {

            log('rain sound / loaded, looping');
            sound.loop();

            sound.on('end', function(_){
                log('rain sound / loop end, restart');
            });

        });

        #if desktop
            app.io.module.watch_add('assets/');
        #end

        app.window.onevent = function(e:WindowEvent){
            #if web
            if(e.type == WindowEventType.focus_lost) {
                app.freeze = true;
            } else if(e.type == WindowEventType.focus_gained) {
                app.freeze = false;
            }
            #end
        }

    } //ready

        //default is true in config
    var vsync = true;
        //default is shown obv
    var cursor = true;

    var window2 : Window;
    var loope : Bool = false;

    var showing_keyboard : Bool = false;

    override function onkeydown( keycode:Int, scancode:Int,_,_,_,_ ) {

        // log('key down : $keycode / scan code : $scancode / scan name : ${Scan.name(scancode)}');

        if(keycode == Key.enter && showing_keyboard) {
            trace("hiding keyboard");
            app.input.module.text_input_stop();
            showing_keyboard = false;
        }

            //console scan code should be universally next to 1
        if(keycode == Key.key_e) {
            app.audio.play('shutter');
        }

        if(keycode == Key.key_l) {
            loope = !loope;
            if(loope) {
                app.audio.loop('shutter');
            } else {
                app.audio.stop('shutter');
            }
        }

        if(keycode == Key.key_h) {
            if(window2 != null && window2.handle != null) {
                if(window2.closed) {
                    window2.show();
                } else {
                    window2.close();
                }
            }
        }

        if(keycode == Key.key_q) {
            left = !left;

            app.audio.pan('shutter', left ? -1 : 1);
            app.audio.play('shutter');

        }

        if(keycode == Key.key_w) {
            app.audio.pitch('wav', 1.5);
            app.audio.play('wav');

            if(window2 != null) {
                window2.destroy();
                window2 = null;
            }

            window2 = app.windowing.create({
                resizable : true,
                width : 200+Std.random(200), height:200+Std.random(200),
                title:'window ' + app.time
            });
        }

        if(keycode == Key.key_p) {
            app.audio.volume('rain', 0.3+(Math.random()));
            app.audio.toggle('rain');
        }

        if(keycode == Key.key_m) {
            cursor = !cursor;
            app.windowing.enable_cursor( cursor );
            log("cursor enabled : " + cursor );
        }

        if(keycode == Key.key_v) {
            vsync = !vsync;
            app.windowing.enable_vsync( vsync );
            log("vsync enabled : " + vsync );
        }

        if(keycode == Key.key_b) {
            var w = app.windowing.create({
                resizable : true, borderless:true,
                width : 200, height:200,
                x : 0x1FFF0000, y:0x1FFF0000,
                title:'window ' + app.time
            });
        }

        if(keycode == Key.key_r) {
            app.audio.position('rain', 0);
            log('rain sound / reset');
        }

        if(keycode == Key.key_u) {
            app.io.url_open("http://snowkit.org/");
        }

        if(keycode == Key.key_o) {
            #if desktop
                app.io.module.dialog_open('Select a thing', [{extension:'txt', desc:'text files'}, {extension:'cpp', desc:'cpp files'}]);
                log(app.io.module.dialog_save('Save a thing', {extension:'flow'}));
                log(app.io.module.dialog_folder());
            #end
        }

        if(keycode == Key.key_t) {
            var rainsound = app.audio.get('rain');
            var t = (rainsound.duration*0.75);
            rainsound.position = t;
            log('set to ${rainsound.duration}*0.75 | music 75% ' + t);
        }

        if(keycode == Key.backquote) {
            app.audio.pitch('wav', 0.5);
            app.audio.play('wav');
        }

    } //onkeydown

    override function onkeyup( keycode:Int, scancode:Int,_, mod:ModState, _,_ ) {

        // log('key up : $keycode / scan code : $scancode / scan name : ${Scan.name(scancode)}');

            //alt enter to toggle fullscreen test
        if( keycode == Key.enter && mod.alt ) {
            app.window.fullscreen = !app.window.fullscreen;
        }

            //ctrl enter to toggle pointer lock test
        if( keycode == Key.enter && mod.ctrl ) {
            app.window.grab = !app.window.grab;
        }

        if( keycode == Key.escape ) {
            app.shutdown();
        }

        if( keycode == Key.key_c ) {
            noclamp = !noclamp;
            log("no clamp: " + noclamp);
        }

    } //onkeyup

    var noclamp : Bool = false;

    override public function ontextinput( text:String, start:Int, length:Int, type:TextEventType, timestamp:Float, window_id:Int ) {

        // log('text event; text:$text / start: $start / length: $length / type:$type / timestamp:${timestamp} / window: ${window_id}');

    } //ontextinput

    override function ontouchdown( x:Float, y:Float, touch_id:Int, timestamp:Float ) {
        // log('touch down; $x / $y / $touch_id / $timestamp');
    }

    override function ontouchup( x:Float, y:Float, touch_id:Int, timestamp:Float ) {
        // log('touch up; $x / $y / $touch_id / $timestamp');
        app.audio.play('sound1');

        // if(touch_id > 1) {
            // app.io.url_open("http://snowkit.org/");
        // }
    }

    override function ontouchmove( x:Float, y:Float, dx:Float, dy:Float, touch_id:Int, timestamp:Float ) {

        // log('touch move; $x / $y / $dx / $dy / $touch_id / $timestamp ');

            //touches are in NDC, so we convert to window size
        positionX = (app.window.width*x) - (size/2);
        positionY = (app.window.height*y) - (size/2);
        phys_posx = positionX;

            //top 10% of the screen shows keyboard
        if(y > 0.9) {
            // if(!showing_keyboard){
                trace("showing keyboard");
                var tenth = Std.int(app.window.height*0.1);
                app.input.module.text_input_rect(0, app.window.height - tenth, app.window.width, tenth );
                app.input.module.text_input_start();
                showing_keyboard = true;
            // }
        }

    } //ontouchmove

    override function onmousemove( x:Int, y:Int, xrel:Int, yrel:Int, timestamp:Float, window_id:Int ) {

        // log('move $x / $y / $xrel / $yrel / $timestamp / $window_id');

        if(app.input.keydown(Key.space)) {
            positionY = y - (size/2);
            positionX = x - (size/2);
            phys_posx = positionX;
        }

    } //onmousemove

    override function onmouseup( x:Int, y:Int, button:Int, timestamp:Float, window_id:Int ) {

        // log('mouse up $x $y $button $timestamp $window_id');

        #if !mobile
            positionY = y - (size/2);
            positionX = x - (size/2);
            phys_posx = positionX;
        #end

    } //onmouseup

    override function onmousedown( x:Int, y:Int, button:Int, timestamp:Float, window_id:Int ) {
        // log('mouse down $x $y $button $timestamp $window_id');
    } //onmousedown

    override function onmousewheel(  x:Int, y:Int, timestamp:Float, window_id:Int ) {
        // log('mouse wheel $x $y $timestamp $window_id');
    } //onmousewheel


    override function ongamepadaxis( gamepad:Int, axis:Int, value:Float, timestamp:Float ) {
        if(Math.abs(value) > 0.2 || noclamp) {
            // log('axis; device: ${gamepad}, axis: ${axis}, value: ${value} timestamp: ${timestamp}');
            if(axis == 1) {
                positionY += value * 2 * speed * delta_time;
            }
        }
    } //ongamepadaxis

    override function ongamepadup( gamepad:Int, button:Int, value:Float, timestamp:Float ) {
        log('button up; device: ${gamepad}, button: ${button} value: ${value} timestamp:  ${timestamp}');
    } //ongamepadbuttonup

    override function ongamepaddown( gamepad:Int, button:Int, value:Float, timestamp:Float ) {
        log('button down; device: ${gamepad}, button: ${button} value: ${value} timestamp:  ${timestamp}');
    } //ongamepadbuttondown

    override function ongamepaddevice( gamepad:Int, id:String, type:GamepadDeviceEventType, timestamp:Float ) {
        log('device event; device: ${gamepad}, ${id}, type: ${type} timestamp: ${timestamp}');
    } //ongamepaddevice


    var next_tex_tick : Float = 0;
    var phys_posx : Float = 0;

    override function update( delta:Float ) {

        positionX = phys_posx;

        phys_posx += (speed * dirX * delta);

        if(current_texture != null) {

            if(current_time > next_tex_tick) {

                next_tex_tick = current_time + texture_time;

                tex_index++;

                if(tex_index == textures.length) {
                    tex_index = 0;
                }

                current_texture = textures[tex_index];

            }

        } else {

            next_tex_tick = current_time + texture_time;

        } //current_texture != null

        if(app.input.keyreleased(Key.space)) {
            log('space released');
        }

        if(app.input.keypressed(Key.space)) {
            log('space pressed');
        }

        if(app.input.mousereleased(3)) {
            log('right mouse released');
        }

        if(app.input.mousepressed(3)) {
            log('right mouse pressed');
        }

        if(app.input.mousedown(2)) {
            log('mid mouse down');
        }

    } //update


    function onrender( window:Window ) {

        //"update"
        //this is to test the fix-your-timestep thing
        //essentially app.frame_time is a fixed timestep, alpha time is how far we are between a frame and the next,
        //allowing us to render the mid frame placement smoothly

        var prevx = positionX;

        positionX = (phys_posx * alpha) + prevx * ( 1.0 - alpha );

        if(positionX >= (app.window.width - size)) {
            positionX = (app.window.width - size);
            dirX = -1;
        } else if(positionX <= 0) {
            positionX = 0;
            dirX = 1;
        }

        // Sys.println('alpha:${alpha} dt:${delta_time} delta_sim:${delta_sim}');

        render();

    } //onrender hook

    function createTexture( asset:AssetImage ):GLTexture {

        var texture = GL.createTexture();

            GL.bindTexture (GL.TEXTURE_2D, texture);
            GL.texImage2D (GL.TEXTURE_2D, 0, GL.RGBA, asset.image.width, asset.image.height, 0, GL.RGBA, GL.UNSIGNED_BYTE, asset.image.pixels );
            GL.texParameteri (GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.NEAREST);
            GL.texParameteri (GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.NEAREST);
            GL.bindTexture (GL.TEXTURE_2D, null);

        return texture;

    } //createTexture

    function initializeShaders ():Void {

        var vertexShaderSource = "";

        #if (android || web)
            vertexShaderSource += "precision mediump float;";
        #end

        // #if (desktop)
        //     vertexShaderSource += '#version 140\n';
        // #end

        vertexShaderSource +=
            "
            attribute vec3 aVertexPosition;
            attribute vec2 aTexCoord;
            varying vec2 vTexCoord;

            uniform mat4 uModelViewMatrix;
            uniform mat4 uProjectionMatrix;

            void main(void) {
                vTexCoord = aTexCoord;
                gl_Position = uProjectionMatrix * uModelViewMatrix * vec4 (aVertexPosition, 1.0);
            }";

        log("about to create a shader");
        var vertexShader = GL.createShader (GL.VERTEX_SHADER);


            GL.shaderSource(vertexShader, vertexShaderSource);
            GL.compileShader (vertexShader);

        log("shader created without issue");

        if (GL.getShaderParameter(vertexShader, GL.COMPILE_STATUS) == 0) {

            var shader_log = GL.getShaderInfoLog(vertexShader);
            throw "Error compiling vertex shader // " + shader_log;

        }

        var fragmentShaderSource = "";

        #if (mobile || web)
            fragmentShaderSource += "precision mediump float;";
        #end

        // #if (desktop)
        //     fragmentShaderSource += '#version 140\n';
        // #end

        fragmentShaderSource +=
            "varying vec2 vTexCoord;
            uniform sampler2D uImage0;

            void main(void) {
                gl_FragColor = texture2D(uImage0, vTexCoord);
            }";

        var fragmentShader = GL.createShader (GL.FRAGMENT_SHADER);
            GL.shaderSource (fragmentShader, fragmentShaderSource);
            GL.compileShader (fragmentShader);

        if (GL.getShaderParameter (fragmentShader, GL.COMPILE_STATUS) == 0) {

            var shader_log = GL.getShaderInfoLog(fragmentShader);
            throw "Error compiling fragment shader" + shader_log;

        }

        shaderProgram = GL.createProgram ();

        GL.attachShader (shaderProgram, vertexShader);
        GL.attachShader (shaderProgram, fragmentShader);
        GL.linkProgram (shaderProgram);

        if (GL.getProgramParameter (shaderProgram, GL.LINK_STATUS) == 0) {

            throw "Unable to initialize the shader program.";

        }

        vertexAttribute = GL.getAttribLocation (shaderProgram, "aVertexPosition");
        texCoordAttribute = GL.getAttribLocation (shaderProgram, "aTexCoord");
        projectionMatrixUniform = GL.getUniformLocation (shaderProgram, "uProjectionMatrix");
        modelViewMatrixUniform = GL.getUniformLocation (shaderProgram, "uModelViewMatrix");
        imageUniform = GL.getUniformLocation (shaderProgram, "uImage0");

    } //initializeShaders

    function createBuffers ():Void {

        var vertices = [

            size, size, 0,
            0, size, 0,
            size, 0, 0,
            0, 0, 0

        ];

        vertexBuffer = GL.createBuffer ();
        GL.bindBuffer (GL.ARRAY_BUFFER, vertexBuffer);
        GL.bufferData(GL.ARRAY_BUFFER, new Float32Array(vertices), GL.STATIC_DRAW);
        GL.bindBuffer (GL.ARRAY_BUFFER, null);

        var texCoords = [

            1, 1,
            0, 1,
            1, 0,
            0, 0,

        ];

        texCoordBuffer = GL.createBuffer ();
        GL.bindBuffer (GL.ARRAY_BUFFER, texCoordBuffer);
        GL.bufferData(GL.ARRAY_BUFFER, new Float32Array(texCoords), GL.STATIC_DRAW);
        GL.bindBuffer (GL.ARRAY_BUFFER, null);

    } //createBuffers

    function render(){

        GL.viewport (0, 0, app.window.width, app.window.height);

        GL.clearColor(1.0, 0.5, 0.2, 1.0);
        GL.clear(GL.COLOR_BUFFER_BIT);

        projectionMatrix = createOrthoMatrix( 0, app.window.width, app.window.height, 0, 1000, -1000 );
        modelViewMatrix = create2DMatrix( positionX, positionY, 1, 0 );

        GL.useProgram (shaderProgram);
        GL.enableVertexAttribArray (vertexAttribute);
        GL.enableVertexAttribArray (texCoordAttribute);

        if(current_texture != null) {
            GL.activeTexture (GL.TEXTURE0);
            GL.bindTexture (GL.TEXTURE_2D, current_texture);
        }

        GL.bindBuffer(GL.ARRAY_BUFFER, vertexBuffer);
        GL.vertexAttribPointer(vertexAttribute, 3, GL.FLOAT, false, 0, 0);
        GL.bindBuffer(GL.ARRAY_BUFFER, texCoordBuffer);
        GL.vertexAttribPointer(texCoordAttribute, 2, GL.FLOAT, false, 0, 0);

        GL.uniformMatrix4fv( projectionMatrixUniform, false, projectionMatrix );
        GL.uniformMatrix4fv( modelViewMatrixUniform, false, modelViewMatrix );
        GL.uniform1i( imageUniform, 0 );

        GL.drawArrays (GL.TRIANGLE_STRIP, 0, 4);

        GL.bindBuffer (GL.ARRAY_BUFFER, null);
        GL.bindTexture (GL.TEXTURE_2D, null);

        GL.disableVertexAttribArray (vertexAttribute);
        GL.disableVertexAttribArray (texCoordAttribute);
        GL.useProgram (null);

    } //render


    function createOrthoMatrix( x0:Float, x1:Float,  y0:Float, y1:Float, zNear:Float, zFar:Float ) : Float32Array {

        var sx = 1.0 / (x1 - x0);
        var sy = 1.0 / (y1 - y0);
        var sz = 1.0 / (zFar - zNear);

        return new Float32Array([
            2.0*sx,         0,              0,                  0,
            0,              2.0*sy,         0,                  0,
            0,              0,              -2.0*sz,            0,
            - (x0+x1)*sx,   - (y0+y1)*sy,   - (zNear+zFar)*sz,  1,
        ]);

    } //createOrthoMatrix

    function create2DMatrix( x:Float, y:Float, scale:Float = 1, rotation:Float = 0 ) {

        var theta = rotation * Math.PI / 180.0;
        var c = Math.cos(theta);
        var s = Math.sin(theta);

        return new Float32Array([
            c*scale,  -s*scale,     0,      0,
            s*scale,  c*scale,      0,      0,
            0,        0,            1,      0,
            x,        y,            0,      1
        ]);

    } //create2DMatrix

} //Main
