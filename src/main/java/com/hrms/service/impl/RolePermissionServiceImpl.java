package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.hrms.dao.IRolePermissionDao;
import com.hrms.model.RolePermission;
import com.hrms.service.IRolePermissionService;

@Service("rolePermissionService")
public class RolePermissionServiceImpl extends GenericServiceImpl<RolePermission, Integer> implements IRolePermissionService {
	
	private IRolePermissionDao rolePermissionDao;
	public boolean saveOrUpdate(Integer roleId,Integer moduleId,String actionIds,String permission) {
		return rolePermissionDao.saveOrUpdate(roleId, moduleId, actionIds, permission);
	}
	public boolean checked(Integer roleId,Integer moduleId,Integer actionId) {
		if (rolePermissionDao.checked(roleId, moduleId, actionId)>0) {
			return true;
		}
		return false;
	}
	public IRolePermissionDao getRolePermissionDao() {
		return rolePermissionDao;
	}
	@Resource
	public void setRolePermissionDao(IRolePermissionDao rolePermissionDao) {
		this.rolePermissionDao = rolePermissionDao;
	}
}
