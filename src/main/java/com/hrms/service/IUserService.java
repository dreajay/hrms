package com.hrms.service;

import com.hrms.model.User;

public interface IUserService extends IGenericService<User,Integer> {

	User findByName(String userName);
	User findByTrueName(String userTrueName);
}
