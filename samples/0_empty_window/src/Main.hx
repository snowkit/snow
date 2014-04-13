
import lumen.Lumen;


class Main {

    var _lumen_ : Lumen<Main>;

    public function new () {

    } //new

    public function ready ( _lumen : Lumen<Main> ) : Void {
        
        _lumen_ = _lumen;

        trace('ready');

    } //ready

} //Main
