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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：考勤管理-请假明细</td>
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
        				<td class="detailTdValue2"><input type="text" readonly="readonly" value="${leave.leaveId}" /></td> 
        				</tr>
        				<tr>
        				<td class="detailTdName1">申请人</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${leave.applyPerson}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">所属部门</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${leave.applyDept}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">申请日期</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${leave.applyDate}"/></td>  
						</tr>
						<tr>
						<td class="detailTdName1">申请理由</td>
						<td class="detailTdValue2" colspan="3"><textarea readonly="readonly" rows="5" cols="60">${leave.applyReason}</textarea></td>
						</tr>
						<tr>
        				<td class="detailTdName1">开始时间</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${leave.startTime}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">结束时间</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${leave.endTime}"/></td>
        				</tr>
        				<tr><td colspan="4" height="30px"><font style="font-weight:bold;">审批明细:</font></td></tr>
        				<tr>
        				<td class="detailTdName1">审批日期</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${leave.approveDate}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">当前状态</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${leave.state}"/></td>
        				</tr>
        				<tr>
        				<td class="detailTdName1">审批人</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${leave.approver}"/></td>
						</tr>
						<tr>
        				<td class="detailTdName1">审批结果</td><td class="detailTdValue2"><input type="text" readonly="readonly" value="${leave.approveResult}"/></td>
						</tr>
						<tr>
						<td class="detailTdName1">审批人意见</td>
        				<td class="detailTdValue2" colspan="3"><textarea readonly="readonly" rows="5" cols="60">${leave.approveOption}</textarea>
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