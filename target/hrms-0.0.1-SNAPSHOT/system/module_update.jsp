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
			
<script type="text/javascript">
		function updateModule(forwardAction) {
			if(document.getElementById("module.moduleName").value == null || document.getElementById("module.moduleName").value == ""){
				window.alert("请输入模块名称");
				return false;
			} else {
				var frm = document.getElementById("frm");
				frm.action = forwardAction;
				frm.submit();
				return false;
			}
			
		}
	</script>
</head>

<body>
 <form action="module_update" method="post" name="frm">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：系统管理-添加模块</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><a href="" onclick="updateModule('module_update');return false;"><img src="images/22.gif" width="14" height="14" border="0"/></a></div></td>
                    <td class="STYLE1"><div align="center">保存</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;">
                    <a href="" onclick="history.go(-1);return false;"><img src="images/goback.gif" width="14" height="14" border="0" /></a></div></td>
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
        <td><s:actionmessage theme="simple"/>
        	<div style="height:440px;background-color:">
        		<div class="addDiv">
        			<table class="addTable">
        			 <tr>
        				<td class="addTd">父&nbsp;&nbsp;模&nbsp;&nbsp;块</td>
        				<td><s:select label="父模块"
						       name="select"
						       list="#session['modules']"
						       listKey="moduleId"
						       listValue="moduleName"
						       theme="simple"
						       headerKey="0" headerValue="请选择父模块"
						       required="true"
						       cssStyle="width:300px"
							/>
						</td>
        				</tr>
        				<tr>
        				<td class="addTd">模块名称</td>
        				<td colspan="3"><input type="text" name="module.moduleName" value="${module.moduleName}" style="width:250px" /></td>
        				</tr>
        				<tr> 
        				<td class="addTd">模块链接</td>
        				<td colspan="3"><input type="text" name="module.linkUrl" value="${module.linkUrl}" style="width:250px"></td>
						</tr>
						<tr> 
        				<td class="addTd">模块描述</td>
        				<td colspan="3">
        				<textarea name="module.moduleDescription" rows="6" cols="70">${module.moduleDescription}</textarea>
						</tr>
        			</table>
        		</div>
        		<br/><span style="width:20px"></span>
        		 <input type="hidden" name="update" value="update" />
           		<input type="hidden" name="moduleId" value="${moduleId}" />
           		<input type="hidden" name="module.parentModuleId" value="${module.parentModuleId}" />
           		<input type="hidden" name="module.moduleOrderNum" value="${module.moduleOrderNum}" />
        		<input name="update" class="btnClick" onclick="updateModule('module_update')" type="button" value="保存"/>
        		<input name="cancel" class="btnClick" type="button" value="取消" onclick="history.go(-1);"/>
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
document.getElementById("select").value = ${module.parentModuleId};
</script>

</form>
</body>
</html>