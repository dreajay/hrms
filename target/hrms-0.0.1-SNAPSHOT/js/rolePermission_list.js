function check(e, itemModule) {
	var chkModule = document.getElementsByName(itemModule);
	for ( var i = 0; i < chkModule.length; i++) {
		chkModule[i].checked = e.checked;
	}
	var chkSelectAll = document.getElementsByName("chkSelectAll")[0];
	if(!e.checked) {
		chkSelectAll.checked = false;
	}
	if(e.checked) {
		var input = document.getElementsByTagName("input");
		var flag = true;
		for ( var i = 0; i < input.length; i++) {
			if (input[i].type == "checkbox" && !input[i].checked && input[i].name!= "chkSelectAll") {
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
				if (input[i].type == "checkbox" && !input[i].checked && input[i].name!= "chkSelectAll") {
					flag = false;
				}
			}
			chkSelectAll.checked = flag;
		}

	}
}

function rolePermission_updateAll(roleId) {
	if(roleId < 0 || roleId == "" || roleId == null || roleId == 1) {
		alert("请选择角色");
		return;
	}
	var table = document.getElementById("tableId");
	var rows = table.rows;
	var mp = new Array(rows.length-1);
	for(var i=0;i<rows.length-1;i++) {
		mp[i]=rows[i+1].cells[1].innerText+"/";
		var cells = rows[i+1].cells;
		for(var j=0;j<cells.length-4;j++) {
			if(cells[j+3].childNodes[0].type=="checkbox" && cells[j+3].childNodes[0].checked) {
				mp[i]=mp[i]+"1/";
			}else if(cells[j+3].childNodes[0].type=="checkbox") {
				mp[i]=mp[i]+"-1/";
			}
		}
	}
	self.location= "rolePermission_updateAll?roleId="+roleId+"&mp="+mp;
}

function rolePermission_update(moduleId,moduleName) {
	var select = document.getElementById("rolesIds");
    var index = select.selectedIndex;
    var text = select.options[index].text;
    var roleId = select.options[index].value;
   	if(roleId == 1 || roleId == "") {
   		alert("请先选择角色");
   		return;
   	}
	var chkModule = document.getElementsByName(moduleName);
	var permission = new Array(chkModule.length);
	for ( var i = 0; i < chkModule.length; i++) {
		if(chkModule[i].checked) {
			permission[i] = "1";
		}else {
			permission[i] = "-1";
		}
	}
	self.location= "rolePermission_update?roleId="+roleId+"&moduleId="+moduleId+"&permission="+permission;	
}

function sendRoleId() {
	var select = document.getElementById("rolesIds");
    var index = select.selectedIndex;
    var text = select.options[index].text;
    var roleId = select.options[index].value;
    self.location= "rolePermission_list?roleId="+roleId;
}