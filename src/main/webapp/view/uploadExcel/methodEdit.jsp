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
    <script type="text/javascript" src="/js/base64.js"></script>
    <script type="text/javascript" src="/js/jquery-xco-src.js"></script>
    <script type="text/javascript" src="/js/public.js"></script>
    <script  type="text/javascript" src="/js/jquery.form.js"></script>
	<script charset="utf-8" src="../../kindeditor-4.1.7/kindeditor-min.js"></script>
	<script charset="utf-8" src="../../kindeditor-4.1.7/lang/zh_CN.js"></script>
	<script type="text/javascript">  
		var eparam;
		var ereturntext;
		KindEditor.ready(function(K) {
			eparam = K.create('textarea[name="eparam"]', {
				resizeType : 1,
				allowPreviewEmoticons : false,
				allowImageUpload : false,
				items : []
			});
			
			var autoheight1=eparam.edit.doc.body.scrollHeight;
			eparam.edit.setHeight(autoheight1);
			 
			ereturntext = K.create('textarea[name="ereturntext"]', {
				resizeType : 1,
				allowPreviewEmoticons : false,
				allowImageUpload : false,
				items : []
			});
			
			var autoheight2=ereturntext.edit.doc.body.scrollHeight;
			ereturntext.edit.setHeight(autoheight2);
			
			$('.ke-contaner').hide();
			$('.ke-toolbar').hide();
			$('.ke-statusbar').hide();
		});
		
		function tijiao(){
			$("#method_remark").val($("#remark").text());
			$("#method_url").val($("#url").text());
			$("#method_param").val(eparam.html());
			$("#method_code").val($("#returncode").text());
			$("#method_text").val(ereturntext.html());
			$("#editForm").submit();
		}
		
		function before(){
			$("#method_remark").val($("#remark").val());
			$("#method_url").val($("#url").val());
			$("#method_param").val(eparam.html());
			$("#method_code").val($("#returncode").val());
			$("#method_text").val(ereturntext.html());
		}
		
		$(document).ready(function () {
			$("#back").click(function(){
				window.location.href="/uploadExcel/methodlist.jhtml?program_id=${method.programId}";
			})
			
			$("#tijiao").click(function () {
				before();
	            var options = {
	                url: './uploadExcel/save.jhtml',
	                type: 'post',
	                dataType: 'text',
	                data: $("#editForm").serialize(),
	                success: function (data) {
                    	alert("修改成功");
                    	window.location.href="/uploadExcel/methodlist.jhtml?program_id=${method.programId}";
	                }
	            };
	            if($("#method_remark").val() == ''){
	            	alert("请输入方法描述");
	            	return false;
	            }
	            if($("#method_url").val() == ''){
	            	alert("请输入方法URL");
	            	return false;
	            }
	            if($("#method_param").val() == ''){
	            	alert("请输入方法参数");
	            	return false;
	            }
	            if($("#method_code").val() == ''){
	            	alert("请输入返回code码");
	            	return false;
	            }
	            if($("#method_text").val() == ''){
	            	alert("请输入返回值");
	            	return false;
	            }
	            
	            $.ajax(options);
	            return false;
			})
		 });
	
	</script>
  <body>
  	<form name="editForm" id="editForm" method="post" action="./uploadExcel/save.jhtml">
		<input type="hidden" name="method_remark" id="method_remark"/>
		<input type="hidden" name="method_url" id="method_url"/>
		<input type="hidden" name="method_param" id="method_param"/>
		<input type="hidden" name="method_code" id="method_code"/>
		<input type="hidden" name="method_text" id="method_text"/>
		<input type="hidden" name="method_id" id="method_id" value="${method_id}"/>
		<input type="hidden" name="program_id" id="program_id" value="${method.programId}"/>
	</form>
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
		        <tr>
		            <td>方法描述</td>
		            <td><input type="text" id="remark" name="remark" value="${method.remark }" style="width: 100%;"/></td>
		        </tr>
		        <tr>
		            <td>方法url</td>
		            <td ><input type="text" id="url" name="url" value="${method.methodUrl}" style="width: 100%;"/></td>
		        </tr>
		        <tr>
		            <td>方法参数</td>
		            <td><textarea  name="eparam" style="width: 100%;height:200px;visibility:hidden;" >${method.param}</textarea></td>
		        </tr>
		        <tr>
		            <td>code码</td>
		            <td style="text-align: left;"><input type="text" id="returncode" name="returncode" value="${method.returnCode}"/></td>
		        </tr>
		        <tr>
		            <td>返回值</td>
		            <td >
		            	<textarea  name="ereturntext" style="width: 100%;height:200px;visibility:hidden;">${method.returnText}</textarea>
		            </td>
		        </tr>
		 		<tr>
		            <td colspan="2"><button type="button" id="tijiao">修改</button><button style="margin-left: 10px;" type="button" id="back">返回</button></td>
		        </tr>
		    </table>
		</div>
	</div>
	<script src="/js/bootstrap.min.js"></script>
  </body>
</html>

