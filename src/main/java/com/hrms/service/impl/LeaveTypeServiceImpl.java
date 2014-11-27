package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.ILeaveTypeDao;
import com.hrms.model.LeaveType;
import com.hrms.service.ILeaveTypeService;

@Service("leaveTypeService")
public class LeaveTypeServiceImpl extends GenericServiceImpl<LeaveType, Integer> implements ILeaveTypeService {
	
	private ILeaveTypeDao leaveTypeDao;

	public ILeaveTypeDao getLeaveTypeDao() {
		return leaveTypeDao;
	}

	@Resource
	public void setLeaveTypeDao(ILeaveTypeDao leaveTypeDao) {
		this.leaveTypeDao = leaveTypeDao;
	}

	
	
}
