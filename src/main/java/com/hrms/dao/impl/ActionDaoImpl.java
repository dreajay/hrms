package com.hrms.dao.impl;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IActionDao;
import com.hrms.model.Action;
@Repository("actionDao")
public class ActionDaoImpl extends GenericDaoImpl<Action, Integer> implements
		IActionDao {
	
}
