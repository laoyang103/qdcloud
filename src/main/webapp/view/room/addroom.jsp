<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "roomlist";
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
<!-- PAGE -->
	<section id="page" data-page="room" sub-page="roomlist">
		<!--#include virtual="/BIsystem/include/side.html"-->
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
                                        <li><a href="/view/room/roomlist.jsp">实验室列表</a></li>
                                        <li>新增实验室</li>
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
                                <label class="col-sm-3 control-label">实验室编号：</label>
                                <div class="col-sm-9">
                                  <input type="text" value="" id="room_code" class="form-control w210 pull-left">
                                  <span id="room_code_msg" class="help-block pull-left ml10">实验室编号不能为空！</span>
                                </div>
                              </div>
                            
                              <div class="form-group">
                                <label class="col-sm-3 control-label">实验室名称：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="room_name" class="form-control w210 pull-left">
                                    <span id="room_name_msg" class="help-block pull-left ml10">实验室名称不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">院系名称：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="department" class="form-control w210 pull-left">
                                    <span id="department_msg" class="help-block pull-left ml10">院系名称不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">面积(平米)：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="measure_area" class="form-control w210 pull-left"  maxlength="4" onkeyup='this.value=this.value.replace(/\D/gi,"")'>
                                    <span id="measure_area_msg" class="help-block pull-left ml10">面积不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">负责人：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="leader" class="form-control w210 pull-left">
                                    <span id="leader_msg" class="help-block pull-left ml10">负责人不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">地点：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="area" class="form-control w210 pull-left">
                                    <span id="area_msg" class="help-block pull-left ml10">地点不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">课位数量(个)：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="place_count" class="form-control w210 pull-left"  maxlength="2" onkeyup='this.value=this.value.replace(/\D/gi,"")'>
                                    <span id="place_count_msg" class="help-block pull-left ml10">课位数量不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">课位行：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="room_rows" class="form-control w210 pull-left"  maxlength="2" onkeyup='this.value=this.value.replace(/\D/gi,"")'>
                                	<span id="room_rows_msg" class="help-block pull-left ml10">课位行不能为空！</span>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">课位列：</label>
                                <div class="col-sm-9">
                                    <input type="text" id="room_cols" class="form-control w210 pull-left"  maxlength="2" onkeyup='this.value=this.value.replace(/\D/gi,"")'>
                                	<span id="room_cols_msg" class="help-block pull-left ml10">课位列不能为空！</span>
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

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		$(function(){
			$("#room_code_msg").hide();
			$("#room_name_msg").hide();
			$("#department_msg").hide();
			$("#measure_area_msg").hide();
			$("#leader_msg").hide();
			$("#area_msg").hide();
			$("#place_count_msg").hide();
			$("#room_rows_msg").hide();
			$("#room_cols_msg").hide();
			
			$("#room_code").change(function() {
				var room_code = $("#room_code").val();
				if (room_code == null) {
					$("#room_code_msg").show();
					$("#room_code_msg").parent().parent().addClass("has-error");
				} else {
					$("#room_code_msg").hide();
					$("#room_code_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#room_name").change(function() {
				var room_name = $("#room_name").val();
				if (room_name == null) {
					$("#room_name_msg").show();
					$("#room_name_msg").parent().parent().addClass("has-error");
				} else {
					$("#room_name_msg").hide();
					$("#room_name_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#department").change(function() {
				var department = $("#department").val();
				if (department == null) {
					$("#department_msg").show();
					$("#department_msg").parent().parent().addClass("has-error");
				} else {
					$("#department_msg").hide();
					$("#department_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#measure_area").change(function() {
				var measure_area = $("#measure_area").val();
				if (measure_area == null) {
					$("#measure_area_msg").show();
					$("#measure_area_msg").parent().parent().addClass("has-error");
				} else {
					$("#measure_area_msg").hide();
					$("#measure_area_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#leader").change(function() {
				var leader = $("#leader").val();
				if (leader == null) {
					$("#leader_msg").show();
					$("#leader_msg").parent().parent().addClass("has-error");
				} else {
					$("#leader_msg").hide();
					$("#leader_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#area").change(function() {
				var area = $("#area").val();
				if (area == null) {
					$("#area_msg").show();
					$("#area_msg").parent().parent().addClass("has-error");
				} else {
					$("#area_msg").hide();
					$("#area_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#place_count").change(function() {
				var place_count = $("#place_count").val();
				if (place_count == null) {
					$("#place_count_msg").show();
					$("#place_count_msg").parent().parent().addClass("has-error");
				} else {
					$("#place_count_msg").hide();
					$("#place_count_msg").parent().parent().removeClass("has-error");
				}

			});
			
			$("#ok").click(function(){
				var data = new XCO();
				
				var room_code = $("#room_code").val();
				if(room_code){
					data.setStringValue("room_code",room_code);
				}else{
					$("#room_code_msg").show();
					$("#room_code_msg").parent().parent().addClass("has-error");
				}
				
				var room_name = $("#room_name").val();
				if(room_name){
					data.setStringValue("room_name",room_name);
				}else{
					$("#room_name_msg").show();
					$("#room_name_msg").parent().parent().addClass("has-error");
				}
				
				var department = $("#department").val();
				if(department){
					data.setStringValue("department",department);
				}else{
					$("#department_msg").show();
					$("#department_msg").parent().parent().addClass("has-error");
				}
				
				var measure_area = $("#measure_area").val();
				if(measure_area){
					data.setStringValue("measure_area",measure_area);
				}else{
					$("#measure_area_msg").show();
					$("#measure_area_msg").parent().parent().addClass("has-error");
				}
				
				var leader = $("#leader").val();
				if(leader){
					data.setStringValue("leader",leader);
				}else{
					$("#leader_msg").show();
					$("#leader_msg").parent().parent().addClass("has-error");
				}
				
				var area = $("#area").val();
				if(area){
					data.setStringValue("area",area);
				}else{
					$("#area_msg").show();
					$("#area_msg").parent().parent().addClass("has-error");
				}
				
				var place_count = $("#place_count").val();
				if(place_count){
					data.setStringValue("place_count",place_count);
				}else{
					$("#place_count_msg").show();
					$("#place_count_msg").parent().parent().addClass("has-error");
				}
				data.setIntegerValue("room_rows", $("#room_rows").val());
				data.setIntegerValue("room_cols", $("#room_cols").val());
				
				var rows = $("#room_rows").val();
				var cols = $("#room_cols").val();
				var rcs = rows*cols;
				if(rcs < place_count){
					$("#place_count_msg").html("课位数量大于可设置数量");
					$("#place_count_msg").show();
					$("#place_count_msg").parent().parent().addClass("has-error");
					return;
				}else{
					$("#place_count_msg").hide();
				}
				
				var options ={
						url:"/room/insertRoom.jhtml",
						data:data,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/room/roomlist.jsp";
							}
						}
				};
				if(data.getStringValue("room_name") && data.getStringValue("room_code") && data.getStringValue("department") && data.getStringValue("measure_area")
						&& data.getStringValue("area") && data.getStringValue("leader") && data.getStringValue("place_count")){
					$.doXcoRequest(options);
				}
				
			});
			
			$("#cancel").click(function(){
				window.location.href="/view/room/roomlist.jsp";
			})
			
		})
		
		
		//initClass("class_name",'');
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
