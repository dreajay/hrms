package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.IRedeployTypeDao;
import com.hrms.model.RedeployType;
import com.hrms.service.IRedeployTypeService;

@Service("redeployTypeService")
public class RedeployTypeServiceImpl extends GenericServiceImpl<RedeployType, Integer> implements IRedeployTypeService {
	
	private IRedeployTypeDao redeployTypeDao;

	public IRedeployTypeDao getRedeployTypeDao() {
		return redeployTypeDao;
	}
	
	@Resource
	public void setRedeployTypeDao(IRedeployTypeDao redeployTypeDao) {
		this.redeployTypeDao = redeployTypeDao;
	}

	
}
