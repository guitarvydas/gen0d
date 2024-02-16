_ = {
    predicateNameStack: [],
    predicateCounter: 0,
    choiceNameStack: [],
    choiceCounter: 0,
    predicateGensym : function () {
	let name = `pred_${_.predicateCounter}`;
	_.predicateCounter += 1;
	return name;
    },
    pushNewPredicateName : function () {
	_.predicateNameStack.push (_.predicateGensym ());
	return "";
    },
    topPredicateName : function () {
	return _.predicateNameStack [_.predicateNameStack.length - 1];
    },
    popPredicateName : function () {
	_.predicateNameStack.pop ();
	return "";
    },
    choiceGensym : function () {
	let name = `pred_${_.choiceCounter}`;
	_.choiceCounter += 1;
	return name;
    },
    pushNewChoiceName : function () {
	_.choiceNameStack.push (_.choiceGensym ());
	return "";
    },
    topChoiceName : function () {
	return _.choiceNameStack [_.choiceNameStack.length - 1];
    },
    popChoiceName : function () {
	_.choiceNameStack.pop ();
	return "";
    }
}
,
