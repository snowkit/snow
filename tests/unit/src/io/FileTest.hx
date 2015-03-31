package io;

import snow.io.File;
import snow.io.typedarray.Uint8Array;

class FileTest extends mohxa.Mohxa {

    public function new() {

        super();

        describe('File write', function(){

            log('writing a test file');

            it('should correctly write the file', function(){

                var file : File = File.from_file('test.txt', 'w');
                var bytes = haxe.io.Bytes.ofString('snow file write');

                    var written = file.write( new Uint8Array(bytes), bytes.length, 1 );
                    file.close();

                equal( 1, written, 'written == 1' );

            });

        }); //write

        describe('File read', function(){

            log('read the test file written above');

            it('should correctly read the file', function(){

                var read : File = File.from_file('test.txt', 'r');

                //jump to the end, measure size

                    read.seek(0, FileSeek.end);
                var size = read.tell();
                    read.seek(0, FileSeek.set);

                //create a buffer to read to

                var dest = new Uint8Array(size);
                    read.read(dest, dest.length, 1);
                    read.close();

                //convert back to bytes

                equal( 15, size, 'size == 15' );
                equal( 'snow file write', dest.buffer.toString(), 'result == "snow file write"' );

            });

        }); //read

    }

}