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
 <form action="train_update" method="post" name="frm">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：培训管理-培训明细</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;">
                    <a href="train"><img src="images/goback.gif" width="14" height="14" border="0" /></a></div></td>
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
						<input type="hidden" name="currentPage" value="${currentPage}" />
						<input type="hidden" name="train.trainId" value="${train.trainId}" />
        			<table class="addTable">
        				<tr><td class="addTd">培训课程</td>
        				<td colspan="3"><input type="text" name="train.trainCourse" value="${train.trainCourse}" readonly="readonly" style="width:610px"/></td> 
        				</tr>
        				<tr><td class="addTd">培训类型</td>
        				<td><input type="text" name="train.traintype" value="${train.traintype.trainType}" readonly="readonly"/>
						</td>
						<td class="addTd2">参加职员</td><td><input type="text" name="train.trainEmployee" value="${train.trainEmployee}" readonly="readonly"/></td>
						</tr>
        				<tr>
        				<td class="addTd">培训单位</td><td><input type="text" name="train.trainUnit" value="${train.trainUnit}" readonly="readonly"/></td>
        				<td class="addTd2">培训导师</td><td><input type="text" name="train.trainTutor" value="${train.trainTutor}" readonly="readonly"/></td>
        				</tr>
        				
        				<tr><td class="addTd">开始日期</td><td><input type="text" name="train.trainStartDate" value="${train.trainStartDate}" type="text" readonly="readonly"/></td>
        				<td class="addTd2">结束日期</td><td><input type="text" name="train.trainEndDate" value="${train.trainEndDate}" type="text" readonly="readonly"/></td>
        				</tr>
        				<tr><td class="addTd">培训目标</td><td colspan="3"><textarea name="train.trainTarget" rows="5" cols="74" readonly="readonly">${train.trainTarget}</textarea></td></tr>
        				<tr><td class="addTd">培训内容</td><td colspan="3"><textarea name="train.trainContent" rows="5" cols="74" readonly="readonly">${train.trainContent}</textarea> </td></tr>
        				<tr><td class="addTd">评估结果</td><td colspan="3"><textarea name="train.trainResult" rows="4" cols="74" readonly="readonly">${train.trainResult}</textarea></td></tr>
        				<tr><td class="addTd">备注</td><td colspan="3"><textarea name="train.remark" rows="3" cols="74" readonly="readonly">${train.remark}</textarea> </td></tr>
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