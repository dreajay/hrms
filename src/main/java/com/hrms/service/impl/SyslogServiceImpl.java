package com.hrms.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.ISyslogDao;
import com.hrms.model.Syslog;
import com.hrms.service.IModuleService;
import com.hrms.service.ISyslogService;
import com.hrms.service.IUserService;

@Service("syslogService")
public class SyslogServiceImpl extends GenericServiceImpl<Syslog, Integer> implements ISyslogService {
	private ISyslogDao syslogDao;
	private IUserService userService;
	private IModuleService moduleService;
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
	public ISyslogDao getSyslogDao() {
		return syslogDao;
	}
	@Resource
	public void setSyslogDao(ISyslogDao syslogDao) {
		this.syslogDao = syslogDao;
	}
	public List<Syslog> querys(String userName,String type,String moduleName,String firstTime,
			String nextTime,String action,String accessIp,int currentPage,int pageSize) {
		StringBuffer hql = new StringBuffer();
		hql.append("select distinct s from Syslog s,User u,Module m where 1=1 ");
		if (userName!=null && !userName.equals("")) {
		 hql.append("and s in elements(u.syslogs) and u.userName = '" + userName + "' ");
			
		}
		if (moduleName!=null && !moduleName.equals("")) {
			 hql.append("and s in elements(m.syslogs) and m.moduleName like '" + moduleName + "' ");
				
		}	
		if (type != null && !type.equals("")) {
			hql.append("and s.type like '%" + type + "%' ");
			//hql.append("and s.type=?");
		}
		if (action != null && !action.equals("")) {
			hql.append("and s.action like '%" + action + "%' ");
		}
		if (accessIp != null && !accessIp.equals("")) {
			hql.append("and s.accessIp like '%" + accessIp + "%' ");
		}
		if (firstTime == null || firstTime.equals("")) {
			firstTime = "1987-10-18 00:00:00";
			
		}
		if (nextTime == null || nextTime.equals("")) {
			SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			nextTime = sdf.format(new Date());

			
		}
		//System.out.println(nextTime);
		//hql.append("and s.date between '" + firstTime + "' and '" + nextTime + "' ");
		//hql.append("order by s.date desc");
		//Object[] params = new Object[]{type};
		return syslogDao.findAllByPage(hql.toString(), currentPage, pageSize);
		//return syslogDao.findAllByPage(hql.toString(), currentPage, pageSize, params);
	}
	public List<Syslog> query(String userName,String type,String moduleName,String firstTime,
			String nextTime,String action,String accessIp,int currentPage,int pageSize) {
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
		System.out.println(hql);
		return syslogDao.findAllByPage(hql.toString(), currentPage, pageSize);
	}
}
