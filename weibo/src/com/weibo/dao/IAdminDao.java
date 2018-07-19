package com.weibo.dao;

import com.weibo.entity.Usermsg;



public interface IAdminDao {
	public Usermsg login(Usermsg u);
	public boolean queryName(String username);
	public void register(Usermsg u);
	public Usermsg queryOne(int id) ;
	public void updateAdmin(Usermsg u);
}
