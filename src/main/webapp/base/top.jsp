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
    
    <title>My JSP 'welcome.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.STYLE1 {
	font-size: 12px;
	color: #2b7dbb;
}
a:link {
color:#2b7dbb;
	text-decoration: none
}

a:visited {
color:#2b7dbb;
	text-decoration: none
}

a:hover {
color:#2b7dbb;
	text-decoration: none;
	position: relative;
	right: 0px;
	top: 1px
}

a:active {
color:#2b7dbb;
	text-decoration: none
}

a {
color:#2b7dbb;
	cursor: hand
}
-->
</style>
<link rel="stylesheet" type="text/css" href="entity.css">
<script type="text/javascript" src="js/entity.js"></script>
</head>

<body onload="MM_preloadImages('images/main_07_1.gif','images/main_08_1.gif','images/main_10_1.gif','images/main_11_1.gif','images/main_12_1.gif','images/main_13_1.gif','images/main_14_1.gif')">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="57" background="images/main_02.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="110" height="57" background="images/main_01.gif">&nbsp;</td>
        <td><table width="743" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="28" background="images/main_03.gif">&nbsp;</td>
          </tr>
          <tr>
            <td height="29"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="61" height="29" background="images/main_06.gif">&nbsp;</td>
                <td width="72"><a href="user_update?userId=${userId}" target="mainIframe"><img src="images/main_07.gif" name="Image1" width="72" height="29" border="0" id="Image1" onmouseover="MM_swapImage('Image1','','images/main_07_1.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                <td width="72"><a href="user_detail?userId=${userId}" target="mainIframe"><img src="images/main_08.gif" name="Image2" width="72" height="29" border="0" id="Image2" onmouseover="MM_swapImage('Image2','','images/main_08_1.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                <td width="292" background="images/main_09.gif">&nbsp;</td>
                <td width="40"><a href="base/welcome.jsp" target="mainIframe"><img src="images/main_10.gif" name="Image3" width="40" height="29" border="0" id="Image3" onmouseover="MM_swapImage('Image3','','images/main_10_1.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                <td width="44"><a href="javascript:history.go(-1);"><img src="images/main_11.gif" name="Image4" width="44" height="29" border="0" id="Image4" onmouseover="MM_swapImage('Image4','','images/main_11_1.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                <td width="43"><a href="javascript:history.go(1);"><img src="images/main_12.gif" name="Image5" width="43" height="29" border="0" id="Image5" onmouseover="MM_swapImage('Image5','','images/main_12_1.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                <td width="44"><a href="javascript:history.go(0);" target="mainIframe"><img src="images/main_13.gif" name="Image6" width="44" height="29" border="0" id="Image6" onmouseover="MM_swapImage('Image6','','images/main_13_1.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                <td width="39"><a href="user_loginOut" target="_top"><img src="images/main_14.gif" name="Image7" width="39" height="29" border="0" id="Image7" onmouseover="MM_swapImage('Image7','','images/main_14_1.gif',1)" onmouseout="MM_swapImgRestore()" /></a></td>
                <td width="36"><img src="images/main_15.gif" width="36" height="29" /></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="102" background="images/main_05.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="26" background="images/main_18.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="180" height="26" background="images/main_16.gif">&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="76" height="23" valign="bottom"><table width="74" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="18" style="background:url(images/topbg.gif); border:solid 1px #a6d0e7; font-size:12px; color:#2b7dbb;"><div align="center"><a href="base/welcome.jsp" target="mainIframe"><img src="images/001.gif" width="10" height="10" border="0"/>系统首页</a></div></td>
              </tr>
            </table></td>
            <td width="76" valign="bottom"><table width="74" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="18" style="background:url(images/topbg.gif); border:solid 1px #a6d0e7;font-size:12px; color:#2b7dbb;"><div align="center"><a href="user" target="mainIframe"><img src="images/002.gif" width="10" height="10" border="0"/>用户管理</a></div></td>
              </tr>
            </table></td>
            <td width="76" valign="bottom"><table width="74" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="18" style="background:url(images/topbg.gif); border:solid 1px #a6d0e7;font-size:12px; color:#2b7dbb;"><div align="center"><a href="role" target="mainIframe"><img src="images/003.gif" width="10" height="10" border="0"/>角色管理</a></div></td>
              </tr>
            </table></td>
            <td valign="bottom">&nbsp;</td>
          </tr>
        </table></td>
        <td width="250"><img src="images/user.gif" width="10" height="10" /> <span class="STYLE1">欢迎您:${userName} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;角色:<s:iterator value="#session.user.roles">${roleName} </s:iterator></span></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
