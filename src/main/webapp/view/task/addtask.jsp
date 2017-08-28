<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "tasklist";
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
	<section id="page" data-page="task" sub-page="tasklist">
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
                                        <li><a href="/view/task/tasklist.jsp">实验课列表</a></li>
                                        <li>新增实验课</li>
                                    </ul>

                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                    <!-- /BREADCRUMBS -->

                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        <div class="s-pannel mt20">
                           <div role="form" class="form-horizontal font-14">
                              <div class="form-group">
                                <label class="col-sm-3 control-label">实验室名称：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control w210" disabled id="room_name">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">课节日期：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control w210" disabled id="room_day">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">课节时间：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control w210" disabled id="day_time">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">实验课名称：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control w210 pull-left" id="course_name">
                                    <span id="course_name_msg" class="help-block pull-left ml10">实验室编号不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
				                  <label class="col-sm-3 control-label">实验项目：</label>
				                  <div class="col-sm-9">
				                    <select class="form-control w210" id="experiment_name">
				                    </select>
				                  </div>
				              </div>
				              <div class="form-group">
				                  <label class="col-sm-3 control-label">实验习题：</label>
				                  <div class="col-sm-9">
				                    <select class="form-control w210" id="example_name">
				                    </select>
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
	<!--My97DatePicker-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		queryUser();
		
		function queryUser(){
			var xco=new XCO();
			xco.setLongValue("order_id", getURLparam("order_id"));
  			var options ={
					url:"/room/selectOrderRoomTimeById.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
		
		function manage(data){
			$("#room_name").val(data.getStringValue("room_name"));
			$("#room_day").val(data.getStringValue("room_day"));
			$("#day_time").val(rendTime(data.getStringValue("begin_time"),data.getStringValue("end_time")));
		}
		
		function rendTime(begin_time,end_time){
			var s_time = "";
			var e_time = "";
			if(begin_time){
				s_time = begin_time.substring(11,16);
			}
			if(end_time){
				e_time = end_time.substring(11,16);
			}
			return s_time+" - "+e_time;
		}
		
		$(function(){
			$("#course_name_msg").hide();
			
			$("#course_name").change(function() {
				var course_name = $("#course_name").val();
				if (course_name == null) {
					$("#course_name_msg").show();
					$("#course_name_msg").parent().parent().addClass("has-error");
				} else {
					$("#course_name_msg").hide();
					$("#course_name_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#ok").click(function(){
				var data = new XCO();
				data.setLongValue("order_id", getURLparam("order_id"));
				data.setLongValue("time_id", getURLparam("time_id"));
				var course_name = $("#course_name").val();
				if(course_name){
					data.setStringValue("course_name",course_name);
				}else{
					$("#course_name_msg").show();
					$("#course_name_msg").parent().parent().addClass("has-error");
				}
				
				var experiment_id = $("#experiment_name").val();
				if(experiment_id){
					data.setLongValue("experiment_id",experiment_id);
				}else{
					alert("请选择实验课程");
					return;
				}
				
				var example_id = $("#example_name").val();
				if(example_id){
					data.setLongValue("example_id",example_id);
				}else{
					alert("请选择实验习题");
					return;
				}
				
				var options ={
						url:"/task/insertTask.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0 || xco.getCode() == 5){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/task/tasklist.jsp";
							}
						}
				};
				
				$.doXcoRequest(options);
				
			});
			
			$("#cancel").click(function(){
				window.location.href="/view/task/tasklist.jsp";
			})
			
		})

		initExample("example_name","");
		initExperiment("experiment_name","")
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
