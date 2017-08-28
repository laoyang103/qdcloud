<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "studentlist";
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
.nav li h5 {
	height: 50px;
	line-height: 50px;
	margin: 0;
}

.fonts {
	font-size: 16px;
	font-weight: bold;
}

.navbar-right a:hover {
	color: #fb4141 !important;
}

.navbar-header i {
	font-size: 32px;
	height: 50px;
	line-height: 50px;
	margin-right: 10px;
	color: #fc4141;
}

.input-file-group {
	display: inline-block;
	position: relative;
	width: 256px;
	height: 34px;
}

.input-text {
	border-style: solid;
	border-width: 1px;
	border-color: #888 #ddd #ddd #888;
	height: 34px;
	width: 128px;
	padding-left: 10px;
	line-height: 34px;
	color: #888;
}

.input-file-btn,.input-file {
	position: absolute;
	width: 128px;
	right: 0px;
	top: 0px;
	z-index: 2;
}

.input-file {
	z-index: 5;
	opacity: 0;
	height: 34px;
}
</style>
</head>
<body>
	<!--#include virtual="/BIsystem/include/header.html"-->

	<!-- PAGE -->
	<section id="page" data-page="student" sub-page="studentlist">
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
									<li><i class="fa fa-home"></i> <a
										href="/view/message/msgadminlist.jsp">Home</a></li>
									<li><a href="/view/student/studentlist.jsp">学生列表</a>
									</li>
									<li>批量导入学生</li>
								</ul>

								<div class="pull-right mt10 ml10 hui999">
									当前时间：<span class="hui666"><%=date%></span>
								</div>
								<div class="pull-right mt10 hui999">
									登录人：<span class="blue"><%=real_name%></span>
								</div>
							</div>
						</div>
					</div>
					<div class="content-in pos-r">
						<div class="s-pannel mt20" style="font-size:14px;">
							<b>注：</b>模板格式不容许修改，如出现数据异常，本次导入数据将回滚，求修改后重新提交！
						</div>
						<div class="s-pannel mt20">
							<div role="form" class="form-inline " style="width:1050px;">
								<a href="/download/download.jhtml" class="btn btn-danger"
									type="button" style="margin-bottom:4px;"><i
									class="fa fa-cloud-download fa-fw"></i>下载模板文件</a>

								<form id="fileForm" name="fileForm"
									enctype="multipart/form-data" method="post"
									action="/uploadExcel/excel.jhtml" class="form-inline ml10"
									style="display:inline;">
									<div class="input-file-group">
										<div class="input-text">请选择一个文件..</div>
										<button class="input-file-btn btn-danger btn"
											style="margin-bottom:0px;">选择</button>
										<input type="file" name="file" id="file" class="input-file"
											accept=".xls" />
									</div>
								</form>
								<button type="button" id="button" onclick="subimtBtn()"
									class="btn btn-danger ml5" style="margin-bottom:4px;">
									<i class="fa fa-cloud-upload fa-fw"></i>上传导入文件
								</button>
							</div>
						</div>
						<div class="t-wrap mt20">
							<table class="table table-bordered table-striped center">
								<thead>
									<tr>
										<th width="10%">序号</th>
										<th width="90%">错误信息</th>
									</tr>
								</thead>
								<tbody id="msg">
								</tbody>
							</table>
						</div>
					</div>
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
		src="${pageContext.request.contextPath}/js/public.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/xco3.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery-xco-src3.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.form.js"></script>
	<script>
		jQuery(document).ready(function() {
			App.init(); //Initialise plugins and elements
		});

		$("#file").change(
				function() {
					if ($("#file").val() != null && $("#file").val() != "") {
						var fileName = $("#file").val();
						$(".input-text").text(
								fileName.substring(
										fileName.lastIndexOf("\\") + 1,
										fileName.length));
					} else {
						$(".input-text").text("请选择一个文件..");
					}
				});

		$("#file").click(function() {
			$("#msg").empty();
		})

		function subimtBtn() {
			var form = $("form[name=fileForm]");
			var options = {
				url : '/uploadExcel/excel.jhtml',
				type : 'post',
				contentType : 'application/xco;charset=utf-8',
				dataType : 'xml',
				beforeSubmit : jiaoyan,
				success : function(data) {
					$(".input-text").text("请选择一个文件..");
					$("#file").val("");
					var xco = new XCO();
					xco.fromXML0(data);
					if (xco.getCode() == 0) {
						alert(xco.getMessage());
						location.href = "/view/student/studentlist.jsp";
					} else if (xco.getCode() == 110) {
						alert(xco.getMessage());
						var list = xco.getXCOValue("data").getXCOListValue(
								"imxcoilist");
						var text = "";
						for ( var i = 0; i < list.length; i++) {
							var num = i+1;
							text += "<tr>";
							text += "<td>";
							text += num;
							text += "</td>";
							text += "<td style=\"text-align: left;\">";
							text += list[i].getStringValue("msg");
							text += "</td>";
							text += "</tr>";
						}
						$("#msg").append(text);
					} else if (xco.getCode() == 119) {
						alert(xco.getMessage());
					}
				}
			};
			form.ajaxSubmit(options);
		}

		function jiaoyan() {
			var fileName1 = $("#file").val();
			if (fileName1 != null && fileName1 != '') {
				var type = fileName1.substring(fileName1.lastIndexOf(".") + 1,
						fileName1.length);
				if (type.toUpperCase() == "XLS") {
					return true;
				} else {
					$(".input-text").text("请选择一个文件..");
					$("#file").val("");
					alert("请上传xls格式的文件！");
					return false;
				}
			} else {
				alert("请选择一个文件..");
				return false;
			}
		}
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>
