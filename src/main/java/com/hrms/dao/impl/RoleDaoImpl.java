package com.hrms.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IRoleDao;
import com.hrms.model.Role;
import com.hrms.model.User;
@Repository("roleDao")
public class RoleDaoImpl extends GenericDaoImpl<Role, Integer> implements
		IRoleDao {

	@SuppressWarnings("unchecked")
	public List<User> findUsers(Integer roleId) {
		return getHibernateTemplate().find("select r.users from Role r where r.roleId=?",roleId);
	}
	
}
