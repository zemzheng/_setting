" 为自己定义
let g:user_emmet_settings = {
            \     'javascript' : {
            \         'snippets' : {
            \             'grunt' : ""
            \             . "String.prototype.format = function(){\n"
            \             . "\tvar arr = Array.prototype.slice.call( arguments, 0 );\n"
            \             . "\n"
            \             . "\treturn this.replace( /%s/g, function(){\n"
            \             . "\t\tvar t = arr.shift();\n"
            \             . "\t\treturn t ? t : '';\n"
            \             . "\t} );\n"
            \             . "\n"
            \             . "}\n"
            \             . "\n"
            \             . "var replaceRoot = function( json, root ){\n"
            \             . "\t\treturn JSON.parse( \n"
            \             . "\t\t\tJSON.stringify( json )\n"
            \             . "\t\t\t\t.replace( /%r/g, root )\n"
            \             . "\t\t);\n"
            \             . "\t}\n"
            \             . "\n"
            \             . "module.exports = function( grunt ){\n"
            \             . "\n"
            \             . "\tvar root_target = '|online'; // TODO;\n"
            \             . "\tvar pkg = grunt.file.readJSON('package.json');\n"
            \             . "\n"
            \             . "\tgrunt.initConfig({\n"
            \             . "\t\tpkg: pkg,\n"
            \             . "\t\tcopy: {\n"
            \             . "\t\t\tmain : {\n"
            \             . "\t\t\t\tcwd: 'htdocs',\n"
            \             . "\t\t\t\tsrc: ['**'],\n"
            \             . "\t\t\t\tdest: root_target,\n"
            \             . "\t\t\t\texpand: true\n"
            \             . "\t\t\t}\n"
            \             . "\t\t},\n"
            \             . "\t\tclean : {\n"
            \             . "\t\t\toptions : { force : true },\n"
            \             . "\t\t\tlive: replaceRoot( [ '%r/**/*.src' ], root_target ), \n"
            \             . "\t\t\tall:  replaceRoot( [ '%r/*' ],\t\troot_target )\n"
            \             . "\t\t},\n"
            \             . "\t\tconcat : {\n"
            \             . "\t\t\tdist: {\n"
            \             . "\t\t\t\tfiles: replaceRoot(\n"
            \             . "\t\t\t\t\t{\n"
            \             . "\t\t\t\t\t\t'%r/to.html' : [ // TODO;\n"
            \             . "\t\t\t\t\t\t\t'%r/from.html'\n"
            \             . "\t\t\t\t\t\t]\n"
            \             . "\t\t\t\t\t},\n"
            \             . "\t\t\t\t\troot_target\n"
            \             . "\t\t\t\t)\n"
            \             . "\t\t\t}\n"
            \             . "\t\t},\n"
            \             . "\t\tuglify : (function( root_target ){\n"
            \             . "\t\t\tvar files = replaceRoot( \n"
            \             . "\t\t\t\t\t{\n"
            \             . "\t\t\t\t\t\t'%r/to.js' : [ // TODO;\n"
            \             . "\t\t\t\t\t\t\t'%r/to.src/from.js',\n"
            \             . "\t\t\t\t\t\t\t'%r/to.src/*.js'\n"
            \             . "\t\t\t\t\t\t]\n"
            \             . "\t\t\t\t\t}, \n"
            \             . "\t\t\t\t\troot_target\n"
            \             . "\t\t\t\t);\n"
            \             . "\t\t\treturn {\n"
            \             . "\t\t\t\tdebug : {\n"
            \             . "\t\t\t\t\toptions : {\n"
            \             . "\t\t\t\t\t\tbeautify : true,\n"
            \             . "\t\t\t\t\t\tcompress : false,\n"
            \             . "\t\t\t\t\t\tmangle   : false\n"
            \             . "\t\t\t\t\t},\n"
            \             . "\t\t\t\t\tfiles : files\n"
            \             . "\t\t\t\t},\n"
            \             . "\t\t\t\tlive : {\n"
            \             . "\t\t\t\t\toptions: {\n"
            \             . "\t\t\t\t\t  banner: '/*! %s - zemzheng@gmail.com - %s */'.format( pkg.name, new Date )\n"
            \             . "\t\t\t\t\t},\n"
            \             . "\t\t\t\t\tfiles : files\n"
            \             . "\t\t\t\t}\n"
            \             . "\t\t\t}\n"
            \             . "\t\t\t\n"
            \             . "\t\t})( root_target ),\n"
            \             . "\n"
            \             . "\t\ti18n: (function(){\n"
            \             . "\t\t\tvar _src\t= replaceRoot( [ '%r/**' ], root_target ),\n"
            \             . "\t\t\t\t_lang   = {\n"
            \             . "\t\t\t\t\tpath: 'i18n.po', // TODO;\n"
            \             . "\t\t\t\t\tname: 'en_US'\n"
            \             . "\t\t\t\t},\n"
            \             . "\t\t\t\t_ignore = [ // TODO;\n"
            \             . "\t\t\t\t\t/jquery[^\\.].js/i,\n"
            \             . "\t\t\t\t\t/template.js/,\n"
            \             . "\t\t\t\t\t/bootstrap/i,\n"
            \             . "\t\t\t\t\t/select2/\n"
            \             . "\t\t\t\t];\n"
            \             . "\t\t\treturn {\n"
            \             . "\t\t\t\toptions : {\n"
            \             . "\t\t\t\t\ttemplate : {\n"
            \             . "\t\t\t\t\t\tsetting : {\n"
            \             . "\t\t\t\t\t\t\topenTag  : '{{',\n"
            \             . "\t\t\t\t\t\t\tcloseTag : '}}',\n"
            \             . "\t\t\t\t\t\t\tisEscape : false\n"
            \             . "\t\t\t\t\t\t}\n"
            \             . "\t\t\t\t\t}\n"
            \             . "\t\t\t\t},\n"
            \             . "\t\t\t\tgettext: {\n"
            \             . "\t\t\t\t\taction  : 'gettext',\n"
            \             . "\t\t\t\t\tsrc\t : _src,\n"
            \             . "\t\t\t\t\tlang\t: _lang,\n"
            \             . "\t\t\t\t\tignores : _ignore\n"
            \             . "\t\t\t\t},\n"
            \             . "\t\t\t\txgettext : {\n"
            \             . "\t\t\t\t\taction  : 'gettext',\n"
            \             . "\t\t\t\t\tsrc\t : _src,\n"
            \             . "\t\t\t\t\tlang\t: _lang,\n"
            \             . "\t\t\t\t\tignores : _ignore\n"
            \             . "\t\t\t\t},\n"
            \             . "\t\t\t};\n"
            \             . "\t\t})()\n"
            \             . "\t});\n"
            \             . "\n"
            \             . "\tgrunt.loadNpmTasks('grunt-contrib-jshint');\n"
            \             . "\tgrunt.loadNpmTasks('grunt-contrib-uglify');\n"
            \             . "\tgrunt.loadNpmTasks('grunt-contrib-clean');\n"
            \             . "\tgrunt.loadNpmTasks('grunt-contrib-copy');\n"
            \             . "\tgrunt.loadNpmTasks('grunt-contrib-concat');\n"
            \             . "\tgrunt.loadNpmTasks('grunt-ziey-i18n');\n"
            \             . "\n"
            \             . "\t// TODO;\n"
            \             . "\tgrunt.registerTask('default', [ 'clean:all', 'copy', 'i18n', 'concat:dist', 'uglify:debug' ]);\n"
            \             . "\tgrunt.registerTask('live',\t[ 'clean:all', 'copy', 'i18n', 'concat:dist', 'uglify:live', 'clean:live' ]);\n"
            \             . "\n"
            \             . "}\n",
            \             'comment' : 
            \                    "/**\n"
            \                   ." * @author zemzheng (zemzheng@gmail.com)\n"
            \                   ." * @description |\n"
            \                   ." **/\n",
            \             'email'   : 'zemzheng@gmail.com',
            \
            \             'us'      : "\"use strict\";\n\n|",
            \             'closure' : "(function(){\n"
            \                       . "\t${child}|\n"
            \                       . "})();\n",
            \
            \             'while' : "while( | ){\n\t\n}\n",
            \             'for'   : "for( | ){\n\t\n}\n",
            \             'if'    : "if( | ){\n\t\n}\n",
            \             'switch': "switch( | ){\n"
            \                      ."\tcase:\n"
            \                      ."\t\t|"
            \                      ."\t\tbreak;"
            \                      ."}\n",
            \
            \              'var-list-item'   : "var item, list = |",
            \              'while-list-item' : "i = 0; ii = list.length;\n"
            \                                 ."while( i < ii ){\n"
            \                                 ."\titem=list[ i++ ];\n"
            \                                 ."\t|\n"
            \                                 ."}\n",
            \              'for-key-list'    : "for( key in list ){\n"
            \                                 ."\t|\n "
            \                                 ."}\n"
            \         }
            \     },
            \
            \     'html' : {
            \         'snippets' : {
            \             'bs-viewport'      : "meta[name=viewport][content=width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no]",
            \             'bs-input'         : "label,input[type=text].form-control",
            \             'bs-checkbox'      : ".checkbox>label>input[type=checkbox]",
            \             'bs-radio'         : ".radio>label>input[type=radio]",
            \             'bs-dropdown'      : ".dropdown>button.btn.dropdown-toggle,bs-dropdown-menu",
            \             'bs-dropdown-menu' : ".dropdown-menu>li.dropdown-header,li.divider,li>a",
            \             'bs-pagination'    : ".dropdown-menu>li.dropdown-header,li.divider,li>a",
            \             'bs-listgroup'     : ".list-group>.list-group-item",
            \         }
            \     }
            \ }


