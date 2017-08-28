<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "messagelist";
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
	<section id="page" data-page="message" sub-page="messagelist">
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
                                            <%if(type==3){ %>
                                            <a href="/view/message/msgadminlist.jsp">Home</a>
                                            <%}else{ %>
                                            <a href="/view/message/msglist.jsp">Home</a>
                                            <%} %>
                                        </li>
                                        <li>
                                            <%if(type==3){ %>
                                            <a href="/view/message/msgadminlist.jsp">消息列表</a>
                                            <%}else{ %>
                                            <a href="/view/message/msglist.jsp">消息列表</a>
                                            <%} %>
                                        </li>
                                        <li>编辑消息</li>
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
                                    <input type="text" class="form-control w210"  id="message_name">
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">内容：</label>
                                <!-- 
                                <div class="col-sm-9">
                                    <textarea class="form-control" rows="7"  id="message_content"></textarea>
                                </div>
                                 -->
                                <div class="col-sm-9">
                                    <textarea class="form-control" rows="7" name="message_content" id="message_content" style="width:800px;height:400px;visibility:hidden;"></textarea>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">通知对象：</label>
                                <div class="col-sm-9">
                                    <select class="form-control w210" id="receiver" >
                                          <option value="1">学生</option>
                                          <option value="2">教师</option>
                                          <option value="3">管理员</option>
                                        </select>
                                </div>
                              </div>
                             
                              <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-9">
                                	<button class="btn btn-primary mr10 btn-save" id="ok">修改</button>
                                    <button class="btn btn-primary mr10 btn-save" id="cancel">取消</button>															
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		var eparam;
		KindEditor.ready(function(K) {
			eparam = K.create('textarea[name="message_content"]', {
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
			xco.setIntegerValue("message_id", getURLparam("message_id"));
  			var options ={
					url:"/message/selectMsgById.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
		
		function manage(xco){
			$("#message_name").val(xco.getStringValue("message_name"));
			eparam.insertHtml(htmldecode(xco.getStringValue("message_content")));
			$("#receiver").val(xco.getIntegerValue("receiver"));
		}
		
		$(function(){
			$("#ok").click(function(){
				var data = new XCO();
				var message_id= getURLparam("message_id");
				data.setIntegerValue("message_id",message_id);
				var message_name = $("#message_name").val();
				if(message_name){
					data.setStringValue("message_name",message_name);
				}else{
					alert("请输入消息标题");
					$("#message_name").focus();
					return false;
				}
				
				var message_content = eparam.html();
				if(!eparam.isEmpty()){
					//data.setStringValue("example_content",htmlencode(example_content));
					data.setStringValue("message_content",message_content);
					//$("#example_content2").val(example_content);
				}else{
					alert("请输入消息内容");
					return;
				}
				
				data.setIntegerValue("receiver", $("#receiver").val());
				
				var options ={
						url:"/message/updateMsg.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								//window.location.href="/view/message/msgadminlist.jsp";
								history.go(-1);
							}
						}
				};
				$.doXcoRequest(options);
				
			});
			
			
			$("#cancel").click(function(){
				window.location.href="/view/message/msgadminlist.jsp";
			})
			
		});
		
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
		
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
