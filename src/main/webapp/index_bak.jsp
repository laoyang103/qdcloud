<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.xson.common.object.XCO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

String key = cn.gatherlife.wms.business.util.JspUtils.getImageVerifyKey();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>合同统计助手V1.0</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
    <style>
        .nav li h5{height: 50px;line-height: 50px;margin: 0;}
        .fonts{font-size: 16px;font-weight: bold;}
        .navbar-header i{font-size: 32px;height: 50px;line-height: 50px;margin-right: 10px;color: #fc4141;}
        .login-box{width: 450px;margin: 0 auto;background-color: rgba(246,61,61,.8);padding: 40px 55px;color: #ffffff;border-radius: 5px;margin-top: 40px;}
        .login-box label{display: inline-block;margin-right: 10px;width: 45px;}
        .login-box input{display: inline-block !important;width: 280px;}
        .blockinput{margin-bottom: 20px;}
        .error-info{width: 280px;height: 30px;line-height: 30px;padding: 10px 0;display: block;margin-left: 65px;font-size: 12px;}
    </style>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
    <script  type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<script type="text/javascript">
     	function verifyFun(){
			var imgVer = document.getElementById("imgVer");
			imgVer.src = '<%=request.getContextPath()%>/jcaptcha/verify.do?key=<%=key %>&time ='+new Date();
		}
		
		
		$(function(){
		
			$("#username").change(function() {
				var username = $("#username").val();
				if (username == null) {
					$("#uerror").html('请输入用户名');
					//$("#uerror").show();
				} else {
					$("#uerror").html(' ');
				}

			});
			
			$("#password").change(function() {
				var password = $("#password").val();
				if (password == null) {
					$("#perror").html('请输入密码');
					//$("#perror").show();
				} else {
					$("#perror").html(' ');
				}

			});
			
			$("#authcode").change(function() {
				var verifyCode = $("#authcode").val();
				if (verifyCode == null) {
					$("#aerror").html('请输入验证码');
					//$("#aerror").show();
				} else {
					$("#aerror").html(' ');
				}

			});
			
			$("#username").focus(function(){
			  	$("#uerror").html(' ');
			});
			
			$("#password").focus(function(){
			  	$("#perror").html(' ');
			});
			
			$("#authcode").focus(function(){
			  	$("#aerror").html(' ');
			});
		
			$(document).keydown(function(event){
                   if(event.keyCode==13){
                    	doLogin();
                   }
            })
			
		});
		
		//登录
		function doLogin(){
			var xco = new XCO();
			var username = $("#username").val();
			var password = $("#password").val();
			var authcode = $("#authcode").val();
			
			if(username == ""){
				$("#uerror").html('请输入用户名');
				//$("#uerror").show();
			}else{
				xco.setStringValue("user_name", username);
				$("#uerror").html(' ');
			}
			
			if(password == ""){
				$("#perror").html('请输入密码');
				//$("#perror").show();
			}else{
				xco.setStringValue("password", password);
				$("#perror").html(' ');
			}
			
			if(authcode == ""){
				$("#aerror").html('请输入验证码');
				//$("#aerror").show();
			}else{
				xco.setStringValue("authcode", authcode);
				$("#aerror").html(' ');
			}
			
			if(xco.getStringValue("user_name") && xco.getStringValue("password") && xco.getStringValue("authcode")){
				var options ={
						url:"/login/login.jhtml",
						data:xco,
						success: manage
				};
				$.doXcoRequest(options);
			}
			
		}
		
		function manage(xco){

			if(xco.getCode() == 0){
				window.location.href="/view/uploadExcel/programlist.jsp";
			}else{
				var mes = xco.getMessage();
				if(xco.getCode() == 1) {
					$("#aerror").html("验证码错误");
				}
				if(xco.getCode() == 2){
				   $("#perror").html("用户名或密码输入错误");
				}
				if(xco.getCode() == 3){
				   $("#perror").html("用户名或密码输入错误");
				}
				if(xco.getCode() == 4){
				   alert("系统错误");
				}
			}
		}
		
	</script>


  
   <body>
  		<nav class="navbar navbar-default navbar-static-top">
		    <div class="container">
		        <div class="navbar-header">
		            <i class="glyphicon glyphicon-fire"></i>
		        </div>
		        <div id="navbar" class="navbar-collapse collapse">
		            <ul class="nav navbar-nav">
		                <li class="active"><h5 href="#" class="fonts">合同统计助手V1.0</h5></li>
		            </ul>
		        </div><!--/.nav-collapse -->
		    </div>
		</nav>
		<div class="container">
		    <form action="" class="login-box">
		        <div class="blockinput">
		            <label for="">账户名</label>
		            <input type="text" class="form-control" placeholder="账户/用户名" id="username">
		            <span class="error-info"  id="uerror"></span>
		        </div>
		        <div class="blockinput">
		            <label for="">密码</label>
		            <input type="password" class="form-control" placeholder="密码" id="password">
		            <span class="error-info"  id="perror"></span>
		        </div>
		        <div class="blockinput">
		            <label for="">验证码</label>
		            <input type="text" class="form-control" id="authcode" style="width: 150px;" placeholder="">
		            <img src="<%=request.getContextPath()%>/jcaptcha/verify.do?key=<%=key %>" onclick="verifyFun()" id="imgVer"  alt=""   style="height: 34px;margin-left: 10px;width: 115px;">
		        	<span class="error-info"  id="aerror"></span>
		        </div>
		        <div class="blockinput" style="margin-top:40px !important;margin-bottom: 0 !important;">
		            <button type="button" class="btn btn-default" id="login" style="width: 100%;" onclick="doLogin()">登录</button>
		        </div>
		    </form>
		</div>

   </body>
    
</html>

