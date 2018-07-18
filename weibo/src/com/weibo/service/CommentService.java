package com.weibo.service;

import java.util.List;

import com.weibo.entity.Comments;
import com.weibo.util.Commentpage;

public interface CommentService {
	List<Commentpage> showComment(int from);
	void addComment(Comments c);
}
