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
    
    <title>My JSP 'employeeRedeploy_transactor' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link href="css/mainIframe.css" rel="stylesheet" type="text/css" />	
<script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
function transactorSubmit()
{
	if(validate())
	{
		document.getElementById("frm").submit();
	}
	
}
function validate()
{
	if(document.getElementById("employeeRedeploy.transactorOption").value == null 
		|| document.getElementById("employeeRedeploy.transactorOption").value == "")
	{
		alert("请填写审批意见");
		return false;
	}
	return true;
}

</script>

</head>

<body>
 <form action="employeeRedeploy_transactor" method="post" name="frm">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：人事管理-异动审批</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
              <td width="80"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;">
                    <a href="employeeRedeploy_transactor" onclick="transactorSubmit();return false;"><img src="images/confirm.gif" width="14" height="14" border="0" /></a></div></td>
                  	<td class="STYLE1"><div align="center">确定审批</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;">
                    <a href="employeeRedeploy_transactor" onclick="document.getElementById('employeeRedeploy_transactor_cancel').submit();return false;"><img src="images/goback.gif" width="14" height="14" border="0" /></a></div></td>
                  	<td class="STYLE1"><div align="center">取消</div></td>
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
        				<input type="hidden" name="redeployId" value="${redeployId}" />
						<input type="hidden" name="transactor" value="transactor" />
						<input type="hidden" name="currentPage" value="${currentPage}" />
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
        				<td class="detailTdName1">调后部门</td><td class="detailTdValue">${employeeRedeploy.dept.deptName}</td>
        				<td class="detailTdName2">调后职位</td><td class="detailTdValue">${employeeRedeploy.post.postName}</td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">申请时间</td>
        				<td class="detailTdValue">${employeeRedeploy.applyDate}</td>
        				<td class="detailTdName2">当前状态</td>
        				<td class="detailTdValue">${employeeRedeploy.state}</td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">申请说明</td>
        				<td colspan="3" class="detailTdValue">
        				<textarea name="employee.remark" readonly="readonly" rows="6" cols="62">${employeeRedeploy.remark}</textarea> 
        				</td>
        				</tr>
        				</table>
        				<table class="detailTable">
        				<tr>
						<td class="detailTdName1">审批结果</td>
						<td class="detailTdValue">
						<select name="employeeRedeploy.state">
						<option value="同意">同意</option>
						<option value="不同意">不同意</option>
						<option value="上级决定">上级决定</option>
						</select> 
						</td>
						</tr>
						<tr>
						<td class="detailTdName1">异动时间</td>
						<td class="detailTdValue"><input type="text" name="employeeRedeploy.redeployDate" class="Wdate" type="text" onfocus="WdatePicker({skin:'whyGreen'})" readonly="readonly"/>
						<font color="red">*若选了异动时间，该异动申请的审批流程就结束，不需报送上级了</font>
						</td>
						</tr>
        				<tr>
						<td class="detailTdName1">您的意见</td>
        				<td colspan="3" class="detailTdValue">
        				<textarea name="employeeRedeploy.transactorOption" rows="6" cols="62"></textarea> 
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
<form name="employeeRedeploy_transactor_cancel" action="employeeRedeploy_transactor">
<input type="hidden" name="redeployId" value="${redeployId}" />
<input type="hidden" name="transactor" value="transactor" />
<input type="hidden" name="currentPage" value="${currentPage}" />
<input type="hidden" name="cancel" value="1" />
<input type="hidden" name="oldState" value="${oldState}" />
</form>
</body>
</html>