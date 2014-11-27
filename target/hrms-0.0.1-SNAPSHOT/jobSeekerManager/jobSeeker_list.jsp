<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'recruit_list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link href="css/mainIframe.css" rel="stylesheet" type="text/css" />	
<link href="css/uploadJobSeeker.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.3.1.js" ></script>
<script type="text/javascript" src="js/jobSeeker.js" ></script>
<script type="text/javascript" src="js/changeLineColor.js"></script>
<script type="text/javascript" src="js/chkBoxSelect.js"></script>
<script type="text/javascript" src="js/action.js"></script>
<script type="text/javascript">


</script>


</head>

<body>
<form action="jobSeeker_upload" method="post" name="frmUpload" enctype="multipart/form-data">
<div id="win">
<input type="hidden" name="recruitId" value="${recruitId}"/>
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
                <td width="95%" class="STYLE1"><span class="STYLE3">上传文件</span></td>
              </tr>
            </table></td>
            <td width="54%"><table border="0" align="right" cellpadding="0" cellspacing="0">
              <tr>
                <td width="100"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><a href="" onclick="hide();return false;" style="cursor :pointer;"><img id="close" alt="关闭" src="images/close.png" border="0"/></a></td>
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
            <td class="mainIframeTableTd">登记表</td>
            <td class="mainIframeTableTd"><input type="file" name="registrationForm" size="50"/></td>
          </tr>
          <tr>
            <td class="mainIframeTableTd">简历</td>
            <td class="mainIframeTableTd"><input type="file" name="resume" size="50" /></td>
          </tr>
           <tr>
            <td class="mainIframeTableTd" colspan="2" style="padding-top: 3px"><a href="" onclick="uploadJobSeeker();return false;"><input type="button" style="width:60" value="上传"/></a> 
			<a href="" onclick="javascript:document.forms['frmUpload'].reset(); return false;"><input type="button" style="width:60" value="取消"/></a></td>
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
            <td>
            <table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                  <td width="40"><div align="center" ></div></td>
                </tr>
            </table>
            </td>
          </tr>
        </table></td>
        <td width="16"><img src="images/tab_20.gif" width="16" height="35" /></td>
      </tr>
    </table></td>
  </tr>
</table>
</div>
</form>

<input type="hidden" name="errorMessage" value="${errorMessage }"/>
<form action="jobSeeker" method="post" name="frm">
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
                <td width="95%" class="STYLE1"><span class="STYLE3">你当前的位置</span>：招聘管理-求职简历</td>
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
                    <td class="STYLE1"><div align="center"><a href="javaScript:action('recruit_detail','recruitId','${page.currentPage}')"><img src="images/detail.gif" width="14" height="14" border="0"/></a></div></td>
                    <td class="STYLE1"><div align="center">明细</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><a href="recruit_add"><img src="images/22.gif" width="14" height="14" border="0"/></a></div></td>
                    <td class="STYLE1"><div align="center">新增</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="87%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center">
                     <a onclick="showwin()"><img src="images/search.gif" width="14" height="14" border="0"/></a>
                    </div></td>
                    <td class="STYLE1"><div align="center">查询</div></td>
                  </tr>
                </table></td>
                <td width="60"><table width="90%" border="0" cellpadding="0" cellspacing="0">
                  <tr>
                    <td class="STYLE1"><div align="center"><a href="employeeRedeploy_export?fileName=员工信息"><img src="images/export.gif" width="14" height="14" border="0"/></a></div></td>
                    <td class="STYLE1"><div align="center">导出</div></td>
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
        <td width="8" background="images/tab_12.gif">&nbsp;
        <input type="hidden" name="recruitId" value="${recruitId}"/>
        </td>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="b5d6e6" onmouseover="changeto()"  onmouseout="changeback()">
          <tr>
            <td width="3%" class="mainIframeTableTh"><input type="checkbox" name="chkboxParent" value="checkbox" onclick="checkAll(this)"/></td>
            <td width="4%" class="mainIframeTableTh">单据号</td>
            <td width="10%" class="mainIframeTableTh">应聘职位</td>
            <td width="6%" class="mainIframeTableTh">申请时间</td>
            <td width="6%" class="mainIframeTableTh">姓名</td>
            <td width="3%" class="mainIframeTableTh">性别</td>
            <td width="10%" class="mainIframeTableTh">毕业学校</td>
            <td width="5%" class="mainIframeTableTh">学历</td>
            <td width="8%" class="mainIframeTableTh">登记表</td>
            <td width="8%" class="mainIframeTableTh">简历</td>
            <td width="6%" class="mainIframeTableTh">电话</td>
            <td width="8%" class="mainIframeTableTh">电子邮箱</td>
            <td width="15%" class="mainIframeTableTh">基本操作</td>
          </tr>
 <s:iterator  value="jobSeekers" >  
          <tr>
            <td class="mainIframeTableTd"><input type="checkbox" name="chkBoxChildren" value="${recruitId}" onclick="cancel(this,'chkboxParent')"/></td>
            <td class="mainIframeTableTd">${jobSeekerId}</td>
            <td class="mainIframeTableTd">${recruit.recruitPost}</td>
            <td class="mainIframeTableTd">2011-11-11</td>
            <td class="mainIframeTableTd">${jobSeekerName}</td>
            <td class="mainIframeTableTd">${jobSeekerSex}</td>
            <td class="mainIframeTableTd">${jobSeekerGraduationSchool}</td>
            <td class="mainIframeTableTd">${jobSeekerEducation}</td>
            <td class="mainIframeTableTd">
            <s:if test="%{jobSeekerRegistrationForm == null || jobSeekerRegistrationForm.trim() == ''}">
            		<a href="" onclick="showwin(${jobSeekerId});return false;">上传</a>
            </s:if>
            <s:else>
            <a href="jobSeeker_scan?recruitId=${recruitId}&fileName=<s:property value="jobSeekerRegistrationForm.trim().substring(jobSeekerRegistrationForm.trim().lastIndexOf('upload') + 1)"/>">
            	预览
            </a>
            <a href="" onclick="showwin(${jobSeekerId});return false;">重新上传</a>
            </s:else>
            </td>
            <td class="mainIframeTableTd">
            <s:if test="%{jobSeekerResume == null || jobSeekerResume.trim() == ''}">
            		<a href="" onclick="showwin(${jobSeekerId});return false;">上传</a>
            </s:if>
            <s:else>
            <a href="jobSeeker_scan?recruitId=${recruitId}&fileName=<s:property value="jobSeekerResume.trim().substring(jobSeekerResume.trim().lastIndexOf('upload') + 1)"/>">
            	预览
            </a>
            <a href="" onclick="showwin(${jobSeekerId});return false;">重新上传</a>
            </s:else>
            </td>
            <td class="mainIframeTableTd">${jobSeekerTel}</td>
            <td class="mainIframeTableTd">${jobSeekerEmail}</td>
            <td class="mainIframeTableTd"><span class="STYLE4">
            <a onclick="return confirm('确定要删除吗？');" href="recruit_delete?recruitId=${recruitId}&currentPage=${page.currentPage}">
            <img src="images/del.gif" width="16" height="16" border="0"/>删除</a></span>
            </td>
          </tr>
   </s:iterator>          
        </table>
        <table width="100%" height="12px"><tr><td ></td></tr></table>
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
            <td class="STYLE4">&nbsp;&nbsp;共有${page.totalSize}条记录，每页${page.pageSize}条，当前第${page.currentPage}/${page.totalPage}页
            
            </td>
            <td><table border="0" align="right" cellpadding="0" cellspacing="0">
                <tr>
                <s:if test="page.hasFirst">
                  <td width="40">
                  	<a href="" onclick="return getPage(1);"><img src="images/first.gif" border=0></a>&nbsp;
                  </td>
                </s:if>
                <s:else>
                  <td width="40">
                  	<img src="images/first.gif" border=0>&nbsp;
                  </td>
               </s:else>
               <s:if test="page.hasPrevious">
                  <td width="40">
                  	<a href="" onclick="return getPage(${page.currentPage - 1});"><img src="images/back.gif" border=0></a>&nbsp;
                  </td>
                </s:if>
                <s:else>
                  <td width="40">
                  	<img src="images/back.gif" border=0>&nbsp;
                  </td>
               </s:else>
               <s:if test="page.hasNext">
                  <td width="40">
                  	<a href="" onclick="return getPage(${page.currentPage + 1});"><img src="images/next.gif" border=0></a>&nbsp;
                  </td>
                </s:if>
                <s:else>
                  <td width="40">
                  	<img src="images/next.gif" border=0>&nbsp;
                  </td>
               </s:else>
              <s:if test="page.hasLast">
                  <td width="40">
                  	<a href="" onclick="return getPage(${page.totalPage});"><img src="images/last.gif" border=0></a>&nbsp;
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
<script type="text/javascript">
var errorMessage = document.getElementById("errorMessage").value;
if(errorMessage != null && errorMessage != "")
	  alert(errorMessage);
</script>
</body>
</html>