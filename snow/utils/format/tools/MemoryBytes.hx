package snow.utils.format.tools;

@:native('Int')
extern class MemoryBytes {
	
	public static inline function make( pos : Int ) : MemoryBytes {
		return cast pos;
	}
	
	inline function getPos() : Int {
		return cast this;
	}

	
}
