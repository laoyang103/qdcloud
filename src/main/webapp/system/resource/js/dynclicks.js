function _dynClicks_ajax()
{
    var xmlhttp = null;
    try
    {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    catch(e)
    {
        try
        {
            xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch(e)
        {
            try
            {
                xmlhttp = new XMLHttpRequest();
            }
            catch(e)
            {
            }
        }
    }
    return xmlhttp;
} 


function _showDynClicks(clicktype, owner, clickid)
{
    try
    {
        var uid = "dynclicks_" + clicktype + "_" + clickid + "_" + (Math.floor(Math.random()*1000));
        document.write("<span id=\"" + uid + "\" name=\"" + uid + "\"></span>");
        
        var url = '/system/resource/code/news/click/dynclicks.jsp?clickid='+clickid+'&owner='+owner+'&clicktype='+clicktype;
        
        var xmlhttp = _dynClicks_ajax();
    
        xmlhttp.onreadystatechange  = function(){_onShowDynClicks(xmlhttp, uid);};
        xmlhttp.open("GET",url, true);
        xmlhttp.send();
    }
    catch(e)
    {
    }
}

function _showDynClickBatch(spanids,wbnewsids,clicktype, owner)
{
		if(spanids.length == 0 || wbnewsids.length == 0)
				return;
		var usespanids = new Array();
		var usernewsids = new Array();

		for(var i = 0; i < spanids.length; i++)
		{
				if(document.getElementById(spanids[i]) != null)
				{
						usespanids[usespanids.length] = spanids[i];
						usernewsids[usernewsids.length] = wbnewsids[i];
				}	
		}
		if(usespanids.length == 0)
				return;
		try
		{
				var url = '/system/resource/code/news/click/dynclicksbatch.jsp?clickids='+usernewsids+'&owner='+owner+'&clicktype='+clicktype;
        
        var xmlhttp = _dynClicks_ajax();
    
        xmlhttp.onreadystatechange  = function(){_onShowDynClicksBatch(xmlhttp, usespanids);};
        xmlhttp.open("GET",url, true);
        xmlhttp.send();	
		}
		catch(e)
		{
		}
}

function _onShowDynClicksBatch(xmlhttp, uids)
{
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
		{
				var texts = xmlhttp.responseText.split(",");
				for(var i = 0; i < uids.length;i++)
				{
		        try
		        {
		            //针对2个内容重叠而且 id 相同时的处理方法
		            var imgobjs = document.getElementsByName(uids[i]);
		            for(var j = 0; j < imgobjs.length; j++)
		            {
		            		imgobjs[j].innerHTML = texts[i];
		            }
		        }
		        catch(e)
		        {
		        }
		  	}
		}
}

function _onShowDynClicks(xmlhttp, uid)
{
    if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
    {
        try
        {
            document.getElementById(uid).innerHTML = xmlhttp.responseText;
            //针对2个内容重叠而且 id 相同时的处理方法
            var imgobjs = document.getElementsByName(uid);
            if(imgobjs.length>0)
            { 
                     imgobjs[1].innerHTML =  xmlhttp.responseText;
            }            
        }
        catch(e)
        {
        }
    }
}

function _addDynClicks(clicktype, owner, clickid)
{
    try
    {
    	var url = '/system/resource/code/news/click/addclicktimes.jsp?wburlid=' + clickid + '&owner=' + owner + '&type=' + clicktype;
        var xmlhttp = _dynClicks_ajax();
        xmlhttp.open("GET",url, true);
        xmlhttp.send();
    }
    catch(e)
    {
    }
}