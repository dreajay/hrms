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
    
    <title>My JSP 'recruit_update.jsp' starting page</title>
    
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
						frm.action = "recruit_update";
						frm.submit();
					}
					return false;
				}
				function validate()
				{
					if(document.getElementById("recruit.recruitTitle").value == null || document.getElementById("recruit.recruitTitle").value == "")
					{
						alert("招聘标题不能为空！");
						document.getElementById("recruit.recruitTitle").focus();
						return false;
					}
					if(document.getElementById("recruit.applyReason").value == null || document.getElementById("recruit.applyReason").value == "")
					{
						alert("申请理由不能为空！");
						document.getElementById("recruit.applyReason").focus();
						return false;
					}
					if(document.getElementById("recruit.postRequire").value == null || document.getElementById("recruit.postRequire").value == "")
					{
						alert("职位职责不能为空！");
						document.getElementById("recruit.postRequire").focus();
						return false;
					}
					if(document.getElementById("recruit.personRequire").value == null || document.getElementById("recruit.personRequire").value == "")
					{
						alert("招聘人员要求不能为空！");
						document.getElementById("recruit.personRequire").focus();
						return false;
					}
					return true;
				}
			</script>
</head>

<body>
 <form action="recruit_update" method="post" name="frm" onsubmit="return validate()">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：招聘管理-招聘申请</td>
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
				   <input type="hidden" name="update" value="update" />
				   <input type="hidden" name="recruit.recruitId" value="${recruitId}" />
				   <%
					String today = Calendar.getInstance().get(Calendar.YEAR) 
						           + "-" + (Calendar.getInstance().get(Calendar.MONTH) + 1) 
						           + "-" + Calendar.getInstance().get(Calendar.DAY_OF_MONTH);
					%>	
        			<table class="addTable">
        			 <tr>
        			 	<td class="addTd">招聘标题</td>
        			    <td colspan="3"><input type="text" name="recruit.recruitTitle" value="${recruit.recruitTitle}" style="width:612px"/></td>
        			 </tr>
        			 <tr>
        			 	<td class="addTd">申请人</td>
        			    <td><input type="text"  name="recruit.applyPerson" value="${recruit.applyPerson}" readonly="readonly"/></td>
        			    <td class="addTd2">申请部门</td>
        			    <td><input type="text" name="recruit.applyDept" value="${recruit.applyDept}" readonly="readonly"/></td>
        			 </tr>
        			 <tr>
        				<td class="addTd">申请日期</td>
        				<td><input type="text" name="recruit.applyDate" value="<%=today%>" readonly="readonly"/></td>
        			 </tr>
        			 <tr> 
        				<td class="addTd">申请理由</td>
        				<td colspan="3"><textarea name="recruit.applyReason" rows="5" cols="74">${recruit.applyReason}</textarea></td> 
        			 </tr>
        			 <tr> 
        				<td class="addTd">招聘类型</td>
        				<td>
        				<select name="recruit.recruitType" style="width:155px">
        				<option value="全职">全职</option><option value="兼职">兼职</option>
        				<option value="实习生">实习生</option><option value="在校生">在校生</option>
        				</select>
        				</td>
        				<td class="addTd2">招聘方式</td>
        				<td>
        				
        				<select name="recruit.recruitWay" style="width:155px">
        				<option value="网络招聘">网络招聘</option><option value="现场招聘">现场招聘</option>
        				<option value="校园招聘">校园招聘</option><option value="猎头公司">猎头公司</option>
        				</select>
        				</td>
        			</tr>
        			 <tr> 
        			    <td class="addTd">招聘职位</td>
        			    <td><input type="text" name="recruit.recruitPost" value="${recruit.recruitPost}"/></td>
						<td class="addTd2">招聘人数</td><td>
        				<input type="text" name="recruit.recruitCount" value="${recruit.recruitCount}"/></td>
        			 </tr>
        			 <tr>
        				<td class="addTd">工作年限</td>
        				<td><input type="text" name="recruit.workingAge" value="${recruit.workingAge}"/></td>
        				<td class="addTd2">薪资待遇</td>
        				<td><input type="text" name="recruit.wage" value="${recruit.wage}"/></td>
        				</tr>
        				<tr>
        				<td class="addTd">职位职责</td>
        				<td colspan="3"><textarea name="recruit.postRequire" rows="5" cols="74">${recruit.postRequire}</textarea></td>
        				</tr>
        				<tr> 
        				<td class="addTd">招聘人员要求</td>
        				<td colspan="3"><textarea name="recruit.personRequire" rows="5" cols="74">${recruit.personRequire}</textarea></td>
						</tr>
        			</table>
        		</div>
        		<br/><span style="width:20px"></span>
        		<input class="btnClick" name="add" type="submit" value="保存"/>
          		<input class="btnClick" name="cancel" type="button" value="取消" onclick="self.location='recruit_my';" />
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
<script type="text/javascript">
document.getElementById("recruit.recruitType").value = "${recruit.recruitType}";
document.getElementById("recruit.recruitWay").value = "${recruit.recruitWay}";
</script>
</body>
</html>