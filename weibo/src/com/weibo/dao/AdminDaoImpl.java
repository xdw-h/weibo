package com.weibo.dao;



import java.util.Iterator;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.weibo.entity.Usermsg;


public class AdminDaoImpl implements IAdminDao{
	SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public Usermsg login(Usermsg u) {
		Session session=sessionFactory.openSession();
		Usermsg u1 = null;
		Query query=session.createQuery("from Usermsg u where u.username=?  and u.password=?");
		query.setParameter(0, u.getUsername());
		query.setParameter(1,u.getPassword());
		List list=query.list();
		Iterator it = list.iterator();
		if(it.hasNext()){
			u1 = (Usermsg)it.next();
		}
		session.close();
		return u1;
	}

	@Override
	public boolean queryName(String username) {
		boolean flag=false;
		Session session=sessionFactory.openSession();
		Query query=session.createQuery("from Usermsg u where u.username=?");
		query.setParameter(0, username);
		List list=query.list();
		session.close();
		if (list.size()>0)
			flag=true;
		return flag;
	}

	@Override
	public void register(Usermsg u) {
		// TODO Auto-generated method stub
		Session session=sessionFactory.openSession();
		Transaction tx=session.beginTransaction();
		session.save(u);
		tx.commit();
		session.close();
	}
	public Usermsg queryOne(int id) {
		Session session =sessionFactory.openSession();
		Usermsg u = (Usermsg) session.get(Usermsg.class, id);
		session.close();
		return u;
	}
	public void updateAdmin(Usermsg u) {
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.merge(u);
		tx.commit();
		session.close();
	}

}
