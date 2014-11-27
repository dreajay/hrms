package com.hrms.dao.impl;

import org.springframework.stereotype.Repository;

import com.hrms.dao.ILeaveTypeDao;
import com.hrms.model.LeaveType;

@Repository("leaveTypeDao")
public class LeaveTypeDaoImpl extends GenericDaoImpl<LeaveType, Integer> implements
		ILeaveTypeDao {
}
