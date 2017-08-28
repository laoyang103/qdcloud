<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.xson.common.object.XCO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<%@ include file="common.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
     <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" type="text/css" href="/css/bootstrap.min.css"/>
	<style>
        .nav li h5{height: 50px;line-height: 50px;margin: 0;}
        .fonts{font-size: 16px;font-weight: bold;}
        .navbar-right a:hover{color: #fb4141 !important;}
        .navbar-header i{font-size: 32px;height: 50px;line-height: 50px;margin-right: 10px;color: #fc4141;}
    </style>
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/js/xco.js"></script>
    <script type="text/javascript" src="/js/jquery-xco-src.js"></script>
    <script  type="text/javascript" src="/js/jquery.form.js"></script>
	<script type="text/javascript">
     	$(function(){
     		$("#ok").click(function(){
     			var newpassword = $("#newpassword").val();
     			var okpassword = $("#okpassword").val();
     			var xco = new XCO();
     			if(newpassword == ''){
     				alert("请输入新密码");
     				return false;
     			}else{
     				xco.setStringValue("newpassword", newpassword);
     			}
     			
				if(okpassword == ''){
					alert("请输入确认密码");
     				return false;
     			}else{
     				xco.setStringValue("okpassword", okpassword);
     			}
				
				if(newpassword!=okpassword){
					alert("两次密码输入的不一致，请重新输入");
					return false;
				}
				
				if(xco.getStringValue("okpassword") && xco.getStringValue("newpassword")){
					var options ={
							url:"/login/updatePassword.jhtml",
							data:xco,
							success: manage
					};
					$.doXcoRequest(options);
				}
     		})
     		
     		function manage(xco){

    			if(xco.getCode() > 0){
    				alert("修改成功！");
    				window.location.href="/view/uploadExcel/excel.jsp";
    			}else{
    				alert("修改失败");
    			}
    		}
     		
     		
     	})
	</script>
  
  <body>
  	<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <i class="glyphicon glyphicon-fire"></i>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
                <li class="active"><h5 class="fonts" href="#">合同统计助手V1.0</h5></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><h5 href="../navbar/">你好,<%=user_name%></h5></li>
                <li><a href="/login/loginout.jhtml">[退出]</a></li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>
 <div class="container">
    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist">
         <li ><a href="/view/uploadExcel/excel.jsp" aria-controls="home">合同统计</a></li>
        <li class="active"><a href="/view/uploadExcel/system.jsp" aria-controls="profile">系统管理</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="profile">
            <div class="form-inline" style="margin-top: 20px;">
                <div class="form-group">
                    <label for="exampleInputName2">新密码：</label>
                    <input type="text" class="form-control" id="newpassword" placeholder="">
                </div>
                <div class="form-group">
                    <label for="exampleInputName2">确认密码：</label>
                    <input type="text" class="form-control" id="okpassword" placeholder="">
                </div>
                <button type="button" class="btn btn-warning" id="ok" style="margin-left: 30px;">确定</button>
            </div>
        </div>

    </div>
</div> 

  </body>
</html>

