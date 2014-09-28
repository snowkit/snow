package buffers;

import snow.utils.ArrayBuffer;
import snow.utils.UInt16Array;

/**
    Copyright Sven Bergström, Thomas Hourdel 2014
    Created for snow https://github.com/underscorediscovery/snow
    License MIT
**/

class TestUInt16Array extends mohxa.Mohxa {

    public function new() {

        super();

        describe('UInt16Array test01', function(){

            log('creating UInt16Array of 2 elements');

            var x = new UInt16Array(2);

            log('setting [0] to 17');

            x[0] = 17;

            it('should be correctly constructed from n elements and set using Array Access', function(){
                equal( 17, x[0], 'element [0] == 17' );
                equal( 0, x[1], 'element [1] == 0' );
                equal( 2, x.length, 'length == 2' );
            });

        }); //test01

        describe('UInt16Array test02', function(){

            log('creating UInt16Array from array of 2 [17,-45]');

            var x = new UInt16Array([17, -45]);

            it('should be correctly constructed from array of Int, wrapping negative value', function(){
                equal( 17, x[0], 'element [0] == 17' );
                equal( 65491, x[1], 'element [1] == 65491' );
                equal( 2, x.length, 'length == 2' );
            });

        }); //test02

        describe('UInt16Array test03', function(){

            log('creating UInt16Array x from array of 2 [17,-45]');
            log('creating second UInt16Array y from first array .buffer');

            var x = new UInt16Array([17, -45]);
            var y = new UInt16Array(x.buffer);

            it('should share a buffer from other array buffer, wrapped value', function(){

                equal(17, x[0], 'x element [0] == 17');
                equal(65491, x[1], 'x element [1] == 65491');
                equal(2, x.length, 'x length == 2');

                equal(17, y[0], 'y element [0] == 17');
                equal(65491, y[1], 'y element [1] == 65491');
                equal(2, y.length, 'y length == 2');

                log('setting x element [0] to -2');

                x[0] = -2;

                equal(65534, y[0], 'y element [0] == 65534');

            });

        }); //test3

        describe('UInt16Array test04', function(){

            log('creating UInt16Array x from array of 2 [17,-45]');
            log('creating second UInt16Array y from first array itself');

            var x = new UInt16Array([17, -45]);
            var y = new UInt16Array(x);

            it('should share a buffer from other array', function(){

                equal(17, x[0], 'x element [0] == 17');
                equal(65491, x[1], 'x element [1] == 65491');
                equal(2, x.length, 'x length == 2');

                equal(17, y[0], 'y element [0] == 17');
                equal(65491, y[1], 'y element [1] == 65491');
                equal(2, y.length, 'y length == 2');

                log('setting x element [0] to -2');

                x[0] = -2;

                equal(17, y[0], 'y element [0] == 17');

            });

        }); //test4

        describe('UInt16Array test05', function(){

            log('creating ArrayBuffer(12) and x,y as UInt16Array with buffer and mapping');

            var buffer = new ArrayBuffer(12);
            var x = new UInt16Array(buffer, 0, 6);
            var y = new UInt16Array(buffer, 4, 1);

            log('setting x[2] = 4');

                x[2] = 4;

            it('should construct from shared ArrayBuffer and have values mapped', function(){

                equal(4, y[0], 'y element 0 == 4');

            });

        }); //test5

        describe('UInt16Array test06', function(){

            log('creating UInt16Array(10)');

            var x = new UInt16Array(10);

            log('calling set([18,93,42],3)');

            x.set([18, 93, 42], 3);

            it('should set from normal int array', function(){

                equal(18, x[3], 'x[3] == 18');
                equal(93, x[4], 'x[4] == 93');
                equal(42, x[5], 'x[5] == 42');

            });

        }); //test6

        describe('UInt16Array test07', function(){

            log('creating UInt16Array(10)');

            var x = new UInt16Array(10);

            log('calling set(new UInt16Array([18, 93, 42]), 3)');

            x.set(new UInt16Array([18, 93, 42]), 3);

            it('should set from other UInt16Array', function(){

                equal(18, x[3], 'x[3] == 18');
                equal(93, x[4], 'x[4] == 93');
                equal(42, x[5], 'x[5] == 42');

            });

        }); //test7

        describe('UInt16Array test08', function(){

            log('creating x = UInt16Array([0, 1, 2, 3, 4, 5])');

            var x = new UInt16Array([0, 1, 2, 3, 4, 5]);

            log('creating y = x.subarray(2,5)');

            var y = x.subarray(2, 5);

            it('Show map correctly as a buffer view, wrapping values', function(){

                equal(3, y.length, 'y.length == 3');
                equal(2, y[0], 'y[0] == 2');
                equal(3, y[1], 'y[1] == 3');

                log('setting y[0] = -1');

                y[0] = -1;

                equal(65535, x[2], 'x[2] == 65535');

            });

        }); //test8

    } //new

} //TestUInt16Array
