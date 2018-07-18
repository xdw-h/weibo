package com.weibo.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.weibo.entity.Comments;

import com.weibo.service.CommentService;
import com.weibo.util.Commentpage;
public class CommentAction extends ActionSupport{
	Comments c;
	int id;
	List<Commentpage> list;
	CommentService service;
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
	public String test(){
//		list = null;
		list = service.showComment(id);
		return SUCCESS;
	}
	public String testInterceptor(){
		service.addComment(c);
		return SUCCESS;
	}
}
