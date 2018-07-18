<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="jquery.min.js"></script>
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
		$(document).ready(function(){
			$.ajax({
				type:"post",
				url:"test.action",
				data:{"id":1},
				success:function(data){
					msg=data[0].comment.postdate;
					msg=dealtime(msg);
				}
			})
		});
	</script>
  </head>
  
  <body>
    This is my JSP page. <br>
    <input type="button" value="测试" onclick="alert(msg)">
  </body>
</html>
