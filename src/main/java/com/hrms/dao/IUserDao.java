package com.hrms.dao;

import java.util.List;

import com.hrms.model.Role;
import com.hrms.model.User;

public interface IUserDao extends IGenericDao<User, Integer> {
	public void getType();
	public User findByName(String userName);
	public User findByTrueName(String userTrueName);
	public List<Role> findRoles(Integer userId);
	
}
