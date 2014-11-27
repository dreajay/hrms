package com.hrms.service.impl;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import javax.annotation.Resource;

import com.hrms.dao.IGenericDao;
import com.hrms.service.IGenericService;

public class GenericServiceImpl<T, PK extends Serializable> implements
		IGenericService<T, PK> {
	
	private IGenericDao<T, PK> genericDao;

	public IGenericDao<T, PK> getGenericDao() {
		return genericDao;
	}

	@Resource
	public void setGenericDao(IGenericDao<T, PK> genericDao) {
		this.genericDao = genericDao;
	}
	public List<T> findByHql(String hql) {
		return genericDao.findByHql(hql);
	}
	public List<T> findAll() {
		return genericDao.findAll();
	}

	public List<T> findAllByPage(String hql, int start, int number) {
		return genericDao.findAllByPage(hql, start, number);
	}
	public int getListSize(String hql) {
		return genericDao.getListSize(hql);
	}
	public List<T> getListByPage(String hql,int start) {
		return genericDao.getListByPage(hql, start);
	}
	public List<T> findAllByPage(String hql, int start, int number,Object[] values) {
		return genericDao.findAllByPage(hql, start, number, values);
	}
	public List<T> getListByPage(int currentPage, int pageSize) {
		return genericDao.getListByPage(currentPage, pageSize);
	}
	public List<T> getListByPageByDesc(int currentPage, int pageSize,String orderId) {
		return genericDao.getListByPageByDesc(currentPage, pageSize, orderId);
	}
	public int getSize() {
		return genericDao.getSize();
	}
	public T findById(PK id) {
		return genericDao.findById(id);
	}

	public boolean save(T entity) {
		return genericDao.save(entity);
	}
	public boolean saveOrUpdate(T entity) {
		return genericDao.saveOrUpdate(entity);
	}
	public boolean update(T entity) {
		return genericDao.update(entity);
	}
	public boolean delete(T entity) {
		return genericDao.delete(entity);
	}

	public boolean deleteById(PK id) {
		return genericDao.deleteById(id);
	}

	public boolean deleteAll(Collection<T> entities) {
		return false;
	}

}
