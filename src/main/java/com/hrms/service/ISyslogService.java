package com.hrms.service;

import java.util.List;

import com.hrms.model.Syslog;


public interface ISyslogService extends IGenericService<Syslog,Integer> {
	public List<Syslog> query(String userName,String type,String moduleName,String firstTime,String nextTime,String action,String accessIp,int currentPage,int pageSize);
}
