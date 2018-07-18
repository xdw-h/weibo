package com.weibo.dao;

import java.util.List;

import com.weibo.entity.Comments;

public interface CommentDAO {
	List<Comments> find(int from,String type);
	void add(Comments c);
}
