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
    
    <title>My JSP 'moduleList.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link href="css/mainIframe.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/user_update.js"></script>	
<script type="text/javascript">
		
	</script>
</head>

<body>
 <form action="user_update" method="post" name="frm" onsubmit="return getAllRoles();">
<table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：用户管理-修改用户</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;">
                    <a href="" onclick="javascript:history.go(-1);return false;"><img src="images/goback.gif" width="14" height="14" border="0" /></a></div></td>
                  	<td class="STYLE1"><div align="center">返回</div></td>
                  </tr>
                </table></td>
              </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_07.gif" width="16" height="30" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" height="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td>
        	<div style="height:440px;background-color:">
        		<div class="addDiv">
        		<s:fielderror/> <br/>
        			<table class="addTable">
        				<tr><td class="addTd">用户名：</td>
        				<td><input type="text" id="user.userName" name="user.userName" value="${user.userName}" readonly="readonly"/></td>
        				</tr>
        				<tr><td class="addTd">员工工号：</td>
        				<td><input type="text" id="empId" name="empId" value="${user.empId}" readonly="readonly"/></td></tr>
        				<tr><td class="addTd">员工姓名：</td>
        				<td><input type="text" id="user.userTrueName" name="user.userTrueName"  value="${user.userTrueName}" readonly="readonly" /></td></tr>
        				<tr><td class="addTd">性别：</td>
        				<td><input type="text" value="${employee.empSex}" readonly="readonly" /></td></tr>
        				<tr><td class="addTd">部门：</td>
        				<td><input type="text" value="${employee.dept.deptName}" readonly="readonly" /></td></tr>
        				<tr><td class="addTd">职位：</td>
        				<td><input type="text" value="${employee.post.postName}" readonly="readonly" /></td></tr>
        				<tr><td class="addTd">创建时间：</td>
        				<td><input type="text" name="user.createDate" value="${user.createDate}" style="width:155px" readonly="readonly"/></td></tr>
        				<tr><td class="addTd">角色：</td>
        				<td>
        				<select id="select2" name="select2" style="width:300px;" multiple="multiple" size="6">
			         <s:iterator value="user.roles">
			        	<option value="${roleId}">${roleName} </option> 
			         </s:iterator>  
						</select>
						</td>
						</tr>
								
        			</table>
        			<br/>
        		</div>
        		<br/><span style="width:20px"></span>
          		<input class="btnClick" type="button" value="返回" onclick="history.go(-1);" />
        	</div>
        </td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td class="STYLE4">&nbsp;&nbsp;</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="38" class="STYLE4"></td>
                </tr>
            </table></td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>