
import snow.Snow;

import snow.render.opengl.GL;
import snow.utils.Float32Array;

import snow.types.Types;
import snow.Log.log;

class Main extends snow.App.AppFixedTimestep {

//app stuff

    var size : Int = 128;
    var speed : Float = 100;
    var dir_x : Float = 1;

        //position drawn at
    var render_x : Float = 0;
    var render_y : Float = 0;
        //"physics" position
    var physical_x : Float = 0;

    var vsync = true;

//input stuff

    var no_gamepad_deadzone : Bool = false;

    override function config( config:AppConfig ) : AppConfig {

            //here we can change the config.window and config.runtime values
            //before they are used by the framework, i.e verifying the runtime config values
            //and rejecting/updating invalid ones

        if(config.runtime.window != null) {
            if(config.runtime.window.width != null) config.window.width = Std.int(config.runtime.window.width);
            if(config.runtime.window.height != null) config.window.height = Std.int(config.runtime.window.height);
        }

        return config;

    } //config

    override function ready() {

        log('/ HOST / ready');
        log("OpenGL reports version " + GL.versionString());
        log('app config is loaded as : ${app.config.runtime}');

        log("init / shaders and buffers ");

        apply_config();
        init_shaders();
        init_buffers();

        log("init / done with shaders and buffers");

            //start mid window
        render_y = (app.window.height - size) / 2;

            //start rendering
        app.window.onrender = on_render_update;

    } //ready

        //"physics" update
    override function update( delta:Float ) {

        render_x = physical_x;

        physical_x += (speed * dir_x * delta);

    } //update

        //render update
    function on_render_update( window:snow.window.Window ) {

        //note that the update is separated from the render rate
        //this is the fix-your-timestep implementation
        //essentially app.frame_time is a fixed timestep,
        //alpha time is how far we are between a frame and the next,
        //allowing us to render the mid frame placement smoothly

        var prev_render_x = render_x;

            //this interpolates the render position
        render_x = (physical_x * alpha) + prev_render_x * ( 1.0 - alpha );

        if(render_x >= (app.window.width - size)) {

            render_x = (app.window.width - size);
            dir_x = -1;

        } else if(render_x <= 0) {

            render_x = 0;
            dir_x = 1;

        }

        // Sys.println('alpha:${alpha} dt:${delta_time} delta_sim:${delta_sim}');

        draw();

    } //on_render_update

    function draw() {

        GL.viewport(0, 0, app.window.width, app.window.height);
        GL.clearColor(1.0, 1.0, 1.0, 1.0);
        GL.clear( GL.COLOR_BUFFER_BIT );

        projection = createOrthoMatrix( 0, app.window.width, app.window.height, 0, 1000, -1000 );
        modelview = create2DMatrix( render_x, render_y, 1, 0 );

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

        if( keycode == Key.key_g ) {
            no_gamepad_deadzone = !no_gamepad_deadzone;
            log('gamepad no clamp: $no_gamepad_deadzone');
        }

        if(keycode == Key.key_v) {
            vsync = !vsync;
            app.windowing.enable_vsync( vsync );
            log('vsync enabled : $vsync');
        }

    } //onkeyup

    override function ontouchmove( x:Float, y:Float, dx:Float, dy:Float, touch_id:Int, timestamp:Float ) {
        // log('touch move; $x / $y / $dx / $dy / $touch_id / $timestamp ');

            //touches are normalized, so we convert to window size
        render_x = physical_x = ((app.window.width*x) - (size/2));
        render_y = (app.window.height*y) - (size/2);

    } //ontouchmove

    override function onmousemove( x:Int, y:Int, xrel:Int, yrel:Int, timestamp:Float, window_id:Int ) {

        // log('move $x / $y / $xrel / $yrel / $timestamp / $window_id');

        if(app.input.keydown(Key.space)) {
            render_x = physical_x = x - (size/2);
            render_y = y - (size/2);
        }

    } //onmousemove

    override function onmouseup( x:Int, y:Int, button:Int, timestamp:Float, window_id:Int ) {

        // log('mouse up $x $y $button $timestamp $window_id');

        #if !mobile
            render_x = physical_x = (x - (size/2));
            render_y = y - (size/2);
        #end

    } //onmouseup

    override function ongamepadaxis( gamepad:Int, axis:Int, value:Float, timestamp:Float ) {

        if(Math.abs(value) > 0.2 || no_gamepad_deadzone) {
            // log('axis; device: ${gamepad}, axis: ${axis}, value: ${value} timestamp: ${timestamp}');
            if(axis == 1) {
                render_y += value * 2 * speed * delta_time;
            }
        }

    } //ongamepadaxis


//Set up

    function apply_config() {

        if(app.config.runtime.size != null)
            size = app.config.runtime.size;
        if(app.config.runtime.movespeed != null)
            speed = app.config.runtime.movespeed;
        if(app.config.runtime.timescale != null)
            timescale = app.config.runtime.timescale;

    } //apply_config


//GL stuff

    //shader program

        var program:GLProgram;

    //shader input

        var uniform_MV:GLUniformLocation;
        var uniform_MP:GLUniformLocation;
        var attr_texcoord:Int;
        var attr_pos:Int;

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

        vert_shader +=
            "
            attribute vec3 vert_pos;

            uniform mat4 modelview;
            uniform mat4 projection;

            void main(void) {
                gl_Position = projection * modelview * vec4(vert_pos, 1.0);
            }
            ";

        frag_shader +=
            "
            void main(void) {
                gl_FragColor = vec4(0.0235, 0.706, 0.984, 1);
            }
            ";

    //vertex
        log("about to create a vertex shader");

            var vshader = GL.createShader(GL.VERTEX_SHADER);

                GL.shaderSource (vshader, vert_shader);
                GL.compileShader (vshader);

            if (GL.getShaderParameter(vshader, GL.COMPILE_STATUS) == 0) {
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

        attr_pos = GL.getAttribLocation (program, "vert_pos");
        uniform_MP = GL.getUniformLocation (program, "projection");
        uniform_MV = GL.getUniformLocation (program, "modelview");

    } //initializeShaders

    function init_buffers() {

        var vertices = [
            size, size, 0,
            0, size, 0,
            size, 0, 0,
            0, 0, 0
        ];

        pos_buffer = GL.createBuffer ();
        GL.bindBuffer (GL.ARRAY_BUFFER, pos_buffer);

            GL.bufferData (GL.ARRAY_BUFFER, new Float32Array (cast vertices), GL.STATIC_DRAW);

        GL.bindBuffer (GL.ARRAY_BUFFER, null);

    } //init_buffers


//Helpers

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
