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
	<section id="page" data-page="studenttask" sub-page="yuyuelist">
		<!--#include virtual="/BIsystem/include/side.html"-->
		<div id="main-content">
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						<!-- PAGE HEADER-->
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
                                        <li>学生预约课列表</li>
                                    </ul>
                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        <div class="s-pannel mt20">
                        	
							<div role="form" class="form-inline ">
							  <div class="form-group mr15">
                                <select class="form-control w160" id="teacher_name">
                                	<option value="">选择教师</option>
				                </select>
                              </div>
                              <div class="form-group mr15">
                                <select class="form-control w160" id="room_name">
                                	<option value="">选择实验室</option>
				                </select>
                              </div>
                              <div class="form-group mr15">
                                <input id="room_day" class="form-control Wdate w160" placeholder="选择课节日期" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/> 
                              </div>
                              
                              <button class="btn btn-primary mr10" id="serach"><i class="fa fa-search fa-fw"></i>搜索</button>
                              
                            </div>
                            
                           
                            </div>
                            <div class="t-wrap mt20">
                            	<table class="table table-bordered table-striped center">
                                    <thead>
                                      <tr>
                                        <th width="5%">序号</th>
                                        <th width="10%">教师名称</th>
                                        <th width="15%">实验室名称</th>
                                        <th width="15%">实验项目</th>
                                        <th width="5%">课位</th>
                                        <th width="10%">可约课位</th>
                                        <th width="15%">课节日期</th>
                                        <th width="15%">课节时间</th>
                                        <th width="10%">操作</th>
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
		
		initTeacher("teacher_name",2,"");
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
					url:"/task/courseyuyuelist.jhtml",
					data:data,
					success: manage
			};
			$.doXcoRequest(options);
								
		}
        
       	function formPara(xco){
       		var teacher_id = $("#teacher_name").val();
   			if(teacher_id){
   				xco.setLongValue("teacher_id",teacher_id);
   			}
   			var room_id = $("#room_name").val();
   			if(room_id){
   				xco.setLongValue("room_id",room_id);
   			}
   			var room_day = $("#room_day").val();
   			if(room_day){
   				xco.setStringValue("room_day",room_day);
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
							+'<td>'+_dataList[i].getStringValue("teacher_name")+'</td>'
							+'<td>'+_dataList[i].getStringValue("room_name")+'</td>'
							+'<td>'+_dataList[i].getStringValue("ename")+'</td>'
							+'<td>'+_dataList[i].getStringValue("place_count")+'</td>'
							+'<td>'+subb(_dataList[i].getStringValue("place_count"),_dataList[i].getStringValue("place_ok_count"))+'</td>'
							+'<td>'+sub(_dataList[i].getStringValue("begin_time"))+'</td>'
							+'<td>'+rendTime(_dataList[i].getStringValue("begin_time"),_dataList[i].getStringValue("end_time"))+'</td>'
							+'<td>'+checkUrl(_dataList[i].getStringValue("course_id"),_dataList[i].getStringValue("class_id"),_dataList[i].getObjectValue("time_id"))+'</td>'
							+'</tr>')
				}
			}
            if(renderPage){
            	renderPage = false;
            	pageUtil('pagination_1', parseInt(total), doSubmit, pageSize);                    	
            }
			
		} 
		
		function sub(begin_time){
			var s_time = "";
			if(begin_time){
				s_time = begin_time.substring(0,10);
			}
			return s_time;
		}
		
		function subb(a_time,b_time){
			return a_time - b_time;
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
		
		function checkUrl(course_id,class_id,time_id){
			return '<a href="/view/studenttask/addcourseorder.jsp?course_id='+course_id+'&class_id='+class_id+'&time_id='+time_id+'">预约</a>'; 
		}
		
		initRoom("room_name",'');
	
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
