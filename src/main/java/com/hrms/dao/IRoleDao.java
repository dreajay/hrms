package com.hrms.dao;

import java.util.List;

import com.hrms.model.Role;
import com.hrms.model.User;

public interface IRoleDao extends IGenericDao<Role, Integer> {
	public List<User> findUsers(Integer roleId);
	
}
