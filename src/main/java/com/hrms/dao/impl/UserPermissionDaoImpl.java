package com.hrms.dao.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IModuleDao;
import com.hrms.dao.IRolePermissionDao;
import com.hrms.dao.IUserDao;
import com.hrms.dao.IUserPermissionDao;
import com.hrms.model.Role;
import com.hrms.model.User;
import com.hrms.model.UserPermission;
@Repository("userPermissionDao")
public class UserPermissionDaoImpl extends GenericDaoImpl<UserPermission, Integer> implements
		IUserPermissionDao {
	private IModuleDao moduleDao;
	private IUserDao userDao;
	private IRolePermissionDao rolePermissionDao;

	
	public boolean checkPermission(String userId,String moduleId,String actionId) {
		if (userId!=null && userId.trim()!="" && moduleId!=null && moduleId.trim()!="" && actionId!=null && actionId.trim()!="") {
			Integer checked = checked(Integer.valueOf(userId),Integer.valueOf(moduleId),Integer.valueOf(actionId));
			if (checked>0) {
				return true;
			}else if(checked<0) {
				return false;
			}else if(checked== null || checked == 0) {
				User user = userDao.findById(Integer.valueOf(userId));
				Set<Role> roles = user.getRoles();
				Iterator<Role> iterator = roles.iterator();
				while(iterator.hasNext()) {
					if(rolePermissionDao.checked(iterator.next().getRoleId(), Integer.valueOf(moduleId), Integer.valueOf(actionId))>0) {
						return true;
					}else {
						return false;
					}
				}
			}
		}
		return false;
	}

	@SuppressWarnings("unchecked")
	public boolean saveOrUpdate(Integer userId,Integer moduleId,String actionIds,String permission) {
		if (userId!=null && userId>0 && moduleId!=null && moduleId>0) {
			Integer[] id = {userId,moduleId};
			UserPermission userPermission;
			List<UserPermission> userPermissions = getHibernateTemplate().find("from UserPermission where userId=? and moduleId=?",id);
			if (userPermissions!=null && userPermissions.size()>0) {
				userPermission = userPermissions.get(0);
				
			}else {
				userPermission = new UserPermission();
				userPermission.setUser(userDao.findById(userId));
				userPermission.setModule(moduleDao.findById(moduleId));
			}
			userPermission.setActionIds(actionIds);
			userPermission.setPermission(permission);
			return this.saveOrUpdate(userPermission);
		}
		return false;
	}
	
	@SuppressWarnings("unchecked")
	public Integer checked(Integer userId,Integer moduleId,Integer actionId) {
		if (userId!=null && userId>0 && moduleId!=null && moduleId>0 && actionId!=null&&actionId>0) {
			Integer[] id = {userId,moduleId};
			List<UserPermission> userPermissions = getHibernateTemplate().find("from UserPermission where userId=? and moduleId=?",id);
			if (userPermissions!=null && userPermissions.size()>0) {
				UserPermission userPermission = userPermissions.get(0);
				String[] actionIdString = userPermission.getActionIds().split(",");
				String[] permissionString = userPermission.getPermission().split(",");
					for (int i = 0; i < actionIdString.length; i++) {
						if (actionIdString[i].equals(actionId.toString())&& permissionString[i]!=null) {
							return Integer.valueOf(permissionString[i]);
						}
					}
			}
		}
		return 0;
	}
	public IModuleDao getModuleDao() {
		return moduleDao;
	}
	@Resource
	public void setModuleDao(IModuleDao moduleDao) {
		this.moduleDao = moduleDao;
	}
	public IUserDao getUserDao() {
		return userDao;
	}
	@Resource
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	public IRolePermissionDao getRolePermissionDao() {
		return rolePermissionDao;
	}
	@Resource
	public void setRolePermissionDao(IRolePermissionDao rolePermissionDao) {
		this.rolePermissionDao = rolePermissionDao;
	}
}
