<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="org.xson.common.object.XCO" %>
<!-- SIDEBAR -->

<div id="sidebar" class="sidebar sidebar-fixed">
  <div class="sidebar-menu nav-collapse">
    <!-- SIDEBAR MENU -->
    <ul>
	    <%
	    String path1 = request.getContextPath();
	    String url = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path1+"/";
	    
	    Map<String, LinkedHashMap<String, String>> leftNav = new LinkedHashMap<String, LinkedHashMap<String, String>>();
		Map<Long, String> moduleNameMap = new HashMap<Long, String>();
		
	    List<XCO> list = userXCO.getXCOListValue("data");
	    if(null!=list){
		    for (XCO item : list) {
				// System.out.println(item);
				LinkedHashMap<String, String> itemMap = null;
				int level = item.getIntegerValue("level");
				if (1 == level) {
					//System.out.println("=========一级菜单==========="+item.getStringValue("module_name"));
					moduleNameMap.put(item.getLongValue("module_id"), item.getStringValue("module_name"));
					itemMap = new LinkedHashMap<String, String>();
					leftNav.put(item.getStringValue("module_name"), itemMap);
				} else {
					itemMap = leftNav.get(moduleNameMap.get(item.getLongValue("f_id")));
					if(null!=itemMap){
						//System.out.println("=========二级菜单==========="+item.getStringValue("module_name"));
						itemMap.put(item.getStringValue("module_name"), item.getStringValue("url"));
					}
				}
			}
	    }
	    
	    for(Map.Entry<String, LinkedHashMap<String, String>> entry : leftNav.entrySet()){
			String key = entry.getKey();
			//System.out.println("=========key==========="+key);
			String datapage = "";
			if("学生管理".equals(key)){
				datapage = "student";
			}
			if("教师管理".equals(key)){
				datapage = "teacher";
			}
			if("实验室管理".equals(key)){
				datapage = "room";
			}
			if("班级管理".equals(key)){
				datapage = "clazz";
			}
			if("系统管理".equals(key)){
				datapage = "system";
			}
			if("分组管理".equals(key)){
				datapage = "group";
			}
			if("实验项目管理".equals(key)){
				datapage = "experiment";
			}
			if("习题管理".equals(key)){
				datapage = "example";
			}
			if("实验课管理".equals(key)){
				datapage = "task";
			}
			if("学生实验课管理".equals(key)){
				datapage = "studenttask";
			}
			if("讨论管理".equals(key)){
				datapage = "discuss";
			}
			if("消息管理".equals(key)){
				datapage = "message";
			}
			if("考勤管理".equals(key)){
				datapage = "checkwork";
			}
			
			
			LinkedHashMap<String, String> subMap = entry.getValue();
	   	%>
	      <li class="has-sub" data-page="<%=datapage %>"> <a class="" href="javascript:;">  <span class="menu-text"><%=key %></span><span class="arrow"></span>  </a>
	        <ul class="sub">
	      <%
	      for(Map.Entry<String, String> subEntry : subMap.entrySet()){
	    	  String key2 = subEntry.getKey();
	    	  //System.out.println("-------------------"+key2);
	    	    if("实验室列表".equals(key2)){
					subpage = "roomlist";
				}
	    	    if("实验室时间设置".equals(key2)){
					subpage = "roomsetlist";
				}
	    	    if("实验室预约审核".equals(key2)){
					subpage = "roomorderlist";
				}
	    	    if("实验室使用统计".equals(key2)){
					subpage = "roomstatistics";
				}
	    	  	if("管理员权限管理".equals(key2)){
	    		  subpage = "personlist";
				}
				if("教师权限管理".equals(key2)){
	    		  subpage = "teacherlist";
				}
				if("学生权限管理".equals(key2)){
	    		  subpage = "studentlist";
				}
				if("角色管理".equals(key2)){
					subpage = "rolelist";
				}
				
				if("实验课列表".equals(key2)){
		    		subpage = "tasklist";
				}
				if("作业列表".equals(key2)){
					subpage = "worklist";
				}
				if("报告列表".equals(key2)){
					subpage = "reportlist";
				}
				if("考勤列表".equals(key2)){
					subpage = "checkworklist";
				}
				if("预约实验课时".equals(key2)){
					subpage = "roomtimelist";
				}
				if("学生预约课列表".equals(key2)){
					subpage = "yuyuelist";
				}
				if("学生实验课列表".equals(key2)){
					subpage = "studenttasklist";
				}
				
				if("成果展示".equals(key2)){
					subpage = "kycglist";
				}
				if("教学动态".equals(key2)){
					subpage = "kyxmlist";
				}
				if("成果图片维护".equals(key2)){
					subpage = "cgphoto";
				}
				if("轮播图片维护".equals(key2)){
					subpage = "lbphoto";
				}
	      %>
          	<li class="has-sub-sub" sub-page="<%=subpage %>"><a href="<%=url%><%=subEntry.getValue() %>" class=""><span class="sub-menu-text stu-list"><%=subEntry.getKey() %></span></a></li>
	      <%
		      }
	      %>
          </ul>
          <%
		     }
          %>
      	</li>
      
    <!-- /SIDEBAR MENU --> 
  </div>
</div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/gou/mToken_K1.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/gou/mToken_K1Plugin.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/gou/base64.js"></script>
    <script type="text/javascript">
    	//window.onload=function(){ 
			//此方法为定时查找功能,定时查找USB Key是否存在,若USB Key被拔出,5秒钟后将跳转到登录页面重新登录
    	//	K1StartCheckTimer(5000, "未找到对应的USB Key,请插入USB Key重新操作,将跳转到登录页面!", "/login/loginout.jhtml"); 
		//}

	</script>
<!-- /SIDEBAR -->