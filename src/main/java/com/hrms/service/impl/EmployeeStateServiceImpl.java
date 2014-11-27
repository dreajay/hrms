package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.IEmployeeStateDao;
import com.hrms.model.EmployeeState;
import com.hrms.service.IEmployeeStateService;

@Service("employeeStateService")
public class EmployeeStateServiceImpl extends GenericServiceImpl<EmployeeState, Integer> implements IEmployeeStateService {
	
	private IEmployeeStateDao employeeStateDao;

	public IEmployeeStateDao getEmployeeStateDao() {
		return employeeStateDao;
	}
	@Resource
	public void setEmployeeStateDao(IEmployeeStateDao employeeStateDao) {
		this.employeeStateDao = employeeStateDao;
	}


}
