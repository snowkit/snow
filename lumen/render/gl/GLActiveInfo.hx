package lumen.render.gl;

#if lumen_html5

    typedef GLActiveInfo = js.html.webgl.ActiveInfo;

#else

    typedef GLActiveInfo = {
        
        size : Int,
        type : Int,
        name : String,
        
    };

#end //lumen_html5