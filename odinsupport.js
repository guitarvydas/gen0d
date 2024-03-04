_ = {
    legalizeName : function (s) {
	r = s.replaceAll (/%0A/g, "").replaceAll (/%20/g, "_");
	return r;
    },
    encode0D : function (s) {
	return s.replaceAll (" ", "∘").replaceAll ('\\"', "⦙").replaceAll ('\\\\', "∫")
    },
    decode0D : function (s) {
	return s.replaceAll ("∘", " ").replaceAll ("⦙", '"').replaceAll ("∫", '\\')
    },
    decode0DForName : function (s) {
	return s.replaceAll ("∘", " ").replaceAll ("⦙", '\\"').replaceAll ("∫", '\\')
    },
    decode0DForLongName : function (s) {
	return s.replaceAll ("∘", " ").replaceAll ('"', '\\"').replaceAll ("⦙", '\\"').replaceAll ("∫", '\\')
    },
    delete_reserved_characters : function (s) {
	return s.replace ("\\u010d", "").replace ("\\u03bb", "").replace ("\\u0117", "");
    },
    first_line : function (s) {
	let lines1 = s.split ("&#xa;");
	let lines = (_.decode0D (lines1 [0]).split (" "))[0];
	return lines;
    },
    rest_of_lines_after_first_newline_or_space : function (s0) {
	let lines_split_on_newline = s0.split ("&#xa;");
	let rest_after_newline_string = "";
	if (1 < lines_split_on_newline.length) {
	    let rest_after_newline = lines_split_on_newline.slice (1);
	    rest_after_newline_string = rest_after_newline.join ("\n");
	    return rest_after_newline_string;
	} else {
	    rest_after_newline_string = lines_split_on_newline [0];
	    let split_on_space = rest_after_newline_string.split (" ");
	    let rest_after_space = split_on_space.slice (1);
	    let rest_after_space_as_string = rest_after_space.join (" ");
	    
	    return rest_after_space_as_string;
	}	    
    },
    name_of : function (s) {
	let name = _.delete_reserved_characters (_.decode0DForName (_.first_line (s)));
	return name;
    },
    long_name_of: function (s) {
	let name = _.delete_reserved_characters (_.decode0DForLongName (s));
	return name;
    },
    code_of : function (s) {
	let body = _.rest_of_lines_after_first_newline_or_space (_.decode0D (s));
	return body;
    }
}
,
