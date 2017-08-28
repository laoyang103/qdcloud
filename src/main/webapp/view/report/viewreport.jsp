<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "reportlist";
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
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/themes/night.min.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/responsive.css" >
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/kindeditor-4.1.7/themes/default/default.css" />
	<!-- FONTS -->
	<link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- ANIMATE -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animatecss/animate.min.css" />	
</head>
<body>
<!--#include virtual="/BIsystem/include/header.html"-->
	
	<!-- PAGE -->
	<section id="page" data-page="task" sub-page="reportlist">
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
                                            <a href="/view/message/msglist.jsp">Home</a>
                                        </li>
                                        <li><a href="/view/report/reportlist.jsp">报告列表</a></li>
                                        <li>查看报告</li>
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
                                <label class="col-sm-3 control-label">任务名称：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control w210" disabled id="course_name">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">学生姓名：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control tip w210" disabled id="student_name">
                                </div>
                              </div>
                              <div class="form-group">
				                  <label class="col-sm-3 control-label">班级：</label>
				                  <div class="col-sm-9">
				                    <input type="text"  disabled class="form-control w210 mr10 pull-left" id="class_name">
				                  </div>
				              </div>
				              <div class="form-group">
				                  <label class="col-sm-3 control-label">实验名称：</label>
				                  <div class="col-sm-9">
				                    <input type="text"  disabled class="form-control w210 mr10 pull-left" id="experiment_name">
				                  </div>
				              </div>
				              <div class="form-group">
				                  <label class="col-sm-3 control-label">实验习题：</label>
				                  <div class="col-sm-9">
				                    <input type="text"  disabled class="form-control w210 mr10 pull-left" id="example_name">
				                  </div>
				              </div>
				              <div class="form-group">
				                  <label class="col-sm-3 control-label">开始时间：</label>
				                  <div class="col-sm-9">
				                    <input type="text"  disabled class="form-control w210 mr10 pull-left" id="begin_time">
				                  </div>
				              </div>
				              <div class="form-group">
				                  <label class="col-sm-3 control-label">结束时间：</label>
				                  <div class="col-sm-9">
				                    <input type="text"  disabled class="form-control w210 mr10 pull-left" id="end_time">
				                  </div>
				              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">报告内容：</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" rows="7" name="experiment_report" id="experiment_report" style="width:800px;height:400px;visibility:hidden;"></textarea>
                                </div>
                              </div>
                               <div class="form-group">
				                  <label class="col-sm-3 control-label">报告得分：</label>
				                  <div class="col-sm-9">
				                    <input type="text" class="form-control w210 pull-left" disabled id="experiment_score">
				                    <span class="pull-left ml5 mt10">分</span>
				                    <br class="clear"/>
				                  </div>
				                </div>
				                <div class="form-group">
				                  <label class="col-sm-3 control-label">报告评语：</label>
				                  <div class="col-sm-9">
				                    <textarea class="form-control" disabled rows="7" id="experiment_comment"></textarea>
				                  </div>
				                </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-9">
                                    <button class="btn btn-primary mr10 btn-save" type="submit" id="cancel">返回</button>													
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		var eparam;
		KindEditor.ready(function(K) {
			eparam = K.create('textarea[name="experiment_report"]', {
				resizeType : 1,
				readonlyMode : true,
				items : []
			});
			var autoheight1=eparam.edit.doc.body.scrollHeight;
			eparam.edit.setHeight(autoheight1);
			
			$('.ke-contaner').hide();
			$('.ke-toolbar').hide();
			$('.ke-statusbar').hide();
		});
		
		
		queryUser();
		
		function queryUser(){
			var xco=new XCO();
			xco.setIntegerValue("course_student_id", getURLparam("course_student_id"));
  			var options ={
					url:"/task/studentShangkeById2.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
		
		function manage(xco){
			$("#course_name").val(xco.getStringValue("course_name"));
			$("#student_name").val(xco.getStringValue("student_name"));
			$("#class_name").val(xco.getStringValue("class_name"));
			$("#experiment_name").val(xco.getStringValue("experiment_name"));
			$("#example_name").val(xco.getStringValue("example_name"));
			$("#begin_time").val(xco.getStringValue("begin_time"));
			$("#end_time").val(xco.getStringValue("end_time"));
			eparam.insertHtml(xco.getStringValue("experiment_report"));
			$("#experiment_score").val(xco.getStringValue("experiment_score"));
			$("#experiment_comment").val(xco.getStringValue("experiment_comment"));
		}
		
		function htmlencode(s){  
		    var div = document.createElement('div');  
		    div.appendChild(document.createTextNode(s));  
		    return div.innerHTML;  
		} 
		
		function htmldecode(s){  
		    var div = document.createElement('div');  
		    div.innerHTML = s;  
		    return div.innerText || div.textContent;  
		}
		
		$(function(){
			$("#cancel").click(function(){
				window.location.href="/view/report/reportlist.jsp";
			})
		})
		
		//initType("type_name",'');
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
