package com.weibo.action;

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;
import com.weibo.entity.Comments;

import com.weibo.service.CommentService;
import com.weibo.util.Commentpage;
import com.weibo.util.json;
public class CommentAction extends ActionSupport{
	private Comments c;
	private int id;
	private List<Commentpage> list;
	private CommentService service;
	private json js;
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
		js = new json();
		js.setSuccess(true);
		js.setMsg("发布成功");
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
}
