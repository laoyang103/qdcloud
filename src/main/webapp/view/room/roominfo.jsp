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
		<div class="t-wrap mt20">
         	<table class="table table-bordered table-striped center">
                 <thead>
                   <tr>
                     <th width="20%">勾选</th>
                     <th width="40%">实验室编号</th>
                     <th width="40%">实验室名称</th>
                   </tr>
                 </thead>
                 <tbody id="datatable">

             	</tbody>
               </table>
         </div>
         <div style="margin-right:20px;">
		      <jsp:include page="../common/page.jsp"/>
         </div>
     <div class="text-center"><button class="btn btn-primary btn-save" id="select">选择实验室</button></div>
                            
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
		});
		var renderPage = true;
		queryUser();
		
		function queryUser(){
			var xco=new XCO();
  			var options ={
					url:"/room/roomlist.jhtml",
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
            var tdIndex = 1;
            $("#datatable").html("");
            if(_dataList){
				var tdIndex = 1;
				for ( var i = 0; i < _dataList.length; i++) {
					$("#datatable").append('<tr>'
						+'<td><input type="checkbox" value='+_dataList[i].getObjectValue("room_id")+' data-name='+_dataList[i].getObjectValue("room_name")+'></td>'
							+'<td>'+_dataList[i].getObjectValue("room_code")+'</td>'
							+'<td>'+_dataList[i].getObjectValue("room_name")+'</td>'
							+'</tr>')
				}
			}
            if(renderPage){
            	renderPage = false;
            	pageUtil('pagination_1', parseInt(total), queryUser, pageSize);                    	
            }
		}
		
		$(function(){
			$("#select").click(function(){
				var xco = new XCO();
				var str = "";
				var strname = "";
				$("input:checkbox:checked").each(function(index,element){
					if($(element).prop("checked")){
						str += $(element).val()+",";
						strname += $(element).attr("data-name")+",";
					}
				});
				if(str == ""){
					alert("请选择要添加的实验室！！！");
					return;
				}else{
					 parent.$('#room_names').val(strname.substring(0, strname.length-1));
					 parent.$('#room_ids').val(str.substring(0, str.length-1));
					 closeWin();
					//xco.setStringValue("delstr",str.substring(0, str.length-1));
				}
			})
		});
		
		//关闭弹窗
   		function closeWin(){
   			//parent.window.location.href="/view/team/teamlist.jsp";
            var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
            parent.layer.close(index);
   		}
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
