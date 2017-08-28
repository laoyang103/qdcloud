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
	<section id="page" data-page="checkwork" sub-page="checkworklist">
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
                                            <%if(type==3){ %>
                                            <a href="/view/message/msgadminlist.jsp">Home</a>
                                            <%}else{ %>
                                            <a href="/view/message/msglist.jsp">Home</a>
                                            <%} %>
                                        </li>
                                        <li>考勤列表</li>
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
                                <label for="exampleInputEmail2" class="sr-only">用户账号</label>
                                <input type="text" placeholder="用户账号" id="user_name" class="form-control w160">
                              </div>
                              <div class="form-group mr15">
                                <label for="exampleInputEmail2" class="sr-only">学生姓名</label>
                                <input type="text" placeholder="学生姓名" id="real_name" class="form-control w160">
                              </div>
                              <div class="form-group mr15">
                                <input id="room_day" class="form-control Wdate w160" placeholder="课节日期" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true})"/> 
                              </div>
                              <div class="form-group mr15">
                                <select class="form-control w160" id="check_work">
                                	<option value="">是否签到</option>
                                	<option value="1">已签到</option>
                                	<option value="0">未签到</option>
				                </select>
                              </div>
                              <div class="form-group mr15">
                              	<select class="form-control w160" id="class_name">
                                  <option value="">-选择班级-</option>
                                </select>
                              </div>
                              <button class="btn btn-primary mr10" id="serach"><i class="fa fa-search fa-fw"></i>搜索</button>
                              
                            </div>
                            
                           
                            </div>
                            <div class="t-wrap mt20">
                            	<table class="table table-bordered table-striped center">
                                    <thead>
                                      <tr>
                                        <th width="5%">序号</th>
                                        <th width="10%">用户账号</th>
                                        <th width="10%">学生名称</th>
                                        <th width="15%">实验室</th>
                                        <th width="20%">实验项目</th>
                                        <th width="10%">课节日期</th>
                                        <th width="10%">课节时间</th>
                                        <th width="10%">是否签到</th>
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
		 
		initClass("class_name",'');
		var renderPage = true;
		
		function formPara(xco){
			var user_name = $("#user_name").val();
   			if(user_name){
   				xco.setStringValue("user_name",user_name);
   			}
   			var room_day = $("#room_day").val();
   			if(room_day){
   				xco.setStringValue("room_day",room_day);
   			}
   			var real_name = $("#real_name").val();
   			if(real_name){
   				xco.setStringValue("real_name",real_name);
   			}
   			var check_work = $("#check_work").val();
   			if(check_work){
   				xco.setStringValue("check_work",check_work);
   			}
   			var class_name = $("#class_name").val();
   			if(class_name){
   				xco.setStringValue("class_name",class_name);
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
					url:"/task/kaoqinlist.jhtml",
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
							+'<td>'+_dataList[i].getObjectValue("user_name")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("real_name")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("room_name")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("experiment_name")+'</td>'
							+'<td>'+sub(_dataList[i].getObjectValue("begin_time"))+'</td>'
							+'<td>'+rendTime(_dataList[i].getObjectValue("begin_time"),_dataList[i].getObjectValue("end_time"))+'</td>'
							+'<td>'+checkResult(_dataList[i].getObjectValue("check_work"))+'</td>'
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
			if(state == 1){
				return "已签到";
			}else{
				return "未签到";
			}
		}
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
