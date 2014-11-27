package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.IRoleDao;
import com.hrms.model.Role;
import com.hrms.service.IRoleService;

@Service("roleService")
public class RoleServiceImpl extends GenericServiceImpl<Role, Integer> implements IRoleService {
	
	private IRoleDao roleDao;

	public IRoleDao getRoleDao() {
		return roleDao;
	}
	@Resource
	public void setRoleDao(IRoleDao roleDao) {
		this.roleDao = roleDao;
	}
	
}
