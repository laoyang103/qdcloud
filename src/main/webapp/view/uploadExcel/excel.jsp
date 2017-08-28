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
        .navbar-header i{font-size: 32px;height: 50px;line-height: 50px;margin-right: 10px;color: #fc4141;}
        .input-file-group{
            display: inline-block;
            position:relative;
            width:550px;
            height:50px;
        }
        .input-text{
            border-style:solid;
            border-width:1px;
            border-color: #888 #ddd #ddd #888;
            height: 50px;
            line-height: 40px;
            padding: 5px 15px;
            color:#888;
        }
        .input-file-btn,.input-file{
            position:absolute;
            width:60px;
            height:40px;
            background:#276;
            color:#FFF;
            top:5px;
            right:5px;
            z-index:2;
            border-radius:2px;
        }
        .input-file{
            z-index:5;
            opacity:0;
        }

    </style>
  
    <script type="text/javascript" src="/js/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="/js/xco.js"></script>
    <script type="text/javascript" src="/js/jquery-xco-src.js"></script>
    <script  type="text/javascript" src="/js/jquery.form.js"></script>
    <script type="text/javascript" src="/js/public.js"></script>
    <script type="text/javascript" src="/js/jqPaginator.js"></script>
	<script type="text/javascript">
     
     function uploadFile() {
        var fd = new FormData();
        fd.append("file", document.getElementById('file').files[0]);
        var xhr = new XMLHttpRequest();
        xhr.upload.addEventListener("progress", uploadProgress, false);
        //xhr.open("POST", "/uploadExcel/excel.jhtml");//修改成自己的接口
        //xhr.send(fd);
      }
    
      
	function uploadProgress(evt) {
		if (evt.lengthComputable) {
			var percentComplete = Math.round(evt.loaded * 100 / evt.total);
			document.getElementById('progressNumber').innerHTML = percentComplete
					.toString()
					+ '%';
		} else {
			document.getElementById('progressNumber').innerHTML = 'unable to compute';
		}
	}
	
	function doSubmit(start,pageSize){
		var xco=new XCO();
		xco.setIntegerValue("start",start);
		xco.setIntegerValue("pageSize",pageSize);
		xco.setIntegerValue("infoid", infoid);
			var options ={
				url:"/uploadExcel/errorlist.jhtml",
				data:xco,
				success: manage
		};
		$.doXcoRequest(options);					
	}
	
	function manage(xco){
    	var count = xco.getIntegerValue("count");
    	if(count > 0){
    	//错误列表 
    		errorList(xco);
    	}
    }
	
	function errorList(xco){
		var total = xco.getIntegerValue("count");
         var _dataList = xco.getXCOListValue("data");
         var tdIndex = 1;
		var keyOptions = [
			function(item){
				return tdIndex++;
			},
			function(item){
				return mes(item);
			}
									
		];  
		                    
        renderTable("#content", _dataList, keyOptions); 
        if(renderPage){
        	renderPage = false;
        	pageUtil('pagination', parseInt(total), doSubmit, pageSize);                    	
        }
	
	}
	
	function mes(item){
	 	return "第 "+item.get("sheet")+" 个 sheet  "+item.get("rows")+" 行 : "+item.get("message");
	}
	
	var count = "${count}";
	var flag = "${flag}";
	var infoid = "${id}";
	var renderPage = true;
	
	if(count > 0 && flag == 1){
		//查询出错误列表
		doSubmit(0,pageSize); 
	}else if(flag == 1){
		//setTimeout("alert('对不起, 要你久候')", 3000 );
	}
	
	
	function returnBack(){
		window.location.href="/view/uploadExcel/programlist.jsp"
	}
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
    <ul class="nav nav-tabs" >
        <li ><a href="/view/uploadExcel/programlist.jsp" aria-controls="home">文档管理</a></li>
	    <li class="active"><a href="/view/uploadExcel/excel.jsp" aria-controls="profile">文档生成</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content">
        <div role="tabpanel" class="tab-pane active" id="home">
            <form  enctype="multipart/form-data" method="post" action="/uploadExcel/excel.jhtml" class="form-inline" style="margin-top: 20px;">
                <div class="input-file-group">
                    <div class="input-text">请选择一个文件..</div>
                    <button class="input-file-btn">选择</button>
                    <input type="file" name="file" id="file"  class="input-file" accept=".xls" />
                </div>
                <button type="submit"  id="button" onclick="uploadFile()" class="btn btn-info btn-lg" style="margin-left: 10px;padding: 13px 40px;border-radius: 4px;margin-top: -5px !important;">执行统计</button>
            </form>

        </div>
        
         <div id="progressNumber"></div>
    </div>
    
   <c:choose>
   		<c:when test="${count > 0 && flag == 1}">
   			 <!-- 错误列表 -->
			  <div class="container">
			    <table class="table table-bordered">
			        <thead>
			        <tr>
			            <th>序号</th>
			            <th>错误说明</th>
			        </tr>
			        </thead>
			        <tbody id="content">
			      
			        </tbody>
			    </table>
			     <jsp:include page="../common/page.jsp"/>
			</div>
   		</c:when>
   		<c:when test="${flag == 1}">
   			<!-- 下载列表 -->
			  <div class="container">
			    <table class="table table-bordered">
			        <thead>
			        <tr>
			            <th>导入成功！！！</th>
			        </tr>
			        </thead>
			    </table>
			</div>
   		</c:when>
   </c:choose>
   
</div>


<script src="/js/bootstrap.min.js"></script>
<script>
	
    $(function(){
        var scope = $('.input-file-group');
        var inputText = $('.input-text', scope);
        var inputFile = $('input[type=file]',scope);
        inputFile.bind("change",function(){
            inputText.text(inputFile.val())
        })
    })
</script>
   
   
   		
   		
 
  <!--  <form id="form1" name="upload" enctype="multipart/form-data" method="post" action="/uploadExcel/excel.jhtml">
    <div class="row">
      <label for="file">Select a File to Upload</label><br />
      <input type="file" name="file" id="file" onchange="fileSelected();" accept=".xls" multiple/>
    </div>
              文件名称： <input id="fileName" name="fileName" type="text" accept=".xls"/> 
             存储路径 :<input id="fileUrl" name="fileUrl" type="text"/>     
    
    <div id="fileSize"></div>
   
    <div class="row">
      <input type="button"  value="Upload" id="button" onclick="uploadFile()"/>
    </div>
    <div id="progressNumber"></div>
  </form> -->
  </body>
</html>

