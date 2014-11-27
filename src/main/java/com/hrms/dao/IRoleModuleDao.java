package com.hrms.dao;

import java.util.List;

import com.hrms.model.Role;
import com.hrms.model.RoleModule;

public interface IRoleModuleDao extends IGenericDao<RoleModule, Integer> {
	public String[] getRoleModuleIdCount(List<Role> roles);
	public String[] getRoleModuleId(Integer roleId);
	public String getOneRoleModuleId(Integer roleId);
	public String getRoleModuleTree(Integer roleId);
	public boolean roleModuleTreeInXml(String fileName,Integer roleId);
	public boolean addToRole(Integer roleId,String moduleIdSum);
	public boolean removeFromRole(Integer roleId, String moduleIdSum);
	
}
