package com.hrms.dao.impl;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IEmployeeStateDao;
import com.hrms.model.EmployeeState;

@Repository("employeeStateDao")
public class EmployeeStateDaoImpl extends GenericDaoImpl<EmployeeState, Integer>
		implements IEmployeeStateDao{

}
