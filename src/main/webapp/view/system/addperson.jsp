<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "personlist";
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
	<section id="page" data-page="system" sub-page="personlist">
		<!--#include virtual="/BIsystem/include/side.html"-->
		<div id="main-content">
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						<!-- PAGE HEADER-->
						<div class="row">
                            <div class="col-sm-12">
                                <div class="page-header">
                                    <!-- BREADCRUMBS -->
                                    <ul class="breadcrumb pull-left">
                                        <li>
                                            <i class="fa fa-home"></i>
                                            <a href="/view/message/msgadminlist.jsp">Home</a>
                                        </li>
                                        <li><a href="/view/system/personlist.jsp">人员权限管理</a></li>
                                        <li>新增管理员</li>
                                    </ul>

                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                    <!-- /BREADCRUMBS -->

                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        <div class="s-pannel margin-top-50">
                        	
                           <div role="form" class="form-horizontal font-14">
                              <div class="form-group">
                                <label class="col-sm-3 control-label">账号：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="user_name" class="form-control w210 pull-left">
                                    <span id="user_name_msg" class="help-block pull-left ml10">账号不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">密码：</label>
                                <div class="col-sm-9">
                                    <input type="password" id="password" class="form-control w210 pull-left">
                                    <span id="user_password_msg" class="help-block pull-left ml10">密码不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">姓名：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="real_name" class="form-control w210 pull-left">
                                    <span id="real_name_msg" class="help-block pull-left ml10">姓名不能为空！</span>
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
			$("#real_name_msg").hide();
			
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
			
			$("#real_name").change(function() {
				var real_name = $("#real_name").val();
				if (real_name == null) {
					$("#real_name_msg").show();
					$("#real_name_msg").parent().parent().addClass("has-error");
				} else {
					$("#real_name_msg").hide();
					$("#real_name_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#ok").click(function(){
				var data = new XCO();
				data.setIntegerValue("type",3);
				data.setIntegerValue("class_id",0);
				data.setStringValue("class_name","");
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
				
				var real_name = $("#real_name").val();
				if(real_name){
					data.setStringValue("real_name",real_name);
				}else{
					$("#real_name_msg").show();
					$("#real_name_msg").parent().parent().addClass("has-error");
				}
				
				var options ={
						url:"/user/insertUser.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/system/personlist.jsp";
							}
						}
				};
				$.doXcoRequest(options);
				
			});
			
			$("#cancel").click(function(){
				window.location.href="/view/system/personlist.jsp";
			})
			
		})
		
		
		//initClass("class_name",'');
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
