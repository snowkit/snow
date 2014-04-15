package lumen.gl;

#if lumen_html5 

    typedef GLUniformLocation = js.html.webgl.UniformLocation;
    
#else //lumen_html5

    typedef GLUniformLocation = Dynamic;

#end //lumen_native

