package com.hrms.dao.impl;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IEmployeeRedeployDao;
import com.hrms.model.EmployeeRedeploy;
@Repository("employeeRedeployDao")
public class EmployeeRedeployDaoImpl extends GenericDaoImpl<EmployeeRedeploy, Integer>
		implements IEmployeeRedeployDao{

}
