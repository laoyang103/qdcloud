<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "";
%>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/left.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title><%=title%></title>
	<meta name="description" content="">
	<meta name="author" content="">
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
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animatecss/animate.min.css" />	
</head>
<body>
<!--#include virtual="/BIsystem/include/header.html"-->
	
	<!-- PAGE -->
	<section id="page" data-page="" sub-page="">
		<!--#include virtual="/BIsystem/include/side.html"-->
		<div id="main-content">
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						<!-- PAGE HEADER-->
						<div class="content-in pos-r">
                        <div class="stuBox hui999 pos-a">
                            	账<span class="em2">号：<span class="blue"><%=real_name %></span><br/></span>
                                当前时间：<%=date %>
                               
                            </div>
                        <div class="s-pannel margin-top-50">
                        	
                           <div role="form" class="form-horizontal font-14">
                              <div class="form-group">
                                <label class="col-sm-3 control-label">账号：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="user_name" class="form-control w210 pull-left" disabled value="<%=user_name %>">
                                    <span id="user_name_msg" class="help-block pull-left ml10">账号不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">旧密码：</label>
                                <div class="col-sm-9">
                                    <input type="password" id="password" class="form-control w210 pull-left">
                                    <span id="user_password_msg" class="help-block pull-left ml10">旧密码不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">新密码：</label>
                                <div class="col-sm-9">
                                    <input type="password" id="new_password1" class="form-control w210 pull-left">
                                    <span id="new_password_msg1" class="help-block pull-left ml10">新密码不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">确认密码：</label>
                                <div class="col-sm-9">
                                    <input type="password" id="new_password2" class="form-control w210 pull-left">
                                    <span id="new_password_msg2" class="help-block pull-left ml10">确认密码不能为空！</span>
                                </div>
                              </div>
                      
                              <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-9">
                                    
                                    <button class="btn btn-primary mr10 btn-save" type="submit" id="ok">保存</button>
                                    <button class="btn btn-primary mr10 btn-save" type="submit" id="cancel">取消</button>													
                                </div>
                              </div>
                             </div>
        </div>
                       
						</div>
						<!-- /PAGE HEADER -->
					</div><!-- /CONTENT-->
				</div>
			</div>
		</div>
	</section>
	<!--/PAGE -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="${pageContext.request.contextPath}/js/jquery/jquery-2.0.3.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="${pageContext.request.contextPath}/bootstrap-dist/js/bootstrap.min.js"></script>	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="${pageContext.request.contextPath}/js/script.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		$(function(){
			$("#user_name_msg").hide();
			$("#user_password_msg").hide();
			$("#new_password_msg1").hide();
			$("#new_password_msg2").hide();
			
			
			$("#user_name").change(function() {
				var user_name = $("#user_name").val();
				if (user_name == null) {
					$("#user_name_msg").show();
					$("#user_name_msg").parent().parent().addClass("has-error");
				} else {
					$("#user_name_msg").hide();
					$("#user_name_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#password").change(function() {
				var password = $("#password").val();
				if (password == null) {
					$("#user_password_msg").show();
					$("#user_password_msg").parent().parent().addClass("has-error");
				} else {
					$("#user_password_msg").hide();
					$("#user_password_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#new_password1").change(function() {
				var new_password1 = $("#new_password1").val();
				if (new_password1 == null) {
					$("#new_password_msg1").show();
					$("#new_password_msg1").parent().parent().addClass("has-error");
				} else {
					$("#new_password_msg1").hide();
					$("#new_password_msg1").parent().parent().removeClass("has-error");
				}

			});
			
			$("#new_password2").change(function() {
				var new_password2 = $("#new_password2").val();
				if (new_password2 == null) {
					$("#new_password_msg2").show();
					$("#new_password_msg2").parent().parent().addClass("has-error");
				} else {
					$("#new_password_msg2").hide();
					$("#new_password_msg2").parent().parent().removeClass("has-error");
				}

			});
			
			
			
			$("#ok").click(function(){
				var data = new XCO();
				
				var user_name = $("#user_name").val();
				if(user_name){
					data.setStringValue("user_name",user_name);
				}else{
					$("#user_name_msg").show();
					$("#user_name_msg").parent().parent().addClass("has-error");
				}
				
				var password = $("#password").val();
				if(password){
					data.setStringValue("password",password);
				}else{
					$("#user_password_msg").show();
					$("#user_password_msg").parent().parent().addClass("has-error");
				}
				
				var new_password1 = $("#new_password1").val();
				if(new_password1){
					data.setStringValue("new_password1",new_password1);
				}else{
					$("#new_password_msg1").show();
					$("#new_password_msg1").parent().parent().addClass("has-error");
				}
				
				var new_password2 = $("#new_password2").val();
				if(new_password2){
					data.setStringValue("new_password2",new_password2);
				}else{
					$("#new_password_msg2").show();
					$("#new_password_msg2").parent().parent().addClass("has-error");
				}
				
				if(new_password1 != new_password2){
					$("#new_password_msg2").show();
					$("#new_password_msg2").parent().parent().addClass("has-error");
					$("#new_password_msg2").html("两次输入的新密码不一致！！");
				}
				
				if(data.getStringValue("user_name") && data.getStringValue("password") && data.getStringValue("new_password1") && data.getStringValue("new_password2")){
					var options ={
							url:"/login/updatePassword.jhtml",
							data:data,
							success: function(xco){
								if(xco.getCode() == 1){
									alert("修改成功");
									history.go(-1);
								}else if(xco.getCode() == 2){
									alert("旧密码错误");
								}else{
									alert("修改失败");
								}
							}
					};
					$.doXcoRequest(options);
				}
				
			});
			
			$("#cancel").click(function(){
				history.go(-1);
			})
			
		})
		
		
		//initClass("class_name",'');
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
