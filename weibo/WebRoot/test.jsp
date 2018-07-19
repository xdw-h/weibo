<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jQuery实现用户评论留言代码 - 站长素材</title>

<link rel="stylesheet" href="css/semantic.css" type="text/css" />
<link rel="stylesheet" href="css/zyComment.css" type="text/css" />

<style type="text/css" media="print, screen">  
label {
	font-weight: bold;
}

a {
	font-family: Microsoft YaHei;
}

#articleComment {
	width: 600px;
	margin:0 auto;
}
</style> 

</head>
<body>
	<div id="articleComment"></div>
	
	<script type="text/javascript" src="jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="zyComment.js"></script>
	
	<script type="text/javascript">
	
		var agoComment = [
		                  {"id":1,"userName":"游客1","time":"2014-04-04","sortID":0,"content":"第一条评论"},
		                  {"id":2,"userName":"游客2","time":"2014-04-04","sortID":0,"content":"第二条评论"},
		                  {"id":3,"userName":"站长","time":"2014-04-04","sortID":1,"content":"第一条评论的回复"},
		                  {"id":4,"userName":"站长","time":"2014-04-04","sortID":2,"content":"第二条评论的回复"},
		                  {"id":5,"userName":"游客3","time":"2014-04-04","sortID":0,"content":"第三条评论"},
		                  {"id":6,"userName":"游客2","time":"2014-04-04","sortID":4,"content":"第二条评论的回复的回复"},
		                  ];
		$("#articleComment").zyComment({
			"width":"355",
			"height":"33",
			"agoComment":agoComment,
			"callback":function(comment){
				console.info("填写内容返回值：");
				console.info(comment);

				// 添加新的评论
				$("#articleComment").zyComment("setCommentAfter",{"id":123, "name":"name", "content":"content", "time":"2014-04-14"});

			}
		});					
	</script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
<p>适用浏览器：IE8、360、FireFox、Chrome、Safari、Opera、傲游、搜狗、世界之窗.</p>
<p>来源：<a href="http://sc.chinaz.com/" target="_blank">站长素材</a></p>
</div>
</body>
</html>