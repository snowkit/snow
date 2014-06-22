package snow.unit.buffers;

import snow.unit.UnitTest;
import snow.utils.ArrayBuffer;
import snow.utils.UInt8Array;

class TestUInt8Array extends UnitTest
{
	public function test01()
	{
		var x = new UInt8Array(2);
		x[0] = 17;
		assertEquals(17, x[0]);
		assertEquals(0, x[1]);
		assertEquals(2, x.length);
	}
	
	public function test02()
	{
		var x = new UInt8Array([17, -45]);
		assertEquals(17, x[0]);
		assertEquals(211, x[1]);
		assertEquals(2, x.length);
	}
	
	public function test03()
	{
		var x = new UInt8Array([17, -45]);
		var y = new UInt8Array(x.buffer);
		assertEquals(17, x[0]);
		assertEquals(211, x[1]);
		assertEquals(2, x.length);
		x[0] = -2;
		assertEquals(254, y[0]);
	}
	
	public function test04()
	{
		var x = new UInt8Array([17, -45]);
		var y = new UInt8Array(x);
		assertEquals(17, x[0]);
		assertEquals(211, x[1]);
		assertEquals(2, x.length);
		x[0] = -2;
		assertEquals(17, y[0]);
	}
	
	public function test05()
	{
		var buffer = new ArrayBuffer(12);
		var x = new UInt8Array(buffer, 0, 6);
		var y = new UInt8Array(buffer, 4, 1);
		x[4] = 4;
		assertEquals(4, y[0]);
	}
	
	public function test06()
	{
		var x = new UInt8Array(10);
		x.set([18, 93, 42], 3);
		assertEquals(18, x[3]);
		assertEquals(93, x[4]);
		assertEquals(42, x[5]);
	}
	
	public function test07()
	{
		var x = new UInt8Array(10);
		x.set(new UInt8Array([18, 93, 42]), 3);
		assertEquals(18, x[3]);
		assertEquals(93, x[4]);
		assertEquals(42, x[5]);
	}
	
	public function test08()
	{
		var x = new UInt8Array([0, 1, 2, 3, 4, 5]);
		var y = x.subarray(2, 5);
		assertEquals(3, y.length);
		assertEquals(2, y[0]);
		assertEquals(3, y[1]);
		y[0] = -1;
		assertEquals(255, x[2]);
	}
}
