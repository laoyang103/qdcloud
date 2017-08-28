<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "roomsetlist";
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
		top:43%; 
		left:43%; 
		border:0px solid #127386; 
	} 
	
	.jiachu{ 
		font-weight:800;
		font-size:18px;
		margin-top:10px;
		color:white;
	}
</style> 
<body>
<!--#include virtual="/BIsystem/include/header.html"-->
	
	<!-- PAGE -->
	<section id="page" data-page="room" sub-page="roomsetlist">
		<div id="cover"></div> 
		<div id="coverShow"> 
			<img src="${pageContext.request.contextPath}/img/loaders/4.gif" style="margin-top:55px;margin-left:55px;"/>
			<p class="jiachu">正在生成,请稍后~~</p>
		</div> 
		<div id="main-content">
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						<div class="row">
                            <div class="col-sm-12">
                                <div class="page-header">
                                    <!-- BREADCRUMBS -->
                                    <ul class="breadcrumb pull-left">
                                        <li>
                                            <i class="fa fa-home"></i>
                                            <a href="/view/message/msgadminlist.jsp">Home</a>
                                        </li>
                                        <li><a href="/view/room/roomtimesetlist.jsp">实验室时间设置</a></li>
                                        <li>批量生成实验时间</li>
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
                                <label class="col-sm-3 control-label">实验室名称：</label>
                                <div class="col-sm-9">
                                	 <input type="hidden" id="room_ids">
                                	 <textarea style="width:320px;" disabled rows="5" id="room_names" class="form-control w210 mr10 pull-left"></textarea>
				                    <!-- 
				                    <input type="text" id="student_names" class="form-control w210 mr10 pull-left"> 
				                     -->
				                    
				                    <a class="btn btn-primary mr10 btn-up pull-left J-selBox" id="selectroom">选择实验室</a>
				                </div>
                              </div>
                              
                              <div class="form-group">
                                <label class="col-sm-3 control-label">课节日期：</label>
                                <div>
	                                <div style="float:left;">
	                                <!-- 
					                    <input type="text" onClick="WdatePicker()" placeholder="起始日期" id="begin_time" class="form-control" readonly="readonly" style="width:160px;">
	                                 -->
					                    <input id="begin_time" class="form-control Wdate" placeholder="起始日期" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'%y-%M-{%d+3}',maxDate:'#F{$dp.$D(\'end_time\')}'})" style="width:160px;" /> 
					                </div>
					                <div style="float:left;margin-left:10px;margin-right:10px; height:25px;line-height:25px; overflow:hidden;">
					                    <span>至</span>
					                </div>
					                <div style="float:left;">
					                	<input id="end_time" class="form-control Wdate" placeholder="结束日期" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd',readOnly:true,minDate:'#F{$dp.$D(\'begin_time\')||\'%y-%M-{%d+4}\'}',startDate:'#F{$dp.$D(\'begin_time\',{d:+1})}'})" style="width:160px;" />
					                	<!-- 
					                    <input type="text" onClick="WdatePicker()" placeholder="结束日期" id="end_time" class="form-control" readonly="readonly" style="width:160px;">
					                	 -->
					                </div>
                                </div>
                              </div>
                              
                              <div class="form-group">
                                <div style="margin-left:120px;">
	                                <div style="float:left;width:220px;">
	                                	<span>上午课时生成</span>
	                                	<div style="margin-top:30px;">
	                                		<span style="width:70px;float:left;height:34px;line-height:34px; overflow:hidden;">上午课节：</span>
			                              	<select class="form-control" style="width:100px;float:left;" id="shangwukejie1">
			                                  <option value="5">5</option>
			                                  <option value="4">4</option>
			                                  <option value="3">3</option>
			                                  <option value="2">2</option>
			                                  <option value="1">1</option>
			                                </select>
			                                <span style="width:30px;float:left;height:34px;line-height:34px; overflow:hidden;">节课</span>
	                                	</div>
	                                	<div style="margin-top:70px;">
	                                		<span style="width:70px;float:left;height:34px;line-height:34px; overflow:hidden;">课间休息：</span>
			                              	<input type="text" id="shangwukejian1" class="form-control  pull-left" style="width:100px;float:left;" >
			                                <span style="width:30px;float:left;height:34px;line-height:34px; overflow:hidden;">分钟</span>
	                                	</div>
	                                	<div style="margin-top:110px;">
	                                		<span style="width:70px;float:left;height:34px;line-height:34px; overflow:hidden;">课长时间：</span>
			                              	 <input type="text" id="shangwukechang1" class="form-control pull-left" style="width:100px;float:left;"  >
			                                <span style="width:30px;float:left;height:34px;line-height:34px; overflow:hidden;">分钟</span>
	                                	</div>
	                                	<div style="margin-top:150px;">
	                                		<span style="width:70px;float:left;height:34px;line-height:34px; overflow:hidden;">开课时间：</span>
			                                <input type="text" placeholder="开课时间" id="shangwukaike1" class="form-control Wdate" style="width:100px;" onfocus="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})"  value="08:00:00">
	                                	</div>
					                </div>
					                <div style="float:left;margin-left:80px;margin-right:80px; width:220px;">
					                    <span>下午课时生成</span>
					                    <div style="margin-top:30px;">
	                                		<span style="width:70px;float:left;height:34px;line-height:34px; overflow:hidden;">下午课节：</span>
			                              	<select class="form-control" style="width:100px;float:left;" id="xiawukejie2">
			                                  <option value="4">4</option>
			                                  <option value="3">3</option>
			                                  <option value="2">2</option>
			                                  <option value="1">1</option>
			                                </select>
			                                <span style="width:30px;float:left;height:34px;line-height:34px; overflow:hidden;">节课</span>
	                                	</div>
	                                	<div style="margin-top:70px;">
	                                		<span style="width:70px;float:left;height:34px;line-height:34px; overflow:hidden;">课间休息：</span>
			                              	<input type="text" id="xiawukejian2" class="form-control  pull-left" style="width:100px;float:left;" >
			                                <span style="width:30px;float:left;height:34px;line-height:34px; overflow:hidden;">分钟</span>
	                                	</div>
	                                	<div style="margin-top:110px;">
	                                		<span style="width:70px;float:left;height:34px;line-height:34px; overflow:hidden;">课长时间：</span>
			                              	 <input type="text" id="xiawukechang2" class="form-control pull-left" style="width:100px;float:left;" >
			                                <span style="width:30px;float:left;height:34px;line-height:34px; overflow:hidden;">分钟</span>
	                                	</div>
	                                	<div style="margin-top:150px;">
	                                		<span style="width:70px;float:left;height:34px;line-height:34px; overflow:hidden;">开课时间：</span>
			                                <input type="text" placeholder="开课时间" id="xiawukaike2" class="form-control Wdate" style="width:100px;" onfocus="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})" value="13:00:00">
	                                	</div>
					                </div>
					                <div style="float:left;width:220px;">
					                    <span>晚上课时生成</span>
					                    <div style="margin-top:30px;">
	                                		<span style="width:70px;float:left;height:34px;line-height:34px; overflow:hidden;">晚上课节：</span>
			                              	<select class="form-control" style="width:100px;float:left;" id="wanshangkejie3">
			                                  <option value="3">3</option>
			                                  <option value="2">2</option>
			                                  <option value="1">1</option>
			                                </select>
			                                <span style="width:30px;float:left;height:34px;line-height:34px; overflow:hidden;">节课</span>
	                                	</div>
	                                	<div style="margin-top:70px;">
	                                		<span style="width:70px;float:left;height:34px;line-height:34px; overflow:hidden;">课间休息：</span>
			                              	<input type="text" id="wanshangkejian3" class="form-control  pull-left" style="width:100px;float:left;" >
			                                <span style="width:30px;float:left;height:34px;line-height:34px; overflow:hidden;">分钟</span>
	                                	</div>
	                                	<div style="margin-top:110px;">
	                                		<span style="width:70px;float:left;height:34px;line-height:34px; overflow:hidden;">课长时间：</span>
			                              	 <input type="text" id="wanshangkechang3" class="form-control pull-left" style="width:100px;float:left;" >
			                                <span style="width:30px;float:left;height:34px;line-height:34px; overflow:hidden;">分钟</span>
	                                	</div>
	                                	<div style="margin-top:150px;">
	                                		<span style="width:70px;float:left;height:34px;line-height:34px; overflow:hidden;">开课时间：</span>
			                                <input type="text" placeholder="开课时间" id="wanshangkaike3" class="form-control Wdate" style="width:100px;" onfocus="WdatePicker({dateFmt:'HH:mm:ss',readOnly:true})" value="19:00:00">
	                                	</div>
					                </div>
                                </div>
                              </div>
                              <div style="margin-left:100px;">
	                            	<label class="btn btn-sm" style="font-size: 14px;">
										<input type="checkbox" id="zhouliu"/>
										周六按此排课
									</label>
                              </div>
                               <div style="margin-left:100px;">
	                            	<label class="btn btn-sm" style="font-size: 14px;">
										<input type="checkbox" id="zhouri"/>
										周日按此排课
									</label>
                              </div>
                              <div class="form-group" style="margin-top:40px;">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-9">
                                    <button class="btn btn-primary mr10 btn-save" type="submit" id="ok">批量生成</button>
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
	<script type="text/javascript" src="${pageContext.request.contextPath}/layer/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jqPaginator.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		$(function(){
			//打开选择实验室页面
			$("#selectroom").click(function(){
				layer.open({
					type: 2,
					title: "选择实验室",
					maxmin: true,
					shadeClose: true, //点击遮罩关闭层
					area : ["800px" , "700px"],
					content: ["/view/room/roominfo.jsp","no"]
				});
			})

			$("#ok").click(function(){
				var data = new XCO();
				
				var room_ids = $("#room_ids").val();
				if(room_ids){
					data.setStringValue("room_ids",room_ids);
				}else{
					alert("请选择实验室！");
					return;
				}

				var room_names = $("#room_names").val();
				if(room_names){
					data.setStringValue("room_names",room_names);
				}
				
				var begin_time = $("#begin_time").val();
				if(begin_time){
					data.setStringValue("begin_time",begin_time);
				}else{
					alert("请选择开始时间！");
					return;
				}
				
				var end_time = $("#end_time").val();
				if(end_time){
					data.setStringValue("end_time",end_time);
				}else{
					alert("请选择结束时间！");
					return;
				}
				
				var shangwukejie1 = $("#shangwukejie1").val();
				if(shangwukejie1){
					data.setStringValue("shangwukejie1",shangwukejie1);
				}else{
					alert("请选择上午课节时间！");
					return;
				}
				
				var shangwukejian1 = $("#shangwukejian1").val();
				if(shangwukejian1){
					data.setStringValue("shangwukejian1",shangwukejian1);
				}else{
					alert("请填写上午课间时间！");
					return;
				}
				
				var shangwukechang1 = $("#shangwukechang1").val();
				if(shangwukechang1){
					data.setStringValue("shangwukechang1",shangwukechang1);
				}else{
					alert("请填写上午课长时间！");
					return;
				}
				
				var shangwukaike1 = $("#shangwukaike1").val();
				if(shangwukaike1){
					data.setStringValue("shangwukaike1",shangwukaike1);
				}else{
					alert("请填写上午开课时间！");
					return;
				}
				
				
				var xiawukejie2 = $("#xiawukejie2").val();
				if(xiawukejie2){
					data.setStringValue("xiawukejie2",xiawukejie2);
				}else{
					alert("请选择下午课节时间！");
					return;
				}
				
				var xiawukejian2 = $("#xiawukejian2").val();
				if(xiawukejian2){
					data.setStringValue("xiawukejian2",xiawukejian2);
				}else{
					alert("请填写下午课间时间！");
					return;
				}
				
				var xiawukechang2 = $("#xiawukechang2").val();
				if(xiawukechang2){
					data.setStringValue("xiawukechang2",xiawukechang2);
				}else{
					alert("请填写下午课长时间！");
					return;
				}
				
				var xiawukaike2 = $("#xiawukaike2").val();
				if(xiawukaike2){
					data.setStringValue("xiawukaike2",xiawukaike2);
				}else{
					alert("请填写下午开课时间！");
					return;
				}
				
				var wanshangkejie3 = $("#wanshangkejie3").val();
				if(wanshangkejie3){
					data.setStringValue("wanshangkejie3",wanshangkejie3);
				}else{
					alert("请选择晚上课节时间！");
					return;
				}
				
				var wanshangkejian3 = $("#wanshangkejian3").val();
				if(wanshangkejian3){
					data.setStringValue("wanshangkejian3",wanshangkejian3);
				}else{
					alert("请填写晚上课间时间！");
					return;
				}
				
				var wanshangkechang3 = $("#wanshangkechang3").val();
				if(wanshangkechang3){
					data.setStringValue("wanshangkechang3",wanshangkechang3);
				}else{
					alert("请填写晚上课长时间！");
					return;
				}
				
				var wanshangkaike3 = $("#wanshangkaike3").val();
				if(wanshangkaike3){
					data.setStringValue("wanshangkaike3",wanshangkaike3);
				}else{
					alert("请填写晚上开课时间！");
					return;
				}
				if($("input[type='checkbox'][id='zhouliu']").is(':checked')){
					data.setIntegerValue("zhouliu", 1);
				}else{
					data.setIntegerValue("zhouliu", 0);
				}
				if($("input[type='checkbox'][id='zhouri']").is(':checked')){
					data.setIntegerValue("zhouri", 1);
				}else{
					data.setIntegerValue("zhouri", 0);
				}
				
				var cover = document.getElementById("cover"); 
				var covershow = document.getElementById("coverShow"); 
				cover.style.display = 'block'; 
				covershow.style.display = 'block'; 
				
				var options ={
						url:"/room/insertRoomSet.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
								cover.style.display = 'none'; 
								covershow.style.display = 'none';
							}else{
								alert(xco.getMessage());
								cover.style.display = 'none'; 
								covershow.style.display = 'none';
								//window.location.href="/view/team/teamlist.jsp";
								window.location.href="/view/room/roomtimesetlist.jsp";
							}
						}
				};
				$.doXcoRequest(options);
				
			});
			
			$("#cancel").click(function(){
				window.location.href="/view/room/roomtimesetlist.jsp";
			})
			
		})
		
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
