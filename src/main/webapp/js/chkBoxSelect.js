function check(e, itemModule) {
	var chkModule = document.getElementsByName(itemModule);
	for ( var i = 0; i < chkModule.length; i++) {
		chkModule[i].checked = e.checked;
	}
	var chkSelectAll = document.getElementsByName("chkboxAll")[0];
	if(!e.checked) {
		chkSelectAll.checked = false;
	}
	if(e.checked) {
		var input = document.getElementsByTagName("input");
		var flag = true;
		for ( var i = 0; i < input.length; i++) {
			if (input[i].type == "checkbox" && !input[i].checked && input[i].name!= "chkboxAll") {
				flag = false;
			}
		}
		chkSelectAll.checked = flag;
	}

}
function checkAll(checkBoxControl) {
	var input = document.getElementsByTagName("input");
	var state = checkBoxControl.checked;
	for ( var i = 0; i < input.length; i++) {
		if (input[i].type == "checkbox")
			input[i].checked = state;
	}
}
function cancel(obj, all) {
	var chkSelectAll = document.getElementsByName("chkboxAll")[0];
	var flag = 0;
	var all = document.getElementsByName(all)[0];
	if (!obj.checked) {
		all.checked = false;
		chkSelectAll.checked = false;
	} else {
		for ( var i = 0; i < document.getElementsByName(obj.name).length; i++) {
			if (!document.getElementsByName(obj.name)[i].checked) {
				all.checked = false;
				chkSelectAll.checked = false;
			} else {
				flag++;
			}
		}
		if (flag == document.getElementsByName(obj.name).length) {
			all.checked = true;
			var input = document.getElementsByTagName("input");
			flag = true;
			for ( var i = 0; i < input.length; i++) {
				if (input[i].type == "checkbox" && !input[i].checked && input[i].name!= "chkboxAll") {
					flag = false;
				}
			}
			chkSelectAll.checked = flag;
		}

	}
}