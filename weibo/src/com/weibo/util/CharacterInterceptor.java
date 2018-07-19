package com.weibo.util;



import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;
import com.weibo.action.CommentAction;
import com.weibo.entity.Comments;

public class CharacterInterceptor extends AbstractInterceptor {

	@Override
	public String intercept(ActionInvocation arg0) throws Exception {
		// TODO Auto-generated method stub
		CommentAction na=(CommentAction)arg0.getAction();
		Comments c= na.getC();
		String content=c.getContent();
		if(content.contains("fuck")){
		content=content.replaceAll("fuck", "***");
		c.setContent(content);
	}
		return arg0.invoke();
	}

}
