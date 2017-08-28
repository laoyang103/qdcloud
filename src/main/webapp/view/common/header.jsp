<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!-- HEADER -->
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="org.xson.common.object.XCO" %>
<%

    response.setHeader("Cache-Control","no-store");  
    response.setDateHeader("Expires", 0);  
    response.setHeader("Pragma","no-cache");   

	// 获取token
	XCO userXCO = (XCO)session.getAttribute("userInfo");
	if(null == userXCO){
		response.sendRedirect("/index.jsp");
		return;
	}
	//org.xson.common.object.XCO userXCO = JspUtils.getUserInfo(token);
	//if(null == userXCO){
	//	response.sendRedirect("/index.jsp");
	//	return;
	//}
	String user_name=userXCO.getStringValue("user_name");
	String real_name=userXCO.getStringValue("real_name");
	long user_id = userXCO.getLongValue("user_id");
	int type = userXCO.getIntegerValue("type");
	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String date = format.format(new Date());
	
	String title = "实验教学统一管理系统";
	
%>
<header class="navbar clearfix navbar-fixed-top" id="header">
  <div class="container">
    <div class="navbar-brand"> 
      <!-- COMPANY LOGO --> 
      <a href="#"> <img style="width:468px;height:72px;top:0px;left:20px;" src="${pageContext.request.contextPath}/img/logo/logo.png" alt="<%=title%>" class="img-responsive"> </a> 
      <!-- /COMPANY LOGO -->     
      <!-- SIDEBAR COLLAPSE -->
      <!--<div id="sidebar-collapse" class="sidebar-collapse btn"> <i class="fa fa-bars" 
							data-icon1="fa fa-bars" 
							data-icon2="fa fa-bars" ></i> </div>-->
      <!-- /SIDEBAR COLLAPSE --> 
    </div>
    
    <!-- BEGIN TOP NAVIGATION MENU -->
    <ul class="nav navbar-nav pull-right">
      <!-- BEGIN USER LOGIN DROPDOWN -->
      <li class="dropdown user pull-right" id="header-user"> <a href="/login/loginout.jhtml" class="dropdown-toggle pull-left"> <i class="fa fa-user fa-fw"></i> <span class="username">退出</span> <a href="../system/changepwd.jsp" class="dropdown-toggle pull-left"> <i class="fa fa-user fa-fw"></i> <span class="username">修改密码</span></a> <a class=" pull-right dropdown-toggle" href="../manual/beginner_guide.html" target="_blank"><i class="fa fa-user fa-fw"></i>帮助</a><a class=" pull-right dropdown-toggle" href="../system/about.jsp" ><i class="fa fa-user fa-fw"></i>关于</a> </li>
      <!-- END USER LOGIN DROPDOWN -->
    </ul>
    <!-- END TOP NAVIGATION MENU --> 
  </div>
</header>
<!--/HEADER --> 