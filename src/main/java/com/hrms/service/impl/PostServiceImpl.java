package com.hrms.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.hrms.dao.IPostDao;
import com.hrms.model.Post;
import com.hrms.service.IPostService;

@Service("postService")
public class PostServiceImpl extends GenericServiceImpl<Post, Integer> implements IPostService {
	
	private IPostDao postDao;

	public IPostDao getPostDao() {
		return postDao;
	}
	@Resource
	public void setPostDao(IPostDao postDao) {
		this.postDao = postDao;
	}
	
	
}
