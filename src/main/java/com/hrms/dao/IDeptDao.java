package com.hrms.dao;

import com.hrms.model.Dept;

public interface IDeptDao extends IGenericDao<Dept, Integer> {
	public Dept findByDeptName(String deptName);
}
