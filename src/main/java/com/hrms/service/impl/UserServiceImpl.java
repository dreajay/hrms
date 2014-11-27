package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.IUserDao;
import com.hrms.model.User;
import com.hrms.service.IUserService;

@Service("userService")
public class UserServiceImpl extends GenericServiceImpl<User, Integer> implements IUserService {
	private IUserDao userDao;
	public IUserDao getUserDao() {
		return userDao;
	}
	@Resource
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	public User findByName(String userName) {
		return userDao.findByName(userName);
	}
	public User findByTrueName(String userTrueName) {
		return userDao.findByTrueName(userTrueName);
	}

}
