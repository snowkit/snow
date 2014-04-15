package lumen.gl;

#if lumen_html5
    typedef GL = lumen.gl.html5.GL;
    typedef Ext = lumen.gl.html5.Ext;
#else
	typedef GL = lumen.gl.native.GL;
	typedef Ext = lumen.gl.native.Ext;
#end //lumen_html5