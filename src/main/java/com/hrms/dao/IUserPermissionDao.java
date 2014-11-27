package com.hrms.dao;

import com.hrms.model.UserPermission;

public interface IUserPermissionDao extends IGenericDao<UserPermission, Integer> {

	public boolean saveOrUpdate(Integer userId,Integer moduleId,String actionIds,String permission);
	public Integer checked(Integer userId,Integer moduleId,Integer actionId);
	public boolean checkPermission(String userId,String moduleId,String actionId);
}
