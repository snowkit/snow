
var   exec = require('child_process').exec
    , spawn = require('child_process').spawn
    , fs = require('fs')
    , os = require('os')
    , path = require('path')


var tools = {};

exports.hook = function(flow, done) {

    if(flow.target == 'ios') {
        return tools.ios_combine_archs(flow, done);
    }

    done();

} //hook



tools.ios_combine_archs = function(flow, done) {

    if(flow.flags.archs) {

        var archs = flow.flags.archs.split(',');
            archs = archs.map(function(a){ return a.trim(); });

        flow.log(2, "post build - ios - combining multiple archs into one", archs);

        var dest = '../ndll/iPhone/libsnow.ios.a';

        var args = ['-sdk','iphoneos', 'lipo',
                    '-output', dest,
                    '-create'];

        var input_list = [
            '../ndll/iPhone/libsnow.iphonesim.a',      //sim i386
            '../ndll/iPhone/libsnow.iphonesim-64.a',   //sim x86_64
            '../ndll/iPhone/libsnow.iphoneos-v7.a',    //armv7
            '../ndll/iPhone/libsnow.iphoneos-v7s.a',   //armv7s
            '../ndll/iPhone/libsnow.iphoneos-64.a',    //arm64
        ];

        args = args.concat(input_list);

        tools.exec(flow, 'xcrun', args, { quiet:false }, function(code,out,err){
            flow.log(2, 'snow post build - done');
            if(done) done(code);
        });

        return;

    }  //if multiple archs

} //ios_combine_archs


tools.exec = function(flow, cmd, args, opt, done) {

    flow.log(3, 'process util - running : %s', cmd, args.join(' '));

    try {

        var prevwd = process.cwd();

        args = args || [];
        opt = opt || { env:process.env, cwd:prevwd };

        var _process = spawn(cmd, args, opt);
        var stderr = '';
        var stdout = '';

        _process.stdout.on('data', function (data) {
            var latest = data.toString('utf8');
            stdout += latest;
            if(!opt.quiet) {
                process.stdout.write(latest);
            }
        });

        _process.stderr.on('data', function (data) {
            var latest = data.toString('utf8');
            stderr += latest;
            if(!opt.quiet) {
                process.stdout.write(latest);
            }
        });

        _process.on('error', function (err) {
             flow.log(1, 'process util - failed to run : %s', cmd, args.join(' '));
             flow.log(1, 'process util -', err);
        });

        _process.on('close', function (code) {
            flow.log(4, 'process util - child process %s exited with code %d', cmd, code);
            process.chdir(prevwd);
            if(done) done(code, stdout, stderr);
        });

    } catch(e) {
        flow.log(1, 'process util - failed to run! : %s', cmd, args.join(' '));
        flow.log(1, 'process util -', e);
    }

} //exec