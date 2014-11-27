package com.hrms.dao.impl;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.util.Collection;
import java.util.List;
import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateTemplate;
import com.hrms.dao.IGenericDao;
import com.hrms.util.Page;

public class GenericDaoImpl<T, PK extends Serializable> implements
		IGenericDao<T, PK> {

	private Class<T> persistentClass;

	private HibernateTemplate hibernateTemplate;

	@SuppressWarnings("unchecked")
	public GenericDaoImpl() {
		if (this.persistentClass == null) {
			this.persistentClass = (Class<T>) ((ParameterizedType) getClass()
					.getGenericSuperclass()).getActualTypeArguments()[0];
		}
	}

	protected Class<T> getPersistentClass() {
		return this.persistentClass;
	}

	public void setPersistentClass(Class<T> persistentClass) {
		this.persistentClass = persistentClass;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	@Resource
	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	@SuppressWarnings("unchecked")
	public List<T> findByHql(String hql) {
		 return  getSession().createQuery(hql).list();
	 }
	@SuppressWarnings("unchecked")
	public List<T> findAll() {
		return getHibernateTemplate().find(
				"from " + getPersistentClass().getName());
	}

	@SuppressWarnings("unchecked")
	public List<T> findAllByDesc(PK id) {
		return getHibernateTemplate().find(
				"from " + getPersistentClass().getName() + " order by " + id
						+ "desc");
	}

	
	@SuppressWarnings("unchecked")
	public T findById(PK id) {
		T t = (T) getHibernateTemplate().get(getPersistentClass(), id);
		clear();
		flush();
		return t;
	}

	public boolean save(T entity) {
		getHibernateTemplate().save(entity);
		return true;
	}

	public boolean saveOrUpdate(T entity) {
		getHibernateTemplate().saveOrUpdate(
				getHibernateTemplate().merge(entity));
		return true;
	}

	@SuppressWarnings("unchecked")
	public boolean update(T entity) {
		T object = (T) getHibernateTemplate().merge(entity);
		getHibernateTemplate().update(object);
		return true;
	}

	public boolean deleteById(PK id) {
		getHibernateTemplate().delete(findById(id));
		return true;
	}

	public boolean delete(T entity) {
		getHibernateTemplate().delete(entity);
		return true;
	}

	public boolean deleteAll(Collection<T> entities) {
		return true;
	}
	@SuppressWarnings("unchecked")
	public List<T> findAllByPage(String hql, int start, int number) {
		Session session = this.getHibernateTemplate().getSessionFactory()
		.openSession();
		Query query = session.createQuery(hql);
		int startRow = (start) * number - number;
	    query.setFirstResult(startRow); 
	    query.setMaxResults(number); 
	    List<T> listPage = (List<T>) query.list();
		session.close();
		return listPage;

	}
	@SuppressWarnings("unchecked")
	public List<T> getListByPage(String hql,int start) {
		Session session = this.getHibernateTemplate().getSessionFactory()
		.openSession();
		Query query = session.createQuery(hql);
		List<T> list = (List<T>) query.list();
		int totalSize = list.size();
		Page page = new Page(start, totalSize);
		int number = page.getPageSize();
		int startRow = (start) * number - number;
	    query.setFirstResult(startRow); 
	    query.setMaxResults(number); 
	    List<T> listPage = (List<T>) query.list();
		session.close();
		return listPage;
	}
	@SuppressWarnings("unchecked")
	public int getListSize(String hql) {
		Session session = this.getHibernateTemplate().getSessionFactory()
		.openSession();
		Query query = session.createQuery(hql);
	    List<T> listPage = (List<T>) query.list();
		session.close();
		return listPage.size();
	}
	@SuppressWarnings("unchecked")
	public List<T> findAllByPage(String hql, int start, int number,Object[] values) {
		Query query = getSession().createQuery(hql); 
	    for (int i = 0; i < values.length; i++) { 
	      query.setParameter(i, values[i]); 
	    } 
	    query.setFirstResult(start); 
	    query.setMaxResults(number); 
	    List list = query.list();
	    return list; 
	    
	}
	@SuppressWarnings("unchecked")
	public List<T> getListByPage(int currentPage, int pageSize) {
		Session session = this.getHibernateTemplate().getSessionFactory()
				.openSession();
		Query query = session.createQuery("from  "
				+ this.getPersistentClass().getName());
		int startRow = (currentPage) * pageSize - pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<T> listPage = (List<T>) query.list();
		session.close();
		return listPage;
	}
	@SuppressWarnings("unchecked")
	public List<T> getListByPageByDesc(int currentPage, int pageSize,String orderId) {
		Session session = this.getHibernateTemplate().getSessionFactory()
				.openSession();
		Query query = session.createQuery("from  "
		+ getPersistentClass().getName() + " order by " + orderId
		+ " desc");
		int startRow = (currentPage) * pageSize - pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List<T> listPage = (List<T>) query.list();
		session.close();
		return listPage;
	}
	public int getSize() {
		return getHibernateTemplate().find(
				"from  " + this.getPersistentClass().getName()).size();
	}

	public Session getSession() {
		return getHibernateTemplate().getSessionFactory().getCurrentSession();
	}

	public void flush() {
		getSession().flush();
	}

	public void clear() {
		getSession().clear();
	}

	public void sessionClose() {
		getSession().close();
	}

}
