<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.xson.common.object.XCO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	        .table-bordered tr,td,th{text-align: center;}
	        .navbar-header i{font-size: 32px;height: 50px;line-height: 50px;margin-right: 10px;color: #fc4141;}
	    </style>
  
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/js/xco.js"></script>
    <script type="text/javascript" src="/js/jquery-xco-src.js"></script>
    <script type="text/javascript" src="/js/public.js"></script>
    <script type="text/javascript" src="/js/jqPaginator.js"></script>
	<script type="text/javascript">  
	doSubmit(0,10);
	function doSubmit(start,pageSize){
		var xco=new XCO();
		xco.setIntegerValue("start",start);
		xco.setIntegerValue("pageSize",pageSize);
			var options ={
				url:"/uploadExcel/programlist.jhtml",
				data:xco,
				success: manage
		};
		$.doXcoRequest(options);					
	}
	
	function manage(xco){
    	var count = xco.getIntegerValue("count");
    	if(count > 0){
    	//错误列表 
    		programlist(xco);
    	}
    }
	
	function programlist(xco){
		var total = xco.getIntegerValue("count");
         var _dataList = xco.getXCOListValue("data");
         var tdIndex = 1;
		var keyOptions = [
			function(item){
				return tdIndex++;
			},
			'program_name',
			'remark',
			'operator',
			'create_time',
			function(item){
				return  '<a href="./uploadExcel/methodlist.jhtml?program_id='+item.get("id")+'">查看文档</a>';
			}
		];  
		                    
        renderTable("#content", _dataList, keyOptions); 
        if(renderPage){
        	renderPage = false;
        	pageUtil('pagination', parseInt(total), doSubmit, pageSize);                    	
        }
	
	}
	var renderPage = true;
	</script>
  <body>
  	<nav class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <%--<span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            --%></button>
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
	    <ul class="nav nav-tabs" >
	        <li class="active"><a href="/view/uploadExcel/programlist.jsp" aria-controls="home">文档管理</a></li>
	        <li><a href="/view/uploadExcel/excel.jsp" aria-controls="profile">文档生成</a></li>
	    </ul>
	 	<!-- 错误列表 -->
		  <div class="container">
		    <table class="table table-bordered">
		        <thead>
		        <tr>
		            <th>序号</th>
		            <th>项目名</th>
		            <th>项目描述</th>
		            <th>创建人</th>
		            <th>创建时间</th>
		            <th>操作</th>
		        </tr>
		        </thead>
		        <tbody id="content">
		      
		        </tbody>
		    </table>
		     <jsp:include page="../common/page.jsp"/>
		</div>
	</div>
	<script src="/js/bootstrap.min.js"></script>
  </body>
</html>

