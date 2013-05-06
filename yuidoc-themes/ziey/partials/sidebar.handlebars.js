function sub(type, name, displayName){
  return ''                                                                             + 
    '{{#if submodules}}'                                                                + '\n' +
    '  <ul class="nav nav-list">'                                                       + '\n' +
    '    {{#submodules}}'                                                               + '\n' +
    '    <li><a href="{{../../../projectRoot}}modules/' + name + '.html#' + name + '">' + '\n' +
    displayName                                                                         + '\n' +
    '    </a></li>'                                                                     + '\n' +
    '    {{/submodules}}'                                                               + '\n' +
    '  </ul>'                                                                           + '\n' +
    '{{/if}}'                                                                           + '\n'
}
function f(type){
  var 
    type2 = type, ext = '', name = '{{name}}', displayName = name,
    url = '#' + type + '_{{name}}';
  switch(type){
    case 'props': case 'attributes': 
      type2 = 'events'; 
      break;
    case 'classes':
      url = '{{../projectRoot}}' + type + '/{{name}}.html';
      break;
    case 'modules':
      url = '{{../projectRoot}}' + type + '/{{name}}.html'
      displayName = '{{displayName}}';
      ext = sub(type, name, displayName);
  }
  return ''                                                                                 +
    '{{#if ' + type + '}}'                                                                  + '\n' +
      '<li class="nav-header">' + type.substr(0,1).toUpperCase() + type.substr(1) + '</li>' + '\n' +
      '{{#' + type2 + '}}'                                                                  + '\n' +
      '<li>'                                                                                + '\n' +
        '<a href="' + url + '">' + displayName + '</a>' + ext                               + '\n' +
      '</li>'                                                                               + '\n' +
      '{{/' + type2 + '}}'                                                                  + '\n' +
      '<li class="divider"></li>'                                                           + '\n' +
    '{{/if}}'                                                                               + '\n'
};

var html = '';
['modules', 'classes', 'methods', 'events', 'props','attributes'].forEach(function(type, index){
  html += f(type);
});

//window.open('data:text/txt,' + '<ul class="nav nav-list">' + html + '</ul>');
var 
  fs = require('fs'),
  path = require('path'),
  target = path.join(__dirname, 'sidebar.handlebars');

console.log(target);

fs.writeFile(
    target,
    '<!-- vim:set filetype=html: -->\n<ul class="nav nav-list">' 
    + html + '\n' + 
    '{{#if fileTree}}'                              + '\n' +
    '<li class="nav-header">Files</li>'             + '\n' +
    '{{#buildFileTree fileTree}}{{/buildFileTree}}' + '\n' +
    '<li class="divider"></li>'                     + '\n' +
    '{{/if}}'                                       + '\n' +
  '</ul>'
);
