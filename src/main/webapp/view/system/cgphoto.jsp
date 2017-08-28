<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "cgphoto";
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
	<!-- FONTS -->
	<link href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- ANIMATE -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/animatecss/animate.min.css" />	
</head>
<body>
<!--#include virtual="/BIsystem/include/header.html"-->
	
	<!-- PAGE -->
	<section id="page" data-page="system" sub-page="cgphoto">
		<div id="cover"></div> 
		<div id="coverShow"> 
			<img src="${pageContext.request.contextPath}/img/loaders/4.gif"/>
			<p>请稍后......</p>
		</div>
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
                                        <li>成果图片维护</li>
                                    </ul>
                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                    <!-- /BREADCRUMBS -->
                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        <div class="s-pannel" style="margin-top:25px;">
                        	
                           <div role="form" class="form-horizontal font-14">
                              <div class="form-group">
                                <label class="col-sm-3 control-label">第一张图片标题：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="title1" class="form-control w210 pull-left">
                                    <span id="title1_msg" class="help-block pull-left ml10">第一张图片标题不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label" style="">第一张图片上传：</label>
                                <div class="col-sm-9" >
                                    <input type="hidden" id="file_url1" name="file_url1">
                                    <input type="hidden" id="id1" value="0">
                                   	<form name="upload1" action="/fileUpload/fileUpload.jhtml" method="post" enctype="multipart/form-data">
                                       	<input type="text" id="textfield1" name="textfield" class="form-control pull-left w210">
                                       	<input type="btn" value="浏览.." class="form-control pull-left w95 ml10 text-center">
                                       	<input type="file" name="file" class="fileText" id="fileField1" size="28" onchange="select1(this);"/>
                                    </form>
                                    <br class="clear"/>
                                  </div>
                              </div>
                      		  <div class="form-group">
                                <label class="col-sm-3 control-label">第一张图片连接：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="link1" class="form-control w210 pull-left">
                                    <span id="link1_msg" class="help-block pull-left ml10">第一张图片连接不能为空！</span>
                                </div>
                              </div>
                              
                              <div class="form-group" style="padding-top:20px;">
                                <label class="col-sm-3 control-label">第二张图片标题：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="title2" class="form-control w210 pull-left">
                                    <span id="title2_msg" class="help-block pull-left ml10">第二张图片标题不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">第二张图片上传：</label>
                                <div class="col-sm-9">
                                    <input type="hidden" id="file_url2" name="file_url2">
                                    <input type="hidden" id="id2" value="0">
                                   	<form name="upload2" action="/fileUpload/fileUpload.jhtml" method="post" enctype="multipart/form-data">
                                       	<input type="text" id="textfield2" name="textfield" class="form-control pull-left w210">
                                       	<input type="btn" value="浏览.." class="form-control pull-left w95 ml10 text-center">
                                       	<input type="file" name="file" class="fileText" id="fileField2" size="28" onchange="select2(this);"/>
                                     </form>
                                     <br class="clear"/>
                                  </div>
                              </div>
                      		  <div class="form-group">
                                <label class="col-sm-3 control-label">第二张图片连接：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="link2" class="form-control w210 pull-left">
                                    <span id="link2_msg" class="help-block pull-left ml10">第二张图片连接不能为空！</span>
                                </div>
                              </div>
                              
                              
                              <div class="form-group" style="padding-top:20px;">
                                <label class="col-sm-3 control-label">第三张图片标题：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="title3" class="form-control w210 pull-left">
                                    <span id="title3_msg" class="help-block pull-left ml10">第三张图片标题不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label" >第三张图片上传：</label>
                                <div class="col-sm-9">
                                    <input type="hidden" id="file_url3" name="file_url3">
                                    <input type="hidden" id="id3" value="0">
                                   	<form name="upload3" action="/fileUpload/fileUpload.jhtml" method="post" enctype="multipart/form-data">
                                     	<input type="text" id="textfield3" name="textfield" class="form-control pull-left w210">
                                     	<input type="btn" value="浏览.." class="form-control pull-left w95 ml10 text-center">
                                     	<input type="file" name="file" class="fileText" id="fileField3" size="28" onchange="select3(this);"/>
                                     </form>
                                     <br class="clear"/>
                                  </div>
                              </div>
                      		  <div class="form-group">
                                <label class="col-sm-3 control-label">第三张图片连接：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="link3" class="form-control w210 pull-left">
                                    <span id="link3_msg" class="help-block pull-left ml10">第三张图片连接不能为空！</span>
                                </div>
                              </div>
                              
                              <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-9">
                                    <button class="btn btn-primary mr10 btn-save" type="submit" id="ok">保存</button>
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		function select1(e){
			if(e.value){
				document.getElementById('textfield1').value=e.value;
				var fileField1 = $("#fileField1").val();
				if(isPicture(fileField1)){
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
				}else{
					document.getElementById('textfield1').value = "";
					$("#file_url1").val("");
				}
				
			}
		}
		
		function select2(e){
			if(e.value){
				document.getElementById('textfield2').value=e.value;
				var fileField2 = $("#fileField2").val();
				if(isPicture(fileField2)){
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
				}else{
					document.getElementById('textfield2').value = "";
					$("#file_url2").val("");
				}
			}
		}
		
		function select3(e){
			if(e.value){
				document.getElementById('textfield3').value=e.value;
				var fileField3 = $("#fileField3").val();
				if(isPicture(fileField3)){
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
				}else{
					document.getElementById('textfield3').value = "";
					$("#file_url3").val("");
				}
			}
		}
		
		
		querylist();
		
		function querylist(){
			var xco=new XCO();
			xco.setIntegerValue("photo_type", 0);
  			var options ={
					url:"/index/photolist.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
		
		function manage(xco){
			var total = 0;
			if(xco.getIntegerValue("total")){
				total = xco.getIntegerValue("total");
			}
            var _dataList = xco.getXCOListValue("data");
            if(_dataList){
				for ( var i = 0; i < _dataList.length; i++) {
					$("#id"+(i+1)).val(_dataList[i].getObjectValue("id"));
					$("#title"+(i+1)).val(_dataList[i].getObjectValue("photo_title"));
					$("#link"+(i+1)).val(_dataList[i].getObjectValue("photo_link"));
					$("#file_url"+(i+1)).val(_dataList[i].getObjectValue("photo_src"));
					$("#textfield"+(i+1)).val(_dataList[i].getObjectValue("photo_name"));
				}
			}
		}
		
		
		$(function(){
			
			$("#title1_msg").hide();
			$("#title2_msg").hide();
			$("#title3_msg").hide();
			$("#link1_msg").hide();
			$("#link2_msg").hide();
			$("#link3_msg").hide();
			
			
			$("#title1").change(function() {
				var title1 = $("#title1").val();
				if (title1 == null) {
					$("#title1_msg").show();
					$("#title1_msg").parent().parent().addClass("has-error");
				} else {
					$("#title1_msg").hide();
					$("#title1_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#title2").change(function() {
				var title2 = $("#title2").val();
				if (title2 == null) {
					$("#title2_msg").show();
					$("#title2_msg").parent().parent().addClass("has-error");
				} else {
					$("#title2_msg").hide();
					$("#title2_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#title3").change(function() {
				var title3 = $("#title3").val();
				if (title3 == null) {
					$("#title3_msg").show();
					$("#title3_msg").parent().parent().addClass("has-error");
				} else {
					$("#title3_msg").hide();
					$("#title3_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#link1").change(function() {
				var link1 = $("#link1").val();
				if (link1 == null) {
					$("#link1_msg").show();
					$("#link1_msg").parent().parent().addClass("has-error");
				} else {
					$("#link1_msg").hide();
					$("#link1_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#link2").change(function() {
				var link2 = $("#link2").val();
				if (link2 == null) {
					$("#link2_msg").show();
					$("#link2_msg").parent().parent().addClass("has-error");
				} else {
					$("#link2_msg").hide();
					$("#link2_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#link3").change(function() {
				var link3 = $("#link3").val();
				if (link3 == null) {
					$("#link3_msg").show();
					$("#link3_msg").parent().parent().addClass("has-error");
				} else {
					$("#link3_msg").hide();
					$("#link3_msg").parent().parent().removeClass("has-error");
				}

			});
			
			
			
			$("#ok").click(function(){
				var data = new XCO();
				
				var title1 = $("#title1").val();
				if(title1){
					data.setStringValue("title1",title1);
				}else{
					$("#title1_msg").show();
					$("#title1_msg").parent().parent().addClass("has-error");
				}
				
				var title2 = $("#title2").val();
				if(title2){
					data.setStringValue("title2",title2);
				}else{
					$("#title2_msg").show();
					$("#title2_msg").parent().parent().addClass("has-error");
				}
				
				var title3 = $("#title3").val();
				if(title3){
					data.setStringValue("title3",title3);
				}else{
					$("#title3_msg").show();
					$("#title3_msg").parent().parent().addClass("has-error");
				}
				
				var link1 = $("#link1").val();
				if(link1){
					data.setStringValue("link1",link1);
				}else{
					$("#link1_msg").show();
					$("#link1_msg").parent().parent().addClass("has-error");
				}
				
				var link2 = $("#link2").val();
				if(link2){
					data.setStringValue("link2",link2);
				}else{
					$("#link2_msg").show();
					$("#link2_msg").parent().parent().addClass("has-error");
				}
				
				var link3 = $("#link3").val();
				if(link3){
					data.setStringValue("link3",link3);
				}else{
					$("#link3_msg").show();
					$("#link3_msg").parent().parent().addClass("has-error");
				}
				
				
				
				var photo_type = 0;
				data.setIntegerValue("photo_type",photo_type);
				
				var file_url1 = $("#file_url1").val();
				if(!file_url1){
					alert("请上传第一张图片!");
					return;
				}else{
					data.setStringValue("file_url1", file_url1);
					var tfile_name1 = $("#textfield1").val();
					var file_name1 = tfile_name1.substring(tfile_name1.lastIndexOf("\\")+1,tfile_name1.length);
					data.setStringValue("file_name1", file_name1);
				}
				
				
				var file_url2 = $("#file_url2").val();
				if(!file_url2){
					alert("请上传第二张图片!");
					return;
				}else{
					data.setStringValue("file_url2", file_url2);
					var tfile_name2 = $("#textfield2").val();
					var file_name2 = tfile_name2.substring(tfile_name2.lastIndexOf("\\")+1,tfile_name2.length);
					data.setStringValue("file_name2", file_name2);
				}
				
				var file_url3 = $("#file_url3").val();
				if(!file_url3){
					alert("请上传第三张图片!");
					return;
				}else{
					data.setStringValue("file_url3", file_url3);
					var tfile_name3 = $("#textfield3").val();
					var file_name3 = tfile_name3.substring(tfile_name3.lastIndexOf("\\")+1,tfile_name3.length);
					data.setStringValue("file_name3", file_name3);
				}
				data.setLongValue("id1", $("#id1").val());
				data.setLongValue("id2", $("#id2").val());
				data.setLongValue("id3", $("#id3").val());
				var options ={
						url:"/index/insertIndex.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0 || xco.getCode() == 5){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/system/cgphoto.jsp";
							}
						}
				};
				//alert("title1="+data.getStringValue("title1"));
				//alert("title2="+data.getStringValue("title2"));
				//alert("title3="+data.getStringValue("title3"));
				//alert("link1="+data.getStringValue("link1"));
				//alert("link2="+data.getStringValue("link2"));
				//alert("link3="+data.getStringValue("link3"));
				//alert("file_name1="+data.getStringValue("file_name1"));
				//alert("file_name2="+data.getStringValue("file_name2"));
				//alert("file_name3="+data.getStringValue("file_name3"));
				//alert("photo_type="+data.getIntegerValue("photo_type"));
				if(data.getStringValue("title1") && data.getStringValue("title2") && data.getStringValue("title3") 
						&& data.getStringValue("link1") && data.getStringValue("link2") && data.getStringValue("link3") 
						&& data.getStringValue("file_name1") && data.getStringValue("file_name2") && data.getStringValue("file_name3")){
						//alert();
						$.doXcoRequest(options);
					}
				
			});
		
		})
		
		//initType("type_name",'');
		
		//判断上传文件格式是否满足条件
		function isPicture(fileName){
		    if(fileName!=null && fileName !=""){
		  		//lastIndexOf如果没有搜索到则返回为-1
		  		if (fileName.lastIndexOf(".")!=-1) {
					var fileType = (fileName.substring(fileName.lastIndexOf(".")+1,fileName.length)).toLowerCase();
					var suppotFile = new Array();
					suppotFile[0] = "jpg";
		   			suppotFile[1] = "gif";
		   			suppotFile[2] = "bmp";
		   			suppotFile[3] = "png";
		   			suppotFile[4] = "jpeg";
					for (var i =0;i<suppotFile.length;i++) {
						if (suppotFile[i]==fileType) {
							return true;
						} else{
						 continue;
						}
					}
					alert("文件类型不合法,只能是jpg、gif、bmp、png、jpeg类型！");
					return false;
				} else{
					alert("文件类型不合法,只能是 jpg、gif、bmp、png、jpeg 类型！");
				  return false;
				}
			}
		}
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
