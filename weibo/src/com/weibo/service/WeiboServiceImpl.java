package com.weibo.service;

import java.util.List;

import com.weibo.dao.CommentDAO;
import com.weibo.dao.WeiboDAO1;

import com.weibo.entity.Weibo;

public class WeiboServiceImpl implements WeiboService {
    public void setWeiboDao(WeiboDAO1 weiboDao) {
		this.weiboDao = weiboDao;
	}
	WeiboDAO1 weiboDao;
    CommentDAO cdao;
	public CommentDAO getCdao() {
		return cdao;
	}
	public void setCdao(CommentDAO cdao) {
		this.cdao = cdao;
	}
	public WeiboDAO1 getWeiboDao() {
		return weiboDao;
	}
	@Override
	public List<Weibo> SearchWeibo(String keyword) {
		// TODO Auto-generated method stub
		return weiboDao.search(keyword);
	}
	@Override
	public Weibo findbyid(int id) {
		// TODO Auto-generated method stub
		return weiboDao.find(id);
	}
	public void deleteWeibo(Integer WID){
		cdao.delete(WID);
		weiboDao.delete(WID);
	}
}
