<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "roomlist";
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
	<section id="page" data-page="room" sub-page="roomlist">
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
                                        <li>实验室列表</li>
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
                                <label for="exampleInputEmail2" class="sr-only">教室号</label>
                                <input type="text" placeholder="教室号" id="room_code" class="form-control w160">
                              </div>
                              <div class="form-group mr15">
                                <label for="stuName" class="sr-only">教室名称</label>
                                <input type="text" placeholder="教室名称" id="room_name" class="form-control w160">
                              </div>
                              <div class="form-group mr15">
                                <label for="stuName" class="sr-only">所属院系</label>
                                <input type="text" placeholder="所属院系" id="department" class="form-control w160">
                              </div>
                              
                              <button class="btn btn-primary mr10" id="serach"><i class="fa fa-search fa-fw"></i>搜索</button>
                              <a href="/view/room/addroom.jsp" class="btn btn-danger ml10" type="button"><i class="fa fa-plus fa-fw"></i>新增</a>
                              <!-- 
                              <button class="btn btn-danger ml10" type="button" id="delRoom"><i class="fa fa-trash-o fa-fw"></i>删除</button>
                               -->
                            </div>
                            
                           
                            </div>
                            <div class="t-wrap mt20">
                            	<table class="table table-bordered table-striped center">
                                    <thead>
                                      <tr>
                                        <th width="8%">勾选</th>
                                        <th width="10%">教室号</th>
                                        <th width="10%">教室名称</th>
                                        <th width="10%">所属院系</th>
                                        <th width="10%">面积</th>
                                        <th width="10%">负责人</th>
                                        <th width="10%">地点</th>
                                        <th width="10%">课位数</th>
                                        <th width="18%">操作</th>
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

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
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
			

			$("#delRoom").click(function(){
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
						url:"/room/deleteRoom.jhtml",
						data:xco,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/room/roomlist.jsp";
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
		
		//initClass("class_name",'');
    		
		var renderPage = true;
		function doSubmit(start,pageSize){
			var xco=new XCO();
			
			//查询条件
			var data=formPara(xco);
			//传分页条件
			xco.setIntegerValue("start",start);
			xco.setIntegerValue("pageSize",pageSize);
  			var options ={
					url:"/room/roomlist.jhtml",
					data:data,
					success: manage
			};
			$.doXcoRequest(options);					
		}
        
       	function formPara(xco){
   			var room_code = $("#room_code").val();
   			if(room_code){
   				xco.setStringValue("room_code",room_code);
   			}
   			var room_name = $("#room_name").val();
   			if(room_name){
   				xco.setStringValue("room_name",room_name);
   			}
   			var department = $("#department").val();
   			if(department){
   				xco.setStringValue("department",department);
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
						+'<td><input type="checkbox" value='+_dataList[i].getObjectValue("room_id")+'></td>'
							+'<td>'+_dataList[i].getObjectValue("room_code")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("room_name")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("department")+'</td>'
							+'<td>'+checkPm(_dataList[i].getObjectValue("measure_area"))+'</td>'
							+'<td>'+_dataList[i].getObjectValue("leader")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("area")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("place_count")+'个</td>'
							+'<td>'+checkUrl(_dataList[i].getObjectValue("room_id"))+'</td>'
							+'</tr>')
				}
			}
            if(renderPage){
            	renderPage = false;
            	pageUtil('pagination_1', parseInt(total), doSubmit, pageSize);                    	
            }
			
		}  
		
		function checkPm(area){
			if(area){
				return area+"平米";
			}else{
				return "0平米";
			}
		}
		
		function checkUrl(room_id){
			return '<a href="/view/room/viewroom.jsp?room_id='+room_id+'">查看</a><a href="/view/room/editroom.jsp?room_id='+room_id+'" style="margin-left:20px;">编辑</a>';
		}
	
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
