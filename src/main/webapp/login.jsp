<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.xson.common.object.XCO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String title = "实验教学统一管理系统";
//String key = cn.gatherlife.wms.business.util.JspUtils.getImageVerifyKey();
%>
<%
	String key = cn.gatherlife.wms.business.util.JspUtils.getImageVerifyKey();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title><%=title%></title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <![endif]-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/themes/night.min.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/responsive.css" >
	
	<!-- FONTS -->
	<link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- ANIMATE -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css" />

   <body>
  		<!--#include virtual="/BIsystem/include/header.html"-->
	<section id="login" class="visible">
				<div class="container">
					<div class="row">
						<div class="login-box-plain pos-a">
								<h2 class="bigintro">实验教学统一管理系统</h2>
                                <div class="bd">
                                    <div class="divide-40"></div>
                                    <div class="divide-20"></div>
                                    <div role="form" class="form-horizontal font-14">
                                      <div class="form-group">
                                        <label class="col-sm-4 control-label text-right" >账号：</label>
                                        <div class="col-sm-8">
                                        <input class="form-control"  type="text" id="user_name" placeholder="账号" value="">
                                        <div id="user_name_msg" class="help-block pos-a">账号不能为空！！</div>
                                        </div>
                                      </div>
                                      <div class="form-group"> 
                                        <label class="col-sm-4 control-label text-right" >密码：</label>
                                        <div class="col-sm-8">
                                        <input class="form-control" id="password" type="password" placeholder="密码" value="">
                                        <div id="password_msg" class="help-block pos-a">密码不能为空！！</div>
                                        </div>
                                      </div>
                                      <div class="form-group"> 
                                        <label class="col-sm-4 control-label text-right" >身份：</label>
                                        <div class="col-sm-8">
                                            <select class="form-control" id="type">
                                              <option value="1">学生</option>
                                              <option value="2">教师</option>
                                              <option value="3">管理员</option>
                                            </select>
                                        </div>
                                      </div>
                                      <div class="form-group"> 
                                        <label class="col-sm-4 control-label text-right" >验证码：</label>
                                        <div class="col-sm-8" style="padding-left:0;">
                                            <input class="form-control pull-left" style="width:115px;"  type="text" placeholder="验证码" id="verifyCode">
                                            <img class="pull-right" src="<%=request.getContextPath()%>/jcaptcha/verify.do?key=<%=key %>" onclick="verifyFun()" id="imgVer"/>
                                            <div id="verify_msg" class="help-block pos-a">密码不能为空！！</div>
                                            <br class="clear">
                                        </div>
                                      </div>
                                      <div class="form-group"> 
                                        <label class="col-sm-4 control-label text-right" ></label>
                                        <div class="col-sm-8">
                                            <button class="btn btn-primary mr10 btn-save font-16"  onclick="doLogin()">登录</button>
                                        </div>
                                      </div>
                                    </div>	
                                </div>							
							</div>
					</div>
				</div>
			</section>
	
	<!-- JQUERY -->
	<script src="${pageContext.request.contextPath}/js/jquery/jquery-2.0.3.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="${pageContext.request.contextPath}/bootstrap-dist/js/bootstrap.min.js"></script>	
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/gou/mToken_K1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/gou/mToken_K1Plugin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/gou/base64.js"></script>
	<!-- /JAVASCRIPTS -->
	
	<script type="text/javascript">
		$(function(){
			$("#password_msg").hide();
			$("#user_name_msg").hide();
			$("#verify_msg").hide();
			
			$("#user_name").change(function() {
				var user_name = $("#user_name").val();
				if (user_name == null) {
					$("#user_name_msg").show();
					$("#user_name_msg").parent().addClass("has-error");
				} else {
					$("#user_name_msg").hide();
					$("#user_name_msg").parent().removeClass("has-error");
				}

			});
			
			$("#password").change(function() {
				var password = $("#password").val();
				if (password == null) {
					$("#password_msg").show();
					$("#password_msg").parent().addClass("has-error");
				} else {
					$("#password_msg").hide();
					$("#password_msg").parent().removeClass("has-error");
				}

			});
			
			$("#verifyCode").change(function() {
				var verifyCode = $("#verifyCode").val();
				if (verifyCode == null) {
					$("#verify_msg").show();
					$("#verify_msg").parent().addClass("has-error");
				} else {
					$("#verify_msg").hide();
					$("#verify_msg").parent().removeClass("has-error");
				}

			});
			
			$(document).keydown(function(event){
                   if(event.keyCode==13){
                    	doLogin();
                   }
            })		
		});
		//刷新验证码
		function verifyFun(){
			var imgVer = document.getElementById("imgVer");
			imgVer.src = '<%=request.getContextPath()%>/jcaptcha/verify.do?key=<%=key %>&time ='+new Date();
		}
		
		//登录
		function doLogin(){
			var xco = new XCO();
			var user_name = $("#user_name").val();
			if(user_name){
				xco.setStringValue("user_name",user_name);
			}else{
				$("#user_name_msg").show();
				$("#user_name_msg").parent().addClass("has-error");
			}
			
			var password = $("#password").val();
			if(password){
				xco.setStringValue("password",password);
			}else{
				$("#password_msg").show();
				$("#password_msg").parent().addClass("has-error");
			}
			
			var verifyCode = $("#verifyCode").val();
			if(verifyCode){
				xco.setStringValue("verifyCode",verifyCode);
			}else{
				$("#verify_msg").show();
				$("#verify_msg").parent().addClass("has-error");
			}
			xco.setIntegerValue("type", $("#type").val());
			if(xco.getStringValue("user_name") && xco.getStringValue("password") && xco.getStringValue("verifyCode") && xco.getIntegerValue("type")){
				var options ={
						url:"/login/login.jhtml",
						data:xco,
						success: manage
				};
				//if(K1mTokenFindDevice()){
					$.doXcoRequest(options);
				//}
			}
			
		}
		
		function manage(xco){
			//alert(xco.getObjectValue("data"));
			if(xco.getCode() == 0){
				var type = xco.getObjectValue("data").getObjectValue("type");
				if(type == 1){
					window.location.href="/view/studenttask/vmlist.jsp";
				}else if(type == 2){
					window.location.href="/view/studenttask/vmlist.jsp";
				}else{
					window.location.href="/view/message/sendmsg.jsp";
				}
			}else if(xco.getCode() == 1){
				 $("#verifyCode").val("");
				var mes = xco.getMessage();
				alert(mes);
			}else{
				var mes = xco.getMessage();
				alert(mes);
			}
			verifyFun();
		}
		
	</script>
</html>

