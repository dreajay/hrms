package com.hrms.dao.impl;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IJobSeekerDao;
import com.hrms.model.JobSeeker;
@Repository("jobSeekerDao")
public class JobSeekerDaoImpl extends GenericDaoImpl<JobSeeker, Integer> implements
		IJobSeekerDao {
	
}
