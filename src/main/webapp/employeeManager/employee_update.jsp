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
 <form action="employee_update" method="post" name="frm">
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
                    <td class="STYLE1"><div align="center"><a onClick="javascript:document.getElementById('frm').action='employee_update';document.getElementById('frm').submit();"><img src="images/22.gif" width="14" height="14" border="0"/></a></div></td>
                    <td class="STYLE1"><div align="center">保存</div></td>
                  </tr>
                </table></td>
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
        	<div style="height:440px;background-color:">
        		<div class="addDiv">
        		        <input type="hidden" value='${employee.empSex}' name="hdEmpSex" id="hdEmpSex"/>
						<input type="hidden" value='${employee.dept.deptName}' name="hdEmpDept" id="hdEmpDept"/>
						<input type="hidden" value='${employee.post.postName}' name="hdEmpPost" id="hdEmpPost"/>
						<input type="hidden" value='${employee.employeeState.employeeState}' name="hdEmpState" id="hdEmpState"/>
						<input type="hidden" name="update" value="update" />
						<input type="hidden" name="currentPage" value="${currentPage}" />
												
        			<table class="addTable">
        			    <tr><td class="addTd">工号</td><td><input type="text" name="employee.empId" value="${employee.empId}" readonly="readonly"/></td>
        				<td class="addTd2">姓名</td><td><input type="text" name="employee.empName" value="${employee.empName}" /></td> 
        				</tr>
        				<tr>
        				<td class="addTd">性别</td><td><select name="employee.empSex" id="empSex" style="width:155px"><option value="男">男</option><option value="女">女</option> </select></td>
        				<td class="addTd2">住址</td><td><input type="text" name="employee.empAddress" value="${employee.empAddress}" /></td>
        				</tr>
        				<tr>
        				<td class="addTd">籍贯</td><td><input type="text" name="employee.empNativePlace" value="${employee.empNativePlace}" /></td>
        				<td class="addTd2">民族</td><td><input type="text" name="employee.empNational" value="${employee.empNational}" /></td>  
						</tr>
        				<tr>
						<td class="addTd">身份证号</td><td><input type="text" name="employee.empIdNumber" value="${employee.empIdNumber}" /></td>
        				<td class="addTd2">出生日期</td><td><input type="text" name="employee.empBirthday" value="${employee.empBirthday}" class="Wdate" type="text" onfocus="WdatePicker({skin:'whyGreen'})"/></td>
        				</tr>
        				<tr>
        				<td class="addTd">婚姻状态</td><td><input type="text" name="employee.empMarriage" value="${employee.empMarriage}" /> </td>
        				<td class="addTd2">政治面貌</td><td><input type="text" name="employee.empPoliticalVisage" value="${employee.empPoliticalVisage}" /> </td>
        				</tr>
        				<tr>
        				<td class="addTd">学历</td><td><input type="text" name="employee.empEducation" value="${employee.empEducation}" /> </td>
        				<td class="addTd2">学位</td><td><input type="text" name="employee.empDegree" value="${employee.empDegree}" /> </td>
        				</tr>
        				<tr>
        				<td class="addTd">毕业院校</td><td><input type="text" name="employee.empGraduationSchool" value="${employee.empGraduationSchool}" /> </td>
        				<td class="addTd2">所学专业</td><td><input type="text" name="employee.empSpeciality" value="${employee.empSpeciality}" /> </td>
        				</tr>
        				<tr>
        				<td class="addTd">毕业时间</td><td><input type="text" name="employee.empGraduationDate" value="${employee.empGraduationDate}" class="Wdate" type="text" onfocus="WdatePicker({skin:'whyGreen'})"/></td>
        				<td class="addTd2">联系电话</td><td><input type="text" name="employee.empTel" value="${employee.empTel}" /></td>
        				</tr>
        				<tr>
        				<td class="addTd">Email</td><td><input type="text" name="employee.empEmail" value="${employee.empEmail}" /></td>
        				<td class="addTd">QQ</td><td><input type="text" name="employee.empQq" value="${employee.empQq}" /> </td>
        				</tr>
        				<tr style="margin-top: 80px">
        				<td class="addTd">部门</td><td>
        				<s:select 
					       name="deptId"
					       list="#request['depts']"
					       listKey="deptId"
					       listValue="deptName"
					       theme="simple"
					       headerKey="0" headerValue="请选择"
					       required="true"
					       cssStyle="width:155px"
						/>
						</td>
        				<td class="addTd2">岗位</td><td>
        				<s:select 
					       name="postId"
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
        				<td class="addTd">职称</td><td><input type="text" name="employee.empTitle" value="${employee.empTitle}" /> </td>
        				<td class="addTd2">当前状态</td><td>
        				<s:select 
					       name="employeeStateId"
					       list="#request['employeeStates']"
					       listKey="employeeStateId"
					       listValue="employeeState"
					       theme="simple"
					       headerKey="0" headerValue="请选择"
					       required="true"
					       cssStyle="width:155px"
						/>
						</td>
        				</tr>
        				<tr><td class="addTd">备注</td><td colspan="3"><textarea name="employee.remark" rows="5" cols="74">${employee.remark}</textarea> </td></tr>
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

<script type="text/javascript">
	var empSex = document.getElementById("empSex");
	var hdEmpSex = document.getElementById("hdEmpSex");
	if (hdEmpSex != null && hdEmpSex.value != "") 
	{
		empSex.value = hdEmpSex.value;
	}

	var hdEmpDept = document.getElementById("hdEmpDept");
	var deptId = document.getElementById("deptId");
	if (hdEmpDept != null && hdEmpDept.value != "") 
	{
	    for (var i = 0; i < deptId.options.length; i++) {        
	        if (deptId.options[i].text == hdEmpDept.value) {        
	        	deptId.options[i].selected = true;        
	            break;        
	        }        
	    }              
	}

	var hdEmpPost = document.getElementById("hdEmpPost");
	var postId = document.getElementById("postId");
	if (hdEmpPost != null && hdEmpPost.value != "") 
	{
	    for (var i = 0; i < postId.options.length; i++) {        
	        if (postId.options[i].text == hdEmpPost.value) {        
	        	postId.options[i].selected = true;        
	            break;        
	        }        
	    }              
	}

	var hdEmpState = document.getElementById("hdEmpState");
	var employeeStateId = document.getElementById("employeeStateId");
	if (hdEmpState != null && hdEmpState.value != "") 
	{
	    for (var i = 0; i < employeeStateId.options.length; i++) {        
	        if (employeeStateId.options[i].text == hdEmpState.value) {        
	        	employeeStateId.options[i].selected = true;        
	            break;        
	        }        
	    }              
	}
</script>

</form>
</body>
</html>