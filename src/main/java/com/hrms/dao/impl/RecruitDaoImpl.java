package com.hrms.dao.impl;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IRecruitDao;
import com.hrms.model.Recruit;

@Repository("recruitDao")
public class RecruitDaoImpl extends GenericDaoImpl<Recruit, Integer> implements
		IRecruitDao {

}
