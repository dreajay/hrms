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
    
    <title>My JSP 'nonePermission.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    	<input type="hidden" name="errorMessage" value="${errorMessage }"/>
    	<input type="hidden" name="forwardLink" value="${forwardLink }"/>
  </body>
  <script type="text/javascript">
   var errorMessage = document.getElementById("errorMessage").value;
   var forwardLink = document.getElementById("forwardLink").value;
   if(errorMessage != null && errorMessage != "")
	   alert(errorMessage);
   else
	   alert("系统出错啦，你可能没有权限，或你的操作有误，请和管理员联系");
   
   if(forwardLink != null && forwardLink != "") 
	   self.location = forwardLink;
   else
	   self.location = "base/welcome.jsp";
  </script>
</html>
