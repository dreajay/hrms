package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.IDeptDao;
import com.hrms.model.Dept;
import com.hrms.service.IDeptService;

@Service("deptService")
public class DeptServiceImpl extends GenericServiceImpl<Dept, Integer> implements IDeptService {
	
	private IDeptDao deptDao;

	public IDeptDao getDeptDao() {
		return deptDao;
	}
	@Resource
	public void setDeptDao(IDeptDao deptDao) {
		this.deptDao = deptDao;
	}

	public Dept findByDeptName(String deptName) {
		return deptDao.findByDeptName(deptName);
	}
}
