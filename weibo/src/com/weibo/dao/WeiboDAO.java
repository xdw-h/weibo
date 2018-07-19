package com.weibo.dao;

import com.weibo.entity.Weibo;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.sql.Timestamp;
import java.util.Collections;
import java.util.List;

@Repository
@Transactional
public class WeiboDAO {

    @Autowired
    private SessionFactory sessionFactory;

    public boolean save(Weibo weibo) {
        weibo.setPosttime(new Timestamp(System.currentTimeMillis()));
        weibo.setUpdatetime(new Timestamp(System.currentTimeMillis()));
        sessionFactory.getCurrentSession().save(weibo);
        return true;
    }
    
    public List getAll(int offset) {
        try {
            return sessionFactory.getCurrentSession()
                    .createQuery("FROM Weibo ORDER BY updatetime DESC")
                    .setFirstResult(offset)
                    .setMaxResults(10)
                    .list();
        } catch (Exception e) {
            e.printStackTrace();
            return Collections.emptyList();
        }
    }
    
}
