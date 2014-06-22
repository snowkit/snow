package buffers;

import snow.utils.ArrayBuffer;
import snow.utils.Int8Array;

class TestInt8Array extends mohxa.Mohxa {

    public function new() {

        super();

        describe('Int8Array test01', function(){

            log('creating Int8Array of 2 elements');

            var x = new Int8Array(2);

            log('setting [0] to 17');

            x[0] = 17;

            it('should be correctly constructed from n elements and set using Array Access', function(){
                equal( 17, x[0], 'element [0] == 17' );
                equal( 0, x[1], 'element [1] == 0' );
                equal( 2, x.length, 'length == 2' );
            });

        }); //test01

        describe('Int8Array test02', function(){

            log('creating Int8Array from array of 2 [17,-45]');

            var x = new Int8Array([17, -45]);

            it('should be correctly constructed from array of Int', function(){
                equal( 17, x[0], 'element [0] == 17' );
                equal( -45, x[1], 'element [1] == -45' );
                equal( 2, x.length, 'length == 2' );
            });

        }); //test02

        describe('Int8Array test03', function(){

            log('creating Int8Array x from array of 2 [17,-45]');
            log('creating second Int8Array y from first array .buffer');

            var x = new Int8Array([17, -45]);
            var y = new Int8Array(x.buffer);

            it('should share a buffer from other array buffer', function(){

                equal(17, x[0], 'x element [0] == 17');
                equal(-45, x[1], 'x element [1] == -45');
                equal(2, x.length, 'x length == 2');

                equal(17, y[0], 'y element [0] == 17');
                equal(-45, y[1], 'y element [1] == -45');
                equal(2, y.length, 'y length == 2');

                log('setting x element [0] to -2');

                x[0] = -2;

                equal(-2, y[0], 'element [0] == -2');

            });

        }); //test3

        describe('Int8Array test04', function(){

            log('creating Int8Array x from array of 2 [17,-45]');
            log('creating second Int8Array y from first array itself');

            var x = new Int8Array([17, -45]);
            var y = new Int8Array(x);

            it('should share a buffer from other array', function(){

                equal(17, x[0], 'x element [0] == 17');
                equal(-45, x[1], 'x element [1] == -45');
                equal(2, x.length, 'x length == 2');

                equal(17, y[0], 'y element [0] == 17');
                equal(-45, y[1], 'y element [1] == -45');
                equal(2, y.length, 'y length == 2');

                log('setting x element [0] to -2');

                x[0] = -2;

                equal(17, y[0], 'y element [0] == -2');

            });

        }); //test4

        describe('Int8Array test05', function(){

            log('creating ArrayBuffer(12) and x,y as Int8Array with buffer and mapping');

            var buffer = new ArrayBuffer(12);
            var x = new Int8Array(buffer, 0, 6);
            var y = new Int8Array(buffer, 4, 1);

            log('setting x[4] = 4');

                x[4] = 4;

            it('should construct from shared ArrayBuffer and have values mapped', function(){

                equal(4, y[0], 'y element 0 == 4');

            });

        }); //test5

        describe('Int8Array test06', function(){

            log('creating Int8Array(10)');

            var x = new Int8Array(10);

            log('calling set([18,93,42],3)');

            x.set([18, 93, 42], 3);

            it('should set from normal int array', function(){

                equal(18, x[3]);
                equal(93, x[4]);
                equal(42, x[5]);

            });

        }); //test6

        describe('Int8Array test07', function(){

            log('creating Int8Array(10)');

            var x = new Int8Array(10);

            log('calling set(new Int8Array([18, 93, 42]), 3)');

            x.set(new Int8Array([18, 93, 42]), 3);

            it('should set from other Int8Array', function(){

                equal(18, x[3]);
                equal(93, x[4]);
                equal(42, x[5]);

            });

        }); //test7

        describe('Int8Array test08', function(){

            log('creating x = Int8Array([0, 1, 2, 3, 4, 5])');

            var x = new Int8Array([0, 1, 2, 3, 4, 5]);

            log('creating y = x.subarray(2,5)');

            var y = x.subarray(2, 5);

            it('Show map correctly as a buffer view', function(){

                equal(3, y.length, 'y.length == 3');
                equal(2, y[0], 'y[0] == 2');
                equal(3, y[1], 'y[1] == 3');

                log('setting y[0] = -1');

                y[0] = -1;

                equal(-1, x[2], 'x[2] == -1');

            });

        }); //test8

        run();

    } //new


} //TestInt8Array
