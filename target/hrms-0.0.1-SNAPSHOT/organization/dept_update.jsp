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
</head>

<body>
 <form action="dept_update" method="post" name="frm">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：机构管理-新建部门</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><a onClick="javascript:document.getElementById('frm').action='dept_update';document.getElementById('frm').submit();"><img src="images/22.gif" width="14" height="14" border="0"/></a></div></td>
                    <td class="STYLE1"><div align="center">保存</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;">
                    <a href="dept"><img src="images/goback.gif" width="14" height="14" border="0" /></a></div></td>
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
        			<table class="addTable">
        				<tr><td class="addTd">部门名称</td><td><input type="text" name="dept.deptName" value="${dept.deptName}" /></td></tr>
        				<tr><td class="addTd">上级部门</td><td>
        				<input type="hidden" value='${parentDept.deptId}' name="parentDeptId" id="parentDeptId"/>
        				<input type="hidden" value='${parentDept.deptName}' name="parentDeptName" id="parentDeptName"/>
        				<s:select 
					       name="selParentDept"
					       list="#session['depts']"
					       listKey="deptId"
					       listValue="deptName"
					       theme="simple"
					       headerKey="0" headerValue="请选择上级部门"
					       required="true"
					       cssStyle="width:300px"
						/>
						<input type="hidden" name="update" value="update" />
						<input type="hidden" name="currentPage" value="${currentPage}" />
						<input type="hidden" name="dept.deptId" value="${dept.deptId}" />
						</td></tr>
        				<tr><td class="addTd">部门负责人</td>
        				<td>
        				<s:select 
					       name="dept.deptMan"
					       list="#request['employees']"
					       listKey="empName"
					       listValue="empName"
					       theme="simple"
					       headerKey="0" headerValue="请选择"
					       required="true"
					       cssStyle="width:155px"
						/></td></tr>
        				<tr><td class="addTd">部门电话</td><td><input type="text" name="dept.deptTel" value="${dept.deptTel}" /></td></tr>
        				<tr><td class="addTd">部门职责</td><td><input type="text" name="dept.deptResponsibility" value="${dept.deptResponsibility}" style="width:500px" /></td></tr>
        				<tr><td class="addTd">备注</td><td><textarea name="dept.remark" rows="6" cols="60">${dept.remark}</textarea> </td></tr>
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
	var parentDeptId = document.getElementById("parentDeptId");
	var parentDeptName = document.getElementById("parentDeptName");
	var selParentDept = document.getElementById("selParentDept");
	if (parentDeptId != null && parentDeptId.value != "" && parentDeptName != null && parentDeptName.value != "") 
	{
	    for (var i = 0; i < selParentDept.options.length; i++) {        
	        if (selParentDept.options[i].text == parentDeptName.value) {        
	        	selParentDept.options[i].selected = true;        
	            break;        
	        }        
	    }              
	}
	document.getElementById("dept.deptMan").value = ${deptMan};
</script>
</form>
</body>
</html>