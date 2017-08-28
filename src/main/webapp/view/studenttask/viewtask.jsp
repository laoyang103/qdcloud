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
                                        <li>开始上课</li>
                                    </ul>
                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        <div class="s-pannel mt20">
                           <div role="form" class="form-horizontal font-14">
                              <div class="form-group">
                                <label class="col-sm-3 control-label">任务名称：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control w210" disabled id="course_name">
                                </div>
                              </div>
                              <div class="form-group">
				                  <label class="col-sm-3 control-label">实验课程：</label>
				                  <div class="col-sm-9">
				                    <select class="form-control w210" disabled id="experiment_name">
				                    </select>
				                  </div>
				              </div>
				              <div class="form-group">
				                  <label class="col-sm-3 control-label">实验习题：</label>
				                  <div class="col-sm-9">
				                    <select class="form-control w210" disabled id="example_name">
				                    </select>
				                  </div>
				              </div>
				              <div class="form-group">
				                  <label class="col-sm-3 control-label">开始时间：</label>
				                  <div class="col-sm-9">
				                    <label class="calendarWrap pos-r">
				                      <input onClick="WdatePicker()" type="text" disabled class="form-control w210" id="begin_time">
				                      <i class="fa fa-calendar pos-a"></i></label>
				                  </div>
				               </div>
				               <div class="form-group">
				                  <label class="col-sm-3 control-label">结束时间：</label>
				                  <div class="col-sm-9">
				                    <label class="calendarWrap pos-r">
				                      <input onClick="WdatePicker()" type="text" disabled class="form-control w210" id="end_time">
				                      <i class="fa fa-calendar pos-a"></i></label>
				                  </div>
				               </div>
				               <!-- 
                              <div class="form-group">
                                <label class="col-sm-3 control-label">参加班级：</label>
                                <div class="col-sm-9">
                                    <select class="form-control w210" disabled id="class_name">
                                    </select>			
                                </div>
                              </div>
				                -->
                              <div class="form-group">
				                  <label class="col-sm-3 control-label">上课教室：</label>
				                  <div class="col-sm-9">
				                    <select class="form-control w210" disabled id="room_name">
				                    </select>
				                  </div>
				              </div>
				              <!-- 
                              <div class="form-group">
				                  <label class="col-sm-3 control-label">实验学生：</label>
				                  <div class="col-sm-9">
				                    <textarea class="form-control" style="width:620px;" rows="7" id="names" disabled></textarea>
				                  </div>
				              </div>
				               -->
                              <div class="form-group">
				                  <label class="col-sm-3 control-label"></label>
				                  <div class="col-sm-9">
				                  	<a id="qiandao" class="btn btn-primary btn-save ml5">上课签到</a>
				                    <a href="#" id="lilun" class="btn btn-primary btn-save ml5">学前理论</a>
				                    <a href="#"  id="downwork" class="btn btn-primary btn-save ml5">实验操作</a>
				                    <a href="#"  id="zuoye" class="btn btn-primary btn-save ml5">习题作业</a>
				                    <!-- 
				                    <a href="#"  id="zuoyejieguo" class="btn btn-primary btn-save ml5">作业结果</a>
				                     -->
				                    <a href="#"  id="jieguo" class="btn btn-primary btn-save ml5">实验报告</a>
				                    <!-- 
				                    <a href="#"  id="baogaojieguo" class="btn btn-primary btn-save ml5">报告结果</a>
				                     -->
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
	<!--My97DatePicker-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
        queryUser2();
		
		function queryUser2(){
			
			var xco=new XCO();
			xco.setIntegerValue("order_id", getURLparam("order_id"));
  			var options ={
					url:"/task/selectOrderRoomById.jhtml",
					data:xco,
					success: function(xco){
						if(xco.getIntegerValue("check_work") == 1){
							$("#qiandao").off("click"); 
							$("#qiandao").css("background-color","#ccc");
							$("#downwork").attr("href","downtask.jsp?course_id="+getURLparam("course_id")+"&student_id="+getURLparam("student_id")+"&order_id="+getURLparam("order_id")+"&time_id="+getURLparam("time_id"));
							$("#lilun").attr("href","theorytask.jsp?course_id="+getURLparam("course_id")+"&student_id="+getURLparam("student_id")+"&order_id="+getURLparam("order_id")+"&time_id="+getURLparam("time_id"));
							$("#liulan").attr("href","looktask.jsp?course_id="+getURLparam("course_id")+"&student_id="+getURLparam("student_id")+"&order_id="+getURLparam("order_id")+"&time_id="+getURLparam("time_id"));
							$("#zuoye").attr("href","worktask.jsp?course_id="+getURLparam("course_id")+"&student_id="+getURLparam("student_id")+"&order_id="+getURLparam("order_id")+"&time_id="+getURLparam("time_id"));
							//$("#zuoyejieguo").attr("href","exampleresult.jsp?course_id="+getURLparam("course_id")+"&student_id="+getURLparam("student_id")+"&order_id="+getURLparam("order_id")+"&time_id="+getURLparam("time_id"));
							$("#jieguo").attr("href","resulttask.jsp?course_id="+getURLparam("course_id")+"&student_id="+getURLparam("student_id")+"&order_id="+getURLparam("order_id")+"&time_id="+getURLparam("time_id"));
							//$("#baogaojieguo").attr("href","reportresult.jsp?course_id="+getURLparam("course_id")+"&student_id="+getURLparam("student_id")+"&order_id="+getURLparam("order_id")+"&time_id="+getURLparam("time_id"));
						}else{
							$("#downwork").hide();
							$("#lilun").hide();
							$("#liulan").hide();
							$("#zuoye").hide();
							$("#jieguo").hide();
							//$("#baogaojieguo").hide();
							//$("#zuoyejieguo").hide();
						}
					}
			};
			$.doXcoRequest(options);					
		}
		
		
		$(function(){
			$("#cancel").click(function(){
				window.location.href="/view/task/tasklist.jsp";
			});
			$("#qiandao").click(function(){
				$(this).off("click"); 
				var xco=new XCO();
				xco.setLongValue("course_id", getURLparam("course_id"));
				xco.setLongValue("order_id", getURLparam("order_id"));
				xco.setLongValue("time_id", getURLparam("time_id"));
	  			var options ={
						url:"/task/updateCheckWorkState.jhtml",
						data:xco,
						success: function(xco){
							if(xco.getCode() == 0 || xco.getCode() == 3 || xco.getCode() == 4){
								window.location.reload();
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.reload();
							}
						}
				};
				$.doXcoRequest(options);
			});
			
		});
		
		queryUser();
		
		function queryUser(){
			var xco=new XCO();
			xco.setIntegerValue("course_id", getURLparam("course_id"));
  			var options ={
					url:"/task/selectTaskById.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
		
		function manage(xco){
			$("#course_name").val(xco.getStringValue("course_name"));
			$("#begin_time").val(xco.getStringValue("begin_time"));
			$("#end_time").val(xco.getStringValue("end_time"));
			$("#names").val(xco.getStringValue("names"));
			//alert(xco.getStringValue("class_id"));
			//initClass("class_name",xco.getStringValue("class_id"));
			initRoom("room_name",xco.getStringValue("room_id"));
			initExample("example_name",xco.getStringValue("example_id"));
			initExperiment("experiment_name",xco.getStringValue("experiment_id"));
			
		}
		
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
