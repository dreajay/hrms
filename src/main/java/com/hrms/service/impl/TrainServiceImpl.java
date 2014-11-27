package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.ITrainDao;
import com.hrms.model.Train;
import com.hrms.service.ITrainService;

@Service("trainService")
public class TrainServiceImpl extends GenericServiceImpl<Train, Integer> implements ITrainService {
	
	private ITrainDao trainDao;

	public ITrainDao getTrainDao() {
		return trainDao;
	}
	@Resource
	public void setTrainDao(ITrainDao trainDao) {
		this.trainDao = trainDao;
	}
}
