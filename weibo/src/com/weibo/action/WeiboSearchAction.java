package com.weibo.action;

import java.util.List;


import com.weibo.entity.Weibo;
import com.weibo.service.WeiboService;

public class WeiboSearchAction {
	String keyword;


   public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
WeiboService weiboService;

public void setWeiboService(WeiboService weiboService) {
	this.weiboService = weiboService;
}
private List<Weibo> list2;

public List<Weibo> getList2() {
	return list2;
}

public void setList2(List<Weibo> list2) {
	this.list2 = list2;
}

public String execute() throws Exception{
	
	 list2 =weiboService.SearchWeibo(keyword);
	return "success";
	
	
}
}
