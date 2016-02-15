
import snow.Snow;
import snow.types.Types;
import snow.api.Debug.*;
import snow.api.buffers.Float32Array;
import snow.modules.opengl.GL;

#if snowhxt import snowhxt.Snowhxt; #end

typedef UserConfig = {
    window : {
        width : Null<Int>,
        height : Null<Int>,
        fullscreen : Null<Bool>
    },
    size: Null<Int>,
    movespeed : Null<Int>,
    timescale: Null<Int>
}

class Main extends snow.App {

//app stuff

    var size : Int = 128;
    var speed : Float = 100;
    var dir_x : Float = 1;

        //position drawn at
    var render_x : Float = 0;
    var render_y : Float = 0;
        //"physics" position
    var physical_x : Float = 0;
    var window_width : Int = 640;
    var window_height : Int = 320;

    var vsync = true;

//input stuff

    var no_gamepad_deadzone : Bool = false;

    function new() {}

    override function config( config:AppConfig ) : AppConfig {

        config.window.title = 'snow / samples / basic';

        fixed_timestep = true;

            //here we can change the config.window and config.runtime values
            //before they are used by the framework, i.e verifying the runtime config values
            //and rejecting/updating invalid ones

        if(config.user.window != null) {
            if(config.user.window.width != null) config.window.width = config.user.window.width;
            if(config.user.window.height != null) config.window.height = config.user.window.height;
            if(config.user.window.fullscreen != null) config.window.fullscreen = config.user.window.fullscreen;
        }

        window_width = config.window.width;
        window_height = config.window.height;

        //If you want to test against GL 3.x+ core profile, uncomment this,
        //but note that this has system requirements obviously
        // config.render.opengl.profile = OpenGLProfile.core;

        trace(config.window);

        return config;

    } //config

    #if snowhxt var hxt : Snowhxt; #end

    override function ready() {

        log('/ HOST / ready');
        log("OpenGL reports version " + GL.versionString());

        window_width = app.runtime.window_width();
        window_height = app.runtime.window_height();
        log('window render size : ${window_width}x${window_height}');

        log('app config is loaded as : ${app.config.user}');
        log("init / shaders and buffers ");

        apply_config();
        init_shaders();
        init_buffers();

        log("init / done with shaders and buffers");

            //start mid window
        render_y = (window_width - size) / 2;

        #if snowhxt hxt = new Snowhxt(); #end

    } //ready

        //"physics" update
    override function update( delta:Float ) {

        render_x = physical_x;

        physical_x += (speed * dir_x * delta);

    } //update

    override function tick(delta:Float) {
        
        on_render_update();

        #if snowhxt hxt.update(); #end

    } //tick

    override public function onevent(event:SystemEvent) {

        // if(event.type != se_tick) trace('system event : ${event.type}');

        if(event.window != null) {
            if(event.window.type == we_size_changed||event.window.type == we_resized) {
                window_width = event.window.x;
                window_height = event.window.y;
                var _scale = app.runtime.window_device_pixel_ratio();
                trace('${event.window.type} / $_scale / size changed ${event.window.x}x${event.window.y}');
            }
        }
    }

    override public function ontextinput( text:String, start:Int, length:Int, type:TextEventType, timestamp:Float, window_id:Int ) {

        log('text event; text:$text / start: $start / length: $length / type:$type / timestamp:${timestamp} / window: ${window_id}');

    } //ontextinput

        //render update
    function on_render_update() {

        //note that the update is separated from the render rate
        //this is the fix-your-timestep implementation
        //essentially app.frame_time is a fixed timestep,
        //alpha time is how far we are between a frame and the next,
        //allowing us to render the mid frame placement smoothly

        var prev_render_x = render_x;

            //this interpolates the render position
        render_x = (physical_x * fixed_alpha) + prev_render_x * (1.0 - fixed_alpha);

        if(render_x >= (window_width - size)) {

            render_x = (window_width - size);
            dir_x = -1;

        } else if(render_x <= 0) {

            render_x = 0;
            dir_x = 1;

        }

        // Sys.println('alpha:${alpha} dt:${delta_time} delta_sim:${delta_sim}');

        draw();

    } //on_render_update

    function draw() {

        GL.viewport(0, 0, window_width, window_height);
        GL.clearColor(1.0, 1.0, 1.0, 1.0);
        GL.clear( GL.COLOR_BUFFER_BIT );

        projection = createOrthoMatrix(projection, 0, window_width, window_height, 0, 1000, -1000 );
        modelview = create2DMatrix(modelview, render_x, render_y, 1, 0 );

            //set state, update uniforms
        GL.useProgram(program);
        GL.uniformMatrix4fv( uniform_MP, false, projection );
        GL.uniformMatrix4fv( uniform_MV, false, modelview );

            //point pos to our buffer
        GL.enableVertexAttribArray( attr_pos );
        GL.bindBuffer(GL.ARRAY_BUFFER, pos_buffer);
        GL.vertexAttribPointer(attr_pos, 3, GL.FLOAT, false, 0, 0);

            //draw the buffer
        GL.drawArrays(GL.TRIANGLE_STRIP, 0, 4);

            //unset used state
        GL.bindBuffer(GL.ARRAY_BUFFER, null);
        GL.disableVertexAttribArray(attr_pos);
        
        GL.useProgram(null);

    } //draw

//Input

    var fs = false;
    var grab = false;

    override function onkeyup( keycode:Int, scancode:Int,_, mod:ModState, _,_ ) {

        // log('key up : $keycode / scan code : $scancode / scan name : ${Scan.name(scancode)}');

            //alt enter to toggle fullscreen test
        if( keycode == Key.enter && mod.alt ) {
            fs = !fs;
            app.runtime.window_fullscreen(fs);
            log('fullscreen $fs');
        }

            //ctrl enter to toggle pointer lock test
        if( keycode == Key.enter && mod.ctrl ) {
            grab = !grab;
            app.runtime.window_grab(grab);
            log('grab $grab');
        }

        if( keycode == Key.key_f ) {
            fixed_timestep = !fixed_timestep;
        }

        if( keycode == Key.key_p ) {
            app.freeze = !app.freeze;
        }

        if( keycode == Key.escape ) {
            app.shutdown();
        }

        if( keycode == Key.key_g ) {
            no_gamepad_deadzone = !no_gamepad_deadzone;
            log('gamepad no clamp: $no_gamepad_deadzone');
        }

        #if snow_native
            if(keycode == Key.key_v) {
                vsync = !vsync;
                sdl.SDL.GL_SetSwapInterval(vsync);
                log('vsync enabled : $vsync');
            }
        #end

    } //onkeyup

    override function ontouchup(x:Float, y:Float, dx:Float, dy:Float, touch_id:Int, timestamp:Float) {

        log('touch up; $x / $y / $dx / $dy / $touch_id / $timestamp ');
            //touches are normalized, so we convert to window size
        render_x = physical_x = ((window_width*x) - (size/2));
        render_y = (window_height*y) - (size/2);

    } //touchup

    override function ontouchmove( x:Float, y:Float, dx:Float, dy:Float, touch_id:Int, timestamp:Float ) {
            
        // log('touch move; $x / $y / $dx / $dy / $touch_id / $timestamp ');
            //touches are normalized, so we convert to window size
        render_x = physical_x = ((window_width*x) - (size/2));
        render_y = (window_height*y) - (size/2);

    } //ontouchmove

    override function onmousewheel( x:Float, y:Float, timestamp:Float, window_id:Int ) {

        log('mouse wheel $x / $y / $timestamp / $window_id');

    }

    override function onmousemove( x:Int, y:Int, xrel:Int, yrel:Int, timestamp:Float, window_id:Int ) {

        // log('mouse move $x / $y / $xrel / $yrel / $timestamp / $window_id');

        if(app.input.keydown(Key.space)) {
            render_x = physical_x = x - (size/2);
            render_y = y - (size/2);
        }

    } //onmousemove

    override function onmouseup( x:Int, y:Int, button:Int, timestamp:Float, window_id:Int ) {

        // log('mouse up $x $y $button $timestamp $window_id');

        #if (!mobile)
            render_x = physical_x = (x - (size/2));
            render_y = y - (size/2);
        #end

    } //onmouseup

    override function ongamepadup(gamepad:Int,btn:Int,value:Float,_) {
        log('gamepad up; device: ${gamepad}, btn: ${btn}, value: ${value}');
    }

    override function ongamepaddown(gamepad:Int,btn:Int,value:Float,_) {
        log('gamepad down; device: ${gamepad}, btn: ${btn}, value: ${value}');
    }

    override function ongamepaddevice( gamepad:Int, id:String, type:GamepadDeviceEventType, _ ) {
        log('gamepad device; $type  device: $gamepad id: $id');
    }

    override function ongamepadaxis( gamepad:Int, axis:Int, value:Float, timestamp:Float ) {

        if(Math.abs(value) > 0.2 || no_gamepad_deadzone) {
            // log('axis; device: ${gamepad}, axis: ${axis}, value: ${value} timestamp: ${timestamp}');
            if(axis == 1) {
                render_y += value * 2 * speed * frame_delta;
            }
        }

    } //ongamepadaxis


//Set up

    function apply_config() {

        if(app.config.user.size != null)
            size = app.config.user.size;
        if(app.config.user.movespeed != null)
            speed = app.config.user.movespeed;
        if(app.config.user.timescale != null)
            timescale = app.config.user.timescale;

    } //apply_config


//GL stuff

    //shader program

        var program:GLProgram;

    //shader input

        var uniform_MV:GLUniformLocation;
        var uniform_MP:GLUniformLocation;
        var attr_texcoord:Int;
        var attr_pos:Int = 0;

    //GL data

        var pos_buffer:GLBuffer;

    //app data

        var projection : Float32Array;
        var modelview : Float32Array;


    function init_shaders() : Void {

        var vert_shader = "";
        var frag_shader = "";

        #if (android || web)
            vert_shader += "precision mediump float;";
            frag_shader += "precision mediump float;";
        #end

        if(app.config.render.opengl.profile == OpenGLProfile.core) {
            vert_shader +=
            "
            #version 330 core
            layout(location = 0) in vec3 vert_pos;
            ";
        } else {
            vert_shader +=
            "
            attribute vec3 vert_pos;
            ";
        }

        vert_shader +=
            "
            uniform mat4 modelview;
            uniform mat4 projection;

            void main(void) {
                gl_Position = projection * modelview * vec4(vert_pos, 1.0);
            }
            ";

        if(app.config.render.opengl.profile == OpenGLProfile.core) {
            frag_shader +=
                "
                #version 330 core
                out vec4 color;
                void main(void) {
                    color = vec4(0.0235, 0.706, 0.984, 1);
                }
                ";
        } else {
            frag_shader +=
                "
                    void main(void) {
                        gl_FragColor = vec4(0.0235, 0.706, 0.984, 1);
                    }
                ";
        }

        //vertex
        log("about to create a vertex shader");

            var vshader = GL.createShader(GL.VERTEX_SHADER);

                GL.shaderSource (vshader, vert_shader);
                GL.compileShader (vshader);

            if(GL.getShaderParameter(vshader, GL.COMPILE_STATUS) == 0) {
                throw "Error compiling vertex shader" + GL.getShaderInfoLog(vshader);
            }

        log("vertex shader compiled");

        //fragment
        log("about to create a fragment shader");

            var fshader = GL.createShader(GL.FRAGMENT_SHADER);

                GL.shaderSource(fshader, frag_shader);
                GL.compileShader(fshader);

            if (GL.getShaderParameter (fshader, GL.COMPILE_STATUS) == 0) {
                throw "Error compiling fragment shader" + GL.getShaderInfoLog(fshader);
            }

        log("fragment shader compiled");

        //linking

        log("about to link the shader program");

        program = GL.createProgram();

            GL.attachShader(program, vshader);
            GL.attachShader(program, fshader);

        GL.linkProgram( program );

        if (GL.getProgramParameter(program, GL.LINK_STATUS) == 0) {
            throw "Unable to link the shader program: " + GL.getProgramInfoLog(program);
        }

        GL.bindAttribLocation(program, attr_pos, "vert_pos");
        uniform_MP = GL.getUniformLocation(program, "projection");
        uniform_MV = GL.getUniformLocation(program, "modelview");

    } //init_shaders

    function init_buffers() {

        #if !linc_opengl_GLES
            if(app.config.render.opengl.profile == OpenGLProfile.core) {
                var vaos = [0];
                opengl.GL.glGenVertexArrays(1, vaos);
                opengl.GL.glBindVertexArray(vaos[0]);
            }
        #end

        var vertices = [
            size, size, 0,
            0, size, 0,
            size, 0, 0,
            0, 0, 0
        ];

        pos_buffer = GL.createBuffer ();
        GL.bindBuffer (GL.ARRAY_BUFFER, pos_buffer);

            GL.bufferData (GL.ARRAY_BUFFER, new Float32Array(vertices), GL.STATIC_DRAW);

        GL.bindBuffer (GL.ARRAY_BUFFER, null);

    } //init_buffers


//Helpers

    function createOrthoMatrix( ?into:Float32Array, x0:Float, x1:Float,  y0:Float, y1:Float, zNear:Float, zFar:Float ) : Float32Array {

        var i = into;
        if(i == null) i = new Float32Array(16);

        var sx = 1.0 / (x1 - x0);
        var sy = 1.0 / (y1 - y0);
        var sz = 1.0 / (zFar - zNear);

            i[ 0] = 2.0*sx;        i[ 1] = 0;            i[ 2] = 0;                 i[ 3] = 0;
            i[ 4] = 0;             i[ 5] = 2.0*sy;       i[ 6] = 0;                 i[ 7] = 0;
            i[ 8] = 0;             i[ 9] = 0;            i[10] = -2.0*sz;           i[11] = 0;
            i[12] = -(x0+x1)*sx;   i[13] = -(y0+y1)*sy;  i[14] = -(zNear+zFar)*sz;  i[15] = 1;

        return i;

    } //createOrthoMatrix

    function create2DMatrix( ?into:Float32Array, x:Float, y:Float, scale:Float = 1, rotation:Float = 0 ) {

        var i = into;
        if(i == null) i = new Float32Array(16);

        var theta = rotation * Math.PI / 180.0;
        var c = Math.cos(theta);
        var s = Math.sin(theta);

            i[ 0] = c*scale;  i[ 1] = -s*scale;  i[ 2] = 0;      i[ 3] = 0;
            i[ 4] = s*scale;  i[ 5] = c*scale;   i[ 6] = 0;      i[ 7] = 0;
            i[ 8] = 0;        i[ 9] = 0;         i[10] = 1;      i[11] = 0;
            i[ 12] = x;       i[13] = y;         i[14] = 0;      i[15] = 1;

        return i;

    } //create2DMatrix

} //Main
