package org.haxe;


// Wrapper for native library


public class HXCPP {

	private static boolean inited = false;

	public static native void main ();
	public static void run() {
		if (!inited) {
			inited = true;
			main();
		}
	}


}