<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>人力资源管理系统_用户登录</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<style type="text/css">
	<!--
	body {
		margin-left: 0px;
		margin-top: 0px;
		margin-right: 0px;
		margin-bottom: 0px;
		overflow:hidden;
	}
	.errorMessage {color:red;font-size:12px }
	-->
	</style>
	<script type="text/javascript" src="js/entity.js"></script>
</head>
<body onLoad="MM_preloadImages('images/login_09_1.gif','images/login_10_1.gif')">
<input type="hidden" value='<s:property value="#loginMessage"/>' name="loginMessage" id="loginMessage"/>
<s:form action="user_login" method="post" name="frmLogin">
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td bgcolor="#02395f">&nbsp;</td>
  </tr>
  <tr>
    <td height="607" align="center" background="images/login_02.gif"><table width="974" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="331" background="images/login_01.jpg">&nbsp;<div align="center" style=""><SPAN style="height: 236;width:100%"></SPAN><s:fielderror></s:fielderror></div></td>
      </tr>
      <tr>
        <td height="116"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="393" height="116" background="images/login_05.gif">&nbsp;</td>
            <td width="174"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="81" background="images/login_06.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="24%"><div align="center"><font style="height:1;font-size:9pt; color:#bfdbeb;filter:glow(color=#1070a3,strength=1)">用户</font></div></td>
                    <td width="76%" height="25"><input type="text" name="user.userName"  style="width:125px; height:20px; background:#32a2e3; font-size:12px; border:solid 1px #0468a7; color:#14649f;"></td>
                  </tr>
                  <tr>
                    <td><div align="center"><font style="height:1;font-size:9pt; color:#bfdbeb;filter:glow(color=#1070a3,strength=1)">密码</font></div></td>
                    <td height="25"><input type="password" name="user.userPassword"  style="width:125px; height:20px; background:#32a2e3; font-size:12px; border:solid 1px #0468a7; color:#14649f;">
                    </td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td width="50" height="35"><img src="images/login_08.gif" width="50" height="35"></td>
                    <td width="46"><input type="image" src="images/login_09.gif" width="46" height="35" border="0" id="Image1" onMouseOver="MM_swapImage('Image1','','images/login_09_1.gif',1)" onMouseOut="MM_swapImgRestore()"/></td>
                    <td width="45"><a><img onclick="javascript:document.forms['frmLogin'].reset();" src="images/login_10.gif" width="45" height="35" border="0" id="Image2" onMouseOver="MM_swapImage('Image2','','images/login_10_1.gif',1)" onMouseOut="MM_swapImgRestore()"></a></td>
                    <td width="33"><img src="images/login_11.gif" width="33" height="35"></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
            <td width="407" background="images/login_07.gif">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td height="160" background="images/login_12.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td bgcolor="#02609c">&nbsp;</td>
  </tr>
</table>
</s:form>
<script type="text/javascript">
	var loginMessage = document.getElementById("loginMessage");
	if (loginMessage != null && loginMessage.value != "") 
		alert(loginMessage.value);
</script>
</body>
</html>
