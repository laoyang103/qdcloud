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
     
     var infoid = "${id}";
     $(function(){
		//doSubmit(infoid); 
		doSubmit(0,pageSize);  
		
		
		$("#back").click(function(){
			window.location.href="/view/uploadExcel/excel.jsp";
		})
     })
     //分页查询表格
     var renderPage = true;
     
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
    		$("#down1").hide();
    		$("#down2").hide();
    		$("#list").show();
    	}else{
    		$("#list").hide();
    		$("#down1").show();
    		$("#down2").show();
    		var xco=new XCO();
			xco.setIntegerValue("infoid", infoid);
  			var options ={
					url:"/uploadExcel/download.jhtml",
					data:xco,
					success: result
			};
			$.doXcoRequest(options);
    	}
    }
    
    function result(xco){
    	$("#upload-btn1").attr("href","/"+xco.getStringValue("newpath"));
    	$("#upload-btn2").attr("href","/"+xco.getStringValue("oldpath"));
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
 <!-- 错误列表 -->
  <div class="container" id="list" style="display:none;">
    <table class="table table-bordered">
        <thead>
        <tr>
            <th>序号</th>
            <th>错误说明</th>
        </tr>
        </thead>
        <tbody id="content">
       <!--  <tr>
            <th scope="row">1</th>
            <td>Mark</td>
        </tr> -->
        
        </tbody>
    </table>

     <jsp:include page="../common/page.jsp"/>
    <button type="button" class="btn btn-primary" id="back" style="padding: 5px 50px;float: left;">返回</button>
</div>

<!-- 没有错误显示下载 -->
<div >
	<div class="container text-center" id="down1" style="display:none;">
	    <a href="#" class="btn btn-success" id="upload-btn1"><i class="glyphicon glyphicon-open"></i>下载合同文件</a>
	    
	</div>
	
	<div class="container text-center" id="down2" style="display:none;padding-top: 30px;">
	    <a href="#" class="btn btn-success" id="upload-btn2"><i class="glyphicon glyphicon-open"></i>下载零件文件</a>
	</div>
</div>

  	
  </body>
</html>

