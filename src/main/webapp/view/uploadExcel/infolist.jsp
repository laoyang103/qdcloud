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
		textarea {overflow:auto; background-attachment:fixed;background-repeat:no-repeat;border-style:solid;border-color: #FFFFFF}
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
	var count = "${count}";
	var paramArr = [];
	var textArr = [];
	KindEditor.ready(function(K) {
		for(var i=0;i<count;i++){
			var param = 'param'+i;
			paramArr.push(param);
			paramArr[i] = K.create("textarea[name=\"pcontent"+i+"\"]", {
				resizeType : 1,
				readonlyMode : true,
				items : []
			});
			
			var autoheight1=paramArr[i].edit.doc.body.scrollHeight;
			paramArr[i].edit.setHeight(autoheight1);
			 
			
			var text = 'text'+i;
			textArr.push(text);
			textArr[i] = K.create("textarea[name=\"tcontent"+i+"\"]", {
				resizeType : 1,
				width:"80%",
				readonlyMode : true,
				items : []
			});
			
			var autoheight2=textArr[i].edit.doc.body.scrollHeight;
			textArr[i].edit.setHeight(autoheight2);
		}
		
		$('.ke-contaner').hide();
		$('.ke-toolbar').hide();
		$('.ke-statusbar').hide();
		//$('.ke-edit').hide();
	});
		
	function returnBack(){
		window.location.href="/view/uploadExcel/programlist.jsp"
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
	    <div class="container">
		    <table class="table table-bordered">
				<c:forEach var="method" items="${list}" varStatus="status">
					<tr>
						<td style="text-align: left;">
							<a href="javascript:redirect(${method.id});">${status.index + 1}.${method.remark}</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	<c:forEach var="method" items="${list}" varStatus="status"> 
		  <div class="container">
		    <table class="table table-bordered">
		        <%--<tr>
		        	<td>序号</td>
		        	<td>${status.index + 1}</td>
		        </tr>
		        --%>
		        <tr bgcolor="#ccc">
		        	<div id="${method.id}">
			        	<td >方法描述</td>
			        	<td style="text-align: left;">${method.remark}</td>
		        	</div>
		        </tr>
		        <tr>
		        	<td>方法URL</td>
		        	<td style="text-align: left;">${method.methodUrl}</td>
		        </tr>
		        <tr>
		        	 <td>参数</td>
		        	<td style="text-align: left;"><textarea name="pcontent${status.index}" style="visibility:hidden;border-color:#00FFFF;">${method.param}</textarea></td>
		       	</tr>
		       	<tr>
		       		<td>code码</td>
		        	<td style="text-align: left;">${method.returnCode}</td>
		        </tr>
		        <tr>
		        	<td>返回值</td>
		        	<td style="text-align: left;">
		        		<textarea name="tcontent${status.index}" style="visibility:hidden;">${method.returnText}</textarea>
		        	</td>
		        </tr>
		        <tr>
		        	<td colspan="2"><a href="./uploadExcel/edit.jhtml?method_id=${method.id}">编辑</a><a style="margin-left: 10px;" href="javascript:returnBack();">返回</a></td>
		        </tr>
		    </table>
		</div>
	</c:forEach>
	</div>
	<script src="/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	function redirect(param){
		var url=window.location.href;
		if(url.indexOf("#") > 0){
			url = url.substring(0, url.indexOf("#"));
		}
		url+="#"+param;
		window.location.href=url;
	}
			
</script>
  </body>
</html>

