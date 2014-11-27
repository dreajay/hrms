package com.hrms.service;

import com.hrms.model.Employee;

public interface IEmployeeService extends IGenericService<Employee,Integer> {
	public Employee findByName(String name);
}
