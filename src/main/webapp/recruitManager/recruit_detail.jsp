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
 <form action="recruit" method="post" name="frm">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：招聘管理-招聘明细</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;">
                    <a href="javascript:history.go(-1);"><img src="images/goback.gif" width="14" height="14" border="0" /></a></div></td>
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
        				<tr><td colspan="4"><font style="font-weight:bold;">申请明细:</font></td></tr>
        				<tr>
        				<td class="detailTdName1">单据号</td>
        				<td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.recruitId}" /></td> 
        				</tr>
        				<tr>
        				<td class="detailTdName1">招聘标题</td><td class="detailTdValue2" colspan="3"><input type="text" readonly="readonly" style="width:500px" value="${recruit.recruitTitle}"/></td>
						</tr>
        				<tr>
        				<td class="detailTdName1">申请人</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.applyPerson}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">电子邮箱</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.applyPersonEmail}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">申请部门</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.applyDept}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">申请日期</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.applyDate}"/></td>  
						</tr>
						<tr>
						<td class="detailTdName1">申请理由</td>
						<td class="detailTdValue2" colspan="3"><textarea readonly="readonly" rows="5" cols="60">${recruit.applyReason}</textarea></td>
						</tr>
						<tr><td colspan="4" height="30px"><font style="font-weight:bold;">招聘明细:</font></td></tr>
        				<tr>
        				<td class="detailTdName1">招聘职位</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.recruitPost}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">招聘人数</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.recruitCount}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">职位职责</td>
        				<td class="detailTdValue2" colspan="3"><textarea readonly="readonly" rows="5" cols="60">${recruit.postRequire}</textarea></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">招聘人员要求</td>
        				<td class="detailTdValue2" colspan="3"><textarea readonly="readonly" rows="5" cols="60">${recruit.personRequire}</textarea></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">工作年限</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.workingAge}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">薪资待遇</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.wage}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">招聘类型</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.recruitType}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">招聘方式</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.recruitWay}"/></td>
        				</tr>
        				<tr><td colspan="4" height="30px"><font style="font-weight:bold;">审批明细:</font></td></tr>
        				<tr>
        				<td class="detailTdName1">审批日期</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.approveDate}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">当前状态</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.state}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">审批人</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.approver}"/></td>
						</tr>
						<tr>
        				<td class="detailTdName1">审批结果</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.approveResult}"/></td>
						</tr>
						<tr>
						<td class="detailTdName1">审批人意见</td>
        				<td class="detailTdValue2" colspan="3"><textarea readonly="readonly" rows="5" cols="60">${recruit.approverOption}</textarea>
						</td>
						</tr>
						<tr><td colspan="4"><font style="font-weight:bold;">发布明细:</font></td></tr>
        				<tr>
        				<td class="detailTdName1">发布日期</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.publishDate}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">截止日期</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${recruit.deadline}"/></td>
        				</tr>
        				<tr>
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