<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page import="com.weibo.entity.Usermsg" %>
<%
	Usermsg user = (Usermsg)session.getAttribute("login");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	String name="";
	String sex ="";
	String email="";
	Integer uid = 0;
	if(user!=null){
		name = user.getUsername();
		uid = user.getId();
		sex = user.getSex();
		email = user.getEmail();
	}
%>

<!DOCTYPE HTML>
<html>
  <head>
    <base href="<%=basePath%>">
 <meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="initial-scale=1,maximum-scale=1, minimum-scale=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>修改个人信息</title>
<style>
	img {
		border: 0;
	}

	body {
		background: #f7f7f7;
		color: #666;
		font: 12px/150% Arial,Verdana, "microsoft yahei";
	}

	html, body, div, dl, dt, dd, ol, ul, li, h1, h2, h3, h4, h5, h6, p, blockquote, pre, button, fieldset, form, input, legend, textarea, th, td {
		margin: 0;
		padding: 0;
	}

	article,aside,details,figcaption,figure,footer,header,main,menu,nav,section,summary {
		display: block;
		margin: 0;
		padding: 0;
	}

	audio,canvas,progress,video {
		display: inline-block;
		vertical-align: baseline;
	}

	a {
		text-decoration: none;
		color: #08acee;
	}

	a:active,a:hover {
		outline: 0;
	}

	button {
		outline: 0;
	}

	mark {
		color: #000;
		background: #ff0;
	}

	small {
		font-size: 80%;
	}

	img {
		border: 0;
	}

	button,input,optgroup,select,textarea {
		margin: 0;
		font: inherit;
		color: inherit;
		outline: none;
	}

	li {
		list-style: none;
	}

	i {
		font-style: normal;
	}

	a {
		color: #666;
	}

	a:hover {
		color: #eee;
	}

	em {
		font-style: normal;
	}

	h2, h3 {
		font-family: "microsoft yahei";
		font-weight: 100;
	}



	/* ------------------- */
	::-moz-placeholder {
		color: #9fa3a7;
	}

	::-webkit-input-placeholder {
		color: #9fa3a7;
	}

	:-ms-input-placeholder {
		color: #9fa3a7;
	}


	.pc-kk-form{
		padding:15px 20px;
		width:400px; 
		position:absolute;
        left:0;
        top: 0;
        bottom: 0;
        right: 0;
        margin: auto;
	}
	.pc-kk-form-list{
		background:#fff;
		border:1px solid #e5e5e5;
		border-radius:5px;
		height:44px;
		line-height:44px;
		margin-bottom:10px;
	}
	.pc-kk-form-list input{
		width:100%;
		border:none;
		background:none;
		color:#9fa3a7;
		font-size:14px;
		height: 36px;
		padding: 4px 10px;
	}
	.pc-kk-form-list textarea{
		background:none;
		border:none;
		height:60px;
		padding:10px;
		resize:none;
		width:94%;
		line-height:22px;
		color:#9fa3a7;
		font-size:14px;
	}
	.nice-select{
		position: relative;
		background: #fff url(images/a2.jpg) no-repeat right center;
		background-size:18px;
		width:47%;
		float:left;
		border:1px solid #e5e5e5;
		border-radius:5px;
		height:44px;
		line-height:44px;
	}

	.nice-select ul{
		width: 100%;
		display: none;
		position: absolute;
		left: -1px;
		top: 44px;
		overflow: hidden;
		background-color: #fff;
		max-height: 150px;
		overflow-y: auto;
		border: 1px solid #b9bcbf;
		z-index: 9999;
		border-radius:5px;

	}
	.nice-select ul li{
		padding-left:10px;
	}
	.nice-select ul li:hover{
		background:#f8f4f4;
	}
	.pc-kk-form-list-clear{
		background:none;
		border:none;
	}
	.pc-kk-form-btn button{
		background:#ec5224;
		color:#fff;
		border:none;
		width:100%;
		height:50px;
		line-height:50px;
		font-size:16px;
		border-radius:50px;
	}
</style>


  </head>
  
  <body>
  <div class="pc-kk-form">
	<form action="updateAdmin" method="post">
<!-- 	<input type="hidden" name="u.id" value="<s:property value="u.id"/>"/> -->
		<div class="pc-kk-form-list">
			<input type="text"  name="u.username" value="<%=name %>">
		</div>
		<div class="pc-kk-form-list pc-kk-form-list-clear">
			<div class="nice-select" name="nice-select" style="float:rightleft">
				<input type="text" value="<%=sex %>" readonly name="u.sex" />
				<ul>
					<li data-value="male">male</li>
					<li data-value="female">female</li>
				</ul>

			</div>
		</div>
		<div class="pc-kk-form-list">
			<input type="email" placeholder="E-mail" name="u.email" value="<%=email %>">
		</div>
<!-- 		<div style="height: 60px;padding:20px;font-size: 1.2em;"> -->
<!-- 		 <form action="upfile" method="post" enctype="multipart/form-data">  -->
<!--     	头像：<input type="file" name="upload" id="hhh"> -->
<!--     	<input type="submit" value="上传"> -->
<!-- 		</form> -->
<!-- 	</div> -->
		<div class="pc-kk-form-btn">
			<button>Submit</button>
		</div>
	</form>
</div>


<script type="text/javascript" src="js/jquery.js"></script>

<script>

	$('[name="nice-select"]').click(function(e){

		$('[name="nice-select"]').find('ul').hide();

		$(this).find('ul').show();

		e.stopPropagation();

	});

	$('[name="nice-select"] li').hover(function(e){

		$(this).toggleClass('on');

		e.stopPropagation();

	});

	$('[name="nice-select"] li').click(function(e){

		var val = $(this).text();

		$(this).parents('[name="nice-select"]').find('input').val(val);

		$('[name="nice-select"] ul').hide();

		e.stopPropagation();

	});

	$(document).click(function(){

		$('[name="nice-select"] ul').hide();

	});
	var a=$("#hhh").val();
	$("#hhh").blur(function(){
		alert(a);
	})
</script>


</div>
  </body>
</html>
