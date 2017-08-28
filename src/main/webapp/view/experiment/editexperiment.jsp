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
<style> 
	#cover{ 
		display:none; 
		position:fixed; 
		z-index:1; 
		top:0; 
		left:0; 
		width:100%; 
		height:100%; 
		background:rgba(0, 0, 0, 0.44); 
	} 
	#coverShow{ 
		display:none; 
		position:fixed; 
		z-index:2; 
		top:50%; 
		left:50%; 
		border:0px solid #127386; 
	} 
</style> 
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
		<div id="cover"></div> 
		<div id="coverShow"> 
			<img src="${pageContext.request.contextPath}/img/loaders/4.gif"/>
			<p>请稍后......</p>
		</div>
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
                                        <li>编辑实验</li>
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
                                    <input type="text" class="form-control pull-left w210" id="experiment_code">
                                    <span id="experiment_code_msg" class="help-block pull-left ml10">实验编号不能为空！</span>
                                </div>
                              </div>
                              
                              <div class="form-group">
                                <label class="col-sm-3 control-label">实验名称：</label>
                                <div class="col-sm-9">
                                    <input type="text" class="form-control pull-left w210" id="experiment_name">
                                    <span id="experiment_name_msg" class="help-block pull-left ml10">实验名称不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">实验报告要求：</label>
                                <div class="col-sm-9">
                                    <textarea class="form-control" rows="7" name="remark" id="remark" style="width:600px;height:300px;visibility:hidden;"></textarea>
                                </div>
                              </div>
                              
                              <div class="form-group">
                                <label class="col-sm-3 control-label" style="padding-top:20px;">教学计划：</label>
                                <div class="col-sm-9">
                                    <input type="hidden" id="file_url2" name="file_url2">
                                    <div class="file-box pos-r">
                                    	<form name="upload2" action="/fileUpload/fileUpload.jhtml" method="post" enctype="multipart/form-data">
                                        	<input type="text" id="textfield2" name="textfield" class="form-control pull-left w210">
                                        	<input type="btn" value="浏览.." class="form-control pull-left w95 ml10 text-center">
                                        	<input type="file" name="file" class="fileText" id="fileField2" size="28" onchange="select2(this);"/>
                                        </form>
                                        <br class="clear"/>
                                    </div>
                                  </div>
                              </div>
                              
                              <div class="form-group">
                                <label class="col-sm-3 control-label" style="padding-top:20px;">教学帮助：</label>
                                <div class="col-sm-9">
                                    <input type="hidden" id="file_url3" name="file_url3">
                                    <div class="file-box pos-r">
                                    	<form name="upload3" action="/fileUpload/fileUpload.jhtml" method="post" enctype="multipart/form-data">
                                        	<input type="text" id="textfield3" name="textfield3" class="form-control pull-left w210">
                                        	<input type="btn" value="浏览.." class="form-control pull-left w95 ml10 text-center">
                                        	<input type="file" name="file" class="fileText" id="fileField3" size="28" onchange="select3(this);"/>
                                        </form>
                                        <br class="clear"/>
                                    </div>
                                  </div>
                              </div>
                              
                              <div class="form-group">
                                <label class="col-sm-3 control-label" style="padding-top:20px;">教学实验：</label>
                                <div class="col-sm-9">
                                    <input type="hidden" id="file_url1" name="file_url1">
                                    <div class="file-box pos-r">
                                    	<form name="upload1" action="/fileUpload/fileUpload.jhtml" method="post" enctype="multipart/form-data">
                                        	<input type="text" id="textfield1" name="textfield" class="form-control pull-left w210">
                                        	<input type="btn" value="浏览.." class="form-control pull-left w95 ml10 text-center">
                                        	<input type="file" name="file" class="fileText" id="fileField1" size="28" onchange="select1(this);"/>
                                        </form>
                                        <br class="clear"/>
                                    </div>
                                  </div>
                              </div>
                              
                              
                              <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-9" style="margin-top:20px;">
                                    <button class="btn btn-primary mr10 btn-save" type="submit" id="ok">更新</button>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor-4.1.7/kindeditor-min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/kindeditor-4.1.7/lang/zh_CN.js"></script>

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src3.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
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
				items : [
					'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
					'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright']
			});
			var autoheight1=eparam.edit.doc.body.scrollHeight;
			eparam.edit.setHeight(autoheight1);
		});
		
		function select1(e){
			if(e.value){
				document.getElementById('textfield1').value=e.value;
				var fileField1 = $("#fileField1").val();
				var cover = document.getElementById("cover"); 
				var covershow = document.getElementById("coverShow"); 
				cover.style.display = 'block'; 
				covershow.style.display = 'block'; 
				$("form[name='upload1']").ajaxSubmit({
				    	dataType:'xml',
				      	success:function(data){
				        	var xco=new XCO();
				        	xco.fromXML0(data);
				      		if(xco.getIntegerValue("state") == 0){
				      			alert("上传成功！");
				      			cover.style.display = 'none'; 
								covershow.style.display = 'none'; 
				      			$("#file_url1").val(xco.get("msg"));
				      		}
				      	}
		        })
			}
		}
		
		function select2(e){
			if(e.value){
				document.getElementById('textfield2').value=e.value;
				var fileField2 = $("#fileField2").val();
				var cover = document.getElementById("cover"); 
				var covershow = document.getElementById("coverShow"); 
				cover.style.display = 'block'; 
				covershow.style.display = 'block'; 
				$("form[name='upload2']").ajaxSubmit({
				    	dataType:'xml',
				      	success:function(data){
				        	var xco=new XCO();
				        	xco.fromXML0(data);
				      		if(xco.getIntegerValue("state") == 0){
				      			alert("上传成功！");
				      			cover.style.display = 'none'; 
								covershow.style.display = 'none'; 
				      			$("#file_url2").val(xco.get("msg"));
				      		}
				      	}
		        })
			}
		}
		
		function select3(e){
			if(e.value){
				document.getElementById('textfield3').value=e.value;
				var fileField3 = $("#fileField3").val();
				var cover = document.getElementById("cover"); 
				var covershow = document.getElementById("coverShow"); 
				cover.style.display = 'block'; 
				covershow.style.display = 'block'; 
				$("form[name='upload3']").ajaxSubmit({
				    	dataType:'xml',
				      	success:function(data){
				        	var xco=new XCO();
				        	xco.fromXML0(data);
				      		if(xco.getIntegerValue("state") == 0){
				      			alert("上传成功！");
				      			cover.style.display = 'none'; 
								covershow.style.display = 'none'; 
				      			$("#file_url3").val(xco.get("msg"));
				      		}
				      	}
		        })
			}
		}
		
		
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
			//$("#remark").val(xco.getStringValue("remark"));
			$("#file_url1").val(xco.getStringValue("file_url"));
			$("#textfield1").val(xco.getStringValue("file_name"));
			$("#file_url2").val(xco.getStringValue("file_url2"));
			$("#textfield2").val(xco.getStringValue("file_name2"));
			$("#file_url3").val(xco.getStringValue("file_url3"));
			$("#textfield3").val(xco.getStringValue("file_name3"));
		}
		
		
		$(function(){
			$("#experiment_code_msg").hide();
			$("#experiment_name_msg").hide();
			
			$("#experiment_code").change(function() {
				var experiment_code = $("#experiment_code").val();
				if (experiment_code == null) {
					$("#experiment_code_msg").show();
					$("#experiment_code_msg").parent().parent().addClass("has-error");
				} else {
					$("#experiment_code_msg").hide();
					$("#experiment_code_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#experiment_name").change(function() {
				var experiment_name = $("#experiment_name").val();
				if (experiment_name == null) {
					$("#experiment_name_msg").show();
					$("#experiment_name_msg").parent().parent().addClass("has-error");
				} else {
					$("#experiment_name_msg").hide();
					$("#experiment_name_msg").parent().parent().removeClass("has-error");
				}

			});
			
			
			$("#ok").click(function(){
				var data = new XCO();
				
				data.setLongValue("experiment_id", getURLparam("experiment_id"));
				
				var experiment_code = $("#experiment_code").val();
				if(experiment_code){
					data.setStringValue("experiment_code",experiment_code);
				}else{
					$("#experiment_code_msg").show();
					$("#experiment_code_msg").parent().parent().addClass("has-error");
				}
				
				var experiment_name = $("#experiment_name").val();
				if(experiment_name){
					data.setStringValue("experiment_name",experiment_name);
				}else{
					$("#experiment_name_msg").show();
					$("#experiment_name_msg").parent().parent().addClass("has-error");
				}
			
				var example_content = eparam.html();
				if(!eparam.isEmpty()){
					//data.setStringValue("example_content",htmlencode(example_content));
					data.setStringValue("remark",example_content);
					//$("#example_content2").val(example_content);
				}else{
					alert("请填写实验报告要求");
					return;
				}
			
				var file_url1 = $("#file_url1").val();
				if(!file_url1){
					alert("请上传教学实验!!");
					return;
				}else{
					data.setStringValue("file_url", file_url1);
					var tfile_name = $("#textfield1").val();
					var file_name = tfile_name.substring(tfile_name.lastIndexOf("\\")+1,tfile_name.length);
					data.setStringValue("file_name", file_name);
				}
				
				var file_url2 = $("#file_url2").val();
				if(!file_url2){
					alert("请上传教学计划!!");
					return;
				}else{
					data.setStringValue("file_url2", file_url2);
					var tfile_name2 = $("#textfield2").val();
					var file_name2 = tfile_name2.substring(tfile_name2.lastIndexOf("\\")+1,tfile_name2.length);
					data.setStringValue("file_name2", file_name2);
				}
				
				var file_url3 = $("#file_url3").val();
				if(!file_url3){
					alert("请上传教学帮助!!");
					return;
				}else{
					data.setStringValue("file_url3", file_url3);
					var tfile_name3 = $("#textfield3").val();
					var file_name3 = tfile_name3.substring(tfile_name3.lastIndexOf("\\")+1,tfile_name3.length);
					data.setStringValue("file_name3", file_name3);
				}

				var options ={
						url:"/experiment/updateExp.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0 || xco.getCode() == 5){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/experiment/experimentlist.jsp";
							}
						}
				};
				if(data.getStringValue("file_url") && data.getStringValue("file_url2") && data.getStringValue("experiment_code") 
					&& data.getStringValue("experiment_name") && data.getStringValue("file_url3") && data.getStringValue("remark")){
						//alert();
						$.doXcoRequest(options);
					}
				
			});
			
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
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
