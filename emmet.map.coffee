json =
	coffee :
		snippets :
			comment : """
###
# @author zemzheng (zemzheng@gmail.com)
# @description |
###
"""
			do : """
do ( | ) ->
	"""

	javascript :
		snippets :
			comment : """ /**
* @author zemzheng (zemzheng@gmail.com)
* @description |
**/
"""
			email   : "zemzheng@gmail.com",

			us      : """
"use strict";
|
"""

			closure : """
;(function(){
|
})();"""

			while : """
while( | ){

}
"""
			for   : """
for( | ){

}
"""
			if    : """
if( | ){

}
"""
			switch: """
switch( | ){

}
"""

	html :
		snippets :
			"bs-viewport"     : "meta[name=viewport][content=width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no]"
			"bs-input"         : "label,input[type=text].form-control"
			"bs-checkbox"      : ".checkbox>label>input[type=checkbox]"
			"bs-radio"         : ".radio>label>input[type=radio]"
			"bs-dropdown"      : ".dropdown>button.btn.dropdown-toggle,bs-dropdown-menu"
			"bs-dropdown-menu" : ".dropdown-menu>li.dropdown-header,li.divider,li>a"
			"bs-pagination"    : ".dropdown-menu>li.dropdown-header,li.divider,li>a"
			"bs-listgroup"     : ".list-group>.list-group-item"

json.coffee.snippets[ '###' ] = json.coffee.snippets.comment

json = JSON.stringify json
console.log """ " custom emmet #{ new Date }
let g:user_emmet_settings = #{json}
"""
