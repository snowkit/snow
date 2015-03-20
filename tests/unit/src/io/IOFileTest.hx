package io;

import snow.platform.native.io.IOFile;
import snow.io.typedarray.Uint8Array;

class IOFileTest extends mohxa.Mohxa {

    public function new() {

        super();

        describe('IOFile write', function(){

            log('writing a test file');

            it('should correctly write the file', function(){

                var file : IOFile = IOFile.from_file('test.txt', 'w');
                var bytes = haxe.io.Bytes.ofString('snow iofile write');

                    var written = file.write( new Uint8Array(bytes), bytes.length, 1 );
                    file.close();

                equal( 1, written, 'written == 1' );

            });

        }); //write

        describe('IOFile read', function(){

            log('read the test file written above');

            it('should correctly read the file', function(){

                var read : IOFile = IOFile.from_file('test.txt', 'r');

                //jump to the end, measure size

                    read.seek(0, IOSeek.end);
                var size = read.tell();
                    read.seek(0, IOSeek.set);

                //create a buffer to read to

                var dest = new Uint8Array(size);
                    read.read(dest, dest.length, 1);
                    read.close();

                //convert back to bytes

                equal( 17, size, 'size == 17' );
                equal( 'snow iofile write', dest.buffer.toString(), 'result == "snow iofile write"' );

            });

        }); //read

    }

}