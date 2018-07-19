package com.weibo.service;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import com.weibo.dao.CommentDAO;
import com.weibo.entity.Comments;
import com.weibo.util.Commentpage;

public class CommentServiceimp  implements CommentService {

	CommentDAO commentdao;
	List<Commentpage> list;
	public CommentDAO getCommentdao() {
		return commentdao;
	}
	public void setCommentdao(CommentDAO commentdao) {
		this.commentdao = commentdao;
	}
	public List<Commentpage> getList() {
		return list;
	}
	public void setList(List<Commentpage> list) {
		this.list = list;
	}
	public Commentpage findComment(int from,String type,Comments c,String Author){
		List<Comments> lis = commentdao.find(from, type);
		int sum = 0;
		Commentpage newitem = new Commentpage();
		newitem.setChild_comment(new ArrayList<Commentpage>());
		newitem.setSize(0);
		Iterator it = lis.iterator();
		while(it.hasNext()){
			Comments c2 = (Comments) it.next();
			String author = null;
			if(c != null)
				author = c.getAuthor();
			Commentpage child = this.findComment(c2.getId(),"comment",c2,author);
			newitem.getChild_comment().add(child);
			newitem.setSize(newitem.getSize()+child.getSize()+1);
		}
		if(type.equals("comment")){
			newitem.setComment(c);
			newitem.setReply(Author);
		}

		return newitem;
	}
	@Override
	public List<Commentpage> showComment(int from) {
		// TODO Auto-generated method stub
		list = new ArrayList<Commentpage>();
		Commentpage ls = this.findComment(from, "weibo", null,null);
		list.addAll(ls.getChild_comment());
//		List<Comments> lis = commentdao.find(from, "weibo");
//		Iterator it = lis.iterator();
//		while(it.hasNext()){
//			Comments c2 = (Comments) it.next();
//			Commentpage newitem = new Commentpage(lis.size(),c2,Integer.valueOf(from).toString());
//			list.add(newitem);
//		}
		return list;
	}

	@Override
	public void addComment(Comments c) {
		// TODO Auto-generated method stub
		Timestamp t = new Timestamp(System.currentTimeMillis());
		c.setPostdate(t);
		c.setHighlight(0);
		commentdao.add(c);
	}
	@Override
	public void deleteComment(int id) {
		// TODO Auto-generated method stub
		commentdao.delete(id);
	}

}