package com.hrms.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IEmployeeDao;
import com.hrms.model.Employee;
@Repository("employeeDao")
public class EmployeeDaoImpl extends GenericDaoImpl<Employee, Integer>
		implements IEmployeeDao {

	@SuppressWarnings("unchecked")
	public Employee findByName(String name) {
		List<Employee> list = this.getHibernateTemplate().find("from " + this.getPersistentClass().getName() + " where empName = ?",name);
		return list != null && list.size() >= 1 ? list.get(0) : null;
	}
	
}
