package com.hrms.dao.impl;

import org.springframework.stereotype.Repository;

import com.hrms.dao.ILeaveDao;
import com.hrms.model.Leave;
@Repository("leaveDao")
public class LeaveDaoImpl extends GenericDaoImpl<Leave, Integer> implements
		ILeaveDao {
}
