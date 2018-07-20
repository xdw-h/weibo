package com.weibo.action;

import com.weibo.service.WeiboService;

public class WeiboDeleteAction {
	Integer WID;
	
	public Integer getWID() {
		return WID;
	}
	public void setWID(Integer wID) {
		WID = wID;
	}
	WeiboService weiboService;

	public void setWeiboService(WeiboService weiboService) {
		this.weiboService = weiboService;
	}
	public String execute() throws Exception{
		 weiboService.deleteWeibo(WID);
	return "success";
	
}
}
