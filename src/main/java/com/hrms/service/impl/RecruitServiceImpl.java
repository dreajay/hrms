package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.IRecruitDao;
import com.hrms.model.Recruit;
import com.hrms.service.IRecruitService;

@Service("recruitService")
public class RecruitServiceImpl extends GenericServiceImpl<Recruit, Integer> implements IRecruitService {
	
	private IRecruitDao recruitDao;

	public IRecruitDao getRecruitDao() {
		return recruitDao;
	}
	
	@Resource
	public void setRecruitDao(IRecruitDao recruitDao) {
		this.recruitDao = recruitDao;
	}
	
	

}
