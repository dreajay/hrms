package com.hrms.dao.impl;

import org.springframework.stereotype.Repository;

import com.hrms.dao.ISyslogDao;
import com.hrms.model.Syslog;
@Repository("syslogDao")
public class SyslogDaoImpl extends GenericDaoImpl<Syslog, Integer> implements
		ISyslogDao {
	
}
