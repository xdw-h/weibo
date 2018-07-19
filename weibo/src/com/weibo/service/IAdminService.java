package com.weibo.service;

import com.weibo.entity.Usermsg;


public interface IAdminService {
	public boolean login(Usermsg u);
	public boolean queryName(String adminname);
	public void register(Usermsg u);
	public Usermsg queryOne(int id) ;
	public void updateAdmin(Usermsg u);
}
