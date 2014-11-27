package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.IJobSeekerDao;
import com.hrms.model.JobSeeker;
import com.hrms.service.IJobSeekerService;

@Service("jobSeekerService")
public class JobSeekerServiceImpl extends GenericServiceImpl<JobSeeker, Integer> implements IJobSeekerService {
	
	private IJobSeekerDao jobSeekerDao;

	public IJobSeekerDao getJobSeekerDao() {
		return jobSeekerDao;
	}

	@Resource
	public void setJobSeekerDao(IJobSeekerDao jobSeekerDao) {
		this.jobSeekerDao = jobSeekerDao;
	}
	
}
