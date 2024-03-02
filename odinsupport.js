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
    }
}
,
