<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  
    <base href="<%=basePath%>">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"  >
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="css/semantic.css" type="text/css" />
	<link rel="stylesheet" href="css/zyComment.css" type="text/css" />
	<script type="text/javascript" src="jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="zyComment.js"></script>
	<script>
		var msg = "fail";
		function dealtime(date){
			var tt = new Date(date);
			var nowtime = new Date();
			var y=date.substring(0,4);
			var m=date.substring(5,7);
			var d=date.substring(8,10);
			var hh=date.substring(11,13);
			var mm=date.substring(14,16);
			var daydiff = Math.ceil(nowtime.getTime()/(24*3600000))-Math.ceil(tt.getTime()/(24*3600000));
			if(tt.getFullYear()!=nowtime.getFullYear()){
				return [y,m,d].join("-");
			}
			
			else if(daydiff>1){
				return [m,d].join("-");
			}
			else if(daydiff==1 && nowtime.getTime()-tt.getTime()>300000){
				return "yesterday";
			}
			else if(nowtime.getTime()-tt.getTime()>300000){
				return [hh,mm].join(":");
			}
			else{
				return "just now";
			}
		}
		function commentlist(data,flag){
				var item = '';
				if(flag == 0){
					item += '<div id="commentItems" class="ui threaded comments" style="margin-bottom:20px;">';
                	item += '<div class="text" style="font-size:2rem;padding-bottom:10px;border-bottom: 1px solid #DFDFDF;"> 评论 </div>';
				}
                else{
                   item = '<div id="comments'+flag+'" class="comments">';
                }
                $.each(data,function(k,v){
                    var topStyle = "topStyle";
                    if(v.reply == null && k == 0)
                    {
                        topStyle = "";
                    }
					item += '<div id="comment'+v.comment.id+'" class="comment">';
					item += '	<a class="avatar">';
					item += '		<img src="images/foot.png">';
					item += '	</a>';
					item += '	<div class="content '+topStyle+'">';
					item += '		<a class="author"> '+v.comment.author+' </a>';
					item += '		<div class="metadata">';
					item += '			<span class="date"> '+dealtime(v.comment.postdate)+' </span>';
					item += '		</div>';
					item += '		<div class="text"> '+v.comment.content+' </div>';
					item += '		<div class="actions">';
					item += '			<a class="reply" href="javascript:void(0)" selfID="'+v.comment.id+'" >回复</a>';
					item += '		</div>';
                    item += '	</div>';
                    if(v.size > 0)
                    item += commentlist(v.child_comment,v.comment.id);
					item += '</div>';
                });
                item += '</div>';
                return item;
		}
		$(document).ready(function(){
			$.ajax({
				type:"post",
				url:"test.action",
				data:{"id":${w.id}},
				success:function(data){
// 					msg = data[0].child_comment.length;
					var html = commentlist(data,0);
// 					console.log(html);
					var c = html;
					$("#comment").append(html);
					createFormCommentHtml("#comment",${w.id} )
// 					msg=data[0].comment.postdate;
// 					msg=dealtime(msg);
// 					var s = 1;
				}
			})
		});
		
	</script>
  </head>
  
  <body>
<!--     This is my JSP page. <br> -->
<!--     <input type="button" value="测试" onclick="alert(msg)"> -->
	<div id = weibo>
		<p>${w.content}</p>
	</div>
    <div id = comment></div>
  </body>
</html>