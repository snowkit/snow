
import lumen.Lumen;

import lumen.gl.GL;
import lumen.gl.GLTexture;
import lumen.gl.GLProgram;
import lumen.gl.GLBuffer;

import lumen.utils.ByteArray;
import lumen.utils.UInt8Array;
import lumen.utils.Float32Array;
import lumen.utils.Matrix3D;

import lumen.window.Window;
import lumen.LumenTypes.ImageInfo;


class Main extends lumen.App {

    var imageUniform:Int;
    var modelViewMatrixUniform:Int;
    var projectionMatrixUniform:Int;
    var shaderProgram:GLProgram;
    var texCoordAttribute:Int;
    var texCoordBuffer:GLBuffer;
    var vertexAttribute:Int;
    var vertexBuffer:GLBuffer;
    var textures: Array<GLTexture>;
    var current_texture : GLTexture;
    var tex_index : Int = 0;
    var files : Array<String>;
    
    var size : Int = 128;


    override public function ready() {

        trace('/ HOST / ready');

        initializeShaders();
        createBuffers();

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
            var info : ImageInfo = app.loadimage(f);
            trace('loaded $f with ${info.width}x${info.height}x${info.bpp} (source bpp:${info.bpp_source}) mem:${info.data.byteLength}');
            textures.push( createTexture( info ) );
        }

        //this is temp testing, just hook into the window render directly
        current_texture = textures[0];

        app.main_window.window_render_handler = onrender;
       
        next_tick = haxe.Timer.stamp() + 1.0;

    } //ready

    var next_tick : Float = 0;
    var phys_posx : Float = 0;

    override function update(t:Float, dt:Float) {

        phys_posx += (speed * dirX * dt);

            //swap textures once a second
            p = true;
        if(t > next_tick) {

            next_tick = t + 1.0;
            tex_index++;
            if(tex_index == files.length) {
                tex_index = 0;
            }

            current_texture = textures[tex_index];
            
        }        
    }

    var avgdt = 0.0;
    var accumdt = 0.0;
    var dtf = 0;
    var p = false;

    function onrender( window:Window, alpha_time:Float ) {

        dtf++;
        accumdt += app.last_frame_time;
        if(dtf >= 10) {
            avgdt = accumdt/10;
            dtf = 0;
            accumdt = 0;
        }
        //"update"
        //this is to test the fix-your-timestep thing
        //essentially app.mspf is a fixed timestep, alpha time is how far we are into one...        

        var prevx = positionX;

        positionX = (phys_posx * alpha_time) + prevx * ( 1.0 - alpha_time );

        if(positionX >= app.main_window.size.w) {            
            positionX = app.main_window.size.w;
            dirX = -1;
        } else if(positionX <= 0) {
            positionX = 0;
            dirX = 1;
        }

        if(p == true) {
            Sys.println('alpha:${alpha_time} dt:${app.last_frame_time} avgdt:${avgdt} simtime:${app.t}');
            p = false;
        }

        render();

        window.swap();

    } //onrender hook

    function createTexture( info:ImageInfo ):GLTexture {
        
        var texture = GL.createTexture();

            GL.bindTexture (GL.TEXTURE_2D, texture);
            GL.texImage2D (GL.TEXTURE_2D, 0, GL.RGBA, info.width, info.height, 0, GL.RGBA, GL.UNSIGNED_BYTE, new UInt8Array( cast info.data ) );
            GL.texParameteri (GL.TEXTURE_2D, GL.TEXTURE_MAG_FILTER, GL.NEAREST);
            GL.texParameteri (GL.TEXTURE_2D, GL.TEXTURE_MIN_FILTER, GL.NEAREST);
            GL.bindTexture (GL.TEXTURE_2D, null);

        return texture;
        
    }
    
    function initializeShaders ():Void {
        
        var vertexShaderSource = 
            
            "attribute vec3 aVertexPosition;
            attribute vec2 aTexCoord;
            varying vec2 vTexCoord;
            
            uniform mat4 uModelViewMatrix;
            uniform mat4 uProjectionMatrix;
            
            void main(void) {
                vTexCoord = aTexCoord;
                gl_Position = uProjectionMatrix * uModelViewMatrix * vec4 (aVertexPosition, 1.0);
            }";
        
        var vertexShader = GL.createShader (GL.VERTEX_SHADER);
            GL.shaderSource (vertexShader, vertexShaderSource);
            GL.compileShader (vertexShader);
        
        if (GL.getShaderParameter (vertexShader, GL.COMPILE_STATUS) == 0) {
            
            throw "Error compiling vertex shader";
            
        }
        
        var fragmentShaderSource = 
            
            "varying vec2 vTexCoord;
            uniform sampler2D uImage0;
            
            void main(void) {
                gl_FragColor = texture2D (uImage0, vTexCoord);
            }";
        
        var fragmentShader = GL.createShader (GL.FRAGMENT_SHADER);
            GL.shaderSource (fragmentShader, fragmentShaderSource);
            GL.compileShader (fragmentShader);
        
        if (GL.getShaderParameter (fragmentShader, GL.COMPILE_STATUS) == 0) {
            
            throw "Error compiling fragment shader";
            
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
        
    }

    function createBuffers ():Void {
        
        var vertices = [
            
            size, size, 0,
            0, size, 0,
            size, 0, 0,
            0, 0, 0
            
        ];
        
        vertexBuffer = GL.createBuffer ();
        GL.bindBuffer (GL.ARRAY_BUFFER, vertexBuffer);
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array (cast vertices), GL.STATIC_DRAW);
        GL.bindBuffer (GL.ARRAY_BUFFER, null);
        
        var texCoords = [
            
            1, 1, 
            0, 1, 
            1, 0, 
            0, 0, 
            
        ];
        
        texCoordBuffer = GL.createBuffer ();
        GL.bindBuffer (GL.ARRAY_BUFFER, texCoordBuffer);    
        GL.bufferData (GL.ARRAY_BUFFER, new Float32Array (cast texCoords), GL.STATIC_DRAW);
        GL.bindBuffer (GL.ARRAY_BUFFER, null);
        
    }
        
    var positionX : Float = 0;
    var dirX : Float = 1;
    var speed : Float = 80;

    function render(){
        
        GL.viewport (0, 0, app.main_window.size.w, app.main_window.size.h);
        
        GL.clearColor (1.0, 0.5, 0.2, 1.0);
        GL.clear (GL.COLOR_BUFFER_BIT);
        
        // var positionX = (app.main_window.size.w - size) / 2;
        var positionY = (app.main_window.size.h - size) / 2;
        
        var projectionMatrix = Matrix3D.createOrtho (0, app.main_window.size.w, app.main_window.size.h, 0, 1000, -1000);
        var modelViewMatrix = Matrix3D.create2D (positionX, positionY, 1, 0);
        
        GL.useProgram (shaderProgram);
        GL.enableVertexAttribArray (vertexAttribute);
        GL.enableVertexAttribArray (texCoordAttribute);
        
        GL.activeTexture (GL.TEXTURE0);
        GL.bindTexture (GL.TEXTURE_2D, current_texture);
        GL.enable (GL.TEXTURE_2D);
        
        GL.bindBuffer (GL.ARRAY_BUFFER, vertexBuffer);
        GL.vertexAttribPointer (vertexAttribute, 3, GL.FLOAT, false, 0, 0);
        GL.bindBuffer (GL.ARRAY_BUFFER, texCoordBuffer);
        GL.vertexAttribPointer (texCoordAttribute, 2, GL.FLOAT, false, 0, 0);
        
        GL.uniformMatrix3D (projectionMatrixUniform, false, projectionMatrix);
        GL.uniformMatrix3D (modelViewMatrixUniform, false, modelViewMatrix);
        GL.uniform1i (imageUniform, 0);
        
        GL.drawArrays (GL.TRIANGLE_STRIP, 0, 4);
        
        GL.bindBuffer (GL.ARRAY_BUFFER, null);
        GL.disable (GL.TEXTURE_2D);
        GL.bindTexture (GL.TEXTURE_2D, null);
        
        GL.disableVertexAttribArray (vertexAttribute);
        GL.disableVertexAttribArray (texCoordAttribute);
        GL.useProgram (null);
    }
} //Main
