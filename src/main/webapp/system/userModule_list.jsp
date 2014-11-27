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
<script type="text/javascript">
	function selectUserId() {
		var select = document.getElementById("select");
	    var index = select.selectedIndex;
	    var userName = select.options[index].text;
	    var userId = select.options[index].value;
	    var userId = select.value
	    //window.alert(select.value); 
	    self.location= "userModule?userId="+userId;
	}
	function addToUser() {
		var userId = document.getElementById("select").value
		var moduleIdSum = allModuleTree.getAllChecked();
		if(moduleIdSum == "") {
			window.alert("至少选择一项");
			return false; 
		}
	    self.location= "userModule_add?userId="+userId+"&moduleIdSum="+moduleIdSum;
	}
	function addAllToUser() {
		allModuleTree.setSubChecked(allModuleTree.getSelectedItemId(),true);
		var userId = document.getElementById("select").value
		var moduleIdSum = allModuleTree.getAllChecked();
		self.location= "userModule_add?userId="+userId+"&moduleIdSum="+moduleIdSum;
	}
	function removeFromUser() {
		var userId = document.getElementById("select").value
		var moduleIdSum = userModuleTree.getAllChecked();
		if(moduleIdSum == "") {
			window.alert("至少选择一项");
			return false;  
		}
		//window.alert(roleId); 
	    //window.alert(moduleIdSum); 
	    self.location= "userModule_delete?userId="+userId+"&moduleIdSum="+moduleIdSum;
	}
	function removeAllFromUser() {
		userModuleTree.setSubChecked(userModuleTree.getSelectedItemId(),true);
		var userId = document.getElementById("select").value
		var moduleIdSum = userModuleTree.getAllChecked();
	    //window.alert(moduleIdSum); 
	    self.location= "userModule_delete?userId="+userId+"&moduleIdSum="+moduleIdSum;
	}
	
	</script>
	
<link href="css/mainIframe.css" rel="stylesheet" type="text/css" />
<link rel="STYLESHEET" type="text/css" href="codebase/dhtmlxtree.css">
<script  src="codebase/dhtmlxcommon.js"></script>
<script  src="codebase/dhtmlxtree.js"></script>		
<script type="text/javascript" src="js/changeLineColor.js"></script>
<script type="text/javascript" src="js/chkBoxSelect.js"></script>
<script type="text/javascript" src="js/action.js"></script>
</head>

<body>
 <form action="user" method="post" name="frm">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：系统管理-用户模块管理</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
              <td width="90"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;"><a href="moduleTree" target="leftIframe"><img src="images/save.gif" width="14" height="14" border="0"/></a></div></td>
                  	<td class="STYLE1"><div align="center">刷新菜单栏</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;"><a href="user"><img src="images/goback.gif" width="14" height="14" border="0"/></a></div></td>
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
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" >
          <tr>
            <td width="15%" class="mainIframeTableTh">
     <div class="listTop" style="float:left;margin-bottom: 3px"><br/>
     		用户：
			<span class="spwidth2"></span><s:select label="用户"
			   id="select"	
		       name="userId"
		       list="users"
		       listKey="userId"
		       listValue="userName"
		       onchange="selectUserId()"
		       theme="simple"
		       headerKey="15" headerValue="请选择用户"
		       required="true"
		       cssStyle="width:300px"
			/>
			</div>
		<br/>
         <div align="center" >
	<table onmouseout="changeback()">
    	<tr>
    		<td valign="top" style="width:1.3em; float:right;padding-right: 50px"><span class="STYLE1"><br/>系统模块</span></td>
	        <td valign="top">
	            <div id="treeboxbox_allModuleTree" style="width:300px; height:500px;background-color:#f5f5f5;border :1px solid Silver;; overflow:auto;">
	            </div>
	        </td>
	        <td style="padding-left:20;padding-right:20" valign="middle">
	        <a href="javascript:void(0);" onClick="addAllToUser();" style="position: fixed;"><img src="images/addallto.gif" border=0></a><br><br>
	        <a href="javascript:void(0);" onClick="addToUser();" style="position: fixed;"><img src="images/addto.gif" border=0></a><br><br>
	        <a href="javascript:void(0);" onClick="removeFromUser();" style="position: fixed;"><img src="images/removefrom.gif" border=0></a><br><br>
	        <a href="javascript:void(0);" onClick="removeAllFromUser();" style="position: fixed;"><img src="images/removeallfrom.gif" border=0></a><br><br>
	        </td>
	        <td valign="top">
				<div id="treeboxbox_userModuleTree" style="width:300px; height:500px;background-color:#f5f5f5;border :1px solid Silver;">
				</div>
			</td>
			<td valign="top" style="width:1.3em; float:right;padding-left: 50px"><span class="STYLE1"><br/>用户模块</span></td>
			<td  style="padding-left:25" valign="top">
			
			</td>
    	</tr>
	</table>    
			<script>
			allModuleTree = new dhtmlXTreeObject("treeboxbox_allModuleTree", "100%", "100%", 0); 
			allModuleTree.setSkin('dhx_skyblue');
			allModuleTree.setImagePath("codebase/imgs/csh_bluebooks/");
			allModuleTree.enableCheckBoxes(1);
			allModuleTree.enableThreeStateCheckboxes(false);
			allModuleTree.loadXML("codebase/allModuleTree.xml");
			
			userModuleTree=new dhtmlXTreeObject("treeboxbox_userModuleTree","100%","100%",0);
			userModuleTree.setSkin('dhx_skyblue');
			userModuleTree.setImagePath("codebase/imgs/csh_bluebooks/");
			userModuleTree.enableCheckBoxes(1);
			userModuleTree.loadXML("codebase/userModuleTree.xml");
			
			</script>
        </div>       
			</td>
          </tr>

        </table></td>
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