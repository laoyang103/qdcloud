<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "roomsetlist";
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
	<section id="page" data-page="room" sub-page="roomsetlist">
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
                                        <li>实验室时间设置</li>
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
                                 <input id="begin_time" class="form-control Wdate" placeholder="起始日期" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'%y-%M-%d',maxDate:'#F{$dp.$D(\'end_time\')}'})" style="width:160px;" /> 
                              </div>
                               <div class="form-group mr15">
                                 <input id="end_time" class="form-control Wdate" placeholder="结束日期" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'begin_time\')||\'%y-%M-{%d+1}\'}',startDate:'#F{$dp.$D(\'begin_time\',{d:+1})}'})" style="width:160px;" /> 
                              </div>
                              
                              <button class="btn btn-primary mr10" id="serach"><i class="fa fa-search fa-fw"></i>搜索</button>
                              <a href="/view/room/roomsetlist.jsp" class="btn btn-danger ml10" type="button"><i class="fa fa-plus fa-fw"></i>批量生成</a>
                              <!-- 
                              <button class="btn btn-danger ml10" type="button" id="delRoom"><i class="fa fa-trash-o fa-fw"></i>删除</button>
                               -->
                            </div>
                            
                           
                            </div>
                            <div class="t-wrap mt20">
                            	<table class="table table-bordered table-striped center">
                                    <thead>
                                      <tr>
                                        <th width="15%">实验室编号</th>
                                        <th width="20%">实验室名称</th>
                                        <th width="15%">课节日期</th>
                                        <th width="15%">课节时间</th>
                                        <th width="15%">状态</th>
                                        <th width="20%">操作</th>
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
		
		function doSubmit(start,pageSize){
			var xco=new XCO();
			
			//查询条件
			var data=formPara(xco);
			//传分页条件
			xco.setIntegerValue("start",start);
			xco.setIntegerValue("pageSize",pageSize);
			xco.setIntegerValue("flag",0);
  			var options ={
					url:"/room/roomtimelist.jhtml",
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
							+'<td>'+_dataList[i].getObjectValue("room_code")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("room_name")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("room_day")+'</td>'
							+'<td>'+rendTime(_dataList[i].getObjectValue("begin_time"),_dataList[i].getObjectValue("end_time"))+'</td>'
							+'<td>'+checkState(_dataList[i].getObjectValue("check_state"))+'</td>'
							+'<td>'+checkUrl(_dataList[i].getObjectValue("time_id"))+'</td>'
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
		
		function checkState(state){
			if(state == 1){
				return '空闲';
			}else{
				return '已预约';
			}
		}
		
		function checkUrl(time_id){
			//return '<a href="#?time_id='+time_id+'">编辑</a><a href="javascript:delroomset('+time_id+');" style="margin-left:20px;">删除</a>';
			return '<a href="javascript:delroomset('+time_id+');">删除</a>';
		}
		
		initRoom("room_name",'');
		
		function delroomset(time_id){
			var xco = new XCO();
			xco.setStringValue("time_id", time_id);
			var options ={
					url:"/room/deleteRoomTimeById.jhtml",
					data:xco,
					success: function(xco){
						if(xco.getCode() == 0){
							alert(xco.getMessage());
						}else{
							alert(xco.getMessage());
							window.location.href="/view/room/roomtimesetlist.jsp";
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
