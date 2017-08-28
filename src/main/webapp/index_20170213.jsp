<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="org.xson.common.object.XCO" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String title = "实验教学统一管理系统";
//String key = cn.gatherlife.wms.business.util.JspUtils.getImageVerifyKey();
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title><%=title%></title>
	<meta name="description" content="">
	<meta name="author" content="">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<!--[if lt IE 9]>
    <script src="js/html5.js"></script>
    <script src="js/css3-mediaqueries.js"></script>
    <![endif]-->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/common.css" >
	<link rel="stylesheet" type="text/css"  href="${pageContext.request.contextPath}/css/module.css">
   <body>
	  <div class="page pos_r">
		<div class="header overHidden">
	    	<img src="images/logo.png" class="logo fl">
	    </div>
	    <div class="content pos_a">
		    <div class="inner overHidden pos_r">
		    	<ul class="menu fl">
		        	<li id="start"><a href="ECluster:" onclick="return myclick();"  style="color:#fff;">智能控制</a></li>
		            <li>智能教学</li>
		            <li>统一管理</li>
		            <li>设置</li>
		        </ul>
		          <iframe id="trigger_protocol_ifrm" style="display:none"></iframe>  
	    			<input type="hidden" id="protocolTxt" value="ECluster:" />  
	    		<input  id="checkBtn" type="hidden"/>  
		        <div class="overHidden">
		        	<div class="mapBox pos_r">
		        	<!-- 
						<div class="tabBox" style="display:none;" id="t1">
		                	<ul class="showList overHidden" style="margin-left:240px;">
		                    </ul>
		                </div>
		        	 -->
		            	<div class="tabBox" style="display:none;" id="t2">
		                	<ul class="showList overHidden" style="margin-left:240px;">
		                        <li class="show3" style="margin-top:83px;"><a href="login.jsp"><img src="images/gl1.png"></a></li>
		                        <li class="show4" style="margin:83px 0 0 60px;"><a id="tiaozhuan"><img src="images/gl2.png"></a></li>
		                    </ul>
		                </div>
		            	<div class="tabBox" style="display:none;" id="t3">
		                	<ul class="showList overHidden ml-20">
		                    	<li class="show1"><a href="#"><img src="images/jx1.png"></a></li>
		                        <li class="show2"><a href="#"><img src="images/jx2.png"></a></li>
		                        <li class="show3"><a href="#"><img src="images/jx3.png"></a></li>
		                        <li class="show4"><a href="#"><img src="images/jx4.png"></a></li>
		                        <li class="show5"><a href="#"><img src="images/jx5.png"></a></li>
		                        <li class="show6"><a href="#"><img src="images/jx6.png"></a></li>
		                    </ul>
		                </div>
		                <div class="tabBox" style="display:none;" id="t4">
		                	<ul class="showList overHidden" style="margin-top:-5px;">
		                    	<li class="show0"><a href="#"><img src="images/ty1.png"></a></li>
		                        <li class="show1"><a href="#"><img src="images/ty2.png"></a></li>
		                        <li class="show2"><a href="#"><img src="images/ty3.png"></a></li>
		                        <li class="show3"><a href="#"><img src="images/ty4.png"></a></li>
		                        <li class="show4"><a href="#"><img src="images/ty5.png"></a></li>
		                        <li class="show5"><a href="#"><img src="images/ty6.png"></a></li>
		                        <li class="show6"><a href="#"><img src="images/ty7.png"></a></li>
		                        <li class="show7"><a href="#"><img src="images/ty8.png"></a></li>
		                    </ul>
		                </div>
		                <div class="tabBox" style="display:none;" id="t5">
		                	<ul class="showList overHidden" style="margin-left:240px;">
		                        <li class="show3" style="margin-top:83px;"><a href="#"><img src="images/sz1.png"></a></li>
		                        <li class="show4" style="margin:83px 0 0 60px;"><a href="#"><img src="images/sz2.png"></a></li>
		                    </ul>
		                </div>
		            </div>
		        </div>
		        
		    </div>
		    <div class="footer">
		    	<div class="footer1 tr"><img src="/images/footer.png"></div>
		    </div>
	    </div>
	</div>	
	<!-- JQUERY -->
	<script src="${pageContext.request.contextPath}/js/jquery/jquery-2.0.3.min.js"></script>
	<!-- /JAVASCRIPTS -->
	<script type="text/javascript">
	
	
    function myclick(){
    	var url = document.getElementById('protocolTxt').value;  
        launchApplication(url, function(){  
        	return true;
        }, function(){  
            alert("请安装运行系统！");  
	        return false;
        }); 
    }
    
     
      
    var isDone = true;  
    var timeout;  
    var assistEl = document.getElementById('checkBtn');  
    var triggerEl = document.getElementById('trigger_protocol_ifrm');  
      
    function done(){  
        isDone = true;  
        assistEl.onblur = null;  
        triggerEl.onerror = null;  
        clearTimeout(timeout);  
    }  
     
    function launchApplication(url, success, fail){  
        if(!isDone)return;  
        isDone = false;  
          
        assistEl.focus();  
        assistEl.onblur = function(){  
            if(document.activeElement && document.activeElement !== assistEl){  
                assistEl.focus();  
            } else {  
                done();  
                success();            
            }  
        };  
          
        triggerEl.onerror = function(){  
            done();  
            fail();  
        };  
  
  
        try{  
            triggerEl.src = url;  
        }catch(e){  
            done();  
            fail();  
            return;  
        }  
  
  
        timeout = setTimeout(function(){  
            fail();  
        }, 1000);  
    }  
    
    function initPage(){
		var oH = $(document).height(),
			mH = oH-222,oT='';
		if(mH > 500){
			oT = (mH-500)/2;
			$(".mapBox").css("margin-top",oT);
			
		}else{
			$(".mapBox").css("margin-top","0");
		}
	}
	initPage();
    
	$(function(){
		
		var timer = '';
		$(window).resize(function(){
			clearTimeout(timer);
			timer = setTimeout(initPage,150);
		});
		$("#tiaozhuan").on("click",function(){
				//$("#t1").hide();
				$("#t2").hide();
				$("#t3").hide();
				$("#t4").show();
				$("#t5").hide();
		});
		$(".menu li").on("click",function(){
			var index=$(this).index();
			if(index !=0){
				$("#start").children().css("color","#fff");
			}
			$(this).addClass("current").siblings().removeClass("current");

			if($(this).html().indexOf("智能控制") > 0){
				$(this).children().css("color","#ffbe00");
				//$("#t1").hide();
				$("#t2").hide();
				$("#t3").hide();
				$("#t4").hide();
				$("#t5").hide();
			}else if($(this).html() == "智能教学"){
				//$("#t1").hide();
				$("#t2").hide();
				$("#t3").show();
				$("#t4").hide();
				$("#t5").hide();
			}else if($(this).html() == "统一管理"){
				//$("#t1").hide();
				$("#t2").show();
				$("#t3").hide();
				$("#t4").hide();
				$("#t5").hide();	
			}else{
				//$("#t1").hide();
				$("#t2").hide();
				$("#t3").hide();
				$("#t4").hide();
				$("#t5").show();
			}
		})
	})
	</script>
</html>

