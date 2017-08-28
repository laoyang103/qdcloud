<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "roomlist";
%>
<%@ include file="../common/header.jsp"%>
<%@ include file="../common/left.jsp"%>
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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/cloud-admin.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/themes/night.min.css"
	id="skin-switcher">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/responsive.css">
<!-- FONTS -->
<link
	href="${pageContext.request.contextPath}/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- ANIMATE -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/animatecss/animate.min.css" />
<style>
.scbjj {
	border: 1px solid #BBBBBB;
	padding-left: 15px;
	padding-right: 15px;
	height: 25px;
	font-size: 14px;
}

.ztcolz {
	margin-bottom: 10px;
	height: 30px;
}

.ztcolz dd {
	float: left;
	margin-right: 30px;
}

.ztcolz	.kwbjj {
	width: 70px;
	margin-right: 5px;
	height: 26px;
	border: 1px solid #e1e2e7;
}

.ztcolz	.kwbjj1 {
	width: 70px;
	margin-right: 5px;
	height: 26px;
	border: 1px solid #e1e2e7;
	margin-left: 5px;
}

.col-sm-9 .bjt1 {
	background: #fff;
}

.col-sm-9 .bjt2 {
	background: #ff0000;
}

.col-sm-9 .bjt3 {
	background: #00ff00;
}

.ztcolx {
	height: 30px;
	clear: both;
}

.ztcolx p {
	height: 30px;
	border: 1px solid #e1e2e7;
	float: left;
	line-height: 28px;
	padding-left: 20px;
	padding-right: 20px;
	margin: 0px 18px 0px 0px;
	font-size: 14px;
}

.hbjtz {
	text-align: center;
	height: 35px;
	line-height: 35px;
	clear: both;
}

.table-d table {
	width: 100%;
	border-right: 1px solid #787878;
	border-bottom: 1px solid #787878;
}

.table-d table td {
	border-left: 1px solid #787878;
	border-top: 1px solid #787878;
	height: 30px;
	text-align: center;
}
</style>
</head>
<body>
	<!--#include virtual="/BIsystem/include/header.html"-->

	<!-- PAGE -->
	<section id="page" data-page="room" sub-page="roomlist"> <!--#include virtual="/BIsystem/include/side.html"-->
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
									<li><i class="fa fa-home"></i> <a
										href="/view/message/msgadminlist.jsp">Home</a></li>
									<li><a href="/view/room/roomlist.jsp">实验室列表</a>
									</li>
									<li>查看实验室</li>
								</ul>

								<div class="pull-right mt10 ml10 hui999">
									当前时间：<span class="hui666"><%=date%></span>
								</div>
								<div class="pull-right mt10 hui999">
									管理员：<span class="blue"><%=real_name%></span>
								</div>
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
										<input type="text" value="" id="room_code"
											class="form-control w210 pull-left" disabled>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-3 control-label">实验室名称：</label>
									<div class="col-sm-9">
										<input type="text" id="room_name"
											class="form-control w210 pull-left" disabled>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">院系名称：</label>
									<div class="col-sm-9">
										<input type="text" id="department"
											class="form-control w210 pull-left" disabled>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">面积(平米)：</label>
									<div class="col-sm-9">
										<input type="text" id="measure_area"
											class="form-control w210 pull-left" disabled maxlength="4">
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">负责人：</label>
									<div class="col-sm-9">
										<input type="text" id="leader"
											class="form-control w210 pull-left" disabled>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">地点：</label>
									<div class="col-sm-9">
										<input type="text" id="area"
											class="form-control w210 pull-left" disabled>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">课位数量(个)：</label>
									<div class="col-sm-9">
										<input type="text" id="place_count"
											class="form-control w210 pull-left" disabled>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">课位行：</label>
									<div class="col-sm-9">
										<input type="text" id="room_rows"
											class="form-control w210 pull-left" maxlength="2" disabled
											onkeyup='this.value=this.value.replace(/\D/gi,"")'>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">课位列：</label>
									<div class="col-sm-9">
										<input type="text" id="room_cols"
											class="form-control w210 pull-left" maxlength="2" disabled
											onkeyup='this.value=this.value.replace(/\D/gi,"")'>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label">课位布局：</label>
									<div class="col-sm-9">
										<!-- 
										<div class="ztcolz">
											<dd>
												<input type="text" id="" class="kwbjj">个课位
											</dd>
											<dd>
												共<input type="text" id="" class="kwbjj1">排
											</dd>
											<dd>
												<input type="text" id="" class="kwbjj">列
											</dd>
											<dd>
												<button class="scbjj" type="submit">生成布局</button>
											</dd>
										</div>
										<div class="ztcolx">
											<p class="bjt1">可选</p>
											<p class="bjt2">已预约</p>
											<p class="bjt3">已选</p>
										</div>
										 -->

										<div class="hbjtz">黑板讲台中央</div>

										<div class="table-d">
											<table border="0" cellspacing="1" cellpadding="0">
												<tbody id="rendertab">
													<!-- 
													<tr>
														<td class="bjt1">1</td>
														<td class="bjt2">2</td>
														<td class="bjt3">3</td>
														<td>4</td>
														<td>5</td>
														<td>6</td>
													</tr>
													<tr>
														<td>7</td>
														<td>8</td>
														<td>9</td>
														<td>10</td>
														<td>11</td>
														<td>12</td>
													</tr>
													<tr>
														<td>13</td>
														<td>14</td>
														<td>15</td>
														<td>16</td>
														<td>17</td>
														<td>18</td>
													</tr>
													<tr>
														<td>19</td>
														<td>20</td>
														<td>21</td>
														<td>22</td>
														<td>23</td>
														<td>24</td>
													</tr>
													<tr>
														<td class="bjt2">25</td>
														<td class="bjt1">26</td>
														<td class="bjt3">27</td>
														<td>28</td>
														<td>29</td>
														<td>30</td>
													</tr>
													 -->
												</tbody>
											</table>
										</div>
									</div>
								</div>
								<div class="form-group">
									<label class="col-sm-3 control-label"></label>
									<div class="col-sm-9">
										<button class="btn btn-primary mr10 btn-save" type="submit"
											id="cancel">取消</button>
									</div>
								</div>
							</div>
						</div>

					</div>
					<!-- /PAGE HEADER -->
				</div>
				<!-- /CONTENT-->
			</div>
		</div>
	</div>
	</section>
	<!--/PAGE -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script
		src="${pageContext.request.contextPath}/js/jquery/jquery-2.0.3.min.js"></script>
	<!-- BOOTSTRAP -->
	<script
		src="${pageContext.request.contextPath}/bootstrap-dist/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="${pageContext.request.contextPath}/js/script.js"></script>

	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/xco.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init(); //Initialise plugins and elements
		});

		queryUser();

		function queryUser() {
			var xco = new XCO();
			xco.setIntegerValue("room_id", getURLparam("room_id"));
			var options = {
				url : "/room/selectRoomById.jhtml",
				data : xco,
				success : manage
			};
			$.doXcoRequest(options);
		}

		//渲染单个对象
		function manage(xco) {
			$("#room_code").val(xco.getStringValue("room_code"));
			$("#room_name").val(xco.getStringValue("room_name"));
			$("#department").val(xco.getStringValue("department"));
			$("#measure_area").val(xco.getStringValue("measure_area"));
			$("#leader").val(xco.getStringValue("leader"));
			$("#area").val(xco.getStringValue("area"));
			$("#place_count").val(xco.getStringValue("place_count"));
			$("#room_rows").val(xco.getIntegerValue("room_rows"));
			$("#room_cols").val(xco.getIntegerValue("room_cols"));
			var rows = xco.getIntegerValue("room_rows");
			var cols = xco.getIntegerValue("room_cols");
			var str="";
			var count=0;
			for(var __i=0;__i<rows;__i++){
				str+="<tr>";
				for(var __j=0;__j<cols;__j++){
					count++;
					str+="<td>"+count+"</td>";
				}
				str+="</tr>"
			}
			$("#rendertab").html(str);
		}

		$(function() {
			$("#cancel").click(function() {
				window.location.href = "/view/room/roomlist.jsp";
			})

		})

		//initClass("class_name",'');
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>
