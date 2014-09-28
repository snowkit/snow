package buffers;

import snow.utils.ArrayBuffer;
import snow.utils.Float32Array;

class TestFloat32Array extends mohxa.Mohxa {

    public function new() {

        super();

        describe('Float32Array test01', function(){

            log('creating Float32Array of 2 elements');

            var x = new Float32Array(2);

            log('setting [0] to 17');

            x[0] = 17;

            it('should be correctly constructed from n elements and set using Array Access', function(){
                equalfloat( 17.0, x[0], 'element [0] == 17.0' );
                equalfloat( 0.0, x[1], 'element [1] == 0' );
                equal( 2, x.length, 'length == 2' );
            });

        }); //test01

        describe('Float32Array test02', function(){

            log('creating Float32Array from array of 2 [17,-45.3]');

            var x = new Float32Array([17, -45.3]);

            it('should be correctly constructed from array of Int', function(){
                equalfloat( 17.0, x[0], 'element [0] == 17.0' );
                equalfloat( -45.3, x[1], 'element [1] == -45.3' );
                equal( 2, x.length, 'length == 2' );
            });

        }); //test02

        describe('Float32Array test03', function(){

            log('creating Float32Array x from array of 2 [17,-45.3]');
            log('creating second Float32Array y from first array .buffer');

            var x = new Float32Array([17, -45.3]);
            var y = new Float32Array(x.buffer);

            it('should share a buffer from other array buffer', function(){

                equalfloat(17.0, x[0], 'x element [0] == 17.0');
                equalfloat(-45.3, x[1], 'x element [1] == -45.3');
                equalfloat(2, x.length, 'x length == 2');

                equalfloat(17.0, y[0], 'y element [0] == 17.0');
                equalfloat(-45.3, y[1], 'y element [1] == -45.3');
                equal(2, y.length, 'y length == 2');

                log('setting x element [0] to -2');

                x[0] = -2;

                equalfloat(-2.0, y[0], 'element [0] == -2.0');

            });

        }); //test3

        describe('Float32Array test04', function(){

            log('creating Float32Array x from array of 2 [17,-45.3]');
            log('creating second Float32Array y from first array itself');

            var x = new Float32Array([17, -45.3]);
            var y = new Float32Array(x);

            it('should share a buffer from other array', function(){

                equalfloat(17.0, x[0], 'x element [0] == 17.0');
                equalfloat(-45.3, x[1], 'x element [1] == -45.3');
                equal(2, x.length, 'x length == 2');

                equalfloat(17.0, y[0], 'y element [0] == 17.0');
                equalfloat(-45.3, y[1], 'y element [1] == -45.3');
                equal(2, y.length, 'y length == 2');

                log('setting x element [0] to -2');

                x[0] = -2;

                equalfloat(17.0, y[0], 'y element [0] == 17.0');

            });

        }); //test4

        describe('Float32Array test05', function(){

            log('creating ArrayBuffer(12) and x,y as Float32Array with buffer and mapping');

            var buffer = new ArrayBuffer(12);
            var x = new Float32Array(buffer, 0, 2);
            var y = new Float32Array(buffer, 4, 1);

            log('setting x[1] = 7');

                x[1] = 7;

            it('should construct from shared ArrayBuffer and have values mapped', function(){

                equalfloat(7.0, y[0], 'y element 0 == 7.0');

            });

        }); //test5

        describe('Float32Array test06', function(){

            log('creating Float32Array(10)');

            var x = new Float32Array(10);

            log('calling set([18,93,42],3)');

            x.set([18, 93, 42], 3);

            it('should set from normal int array', function(){

                equalfloat(18.0, x[3], 'x[3] == 18.0');
                equalfloat(93.0, x[4], 'x[4] == 93.0');
                equalfloat(42.0, x[5], 'x[5] == 42.0');

            });

        }); //test6

        describe('Float32Array test07', function(){

            log('creating Float32Array(10)');

            var x = new Float32Array(10);

            log('calling set(new Float32Array([18, 93, 42]), 3)');

            x.set(new Float32Array([18, 93, 42]), 3);

            it('should set from other Float32Array', function(){

                equalfloat(18.0, x[3], 'x[3] == 18.0');
                equalfloat(93.0, x[4], 'x[4] == 93.0');
                equalfloat(42.0, x[5], 'x[5] == 42.0');

            });

        }); //test7

        describe('Float32Array test08', function(){

            log('creating x = Float32Array([0, 1, 2, 3, 4, 5])');

            var x = new Float32Array([0, 1, 2, 3, 4, 5]);

            log('creating y = x.subarray(2,5)');

            var y = x.subarray(2, 5);

            it('Show map correctly as a buffer view', function(){

                equal(3, y.length, 'y.length == 3');
                equalfloat(2.0, y[0], 'y[0] == 2.0');
                equalfloat(3.0, y[1], 'y[1] == 3.0');

                log('setting y[0] = -1');

                y[0] = -1;

                equalfloat(-1.0, x[2], 'x[2] == -1.0');

            });

        }); //test8

    } //new

} //TestFloat32Array
