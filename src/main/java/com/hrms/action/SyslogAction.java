package com.hrms.action;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

import com.hrms.model.Module;
import com.hrms.model.Syslog;
import com.hrms.model.User;
import com.hrms.service.IModuleService;
import com.hrms.service.ISyslogService;
import com.hrms.service.IUserService;
import com.hrms.util.Page;
import com.hrms.util.PoiExport;

@Component("syslogAction")
@Scope("prototype")
public class SyslogAction extends BaseAction {
	private static final long serialVersionUID = 8679351388942070945L;
	private ISyslogService syslogService;
	private IUserService userService;
	private IModuleService moduleService;
	private Syslog syslog;
	private List<Syslog> syslogs;
	private Page page;
	private int currentPage = 1;
	private PoiExport poiExport;
	private String fileName;
	private InputStream excelStream;

	public void setExcelStream(InputStream excelStream) {
		this.excelStream = excelStream;
	}

	public InputStream getExcelStream() throws IOException {
		String userName = getRequest().getParameter("syslogUserName");
		String moduleName = getRequest().getParameter("syslogModuleName");
		String action = getRequest().getParameter("syslogAction");
		String type = getRequest().getParameter("syslogType");
		String accessIp = getRequest().getParameter("syslogAccessIp");
		String firstTime = getRequest().getParameter("syslogFirstTime");
		String nextTime = getRequest().getParameter("syslogNextTime");
		String hql = getHql(userName,moduleName,action,type,accessIp,firstTime,	nextTime);
		syslogs = syslogService.findByHql(hql.toString());
		String[] headTitle = { "序号","日期","用户","模块","操作","类型","访问IP" };
		List<String> listString = new ArrayList<String>();
		for (int i = 0; i < syslogs.size(); i++) {
			String str = "";
			String poiUserName = "";
			String poiModuleName = "";
			if (syslogs.get(i)!=null && !syslogs.get(i).equals("")) {
				User user = syslogs.get(i).getUser();
				if (user!=null) {
					poiUserName = user.getUserName();
				}
				Module module = syslogs.get(i).getModule();
				if (module!=null) {
					poiModuleName = module.getModuleName();
				}
				str = syslogs.get(i).getLogId() + "," + syslogs.get(i).getDate() + "," + poiUserName + ","
				+ poiModuleName +"," + syslogs.get(i).getAction() + ","+ syslogs.get(i).getType() + ","+ syslogs.get(i).getAccessIp();
			}
			listString.add(str);
		}
		excelStream = poiExport.exportExcel(fileName, headTitle, listString);
		return excelStream;
	}

	public String syslog_list() {
		int totalSzie = syslogService.getSize();
		this.page = new Page(currentPage, totalSzie);
		syslogs = syslogService.getListByPageByDesc(currentPage, page
				.getPageSize(), "date");
		return "success";
	}
	public String syslog_my() {
		Integer userId = (Integer) getSession().getAttribute("userId");
		String hql = "from Syslog s where s.user.userId="+userId;
		int totalSzie = syslogService.getListSize(hql);
		this.page = new Page(currentPage, totalSzie);
		syslogs = syslogService.findAllByPage(hql, currentPage, page.getPageSize());
		return "success";
	}
	public String syslog_query() {
		String userName = getRequest().getParameter("syslogUserName");
		String moduleName = getRequest().getParameter("syslogModuleName");
		String action = getRequest().getParameter("syslogAction");
		String type = getRequest().getParameter("syslogType");
		String accessIp = getRequest().getParameter("syslogAccessIp");
		String firstTime = getRequest().getParameter("syslogFirstTime");
		String nextTime = getRequest().getParameter("syslogNextTime");

		getRequest().setAttribute("syslogUserName", userName);
		getRequest().setAttribute("syslogModuleName", moduleName);
		getRequest().setAttribute("syslogAction", action);
		getRequest().setAttribute("syslogType", type);
		getRequest().setAttribute("syslogAccessIp", accessIp);
		getRequest().setAttribute("syslogFirstTime", firstTime);
		getRequest().setAttribute("syslogNextTime", nextTime);

		String hql = getHql(userName,moduleName,action,type,accessIp,firstTime,	nextTime);
		int totalSzie = syslogService.getListSize(hql);
		this.page = new Page(currentPage, totalSzie);
		syslogs = syslogService.findAllByPage(hql, currentPage, page.getPageSize());
		return "success";
	}
	
	public String getHql(String userName,String moduleName,String action,String type,String accessIp,String firstTime,
			String nextTime) {
		StringBuffer hql = new StringBuffer();
		hql.append("from Syslog s where 1=1 ");
		if (userName!=null && !userName.equals("")) {
		 hql.append("and s.user.userName like '%" + userName + "%' ");
		}
		if (moduleName!=null && !moduleName.equals("")) {
			 hql.append("and s.module.moduleName like '%" + moduleName + "%' ");
		}
		if (action != null && !action.equals("")) {
			hql.append("and s.action like '%" + action + "%' ");
		}
		if (type != null && !type.equals("")) {
			hql.append("and s.type like '%" + type + "%' ");
		}
		if (accessIp != null && !accessIp.equals("")) {
			hql.append("and s.accessIp like '%" + accessIp + "%' ");
		}
		if (firstTime != null && !firstTime.equals("")) {
			hql.append("and s.date >= '" + firstTime + "' ");
		}
		if (nextTime != null && !nextTime.equals("")) {
			hql.append("and s.date <= '" + nextTime + "' ");
		}
		return hql.toString();
	}
	
	public ISyslogService getSyslogService() {
		return syslogService;
	}

	@Resource
	public void setSyslogService(ISyslogService syslogService) {
		this.syslogService = syslogService;
	}

	public List<Syslog> getSyslogs() {
		return syslogs;
	}

	public void setSyslogs(List<Syslog> syslogs) {
		this.syslogs = syslogs;
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public IUserService getUserService() {
		return userService;
	}

	@Resource
	public void setUserService(IUserService userService) {
		this.userService = userService;
	}

	public IModuleService getModuleService() {
		return moduleService;
	}

	@Resource
	public void setModuleService(IModuleService moduleService) {
		this.moduleService = moduleService;
	}

	public Syslog getSyslog() {
		return syslog;
	}

	public void setSyslog(Syslog syslog) {
		this.syslog = syslog;
	}

	public PoiExport getPoiExport() {
		return poiExport;
	}

	@Resource
	public void setPoiExport(PoiExport poiExport) {
		this.poiExport = poiExport;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
}
