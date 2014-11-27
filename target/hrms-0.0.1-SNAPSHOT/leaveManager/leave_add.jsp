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
	
<link href="css/mainIframe.css" rel="stylesheet" type="text/css" />	
<script language="javascript" type="text/javascript"
			src="My97DatePicker/WdatePicker.js"></script>
			
			<script type="text/javascript">
				function addSubmit()
				{
					if (validate())
					{
						var frm = document.getElementById('frm');
						frm.action = "leave_add";
						frm.submit();
					}
					return false;
				}
				function validate()
				{
					
					var startTime = document.getElementById("leave.startTime").value;
					var endTime = document.getElementById("leave.endTime").value;
					
					if(startTime == null || startTime == "")
					{
						alert("开始时间不能为空！");
						return false;
					}
					if(endTime == null || endTime == "")
					{
						alert("结束时间不能为空！");
						return false;
					}
					if(document.getElementById("leave.applyReason").value == null || document.getElementById("leave.applyReason").value == "")
					{
						alert("申请理由不能为空！");
						document.getElementById("leave.applyReason").focus();
						return false;
					}
					return true;
				}
			</script>
</head>

<body>
 <form action="leave_add" method="post" name="frm" onsubmit="return validate()">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：考勤管理-请假申请</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><a onClick="addSubmit();"><img src="images/22.gif" width="14" height="14" border="0"/></a></div></td>
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
				   <input type="hidden" name="currentPage" value="${currentPage}" />
				   <input type="hidden" name="addAction" value="1" />
				   <input type="hidden" name="recruit.state" value="未提交" />
					<%
					String today = Calendar.getInstance().get(Calendar.YEAR) 
						           + "-" + (Calendar.getInstance().get(Calendar.MONTH) + 1) 
						           + "-" + Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
					%>							
        			<table class="addTable">
        			 <tr>
        			 	<td class="addTd">申请人</td>
        			    <td><input type="text"  name="leave.applyPerson" value="${employee.empName}" readonly="readonly"/></td>
        			    <td class="addTd2">所属部门</td>
        			    <td><input type="text" name="leave.applyDept" value="${employee.dept.deptName}" readonly="readonly"/></td>
        			 </tr>
        			 <tr>
        				<td class="addTd">申请日期</td>
        				<td><input type="text" name="leave.applyDate" value="<%=today%>" readonly="readonly"/></td>
        			 	<td class="addTd2">请假类型</td>
        				<td><s:select
						       name="leaveType"
						       list="#request['leaveTypes']"
						       listKey="leaveTypeId"
						       listValue="leaveType"
						       theme="simple"
						       required="true"
						       cssStyle="width:155px"
							/></td>
        			 </tr>
        			 <tr>
        				<td class="addTd">开始时间</td>
        				<td><input type="text" name="leave.startTime"  class="Wdate" onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true,skin:'whyGreen'})"/></td>
        				<td class="addTd2">结束时间</td>
        				<td><input type="text" name="leave.endTime" class="Wdate" onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true,skin:'whyGreen'})"/></td>
        			</tr>
        			 <tr> 
        				<td class="addTd">申请理由</td>
        				<td colspan="3"><textarea name="leave.applyReason" rows="6" cols="74"></textarea></td> 
        			 </tr>
        			</table>
        		</div>
        		<br/><span style="width:20px"></span>
        		<input class="btnClick" name="add" type="submit" value="保存"/>
          		<input class="btnClick" name="cancel" type="button" value="取消" onclick="self.location='leave_my';" />
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