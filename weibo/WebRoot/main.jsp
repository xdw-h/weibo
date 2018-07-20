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
  
</head>
<body>
<input type="hidden" value=<%=uid%>> 
	<nav class="navbar  navbar-fixed-top" role="navigation"
		style="background: #e0620d ;padding-top: 3px;height:50px;">
		<div class="container-fluid" style="background: #fff;">
			<div class="navbar-header ">
				<a class="navbar-brand " href="main.jsp" >WEBLOG</a>
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

	<div class="container container_bg">
		<div class="row">
			<div class="col-sm-2"></div>

			<div class="col-sm-6 col-xs-12 my_edit">
				<div class="row" id="edit_form">
					<span class="pull-left" style="margin:15px;">编写新鲜事</span> <span
						class="tips pull-right" style="margin:15px;"></span>
					<form role="form" style="margin-top: 50px;">
						<div class="form-group">
							<div class="col-sm-12">

								<div contentEditable="true" id="content" class="form-control "></div>
							</div>
							<div class="col-sm-12" style="margin-top: 12px;">
								<span class="emoji">表情</span> <span>
									<input type="file" name="" class="select_Img"
									style="display: none"> <img class="preview" src="">
								</span>


								<div class="myEmoji">
									<ul id="myTab" class="nav nav-tabs">
										<li class="active"><a href="#set" data-toggle="tab">
												预设 </a></li>
										<li><a href="#hot" data-toggle="tab">热门</a></li>

									</ul>
									<div id="myTabContent" class="tab-content">
										<div class="tab-pane fade in active" id="set">
											<div class="emoji_1"></div>

										</div>
										<div class="tab-pane fade" id="hot">
											<div class="emoji_2"></div>
										</div>

									</div>
								</div>
								<!-- <span> <input type="file" id="selectImg" value=""></input> </span> -->
								<button type="button" id="send"
									class="btn btn-default pull-right disabled">发布</button>
							</div>
						</div>
					</form>
				</div>

			<!-- 显示微博 -->
            <div class="row item_msg" id="weibo_list">

            </div>
            <button class="btn btn-default pull-right" id="load_more">加载更多</button>


			</div>


			<div class="col-sm-3 col-xs-12 part_right">
				<div class="row text-center inform">
					<img src="img/icon.png">
					<h4 style="font-weight: bold;" id="author_id2"></h4>
					<div class="col-sm-12 my_inform">
						<div class="col-sm-4 col-xs-4">
							<div>111</div>
							<div class="sort">关注</div>

						</div>
						<div class="col-sm-4 col-xs-4">
							<div>111</div>
							<div class="sort">粉丝</div>
						</div>
						<div class="col-sm-4 col-xs-4">
							<div>111</div>
							<div class="sort">博客</div>
						</div>
					</div>
				</div>
				<div class="row part_hot">
					<div class="col-sm-12">
						<span class="pull-left"
							style="padding: 10px;font-size:16px;font-weight: bold;">热门话题</span>
						<span class="pull-right" style="padding: 10px;">换话题</span>
					</div>
					<hr style="margin: 0;padding: 0;width: 100%">

					<div class="col-sm-12 item_hot">
						<a href="http://ent.163.com/18/0712/16/DMHDNFUN00038FO9.html"><span class="pull-left">#崔永元十问冯小刚#</span> <span
							class="pull-right item_num">34.6亿</span></a>
					</div>

					<div class="col-sm-12 item_hot">
						<a href="https://baike.baidu.com/item/%E5%B7%A5%E4%BD%9C%E7%BB%86%E8%83%9E/19157294?fr=aladdin"><span class="pull-left">#工作细胞#</span> <span
							class="pull-right item_num">2.6亿</span></a>
					</div>

					<div class="col-sm-12 item_hot">
						<a href=" "><span class="pull-left">#2牛B#</span> <span
							class="pull-right item_num">10.4亿</span></a>
					</div>

					<div class="col-sm-12 item_hot">
						<a href=" "><span class="pull-left">#扑通扑通少女心#</span> <span
							class="pull-right item_num">1.5亿</span></a>
					</div>

					<div class="col-sm-12 item_hot">
						<a href=" "><span class="pull-left">#突然开心#</span> <span
							class="pull-right item_num">1.1亿</span></a>
					</div>
					<hr style="margin: 0;padding: 0;width: 100%">

					<div class="col-sm-12 text-center" style="padding: 10px">
						<a href="#">查看更多</a>
					</div>

				</div>

			</div>

		</div>


	</div>

	<script src="js/bootstrap.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {

        function insertWeibo(content, interval, author, id) {
            var intervalStr = interval || '刚刚';
            var imgPath = $(".imgPath").text();
            var start = imgPath.lastIndexOf(".");
            var domContent;
            if (imgPath != "") {
                domContent = "<div class='col-sm-12 col-xs-12 message' > <img src='img/icon.png' class='col-sm-2 col-xs-2' style='border-radius: 50%'><div class='col-sm-10 col-xs-10'><span style='font-weight: bold;''>" + author + "</span> <br><small class='date' style='color:#999'>" + intervalStr + "</small><div class='msg_content'>" + content + "<img class='mypic' onerror='this.src='img/bg_1.jpg' src='file:///" + imgPath + "' ></div></div><div><a class='pull-right' href='turncomment.action?id="+ id +"'>回复</a></div></div>";
            } else {
                domContent = "<div class='col-sm-12 col-xs-12 message' > <img src='img/icon.png' class='col-sm-2 col-xs-2' style='border-radius: 50%'><div class='col-sm-10 col-xs-10'><span style='font-weight: bold;''>" + author + "</span> <br><small class='date' style='color:#999'>" + intervalStr + "</small><div class='msg_content'>" + content + "</div></div><div class='pull-right'><a href='turncomment.action?id="+ id +"'>回复</a></div></div>";
            }
            if (interval) {
                $(".item_msg").append(domContent);
            } else {
                $(".item_msg").prepend(domContent);
            }
        }

        function interval(time) {
            var date = new Date(time);
            var intervalMilliseconds = new Date().getTime() - date.getTime();
            if (Math.floor(intervalMilliseconds / (24 * 3600 * 1000)) > 1)
                return date.toISOString().substring(0, 10);
            var leave1 = intervalMilliseconds % (24 * 3600 * 1000)
            var hours = Math.floor(leave1 / (3600 * 1000))
            var leave2 = leave1 % (3600 * 1000)
            var minutes = Math.floor(leave2 / (60 * 1000))
            var leave3 = leave2 % (60 * 1000)
            var seconds = Math.round(leave3 / 1000)
            if (hours > 1) return hours + "小时前";
            if (minutes > 1) return minutes + "分钟前";
            return seconds + "秒前";
        }

        function load() {
            var length = $('.message').length;
            $.post("weiboList", "offset=" + length, function (data, status) {
                if (data.length < 10) {
                    $('#load_more').attr('disabled', 'true')
                }
                $.each(data, function (index, item) {
                    insertWeibo(item.content, interval(item.posttime), item.author, item.id);
                })
            })
        }

        load();

        $('#load_more').click(load);
        $("#content").keyup(function () {
            //判断输入的字符串长度
            var content_len = $("#content").text().replace(/\s/g, "").length;
            $(".tips").text("已经输入" + content_len + "个字");
            if (content_len == 0) {
                // alert(content);
                $(".tips").text("");
                $("#send").addClass("disabled");
                return false;
            } else {
                $("#send").removeClass("disabled");
            }
        });
        $(".pic").click(function () {
            $(".select_Img").click();
        });
        //点击按钮发送内容
        $("#send").click(function () {
            var content = $("#content").html();
            $.post("post", "weibo.content=" + content + "&weibo.author=<%=name%>", function (data, status) {
                if (data === -1) {
                    alert('发送失败')
                } else {
                    insertWeibo(content, null, "<%=name%>", data);
                }
            });
        });
        //添加表情包1
        for (var i = 1; i < 60; i++) {
            $(".emoji_1").append("<img src='img/f" + i + ".png' style='width:35px;height:35px' >");
        }
        //添加表情包2
        for (var i = 1; i < 61; i++) {
            $(".emoji_2").append("<img src='img/h" + i + ".png' style='width:35px;height:35px' >");
        }
        $(".emoji").click(function () {
            $(".myEmoji").show();
            //点击空白处隐藏弹出层
            $(document).click(function (e) {
                if (!$("#edit_form").is(e.target) && $("#edit_form").has(e.target).length === 0) {
                    $(".myEmoji").hide();
                }
            });
        });
        //将表情添加到输入框
        $(".myEmoji img").each(function () {
            $(this).click(function () {
                var url = $(this)[0].src;
                $('#content').append("<img src='" + url + "' style='width:25px;height:25px' >");
                $("#send").removeClass("disabled");
            })
        })
        //放大或缩小预览图片
        $(".mypic").click(function () {
            var oWidth = $(this).width(); //取得图片的实际宽度
            var oHeight = $(this).height(); //取得图片的实际高度
            if ($(this).height() != 200) {
                $(this).height(200);
            } else {
                $(this).height(oHeight + 200 / oWidth * oHeight);
            }
        })
        var msge = "<%=name%>";
        if (msge == null || msge == "") {
            msge = "<a href='login-register.jsp'>未登录</a>";
        }
        $("#author_id").html(msge);
        $("#author_id2").html(msge);
    });

	</script>
</body>
</html>
