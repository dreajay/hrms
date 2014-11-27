package com.hrms.dao.impl;

import org.springframework.stereotype.Repository;

import com.hrms.dao.IPostDao;
import com.hrms.model.Post;
@Repository("postDao")
public class PostDaoImpl extends GenericDaoImpl<Post, Integer> implements
		IPostDao {

}
