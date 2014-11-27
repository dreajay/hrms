package com.hrms.dao;

import com.hrms.model.Employee;


public interface IEmployeeDao extends IGenericDao<Employee, Integer> {

	public Employee findByName(String name);
}
