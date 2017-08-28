<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "discusslist";
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
	<section id="page" data-page="discuss" sub-page="discusslist">
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
                                        <li>
                                            <a href="/view/discuss/discusslist.jsp">讨论列表</a>
                                        </li>
                                        <li>新增讨论</li>
                                    </ul>
                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        <div class="s-pannel margin-top-50">
                        	
                           <div role="form" class="form-horizontal font-14">
                              <div class="form-group">
			                  <label class="col-sm-3 control-label">讨论标题：</label>
			                  <div class="col-sm-9">
			                    <input type="text" id="discuss_title" class="form-control w210 pull-left">
			                    </div>
			                </div>
			                <div class="form-group">
			                  <label class="col-sm-3 control-label">所属分组：</label>
			                  <div class="col-sm-9">
			                    <select class="form-control w160" id="discuss_group_name">
                                  <option value="">-选择讨论组-</option>
                                </select>
			                  </div>
			                </div>
			               <div class="form-group">
			                  <label class="col-sm-3 control-label">讨论内容：</label>
			                  <div class="col-sm-9">
			                  <textarea class="form-control" rows="7" id="discuss_content"></textarea>
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
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		initGroup("discuss_group_name","");
		
		$(function(){
			$("#ok").click(function(){
				var data = new XCO();
				var discuss_title = $("#discuss_title").val();
				if(discuss_title){
					data.setStringValue("discuss_title",discuss_title);
				}else{
					alert("请填写讨论标题");
					return;
				}
				
				var discuss_content = $("#discuss_content").val();
				if(discuss_content){
					data.setStringValue("discuss_content",discuss_content);
				}else{
					alert("请填写讨论内容");
					return;
				}
				
				var discuss_group_id = $("#discuss_group_name").val();
				if(discuss_group_id){
					data.setIntegerValue("discuss_group_id", discuss_group_id);
					data.setStringValue("discuss_group_name", $("#discuss_group_name").find("option:selected").text());
				}else{
					alert("请选择分组");
					return;
				}
				
				var options ={
						url:"/discuss/insertDiscuss.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/discuss/discusslist.jsp";
							}
						}
				};
				$.doXcoRequest(options);
				
			});
			
			$("#cancel").click(function(){
				window.location.href="/view/discuss/discusslist.jsp";
			})
			
		})

	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
