var   path = require('path')
    , fs = require('fs')


var mobile = {};

exports.hook = function(flow, done) {

    var ios_or_android = (flow.target == 'ios' || flow.target == 'android');
    if(ios_or_android) {
        var force_generate = flow.flags['generate-project'];
        if(flow.target == 'ios') {
            return mobile.ios(flow, done, force_generate);
        } else if(flow.target == 'android') {
            return mobile.android(flow, done, force_generate);
        }
    }

    done();

} //hook


mobile.ios = function(flow, done, force_generate) {

    var _project_source = path.resolve(__dirname, '../ios/');
    var _project_path = path.join(flow.project.root, flow.project.paths.ios.project);
    var _generate = force_generate || !fs.existsSync(_project_path);
    var _app_name = flow.project.source.project.app.name;
    
    flow.log(3, 'snow - checking ios project path... `%s`', _project_path);

    if(_generate) {
        flow.log(2, 'snow - ios project - required, creating...');
        flow.log(3, '    - creating from `%s`', _project_source);
        
        flow.files.template_path('project', path.join(_project_source,'snowapp.xcodeproj'), path.join(_project_path,_app_name+'.xcodeproj'));
        flow.files.template_path('project', path.join(_project_source,'project'), path.join(_project_path,'project'));

        flow.log(2, 'snow - ios project - created at `%s`', _project_path);
        done(null, true);
    } else {
        flow.log(2, 'snow - ios project - exists at `%s`', _project_path);
        done();
    }

} //ios

mobile.android = function(flow, done, force_generate) {

    var _project_source = path.resolve(__dirname, '../android-studio/');
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