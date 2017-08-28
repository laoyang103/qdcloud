<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.xson.common.object.XCO" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
<meta http-equiv="X-UA-Compatible" content="IE=9">
<meta name="renderer" content="webkit"/>
<title>成果展示</title>
<meta name="Keywords" content="">
<meta name="Description" content="">
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
<link href="img/style18.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="head">
<object width="1280" height="230" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0">
<param name="movie" value="img/banner.swf">
<param name="quality" value="high">
<param name="menu" value="false">
<param name="wmode" value="transparent">
<embed width="1280" height="230" src="img/banner.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash">
</object>	
</div>

<div class="menu">    
<ul>    
<li ><a href="index.jsp">网站首页</a></li> 
<li class="hover"><a href="cgzslist.jsp">成果展示</a></li>
<li><a href="jxdtlist.jsp">教学动态</a></li>
<li><a href="zytzlist.jsp">重要通知</a></li>
</ul>    
</div>

<div class="fenline"></div>

<div class="main">
<div class="navigation123" style="">当前位置：<a href="/">成果展示</a></div>
	
<div class="LBlb">
<ul id="cgzs">
<!-- 
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>
<li><a href="#">学院隆重召开第四届教职工大会暨工会会员大会第三次会议</a><span>[01-20]</span></li>	
 -->
</ul>
<!-- 
<div align="center" class="fenye" id="fenye">
<span>共100条   <span id="totalpage">1/20</span></span>
<a href="javascript:;" class="frist">首 页</a>
<a href="javascript:;" class="prev">上页</a>
<a href="javascript:;" class="next">下页</a>
<a href="javascript:;" class="end">尾页</a>
<a href="#" class="zdao">转到</a>
<input type="text">页
</div>	
 -->
</div>	
	<div class="text-right pagination" style="text-align: center;">
	    <ul id="pagination_1"></ul>
	</div>			

	
<div class="clear"></div>	
</div>



<div class="fenline"></div>
<div class="foot">
<p>版权所有Copyright © 2013 湖北大学教育学院 All Rights Reserved </p>
<p>院办电话：027-88663361 学工办电话：027-88663592 
</div>
<!-- BOOTSTRAP -->
<script type="text/javascript" src="${pageContext.request.contextPath}/img/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap-dist/js/bootstrap.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/img/jquery.yx_rotaion.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap-dist/js/bootstrap.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jqPaginator.js"></script>
<script type="text/javascript">
var renderPage = true;
var pageSize = 15;
//分页查询表格
doSubmit(0,pageSize);

function doSubmit(start,pageSize){
	var xco=new XCO();
	//传分页条件
	xco.setIntegerValue("start",start);
	xco.setIntegerValue("flag",1);
	xco.setIntegerValue("pageSize",pageSize);
		var options ={
			url:"/news/newslist.jhtml",
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
    $("#cgzs").html("");
    if(_dataList){
		var tdIndex = 1;
		for ( var i = 0; i < _dataList.length; i++) {
			$("#cgzs").append('<li>'
					+'<a href="jxcginfo.jsp?id='+_dataList[i].getLongValue("id")+'">'+_dataList[i].getStringValue("title")+'</a>'
					+'<span>'+render(_dataList[i].getStringValue("create_time"))+'</span>'
					+'</li>');
		}
	}
    if(renderPage){
    	renderPage = false;
    	pageUtil('pagination_1', parseInt(total), doSubmit, pageSize);                    	
    }
	
}  

function render(time){
	var month = time.substring(5,7);
	var day = time.substring(8,10);
	return "["+month+"-"+day+"]";
}

</script>
</body>
</html>
