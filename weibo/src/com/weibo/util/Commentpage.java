package com.weibo.util;

import java.util.List;

import com.weibo.entity.Comments;

public class Commentpage implements Comparable<Commentpage>{
	int size;
	Comments comment;
	String reply;
	List<Commentpage> child_comment;
	
	public Commentpage(int size, Comments comment, String reply,
			List<Commentpage> child_comment) {
		super();
		this.size = size;
		this.comment = comment;
		this.reply = reply;
		this.child_comment = child_comment;
	}
	public List<Commentpage> getChild_comment() {
		return child_comment;
	}
	public void setChild_comment(List<Commentpage> child_comment) {
		this.child_comment = child_comment;
	}
	public Commentpage() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public Comments getComment() {
		return comment;
	}
	public void setComment(Comments comment) {
		this.comment = comment;
	}
	@Override
	public int compareTo(Commentpage o) {
		// TODO Auto-generated method stub
		if(this.getComment().getId()>o.getComment().getId()){
			return 1;
		}
		else
		return -1;
	}
}