<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "experimentlist";
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
	<section id="page" data-page="experiment" sub-page="experimentlist">
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
                                        <li>项目实验列表</li>
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
                                <label for="stuName" class="sr-only">实验名称</label>
                                <input type="text" placeholder="实验名称" id="experiment_name" class="form-control w160">
                              </div>
                              <!-- 
                              <div class="form-group mr15">
                                <label for="stuName" class="sr-only">实验类型</label>
                                <input type="text" placeholder="实验类型" id="type_name" class="form-control w160">
                              </div>
                              <div class="form-group mr15">
                              	<select class="form-control w160" id="type_name">
                                  <option value="">-实验类型-</option>
                                </select>
                              </div>
                               -->
                             
                              <button class="btn btn-primary mr10" id="serach"><i class="fa fa-search fa-fw"></i>搜索</button>
                              <a href="/view/experiment/addexperiment.jsp" class="btn btn-danger ml10" type="button"><i class="fa fa-plus fa-fw"></i>新增</a>
                              <button class="btn btn-danger ml10" type="button" id="delExp"><i class="fa fa-trash-o fa-fw"></i>删除</button>
                            </div>
                            
                           
                            </div>
                            <div class="t-wrap mt20">
                            	<table class="table table-bordered table-striped center">
                                    <thead>
                                      <tr>
                                        <th width="10%">勾选</th>
                                        <th width="20%">实验编号</th>
                                        <th width="35%">实验名称</th>
                                        <th width="10%">所属教师</th>
                                        <th width="10%">状态</th>
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
						url:"/experiment/deleteExp.jhtml",
						data:xco,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/experiment/experimentlist.jsp";
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
		
		//initType("type_name",'');
    		
		var renderPage = true;
		function doSubmit(start,pageSize){
			var xco=new XCO();
			
			//查询条件
			var data=formPara(xco);
			//传分页条件
			xco.setIntegerValue("start",start);
			xco.setIntegerValue("pageSize",pageSize);
  			var options ={
					url:"/experiment/experimentlist.jhtml",
					data:data,
					success: manage
			};
			$.doXcoRequest(options);
								
		}
        
       	function formPara(xco){
   			var experiment_name = $("#experiment_name").val();
   			if(experiment_name){
   				xco.setStringValue("experiment_name",experiment_name);
   			}
   		
   			var type_name = $("#type_name").val();
   			if(type_name){
   				xco.setStringValue("type_name",type_name);
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
						+'<td><input type="checkbox" value='+_dataList[i].getObjectValue("experiment_id")+'></td>'
							+'<td>'+_dataList[i].getObjectValue("experiment_code")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("experiment_name")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("real_name")+'</td>'
							+'<td>'+checkState(_dataList[i].getObjectValue("state"))+'</td>'
							+'<td>'+checkUrl(_dataList[i].getObjectValue("experiment_id"),_dataList[i].getStringValue("operator"))+'</td>'
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
			return "正常";
		}    
		
		var user_name = "<%=user_name %>";
		//alert(user_name);
		function checkUrl(experiment_id,zhanghao){
			if(user_name == zhanghao){
				return '<a href="/view/experiment/viewexperiment.jsp?experiment_id='+experiment_id+'">查看</a>&nbsp;&nbsp;<a href="/view/experiment/editexperiment.jsp?experiment_id='+experiment_id+'">编辑</a>';
			}else{
				return '<a href="/view/experiment/viewexperiment.jsp?experiment_id='+experiment_id+'">查看</a>';
			}
		}
		
		function delExp(experiment_id){
			alert();
		}
	
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
