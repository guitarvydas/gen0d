_ = {
    legalizeName : function (s) {
	r = s.replaceAll (/%0A/g, "").replaceAll (/%20/g, "_");
	return r;
    },
    encode0D : function (s) {
	return s.replaceAll (" ", "∘")
    },
    decode0D : function (s) {
	return s.replaceAll ("∘", " ")
    },
    delete_reserved_characters : function (s) {
	return s.replace ("\\u010d", "").replace ("\\u03bb", "").replace ("\\u0117", "");
    },
    first_line : function (s) {
	let lines = s.split ("&#xa;");
	return lines [0];
    },
    rest_of_lines : function (s) {
	let lines = s.split ("&#xa;");
	let rest = lines.slice (1);
	return rest.join ("\n");
    },
    name_of : function (s) {
	let name = _.delete_reserved_characters (_.first_line (s));
	return name;
    },
    code_of : function (s) {
	let body = _.rest_of_lines (s);
	return body;
    }
}
,
