<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
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

<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=0.5, maximum-scale=2.0, user-scalable=yes" />
<meta name="apple-mobile-web-app-capable" content="yes" />
<meta name="format-detection" content="telephone=no" />
<title>微博-随时随地发现新鲜事</title>

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
	 var s = ${list2};
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
function MouseOut(obj)
        {
          sel.style.display='none';
        }
  
  </script>
<script>
   function deleteW(element){
   var k1 = $(element).attr('data');
   var k2 = $("#author_id").html();
   var k3=  $(element).attr('wid');
  console.log(k1);
  console.log(k2);	
  console.log(k3);
	
	   if(k1==k2){
	    $.post("delete.action",{"WID":k3},function(data, stuts){
	        window.location.reload(true);
	    });
	    return true;
	   }
	   else{
	  	return false;
	   }
   }
 
  </script>
  
</head>
<body>
	<div>
	<nav class="navbar  navbar-fixed-top" role="navigation"
		style="background: #e0620d ;padding-top: 3px;height:50px;">
		<div class="container-fluid" style="background: #fff;">
			<div class="navbar-header ">
				<a class="navbar-brand " href="main.jsp">WEBLOG</a>
			</div>
			
			<form class="navbar-form navbar-left"  role="search" action="search2">
				<div class="form-group" >

					<input type="text" id="keyword" name="keyword" placeholder="#热门话题#" autocomplete="off" required>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
					<button  type="submit" style="height: 30px; width: 26px" class="glyphicon glyphicon-search btn_search" ></button></br>

					<select class="line-limit-length" multiple="multiple" id="sel" onchange="test2()" 
			style="width: 190px;display:none">
		</select>
				</div>

			</form>

			<div class="collapse navbar-collapse" id="my-navbar-collapse">

				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp">您好！<input type="hidden"
							name="c.author" value="<%=name%>"><span id="author_id"></span></a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown"> 设置 <b class="caret"></b>
					</a>
						<ul class="dropdown-menu">
							<li><a href="<s:url action="logout"/>">注销</a></li>
						</ul></li>
				</ul>

			</div>


		</div>
		<hr style="margin: 0;padding: 0;color:#222;width: 100%">
	</nav>

	<div class="container container_bg">
		<div class="row" style="height:1000px">
			<div class="col-sm-2"></div>

			


				<div class="row item_msg" style="height: 250px; width: 676px;float:left;margin:100px">
				<s:iterator id="Weibo" value="list2">
					<div class="col-sm-12 col-xs-12 message">					
						<img src="img/icon.png" class="col-sm-2 col-xs-2"
							style="border-radius: 50%">
						<div class="col-sm-10 col-xs-10" style="width: 676px; ">
						<input  type="hidden" value="<s:property value="#Weibo.id"/>"/><br>
							<span style="font-weight: bold;"><s:property value="#Weibo.author"/></span> <br> <small
								class="date" style="color:#999"><s:property value="#Weibo.posttime"/></small>
							<div class="msg_content"> <s:property value="#Weibo.content" escape="false"/>
							
						  	<s:if test="%{#Weibo.author == #session.login.username}"> 
							<button onclick="return (confirm('确认删除该信息？') && deleteW(this))" wid="<s:property value="#Weibo.id"/>" data="<s:property value="#Weibo.author"/>" style="float:right">删除</button>
							 </s:if>
							</div>
							
						</div>
						
					</div>
</s:iterator>

				</div>


			</div>
			
			


			

		</div>


	</div>
	<script src="js/jquery-3.1.0.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(function(){

		 $("#content").keyup(function(){

			//判断输入的字符串长度
			var content_len = $("#content").text().replace(/\s/g,"").length;

			$(".tips").text("已经输入"+content_len+"个字");
			
	   
			if(content_len==0){
				// alert(content);
				$(".tips").text("");
				$("#send").addClass("disabled");
				return false;
			}else{
				$("#send").removeClass("disabled");
			}
		 });

		 
			$(".pic").click(function(){
				
				$(".select_Img").click();  	
			})
		
		//点击按钮发送内容
		 $("#send").click(function(){


			var content=$("#content").html();
				$.post("post", "weibo.content="+content+ "&weibo.author=1", function (data, status) {
                alert(data);
            });
            
			//判断选择的是否是图片格式		 
			var imgPath = $(".imgPath").text();
			var start  = imgPath.lastIndexOf(".");
			var postfix = imgPath.substring(start,imgPath.length).toUpperCase();
			

			if(imgPath!=""){

				if(postfix!=".PNG"&&postfix!=".JPG"&&postfix!=".GIF"&&postfix!=".JPEG"){
						alert("图片格式需为png,gif,jpeg,jpg格式");
				}else{
					$(".item_msg").append("<div class='col-sm-12 col-xs-12 message' > <img src='img/icon.png' class='col-sm-2 col-xs-2' style='border-radius: 50%'><div class='col-sm-10 col-xs-10'><span style='font-weight: bold;''>Jack.C</span> <br><small class='date' style='color:#999'>刚刚</small><div class='msg_content'>"+content+"<img class='mypic' onerror='this.src='img/bg_1.jpg' src='file:///"+imgPath+"' ></div></div></div>");
				}
			}else{
				 $(".item_msg").append("<div class='col-sm-12 col-xs-12 message' > <img src='img/icon.png' class='col-sm-2 col-xs-2' style='border-radius: 50%'><div class='col-sm-10 col-xs-10'><span style='font-weight: bold;''>Jack.C</span> <br><small class='date' style='color:#999'>刚刚</small><div class='msg_content'>"+content+"</div></div></div>");
			}
								
		 });

		  //添加表情包1
		  for (var i = 1; i < 60; i++) {

				$(".emoji_1").append("<img src='img/f"+i+".png' style='width:35px;height:35px' >");
			}
			//添加表情包2
			for (var i = 1; i < 61; i++) {

				$(".emoji_2").append("<img src='img/h"+i+".png' style='width:35px;height:35px' >");
			}
		
		
		 $(".emoji").click(function(){

			$(".myEmoji").show();

			//点击空白处隐藏弹出层
			$(document).click(function (e) {

				if (!$("#edit_form").is(e.target) && $("#edit_form").has(e.target).length === 0) {

					$(".myEmoji").hide();
				}
			});


		 });

		 //将表情添加到输入框
		   $(".myEmoji img").each(function(){
				$(this).click(function(){
					var url = $(this)[0].src;

					$('#content').append("<img src='"+url+"' style='width:25px;height:25px' >");

					$("#send").removeClass("disabled");
				})
		   })
			
			//放大或缩小预览图片
			$(".mypic").click(function(){
				var oWidth=$(this).width(); //取得图片的实际宽度  
				var oHeight=$(this).height(); //取得图片的实际高度  
			  
				if($(this).height()!=200){
					$(this).height(200); 
				}else{
					$(this).height(oHeight + 200/oWidth*oHeight); 
					
				}
							
			})
			
	})
	


	var msge="<%=name%>";
		if (msge == null || msge == "") {
			msge = "<a href='login-register.jsp'>未登录</a>";
		}
		$("#author_id").html(msge);
		$("#author_id2").html(msge);
	</script>
	</div>
</body>
</html>