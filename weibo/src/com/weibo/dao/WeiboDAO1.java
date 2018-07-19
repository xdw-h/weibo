package com.weibo.dao;

import java.util.List;

import com.weibo.entity.Weibo;

public interface WeiboDAO1 {
    

	public List<Weibo> search(String keyword);
	public Weibo find(int id);
	public void delete(Integer WID);
}
