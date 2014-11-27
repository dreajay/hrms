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
	
<script type="text/javascript" src="js/action.js"></script>
<script type="text/javascript">
		String.prototype.Trim=function() {
		    return this.replace(/(^\s*)|(\s*$)/g,"");
		}
		
		function check() {
			if(document.getElementById("user.userName").value.Trim() == "") {
				alert("请输入用户名");
			    document.getElementById("user.userName").focus(); 
				return false;
			}
			if(document.getElementById("user.userPassword").value.Trim() == "") {
				alert("请输入密码");
				document.getElementById("user.userPassword").focus(); 
				return false;
			}
			if(document.getElementById("userPassword2").value.Trim() == "") {
				alert("请再次输入密码");
				document.getElementById("userPassword2").focus(); 
				return false;
			}
			if(document.getElementById("user.userPassword").value.Trim() != document.getElementById("userPassword2").value.Trim()) {
				alert("两次密码不正确，请重新输入");
				document.getElementById("user.userPassword").focus(); 
				return false;
			}
			return true;
		}
	</script>
</head>

<body>
 <form action="user_add" method="post" name="frm" onsubmit="return check();">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：用户管理-创建用户</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><a onClick="javascript:document.getElementById('frm').action='user_add?addAction=1';document.getElementById('frm').submit();"><img src="images/22.gif" width="14" height="14" border="0"/></a></div></td>
                    <td class="STYLE1"><div align="center">保存</div></td>
                  </tr>
                </table></td>
                <td width="80"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><a onClick="javascript:document.getElementById('frm').action='user_add?addAction=2';document.getElementById('frm').submit();return false;"><img src="images/22.gif" width="14" height="14" border="0"/></a></div></td>
                    <td class="STYLE1"><div align="center">保存继续</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;">
                    <a href="user"><img src="images/goback.gif" width="14" height="14" border="0" /></a></div></td>
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
        		<input type="hidden" name="addAction" value="2"/>
        		<input type="hidden" name="empName" value="${empName}"/>
        		<s:fielderror/> <br/>
        			<table class="addTable">
        				<tr><td class="addTd">员工工号：</td>
        				<td><input type="text" id="empId" name="empId" value="${empId}" readonly="readonly"/></td></tr>
        				<tr><td class="addTd">员工姓名：</td>
        				<td><input type="text" id="user.userTrueName" name="user.userTrueName"  value="${empName}" readonly="readonly" /></td></tr>
        				<tr><td class="addTd">用户名：</td>
        				<td>
        				<input type="text" id="user.userName" name="user.userName" />
        				</td>
        				</tr>
        				<tr><td class="addTd">密码：</td>
        				<td><input type="password" name="user.userPassword" style="width:155px" /></td></tr>
        				<tr><td class="addTd">再次输入密码：</td>
        				<td><input type="password" name="userPassword2" style="width:155px" /></td></tr>
        				<tr><td class="addTd">分配角色：</td>
        				<td><s:select label="角色"
						   id="select1"	
					       name="roleId"
					       list="#request.roles"
					       listKey="roleId"
					       listValue="roleName"
					       size="5"
					       multiple="true"
					       theme="simple"
					       required="true"
					       cssStyle="width:350px"
						/>
								</td></tr>
								
        			</table>
        			<br/>
        		</div>
        		<br/><span style="width:20px"></span>
        		<input class="btnClick" name="add" type="submit" value="保存" onclick="frm.action='user_add';" />
          		<input class="btnClick" name="add" type="submit" value="保存继续" onclick="frm.action='user_add?add=${2}';" />
        	</div>
        </td>
        <td width="8" background="images/tab_15.gif">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td height="35" background="images/tab_19.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="35"><img src="images/tab_18.gif" width="12" height="35"/></td>
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