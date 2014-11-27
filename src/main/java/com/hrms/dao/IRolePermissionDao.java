package com.hrms.dao;

import com.hrms.model.RolePermission;

public interface IRolePermissionDao extends IGenericDao<RolePermission, Integer> {

	public boolean saveOrUpdate(Integer roleId,Integer moduleId,String actionIds,String permission);
	public Integer checked(Integer roleId,Integer moduleId,Integer actionId);
}
