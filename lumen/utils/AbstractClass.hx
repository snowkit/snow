package lumen.utils;

// Author : Andy Li 
// Sourced from : https://gist.github.com/andyli/5011520

import haxe.macro.Context;
import haxe.macro.Expr;
import haxe.macro.Type;
using Lambda;

/**
	Old school abstract class.
	Classes that implements it, and their sub-classes, will be able to declare abstract methods (methods that without body).
	There will be a check in compile-time such that no public constructor is allowed without all abstract methods implemented.
*/
@:autoBuild(lumen.utils.AbstractClassBuilder.build())
interface AbstractClass {}

private typedef StringMap<T> = Map<String, T>;

class AbstractClassBuilder {
	#if macro
	/** 
		The without-body declared methods of an AbstractClass.
		Uses fully-qualified class names as keys, stores StringMaps of method name keys.
		Filled in by build() called by @:autoBuild. 
	*/
	static var declAbstracts:StringMap<StringMap<Bool>> = new StringMap();
	
	/** 
		All abstract methods, including the inherited ones, of an AbstractClass.
		Uses fully-qualified class names as keys, stores StringMaps of method name keys.
		Filled in by checkAbstractClass() during onGenerate.
	*/
	static var allAbstracts:StringMap<StringMap<Bool>> = new StringMap();
	
	/** 
		The remainning AbstractClasses that need to be processed by checkAbstractClass().
		Uses fully-qualified class names as keys.
		Filled in during onGenerate.
	*/
	static var typesToProcess:StringMap<ClassType> = new StringMap();
	
	/** 
		Returns fully-qualified class name.
		Used to get a key for StringMap.
	*/
	static function getFullClassName(cls:ClassType):String {
		return (cls.pack.length > 0 ? cls.pack.join(".") + "." : "") + cls.name;
	}
	
	static function __init__():Void {
		Context.onGenerate(function (types:Array<Type>):Void {
			for (t in types) {
				switch (t) {
					case TInst(clsr, _):
						var clsName = getFullClassName(clsr.get());
						if (declAbstracts.exists(clsName)) {
							typesToProcess.set(clsName, clsr.get());
						}
					default:
				}
			}
		
			while (!typesToProcess.empty()) {
				checkAbstractClass(typesToProcess.iterator().next());
			}
		});
	}
	
	static function checkAbstractClass(cls:ClassType):Void {
		var allAbsFields:StringMap<Bool> = new StringMap();
		var clsName = getFullClassName(cls);
		allAbstracts.set(clsName, allAbsFields);
				
		//copy the declared ones
		var absFields = declAbstracts.get(clsName);
		for (k in absFields.keys()) {
			allAbsFields.set(k, true);
		}
				
		if (cls.superClass != null && declAbstracts.exists(getFullClassName(cls.superClass.t.get()))) {
			//Super class is AbstractClass.
			var supClsName = getFullClassName(cls.superClass.t.get());
			if (!allAbstracts.exists(supClsName)) {
				checkAbstractClass(cls.superClass.t.get());
			}
					
			//copy the inherited ones
			var supallAbsFields = allAbstracts.get(supClsName);
			for (k in supallAbsFields.keys()) {
				allAbsFields.set(k, true);
			}
					
			var fields = cls.fields.get();
			for (field in fields) {
				if (!absFields.exists(field.name) && allAbsFields.exists(field.name)) {
					allAbsFields.remove(field.name);
				}
			}
		}
				
		if (!allAbsFields.empty() && cls.constructor != null && cls.constructor.get().isPublic) {
			var missingFields = [];
			for (k in allAbsFields.keys()) missingFields.push(k);
			Context.error("Abstract class cannot have public constructor. Missing implementation of: " + missingFields.join(", "), cls.pos);
		}
		
		typesToProcess.remove(clsName);
	}
	
	static public function build():Array<Field> {
		var fields = Context.getBuildFields();
		var cls = Context.getLocalClass().get();
		var clsName = getFullClassName(cls);
		
		if (declAbstracts.exists(clsName)){
			//The class has been built already.
			//It occurs when a class extends an AbstractClass, and it also implements AbstractClass.
			return fields;
		}
		
		if (cls.isInterface) {
			return fields;
		}
		
		var absFields = new StringMap();
		declAbstracts.set(clsName, absFields);
		
		for (f in fields) {
			if (f.access.has(AStatic)) continue; //we only care non-static methods
			
			switch (f.kind) {
				case FFun(fun):
					if (fun.expr == null) { //method without an implementation
						absFields.set(f.name, true);
						
						//give a method body so it compiles
						fun.expr = if (fun.ret == null || switch (fun.ret) { case TPath(p): p.pack.length == 0 && p.name == "Void"; default: false; })
							macro throw "abstract method, must override";
						else
							macro return throw "abstract method, must override";
					
					}
				default:
			}
		}
		
		return fields;
	}
	#end
}