<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.weibo.entity.Usermsg" %>
<%
	Usermsg user = (Usermsg)session.getAttribute("login");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String name="";
	Integer uid = 0;
	if(user!=null){
		name = user.getUsername();
		uid = user.getId();
	}
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
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="css/style4.css">

<script type="text/css"> 
	 .line-limit {
     overflow: hidden;
      text-overflow: ellipsis;
       white-space: nowrap; //文本不换行，这样超出一行的部分被截取，显示...
      }
	 </script>
	
	<script src="js/jquery-3.1.0.js"></script>
 <script type="text/javascript"> 
	 $(document).ready(function(){
	 	//定义全局变量
	var keyword = $("#keyword").val();
	var sel = document.getElementById("sel");
  $("#keyword").keyup(function(){
  if($(this).val()!=""){
	 $.post("search.action",{"keyword":$(this).val()},function(data){//获取响应回来的数据
				document.getElementById("sel").innerHTML="";
				var arr = JSON.parse(data);
				arr = arr.list2;


				for(var i=0;i<arr.length;i++){//循环每一个满足条件的记录
					//将当前循环满足条件的商品名称生成一个下拉的选项
					sel.options[i]=new Option(arr[i].content,i);
				}
				//判断是否有满足条件的商品
				if(arr.length>0){
					sel.style.display='block';
				}else{
					sel.style.display='none';
				}
				//当用户按下上下键时获取相应的值
				if(event.keyCode==40){
					sel.focus();
				}	
			},
			//发送数据类型
			"text"
	);
}
 });
 });
 function test2(){
	//输入回车，获取输入框内容焦点
	$("#sel").keypress(function(){
			$("#keyword").focus();
			$("#sel").css("display","none");
	});
	 //双击，获取输入框内容焦点
	 $("#sel").dblclick(function(){
		 $("#keyword").focus();
		 $("#sel").css("display","none");
	 });
	 //将选中的下拉列表中的内容添加到输入框中
	$("#keyword").val($("option:selected").html());
} 

  
  </script>
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
                	item += '<div class="text" style="font-size:2rem;padding-bottom:10px;border-bottom: 1px solid #DFDFDF;margin:30px"> 评论 </div>';
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
					item += '<div id="comment'+v.comment.id+'" class="comment" style="margin:30px">';
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
					getauthor('<%=name%>');
					$("#comment").append(html);
					createFormCommentHtml("#comment",${w.id});
// 					msg=data[0].comment.postdate;
// 					msg=dealtime(msg);
// 					var s = 1;
				}
			})
			$("#stime").html(dealtime("${w.posttime}"))
		});
		
	</script>
  </head>
  
  <body>
<nav class="navbar  navbar-fixed-top" role="navigation"
		style="background: #e0620d ;padding-top: 3px;height:50px;">
		<div class="container-fluid" style="background: #fff;">
			<div class="navbar-header ">
				<a class="navbar-brand " href="#">WEBLOG</a>
			</div>
				<form class="navbar-form navbar-left"  role="search" action="search2">
				<div class="form-group" >

					<input type="text" id="keyword" name="keyword" placeholder="#热门话题#" autocomplete="off">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<button  type="submit" style="height: 30px; width: 26px" class="glyphicon glyphicon-search btn_search" ></button><br>

					<select class="line-limit-length" multiple="multiple" id="sel" onchange="test2()" 
			style="width: 190px;display:none">
		</select>
				</div>

			</form>

			<div class="collapse navbar-collapse" id="my-navbar-collapse">

				<ul class="nav navbar-nav navbar-right">
					<li><a>欢迎回来！<span id="author_id"></span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> 设置 <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="<s:url action="logout"/>">注销</a></li>
							<li><a href="<s:url action="updateload.action?id=%{#session.login.id}"/>">修改个人信息</a></li>
						</ul></li>
				</ul>

			</div>


		</div>
		<hr style="margin: 0;padding: 0;color:#222;width: 100%">
	</nav>
<!--     This is my JSP page. <br> -->
<!--     <input type="button" value="测试" onclick="alert(msg)"> -->
		<div class="row item_msg" id = weibo style=" width: 90%;height:140px;float:left;margin:100px"> 
					<div class="col-sm-12 col-xs-12 message">
						<img src="img/icon.png" class="col-sm-2 col-xs-2" 
							style="border-radius: 50%;height:100px;width:140px">
						<div class="col-sm-10 col-xs-10" style="width: 676px; ">
							<span id="WAu" style="font-weight: bold;">${w.author}</span> <br> <small
								id="stime" class="date" style="color:#999"></small>
							<div class="msg_content"> ${w.content}</div>
						</div>
					</div>
				</div>
	
<!-- 	<div id = weibo> -->
<!-- 		<p>${w.content}</p> -->
<!-- 	</div> -->
    <div id = comment></div>
  </body>
</html>