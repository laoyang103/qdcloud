<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "grouplist";
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
	<section id="page" data-page="group" sub-page="grouplist">
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
                                        <li><a href="/view/team/teamlist.jsp">分组列表</a></li>
                                        <li>新增分组</li>
                                    </ul>

                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                    <!-- /BREADCRUMBS -->

                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        <div class="s-pannel margin-top-50">
                        	
                           <div role="form" class="form-horizontal font-14">
                              
                              <div class="form-group">
                                <label class="col-sm-3 control-label">分组名称：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="group_name" class="form-control w210 pull-left">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">班级：</label>
                                <div class="col-sm-9">
                                    <select class="form-control w210" id="class_name">
                                    </select>			
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">组员同学：</label>
                                <div class="col-sm-9">
                                	 <input type="hidden" id="student_ids">
                                	 <textarea style="width:320px;" disabled rows="5" id="student_names" class="form-control w210 mr10 pull-left"></textarea>
				                    <!-- 
				                    <input type="text" id="student_names" class="form-control w210 mr10 pull-left"> 
				                     -->
				                    
				                    <a href="#" class="btn btn-primary mr10 btn-up pull-left J-selBox" type="submit" id="selectStudent">选择学生</a>
				                </div>
                              </div>
                              
                              <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-9">
                                    <button class="btn btn-primary mr10 btn-save" type="submit" id="ok">保存</button>
                                    <button class="btn btn-primary mr10 btn-save" type="submit" id="cancel">取消</button>													
                                </div>
                              </div>
                             </div>
        				   </div>
                       
						</div>
						<!-- /PAGE HEADER -->
					</div><!-- /CONTENT-->
				</div>
			</div>
		</div>
	</section>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		$(function(){
			//打开选择学生页面
			$("#selectStudent").click(function(){
				var class_id = $("#class_name").val();
				//var group_id = getURLparam("group_id");
				layer.open({
					type: 2,
					title: "选择学生",
					maxmin: true,
					shadeClose: true, //点击遮罩关闭层
					area : ["800px" , "600px"],
					content: ["/view/student/studentlistinfo.jsp?class_id="+class_id,"no"]
				});
			})

			$("#ok").click(function(){
				var data = new XCO();
				
				var group_name = $("#group_name").val();
				if(group_name){
					data.setStringValue("group_name",group_name);
				}else{
					alert("请输入组名!");
					return;
				}
				
				var student_ids = $("#student_ids").val();
				if(student_ids){
					data.setStringValue("student_ids",student_ids);
				}else{
					alert("请选择学生！");
					return;
				}
				
				data.setIntegerValue("class_id", $("#class_name").val());
				data.setStringValue("class_name", $("#class_name").find("option:selected").text());
				
				var options ={
						url:"/group/insertGroup.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/team/teamlist.jsp";
							}
						}
				};
				$.doXcoRequest(options);
				
			});
			
			$("#cancel").click(function(){
				window.location.href="/view/team/teamlist.jsp";
			})
			
		})
		
		
		initClass("class_name",'');
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
