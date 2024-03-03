_ = {
    legalizeName : function (s) {
	r = s.replaceAll (/%0A/g, "").replaceAll (/%20/g, "_");
	return r;
    },
    encode0D : function (s) {
	return s.replaceAll (" ", "∘").replaceAll ('\\"', "⦙").replaceAll ('\\\\', "∫")
    },
    decode0D : function (s) {
	return s.replaceAll ("∘", " ").replaceAll ("⦙", '"')
    },
    decode0DForName : function (s) {
	return s.replaceAll ("⦙", '\\"').replaceAll ("∫", '\\\\')
    },
    delete_reserved_characters : function (s) {
	return s.replace ("\\u010d", "").replace ("\\u03bb", "").replace ("\\u0117", "");
    },
    first_line : function (s) {
	let lines1 = s.split ("&#xa;");
	let lines = (_.decode0D (lines1 [0]).split (" "))[0];
	return lines;
    },
    rest_of_lines : function (s) {
	let lines = s.split ("&#xa;");
	let rest = lines.slice (1);
	return rest.join ("\n");
    },
    name_of : function (s) {
	let name = _.delete_reserved_characters (_.decode0DForName (_.first_line (s)));
	return name;
    },
    code_of : function (s) {
	let body = _.rest_of_lines (_.decode0D (s));
	return body;
    }
}
,
