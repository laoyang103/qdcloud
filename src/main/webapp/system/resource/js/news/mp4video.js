//正文中输出mp4播放代码 
//浏览器支持flash时，使用flowplayer播放器，否则支持html5时使用html5的video标签播放
function showVsbVideo(vurl,vheight,vwidth,align,style,vautoplay,mid)
{
	if(vurl=="")
	{
	    return;   
	}
	var outputHTML="";
	//浏览器类型
	var browserName= getBrowsers();
	//先判断是否是ie，几率大一些
	if(browserName=="msie")
	{
			outputHTML=outPutFlashVideo(vurl,vheight,vwidth,vautoplay,align,style,mid);
	}else if(browserName=="chrome")
	{
	        outputHTML=outPutFlashVideo(vurl,vheight,vwidth,vautoplay,align,style,mid);
	}else if(browserName=="firefox")
	{
			outputHTML=outPutFlashVideo(vurl,vheight,vwidth,vautoplay,align,style,mid);
	}else if(browserName=="android")
	{
		if(hasPlayHtml5Vedio())
		{
			  outputHTML=outPutHTML5Video(vurl,vheight,vwidth,vautoplay,align,style,mid);
		}else
		{
			  outputHTML=outPutFlashVideo(vurl,vheight,vwidth,vautoplay,align,style,mid);
		}
	}else if(browserName=="safari")
	{
		if(hasPlayHtml5Vedio())
		{
			outputHTML=outPutHTML5Video(vurl,vheight,vwidth,vautoplay,align,style,mid);
		}else
		{
			outputHTML=outPutFlashVideo(vurl,vheight,vwidth,vautoplay,align,style,mid);
		}
	}else 
	{
			outputHTML=outPutHTML5Video(vurl,vheight,vwidth,vautoplay,align,style,mid);
	}	
	document.write(outputHTML);      
}

function hasPlayHtml5Vedio()
{
	var a=document.createElement("video"),	c=!!a.canPlayType;
	if(c)
	{
		c=new Boolean(c),
		c.ogg=a.canPlayType('video/ogg; codecs="theora"');
		var d='video/mp4; codecs="avc1.42E01E';
		c.h264=a.canPlayType(d+'"')||a.canPlayType(d+', mp4a.40.2"'),c.webm=a.canPlayType('video/webm; codecs="vp8, vorbis"')
	}
	return c;			
}
function outPutFlashVideo(videoUrl,wHeight,wWidth,bautoPlay,align,style,mid)
{
		if(!mid||mid=="")
		{
		    mid="id=_vsb_player";
		}
		var flashUrl='<object '+mid+' align="'+align+'" style="'+style+'" type="application/x-shockwave-flash" data="/system/resource/swf/flowplayer.commercial.swf"  '+wWidth+'  '+wHeight+'>';
		var configstr='&quot;playlist&quot;:[{&quot;url&quot;:&quot;'+videoUrl+'&quot;,&quot;scaling&quot;:&quot;fit&quot;,&quot;autoPlay&quot;:'+bautoPlay+',&quot;autoBuffering&quot;:&quot;false&quot;}]';
		flashUrl=flashUrl+'<param name="flashvars" value="config={'+configstr+'}">';
		flashUrl=flashUrl+'<param name="allowfullscreen" value="true"><param name="allowscriptaccess" value="sameDomain"><param name="quality" value="high"><param name="cachebusting" value="false"><param name="bgcolor" value="#000000"><param name="src" value="/system/resource/swf/flowplayer.commercial.swf">';
		flashUrl=flashUrl+'</object>';
		return flashUrl;
		
}

function outPutHTML5Video(videoUrl,wHeight,wWidth,bautoPlay,align,style)
{
		var res='<video controls style="background-color:#474747;'+style+'" align="'+align+'" '+wWidth+'  '+wHeight;
		if(bautoPlay&&bautoPlay=="true")
		{
		    res+=' autoplay="autoplay" ';
		}
		res +='><source src="'+videoUrl+'" type="video/mp4" /></video> ';
		return  res;
}	


//获得浏览器类别名称
function getBrowsers()
{
	var userinfo = navigator.userAgent.toLowerCase();
	var arrayBrowser = new Array("msie", "firefox", "android","chrome","safari", "opera", "netscape");
	for(var i = 0; i < arrayBrowser.length; i ++)
	{
		if(userinfo.indexOf(arrayBrowser[i]) != -1)
		{
			return arrayBrowser[i];
		}
		if(/(msie\s|trident.*rv:)([\w.]+)/.test(userinfo)) return "msie";
	}
	return "other";
}

function outVideoForMobile(vurl,vheight,vwidth,vautoplay)
{
        //手机显示时，视频宽度为设备宽度
        if(hasPlayHtml5Vedio())
        {
		    var res='<video controls="controls"  width="'+document.body.clientWidth+'"';
    		if(bautoPlay&&bautoPlay=="true")
    		{
    		    res+=' autoplay="autoplay" ';
    		}
    		res +='><source src="'+vurl+'" type="video/mp4" /></video> ';
		
    		document.write(res);    
		}    
		else
		    alert("不支持");        
}