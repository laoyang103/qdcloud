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
	<section id="page" data-page="room" sub-page="roomstatistics">
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
                                        <li>实验室使用统计</li>
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
                                <select class="form-control w210" id="room_name">
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
                                        <th width="15%">序号</th>
                                        <th width="20%">课节日期</th>
                                        <th width="20%">实验室名称</th>
                                        <th width="15%">使用率</th>
                                        <th width="15%">空闲课节数</th>
                                        <th width="15%">空置率</th>
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
					url:"/room/roomZhanyongList.jhtml",
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
							+'<td>'+_dataList[i].getObjectValue("room_day")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("room_name")+'</td>'
							+'<td>'+checkResult(_dataList[i].getObjectValue("time_id"),_dataList[i].getObjectValue("check_state"))+'</td>'
							+'<td>'+checkState2(_dataList[i].getObjectValue("time_id"),_dataList[i].getObjectValue("check_state"))+'</td>'
							+'<td>'+checkUrl(_dataList[i].getObjectValue("time_id"),_dataList[i].getObjectValue("check_state"))+'</td>'
							+'</tr>')
				}
			}
            if(renderPage){
            	renderPage = false;
            	pageUtil('pagination_1', parseInt(total), doSubmit, pageSize);                    	
            }
			
		}
		
		function checkResult(a,b){
			var i = b/a;
			return (i.toFixed(2)*100).toFixed(0)+"%";
		}
		
		function checkState2(a,b){
			return a-b;
		}
		
		function checkUrl(a,b){
			var i = b/a;
			var c = 1 - i.toFixed(2);
			return (c.toFixed(2)*100).toFixed(0)+"%";
		}
		
		initRoom("room_name",'');
		initTeacher("teacher_name",2,"");
		
		function delroomset(time_id){
			var xco = new XCO();
			xco.setStringValue("time_id", time_id);
			var options ={
					url:"/room/checkOrderById.jhtml",
					data:xco,
					success: function(xco){
						if(xco.getCode() == 0){
							alert(xco.getMessage());
						}else{
							alert(xco.getMessage());
							window.location.href="/view/room/roomtimeorderlist.jsp";
						}
					}
			};
			if(confirm("确定要删除该条记录吗?")){
				$.doXcoRequest(options);
			}
		}
		
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
