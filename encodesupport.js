_ = {
    encode0D : function (s) {
	return s.replaceAll (" ", "∘").replaceAll ('\\"', "⦙")
    },
    decode0D : function (s) {
	return s.replaceAll ("∘", " ").replaceAll ("⦙", '"')
    }
}
,
