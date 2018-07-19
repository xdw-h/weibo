package com.weibo.service;

import java.util.List;

import com.weibo.entity.Weibo;



public interface WeiboService {
	public List<Weibo> SearchWeibo(String keyword);
	public Weibo findbyid(int id);
}
