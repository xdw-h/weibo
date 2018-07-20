<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html lang="en" class="no-js">
    <head>
        <meta charset="UTF-8" />
        <title>微博-随时随地发现新鲜事</title>
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/animate-custom.css" />
		<script src="js/jquery-3.1.0.js"></script>
	<script>
	
	var check=false;
	var check2=false;
		$(document).ready(function(){
			$("#usernamesignup").blur(function(){	
				$.post("queryName.action",{"u.username":$(this).val()},function(data){
					if (data=="has"){
						$("#info").html("用户名已存在！");
						check=false;
					}
					else{
						$("#info").html("用户名可以使用！");
						check=true;
					}
				})
			});
			$("#passwordsignup_confirm").blur(function(){
			var upassword = $("#passwordsignup").val();
			var upassword1 = $("#passwordsignup_confirm").val();
			if(upassword!=""&&upassword!=""){
			if (upassword1 != upassword) {
				$("#info2").css("color","red");
				$("#info2").html("密码不一致");
				check2=false;
			} else {
				$("#info2").css("color","black");
				$("#info2").html("密码一致");
				check2=true;
			}
			}else{
				$("#info2").css("color","red");
				$("#info2").html("密码不能为空");
			}
		})
		})
	</script>
    </head>
  <body>
    <div class="container">
            <header>
                <h1><span><a href="main.jsp">weblog</a></span></h1>
            </header>
            <section>				
                <div id="container_demo" >
                    <!-- hidden anchor to stop jump http://www.css3create.com/Astuce-Empecher-le-scroll-avec-l-utilisation-de-target#wrap4  -->
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                        <div id="login" class="animate form">
                            <form  action="login" autocomplete="on" method="post"> 
                                <h1>Log in</h1> 
                                <p> 
                                    <label for="username" class="uname" data-icon="u" >您的用户名</label>
                                    <input id="username" name="u.username" required="required" type="text" placeholder="yourusername"/>
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p">密码</label>
                                    <input id="password" name="u.password" required="required" type="password" placeholder="yourpassword" /> 
                                </p>
                                <p class="login button"> 
                                    <input type="submit" value="Login" /> 
								</p>
                                <p class="change_link">
									<a href="#toregister" class="to_register">join us</a>
								</p>
                            </form>
                        </div>

                        <div id="register" class="animate form">
                            <form  action="register" autocomplete="on" method="post"> 
                                <h1> Sign up </h1> 
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u">Your username</label>
                                    <input id="usernamesignup" name="u.username" required="required" type="text" placeholder="username" /><span id="info">*</span>
                                </p>
                                <p> 
                                    <label for="emailsignup" class="youmail" data-icon="e" > Your email</label>
                                    <input id="emailsignup" name="u.email" required="required" type="email" placeholder="emailaddress"/> 
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p">Your password </label>
                                    <input id="passwordsignup" name="u.password" required="required" type="password" placeholder="password"/>
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your password </label>
                                    <input id="passwordsignup_confirm" name="passwordsignup_confirm" required="required" type="password" placeholder="password"/><span id="info2">*</span>
                                </p>
                                <p class="signin button"> 
									<input type="submit" value="Sign up"/> 
								</p>
                                <p class="change_link">  
									Already a member ?
									<a href="#tologin" class="to_register"> Go and log in </a>
								</p>
                            </form>
                        </div>	
                    </div>
                </div>  
            </section>
        </div>
  </body>
</html>
