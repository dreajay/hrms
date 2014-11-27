package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.IEmployeeRedeployDao;
import com.hrms.model.EmployeeRedeploy;
import com.hrms.service.IEmployeeRedeployService;

@Service("employeeRedeployService")
public class EmployeeRedeployServiceImpl extends GenericServiceImpl<EmployeeRedeploy, Integer> implements IEmployeeRedeployService {
	
	private IEmployeeRedeployDao employeeRedeployDao;

	public IEmployeeRedeployDao getEmployeeRedeployDao() {
		return employeeRedeployDao;
	}
	
	@Resource
	public void setEmployeeRedeployDao(IEmployeeRedeployDao employeeRedeployDao) {
		this.employeeRedeployDao = employeeRedeployDao;
	}
	
}
