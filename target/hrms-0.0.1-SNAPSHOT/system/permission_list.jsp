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
    
    <title>My JSP 'recruit_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="css/stylesheet.css" rel="stylesheet" type="text/css" />
<link href="css/mainFrame.css" rel="stylesheet" type="text/css" />	
<link href="css/mainIframe.css" rel="stylesheet" type="text/css" />	
<script type="text/javascript" src="js/permission_list.js"></script>
<s:bean name="com.hrms.action.PermissionAction" id="pa"></s:bean>	
		
</head>

<body>
 <form action="role_list" method="post" name="frm">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：系统管理-权限管理</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><a onClick="permission_updateAll();"><img src="images/22.gif" width="14" height="14" border="0"/></a></div></td>
                    <td class="STYLE1"><div align="center">保存</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;">
                    <a onclick="javascript:history.go(-1);"><img src="images/goback.gif" width="14" height="14" border="0" /></a></div></td>
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
        	<div >
		<div>
			<table class="main" cellSpacing=0 cellPadding=0>
				<tr>
					<td class="bdtd1"></td>
					<td class="bdtd2" valign="top">
						<div>
								<div class="listTop">
									<div class="listNavigate">
										角色  <s:select
												   id="roleSelectId"	
											       name="roleId"
											       list="roles"
											       listKey="roleId"
											       listValue="roleName"
											       theme="simple"
											       required="true"
											       headerKey="1"
											       headerValue="请选择角色"
											       cssStyle="width:250px"
											       onchange="sendRoleId()"
												/>
												&nbsp;&nbsp;&nbsp;&nbsp;
										用户  <s:select
												   id="userSelectId"	
											       name="userId"
											       list="users"
											       listKey="userId"
											       listValue="userName"
											       theme="simple"
											       required="true"
											       headerKey="1"
											       headerValue="请选择用户"
											       cssStyle="width:250px"
											       onchange="sendUserId()"
												/>
									</div>
								</div>
								<div align="center">
									<table class="contentTb" id="tableId">
										<tr>
											<th class="contentTh" style="width: 50px;" scope=col>
											<input type="checkbox" name="chkSelectAll" onclick="checkAll(this)" />
											</th>
											<th class="contentTh" scope=col>模块Id</th>
											<th class="contentTh" scope=col>模块</th>
											<s:iterator value="actions">
											<th class="contentTh" scope=col>
											<a onclick="selectOneCol(2+${actionId});return false;">${action}</a>
											</th>
											</s:iterator>
											<th class="contentTh" scope=col>操作</th>
										</tr>
										<s:iterator value="modules">
											<tr>
												<td class="contentTd" style="width: 50px">
													<input type="checkbox" name="chkModule${moduleId}" value="${moduleId}"
														onclick="check(this,'${moduleName}')" />
												</td>
												<td class="contentTd">
													<s:property value="moduleId" />
												</td>
												<td class="contentTd">
													<s:property value="moduleName" />
												</td>
												
												<s:iterator value="actions" >
												<td class="contentTd">
												<s:if test="roleId!= null">
													<s:set name="checked" value="#pa.rolePermission_checked(roleId,moduleId,actionId)"/>
												</s:if>
												<s:else>
													<s:set name="checked" value="#pa.userPermission_checked(userId,moduleId,actionId)"/>
												</s:else>	
												<s:if test="checked">
													<input type="checkbox" checked name="${moduleName}" value="${actionId}" onclick="cancel(this,'chkModule${moduleId}')"/> 
												</s:if>
												<s:else>
													<input type="checkbox" name="${moduleName}" value="${actionId}" onclick="cancel(this,'chkModule${moduleId}')"/>
												</s:else>	
												</td>	
												</s:iterator>
												<td class="contentTdAction">
													<a href="" onclick="permission_update(${moduleId},'${moduleName}');return false;"><img src="images/edt.gif" border=0>更新</a>
												</td>
											</tr>
										</s:iterator>
									</table>
								</div>
						</div>
					</td>
					<td class="bdtd3"></td>
				</tr>
			</table>
		</div>
    		<br/><span style="width:20px"></span>
    		<input class="btnClick" name="add"  type="submit" value="保存"/>
      		<input class="btnClick" name="cancel" type="button" value="取消" onclick="javascript:history.go(-1);" />
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