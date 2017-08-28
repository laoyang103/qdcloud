<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<style>
table{width:66%;border-collapse:collapse;border-spacing:0;border-left:1px solid #888;border-top:1px solid #888;background:#efefef;}
th,td{border-right:1px solid #888;border-bottom:1px solid #888;padding:5px 15px;}
th{font-weight:bold;background:#ccc;}
</style>
<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title></title>
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
	<style>
		html,body{ min-width:auto;}
		.t-wrap{ margin:20px;}
	</style>
</head>
<body>
	<div class="form-group" style="margin-top:30px;margin-left:30px;text-align: left;">
		<label class="col-sm-3 control-label">审核意见</label>
		<label class="col-sm-3 control-label inline" style="text-align:left;">
			<span class="lbl"> 不通过</span>
		</label>
		<textarea class="form-control" style="margin-left:110px;margin-top:20px;width:300px;" rows="4" id="reason" disabled="disabled"></textarea>
	</div>
	
     <div class="text-center" style="margin-top:30px"><button class="btn btn-primary btn-save" id="cancel">关闭</button></div>
                            
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jqPaginator.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
			$("#cancel").click(function(){
				closeWin();
			})
		});
		

		queryUser();
		
		function queryUser(){
			var xco=new XCO();
			xco.setIntegerValue("order_id", getURLparam("order_id"));
  			var options ={
					url:"/room/selectOrderRoomTimeById.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
		
		//渲染单个对象
		function manage(xco){
			$("#reason").val(xco.getStringValue("remark"));
			//var flag = xco.getStringValue("audit_state");
		}
		
		//关闭弹窗
   		function closeWin(){
            var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
            parent.layer.close(index);
   		}
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
