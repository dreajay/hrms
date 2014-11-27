package com.hrms.dao.impl;

import org.springframework.stereotype.Repository;

import com.hrms.dao.INewsDao;
import com.hrms.model.News;
@Repository("newsDao")
public class NewsDaoImpl extends GenericDaoImpl<News, Integer> implements
		INewsDao {


}
