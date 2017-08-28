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
                                        <li>学生实验课列表</li>
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
                                        <th width="6%">序号</th>
                                        <th width="15%">教师名称</th>
                                        <th width="20%">实验室名称</th>
					                    <th width="15%">实验名称</th>
					                    <th width="15%">课节日期</th>
					                    <th width="15%">课节时间</th>
					                    <th width="14%">操作</th>
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
		
		initTeacher("teacher_name",2,"");
		initRoom("room_name",'');
		
		$(function(){
			$("#serach").click(function(){
				renderPage = true;
				doSubmit(0,pageSize);
			});
			

			$("#delExp").click(function(){
				var xco = new XCO();
				var str = "";
				$("input:checkbox:checked").each(function(index,element){
					if($(element).prop("checked")){
						str += $(element).val()+",";
					}
				});
				if(str == ""){
					alert("请选择要删除的记录！！！");
					return;
				}else{
					xco.setStringValue("delstr",str.substring(0, str.length-1));
				}
				var options ={
						url:"/task/deleteTask.jhtml",
						data:xco,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/task/tasklist.jsp";
							}
						}
				};
				if(confirm("确定要删除所选择记录吗?")){
					$.doXcoRequest(options);
				}
				
			})
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
					url:"/task/studentyuyuelist.jhtml",
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
							+'<td>'+_dataList[i].getStringValue("roomname")+'</td>'
							+'<td>'+_dataList[i].getStringValue("ename")+'</td>'
							+'<td>'+sub(_dataList[i].getStringValue("begin_time"))+'</td>'
							+'<td>'+rendTime(_dataList[i].getStringValue("begin_time"),_dataList[i].getStringValue("end_time"))+'</td>'
							+'<td>'+checkUrl(_dataList[i].getStringValue("order_id"),_dataList[i].getStringValue("time_id"),_dataList[i].getStringValue("course_id"),_dataList[i].getStringValue("student_id"))+'</td>'
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
		
		function checkState(param){
			if(param==0){
				return "停用";
			}else if(param == 1){
				return "未开始";
			}else if(param == 20){
				return "执行中";
			}else if(param == 25){
				return "执行中";
			}else if(param == 30){
				return "已完成";
			}
		}    
		
		function checkUrl(order_id,time_id,course_id,student_id){
			return '<a href="/view/studenttask/viewtask.jsp?course_id='+course_id+'&student_id='+student_id+'&order_id='+order_id+'&time_id='+time_id+'">进入实验课</a>';
		}
	
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
