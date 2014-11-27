function check(e, itemModule) {
	var chkModule = document.getElementsByName(itemModule);
	for ( var i = 0; i < chkModule.length; i++) {
		chkModule[i].checked = e.checked;
	}
	var chkSelectAll = document.getElementsByName("chkSelectAll")[0];
	if (!e.checked) {
		chkSelectAll.checked = false;
	}
	if (e.checked) {
		var input = document.getElementsByTagName("input");
		var flag = true;
		for ( var i = 0; i < input.length; i++) {
			if (input[i].type == "checkbox" && !input[i].checked
					&& input[i].name != "chkSelectAll") {
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
	var chkSelectAll = document.getElementsByName("chkSelectAll")[0];
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
				if (input[i].type == "checkbox" && !input[i].checked
						&& input[i].name != "chkSelectAll") {
					flag = false;
				}
			}
			chkSelectAll.checked = flag;
		}

	}
}

function userPermission_update(userId, moduleId, moduleName) {
	if (userId < 0 || userId == "" || userId == null) {
		alert("当前没有用户");
		return;
	}
	var chkModule = document.getElementsByName(moduleName);
	var permission = new Array(chkModule.length);
	for ( var i = 0; i < chkModule.length; i++) {
		if (chkModule[i].checked) {
			permission[i] = "1";
		} else {
			permission[i] = "-1";
		}
	}
	self.location = "userPermission_update?userId=" + userId + "&moduleId="
			+ moduleId + "&permission=" + permission;
}

function userPermission_updateAll(userId) {
	if (userId < 0 || userId == "" || userId == null) {
		alert("当前没有用户");
		return;
	}
	var table = document.getElementById("tableId");
	var rows = table.rows;
	var mp = new Array(rows.length - 1);
	for ( var i = 0; i < rows.length - 1; i++) {
		mp[i] = rows[i + 1].cells[1].innerText + "/";
		var cells = rows[i + 1].cells;
		for ( var j = 0; j < cells.length - 4; j++) {
			if (cells[j + 3].childNodes[0].type == "checkbox"
					&& cells[j + 3].childNodes[0].checked) {
				mp[i] = mp[i] + "1/";
			} else if (cells[j + 3].childNodes[0].type == "checkbox") {
				mp[i] = mp[i] + "-1/";
			}
		}
	}
	self.location = "userPermission_updateAll?userId=" + userId + "&mp=" + mp;
}