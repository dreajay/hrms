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
    
    <title>My JSP 'employeeRedeploy_detail' starting page</title>
    
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
</head>

<body>
 <form action="employeeRedeploy" method="post" name="frm">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：人事管理-异动明细</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;">
                    <a href="employeeRedeploy"><img src="images/goback.gif" width="14" height="14" border="0" /></a></div></td>
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
        			<table class="detailTable">
        				<tr>
        				<td class="detailTdName1">异动单号</td><td class="detailTdValue">${employeeRedeploy.redeployId}</td>
        				<td class="detailTdName2">异动种类</td><td class="detailTdValue">${employeeRedeploy.redeployType.redeployType}</td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">异动职员</td><td class="detailTdValue">${employeeRedeploy.employee.empName}</td>
        				<td class="detailTdName2">工号</td><td class="detailTdValue">${employeeRedeploy.employee.empId}</td> 
        				</tr>
        				<tr>
        				<td class="detailTdName1">调前部门</td><td class="detailTdValue">${employeeRedeploy.deployDept}</td>  
						<td class="detailTdName2">调前职位</td><td class="detailTdValue">${employeeRedeploy.deployPost}</td>
						</tr>
        				<tr>
        				<td class="detailTdName1">调后部门</td><td class="detailTdValue">${employeeRedeploy.dept.deptName}</td>
        				<td class="detailTdName2">调后职位</td><td class="detailTdValue">${employeeRedeploy.post.postName}</td>
        				</tr>
        			</table>
        			<table class="detailTable">
        				<tr>
        				<td class="detailTdName1">申请说明</td>
        				<td colspan="3" class="detailTdValue">
        				<textarea name="employee.remark" readonly="readonly" rows="6" cols="60">${employeeRedeploy.remark}</textarea> 
        				</td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">申请人</td>
        				<td class="detailTdValue">${employeeRedeploy.applyPerson}</td>
        				<td class="detailTdName2" style="padding-left: 200px;">申请时间</td>
        				<td class="detailTdValue">${employeeRedeploy.applyDate}</td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">当前状态</td><td class="detailTdValue">${employeeRedeploy.state}</td>
        				</tr>
        				<tr>
						<td class="detailTdName1">审批人</td><td class="detailTdValue">${employeeRedeploy.transactor}</td>
						<td class="detailTdName2">审批时间</td><td class="detailTdValue">${employeeRedeploy.redeployDate}</td>
        				</tr>
        			</table>
        			<table class="detailTable">
        				<tr>
						<td class="detailTdName1">审批人意见</td>
						<td colspan="3" class="detailTdValue">
						<textarea name="employeeRedeploy.transactorOption" readonly="readonly" rows="6" cols="60">${employeeRedeploy.transactorOption}</textarea>
						</td>
        				</tr>
        				
        			</table>
        		</div>
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