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
		<div class="t-wrap mt5">
  	<table class="table table-bordered table-striped center">
          <thead>
            <tr>
              <th width="7%">选择</th>
              <th width="13%">姓名</th>
              <th width="7%">选择</th>
              <th width="13%">姓名</th>
              <th width="7%">选择</th>
              <th width="13%">姓名</th>
              <th width="7%">选择</th>
              <th width="13%">姓名</th>
              <th width="7%">选择</th>
              <th width="13%">姓名</th>
            </tr>
          </thead>
          <tbody id="reply">
            
            
            
           
          </tbody>
        </table>
                     
     </div>
     <div class="text-center"><button class="btn btn-primary btn-save" type="submit" id="select">选择学生</button></div>
                            
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
		
		queryUser();
		
		function queryUser(){
			var xco=new XCO();
			if(getURLparam("class_id")){
				xco.setLongValue("class_id", getURLparam("class_id"));
			}else{
				xco.setLongValue("class_id", 0);
			}
  			var options ={
					url:"/group/selectStudentById.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
		
		function manage(xco){
			 var _dataList = xco.getXCOListValue("data");
			 if(_dataList){
				 var tdIndex = 1;
				var str="";
				for ( var i = 0; i < _dataList.length; i++) {
					if(i%5 == 0){
						str+="<tr>";
					}
					str+="<td><input type=\"radio\" name='studentName' value=\""+_dataList[i].getObjectValue("user_id")+"\" data-name=\""+_dataList[i].getObjectValue("real_name")+"\"/></td>";
					str+="<td>"+_dataList[i].getObjectValue("real_name")+"</td>";
					if((i+1)%10 == 0){
						str+="</tr>";
					}
				}
				
				$(str).appendTo($("#reply"));
			 }
		}
		
		var _x = getURLparam("x");
		var _y = getURLparam("y");
		//var station_id = getURLparam("station_id");
		
		$(function(){
			
			$("#select").click(function(){
				var xco = new XCO();
				var str = "";
				var strname = "";
				str = $('input:radio:checked').val();
				strname = $('input:radio:checked').attr("data-name");
				//$("input:checkbox:checked").each(function(index,element){
				//	if($(element).prop("checked")){
				//		str += $(element).val()+",";
				//		strname += $(element).attr("data-name")+",";
				//	}
				//});
				if(str == ""){
					alert("请选择学生！！！");
					return;
				}else{
					var data = new XCO();
					var student_ids = str;
					if(student_ids){
						data.setStringValue("student_ids",student_ids);
					}else{
						alert("请选择学生！");
						return;
					}
					data.setStringValue("student_name",strname);
					data.setLongValue("course_id",getURLparam("course_id"));
					data.setLongValue("time_id",getURLparam("time_id"));
					data.setLongValue("station_id",getURLparam("station_id"));
					var options ={
							url:"/task/insertOrderCourse.jhtml",
							data:data,
							success: function(xco){
								if(xco.getCode() == 0){
									alert(xco.getMessage());
								}else{
									closeWin();
								}
							}
					};
					$.doXcoRequest(options);
					 //parent.$('#td'+_x+_y).html(strname);
					 //parent.$('#student_ids').val(str.substring(0, str.length-1));
					//xco.setStringValue("delstr",str.substring(0, str.length-1));
				}
			})
		});
		
		//关闭弹窗
   		function closeWin(){
   			parent.window.location.reload();
            var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
            parent.layer.close(index);
   		}
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
