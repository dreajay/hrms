package com.hrms.dao.impl;

import org.springframework.stereotype.Repository;

import com.hrms.dao.ITraintypeDao;
import com.hrms.model.Traintype;
@Repository("traintypeDao")
public class TraintypeDaoImpl extends GenericDaoImpl<Traintype, Integer> implements
		ITraintypeDao {

}
