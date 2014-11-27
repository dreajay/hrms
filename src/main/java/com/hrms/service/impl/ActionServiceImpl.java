package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import com.hrms.dao.IActionDao;
import com.hrms.model.Action;
import com.hrms.service.IActionService;

@Service("actionService")
public class ActionServiceImpl extends GenericServiceImpl<Action, Integer> implements IActionService {
	
	private IActionDao actionDao;

	public IActionDao getActionDao() {
		return actionDao;
	}
	@Resource
	public void setActionDao(IActionDao actionDao) {
		this.actionDao = actionDao;
	}
	
}
