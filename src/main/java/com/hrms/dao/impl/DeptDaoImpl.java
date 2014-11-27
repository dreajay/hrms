package com.hrms.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IDeptDao;
import com.hrms.model.Dept;
@Repository("deptDao")
public class DeptDaoImpl extends GenericDaoImpl<Dept, Integer> implements
		IDeptDao {
	
	@SuppressWarnings("unchecked")
	public Dept findByDeptName(String deptName) {
		List<Dept> list = this.getHibernateTemplate().find("from Dept where deptName = ?",deptName);
		return list != null && list.size() >= 1 ? list.get(0) : null;
	}
}
