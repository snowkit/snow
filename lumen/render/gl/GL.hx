package lumen.render.gl;

#if lumen_html5
    typedef GL = lumen.render.gl.html5.GL;
    @:noCompletion typedef Ext = lumen.render.gl.html5.Ext;
#else
    typedef GL = lumen.render.gl.native.GL;
    @:noCompletion typedef Ext = lumen.render.gl.native.Ext;
#end //lumen_html5