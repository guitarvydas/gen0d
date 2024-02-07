_ = {
    predicateNameStack: [],
    predicateCounter: 0,
    predicateGensym : function () {
	let name = `pred_${_.predicateCounter}`;
	_.predicateCounter += 1;
	return name;
    },
    pushNewPredicateName : function () {
	predicateNameStack.push (_.predicateGensym ());
	console.error (_.predicateStack);
    },
    topPredicateName : function () { return _.predicateNameStack [_.predicateNameState.len - 1]; },
    popPredicateName : function () { _.predicateNameStack.pop (); return ""; }
}
,
