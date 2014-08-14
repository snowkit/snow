
[![Logo](../../../../images/logo.png)](../../../../api/index.html)

---



<h1>StaticSnow</h1>
<small>`snow.platform.native.StaticSnow`</small>



---

`class`
<span class="meta">
<br/>meta: @:cppFileCode(&quot;extern \&quot;C\&quot; void snow_register_prims();&quot;), @:buildXml(&lt;![CDATA[&quot;\n\n&lt;set name=&#x27;MSVC_LIB_VERSION&#x27; value=&#x27;-${MSVC_VER}&#x27; if=&#x27;windows&#x27;/&gt;\n&lt;set name=&#x27;DEBUG_SNOW&#x27; value=&#x27;${DBG}&#x27; if=&#x27;debug_snow&#x27;/&gt;\n&lt;target id=&#x27;haxe&#x27;&gt;\n  &lt;lib name=&#x27;${haxelib:snow}/ndll/${BINDIR}/libsnow${DEBUG_SNOW}${LIBEXTRA}${LIBEXT}&#x27;/&gt;\n\n    &lt;section if=&#x27;mac&#x27;&gt;\n        &lt;vflag name=&#x27;-l&#x27; value=&#x27;iconv&#x27;/&gt;\n        &lt;vflag name=&#x27;-framework&#x27; value=&#x27;IOKit&#x27; /&gt;\n        &lt;vflag name=&#x27;-framework&#x27; value=&#x27;Foundation&#x27; /&gt;\n        &lt;vflag name=&#x27;-framework&#x27; value=&#x27;CoreAudio&#x27; /&gt;\n        &lt;vflag name=&#x27;-framework&#x27; value=&#x27;Cocoa&#x27; /&gt;\n        &lt;vflag name=&#x27;-framework&#x27; value=&#x27;OpenGL&#x27; /&gt;\n        &lt;vflag name=&#x27;-framework&#x27; value=&#x27;AudioToolbox&#x27; /&gt;\n        &lt;vflag name=&#x27;-framework&#x27; value=&#x27;AudioUnit&#x27; /&gt;\n        &lt;vflag name=&#x27;-framework&#x27; value=&#x27;ForceFeedback&#x27; /&gt;\n        &lt;vflag name=&#x27;-framework&#x27; value=&#x27;Carbon&#x27; /&gt;\n        &lt;vflag name=&#x27;-framework&#x27; value=&#x27;AppKit&#x27; /&gt;\n        &lt;vflag name=&#x27;-framework&#x27; value=&#x27;OpenAL&#x27;/&gt;\n    &lt;/section&gt;\n\n    &lt;section if=&#x27;windows&#x27;&gt;\n\n        &lt;lib name=&#x27;gdi32.lib&#x27; /&gt;\n        &lt;lib name=&#x27;opengl32.lib&#x27; /&gt;\n        &lt;lib name=&#x27;user32.lib&#x27; /&gt;\n        &lt;lib name=&#x27;kernel32.lib&#x27; /&gt;\n        &lt;lib name=&#x27;advapi32.lib&#x27; /&gt;\n        &lt;lib name=&#x27;winmm.lib&#x27; /&gt;\n        &lt;lib name=&#x27;imm32.lib&#x27;  /&gt;\n        &lt;lib name=&#x27;ole32.lib&#x27; /&gt;\n        &lt;lib name=&#x27;oleaut32.lib&#x27; /&gt;\n        &lt;lib name=&#x27;version.lib&#x27; /&gt;\n        &lt;lib name=&#x27;ws2_32.lib&#x27;  /&gt;\n        &lt;lib name=&#x27;wldap32.lib&#x27; /&gt;\n        &lt;lib name=&#x27;shell32.lib&#x27; /&gt;\n        &lt;lib name=&#x27;comdlg32.lib&#x27; /&gt;\n\n     &lt;/section&gt;\n\n    &lt;section if=&#x27;linux&#x27;&gt;\n\n        &lt;lib name=&#x27;${HXCPP}/lib/${BINDIR}/liblinuxcompat.a&#x27; /&gt;\n        &lt;lib name=&#x27;-lpthread&#x27; /&gt;\n        &lt;lib name=&#x27;-lrt&#x27; /&gt;\n        &lt;lib name=&#x27;-lGL&#x27; /&gt;\n\n            &lt;!-- These are from &#x60;pkg-config --libs gtk+-3.0&#x60; --&gt;\n        &lt;lib name=&#x27;-lgtk-3&#x27;  unless=&#x27;SNOW_NO_GTK&#x27;/&gt;\n        &lt;lib name=&#x27;-lgdk-3&#x27; unless=&#x27;SNOW_NO_GTK&#x27;/&gt;\n        &lt;lib name=&#x27;-latk-1.0&#x27; unless=&#x27;SNOW_NO_GTK&#x27;/&gt;\n        &lt;lib name=&#x27;-lgio-2.0&#x27; unless=&#x27;SNOW_NO_GTK&#x27;/&gt;\n        &lt;lib name=&#x27;-lpangocairo-1.0&#x27; unless=&#x27;SNOW_NO_GTK&#x27;/&gt;\n        &lt;lib name=&#x27;-lgdk_pixbuf-2.0&#x27; unless=&#x27;SNOW_NO_GTK&#x27;/&gt;\n        &lt;lib name=&#x27;-lcairo-gobject&#x27; unless=&#x27;SNOW_NO_GTK&#x27;/&gt;\n        &lt;lib name=&#x27;-lpango-1.0&#x27; unless=&#x27;SNOW_NO_GTK&#x27;/&gt;\n        &lt;lib name=&#x27;-lcairo&#x27; unless=&#x27;SNOW_NO_GTK&#x27;/&gt;\n        &lt;lib name=&#x27;-lgobject-2.0&#x27; unless=&#x27;SNOW_NO_GTK&#x27;/&gt;\n        &lt;lib name=&#x27;-lglib-2.0&#x27;  unless=&#x27;SNOW_NO_GTK&#x27;/&gt;\n\n     &lt;/section&gt;\n\n&lt;/target&gt;\n&quot;]]&gt;), @:keep
</span>


---

&nbsp;
&nbsp;









---

&nbsp;
&nbsp;
&nbsp;
&nbsp;
