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

function permission_update(moduleId, moduleName) {
	var selectRole = document.getElementById("roleSelectId");
	var roleId = selectRole.value;
	var selectUser = document.getElementById("userSelectId");
	var userId = selectUser.value;
	var chkModule = document.getElementsByName(moduleName);
	var permission = new Array(chkModule.length);
	for ( var i = 0; i < chkModule.length; i++) {
		if (chkModule[i].checked) {
			permission[i] = "1";
		} else {
			permission[i] = "-1";
		}
	}
	if (roleId != 1 && roleId != "") {
		self.location = "rolePermission_update?roleId=" + roleId + "&moduleId="
				+ moduleId + "&permission=" + permission;
	} else if (userId != 1 && userId != "") {
		self.location = "userPermission_update?userId=" + userId + "&moduleId="
				+ moduleId + "&permission=" + permission;
	} else {
		alert("请选择对象");
		return;
	}
}

function permission_updateAll() {
	var selectRole = document.getElementById("roleSelectId");
	var roleId = selectRole.value;
	var selectUser = document.getElementById("userSelectId");
	var userId = selectUser.value;

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

	if (roleId != 1 && roleId != "") {
		self.location = "rolePermission_updateAll?roleId=" + roleId + "&mp="
				+ mp;
	} else if (userId != 1 && userId != "") {
		self.location = "userPermission_updateAll?userId=" + userId + "&mp="
				+ mp;
	} else {
		alert("请选择对象");
		return;
	}

}

function sendRoleId() {
	var select = document.getElementById("roleSelectId");
	var index = select.selectedIndex;
	var text = select.options[index].text;
	var roleId = select.options[index].value;
	self.location = "permission?roleId=" + roleId;
}

function sendUserId() {
	var select = document.getElementById("userSelectId");
	var index = select.selectedIndex;
	var text = select.options[index].text;
	var userId = select.options[index].value;
	self.location = "permission?userId=" + userId;
}

function selectOneCol(currentCol) {
	var rows = document.getElementById('tableId').getElementsByTagName('tr');
	for(var i = 1; i < rows.length; i++) {
		var cols = rows[i].getElementsByTagName('td');
		var box = cols[currentCol].firstChild;
		if(box.type = "checkbox") {
			box.checked = !box.checked;
		}
	}
	return false;
}
