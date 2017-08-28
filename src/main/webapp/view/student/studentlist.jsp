<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "studentlist";
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
	<section id="page" data-page="student" sub-page="studentlist">
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
                                        <li>学生列表</li>
                                    </ul>
                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                    <!-- /BREADCRUMBS -->

                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        <div class="s-pannel mt20">
                        	
							<div role="form" class="form-inline " style="width:1050px;">
                              <div class="form-group mr15">
                                <label for="exampleInputEmail2" class="sr-only">账号</label>
                                <input type="text" placeholder="账号" id="user_name" class="form-control w160">
                              </div>
                              <div class="form-group mr15">
                                <label for="stuName" class="sr-only">姓名</label>
                                <input type="text" placeholder="姓名" id="real_name" class="form-control w160">
                              </div>
                              
                              <div class="form-group mr15">
                              	<select class="form-control w60" id="sex">
                                  <option value="">-性别-</option>
                                  <option value="0">男</option>
                                  <option value="1">女</option>
                                </select>
                              </div>
                             
                              <div class="form-group mr15">
                              	<select class="form-control w160" id="class_name">
                                  <option value="">-选择班级-</option>
                                </select>
                              </div>
                             
                              <button class="btn btn-primary mr10" id="serach"><i class="fa fa-search fa-fw"></i>搜索</button>
                              <a href="/view/student/addstudent.jsp" class="btn btn-danger ml10" type="button"><i class="fa fa-plus fa-fw"></i>新增</a>
                              <a href="/view/student/addstudents.jsp" class="btn btn-danger ml10" type="button"><i class="fa fa-fw fa-files-o"></i>批量导入</a>
                              <button class="btn btn-danger ml10" type="button" id="delUser"><i class="fa fa-trash-o fa-fw"></i>删除</button>
                            </div>
                            
                           
                            </div>
                            <div class="t-wrap mt20">
                            	<table class="table table-bordered table-striped center">
                                    <thead>
                                      <tr>
                                        <th width="10%">勾选</th>
                                        <th width="20%">账号</th>
                                        <th width="15%">姓名</th>
                                        <th width="10%">性别</th>
                                        <th width="15%">班级</th>
                                        <th width="20%">创建日期</th>
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
			

			$("#delUser").click(function(){
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
						url:"/user/deletedUser.jhtml",
						data:xco,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/student/studentlist.jsp";
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
		
		initClass("class_name",'');
    		
		var renderPage = true;
		function doSubmit(start,pageSize){
			var xco=new XCO();
			
			//查询条件
			var data=formPara(xco);
			//传分页条件
			xco.setIntegerValue("type", 1);
			xco.setIntegerValue("start",start);
			xco.setIntegerValue("pageSize",pageSize);
  			var options ={
					url:"/user/userlist.jhtml",
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
   			var class_id = $("#class_name").val();
   			if(class_id){
   				xco.setIntegerValue("class_id",class_id);
   			}
   			var sex = $("#sex").val();
   			if(sex){
   				xco.setIntegerValue("sex",sex);
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
						+'<td><input type="checkbox" value='+_dataList[i].getObjectValue("user_id")+'></td>'
							+'<td>'+_dataList[i].getObjectValue("user_name")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("real_name")+'</td>'
							+'<td>'+checkSex(_dataList[i].getObjectValue("sex"))+'</td>'
							+'<td>'+_dataList[i].getObjectValue("class_name")+'</td>'
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
		function checkSex(param){
			if(param==0){
				return "男";
			}
			return "女";
		}    
		
		function checkUrl(user_id,state){
			return '<a href="javascript:editUser('+user_id+','+state+')">编辑</a>';
			//return '<a href="/view/student/editstudent.jsp?user_id='+user_id+'">编辑</a>';
		}
		
		function editUser(user_id,state){
			if(state == 0){
				alert("该账号已被暂时停用,请前往系统管理中学生权限管理启用该账号");
				return;
			}else{
				window.location.href="/view/student/editstudent.jsp?user_id="+user_id;
			}
		}
	
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
