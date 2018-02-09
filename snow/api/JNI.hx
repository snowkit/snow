package snow.api;

#if android

import haxe.macro.ComplexTypeTools;
import haxe.macro.Context;
import haxe.macro.Expr;

// Please note this JNI stuff is an experimental approach that
// has proved useful but has several caveats. 
// - static functions only 
// - primitive types only (no arrays yet)
// - specific to snow atm (relies on snow activity api)
// - rough/wip code
// - it works though!

class JNI {
    //
        /** Expose public static haxe functions to `native` externs in Java side.
            For example in Java: `public static native void exampleCallback(int idx);`
            in Haxe: 
                @:build(JNI.native('com.your.game.AppActivity'))
                class Callbacks {
                    public static function exampleCallback(idx:Int) : Void {
                        //this can be called from java
                    }
                }*/
    macro function native(class_name:String) : Array<Field> {

        inject_jni_meta(class_name);

        var fields = Context.getBuildFields();
        var hx_class = Context.getLocalClass().toString();

        for(field in fields) {
            switch(field.kind) {
                case FFun(fn):
                        //work out the return type signature
                    var ret_str = 'Void';
                        //work out non-void return types
                    if(fn.ret != null) ret_str = ComplexTypeTools.toString( fn.ret );
                        //get static val
                    var is_static = field.access.indexOf(haxe.macro.Access.AStatic) != -1;
                        //convert the arg list
                    var arg_list = [];

                        for(arg in fn.args) {
                            var type_str = ComplexTypeTools.toString(arg.type);
                            arg_list.push({
                                name: arg.name,
                                hx_type: type_str,
                                type: JNIInfo.cpp_type_from_hx(type_str)
                            });

                        } //each arg

                        //get the cpp body
                    var cpp_code = cppjni_method(hx_class, class_name, field.name, is_static, ret_str, arg_list);

                    // trace(cpp_code);
                        //inject it into the c++ function body through meta
                    inject_meta('cppFileCode', cpp_code, false);

                case _:

            } //switch kind

            //JNIEXPORT void JNICALL Java_org_snowkit_snow_SnowActivity_testHaxeSide(JNIEnv* env, jclass clazz, jint arg_idx ) {
            //      LOGI("/////////////////////////// called testHaxeSide %d", arg_idx);
            //}

        }

        return fields;

    } //native

        /** declare a Haxe class extern to a Java class. 
            The class must have only static functions without a body.
            Only primitives can be used as args, in cases where the activity
            is needed it will be automatically injected if the java side wants it.
            In Java:
                public static boolean isSignedIn() { return false; }
                public static void achievementUnlock(String ach) { .. }
            In Haxe (using google play as an example): 
                @:build(JNI.declare('com.your.game.AppActivity'))
                class PlayAchievements {
                    public static function isSignedIn() : Bool;
                    public static function achievementUnlock(id:String): Void;
                } //PlayAchievements
            In user code:
                var ok = PlayAchievements.isSignedIn();
            */
    macro function declare(jni_class:String) : Array<Field> {

        inject_jni_meta(jni_class);

        var fields = Context.getBuildFields();

            for(field in fields) {

                var jni_ret = '';
                var arg_list = [];

                switch(field.kind) {
                    case FFun(fn):

                            //error on {} given on bodies
                        if(fn.expr != null) {
                            Context.fatalError('JNIExports function must have no body defined. function example(); <- no {}', Context.currentPos());
                        }

                            //work out the return type signature
                        var ret_str = 'Void';
                            //work out non-void return types
                        if(fn.ret != null) ret_str = ComplexTypeTools.toString( fn.ret );

                            //work out the arg signature
                            //and drop any special first pass arguments
                        var replace_args = [];
                        var arg_idx = 0;
                        for(arg in fn.args) {

                            var type_str = ComplexTypeTools.toString(arg.type);
                            if(arg_idx == 0 && type_str == 'Activity') {
                            } else {
                                replace_args.push(arg);
                            }

                            arg_list.push({
                                name:arg.name,
                                hx_type:type_str,
                                type: JNIInfo.cpp_type_from_hx(type_str)
                            });

                            arg_idx++;

                        } //each arg

                            //replace the args with the non-special version
                        fn.args = replace_args;
                            //work out if the method is static or not
                        var is_static = field.access.indexOf(haxe.macro.Access.AStatic) != -1;
                            //work out the c++ code required to call the function
                        var cpp_code = JNIInfo.cpp_method_body(jni_class, field.name, is_static, ret_str, arg_list);
                            //inject it into the c++ function body through meta
                        inject_body(field, fn, cpp_code);

                        if(ret_str != 'Void') {
                            switch(ret_str) {
                                case 'Bool': fn.expr = macro return false;
                                case 'Float': fn.expr = macro return 0.0;
                                case 'Int': fn.expr = macro return 0;
                                case _: throw 'unknown type $ret_str';
                            }
                        }

                    case _:
                } //switch kind
            } //each field

        return fields;
    } //declare

    static function cppjni_path( cls:String ) {
        cls = StringTools.replace(cls, '.','_');
        return 'Java_$cls';
    }

    static function cppjni_ret( ret_str:String ) {

        var jni_ret = JNIInfo.cpp_type_from_hx(ret_str);
        return 'JNIEXPORT $jni_ret JNICALL';

    } //cppjni_ret

    static function jni_to_cpp_arg(arg:JArg) {

        var jname = 'jarg_${arg.name}';
        var name = 'arg_${arg.name}';
        var pre = '';
        var post = '';

        switch(arg.type) {
            case JNIInfo.jnic_string: {
                pre = '\t\t\tconst char* $name = env->GetStringUTFChars($jname, 0);\n';
                post = '\t\t\tenv->ReleaseStringUTFChars($jname, nativeString);\n';
            }

            case JNIInfo.jnic_int: pre = '\t\tint $name = (int)$jname;\n';
            case JNIInfo.jnic_bool: pre = '\t\tbool $name = (bool)$jname;\n';
            case JNIInfo.jnic_float: pre = '\t\tfloat $name = (float)$jname;\n';
            case _: throw 'unknown type for ${arg.name} as ${arg.type}';
        }

        return { pre:pre, post:post, name:name };

    } //jni_to_cpp_arg

    static function cpp_start_callback() {
        
        var c = '';

            c +='\t\tint _autohaxe_base = 0;\n';
            c += '\t\t::hx::SetTopOfStack(&_autohaxe_base, true);\n\n';

        return c;

    } //cpp_start_callback

    static function cpp_end_callback() {
        
        return '\t\t::hx::SetTopOfStack((int*)0, true);\n\n';

    } //cpp_end_callback

    static function cppjni_method( hxcls:String, cls:String, func:String, is_static:Bool, ret_str:String, args:Array<JArg> ) {

        var cpphxcls = StringTools.replace(hxcls,'.','::');
        var func_def = '\t'+cppjni_ret(ret_str) + ' ' + cppjni_path(cls) + '_$func(';
        var args_list = 'JNIEnv* env, ';
        var call_args = '';

            args_list += is_static ? 'jclass jclazz' : 'jobject thiz';
        if(args.length != 0)
            args_list += ', ';
            //work out the args list types

        var jargs = [];
        var c = args.length;
        var i = 0;
        for(arg in args) {
            args_list += '${arg.type} jarg_${arg.name}';
            var n = jni_to_cpp_arg(arg);
            jargs.push(n);
            call_args += n.name;

            if(i < c-1) {
                args_list += ', ';
                call_args += ', ';
            }
            i++;
        }

        args_list += ')';
        var cppjni_body = ' {\n\n';

                cppjni_body += cpp_start_callback();                

                for(jarg in jargs) {
                    cppjni_body += jarg.pre;
                }

                var ret_inj = '';
                var jret = JNIInfo.cpp_type_from_hx(ret_str);
                if(ret_str != 'Void') ret_inj = '$jret jretval = ';

                cppjni_body += '\n';
                cppjni_body += '\t\t${ret_inj}::${cpphxcls}_obj::$func($call_args);\n';

                for(jarg in jargs) {
                    cppjni_body += jarg.post;
                }

                cppjni_body += '\n';

                if(ret_str != 'Void') cppjni_body += '\t\treturn jretval;';

                cppjni_body += '\n';

                cppjni_body += cpp_end_callback();

            cppjni_body += '\t}\n';

        return 'extern "C" {\n' + func_def + args_list + cppjni_body + '} //extern c';

    } //cppjni_method

        //This injects the required c++ to call the JNI function
    static function inject_body( field:Field, fn:haxe.macro.Function, cpp_body:String ) {

        field.meta.push(make_meta('functionCode', cpp_body, field.pos));

            //add a blank function body
        fn.expr = macro {};

    } //inject_body

    static function get_meta_string_val( metaname:String ) {

        var found_meta = '';
        var classmeta = Context.getLocalClass().get().meta;

            if(classmeta.has(':$metaname')) {
              for(m in classmeta.get()) {
                if(m.name == ':$metaname') {
                  var p = m.params[0];
                  switch(p.expr) {
                    case EConst(c):
                      switch(c) {
                        case CString(v): found_meta += '$v';
                        case _:
                      }
                    case _:
                  } //switch params[0]
                } //if metaname
              } //each meta
            } //has metaname already

        return found_meta;

    } //get_meta_string_val

    static function inject_meta(metaname:String, strval:String, before:Bool=true) {

        //the class meta values
        var classmeta = Context.getLocalClass().get().meta;

            //get the value before we mess with it
        var orig_meta = get_meta_string_val(metaname);

            //start with the original meta if, before is false
        var meta_result = before ? '' : orig_meta;

            //add the new meta
        meta_result += strval;

            //append the original meta if, before is true
        meta_result += before ? orig_meta : '';

            //strip the existing one so it doesn't duplicate
        classmeta.remove(':$metaname');

            //inject it back into the meta of the class
        classmeta.add(':$metaname', [macro $v{meta_result}], Context.currentPos());

        return meta_result;
    }

    static function inject_jni_meta(claaa:String) {

        inject_meta(
            'cppFileCode',
                '
                // start SDK JNI includes
                #include <jni.h>
                #include <android/log.h>
                #ifndef LOGI 
                    #define LOGI(...) __android_log_print(ANDROID_LOG_INFO,"SNOWJNI",__VA_ARGS__) 
                #endif
                #ifndef LOGE 
                    #define LOGE(...) __android_log_print(ANDROID_LOG_ERROR,"SNOWJNI",__VA_ARGS__) 
                #endif
                extern "C" { extern void* SDL_AndroidGetJNIEnv(void); }
                // end SDK JNI includes\n'
        );

        // inject_meta(
        //     'buildXml',
        //         "<target id='haxe'>
        //             <vflag name='-L${haxelib:snow}/ndll/Android/' value=''/>
        //             <lib name='-lsnow'/>
        //         </target>
        //         "
        // );

    } //inject_jni_meta

    static function meta_has(meta:String, field:Field) {
        for(m in field.meta) if(m.name == meta) return true;
        return false;
    } //meta_has

    static function make_meta(name:String, content:String, pos) {
        return {
            name:':$name',
            params:[macro $v{content}],
            pos: pos
        }
    } //make_meta

} //JNI

typedef JArg = { name:String, type:String, hx_type:String };
private class JNIInfo {

    /** Given args= V , ret=Ljava/lang/String; -
            this will return the fully qualified (args)ret format */
    public static function from_jni_func_parts( args:String, ret:String ) {
        var res = StringTools.replace(jni_method, '{args_type}', args );
            res = StringTools.replace(res, '{return_type}', ret);
        return res;
    }

        /** Convert a type package (java.lang.String) to a jni signature type,
            i.e java.lang.String => Ljava/lang/String;*/
    public static function from_type( type:String ) {
        type = slash(type);
        return StringTools.replace(jni_object, '{object_type}', type);
    }

        /** Convert a haxe string type to a JNI signature type
            i.e Bool returns B, Int returns I, Void returns V etc. */
    public static function from_hx( type:String ) {
        switch(type) {
            case 'Void':   return jni_void;
            case 'Int':    return jni_int;
            case 'Float':  return jni_float;
            case 'Bool':   return jni_bool;
            case 'String': return from_type('java.lang.String');
            case 'Activity': return from_type('android.app.Activity');
        }

        return throw 'unknown type `$type`';
    }

        //takes a jni type (Z, B, etc) and returns it's corresponding jni type
    public static function jni_type_from_jni_short(type:String) : String {
        return switch(type) {
            case 'V': jnic_void; 
            case 'I': jnic_int; 
            case 'Z': jnic_bool;
            case 'F': jnic_float; 
            case _:         throw 'unknown type `$type`';
        }
    }

    public static function from_cpphx(type:String) {
        switch(type) {
            case 'Void': return '::Void';
            case 'String': return '::String';
            case 'Int': return 'int';
            case 'Float': return '::Float';
            case 'Bool': return 'bool';
            case _: return throw 'unknown type `$type`';
        }
    }

        /** Convert a haxe string type to a jni cpp type,
            i.e Bool returns jboolean, Int jint etc. */
    public static function cpp_type_from_hx( type:String ) {
        switch(type) {
            case 'Void':        return jnic_void;
            case 'Int':         return jnic_int;
            case 'Float':       return jnic_float;
            case 'Bool':        return jnic_bool;
            case 'String':      return jnic_string;
            case 'Activity':    return jnic_special_activity;
        }
        return throw 'unknown type';
    }

        /** Convert a package.blah.Class to package/blah/Class */
    public static function slash(str:String) return StringTools.replace(str, '.','/');

        /** Get the cpp to define a local var called env,
            and assign it the correct android env. */
    public static function cpp_get_env() {

        var code = '\t\tJNIEnv* env = (JNIEnv*)SDL_AndroidGetJNIEnv();\n';

        #if debug
            code += '\t\tLOGI("    DEBUG env: %p\\n", env);\n';
        #end

        return code;

    } //cpp_get_env

        /** Get the cpp code to call FindClass on the given (jni) class name,
            i.e slash(package.blah.Class) or package/blah/Class */
    public static function cpp_find_class( jni_class:String ) {
        var code = '\t\tjclass cls = env->FindClass("$jni_class");\n';

        #if debug
            code += '\t\tLOGI("    DEBUG cls: %d\\n", cls);\n';
        #end

        return code;
    } //cpp_find_class

        /** Get the cpp code to call GetMethodID/GetStaticMethodID. */
    public static function cpp_get_methodid( func:String, jni_signature:String, is_static:Bool ) {

        var get_method_call = is_static ? 'GetStaticMethodID' : 'GetMethodID';
        var code = '\t\tjmethodID methodid = env->$get_method_call(cls, "$func", "$jni_signature");\n\n';

        #if debug
            code += '\t\tLOGI("    DEBUG looked for ${ is_static ? "static" : ""} method:$func, $jni_signature, methodid: %d\\n", methodid);\n';
        #end

            code += '\t\tif(methodid == 0) {\n';
                code += '\t\t\tLOGI("//// //// ERROR METHOD NOT FOUND : $func");\n';
            code += '\t\t}\n\n';

        return code;
    } //cpp_get_methodid

        /** Get the cpp code to get the argument list in the form of arg_name0, arg_name1  */
    public static function cpp_get_arg_list( arg_list:Array<JArg> ) {

        var jni_arglist = '';
        var count = arg_list.length;
        var idx = 0;

        for(arg in arg_list) {

            if(arg.type == 'jactivity') {
                jni_arglist += 'snow::android::activity';
            } else {
                jni_arglist += 'arg_${arg.name}';
            }

            if(idx < count-1) jni_arglist += ', ';
            idx++;

        } //each arg

        return jni_arglist;

    } //cpp_get_arg_list

        /** get the cpp argument declarations for jni types, i.e jint arg_name = (jint)hx_int; */
    public static function cpp_get_arg_decl( arg_list:Array<JArg> ) {

        var jni_arg_decl = '';
        var jni_post_code = '';
        var count = arg_list.length;
        var idx = 0;

        for(arg in arg_list) {

            if(arg.type != 'jactivity')
                jni_arg_decl += '\t\t${arg.type} arg_${arg.name} = ';

            switch(arg.type) {

                case 'jstring': {
                    jni_arg_decl += 'env->NewStringUTF( ${arg.name}.c_str() );\n';
                    jni_post_code += '\t\tenv->DeleteLocalRef(arg_${arg.name});\n';
                }

                case 'jint', 'jfloat', 'jboolean': {
                    jni_arg_decl += '(${arg.type})${arg.name};\n';
                }

                case _:

            } //switch arg.type

            idx++;

        } //each arg

        return { decl:jni_arg_decl, post:jni_post_code };

    } //cpp_get_arg_decl

        /** Get the method body for the given details, pre transform
            class_name = package.blah.Class, func_name = methodname, 
            ret_type = jni return type, i.e jni_void etc
        */
    public static function cpp_method_body( class_name:String, func_name:String, is_static:Bool, ret_type:String, arg_list:Array<JArg> ) {

        var jni_args = '';
        var jni_ret = '';
        var jni_class = slash(class_name);

            //jni signature for arguments
        for(arg in arg_list) jni_args += from_hx( arg.hx_type );
            //jni signature for return type
        jni_ret = from_hx(ret_type);
            //return the function body
        return cpp_body(jni_class, func_name, is_static, arg_list, jni_args, jni_ret );

    } //cpp_method_body

        /** Get the call type i.e CallStaticVoidMethod vs CallVoidMethod, dependent on the ret type. */
    public static function cpp_method_call_type( func:String, is_static:Bool, ret:String ) {

        if(ret == jni_void) {
            return is_static ? 'CallStaticVoidMethod' : 'CallVoidMethod';
        } else if(ret == jni_bool) {
            return is_static ? 'CallStaticBooleanMethod' : 'CallBooleanMethod';
        } else if(ret == jni_int) {
            return is_static ? 'CallStaticIntMethod'     : 'CallIntMethod';
        } else if(ret == jni_float) {
            return is_static ? 'CallStaticFloatMethod'   : 'CallFloatMethod';
        }

        return throw 'unknown return type $func / $is_static / $ret ';

    } //cpp_method_call_type

        /** Internal to return the cpp body function code */
    static function cpp_body( cls:String, func:String, is_static:Bool, args:Array<JArg>, jni_args:String, jni_ret:String ) : String {

        var arg_vals = JNIInfo.cpp_get_arg_decl(args);
        var arg_list = JNIInfo.cpp_get_arg_list(args);

        var jni_signature = from_jni_func_parts(jni_args, jni_ret);
        var method_call_type = JNIInfo.cpp_method_call_type( func, is_static, jni_ret);

        var code = '\t{\n';

            code += cpp_get_env();
            code += cpp_find_class(cls);
            code += cpp_get_methodid(func, jni_signature, is_static);

            code += arg_vals.decl;
            code += '\n';

            var arg_str_list = '';
            if(args.length != 0) arg_str_list = ', $arg_list';

            var ret_code = (jni_ret != jni_void) ? '${jni_type_from_jni_short(jni_ret)} jni_ret_value = ' : '';

            code += '\t\t\t${ret_code}env->${method_call_type}(cls, methodid${arg_str_list});';

            code += '\n\n';
            code += arg_vals.post;

            if(ret_code != '') {
                switch(jni_ret) {
                    case 'Z': code += '\t\treturn (bool)jni_ret_value;';
                    case 'F': code += '\t\treturn (double)jni_ret_value;';
                    case 'I': code += '\t\treturn (int)jni_ret_value;';
                    case _ : code += '\t\treturn null();';
                }
            }

        code += '\n\t}';

        return code;

    } //cpp_body


    public static var jni_bool   = 'Z';
    public static var jni_byte   = 'B';
    public static var jni_char   = 'C';
    public static var jni_double = 'D';
    public static var jni_float  = 'F';
    public static var jni_int    = 'I';
    public static var jni_long   = 'J';
    public static var jni_void   = 'V';
    public static var jni_object = 'L{object_type};';
    public static var jni_array  = '[{array_content};';
    public static var jni_method = '({args_type}){return_type}';

    public static var jnic_void     = 'void';
    public static var jnic_string   = 'jstring';
    public static var jnic_int      = 'jint';
    public static var jnic_bool     = 'jboolean';
    public static var jnic_float    = 'jfloat';

    public static var jnic_special_activity = 'jactivity';

} //JNIInfo

#end