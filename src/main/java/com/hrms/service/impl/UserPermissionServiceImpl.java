package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.IUserPermissionDao;
import com.hrms.model.UserPermission;
import com.hrms.service.IUserPermissionService;

@Service("userPermissionService")
public class UserPermissionServiceImpl extends GenericServiceImpl<UserPermission, Integer> implements IUserPermissionService {
	private IUserPermissionDao userPermissionDao;
	
	public boolean saveOrUpdate(Integer userId,Integer moduleId,String actionIds,String permission) {
		return userPermissionDao.saveOrUpdate(userId, moduleId, actionIds, permission);
	}
	public boolean checkPermission(String userId,String moduleId,String actionId) {
		return userPermissionDao.checkPermission(userId, moduleId, actionId);
	}
	public boolean checked(Integer userId,Integer moduleId,Integer actionId) {
		if (userPermissionDao.checked(userId, moduleId, actionId)>0) {
			return true;
		}
		return false;
	}
	public IUserPermissionDao getUserPermissionDao() {
		return userPermissionDao;
	}
	@Resource
	public void setUserPermissionDao(IUserPermissionDao userPermissionDao) {
		this.userPermissionDao = userPermissionDao;
	}
}
