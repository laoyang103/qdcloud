<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.xson.common.object.XCO" %>
<%
	String key = cn.gatherlife.wms.business.util.JspUtils.getImageVerifyKey();
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1"/>
<meta http-equiv="X-UA-Compatible" content="IE=9">
<meta name="renderer" content="webkit"/>
<title>湖北大学教育学院</title>
<meta name="Keywords" content="">
<meta name="Description" content="">
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
<li class="hover"><a href="index.jsp">网站首页</a></li> 
<li><a href="cgzslist.jsp">成果展示</a></li>
<li><a href="jxdtlist.jsp">教学动态</a></li>
<li><a href="zytzlist.jsp">重要通知</a></li>
</ul>    
</div>

<div class="fenline"></div>

<div class="main">

<div class="cgfx">
<div class="title">成果展示 <a href="cgzslist.jsp">更多+</a></div>	
<ul>
<li class="cgzs1"><a href="" target="_blank" id="h1"><img id="c1" src=""></a><p><a href="" target="_blank" id="ct1"></a></p></li>
<li class="cgzs2"><a href="" target="_blank" id="h2"><img id="c2" src=""></a><p><a href="" target="_blank" id="ct2"></a></p></li>
<li class="cgzs3"><a href="" target="_blank" id="h3"><img id="c3" src=""></a><p><a href="" target="_blank" id="ct3"></a></p></li>	
</ul>
</div>	

<div class="cgfxz">
<div class="title">教学动态 <a href="jxdtlist.jsp">更多+</a></div>	

<div class="hdyw-pic" id="TeXiao2">
<ul>
<li><a href="#" target="_blank" id="lb1"><img id="l1" src="" alt=""></a></li>
<li><a href="#" target="_blank" id="lb2"><img id="l2" src="" alt=""></a></li>
<li><a href="#" target="_blank" id="lb3"><img id="l3" src="" alt=""></a></li>
</ul>
</div>

<div class="dtxw20"></div>
<div class="dtxw">
<ul id="news">

</ul>	
</div>

</div>
	 
<div class="cgfxr">
<div class="title">
教学入口	
</div>


<div class="hyzx">
	
	
<div class="delu">
<form name="myform" id="myform" action="UserRegResult.asp" method="post">
<ul class="mt30">
<li>
<span class="label">账号：</span>
<input type="text" name="UserName" id="UserName" value="" placeholder="请输入账号">
<div id="Nameid">
<p id="user_name_msg" style="display: none;">账号不能为空！！</p>
</div>
</li>
			
<li>
<span class="label">密码：</span>
<input type="password" class="emialLock" maxlength="20" id="PassWord" name="PassWord"  placeholder="请输入密码">
<div id="Wordid">
<p id="password_msg" style="display: none;">密码不能为空！！</p>
</div>
</li>

<li>
<span class="label">身份：</span>
<select class="select" id="Question" style="width:170px;">
<option value="1">学生</option>
<option value="2">教师</option>
<option value="3">管理员</option>
</select> 
<div id="Wordid2"></div>				
</li>
		
		
<li>
<span class="label2">验证码：</span>
<input type="text" class="verifycode" maxlength="20" id="verifycode" name="verifycode"  value="" placeholder="请输验证码">
<img title="点击刷新" align="absmiddle" style="margin-right:25px;" src="<%=request.getContextPath()%>/jcaptcha/verify.do?key=<%=key %>" onclick="verifyFun()" id="imgVer">
<div id="code2">
<p id="verifycode_msg" style="display: none;">验证码不能为空！！</p>
</div>
</li>		
			
</ul>
<ul style="padding-top: 0px;">
		    
<li>
<input type="Button" class="btn_reg" id="btnSubmit" onclick="doLogin();" value="登录">
</li>
		
</ul>
</form>	
	
	
</div>
	
		
<div class="title">重要通知</div>
<div class="dtxwq">				
<ul id="message">

</ul>
</div>	
</div>
	
</div>	
<div class="clear"></div>	
</div>



<div class="fenline"></div>
<div class="foot">
<p>版权所有Copyright © 2013 湖北大学教育学院 All Rights Reserved </p>
<p>院办电话：027-88663361 学工办电话：027-88663592  
</p>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/img/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/img/jquery.yx_rotaion.js"></script>
<script src="${pageContext.request.contextPath}/bootstrap-dist/js/bootstrap.min.js"></script>	
<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/gou/mToken_K1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/gou/mToken_K1Plugin.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/gou/base64.js"></script>
<script type="text/javascript">
$("#TeXiao1").yx_rotaion({auto:true});
$("#TeXiao2").yx_rotaion({
auto:true,
css_yx_rotaion_btn:"yx-rotaion-btn1",
css_left_btn:"left_btn1",
css_right_btn:"right_btn1",
css_yx_rotation_title:"yx-rotation-title1",
css_yx_rotation_t:"yx-rotation-t1",
css_yx_rotation_focus:"yx-rotation-focus1"
});

//刷新验证码
function verifyFun(){
	var imgVer = document.getElementById("imgVer");
	imgVer.src = '<%=request.getContextPath()%>/jcaptcha/verify.do?key=<%=key %>&time ='+new Date();
}

query1();

function query1(){
	var xco=new XCO();
	xco.setIntegerValue("photo_type", 0);
		var options ={
			url:"/index/photolist.jhtml",
			data:xco,
			success: manage1
	};
	$.doXcoRequest(options);					
}

//渲染单个对象
function manage1(xco){
	var total = 0;
	if(xco.getIntegerValue("total")){
		total = xco.getIntegerValue("total");
	}
    var _dataList = xco.getXCOListValue("data");
    if(_dataList){
		for ( var i = 0; i < _dataList.length; i++) {
			$("#c"+(i+1)).attr("src",_dataList[i].getStringValue("photo_src"));
			$("#ct"+(i+1)).text(_dataList[i].getStringValue("photo_title"));
			$("#ct"+(i+1)).attr("href",_dataList[i].getStringValue("photo_link"));
			$("#h"+(i+1)).attr("href",_dataList[i].getStringValue("photo_link"));
		}	
	}
}

query2();

function query2(){
	var xco=new XCO();
	xco.setIntegerValue("photo_type", 1);
		var options ={
			url:"/index/photolist.jhtml",
			data:xco,
			success: manage2
	};
	$.doXcoRequest(options);					
}

//渲染单个对象
function manage2(xco){
	var total = 0;
	if(xco.getIntegerValue("total")){
		total = xco.getIntegerValue("total");
	}
    var _dataList = xco.getXCOListValue("data");
    if(_dataList){
		for ( var i = 0; i < _dataList.length; i++) {
			$("#l"+(i+1)).attr("alt",_dataList[i].getStringValue("photo_title"));
			$("#l"+(i+1)).attr("src",_dataList[i].getStringValue("photo_src"));
			$("#lb"+(i+1)).attr("href",_dataList[i].getStringValue("photo_link"));
		}	
	}
}


queryNews();

function queryNews(){
	var xco=new XCO();
	xco.setIntegerValue("start", 0);
	xco.setIntegerValue("flag", 2);
	xco.setIntegerValue("pageSize", 4);
		var options ={
			url:"/news/newslist.jhtml",
			data:xco,
			success: manageNews
	};
	$.doXcoRequest(options);					
}

//渲染单个对象
function manageNews(xco){
	//alert(xco);
	var total = 0;
	if(xco.getIntegerValue("total")){
		total = xco.getIntegerValue("total");
	}
	$("#news").html("");
    var _dataList = xco.getXCOListValue("data");
    if(_dataList){
		for ( var i = 0; i < _dataList.length; i++) {
			$("#news").append('<li>'
					+'<a href="jxdtinfo.jsp?id='+_dataList[i].getLongValue("id")+'">'+renderJXDT(_dataList[i].getStringValue("title"))+'</a>'
					+'<span>'+render(_dataList[i].getStringValue("create_time"))+'</span>'
					+'</li>');
		}	
	}
}

function renderJXDT(title){
	if(title.length > 24){
		title = title.substring(0,24);
	}
	return title;
}

function renderJXTZ(title){
	if(title.length > 12){
		title = title.substring(0,12);
	}
	return title;
}


function render(time){
	var month = time.substring(5,7);
	var day = time.substring(8,10);
	return "["+month+"-"+day+"]";
}


queryMessage();

function queryMessage(){
	var xco=new XCO();
	xco.setIntegerValue("start", 0);
	xco.setIntegerValue("pageSize", 5);
		var options ={
			url:"/message/messagelist2.jhtml",
			data:xco,
			success: manageMessage
	};
	$.doXcoRequest(options);					
}

//渲染单个对象
function manageMessage(xco){
	//alert(xco);
	var total = 0;
	if(xco.getIntegerValue("total")){
		total = xco.getIntegerValue("total");
	}
	$("#message").html("");
    var _dataList = xco.getXCOListValue("data");
    if(_dataList){
		for ( var i = 0; i < _dataList.length; i++) {
			$("#message").append('<li>'
					+'<a href="zytzinfo.jsp?id='+_dataList[i].getLongValue("message_id")+'">'+renderJXTZ(_dataList[i].getStringValue("message_name"))+'</a>'
					+'<span>'+render(_dataList[i].getStringValue("create_time"))+'</span>'
					+'</li>');
		}	
	}
}

function render2(time){
	var month = time.substring(5,7);
	var day = time.substring(8,10);
	return "["+month+"-"+day+"]";
}
$(document).keydown(function(e) {  
    if (e.keyCode == 13) {  
    	doLogin();
    }  
});  
//登录
function doLogin(){
	var xco = new XCO();
	var user_name = $("#UserName").val();
	if(user_name){
		xco.setStringValue("user_name",user_name);
	}else{
		$("#user_name_msg").show();
	}
	
	var password = $("#PassWord").val();
	if(password){
		xco.setStringValue("password",password);
	}else{
		$("#password_msg").show();
	}
	
	var verifyCode = $("#verifycode").val();
	if(verifyCode){
		xco.setStringValue("verifyCode",verifyCode);
	}else{
		$("#verifycode_msg").show();
	}
	xco.setIntegerValue("type", $("#Question").val());
	if(xco.getStringValue("user_name") && xco.getStringValue("password") && xco.getStringValue("verifyCode") && xco.getIntegerValue("type")){
		var options ={
				url:"/login/login.jhtml",
				data:xco,
				success: manage
		};
		//if(K1mTokenFindDevice()){
			$.doXcoRequest(options);
		//}
	}
	
}

function manage(xco){
	//alert(xco.getObjectValue("data"));
	if(xco.getCode() == 0){
		var type = xco.getObjectValue("data").getObjectValue("type");
		if(type == 1){
			window.location.href="/view/message/msglist.jsp";
		}else if(type == 2){
			window.location.href="/view/message/msglist.jsp";
		}else{
			//window.location.href="/view/message/sendmsg.jsp";
			window.location.href="view/message/msgadminlist.jsp";
		}
	}else if(xco.getCode() == 1){
		 $("#verifyCode").val("");
		var mes = xco.getMessage();
		alert(mes);
	}else{
		var mes = xco.getMessage();
		alert(mes);
	}
	verifyFun();
}
</script>
</body>
</html>
