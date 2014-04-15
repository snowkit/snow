package lumen.gl;

#if lumen_html5

    typedef GLContextAttributes = js.html.webgl.ContextAttributes;

#else

    typedef GLContextAttributes = {
        
        alpha:Bool, 
        depth:Bool,
        stencil:Bool,
        antialias:Bool,
        premultipliedAlpha:Bool,
        preserveDrawingBuffer:Bool,
        
    };

#end //lumen_html5