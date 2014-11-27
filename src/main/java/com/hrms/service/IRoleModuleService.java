package com.hrms.service;

import com.hrms.model.RoleModule;

public interface IRoleModuleService extends IGenericService<RoleModule,Integer> {
	public String[] getRoleModuleSum(Integer roleId);
	public String getRoleModuleTree(Integer roleId);
	public boolean roleModuleTreeInXml(String fileName,Integer roleId);
	public boolean addToRole(Integer roleId,String moduleIdSum);
	public boolean removeFromRole(Integer roleId, String moduleIdSum);
}
