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
	
		function poiExport() {
			var syslogUserName = document.getElementById("hidSyslogUserName").value;
			var syslogModuleName = document.getElementById("hidSyslogModuleName").value;
			var syslogAction = document.getElementById("hidSyslogAction").value;
			var syslogType = document.getElementById("hidSyslogType").value;
			var syslogAccessIp = document.getElementById("hidSyslogAccessIp").value;
			var syslogFirstTime = document.getElementById("hidSyslogFirstTime").value;
			var syslogNextTime = document.getElementById("hidSyslogNextTime").value;
			var href = "syslog_export?"+"&syslogUserName="+syslogUserName+"&syslogModuleName="+syslogModuleName
			+"&syslogAction="+syslogAction+"&syslogType="+syslogType+"&syslogAccessIp="+syslogAccessIp
			+"&syslogFirstTime="+syslogFirstTime+"&syslogNextTime="+syslogNextTime+"&fileName="+"系统日志.xls";
			self.location = href;
		}
		function submit(currentPage) {
			var syslogUserName = document.getElementById("hidSyslogUserName").value;
			var syslogModuleName = document.getElementById("hidSyslogModuleName").value;
			var syslogAction = document.getElementById("hidSyslogAction").value;
			var syslogType = document.getElementById("hidSyslogType").value;
			var syslogAccessIp = document.getElementById("hidSyslogAccessIp").value;
			var syslogFirstTime = document.getElementById("hidSyslogFirstTime").value;
			var syslogNextTime = document.getElementById("hidSyslogNextTime").value;
			var href = "syslog_query?currentPage="+currentPage+"&syslogUserName="+syslogUserName+"&syslogModuleName="+syslogModuleName
			+"&syslogAction="+syslogAction+"&syslogType="+syslogType+"&syslogAccessIp="+syslogAccessIp
			+"&syslogFirstTime="+syslogFirstTime+"&syslogNextTime="+syslogNextTime;
			self.location = href;
		}
		
	</script>
		<link href="css/query.css" rel="stylesheet" type="text/css" />	
		<link href="css/mainIframe.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="js/changeLineColor.js"></script>
		<script type="text/javascript" src="js/chkBoxSelect.js"></script>
		<script type="text/javascript" src="js/action.js"></script>
		<script type="text/javascript" src="js/jquery-1.3.1.js"></script>
		<script type="text/javascript" src="js/jquerywin.js"></script>
		<script language="javascript" type="text/javascript"
			src="My97DatePicker/WdatePicker.js"></script>
	</head>

	<body>
		<form action="syslog_query" method="post" name="frm_query">
			<div id="win">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td height="30" background="images/tab_05.gif">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="12" height="30">
										<img src="images/tab_03.gif" width="12" height="30" />
									</td>
									<td>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td width="46%" valign="middle">
													<table width="100%" border="0" cellspacing="0"
														cellpadding="0">
														<tr>
															<td width="5%">
																<div align="center">
																	<img src="images/tb.gif" width="16" height="16" />
																</div>
															</td>
															<td width="95%" class="STYLE1">
																<span class="STYLE3">系统日志查询</span>
															</td>
														</tr>
													</table>
												</td>
												<td width="54%">
													<table border="0" align="right" cellpadding="0"
														cellspacing="0">
														<tr>
															<td width="100">
																<table width="90%" border="0" cellpadding="0"
																	cellspacing="0">
																	<tr>
																		<td class="STYLE1">
																			<div align="center">
																				<a href="" onclick="hide();return false;"><img id="close" alt="关闭"
																						src="images/close.png" border="0" /> </a>
																			</div>
																		</td>
																	</tr>
																</table>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
									<td width="16">
										<img src="images/tab_07.gif" width="16" height="30" />
									</td>
								</tr>
							</table>
						</td>
					</tr>

					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="8" background="images/tab_12.gif">
										&nbsp;
									</td>
									<td>
										<table width="100%" border="0" cellpadding="0" cellspacing="1"
											bgcolor="b5d6e6" onmouseover="changeto()"
											onmouseout="changeback()">
											<tr>
												<td class="mainIframeTableTd">
													用户
												</td>
												<td class="mainIframeTableTd">
													<input type="text" name="syslogUserName" />
												</td>
											</tr>
											<tr>
												<td class="mainIframeTableTd">
													对象
												</td>
												<td class="mainIframeTableTd">
													<input type="text" name="syslogModuleName" />
												</td>
											</tr>
											<tr>
												<td class="mainIframeTableTd">
													操作
												</td>
												<td class="mainIframeTableTd">
													<input type="text" name="syslogAction" />
												</td>
											</tr>
											<tr>
												<td class="mainIframeTableTd">
													类型
												</td>
												<td class="mainIframeTableTd">
													<input type="text" name="syslogType" />
												</td>
											</tr>
											<tr>
												<td class="mainIframeTableTd">
													访问IP
												</td>
												<td class="mainIframeTableTd">
													<input type="text" name="syslogAccessIp" />
												</td>
											</tr>
											<tr>
												<td class="mainIframeTableTd">
													开始时间
												</td>
												<td class="mainIframeTableTd">
													<input name="syslogFirstTime" class="Wdate" type="text"
														onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true,skin:'whyGreen'})">
												</td>
											</tr>
											<tr>
												<td class="mainIframeTableTd">
													结束时间
												</td>
												<td class="mainIframeTableTd">
													<input name="syslogNextTime" class="Wdate" type="text"
														onClick="WdatePicker({startDate:'%y-%M-01 00:00:00',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUseStartDate:true,skin:'whyGreen'})">
												</td>
											</tr>
											<tr>
												<td class="mainIframeTableTd" colspan="2"
													style="padding-top: 3px">
													<input type="image"
														onclick="javascript:document.forms['frm_query'].submit();"
														src="images/btnSubmit.gif" />
													<a><img
															onclick="javascript:document.forms['frm_query'].reset();"
															src="images/btnReset.gif" /> </a>
												</td>
											</tr>
										</table>
									</td>
									<td width="8" background="images/tab_15.gif">
										&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td height="35" background="images/tab_19.gif">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="12" height="35">
										<img src="images/tab_18.gif" width="12" height="35" />
									</td>
									<td>
										<table width="100%" border="0" cellspacing="0" cellpadding="0">
											<tr>
												<td>
													<table border="0" align="right" cellpadding="0"
														cellspacing="0">
														<tr>
															<td width="40">
																<div align="center"></div>
															</td>
														</tr>
													</table>
												</td>
											</tr>
										</table>
									</td>
									<td width="16">
										<img src="images/tab_20.gif" width="16" height="35" />
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>
			</div>
		</form>
		<form action="syslog_query" method="post" name="frm">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="30" background="images/tab_05.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="12" height="30">
									<img src="images/tab_03.gif" width="12" height="30" />
								</td>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td width="46%" valign="middle">
												<table width="100%" border="0" cellspacing="0"
													cellpadding="0">
													<tr>
														<td width="5%">
															<div align="center">
																<img src="images/tb.gif" width="16" height="16" />
															</div>
														</td>
														<td width="95%" class="STYLE1">
															<span class="STYLE3">你当前的位置</span>：系统管理-系统日志
														</td>
													</tr>
												</table>
											</td>
											<td width="54%">
												<table border="0" align="right" cellpadding="0"
													cellspacing="0">
													<tr>
														<td width="60">
															<table width="87%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<a onclick="showwin()"><img
																					src="images/search.gif" width="14" height="14"
																					border="0" /> </a>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			查询
																		</div>
																	</td>
																</tr>
															</table>
														</td>
														<td width="60">
															<table width="87%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="syslog"><img
																					src="images/goback.gif" width="14" height="14"
																					border="0" /> </a>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			返回
																		</div>
																	</td>
																</tr>
															</table>
														</td>
														<td width="60">
															<table width="90%" border="0" cellpadding="0"
																cellspacing="0">
																<tr>
																	<td class="STYLE1">
																		<div align="center">
																			<a href="javaScript:poiExport()"><img src="images/export.gif"
																					width="14" height="14" border="0"/></a>
																		</div>
																	</td>
																	<td class="STYLE1">
																		<div align="center">
																			导出
																		</div>
																	</td>
																</tr>
															</table>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td width="16">
									<img src="images/tab_07.gif" width="16" height="30" />
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr>
					<td>
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="8" background="images/tab_12.gif">
									&nbsp;
								</td>
								<td>
									<table width="100%" border="0" cellpadding="0" cellspacing="1"
										bgcolor="b5d6e6" onmouseover="changeto()"
										onmouseout="changeback()">
										<tr>
											<td width="3%" class="mainIframeTableTh">
												<input type="checkbox" name="chkboxParent" value="checkbox"
													onclick="checkAll(this)" />
											</td>
											<td width="3%" class="mainIframeTableTh">
												序号
											</td>
											<td width="12%" class="mainIframeTableTh">
												日期
											</td>
											<td width="10%" class="mainIframeTableTh">
												用户
											</td>
											<td width="12%" class="mainIframeTableTh">
												模块
											</td>
											<td width="10%" class="mainIframeTableTh">
												操作
											</td>
											<td width="10%" class="mainIframeTableTh">
												类型
											</td>
											<td width="13%" class="mainIframeTableTh">
												访问者IP
											</td>
										</tr>
										<s:iterator value="syslogs">
											<tr>
												<td class="mainIframeTableTd">
													<input type="checkbox" name="chkBoxChildren"
														value="${userId}" onclick="cancel(this,'chkboxParent')" />
												</td>
												<td class="mainIframeTableTd">
													${logId}
												</td>
												<td class="mainIframeTableTd">
													${date}
												</td>
												<td class="mainIframeTableTd">
													${user.userName}
												</td>
												<td class="mainIframeTableTd">
													${module.moduleName}
												</td>
												<td class="mainIframeTableTd">
													${action}
												</td>
												<td class="mainIframeTableTd">
													${type}
												</td>
												<td class="mainIframeTableTd">
													${accessIp}
												</td>
											</tr>
										</s:iterator>
									</table>
									<table width="100%" height="12px"><tr><td ></td></tr></table>
								</td>
								<td width="8" background="images/tab_15.gif">
									&nbsp;
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td height="35" background="images/tab_19.gif">
						<table width="100%" border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td width="12" height="35">
									<img src="images/tab_18.gif" width="12" height="35" />
								</td>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td class="STYLE4">
												&nbsp;&nbsp;共有${page.totalSize}条记录，每页${page.pageSize}条，当前第${page.currentPage}/${page.totalPage}页
											</td>
											<td>
												<table border="0" align="right" cellpadding="0"
													cellspacing="0">
													<tr>
														<td width="40">
															<input type="hidden" name="hidSyslogUserName"
																value='${syslogUserName}' />
															<input type="hidden" name="hidSyslogModuleName"
																value='${syslogModuleName}' />
															<input type="hidden" name="hidSyslogAction"
																value='${syslogAction}' />
															<input type="hidden" name="hidSyslogType"
																value='${syslogType}' />
															<input type="hidden" name="hidSyslogAccessIp"
																value='${syslogAccessIp}' />
															<input type="hidden" name="hidSyslogFirstTime"
																value='${syslogFirstTime}' />
															<input type="hidden" name="hidSyslogNextTime"
																value='${syslogNextTime}' />
															</td>
															<s:if test="page.hasFirst">
																<td width="40">
																	<a href="javaScript:submit(1)"><img
																			src="images/first.gif" border=0> </a>&nbsp;
																</td>
															</s:if>
															<s:else>
																<td width="40">
																	<img src="images/first.gif" border=0>
																	&nbsp;
																</td>
															</s:else>
															<s:if test="page.hasPrevious">
																<td width="40">
																	<a href="javaScript:submit(${page.currentPage-1})"><img
																			src="images/back.gif" border=0> </a>&nbsp;
																</td>
															</s:if>
															<s:else>
																<td width="40">
																	<img src="images/back.gif" border=0>
																	&nbsp;
																</td>
															</s:else>
															<s:if test="page.hasNext">
																<td width="40">
																	<a href="javaScript:submit(${page.currentPage+1})"><img
																			src="images/next.gif" border=0> </a>&nbsp;
																</td>
															</s:if>
															<s:else>
																<td width="40">
																	<img src="images/next.gif" border=0>
																	&nbsp;
																</td>
															</s:else>
															<s:if test="page.hasLast">
																<td width="40">
																	<a href="javaScript:submit(${page.totalPage})"><img
																			src="images/last.gif" border=0> </a>&nbsp;
																</td>
															</s:if>
															<s:else>
																<td width="40">
																	<img src="images/last.gif" border=0>
																	&nbsp;
																</td>
															</s:else>
															
														<td width="38" class="STYLE4"><div align="center">转到第</div></td>
														<td class="STYLE4">
														<div align="center">
															<input name="currentPage" type="text" size="3" style="width: 18px; height: 18px; line-height: 18px; border: 1px solid #999999; text-align: center;" />
														</div>
														</td>
														<td width="10" class="STYLE4">
															页
														</td>
														<td width="40">
															<div align="center">
																<a><img
																		onclick="javascript:document.forms['frm'].submit();"
																		src="images/go.gif" width="37" height="15" /> </a>
															</div>
														</td>
													</tr>
												</table>
											</td>
										</tr>
									</table>
								</td>
								<td width="16">
									<img src="images/tab_20.gif" width="16" height="35" />
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>