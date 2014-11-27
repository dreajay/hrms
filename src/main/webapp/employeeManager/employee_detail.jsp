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
<script type="text/javascript" src="js/changeLineColor.js"></script>
<script type="text/javascript" src="js/chkBoxSelect.js"></script>
<script type="text/javascript" src="js/action.js"></script>
<script language="javascript" type="text/javascript"
			src="My97DatePicker/WdatePicker.js"></script>
</head>

<body>
 <form action="employee" method="post" name="frm">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：人事管理-员工录入</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;">
                    <a href="employee"><img src="images/goback.gif" width="14" height="14" border="0" /></a></div></td>
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
        	<div style="height:440px;">
        		<div class="addDiv">
        			<table class="detailTable">
        				<tr>
        				<td class="detailTdName1">姓名</td><td class="detailTdValue">${employee.empName}</td> 
        				<td class="detailTdName2">性别</td><td class="detailTdValue">${employee.empSex}</td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">住址</td><td class="detailTdValue">${employee.empAddress}</td>
        				<td class="detailTdName2">籍贯</td><td class="detailTdValue">${employee.empNativePlace}</td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">民族</td><td class="detailTdValue">${employee.empNational}</td>  
						<td class="detailTdName2">身份证号</td><td class="detailTdValue">${employee.empIdNumber}</td>
						</tr>
        				<tr>
        				<td class="detailTdName1">出生日期</td><td class="detailTdValue">${employee.empBirthday}</td>
        				<td class="detailTdName2">婚姻状态</td><td class="detailTdValue">${employee.empMarriage}</td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">政治面貌</td><td class="detailTdValue">${employee.empPoliticalVisage}</td>
        				<td class="detailTdName2">学历</td><td class="detailTdValue">${employee.empEducation}</td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">学位</td><td class="detailTdValue">${employee.empDegree}</td>
        				<td class="detailTdName2">毕业院校</td><td class="detailTdValue">${employee.empGraduationSchool}</td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">所学专业</td><td class="detailTdValue">${employee.empSpeciality} </td>
        				<td class="detailTdName2">毕业时间</td><td class="detailTdValue">${employee.empGraduationDate}</td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">联系电话</td><td class="detailTdValue">${employee.empTel}</td>
        				<td class="detailTdName2">Email</td><td class="detailTdValue">${employee.empEmail}</td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">QQ</td><td class="detailTdValue">${employee.empQq}</td>
        				<td class="detailTdName2">部门</td><td class="detailTdValue">
        				${employee.dept.deptName}
						</td>
						</tr>
        				<tr>
        				<td class="detailTdName1">岗位</td><td class="detailTdValue">
        				${employee.post.postName}
						</td>
        				<td class="detailTdName2">职称</td><td class="detailTdValue">${employee.empTitle}</td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">当前状态</td><td class="detailTdValue">
        				${employee.employeeState.employeeState}
						</td>
        				</table>
        				<table class="detailTable">
        				<tr>
        				<td class="detailTdName1">备注</td>
        				<td colspan="3" class="detailTdValue">
        				<textarea name="employee.remark" readonly="readonly" rows="5" cols="70">${employee.remark}</textarea> </td></tr>
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