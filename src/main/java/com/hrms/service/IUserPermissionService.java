package com.hrms.service;

import com.hrms.model.UserPermission;


public interface IUserPermissionService extends IGenericService<UserPermission,Integer> {
	public boolean saveOrUpdate(Integer userId,Integer moduleId,String actionIds,String permission);
	public boolean checked(Integer userId,Integer moduleId,Integer actionId);
	public boolean checkPermission(String userId,String moduleId,String actionId);
}
