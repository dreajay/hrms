package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.IEmployeeDao;
import com.hrms.model.Employee;
import com.hrms.service.IEmployeeService;

@Service("employeeService")
public class EmployeeServiceImpl extends GenericServiceImpl<Employee, Integer> implements IEmployeeService {
	
	private IEmployeeDao employeeDao;

	public IEmployeeDao getEmployeeDao() {
		return employeeDao;
	}
	@Resource
	public void setEmployeeDao(IEmployeeDao employeeDao) {
		this.employeeDao = employeeDao;
	}
	

	public Employee findByName(String name) {
		return employeeDao.findByName(name);
	}
}
