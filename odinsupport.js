_ = {
    legalizeName : function (s) {
	r = s.replaceAll (/%0A/g, "").replaceAll (/%20/g, "_");
	return r;
    }
}
,
