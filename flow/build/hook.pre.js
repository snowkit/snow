var   path = require('path')
    , fs = require('fs')
    , exec = require('child_process').execSync


var mobile = {};
var desktop = {};

exports.hook = function(flow, done) {

        //A temporary solution for the openal binaries while openal is the default
    if(flow.target == 'windows') {
        desktop.copy_openal(flow);
    }

    var generate_project = flow.flags['generate-project'];

    switch(flow.target) {
        case 'ios': {
            return mobile.ios(flow, done, generate_project);
        } break;

        case 'android': {
            return mobile.android(flow, done, generate_project);
        } break;

        case 'mac': {
            return desktop.mac(flow, done, generate_project);
        } break;

    }

    done();

} //hook

desktop.copy_openal = function(flow) {

    var fail = function(e) {
        flow.log(2, 'failed to copy linc_openal binary! reason:', e);
        return false;
    }

    var _out = flow.project.paths.output;
    var _source = '';
    try { _source = exec('haxelib path linc_openal', { encoding:'utf-8'});
    } catch(e) { return fail(e); }

    var _lines = _source.replace('\r\n','\n').split('\n');
        _lines = _lines.map(function(l){ return l.trim(); });
    
    _source = _lines[0];
    if(!_source) return fail('haxelib path returned does not exist. got:'+_lines);
    if(!fs.existsSync(_source)) return fail('haxelib path returned for linc_openal does not exist. got: '+_lines);

    var _folder = 'Windows' + ((flow.target_arch == '64') ? '64' : '');
    _source = path.join(_source, 'lib/openal-soft/lib/', _folder, 'OpenAL32.dll');

    if(!fs.existsSync(_source)) return fail('library for target arch does not exist. expected: '+_source);

    _out = path.join(_out, path.basename(_source));
    flow.log(3, 'build / copying openal library to output path at %s from %s', _out, _source);

    try { fs.writeFileSync(_out, fs.readFileSync(_source));
    } catch(e) { return fail(e) }

    return true;

} //copy_openal

desktop.mac = function(flow, done, generate) {

    // if(!generate) return;

    var _project_source = path.resolve(__dirname, '../mac_project/');
    var _project_path = path.join(flow.project.root, flow.project.paths.mac.project);
    var _app_name = flow.project.source.project.app.name;
    
    if(generate) {
        flow.log(2, 'snow - checking mac project path... `%s`', _project_path);
        flow.log(2, 'snow - mac project - requested, creating...');
        flow.log(3, '    - creating from `%s`', _project_source);
        
        flow.files.template_path('project', path.join(_project_source,'snowapp.xcodeproj'), path.join(_project_path,_app_name+'.mac.xcodeproj'));
        flow.files.template_path('project', path.join(_project_source,'project'), path.join(_project_path,'project'));

        flow.log(2, 'snow - mac project - created at `%s`', _project_path);
        done(null, true);
    } else {
        flow.log(3, 'snow - mac project - exists at `%s`', _project_path);
        done();
    }

}

mobile.ios = function(flow, done, force_generate) {

    var _project_source = path.resolve(__dirname, '../ios/');
    var _project_path = path.join(flow.project.root, flow.project.paths.ios.project);
    var _generate = force_generate || !fs.existsSync(_project_path);
    var _app_name = flow.project.source.project.app.name;
    
    flow.log(3, 'snow - checking ios project path... `%s`', _project_path);

    if(_generate) {
        flow.log(2, 'snow - ios project - required, creating...');
        flow.log(3, '    - creating from `%s`', _project_source);
        
        flow.files.template_path('project', path.join(_project_source,'snowapp.xcodeproj'), path.join(_project_path,_app_name+'.ios.xcodeproj'));
        flow.files.template_path('project', path.join(_project_source,'project'), path.join(_project_path,'project'));

        flow.log(2, 'snow - ios project - created at `%s`', _project_path);
        done(null, true);
    } else {
        flow.log(2, 'snow - ios project - exists at `%s`', _project_path);
        done();
    }

} //ios

mobile.android = function(flow, done, force_generate) {

    var _project_source = path.resolve(__dirname, '../android/');
    var _project_path = path.join(flow.project.root, flow.project.paths.android.project);
    var _generate = force_generate || !fs.existsSync(_project_path);
    
    flow.log(3, 'snow - checking android project path... `%s`', _project_path);

    if(_generate) {
        flow.log(2, 'snow - android project - required, creating...');
        flow.log(3, '    - creating from `%s`', _project_source);
        flow.files.template_path('project', _project_source, _project_path);
        flow.log(2, 'snow - android project - created at `%s`', _project_path);
        done(null, true);
    } else {
        flow.log(2, 'snow - android project - exists at `%s`', _project_path);
        done();
    }

} //android