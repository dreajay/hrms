package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.ILeaveDao;
import com.hrms.model.Leave;
import com.hrms.service.ILeaveService;

@Service("leaveService")
public class LeaveServiceImpl extends GenericServiceImpl<Leave, Integer> implements ILeaveService {
	
	private ILeaveDao leaveDao;

	public ILeaveDao getLeaveDao() {
		return leaveDao;
	}

	@Resource
	public void setLeaveDao(ILeaveDao leaveDao) {
		this.leaveDao = leaveDao;
	}
	
	
}
