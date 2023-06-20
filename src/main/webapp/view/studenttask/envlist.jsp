<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "studentenvlist";
%>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/left.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title><%=title%></title>
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
</head>
<body>
<!--#include virtual="/BIsystem/include/header.html"-->
	
	<!-- PAGE -->
	<section id="page" data-page="studenttask" sub-page="studenttasklist">
		<!--#include virtual="/BIsystem/include/side.html"-->
		<div id="main-content">
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						<!-- PAGE HEADER-->
						<div class="row">
                            <div class="col-sm-12">
                                <div class="page-header">
                                    <!-- BREADCRUMBS -->
                                    <ul class="breadcrumb pull-left">
                                        <li>
                                            <i class="fa fa-home"></i>
                                            <a href="/view/message/msglist.jsp">Home</a>
                                        </li>
                                        <li>虚拟机列表</li>
                                    </ul>
                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                </div>
                            </div>
                        </div>
			<div class="content-in pos-r">
                                <h2 align="center">虚拟机需要通过VPN连接：
					<a target="_black" style="text-decoration:underline;" href="http://dl.jxit.net.cn/jxfiles/jxvpn-wan.pdf">文字教程</a>&nbsp&nbsp
					<a target="_black" style="text-decoration:underline;" href="http://dl.jxit.net.cn/mp4/shizhan/jxstu/jxstu-vpn-usage.mp4">视频教程</a>
				</h2>
                            <div class="t-wrap mt20">
                            	<table class="table table-bordered table-striped center">
                                    <thead>
                                      <tr>
                                        <th width="20%">名称</th>
                                        <th width="10%">类型</th>
					<th width="60%">描述</th>
					<th width="10%">操作</th>
                                      </tr>
                                    </thead>
                                    <tbody id="datatable"></tbody>
                                  </table>
                            </div>
                            <jsp:include page="../common/page.jsp"/>
						</div>
						<!-- /PAGE HEADER -->
					</div><!-- /CONTENT-->
				</div>
			</div>
		</div>
	</section>
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
	<!--My97DatePicker-->
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/jqPaginator.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		//查询虚拟机列表
		doSubmit(); 	
		var renderPage = true;
    		
		function doSubmit(){
  			var options ={
				        url:"/cgi-bin/envlist.sh?user_id=" + <%=user_id%>,
					data: new XCO(),
					success: manage
			};
                        $("#datatable").html("<p>资源加载中...</p>");
			$.doXcoRequest(options);
		}
        
		function manage(xco) {
                        var _dataList = xco.getXCOListValue("data");
                        $("#datatable").html("");
			for (var i = 0; i < _dataList.length; i++) {
                                var type  = _dataList[i].getStringValue("type");
                                var title = _dataList[i].getStringValue("title");
                                var path  = _dataList[i].getStringValue("path");
				var describe = _dataList[i].getStringValue("describe");
				$("#datatable").append('<tr>'
						+ '<td>' + title + '</td>'
						+ '<td>' + type2str(type) + '</td>'
						+ '<td>' + describe + '</td>'
						+ '<td>' + ops2link(path) + '</td>'
						+'</tr>');
			}
		}  

		function type2str(type) {
			if (type == "0"){
                        	return "<font color=\"red\">错误环境</font>";
			} else {
                        	return "<font color=\"green\">正确环境</font>";
			}
                }    
		
		function ops2link(path){
			envurl = "<a href=\"/cgi-bin/doenv.sh?";
                        envparam = envurl + "user_name=<%=user_name%>&path=" + path;
			return envparam + "&action=revert\">恢复</a>&nbsp;" + 
			       envparam + "&action=detail\">详情</a>";
		}
	
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
