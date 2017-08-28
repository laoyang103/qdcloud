<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "worklist";
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
	<section id="page" data-page="task" sub-page="worklist">
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
                                        <li>作业列表</li>
                                    </ul>
                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        <div class="s-pannel mt20">
							<div role="form" class="form-inline " style="width:1000px;">
				                <div class="form-group mr15">
				                  <label for="stuName" class="sr-only">任务名称</label>
				                  <input type="text" placeholder="任务名称" id="course_name" class="form-control w160">
				                </div>
				                <div class="form-group mr15">
				                  <label for="stuName" class="sr-only">实验名称</label>
				                  <input type="text" placeholder="实验名称" id="experiment_name" class="form-control w160">
				                </div>
				                <div class="form-group mr15">
	                              	<select class="form-control w160" id="class_name">
	                                  <option value="">-选择班级-</option>
	                                </select>
	                            </div>
				                <div class="form-group mr15">
				                    <input type="text" onClick="WdatePicker()" placeholder="起始日期" id="begin_time" class="form-control w160">
				                    <span>~</span>
				                    <input type="text" onClick="WdatePicker()" placeholder="结束日期" id="end_time" class="form-control w160">
				                </div>
                             
                              <button class="btn btn-primary mr10" id="serach"><i class="fa fa-search fa-fw"></i>搜索</button>
                            </div>
                            
                           
                            </div>
                            <div class="t-wrap mt20">
                            	<table class="table table-bordered table-striped center">
                                    <thead>
                                      <tr>
                                      	<th width="6%">编号</th>
                                        <th width="12%">任务名称</th>
					                    <th width="12%">实验名称</th>
					                    <th width="10%">班级</th>
					                    <th width="12%">参加学生</th>
					                    <th width="14%">开始时间</th>
					                    <th width="14%">结束时间</th>
					                    <th width="6%">状态</th>
					                    <th width="6%">得分</th>
					                    <th width="8%">操作</th>
					                  </tr>
                                    </thead>
                                    <tbody id="datatable">

                                	</tbody>
                                  </table>
                            </div>
                            <jsp:include page="../common/page.jsp"/>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jqPaginator.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		$(function(){
			$("#serach").click(function(){
				renderPage = true;
				doSubmit(0,pageSize);
			});
		})
		
		 //分页查询表格
		doSubmit(0,pageSize); 	
    		
		var renderPage = true;
		function doSubmit(start,pageSize){
			var xco=new XCO();
			
			//查询条件
			var data=formPara(xco);
			//传分页条件
			xco.setIntegerValue("start",start);
			xco.setIntegerValue("pageSize",pageSize);
  			var options ={
					url:"/task/studentCourselist.jhtml",
					data:data,
					success: manage
			};
			$.doXcoRequest(options);
								
		}
        
       	function formPara(xco){
   			var course_name = $("#course_name").val();
   			if(course_name){
   				xco.setStringValue("course_name",course_name);
   			}
   			var experiment_name = $("#experiment_name").val();
   			if(experiment_name){
   				xco.setStringValue("experiment_name",experiment_name);
   			}
   			var class_id = $("#class_name").val();
   			if(class_id){
   				xco.setStringValue("class_id",class_id);
   			}
   			var begin_time = $("#begin_time").val();
   			if(begin_time){
   				xco.setStringValue("begin_time",begin_time);
   			}
   			var end_time = $("#end_time").val();
   			if(end_time){
   				xco.setStringValue("end_time",end_time);
   			}
   			return xco;
   		}
   
        
		function manage(xco){
			var total = 0;
			if(xco.getIntegerValue("total")){
				total = xco.getIntegerValue("total");
			}
            var _dataList = xco.getXCOListValue("data");
            var tdIndex = 1;
            $("#datatable").html("");
            if(_dataList){
				var tdIndex = 1;
				for ( var i = 0; i < _dataList.length; i++) {
					$("#datatable").append('<tr>'
						+'<td>'+(tdIndex++)+'</td>'
							+'<td>'+_dataList[i].getObjectValue("course_name")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("experiment_name")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("class_name")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("student_name")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("begin_time")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("end_time")+'</td>'
							+'<td>'+checkState(_dataList[i].getObjectValue("example_checked"))+'</td>'
							+'<td>'+checkScore(_dataList[i].getObjectValue("example_score"))+'</td>'
							+'<td>'+checkUrl(_dataList[i].getObjectValue("course_student_id"),_dataList[i].getObjectValue("example_flag"),_dataList[i].getObjectValue("example_score"))+'</td>'
							+'</tr>')
				}
			}
            if(renderPage){
            	renderPage = false;
            	pageUtil('pagination_1', parseInt(total), doSubmit, pageSize);                    	
            }
			
		}  
		function checkState(param){
			if(param==0){
				return "未批改";
			}
			return "已批改";
		}    
		
		function checkScore(param){
			if(param==0){
				return " ";
			}
			return param+"分";
		} 
		
		function checkUrl(course_student_id,param,score){
			if(param==1){
				if(score != 0){
					return '<a href="/view/work/viewwork.jsp?course_student_id='+course_student_id+'">查看</a>';
				}else{
					return '<a href="/view/work/viewwork.jsp?course_student_id='+course_student_id+'">查看</a>&nbsp;&nbsp;<a href="/view/work/editwork.jsp?course_student_id='+course_student_id+'">批改</a>';
				}
			}else{
				return '<a href="/view/work/viewwork.jsp?course_student_id='+course_student_id+'">查看</a>';
			}
		}
		
		initClass("class_name",'');
	
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
