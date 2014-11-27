package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.ITraintypeDao;
import com.hrms.model.Traintype;
import com.hrms.service.ITraintypeService;

@Service("traintypeService")
public class TraintypeServiceImpl extends GenericServiceImpl<Traintype, Integer> implements ITraintypeService {
	
	private ITraintypeDao traintypeDao;

	public ITraintypeDao getTraintypeDao() {
		return traintypeDao;
	}
	@Resource
	public void setTraintypeDao(ITraintypeDao traintypeDao) {
		this.traintypeDao = traintypeDao;
	}
}
