<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "personlist";
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
	<section id="page" data-page="system" sub-page="personlist">
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
                                        <li>人员权限管理</li>
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
                                <label for="exampleInputEmail2" class="sr-only">账号</label>
                                <input type="text" placeholder="账号" id="user_name" class="form-control w160">
                              </div>
                              <div class="form-group mr15">
                                <input type="text" placeholder="姓名" id="real_name" class="form-control w160">
                              </div>	
                              <button class="btn btn-primary mr10" id="serach"><i class="fa fa-search fa-fw"></i>搜索</button>
                              <a href="/view/system/addperson.jsp" class="btn btn-danger ml10" type="button"><i class="fa fa-plus fa-fw"></i>新增管理员</a>
                            </div>
                            
                           
                            </div>
                            <div class="t-wrap mt20">
                            	<table class="table table-bordered table-striped center">
                                    <thead>
                                      <tr>
                                        <th width="8%">序号</th>
					                    <th width="20%">账号</th>
					                    <th width="13%">姓名</th>
					                    <th width="10%">人员类型</th>
					                    <th width="9%">状态</th>
					                    <th width="20%">创建日期</th>
					                    <th width="25%">操作</th>
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

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jqPaginator.js"></script>
	<script>
		var userid=<%=user_id%>;	
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
					url:"/user/personlist.jhtml",
					data:data,
					success: manage
			};
			$.doXcoRequest(options);					
		}
        
       	function formPara(xco){
   			var user_name = $("#user_name").val();
   			if(user_name){
   				xco.setStringValue("user_name",user_name);
   			}
   			
   			var real_name = $("#real_name").val();
   			if(real_name){
   				xco.setStringValue("real_name",real_name);
   			}
   			
   			xco.setIntegerValue("type",3);
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
							+'<td>'+_dataList[i].getObjectValue("user_name")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("real_name")+'</td>'
							+'<td>'+checkRole(_dataList[i].getObjectValue("type"))+'</td>'
							+'<td>'+checkState(_dataList[i].getObjectValue("state"))+'</td>'
							+'<td>'+_dataList[i].getObjectValue("create_time")+'</td>'
							+'<td>'+checkUrl(_dataList[i].getObjectValue("user_id"),_dataList[i].getObjectValue("state"))+'</td>'
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
				return "停用";
			}
			return "启用";
		}
		
		function checkRole(param){
			if(param==1){
				return "学生";
			}else if(param==2){
				return "教师";
			}else{
				return "管理员";
			}
		}
		
		function checkUrl(user_id,state){
			if(userid==user_id){
				return '';
			}else{
				if(state == 1){
					return '<a href="javascript:stop('+user_id+')">停用</a>&nbsp;&nbsp;<a href="javascript:del('+user_id+')">删除</a>';
				}else{
					return '<a href="javascript:start('+user_id+')">启用</a>&nbsp;&nbsp;<a href="javascript:del('+user_id+')">删除</a>';
				}
			}
		}
		
		//停用
		function stop(user_id){
			if(confirm("确定要停用该账户吗？")){
				var data = new XCO();
				data.setIntegerValue("user_id", user_id);
				var options ={
						url:"/user/delUser.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/system/personlist.jsp";
							}
						}
				};
				$.doXcoRequest(options);
			}
		}
		
		//启用
		function start(user_id){
			if(confirm("确定要启用该账户吗？")){
				var data = new XCO();
				data.setIntegerValue("user_id", user_id);
				var options ={
						url:"/user/startUser.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/system/personlist.jsp";
							}
						}
				};
				$.doXcoRequest(options);
			}
		}
		
		//真正删除
		function del(user_id){
			if(confirm("删除该用户，该用户记录将彻底清除，确定要删除该账户吗？")){
				var data = new XCO();
				data.setIntegerValue("user_id", user_id);
				var options ={
						url:"/user/deletedUser2.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/system/personlist.jsp";
							}
						}
				};
				$.doXcoRequest(options);
			}
		}
	
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
