package com.hrms.dao.impl;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IRedeployTypeDao;
import com.hrms.model.RedeployType;

@Repository("redeployTypeDao")
public class RedeployTypeDaoImpl extends GenericDaoImpl<RedeployType, Integer>
		implements IRedeployTypeDao{

}
