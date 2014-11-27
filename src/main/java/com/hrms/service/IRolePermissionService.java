package com.hrms.service;

import com.hrms.model.RolePermission;


public interface IRolePermissionService extends IGenericService<RolePermission,Integer> {
	public boolean saveOrUpdate(Integer roleId,Integer moduleId,String actionIds,String permission);
	public boolean checked(Integer roleId,Integer moduleId,Integer actionId);
}
