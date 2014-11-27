package com.hrms.service.impl;


import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.IUserModuleDao;
import com.hrms.model.UserModule;
import com.hrms.service.IUserModuleService;

@Service("userModuleService")
public class UserModuleServiceImpl extends GenericServiceImpl<UserModule, Integer> implements IUserModuleService {

	private IUserModuleDao userModuleDao;

	public IUserModuleDao getUserModuleDao() {
		return userModuleDao;
	}
	@Resource
	public void setUserModuleDao(IUserModuleDao userModuleDao) {
		this.userModuleDao = userModuleDao;
	}
	public boolean userModuleTreeInXml(String fileName,Integer userId) {
		return userModuleDao.userModuleTreeInXml(fileName, userId);
	}
	public boolean addToUser(Integer userId,String moduleIdSum) {
		return userModuleDao.addToUser(userId, moduleIdSum);
	}
	public boolean removeFromUser(Integer userId, String moduleIdSum) {
		return userModuleDao.removeFromUser(userId,moduleIdSum);
	}
	public String[] getUserModuleCount(Integer userId) {
		return userModuleDao.getUserModuleCount(userId);
	}
	public String[] getUserModuleIdSum(Integer userId) {
		return userModuleDao.getUserModuleIdSum(userId);
	}
	public String getUserModuleTree(String[] userModuleIdSum) {
		return userModuleDao.getUserModuleTree(userModuleIdSum);
	}
	
}
