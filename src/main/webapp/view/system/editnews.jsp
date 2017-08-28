<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "kycglist";
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
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/kindeditor-4.1.7/themes/default/default.css" />
</head>
<body>
<!--#include virtual="/BIsystem/include/header.html"-->
	
	<!-- PAGE -->
	<section id="page" data-page="system" sub-page="kycglist">
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
                                        <li><a href="/view/system/kycglist.jsp">成果展示</a></li>
                                        <li>编辑成果展示</li>
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
                                <label class="col-sm-3 control-label">标题：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="title" class="form-control w210 pull-left">
                                    <span id="title_msg" class="help-block pull-left ml10">标题不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">内容：</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" rows="7" name="content" id="content"  style="width:800px;height:400px;visibility:hidden;"></textarea>
                                </div>
                              </div>
                      
                              <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-9">
                                	<button class="btn btn-primary mr10 btn-save"  id="ok">更新</button>
                                    <button class="btn btn-primary mr10 btn-save"  id="cancel">取消</button>													
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

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco2.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src2.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor-4.1.7/kindeditor-all.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		
		var eparam;
		KindEditor.ready(function(K) {
			eparam = K.create('textarea[name="content"]', {
				resizeType : 1,
				filterMode : true,
				imageSizeLimit : "5 MB",
				allowFileManager : true,
	            allowImageUpload : true, 
	            allowImageRemote : false, 
				uploadJson :'/upload/uploadImage',
				items : [
							'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
							'subscript','superscript','removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
							'insertunorderedlist', '|','image', 'link','flash'],
				afterBlur : function(){
					
				},
				afterUpload : function(url, data, name) { //上传文件后执行的回调函数，必须为3个参数
					
		        } //图片上传后，将上传内容同步到textarea中
			});
			var autoheight1=eparam.edit.doc.body.scrollHeight;
			eparam.edit.setHeight(autoheight1);
		});
		
		
		$(function(){
			
			$("#title_msg").hide();
			
			$("#title").change(function() {
				var title = $("#title").val();
				if (title == null) {
					$("#title_msg").show();
					$("#title_msg").parent().parent().addClass("has-error");
				} else {
					$("#title_msg").hide();
					$("#title_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#ok").click(function(){
				var data = new XCO();
				data.setIntegerValue("flag",1);
				data.setLongValue("id",getURLparam("id"));
				var title = $("#title").val();
				if(title){
					data.setStringValue("title",title);
				}else{
					$("#title_msg").show();
					$("#title_msg").parent().parent().addClass("has-error");
				}
				
				var content = eparam.html();
				if(!eparam.isEmpty()){
					$("#content").val(content);
				}else{
					alert("请填写内容");
					return;
				}
				data.setStringValue("content",__xcoUtil.encodeTextForXML($("#content").val()));
				var options ={
						url:"/news/updateNews.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/system/kycglist.jsp";
							}
						}
				};
				$.doXcoRequest(options);
				
			});
			
			$("#cancel").click(function(){
				window.location.href="/view/system/kycglist.jsp";
			})
			
		});
		
		
		queryUser();
		
		function queryUser(){
			var xco=new XCO();
			xco.setIntegerValue("id", getURLparam("id"));
  			var options ={
					url:"/news/selectNewsById.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
		
		//渲染单个对象
		function manage(xco){
			$("#title").val(xco.getStringValue("title"));
			//eparam.html(xco.getStringValue("content"));
			eparam.insertHtml(htmldecode(xco.getStringValue("content")));
		}
		
		function htmldecode(s){  
		    var div = document.createElement('div');  
		    div.innerHTML = s;  
		    return div.innerText || div.textContent;  
		} 
		
		
		//initClass("class_name",'');
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
