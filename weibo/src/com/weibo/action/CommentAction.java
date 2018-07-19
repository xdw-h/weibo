package com.weibo.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.weibo.entity.Comments;
import com.weibo.entity.Weibo;

import com.weibo.service.CommentService;
import com.weibo.service.WeiboService;
import com.weibo.util.Commentpage;
import com.weibo.util.json;
public class CommentAction extends ActionSupport{
	private Comments c;
	private int id;
	private List<Commentpage> list;
	private CommentService service;
	private WeiboService wservice;
	private json js;
	private Weibo w;
	
	public WeiboService getWservice() {
		return wservice;
	}

	public void setWservice(WeiboService wservice) {
		this.wservice = wservice;
	}

	public Comments getC() {
		return c;
	}

	public void setC(Comments c) {
		this.c = c;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<Commentpage> getList() {
		return list;
	}

	public void setList(List<Commentpage> list) {
		this.list = list;
	}

	public CommentService getService() {
		return service;
	}

	public void setService(CommentService service) {
		this.service = service;
	}
	public Weibo getW() {
		return w;
	}

	public void setW(Weibo w) {
		this.w = w;
	}
	public String test(){
//		list = null;
		list = service.showComment(id);
		return SUCCESS;
	}
	public String testInterceptor(){
		service.addComment(c);
		System.out.println(c.getWeiboid());
		js = new json();
		js.setSuccess(true);
		js.setMsg("提交成功");
		return SUCCESS;
	}
	public json getJs() {
		return js;
	}

	public void setJs(json js) {
		this.js = js;
	}

	public String test3(){
		service.deleteComment(id);
		return SUCCESS;
	}
	public String turncomment(){
		w = wservice.findbyid(id);
		return SUCCESS;
	}
}