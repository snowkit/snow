package buffers;

import snow.utils.ArrayBuffer;
import snow.utils.Float32Array;

/**
    Copyright Sven Bergström
    Created for snow https://github.com/underscorediscovery/snow
    License MIT
**/

class TestTypedArrayPerformance extends mohxa.Mohxa {

    public function new() {

        super();

        describe('TypedArray Performance test01', function(){

            describe('Float32Array batching', function(){


                var geomcount = Std.int(Math.pow(2,16)); //64k
                var floatcount = Std.int(Math.pow(2,10)); //4k

                log('creating $geomcount arrays of elems=$floatcount');

                var geoms : Array<Float32Array> = [];
                var batch : Float32Array = new Float32Array( floatcount * geomcount );
                var i = 0;

                var mark = Main.ts();

                while(i < geomcount) {
                    geoms.push(
                        new Float32Array(floatcount)
                    );
                    ++i;
                }

                log('create arrays / ${Main.ts() - mark}');
                mark = Main.ts();

                while(i < geomcount) {
                        //copy into the bigger buffer
                    batch.set(geoms[i], i*floatcount );
                }

                log('batch into / ${Main.ts() - mark}');

            });

        }); //test01

    } //new

} //TestTypedArrayPerformance
