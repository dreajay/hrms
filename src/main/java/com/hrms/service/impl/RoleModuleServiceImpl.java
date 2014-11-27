package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.IRoleModuleDao;
import com.hrms.model.RoleModule;
import com.hrms.service.IRoleModuleService;

@Service("roleModuleService")
public class RoleModuleServiceImpl extends GenericServiceImpl<RoleModule, Integer> implements IRoleModuleService {
	private IRoleModuleDao roleModuleDao;
	
	public String[] getRoleModuleSum(Integer roleId){
		return roleModuleDao.getRoleModuleId(roleId);
	}
	public String getRoleModuleTree(Integer roleId) {
		return roleModuleDao.getRoleModuleTree(roleId);
	}
	public boolean roleModuleTreeInXml(String fileName,Integer roleId) {
		return roleModuleDao.roleModuleTreeInXml(fileName, roleId);
	}
	public boolean addToRole(Integer roleId,String moduleIdSum) {
		return roleModuleDao.addToRole(roleId, moduleIdSum);
	}
	public boolean removeFromRole(Integer roleId, String moduleIdSum) {
		return roleModuleDao.removeFromRole(roleId,moduleIdSum);
	}
	public IRoleModuleDao getRoleModuleDao() {
		return roleModuleDao;
	}
	@Resource
	public void setRoleModuleDao(IRoleModuleDao roleModuleDao) {
		this.roleModuleDao = roleModuleDao;
	}
}
