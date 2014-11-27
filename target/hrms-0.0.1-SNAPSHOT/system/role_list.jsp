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
 <form action="role" method="post" name="frm">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：系统管理-角色管理</td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
                      <input type="checkbox" name="chkboxAll" value="checkbox" onclick="checkAll(this)"/>
                    </div></td>
                    <td class="STYLE1"><div align="center">全选</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><a href="role_add"><img src="images/22.gif" width="14" height="14" border="0"/></a></div></td>
                    <td class="STYLE1"><div align="center">新增</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center" style="text-align: center;"><a href="javaScript:action('role_update','roleId','${page.currentPage}')"><img src="images/33.gif" width="14" height="14" border="0"/></a></div></td>
                  	<td class="STYLE1"><div align="center">修改</div></td>
                  </tr>
                </table></td>
                <td width="52"><table width="88%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><a href="javaScript:action('role_delete','roleId','${page.currentPage}')"><img src="images/11.gif" width="14" height="14" border="0"/></a></div></td>
                    <td class="STYLE1"><div align="center">删除</div></td>
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
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="3%" class="mainIframeTableTh"><input type="checkbox" name="chkboxParent" value="checkbox" onclick="checkAll(this)"/></td>
            <td width="3%" class="mainIframeTableTh">序号</td>
            <td width="20%" class="mainIframeTableTh">角色</td>
            <td width="20%" class="mainIframeTableTh">角色职责</td>
            <td width="15%" class="mainIframeTableTh">角色模块</td>
            <td width="15%" class="mainIframeTableTh">权限</td>
            <td width="15%" class="mainIframeTableTh">基本操作</td>
          </tr>
 <s:iterator  value="roles" >  
          <tr>
            <td class="mainIframeTableTd"><input type="checkbox" name="chkBoxChildren" value="${userId}" onclick="cancel(this,'chkboxParent')"/></td>
            <td class="mainIframeTableTd">${roleId}</td>
            <td class="mainIframeTableTd">${roleName}</td>
            <td class="mainIframeTableTd">${roleDescription}</td>
             <td class="mainIframeTableTd"><a href="roleModule?roleId=${roleId}">分配</a></td>
            <td class="mainIframeTableTd"><a href="permission?roleId=${roleId}">查看</a></td>
            <td class="mainIframeTableTd"><span class="STYLE4">
            <a href="role_update?roleId=${roleId}&currentPage=${page.currentPage}">
            <img src="images/edt.gif" width="16" height="16" border="0"/>编辑</a>&nbsp; &nbsp;
            <a onclick="return confirm('确定要删除吗？');" href="role_delete?roleId=${roleId}&currentPage=${page.currentPage}">
            <img src="images/del.gif" width="16" height="16" border="0"/>删除</a></span>
            </td>
          </tr>
   </s:iterator>          
        </table>
        <table><tr><td height="100%"></td></tr></table>
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
            <td class="STYLE4">&nbsp;&nbsp;共有${page.totalSize}条记录，每页${page.pageSize}条，当前第${page.currentPage}/${page.totalPage}页</td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                <s:if test="page.hasFirst">
                  <td width="40">
                  	<a href="role?currentPage=1"><img src="images/first.gif" border=0></a>&nbsp;
                  </td>
                </s:if>
                <s:else>
                  <td width="40">
                  	<img src="images/first.gif" border=0>&nbsp;
                  </td>
               </s:else>
               <s:if test="page.hasPrevious">
                  <td width="40">
                  	<a href="role?currentPage=${page.currentPage-1}"><img src="images/back.gif" border=0></a>&nbsp;
                  </td>
                </s:if>
                <s:else>
                  <td width="40">
                  	<img src="images/back.gif" border=0>&nbsp;
                  </td>
               </s:else>
               <s:if test="page.hasNext">
                  <td width="40">
                  	<a href="role?currentPage=${page.currentPage+1}"><img src="images/next.gif" border=0></a>&nbsp;
                  </td>
                </s:if>
                <s:else>
                  <td width="40">
                  	<img src="images/next.gif" border=0>&nbsp;
                  </td>
               </s:else>
              <s:if test="page.hasLast">
                  <td width="40">
                  	<a href="role?currentPage=${page.totalPage}"><img src="images/last.gif" border=0></a>&nbsp;
                  </td>
                </s:if>
                <s:else>
                  <td width="40">
                  	<img src="images/last.gif" border=0>&nbsp;
                  </td>
               </s:else>
                  <td width="38" class="STYLE4"><div align="center" >转到第</div></td><td class="STYLE4"><div align="center" ><input name="currentPage" type="text" size="3" style="width:18px;height:18px;line-height:18px; border:1px solid #999999;text-align: center;" /></div></td><td width="10" class="STYLE4"> 页 </td>
                  <td width="40"><div align="center" ><img onclick="javascript:document.forms['frm'].submit();" src="images/go.gif" width="37" height="15" /></div></td>
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