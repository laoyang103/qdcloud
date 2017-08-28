<%@ page language="java" pageEncoding="utf8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.xson.common.object.XCO" %>
<%

    response.setHeader("Cache-Control","no-store");  
    response.setDateHeader("Expires", 0);  
    response.setHeader("Pragma","no-cache");   

    
	// 获取token
	String token = session.getAttribute("userInfo");
	if(null == token){
		response.sendRedirect("/index.jsp");
		return;
	}
	//org.xson.common.object.XCO userXCO = JspUtils.getUserInfo(token);
	//if(null == userXCO){
	//	response.sendRedirect("/index.jsp");
	//	return;
	//}
	String user_name=userXCO.getStringValue("user_name");
	
%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

    
   
    <!-- PAGE CONTENT BEGINS HERE -->
    <!-- basic scripts -->
    <script src="/js/jquery-1.11.1.min.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <!-- page specific plugin scripts -->

    <!--[if lt IE 9]>
    <script type="text/javascript" src="/js/excanvas.min.js"></script>
    <![endif]-->
    <script type="text/javascript" src="/js/jquery-ui-1.10.2.custom.min.js"></script>
    <script type="text/javascript" src="/js/jquery.ui.touch-punch.min.js"></script>
    <script type="text/javascript" src="/js/jquery.slimscroll.min.js"></script>
    <script type="text/javascript" src="/js/jquery.easy-pie-chart.min.js"></script>
    <script type="text/javascript" src="/js/jquery.sparkline.min.js"></script>
    <script type="text/javascript" src="/js/xco.js"></script>
    <script type="text/javascript" src="/js/public.js"></script>
    <script type="text/javascript" src="/js/jquery-xco-src.js"></script>
    <!-- ace scripts -->
    <script src="/js/ace-elements.min.js"></script>
    <script src="/js/ace.min.js"></script>
     <script type="text/javascript" src="/js/bootstrap-datepicker.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="/js/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="/js/date.js"></script> 
    <script type="text/javascript" src="/js/daterangepicker.min.js"></script> 
   
    <script type="text/javascript" src="/js/jqPaginator.js"></script>
    <script type="text/javascript" src="/js/map.js"></script>
     <script src="/layer/layer.js"></script>
    <style>
    	 .icon-little-logo{
                            background: url("${pageContext.request.contextPath}/libs/image/logo_w.png") no-repeat center center !important;
                            width:20px;height:20px;
                            vertical-align:bottom;
    }
    </style>
</head>
<body>
<div class="navbar navbar-inverse">
    <div class="navbar-inner">
        <div class="container-fluid">
            <a class="brand" href="#"><small><i class="icon-little-logo logo"></i>沧运仓储系统</small> </a>
            <ul class="nav ace-nav pull-right">

                <li class="light-blue user-profile">
                    <a class="user-menu dropdown-toggle" href="#" data-toggle="dropdown">
                         <img alt="Jason's Photo" src="/avatars/user01.jpg" class="nav-user-photo" />
							<span id="user_info">
								<%=user_name %>
							</span>
                        <i class="icon-caret-down"></i>
                    </a>
                    <ul id="user_menu" class="pull-right dropdown-menu dropdown-yellow dropdown-caret dropdown-closer">
                       <!--  <li><a href="#"><i class="icon-cog"></i> 个人设置</a></li> -->
                        <li><a href="javascript:void(0);" id="updateBtn" ><i class="icon-user"></i> 修改密码</a></li>
                        <li class="divider"></li>
                        <li><a href="/login/pcsignout.jhtml"><i class="icon-off"></i> 退出系统</a></li>
                    </ul>
                </li>
            </ul><!--/.ace-nav-->
        </div><!--/.container-fluid-->
    </div><!--/.navbar-inner-->
</div><!--/.navbar-->
<div class="container-fluid" id="main-container">
    <a href="#" id="menu-toggler"><span></span></a><!-- menu toggler -->
    <div id="sidebar">
    	<!-- #sidebar-shortcuts
        <div id="sidebar-shortcuts">
            <div id="sidebar-shortcuts-large">
                <button class="btn btn-small btn-success"><i class="icon-signal"></i></button>
                <button class="btn btn-small btn-info"><i class="icon-pencil"></i></button>
                <button class="btn btn-small btn-warning"><i class="icon-group"></i></button>
                <button class="btn btn-small btn-danger"><i class="icon-cogs"></i></button>
            </div>
            <div id="sidebar-shortcuts-mini">
                <span class="btn btn-success"></span>
                <span class="btn btn-info"></span>
                <span class="btn btn-warning"></span>
                <span class="btn btn-danger"></span>
            </div>
        </div> -->

        <ul class="nav nav-list">
			<%
				// String pageName = "退货单列表";
				// String pageName = "";
				int role_id = 0;
				try{
					role_id = (int) userXCO.getLongValue("role_id");
				} catch (Exception e){
					return;
				}
				
				Map<String, LinkedHashMap<String, String>> leftNav = com.gatherlife.tvr.web.controller.StaticController.getUserModuleByRole(role_id);
				if(null == leftNav){
					return;
				}
				for(Map.Entry<String, LinkedHashMap<String, String>> entry : leftNav.entrySet()){
					String iconClass = " class='icon-reorder'";
					String key = entry.getKey();
					if("入库业务".equals(key)){
						iconClass = " class='icon-reorder'";
					}else if("出库业务".equals(key)){
						iconClass = " class='icon-share'";
					}else if("调仓业务".equals(key)){
						iconClass = " class='icon-retweet'";
					}else if("盘点业务".equals(key)){
						iconClass = " class='icon-spinner'";
					}else if("异常记录".equals(key)){
						iconClass = " class='icon-warning-sign'";
					}else if("基础信息".equals(key)){
						iconClass = " class='icon-wrench'";
					}else if("库存查询".equals(key)){
						iconClass = " class='icon-building'";
					}else if("系统管理".equals(key)){
						iconClass = " class='icon-cog'";
					}
					LinkedHashMap<String, String> subMap = entry.getValue();
					String liClass = "";
					if(null != subMap.get(pageName)){
						liClass = " class=\"active open\"";
					}
			%>
			<li<%=liClass %>>
                <a href="#" class="dropdown-toggle">
                    <i <%=iconClass %>></i>
                    <span><%=key %></span>
                    <b class="arrow icon-angle-down"></b>
                </a>
                <ul class="submenu">
			<%		
					for(Map.Entry<String, String> subEntry : subMap.entrySet()){
						String subLiClass = ""; 
						if(liClass.length() > 0 && subEntry.getKey().equalsIgnoreCase(pageName)){
							subLiClass = " class=\"active\"";
						}						
			%>
                    <li<%=subLiClass %>><a href="<%=subEntry.getValue() %>"><i class="icon-double-angle-right"></i><%=subEntry.getKey() %></a></li>
			<%			
					}
			%>
                </ul>
            </li>				
			<%
				}
			%>        
        </ul><!--/.nav-list-->

        <div id="sidebar-collapse"><i class="icon-double-angle-left"></i></div>
        
    </div><!--/#sidebar-->
</div>
</body>
<script type="text/javascript">
    $("#updateBtn").click(function(){
          var url = encodeURI(encodeURI("/view/user/modifyPwd.jsp"));
        	layer.open({
				type: 2,
				title: "修改密码",
				maxmin: true,
				shadeClose: true, //点击遮罩关闭层
				area : ["400px" , "300px"],
				content: url
			});
        });
	
/*
function doAjax() {
	var xco=new XCO();
	var options ={
		url:"/xco/test3.jhtml",
		data:xco,
		success: doCallBack
	};
	$.doXcoRequest(options);
}
function doCallBack(data){
	alert('doCallBack:' + data);
}
doAjax();
*/
//window.location.replace("/index.jsp");
</script>

</html>

