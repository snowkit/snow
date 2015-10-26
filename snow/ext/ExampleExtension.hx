package ext;

import snow.extension.SnowExtension;

class ExampleExtension implements SnowExtension {

    public function new() {
        trace('example extension new');
    } //new

    public function onevent( ) {
        trace('example extension event');
    } //onevent

} //ExampleExtension