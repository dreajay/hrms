package com.hrms.dao.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IModuleDao;
import com.hrms.dao.IRoleDao;
import com.hrms.dao.IRolePermissionDao;
import com.hrms.model.RolePermission;
@Repository("rolePermissionDao")
public class RolePermissionDaoImpl extends GenericDaoImpl<RolePermission, Integer> implements
		IRolePermissionDao {
	private IRoleDao roleDao;
	private IModuleDao moduleDao;
	

	
	@SuppressWarnings("unchecked")
	public boolean saveOrUpdate(Integer roleId,Integer moduleId,String actionIds,String permission) {
		if (roleId!=null && roleId>0 && moduleId!=null && moduleId>0) {
			Integer[] id = {roleId,moduleId};
			RolePermission rolePermission;
			List<RolePermission> rolePermissions = getHibernateTemplate().find("from RolePermission where roleId=? and moduleId=?",id);
			if (rolePermissions!=null && rolePermissions.size()>0) {
				rolePermission = rolePermissions.get(0);
				
			}else {
				rolePermission = new RolePermission();
				rolePermission.setRole(roleDao.findById(roleId));
				rolePermission.setModule(moduleDao.findById(moduleId));
			}
			rolePermission.setActionIds(actionIds);
			rolePermission.setPermission(permission);
			return this.saveOrUpdate(rolePermission);
		}
		return false;
	}
	
	@SuppressWarnings("unchecked")
	public Integer checked(Integer roleId,Integer moduleId,Integer actionId) {
		if (roleId!=null && roleId>0 && moduleId!=null && moduleId>0 && actionId!=null&&actionId>0) {
			Integer[] id = {roleId,moduleId};
			List<RolePermission> rolePermissions = getHibernateTemplate().find("from RolePermission where roleId=? and moduleId=?",id);
			if (rolePermissions!=null && rolePermissions.size()>0) {
				RolePermission rolePermission = rolePermissions.get(0);
				String[] actionIdString = rolePermission.getActionIds().split(",");
				String[] permissionString = rolePermission.getPermission().split(",");
					for (int i = 0; i < actionIdString.length; i++) {
						if (actionIdString[i].equals(actionId.toString()) && permissionString[i]!=null) {
							return Integer.valueOf(permissionString[i]);
						}
					}
			}
		}
		return -1;
	}
	public IRoleDao getRoleDao() {
		return roleDao;
	}
	@Resource
	public void setRoleDao(IRoleDao roleDao) {
		this.roleDao = roleDao;
	}
	public IModuleDao getModuleDao() {
		return moduleDao;
	}
	@Resource
	public void setModuleDao(IModuleDao moduleDao) {
		this.moduleDao = moduleDao;
	}
}
