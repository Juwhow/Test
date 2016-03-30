package com.test1.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.test1.dao.BaseDAO;

@Repository("baseDAO")
@Transactional
@SuppressWarnings("all")
public class BaseDAOImpl<T> implements BaseDAO<T> {

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	@Autowired
	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	private Session getCurrentSession() {
		// spring4和hibernate4整合不支持getCurrentSession
		return sessionFactory.openSession();
		//return sessionFactory.getCurrentSession();
	}

	public Serializable save(T o) {
		
		return this.getCurrentSession().save(o);
		
	}

	public void delete(T o) {
		
		Session session = this.getCurrentSession();
		Transaction tran =session.beginTransaction();
		session.delete(o);
		tran.commit();
	}

	public void update(T o) {
		Session session = this.getCurrentSession();
		Transaction tran =session.beginTransaction();
		session.update(o);
		tran.commit();
		
	}

	/*
	 * public void saveOrUpdate(T o) { this.getCurrentSession().saveOrUpdate(o);
	 * }
	 */
	// public List<T> find(String hql, String[] param) {
	// Query query = this.getCurrentSession().createQuery(hql);
	// query.setString(0, param);
	// return query.list();
	// }

	public List<T> find(String hql, Object[] param) {
		Query q = this.getCurrentSession().createQuery(hql);
		if (param != null && param.length > 0) {
			for (int i = 0; i < param.length; i++) {
				q.setParameter(i, param[i]);
			}
		}
		return q.list();
	}
	
	public List<T> find(String hql) {
		Query q = this.getCurrentSession().createQuery(hql);
		return q.list();
	}

	/*
	 * public List<T> find(String hql, List<Object> param) { Query q =
	 * this.getCurrentSession().createQuery(hql); if (param != null &&
	 * param.size() > 0) { for (int i = 0; i < param.size(); i++) {
	 * q.setParameter(i, param.get(i)); } } return q.list(); }
	 * 
	 * public List<T> find(String hql, Object[] param, PageBean pageBean) {
	 * Query q = this.getCurrentSession().createQuery(hql); if (param != null &&
	 * param.length > 0) { for (int i = 0; i < param.length; i++) {
	 * q.setParameter(i, param[i]); } } return
	 * q.setFirstResult(pageBean.getStart
	 * ()).setMaxResults(pageBean.getPageSize()).list(); }
	 * 
	 * public List<T> find(String hql, List<Object> param, PageBean pageBean) {
	 * Query q = this.getCurrentSession().createQuery(hql); if (param != null &&
	 * param.size() > 0) { for (int i = 0; i < param.size(); i++) {
	 * q.setParameter(i, param.get(i)); } } return
	 * q.setFirstResult(pageBean.getStart
	 * ()).setMaxResults(pageBean.getPageSize()).list(); }
	 */
	public T get(Class<T> c, Serializable id) {
		return (T) this.getCurrentSession().get(c, id);
	}

//	public T get(String hql, Object[] param) {
//		List<T> l = this.find(hql, param);
//		if (l != null && l.size() > 0) {
//			return l.get(0);
//		} else {
//			return null;
//		}
//	}

	/*
	 * public T get(String hql, List<Object> param) { List<T> l = this.find(hql,
	 * param); if (l != null && l.size() > 0) { return l.get(0); } else { return
	 * null; } }
	 * 
	 * public Long count(String hql) { return (Long)
	 * this.getCurrentSession().createQuery(hql).uniqueResult(); }
	 * 
	 * public Long count(String hql, Object[] param) { Query q =
	 * this.getCurrentSession().createQuery(hql); if (param != null &&
	 * param.length > 0) { for (int i = 0; i < param.length; i++) {
	 * q.setParameter(i, param[i]); } } return (Long) q.uniqueResult(); }
	 * 
	 * public Long count(String hql, List<Object> param) { Query q =
	 * this.getCurrentSession().createQuery(hql); if (param != null &&
	 * param.size() > 0) { for (int i = 0; i < param.size(); i++) {
	 * q.setParameter(i, param.get(i)); } } return (Long) q.uniqueResult(); }
	 * 
	 * public Integer executeHql(String hql) { return
	 * this.getCurrentSession().createQuery(hql).executeUpdate(); }
	 * 
	 * public Integer executeHql(String hql, Object[] param) { Query q =
	 * this.getCurrentSession().createQuery(hql); if (param != null &&
	 * param.length > 0) { for (int i = 0; i < param.length; i++) {
	 * q.setParameter(i, param[i]); } } return q.executeUpdate(); }
	 * 
	 * public Integer executeHql(String hql, List<Object> param) { Query q =
	 * this.getCurrentSession().createQuery(hql); if (param != null &&
	 * param.size() > 0) { for (int i = 0; i < param.size(); i++) {
	 * q.setParameter(i, param.get(i)); } } return q.executeUpdate(); }
	 * 
	 * public void merge(T o) { // TODO Auto-generated method stub
	 * this.getCurrentSession().merge(o); }
	 * 
	 * public Integer executeSql(String sql) { Query q =
	 * this.getCurrentSession().createSQLQuery(sql); return q.executeUpdate(); }
	 */
}
