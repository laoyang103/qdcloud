<%@ page language="java" pageEncoding="utf8"%>
<%@ page import="java.util.*" %>
<%@ page import="cn.gatherlife.wms.business.util.JspUtils" %>
<%@ page import="org.xson.common.object.XCO" %>
<%

    response.setHeader("Cache-Control","no-store");  
    response.setDateHeader("Expires", 0);  
    response.setHeader("Pragma","no-cache");   

	/* // 获取token
	String token = JspUtils.getToken(request);
	if(null == token){
		response.sendRedirect("/index.jsp");
		return;
	} */
	
	org.xson.common.object.XCO userXCO = (org.xson.common.object.XCO) request.getSession().getAttribute("userInfo");
	
	if(null == userXCO){
		response.sendRedirect("/index.jsp");
		return;
	}
	
	String user_name=userXCO.getStringValue("user_name");
	
%>

