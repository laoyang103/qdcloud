<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "studenttasklist";
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
	<section id="page" data-page="studenttask" sub-page="studenttasklist">
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
                                            <a href="/view/message/msglist.jsp">Home</a>
                                        </li>
                                        <li><a href="/view/studenttask/tasklist.jsp">学生实验课列表</a></li>
                                        <li>上课中</li>
                                    </ul>
                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        	<div class="s-box mt20">
					              <h4>实验流程：</h4>
					              <div class="text-center item bgWhite box-lc" style="width:680px;"><img src="${pageContext.request.contextPath}/img/logo/sylc.png"></div>
					              <!-- 
					              <div class="font-16 item mt10 box-content" id="remark">
					               </div>
					               -->
					               <h4>附件下载：</h4>
					              <div class="mt20 file-box pos-r"> <a class="blue font-16" href="#" id="file_url3"><i class="fa fa-file"></i><span class="hui666 ml5" id="file_name3">3D实验xxx.rar </span>下载文件</a> <br class="clear">
					              <div class="mt20 file-box pos-r"> <a class="blue font-16" href="#" id="file_url"><i class="fa fa-file"></i><span class="hui666 ml5" id="file_name">3D实验xxx.rar </span>下载文件</a> <br class="clear">
					              </div>
					              <div class="mt20"><a href="#" id="next" class="btn btn-primary btn-save">下一步</a> <a id="back" class="btn btn-primary btn-save">返回</a> </div></div>
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
	<!--My97DatePicker-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		$(function(){
			$("#cancel").click(function(){
				window.location.href="/view/task/tasklist.jsp";
			});
			
			$("#back").click(function(){
				window.location.href="/view/studenttask/viewtask.jsp?course_id="+getURLparam("course_id")+"&student_id="+getURLparam("student_id")+"&order_id="+getURLparam("order_id")+"&time_id="+getURLparam("time_id");
			});
			
			$("#next").attr("href","downtask.jsp?course_id="+getURLparam("course_id")+"&student_id="+getURLparam("student_id")+"&order_id="+getURLparam("order_id")+"&time_id="+getURLparam("time_id"));
		});
		
		queryUser();
		
		function queryUser(){
			var xco=new XCO();
			xco.setIntegerValue("course_id", getURLparam("course_id"));
  			var options ={
					url:"/task/selectExpByCourseId.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
		
		function manage(xco){
			//$("#remark").html(xco.getStringValue("remark"));
			$("#file_name3").text(xco.getStringValue("file_name3"));
			$("#file_url3").attr("href","../../"+xco.getStringValue("file_url3"));
			$("#file_name").text(xco.getStringValue("file_name"));
			$("#file_url").attr("href","../../"+xco.getStringValue("file_url"));
		}
		
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
