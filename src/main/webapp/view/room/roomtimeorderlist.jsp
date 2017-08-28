<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "roomorderlist";
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
	<section id="page" data-page="room" sub-page="roomorderlist">
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
                                        <li>实验室预约审核</li>
                                    </ul>
                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                    <!-- /BREADCRUMBS -->

                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        <div class="s-pannel mt20">
                        	
							<div role="form" class="form-inline ">
                              <div class="form-group mr15">
                                <select class="form-control w210" id="room_name">
                                	<option value="">选择实验室</option>
				                </select>
                              </div>
                              <div class="form-group mr15">
                                <input id="room_day" class="form-control Wdate w160" placeholder="选择课节日期" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/> 
                              </div>
                              <div class="form-group mr15">
                                <select class="form-control w210" id="teacher_name">
                                	<option value="">选择教师</option>
				                </select>
                              </div>
                              <button class="btn btn-primary mr10" id="serach"><i class="fa fa-search fa-fw"></i>搜索</button>
                              
                            </div>
                            
                           
                            </div>
                            <div class="t-wrap mt20">
                            	<table class="table table-bordered table-striped center">
                                    <thead>
                                      <tr>
                                        <th width="10%">序号</th>
                                        <th width="15%">教师名字</th>
                                        <th width="15%">实验室名称</th>
                                        <th width="10%">课节日期</th>
                                        <th width="15%">课节时间</th>
                                        <th width="10%">状态</th>
                                        <th width="10%">审核结果</th>
                                        <th width="15%">操作</th>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
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
			
		});
		
		 //分页查询表格
		doSubmit(0,pageSize); 
		 
		var renderPage = true;
		
		function formPara(xco){
			var room_id = $("#room_name").val();
   			if(room_id){
   				xco.setStringValue("room_id",room_id);
   			}
   			var room_day = $("#room_day").val();
   			if(room_day){
   				xco.setStringValue("room_day",room_day);
   			}
   			var teacher_id = $("#teacher_name").val();
   			if(teacher_id){
   				xco.setLongValue("teacher_id",teacher_id);
   			}
   			return xco;
   		}
		
		function doSubmit(start,pageSize){
			var xco=new XCO();
			
			//查询条件
			var data=formPara(xco);
			//传分页条件
			xco.setIntegerValue("start",start);
			xco.setIntegerValue("pageSize",pageSize);
  			var options ={
					url:"/room/roomtimeorderlist.jhtml",
					data:data,
					success: manage
			};
			$.doXcoRequest(options);					
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
							+'<td>'+_dataList[i].getObjectValue("teacher_name")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("room_name")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("room_day")+'</td>'
							+'<td>'+rendTime(_dataList[i].getObjectValue("begin_time"),_dataList[i].getObjectValue("end_time"))+'</td>'
							+'<td>'+checkState(_dataList[i].getObjectValue("check_state"))+'</td>'
							+'<td>'+checkResult(_dataList[i].getObjectValue("audit_state"))+'</td>'
							+'<td>'+checkUrl(_dataList[i].getObjectValue("audit_state"),_dataList[i].getObjectValue("order_id"))+'</td>'
							+'</tr>')
				}
			}
            if(renderPage){
            	renderPage = false;
            	pageUtil('pagination_1', parseInt(total), doSubmit, pageSize);                    	
            }
			
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
		
		function checkResult(state){
			if(state == 10){
				return "审核中";
			}else if(state == 30){
				return "审核未通过";
			}else{
				return "审核通过";
			}
		}
		
		function checkState(state){
			if(state == 1){
				return '空闲';
			}else{
				return '已预约';
			}
		}
		
		function checkUrl(state,order_id){
			//return '<a href="#?time_id='+time_id+'">编辑</a><a href="javascript:delroomset('+time_id+');" style="margin-left:20px;">删除</a>';
			if(state == 10){
				return '<a href="javascript:delroomset('+order_id+');">审核</a>';
			}else if(state == 30){
				return '<a href="javascript:lookroomset('+order_id+');">查看</a>';
			}else{
				return "";
			}
		}
		
		initRoom("room_name",'');
		initTeacher("teacher_name",2,"");
		
		function delroomset(order_id){
			layer.open({
				type: 2,
				title: "审核",
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ["560px" , "320px"],
				content: ["/view/room/shenheinfo.jsp?order_id="+order_id,"no"]
			});
		}
		
		function lookroomset(order_id){
			layer.open({
				type: 2,
				title: "查看",
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ["560px" , "320px"],
				content: ["/view/room/viewshenhe.jsp?order_id="+order_id,"no"]
			});
		}
		
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
