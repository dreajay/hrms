package com.hrms.service;


import com.hrms.model.UserModule;

public interface IUserModuleService extends IGenericService<UserModule,Integer> {
	public String[] getUserModuleCount(Integer userId);
	public String[] getUserModuleIdSum(Integer userId);
	public String getUserModuleTree(String[] userModuleIdSum);
	public boolean userModuleTreeInXml(String fileName,Integer userId);
	public boolean addToUser(Integer roleId,String moduleIdSum);
	public boolean removeFromUser(Integer userId, String moduleIdSum);
}
