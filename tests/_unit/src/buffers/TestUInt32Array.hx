package snow.unit.buffers;

import snow.unit.UnitTest;
import snow.utils.ArrayBuffer;
import snow.utils.UInt32Array;

class TestUInt32Array extends UnitTest
{
	public function test01()
	{
		var x = new UInt32Array(2);
		x[0] = 17;
		assertEquals(17, x[0]);
		assertEquals(0, x[1]);
		assertEquals(2, x.length);
	}
	
	public function test02()
	{
		var x = new UInt32Array([17, -45]);
		assertEquals(17, x[0]);
		assertTrue(uint32Equal(0xffffffd3, x[1]));
		assertEquals(2, x.length);
	}
	
	public function test03()
	{
		var x = new UInt32Array([17, -45]);
		var y = new UInt32Array(x.buffer);
		assertEquals(17, x[0]);
		assertTrue(uint32Equal(0xffffffd3, x[1]));
		assertEquals(2, x.length);
		x[0] = -2;
		assertTrue(uint32Equal(0xfffffffe, y[0]));
	}
	
	public function test04()
	{
		var x = new UInt32Array([17, -45]);
		var y = new UInt32Array(x);
		assertEquals(17, x[0]);
		assertTrue(uint32Equal(0xffffffd3, x[1]));
		assertEquals(2, x.length);
		x[0] = -2;
		assertEquals(17, y[0]);
	}
	
	public function test05()
	{
		var buffer = new ArrayBuffer(12);
		var x = new UInt32Array(buffer, 0, 2);
		var y = new UInt32Array(buffer, 4, 1);
		x[1] = 7;
		assertEquals(7, y[0]);
	}
	
	public function test06()
	{
		var x = new UInt32Array(10);
		x.set([18, 93, 42], 3);
		assertEquals(18, x[3]);
		assertEquals(93, x[4]);
		assertEquals(42, x[5]);
	}
	
	public function test07()
	{
		var x = new UInt32Array(10);
		x.set(new UInt32Array([18, 93, 42]), 3);
		assertEquals(18, x[3]);
		assertEquals(93, x[4]);
		assertEquals(42, x[5]);
	}
	
	public function test08()
	{
		var x = new UInt32Array([0, 1, 2, 3, 4, 5]);
		var y = x.subarray(2, 5);
		assertEquals(3, y.length);
		assertEquals(2, y[0]);
		assertEquals(3, y[1]);
		y[0] = -1;
		assertTrue(uint32Equal(0xffffffff, x[2]));
	}
}
