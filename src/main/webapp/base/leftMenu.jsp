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
    
    <title>My JSP 'leftMenu.jsp' starting page</title>
    
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
{
	font-size: 12px
}
#menuTree a {
	color: #566984; text-decoration: none
}
-->
</style>
<link rel="stylesheet" type="text/css" href="entity.css">
<script src="js/TreeNode.js" type=text/javascript></script>
<script src="js/Tree.js" type=text/javascript></script>
</head>

<body>
<table width="171" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0"  style="table-layout:fixed;">
      <tr>
        <td style="width:3px; background:#0a5c8e;">&nbsp;</td>
        <td><table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" style="table-layout:fixed;">
          <tr>
            <td height="5" style="line-height:5px; background:#0a5c8e;">&nbsp;</td>
          </tr>
          <tr>
            <td height="23" background="images/main_29.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="40%">&nbsp;</td>
                <td width="42%"><font style="height:1;font-size:9pt; color:#bfdbeb;filter:glow(color=#1070a3,strength=1)">系统菜单</font></td>
                <td width="18%">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td bgcolor="#e5f4fd">
			
			<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
			  <tr>
                <td height="3"></td>
              </tr>
              <tr>
                <td valign="top" id=menuTree>${leftModuleTree}</td>
              </tr>
			  
            </table>
			
			</td>
          </tr>
          <tr>
            <td height="23" background="images/main_45.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="18%">&nbsp;</td>
                <td width="64%"><div align="center"><font style="height:1;font-size:9pt; color:#bfdbeb;filter:glow(color=#1070a3,strength=1)">版本2010 V1.0 </font></div></td>
                <td width="18%">&nbsp;</td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td height="9" style="line-height:9px; background:#0a5c8e;">&nbsp;</td>
          </tr>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
