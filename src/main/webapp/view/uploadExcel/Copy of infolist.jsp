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
    	form {margin: 0;}
		textarea {display: block;}
       .nav li h5{height: 50px;line-height: 50px;margin: 0;}
       .fonts{font-size: 16px;font-weight: bold;}
       .navbar-right a:hover{color: #fb4141 !important;}
       .table-bordered tr,td,th{text-align: center;}
       .navbar-header i{font-size: 32px;height: 50px;line-height: 50px;margin-right: 10px;color: #fc4141;}
    </style>
  
    <link rel="stylesheet" href="../../kindeditor-4.1.7/themes/default/default.css" />
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/js/xco.js"></script>
    <script type="text/javascript" src="/js/jquery-xco-src.js"></script>
    <script type="text/javascript" src="/js/public.js"></script>
    <script type="text/javascript" src="/js/jqPaginator.js"></script>
	<script charset="utf-8" src="../../kindeditor-4.1.7/kindeditor-min.js"></script>
	<script charset="utf-8" src="../../kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script type="text/javascript">  
	doSubmit();
	
	function doSubmit(start,pageSize){
		var xco=new XCO();
		xco.setIntegerValue("program_id",getURLparam("program_id"));
		var options ={
				url:"/uploadExcel/methodlist.jhtml",
				data:xco,
				success: manage
		};
		$.doXcoRequest(options);					
	}
	
	function manage(xco){
		var _dataList = xco.getXCOListValue("data");
		if(_dataList){
			var tdIndex = 1;
			for ( var i = 0; i < _dataList.length; i++) {
				$("#content").append('<tr>'
					+'<td>'+(tdIndex++)+'</td>'
						+'<td>'+_dataList[i].getObjectValue("remark")+'</td>'
						+'<td>'+_dataList[i].getObjectValue("method_url")+'</td>'
						+'<td> <textarea name="content" style="width:100px;height:50px;visibility:hidden;">'+_dataList[i].getObjectValue("param")+'</textarea></td>'
						+'<td>'+_dataList[i].getObjectValue("return_code")+'</td>'
						+'<td>'+_dataList[i].getObjectValue("return_text")+'</td>'
						+'<td>'+_dataList[i].getObjectValue("preview_area_name")+'</td>'
						+'</tr>')
			}
			var editor;
			KindEditor.ready(function(K) {
				editor = K.create('textarea[name="content"]', {
					resizeType : 1,
					allowPreviewEmoticons : false,
					allowImageUpload : false,
					items : [
						'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
						'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
						'insertunorderedlist', '|', 'emoticons', 'image', 'link']
				});
			});
		}
    }
	
	

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
		<%--<form id="content">
			<textarea name="xuhao" style="width:700px;height:20px;visibility:hidden;">序号</textarea>
			<textarea name="remark" style="width:700px;height:20px;visibility:hidden;"></textarea>
			<textarea name="content" style="width:700px;height:200px;visibility:hidden;">KindEditor3</textarea>
			<textarea name="content" style="width:700px;height:200px;visibility:hidden;">KindEditor4</textarea>
			<textarea name="content" style="width:700px;height:200px;visibility:hidden;">KindEditor5</textarea>
			<textarea name="content" style="width:700px;height:200px;visibility:hidden;">KindEditor6</textarea>
		</form>
	 	--%><!-- 错误列表 -->
		  <div class="container">
		    <table class="table table-bordered">
		        <thead>
		        <tr>
		            <th>序号</th>
		            <th>方法描述</th>
		            <th>方法URL</th>
		            <th>参数</th>
		            <th>code码</th>
		            <th>返回值</th>
		        </tr>
		        </thead>
		        <tbody id="content">
		      
		        </tbody>
		    </table>
		</div>
	</div>
	<script src="/js/bootstrap.min.js"></script>
  </body>
</html>

