package com.hrms.service;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;


public interface IGenericService<T,PK extends Serializable> {
	  public T findById(PK id);
	  public List<T> findByHql(String hql);
	  public List<T> findAll();
	  public List<T> findAllByPage(String hql, int start, int number);
	  public int getListSize(String hql);
	  public List<T> getListByPage(String hql,int start);
	  public List<T> findAllByPage(String hql, int start, int number,Object[] values);
	  public List<T> getListByPage(int currentPage, int pageSize);
	  public List<T> getListByPageByDesc(int currentPage, int pageSize,String orderId);
	  public int getSize();
	  public boolean save(T entity); 
	  public boolean saveOrUpdate(T entity);
	  public boolean update(T entity);
	  public boolean delete(T entity); 
	  public boolean deleteById(PK id); 
	  public boolean deleteAll(Collection<T> entities);
}
