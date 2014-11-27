package com.hrms.dao;


import com.hrms.model.UserModule;

public interface IUserModuleDao extends IGenericDao<UserModule, Integer> {
	public String[] getUserModuleIdSum(Integer userId);
	public String getUserModuleTree(String[] userModuleIdSum);
	public String[] getUserModuleCount(Integer userId);
	public boolean userModuleTreeInXml(String fileName,Integer userId);
	public boolean addToUser(Integer userId,String moduleIdSum);
	public boolean removeFromUser(Integer userId, String moduleIdSum);
	public UserModule getUserModuleByUserId(Integer userId);
}
