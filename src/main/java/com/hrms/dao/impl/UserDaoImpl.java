package com.hrms.dao.impl;



import java.util.List;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IUserDao;
import com.hrms.model.Role;
import com.hrms.model.User;

@Repository("userDao")
public class UserDaoImpl extends GenericDaoImpl<User, Integer> implements
		IUserDao {

	@SuppressWarnings("unchecked")
	public User findByName(String userName) {
		List<User> list = this.getHibernateTemplate().find("from " + this.getPersistentClass().getName() + " where userName = ?",userName);
		return list != null && list.size() >= 1 ? list.get(0) : null;
	}

	@SuppressWarnings("unchecked")
	public List<Role> findRoles(Integer userId) {
		return getHibernateTemplate().find("select u.roles from User u where u.userId=?",userId);
	}

	public void getType() {
		System.out.println(getHibernateTemplate()
				.find("select userId from User where userId=?",13).get(0));
	}

	@SuppressWarnings("unchecked")
	public User findByTrueName(String userTrueName) {
		List<User> list = this.getHibernateTemplate().find("from " + this.getPersistentClass().getName() + " where userTrueName = ?",userTrueName);
		return list != null && list.size() >= 1 ? list.get(0) : null;
	}
}
