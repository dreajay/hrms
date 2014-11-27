function checkLogin(){
	if(document.frmLogin.user.userName.value==""){
	window.alert("用户名不能为空");
	return false;
	}
	if(document.frmLogin.user.userPassword.value==""){
	window.alert("密码不能为空");
	return false;
	}
	return true;
}
