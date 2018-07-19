package com.weibo.service;

import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.weibo.dao.IAdminDao;
import com.weibo.entity.Usermsg;



public class AdminServiceImpl implements IAdminService{

	IAdminDao AdminDao;
	
	public IAdminDao getAdminDao() {
		return AdminDao;
	}

	public void setAdminDao(IAdminDao adminDao) {
		AdminDao = adminDao;
	}

	@Override
	public boolean login(Usermsg u) {
		// TODO Auto-generated method stub
		Usermsg u1 = AdminDao.login(u);
		if(u1 != null)
		{
			Map session = ActionContext.getContext().getSession();
			session.put("login", u1);
			return true;
		}
		return false;
	}

	@Override
	public boolean queryName(String adminname) {
		// TODO Auto-generated method stub
		return AdminDao.queryName(adminname);
	}

	@Override
	public void register(Usermsg u) {
		// TODO Auto-generated method stub
		AdminDao.register(u);
	}
	@Override
	public Usermsg queryOne(int id) {
		return AdminDao.queryOne(id);
	}
	@Override
	public void updateAdmin(Usermsg u){
		Map session = ActionContext.getContext().getSession();
		Usermsg u1 = (Usermsg) session.get("login");
		u1.setEmail(u.getEmail());
		u1.setUsername(u.getUsername());
		u1.setSex(u.getSex());
		AdminDao.updateAdmin(u1);
	}
}
