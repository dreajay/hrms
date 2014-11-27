package com.hrms.service;

import com.hrms.model.Dept;

public interface IDeptService extends IGenericService<Dept,Integer> {
	public Dept findByDeptName(String deptName);
}
