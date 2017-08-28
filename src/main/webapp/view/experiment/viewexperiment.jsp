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
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/kindeditor-4.1.7/themes/default/default.css" />
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
                                        <li><a href="/view/experiment/experimentlist.jsp">项目实验列表</a></li>
                                        <li>查看实验</li>
                                    </ul>

                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                    <!-- /BREADCRUMBS -->

                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        <div class="s-pannel mt20">
                           <div role="form" class="form-horizontal font-14">
                           	  <div class="form-group">
                                <label class="col-sm-3 control-label">实验编号：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control w210" disabled id="experiment_code">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">实验名称：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control w210" disabled id="experiment_name">
                                </div>
                              </div>
                              
                              <div class="form-group">
                                <label class="col-sm-3 control-label">实验报告要求：</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" rows="7" readonly="readonly"  name="remark" id="remark" style="width:600px;height:300px;visibility:hidden;"></textarea>
                                </div>
                              </div>
                              
                              <div class="form-group">
                                <label class="col-sm-3 control-label">教学计划：</label>
                                <div class="col-sm-9">
	                                <div class="file-box pos-r" style="padding-top:7px;">
	                                   <a class="blue font-16" href="#" id="file_url2"><i class="fa fa-file"></i><span class="hui666 ml5" id="file_name2"></span>下载文件</a>
	                                    <br class="clear"/>
	                                </div>
                                </div>
                              </div>
                              
                              <div class="form-group">
                                <label class="col-sm-3 control-label">教学帮助：</label>
                                <div class="col-sm-9">
	                                <div class="file-box pos-r" style="padding-top:7px;">
	                                   <a class="blue font-16" href="#" id="file_url3"><i class="fa fa-file"></i><span class="hui666 ml5" id="file_name3"></span>下载文件</a>
	                                    <br class="clear"/>
	                                </div>
                                </div>
                              </div>
                              
                              <div class="form-group">
                                <label class="col-sm-3 control-label">教学实验：</label>
                                <div class="col-sm-9">
	                                <div class="file-box pos-r" style="padding-top:7px;">
	                                   <a class="blue font-16" href="#" id="file_url"><i class="fa fa-file"></i><span class="hui666 ml5" id="file_name"></span>下载文件</a>
	                                    <br class="clear"/>
	                                </div>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-9">
                                    <button class="btn btn-primary mr10 btn-save" type="submit" id="cancel">返回</button>													
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		var eparam;
		KindEditor.ready(function(K) {
			eparam = K.create('textarea[name="remark"]', {
				resizeType : 1,
				allowPreviewEmoticons : false,
				allowImageUpload : false,
				readonlyMode : true,
				items : []
			});
			var autoheight1=eparam.edit.doc.body.scrollHeight;
			eparam.edit.setHeight(autoheight1);
		});
		
		queryUser();
		
		function queryUser(){
			var xco=new XCO();
			xco.setIntegerValue("experiment_id", getURLparam("experiment_id"));
  			var options ={
					url:"/experiment/selectExpById.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
		
		function manage(xco){
			$("#experiment_code").val(xco.getStringValue("experiment_code"));
			$("#experiment_name").val(xco.getStringValue("experiment_name"));
			eparam.insertHtml(htmldecode(xco.getStringValue("remark")));
			$("#remark").val(xco.getStringValue("remark"));
			$("#file_url").attr("href","../../"+xco.getStringValue("file_url"));
			$("#file_name").html(xco.getStringValue("file_name"));
			$("#file_url2").attr("href","../../"+xco.getStringValue("file_url2"));
			$("#file_name2").html(xco.getStringValue("file_name2"));
			$("#file_url3").attr("href","../../"+xco.getStringValue("file_url3"));
			$("#file_name3").html(xco.getStringValue("file_name3"));
		}
		
		$(function(){
			$("#cancel").click(function(){
				window.location.href="/view/experiment/experimentlist.jsp";
			})
			
		})
		
		function htmlencode(s){  
		    var div = document.createElement('div');  
		    div.appendChild(document.createTextNode(s));  
		    return div.innerHTML;  
		}  
		function htmldecode(s){  
		    var div = document.createElement('div');  
		    div.innerHTML = s;  
		    return div.innerText || div.textContent;  
		} 
		
		//initType("type_name",'');
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
