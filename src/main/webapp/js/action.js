function action(url, id, currentPage) {
	var idValue;
	var input = document.getElementsByTagName("input");
	var chkBoxChildren = document.getElementsByName("chkBoxChildren");
	var flag = false;
	var idCount = 0;
	for ( var i = 0; i < chkBoxChildren.length; i++) {
		if (chkBoxChildren[i].checked) {
			flag = true;
			idValue = chkBoxChildren[i].value;
			idCount++;
		}
	}
	if (flag == false || idCount == 0 || idCount < 0) {
		alert("请选择一条记录");
		return;
	}
	if (idCount > 1) {
		alert("一次只能选择一条记录");
		return;
	}
	// alert(url+"?"+id+"="+idValue+"&currentPage="+currentPage);
	window.location.href = url + "?" + id + "=" + idValue + "&currentPage="
			+ currentPage;
}

function getPage(targetPage) {
	if(targetPage < 0)
		targetPage = 1;
	document.getElementById("currentPage").value = targetPage;
	document.forms['frm'].submit();
	return false;
}