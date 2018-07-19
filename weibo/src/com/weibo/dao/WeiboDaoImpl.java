package com.weibo.dao;

import java.util.List;


import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;





import com.weibo.entity.Weibo;

public class WeiboDaoImpl implements WeiboDAO1{
	 SessionFactory sessionFactory;

		public void setSessionFactory(SessionFactory sessionFactory) {
			this.sessionFactory = sessionFactory;
		}
	public List<Weibo> search(String keyword) {
		
		Session session=sessionFactory.openSession();
		Query query = session.createQuery("from Weibo w where w.content like ?");
		query.setParameter(0, "%"+keyword+"%");
		List<Weibo> list=query.list();
		session.close();
		return list;
	}
	@Override
	public Weibo find(int id) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Weibo w = (Weibo) session.get(Weibo.class, id);
		session.close();
		return w;
	}
	public void delete(Integer WID){
		Session session=sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		Weibo n=(Weibo)session.get(Weibo.class, WID);
		session.delete(n);
		tx.commit();
		session.close();
	}
}
