<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String subpage = "rolelist";
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
	<section id="page" data-page="system" sub-page="rolelist">
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
                                            <a href="/view/message/msgadminlist.jsp">Home</a>
                                        </li>
                                        <li><a href="/view/system/rolelist.jsp">角色管理</a></li>
                                        <li>编辑权限</li>
                                    </ul>

                                    <div class="pull-right mt10 ml10 hui999">当前时间：<span class="hui666"><%=date %></span></div>
                                    <div class="pull-right mt10 hui999">登录人：<span class="blue"><%=real_name %></span></div>
                                    <!-- /BREADCRUMBS -->

                                </div>
                            </div>
                        </div>
						<div class="content-in pos-r">
                        <div class="s-pannel margin-top-50">
                        	 <div role="form" class="form-horizontal font-14">
                        	   <div class="form-group">
                                <label class="col-sm-3 control-label">角色名称：</label>
                                <div class="col-sm-9" id="roleName" style="padding-top: 7px;">
                                  
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">角色状态：</label>
                                <div class="col-sm-9" >
                                	<select class="form-control w210" id="rolestate">
                                      	<option value="0">启用</option>
                                    	<option value="1">停用</option>
                                    </select>
                                </div>
                              </div>
                              <div class="form-group">
                                <label class="col-sm-3 control-label">权限：</label>
                                <div class="col-sm-9">
                                   <div class="treeBox">
                                   		<dl>
                                        	<dt class="pos-r"><span class="arrow1 pos-a"></span>权限树</dt>
                                            <dd style="display:block">
                                            	<ul id="btree">
                                                	<li>
                                                    	<div class="hd pos-r"><span class="arrow1 pos-a"></span>后台管理</div>
                                                        <div class="bd" style="display:block">
                                                        	<div class="item">学生管理</div>
                                                            <div class="item">输入文本...</div>
                                                            <div class="item">输入文本...</div>
                                                            <div class="item">输入文本...</div>
                                                        </div>
                                                    </li>
                                                </ul>
                                            </dd>
                                        </dl>
                                   </div>
                                </div>
                              </div>
                               <div class="form-group">
                                <label class="col-sm-3 control-label"></label>
                                <div class="col-sm-9">
                                    <button class="btn btn-primary mr10 btn-save" type="submit" id="save">保存</button>	
                                    <button class="btn btn-primary mr10 btn-save" type="submit" id="back">返回</button>														
                                </div>
                              </div>
                             </div>
                        
       					   </div>
                       
						</div>
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

	<script type="text/javascript" src="${pageContext.request.contextPath}/js/xco.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/public.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-xco-src.js"></script>
	<script>
		jQuery(document).ready(function() {	
			App.init(); //Initialise plugins and elements
		});
		
		$(function(){
			$("#back").click(function(){
				window.location.href="/view/system/rolelist.jsp";
			});
			
			//保存
			$("#save").click(function(){
				var xco = new XCO();
				var str = "";
				$("input:checkbox:checked").each(function(index,element){
					if($(element).prop("checked")){
						str += $(element).val()+",";
					}
				});
				if(str == ""){
					alert("请选择要分配的记录！！！");
					return;
				}else{
					xco.setStringValue("delstr",str.substring(0, str.length-1));
				}
				xco.setIntegerValue("rolestate", $("#rolestate").val());
				xco.setIntegerValue("role_id",getURLparam("role_id"));
				var options ={
						url:"/role/saveRoleModel.jhtml",
						data:xco,
						success: function(xco){
							if(xco.getCode() == 0){
								alert(xco.getMessage());
							}else{
								alert(xco.getMessage());
								window.location.href="/view/system/rolelist.jsp";
							}
						}
				};
				$.doXcoRequest(options);
				
			})
		})
		
		 //分页查询表格
		doSubmit(); 	

		function doSubmit(){
			var xco=new XCO();
			xco.setIntegerValue("role_id",getURLparam("role_id"));
  			var options ={
					url:"/role/selectRoleById.jhtml",
					data:xco,
					success: manage
			};
			$.doXcoRequest(options);					
		}
        
		function manage(xco){
			//alert(xco.getStringValue("role_name"));
			if(xco){
				$("#roleName").html(xco.getStringValue("role_name"));
			    //$("#rolestate").val(xco.getIntegerValue("state"));
			}
		}
		
		queryBtree();
		
		function queryBtree(){
			var xco=new XCO();
			xco.setIntegerValue("role_id",getURLparam("role_id"));
  			var options ={
					url:"/role/modellist.jhtml",
					data:xco,
					success: function(xco){
						if(xco){
							var str = "";
							var tlist = xco.getXCOListValue("tlist");
							for ( var i = 0; i < tlist.length; i++) {
								str+="<li>";
								str+="<div class=\"hd pos-r\"><span class=\"arrow1 pos-a\"></span>"+tlist[i].getObjectValue("module_name")+"</div>";
								str+="<div class=\"bd\" style=\"display:block\">";
								if(xco.getObjectValue("alist")){
									var alist = xco.getXCOListValue("alist");
									for(var j = 0; j < alist.length; j++){
										if(alist[j].getObjectValue("f_id") == tlist[i].getObjectValue("module_id")){
											var flag = 0;
											var slist = xco.getXCOListValue("slist");
											if(slist){
												for(var k=0;k<slist.length;k++){
													if(alist[j].getObjectValue("module_id") == slist[k].getObjectValue("module_id")){
														flag = 1;
														break;
													}
												}
											}
											if(flag == 1){
												str+="<div class=\"item\"><input type=\"checkbox\" checked value="+alist[j].getObjectValue("module_id")+">"+alist[j].getObjectValue("module_name")+"</div>";
											}else{
												str+="<div class=\"item\"><input type=\"checkbox\" value="+alist[j].getObjectValue("module_id")+">"+alist[j].getObjectValue("module_name")+"</div>";
											}
										}
									}
								}
								str+="</div>";
								str+="</li>";
							}
							$("#btree").html(str);
							$('.treeBox .hd > .arrow1').on('click',function(){
								var oLi = $(this).closest("li");
								oLi.toggleClass("folder");
								oLi.find('.bd').slideToggle(50);
							})
						}
					}
			};
			$.doXcoRequest(options);					
		}
		
		
	
	</script>
	<!-- /JAVASCRIPTS -->	
</body>
</html>
