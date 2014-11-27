package com.hrms.dao.impl;

import org.springframework.stereotype.Repository;

import com.hrms.dao.ITrainDao;
import com.hrms.model.Train;
@Repository("trainDao")
public class TrainDaoImpl extends GenericDaoImpl<Train, Integer> implements
		ITrainDao {

}
