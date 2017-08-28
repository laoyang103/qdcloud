<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "classlist";
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
	<section id="page" data-page="clazz" sub-page="classlist">
		<!--#include virtual="/BIsystem/include/side.html"-->
		<div id="main-content">
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						<div class="row">
                            <div class="col-sm-12">
                                <div class="page-header">
                                    <!-- BREADCRUMBS -->
                                    <ul class="breadcrumb pull-left">
                                        <li>
                                            <i class="fa fa-home"></i>
                                            <a href="/view/message/msgadminlist.jsp">Home</a>
                                        </li>
                                        <li><a href="/view/class/classlist.jsp">班级列表</a></li>
                                        <li>编辑班级</li>
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
                                <label class="col-sm-3 control-label">班号：</label>
                                <div class="col-sm-9">
                                  <input type="text" value="" id="class_code" class="form-control w210 pull-left" disabled>
                                  <span id="class_code_msg" class="help-block pull-left ml10">班号不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">班级名称：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="class_name" class="form-control w210 pull-left">
                                    <span id="class_name_msg" class="help-block pull-left ml10">班级名称不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">院系：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="department_name" class="form-control w210 pull-left">
                                    <span id="department_name_msg" class="help-block pull-left ml10">院系名称不能为空！</span>
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

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		queryUser();
		
		function queryUser(){
			var xco=new XCO();
			xco.setIntegerValue("class_id", getURLparam("class_id"));
  			var options ={
					url:"/class/selectClassById.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
		
		//渲染单个对象
		function manage(xco){
			$("#class_code").val(xco.getStringValue("class_code"));
			$("#class_name").val(xco.getStringValue("class_name"));
			$("#department_name").val(xco.getStringValue("department_name"));
		}
		
		$(function(){
			
			$("#class_code_msg").hide();
			$("#class_name_msg").hide();
			$("#department_name_msg").hide();
			
			$("#class_code").change(function() {
				var class_code = $("#class_code").val();
				if (class_code == null) {
					$("#class_code_msg").show();
					$("#class_code_msg").parent().parent().addClass("has-error");
				} else {
					$("#class_code_msg").hide();
					$("#class_code_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#class_name").change(function() {
				var class_name = $("#class_name").val();
				if (class_name == null) {
					$("#class_name_msg").show();
					$("#class_name_msg").parent().parent().addClass("has-error");
				} else {
					$("#class_name_msg").hide();
					$("#class_name_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#department_name").change(function() {
				var department_name = $("#department_name").val();
				if (department_name == null) {
					$("#department_name_msg").show();
					$("#department_name_msg").parent().parent().addClass("has-error");
				} else {
					$("#department_name_msg").hide();
					$("#department_name_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#ok").click(function(){
				var data = new XCO();
				data.setIntegerValue("class_id",getURLparam("class_id"));
				var class_code = $("#class_code").val();
				if(class_code){
					data.setStringValue("class_code",class_code);
				}else{
					$("#class_code_msg").show();
					$("#class_code_msg").parent().parent().addClass("has-error");
				}
				
				var class_name = $("#class_name").val();
				if(class_name){
					data.setStringValue("class_name",class_name);
				}else{
					$("#class_name_msg").show();
					$("#class_name_msg").parent().parent().addClass("has-error");
				}
				
				var department_name = $("#department_name").val();
				if(department_name){
					data.setIntegerValue("department_id",1);
					data.setStringValue("department_name",department_name);
				}else{
					$("#department_name_msg").show();
					$("#department_name_msg").parent().parent().addClass("has-error");
				}
				var options ={
						url:"/class/updateClass.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/class/classlist.jsp";
							}
						}
				};
				$.doXcoRequest(options);
				
			});
			
			$("#cancel").click(function(){
				window.location.href="/view/class/classlist.jsp";
			});

			
		});
		
		
		initDept("department_name",'');
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
