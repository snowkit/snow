    
    var api = {};

    var helper   = require('./generate_helper'),
        mustache = require('mustache');
        path     = require('path');

    api.generate = function(config) {

            helper.log('- parsing json api description');

        api.generate_api_sources( config );

            helper.log('- generating api md\'s');

        api.generate_md_files( config );

    } //generate

    api.generate_api_sources = function( config ) {

        var _doc_json = helper.read_file( config.api_source_json );

        if(_doc_json) {

            var doc_json = JSON.parse(_doc_json);

            //we parse each top level object from scribe and spit out a template file for 
            //the documentator to take and run with
            if(doc_json) {
                var classes = doc_json.classes;
                if(classes) {
                    for(var i = 0; i < classes.length; ++i) {

                        var theclass = classes[i];
                        var filename = theclass.name;
                        var output_json = {
                            source : filename,
                            links : [],
                            toplinks : [],
                            sections : []
                        }

                        //now go through and add the sections,
                        //extends, implements, members, properties, methods
                        if(theclass["extends"].length != 0) {
                            output_json.sections.push({
                                name : "Extends",
                                link : "#Extends",
                                values : theclass["extends"]
                            });
                        } //extends != 0

                        if(theclass["implements"].length != 0) {
                             output_json.sections.push({
                                name : "Implements",
                                link : "#Implements",
                                values : theclass["implements"]
                            });
                        }

                        if(theclass["members"].length != 0) {
                             output_json.sections.push({
                                name : "Members",
                                link : "#Members",
                                values : theclass["members"]
                            });
                        }
                        
                        if(theclass["meta"].length != 0) {
                             output_json.sections.push({
                                name : "Meta",
                                link : "#Meta",
                                values : theclass["meta"]
                            });
                        }

                        if(theclass["properties"].length != 0) {
                             output_json.sections.push({
                                name : "Properties",
                                link : "#Properties",
                                values : theclass["properties"]
                            });
                        }

                        if(theclass["methods"].length != 0) {
                            output_json.sections.push({
                                name : "Methods",
                                link : "#Methods",
                                values : theclass["methods"]
                            });
                        }

                            //write out a single file per class, into it's package folder
                        var packages = theclass.name.split('.');
                            //remove the class name from the end
                        var class_name = packages.pop();
                            //find where this file will end up
                        var package_path = config.apis_path + packages.join('/') + '/';
                            //generate the package folders if required
                        helper.create_folder_path( package_path );
                            //work out the final file destination
                        var api_file = package_path + class_name + ".json";
                            //debugging
                        helper.verbose("\t- refreshing api file from scribe .. " + api_file);
                            //write the generated file to the path 
                        helper.write_file( api_file, JSON.stringify(output_json, null, 2) );

                    } //for each class
                }
            } //if doc json

        } //_docs_json

    } //generate_api_sources

    api.generate_md_files = function( config ) {

        helper.log('- parsing code api files from ' + config.apis_path + config.api_input);

        var _api_template = helper.read_file( config.template_path + config.api_template );
        var _api_index_template = helper.read_file( config.template_path + config.api_index_template );

        var _list = helper.glob_list( config.apis_path + config.api_input );
        var _api_list = [];

        for(i = 0; i < _list.length; ++i) {
            
            helper.verbose("\t- attempting api file " + _list[i]);

            var _api_details = helper.json( _list[i] );

            if(_api_details && _api_details.source && _api_details.sections) {

                _api_list.push({ 
                    name:  _api_details.source, 
                    link: _api_details.source.replace('.','/')+'.html' 
                });

                var _dest_path = _list[i];
                    _dest_path = _dest_path.replace( config.apis_path, '');
                    _dest_path = path.join( config.api_out_md_path, _dest_path );
                
                var _context = {
                    toplinks : '',
                    links : '',
                    content : '',
                    rel_path : helper.get_rel_path_count(_dest_path)
                }; 

                    //for each top link, add it
                for(_j = 0; _j < _api_details.toplinks.length; ++_j) {
                    _link = _api_details.toplinks[_j];
                    _context.toplinks += '###[' + _link.name + '](' + _link.link + ')   \n';
                }

                    //for each link, add it
                for(_j = 0; _j < _api_details.links.length; ++_j) {
                    _link = _api_details.links[_j];
                    _context.links += '[' + _link.name + '](' + _link.link + ')   \n';
                }
                    
                    //for each section
                for(_j = 0; _j < _api_details.sections.length; ++_j) {
                    var _section = _api_details.sections[_j];     

                    _context.content += '&nbsp;   \n\n';

                    var _section_header_content = '';
                    var _added_section_header = false;

                    if(_section.values.length) {

                        if(_section.link){
                            _section_header_content += '<a class="lift" name="'+_section.name+'" ></a>\n';
                        }

                        _section_header_content += '###' + _section.name + '   \n---\n';
                    
                    } //if section has any values
                    
                        //now for each section value
                    for(_k = 0; _k < _section.values.length; ++_k) {

                        var _value = _section.values[_k];
                        var _skip = false;

                        if( _section.name == 'Methods' || _section.name == 'Members' ) {
                            if( _value["public"] != true) {
                                _skip = true;
                            }
                        }

                        var _meta_exists = _value["meta"];
                        if( _meta_exists ) {
                                //for each of the item in the meta
                            var _meta = _value["meta"];
                            for(var _l = 0; _l < _meta.length; ++_l ) {
                                var _meta_name = _meta[_l].name;
                                var _meta_value = _meta[_l].value;
                                if(_meta_name === ':noCompletion' || _meta_name === ':hide') {
                                    _skip = true;
                                } else if(_meta_name === ':desc') {
                                    _value.desc = _meta_value;
                                }
                            }
                        } //meta_exists

                        if(_section.name == 'Meta') { _skip = true; }

                        if(_skip) {
                            continue;
                        }

                        if(!_added_section_header) {
                                //add the header
                            _context.content += _section_header_content;
                                //and add the links                            
                            _context.links += '[' + _section.name + '](' + _section.link + ')   \n';

                            // helper.log("ADDING SECTION LINK TO LIST " + _section.name + " / " + _section.link);
                            // helper.log(_context.links);

                            _added_section_header = true;
                        }

                        if(_section.name == 'Extends') {

                            var _extends_link = _value.name.replace('.','/')+'.html' 
                            _context.content += '<a class="lift" name="'+_value.name+'" href="'+_extends_link+'">'+_value.name+'</a>\n\n';

                        } else if(_section.name != 'Meta') {

                            _context.content += '<a class="lift" name="'+_value.name+'" href="#'+_value.name+'">'+_value.name+'</a>\n\n';
                            _context.content += '\n\n    ' + _value.signature +'\n\n';
                            _context.content += '<span class="small_desc_flat"> ' + (_value.desc || "no description")+ ' </span>   \n\n';

                        }

                    } //each section value

                } //each section

                    //write out a single file per class, into it's package folder
                var packages = _api_details.source.split('.');
                    //remove the class name from the end
                var class_name = packages.pop();
                    //find the output file name
                var package_path = config.md_path + config.api_out_md_path + packages.join('/') + '/';
                    //create the paths if necessary
                helper.create_folder_path( package_path );
                    //the end resulting file
                var api_file_dest = package_path + class_name + '.md';
                    //complete the generated template md
                var _template_out = mustache.render( _api_template, _context );
                    //log the details
                helper.verbose("\t - generating file " + api_file_dest);
                    //save it
                helper.write_file( api_file_dest , _template_out );

            } //if valid

        } //list.length

            //work out the end file
        var _out_dest = config.api_out_md_path + config.api_index_out;

        var _rel_test = _out_dest.replace('.md','.html');
        
        var _index_context = { api_list : _api_list, rel_path:helper.get_rel_path_count(_rel_test) };
            //template the index file with the list
        var _template_out = mustache.render( _api_index_template, _index_context );
            //write the correct file to the correct location
        _out_dest = config.md_path + config.api_out_md_path + config.api_index_out;        
            //write out to the destination
        helper.write_file( _out_dest , _template_out );
            //debug
        helper.verbose("\t - wrote api index file " + _out_dest);

        helper.log("- generated api files complete");

    } //generate_md_files


    // var _api_replacement = function( _content ) {
        
    //     var _replacements = config.replacements;

    //     var _count = _replacements.length;
    //     var _output = _content;

    //     for(var i = 0; i < _count; i++) {

    //         var _item = _replacements[i];
    //         var _replace = new RegExp( "(\\b" + _item.key + "\\b)(?!.*</a>)", 'g');

    //         _output = _output.replace( _replace, '<a href="'+_item.link+'">'+_item.key+'</a>' );

    //     } //each replacement

    //     return _output;

    // } //_api_replacement


    module.exports = api;

