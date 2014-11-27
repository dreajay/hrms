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
    
    <title>My JSP 'employeeRedeploy_send.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link href="css/mainIframe.css" rel="stylesheet" type="text/css" />	
			<script type="text/javascript">
			function validate()
			{
				var transactor = document.getElementById("employeeRedeploy.empId").value;
				if (transactor == null || transactor == "")
				{	alert("请选择审批人");
					return false;
				}
				return true;
			}
			</script>
</head>

<body>
 <form action="employeeRedeploy_send" method="post" name="frm">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" background="images/tab_05.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="12" height="30"><img src="images/tab_03.gif" width="12" height="30" /></td>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="46%" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="5%"><div align="center"><img src="images/tb.gif" width="16" height="16" /></div></td>
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：人事管理-员工异动报送</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="80"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><a href="#" onClick="javascript:if(validate())document.getElementById('frm').submit();return false;">
                    <img src="images/22.gif" width="14" height="14" border="0"/></a></div></td>
                    <td class="STYLE1"><div align="center">确认报送</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;">
                    <a href="employeeRedeploy_transactorList"><img src="images/goback.gif" width="14" height="14" border="0" /></a></div></td>
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
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="8" background="images/tab_12.gif">&nbsp;</td>
        <td>
        	<div style="height:440px;background-color:">
        		<div class="addDiv">
        				<input type="hidden" name="employeeRedeploy.state" value="${employeeRedeploy.state}" />
        				<input type="hidden" name="redeployId" value="${redeployId}" />
						<input type="hidden" name="send" value="send" />
						<input type="hidden" name="currentPage" value="${currentPage}" />
        			<table class="addTable" >
        				<tr><td height="30px">&nbsp;</td></tr>
        			    <tr>
        			    <td class="addTd"></td><td class="addTd"></td><td class="addTd"></td>
        			    <td class="addTd">审批人</td>
        			    <td>
        			    <input type="hidden" name="hdDeptMan" value="${deptMan}"/>
        			    
        			    <s:select 
						       name="employeeRedeploy.empId"
						       list="#request['employees']"
						       listKey="empId"
						       listValue="empName"
						       theme="simple"
						       headerKey="0" headerValue="请选择"
						       required="true"
						       cssStyle="width:155px"
							 />
<script type="text/javascript">
var deptMan = document.getElementById("hdDeptMan").value;
var selEmpId = document.getElementById("employeeRedeploy.empId");
for (var i = 0; i < selEmpId.length; i++)
{
	if (selEmpId.options[i].text == deptMan)
	{        
	    selEmpId.options[i].selected = true;        
	    break;        
	}    
}
</script>
        			    </td>
        			    </tr>
        			    <tr><td height="100px">&nbsp;</td></tr>
        			    <tr>
        			    <td>
        			    <a href="#" onClick="javascript:if(validate()) document.getElementById('frm').submit();return false;">
        			    <img src="images/send.gif" width="16" height="16" border="0"/> 确认报送</a>&nbsp; &nbsp;
        			    </td>
        			    <td>
        			    <a href="employeeRedeploy_transactorList"><img src="images/goback.gif" width="14" height="14" border="0"/> 取消</a>
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