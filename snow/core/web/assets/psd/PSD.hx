package snow.core.web.assets.psd;

/*
Bindings for https://github.com/meltingice/psd.js
Copyright Sven Bergström
Created for http://snowkit.org/snow
MIT License
*/

class PSD {

    var _PSD : Dynamic;

    public function new() {
        _PSD = untyped window.require('psd');
    }

    public function open( _url:String, _psd_onload:Dynamic->Void ) {

        untyped _PSD.fromURL(_url).then(function(psd){ if(_psd_onload) _psd_onload(psd); });

    } //open

} //PSD