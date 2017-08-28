<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "examplelist";
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
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/cloud-admin.css" >
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
	<section id="page" data-page="example" sub-page="examplelist">
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
                                        <li><a href="/view/example/examplelist.jsp">习题列表</a></li>
                                        <li>编辑习题</li>
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
                                <label class="col-sm-3 control-label">习题名称：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control w210" id="example_name">
                                    <span id="example_name_msg" class="help-block pull-left ml10">习题名称不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">习题用途：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control tip w210" id="example_use">
                                    <span id="example_use_msg" class="help-block pull-left ml10">习题用途不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">习题内容：</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" rows="7" name="example_content" id="example_content" style="width:800px;height:400px;visibility:hidden;"></textarea>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-9">
                                    <button class="btn btn-primary mr10 btn-save" type="submit" id="ok">修改</button>
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
	<form name="editForm" id="editForm">
		<input type="hidden" name="example_id" id="example_id"/>
		<input type="hidden" name="example_name2" id="example_name2"/>
		<input type="hidden" name="example_use2" id="example_use2"/>
		<input type="hidden" name="example_content2" id="example_content2"/>
	</form>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		var eparam;
		KindEditor.ready(function(K) {
			eparam = K.create('textarea[name="example_content"]', {
				resizeType : 1,
				allowPreviewEmoticons : false,
				allowImageUpload : false,
				items : [
					'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
					'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright']
			});
			var autoheight1=eparam.edit.doc.body.scrollHeight;
			eparam.edit.setHeight(autoheight1);
		});
		
		queryUser();
		
		function queryUser(){
			var xco=new XCO();
			xco.setIntegerValue("example_id", getURLparam("example_id"));
  			var options ={
					url:"/example/selectExaById.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
		
		function manage(xco){
			$("#example_name").val(xco.getStringValue("example_name"));
			$("#example_use").val(xco.getStringValue("example_use"));
			eparam.insertHtml(htmldecode(xco.getStringValue("example_content")));
		}
		
		$(function(){
			
			$("#example_name_msg").hide();
			$("#example_use_msg").hide();

			$("#example_name").change(function() {
				var example_name = $("#example_name").val();
				if (example_name == null) {
					$("#example_name_msg").show();
					$("#example_name_msg").parent().parent().addClass("has-error");
				} else {
					$("#example_name_msg").hide();
					$("#example_name_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#example_use").change(function() {
				var example_use = $("#example_use").val();
				if (example_use == null) {
					$("#example_use_msg").show();
					$("#example_use_msg").parent().parent().addClass("has-error");
				} else {
					$("#example_use_msg").hide();
					$("#example_use_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#ok").click(function(){
				$("#example_id").val(getURLparam("example_id"));
				var example_name = $("#example_name").val();
				if(example_name){
					$("#example_name2").val(example_name);
				}else{
					$("#example_name_msg").show();
					$("#example_name_msg").parent().parent().addClass("has-error");
					return;
				}
				
				var example_use = $("#example_use").val();
				if(example_use){
					$("#example_use2").val(example_use);
				}else{
					$("#example_use_msg").show();
					$("#example_use_msg").parent().parent().addClass("has-error");
					return;
				}
				
				var example_content = eparam.html();
				if(!eparam.isEmpty()){
					//data.setStringValue("example_content",htmlencode(example_content));
					$("#example_content2").val(example_content);
				}else{
					alert("请填写习题内容");
					return;
				}
				
	            var options = {
	            	url: "/example/updateExa.jhtml",
	                type: "post",
	                dataType: "text",
	                data: $("#editForm").serialize(),
	                success: function (xco) {
	                	alert("修改成功！！！");
						window.location.href="/view/example/examplelist.jsp";
	                }
	            };
				
	            $.ajax(options);
			});
			
			$("#cancel").click(function(){
				window.location.href="/view/example/examplelist.jsp";
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
