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
    
    <title>My JSP 'employeeRedeploy_add.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link href="css/mainIframe.css" rel="stylesheet" type="text/css" />	
<script type="text/javascript" src="js/changeLineColor.js"></script>
<script type="text/javascript" src="js/chkBoxSelect.js"></script>
<script type="text/javascript" src="js/action.js"></script>
<script language="javascript" type="text/javascript"
			src="My97DatePicker/WdatePicker.js"></script>
			
			<script type="text/javascript">
				function selectEmployee()
				{
					var select = document.getElementById("employeeRedeploy.empId");
	    			var empId = select.value
					self.location= "employeeRedeploy_findEmployee?empId=" + empId;
				}
				function addSubmit(addActionValue)
				{
					if (validate())
					{
						var frm = document.getElementById('frm');
						frm.action='employeeRedeploy_add?addAction=' + addActionValue;
						frm.submit();
					}
				}
				function validate()
				{
					if(document.getElementById("employeeRedeploy.empId").value == "" 
							|| document.getElementById("employeeRedeploy.empId").value == 0)
					{
						alert("请选择异动职员");
						return false;
					}
					if(document.getElementById("employeeRedeploy.redeployTypeId").value == "" 
							|| document.getElementById("employeeRedeploy.redeployTypeId").value == 0)
					{
						alert("请选择异动种类");
						return false;
					}
					if(document.getElementById("employeeRedeploy.deptId").value == "" 
						|| document.getElementById("employeeRedeploy.deptId").value == 0)
					{
						alert("请选择调后部门");
						return false;
					}
					if(document.getElementById("employeeRedeploy.postId").value == "" 
						|| document.getElementById("employeeRedeploy.postId").value == 0)
					{
						alert("请选择调后职位");
						return false;
					}
					if(document.getElementById("employeeRedeploy.remark").value == "")
					{
						alert("请填写申请说明");
						return false;
					}
					if(document.getElementById("employeeRedeploy.applyDate").value == "")
					{
						alert("请填写申请时间");
						return false;
					}
					if(document.getElementById("employeeRedeploy.applyPerson").value == "")
					{
						alert("请填写申请人");
						return false;
					}
					return true;
				}
			</script>
</head>

<body>
 <form action="employeeRedeploy_add" method="post" name="frm" onsubmit="return validate()">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：人事管理-员工异动申请</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><a onClick="addSubmit(1);"><img src="images/22.gif" width="14" height="14" border="0"/></a></div></td>
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
        	<div style="height:440px;background-color:">
        		<div class="addDiv">
        		   <input type="hidden" value='<s:property value = "#request['empId']" />' name="empId" id="empId"/>
				   <input type="hidden" name="currentPage" value="${currentPage}" />
				   <input type="hidden" name="addAction" value="1" />
				   <input type="hidden" name="employeeRedeploy.state" value="未提交" />
					<%
					String today = Calendar.getInstance().get(Calendar.YEAR) 
						           + "-" + (Calendar.getInstance().get(Calendar.MONTH) + 1) 
						           + "-" + Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
					%>							
        			<table class="addTable">
        			    <tr><td class="addTd">异动员工</td>
        			    <td>
        			   <input type="text" name="employee.empName" value="${empName}" readonly="readonly"/>
        			    </td>
        			    <td class="addTd2">员工工号</td><td>
        				<input type="text" name="employeeRedeploy.empId" value="${empId}" readonly="readonly"/></td>
        			    </tr>
        				<tr><td class="addTd">调前部门</td><td>
        				<input type="text" name="employeeRedeploy.deployDept" 
        				value="<s:property value = "#request['employeeRedeploy.deployDept']"/>" readonly="readonly"/></td> 
        				<td class="addTd2">调前职位</td><td><input type="text" name="employeeRedeploy.deployPost" 
        				value="<s:property value = "#request['employeeRedeploy.deployPost']"/>" readonly="readonly"/></td> 
        				</tr>
        				<tr> 
        			    <td class="addTd">异动种类</td><td>
        				<s:select 
					       name="employeeRedeploy.redeployTypeId"
					       list="#request['redeployTypes']"
					       listKey="redeployTypeId"
					       listValue="redeployType"
					       theme="simple"
					       headerKey="0" headerValue="请选择"
					       required="true"
					       cssStyle="width:155px"
						/>
						</td>
						<td class="addTd2">上级审批人</td><td>
        				<input type="text" name="employeeRedeploy.transactor" value="<s:property value = "#request['employeeRedeploy.transactor']"/>" readonly="readonly"/></td>
        				</tr>
        				<tr style="margin-top: 80px">
        				<td class="addTd">调后部门</td><td>
        				<s:select 
					       name="employeeRedeploy.deptId"
					       list="#request['depts']"
					       listKey="deptId"
					       listValue="deptName"
					       theme="simple"
					       headerKey="0" headerValue="请选择"
					       required="true"
					       cssStyle="width:155px"
						/>
						</td>
        				<td class="addTd2">调后职位</td><td>
        				<s:select 
					       name="employeeRedeploy.postId"
					       list="#request['posts']"
					       listKey="postId"
					       listValue="postName"
					       theme="simple"
					       headerKey="0" headerValue="请选择"
					       required="true"
					       cssStyle="width:155px"
						/>
						</td>
						</tr>
        				<tr>
        				<td class="addTd">申请说明</td>
        				<td colspan="3"><textarea name="employeeRedeploy.remark" rows="8" cols="74">${employeeRedeploy.remark}</textarea> </td></tr>
        				
        				<tr> 
        				<td class="addTd">申请人</td><td><input type="text" name="employeeRedeploy.applyPerson" value="${employeeRedeploy.applyPerson}" /></td>
        				<td class="addTd2">申请时间</td><td><input type="text" name="employeeRedeploy.applyDate" value="<%=today%>" class="Wdate" type="text" onfocus="WdatePicker({skin:'whyGreen'})" readonly="readonly"/></td> 
        				</tr>
        			</table>
        		</div>
        		<br/><span style="width:20px"></span>
        		<input class="btnClick" name="add" type="submit" value="保存" onclick="frm.action='employeeRedeploy_add';" />
          		<input class="btnClick" name="cancel" type="button" value="取消" onclick="self.location='employeeRedeploy_my';" />
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