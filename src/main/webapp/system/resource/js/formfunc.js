/*按钮之类的提交时disabled, 然后提交完成自动enable; 用在提交动作发生前, 如 onsubmit 中
用法举例： 参见本目录formfuncdemo.htm
*/
function VsbFormFunc()
{
    var _this = this;
    _this.disableAutoEnable = function(o)
    {
        o.disabled=true;
        setTimeout(function(){_this.enableOnComplete(o);}, 500);
    }
    
    _this.enableOnComplete = function(o)
    {
       if(window.document.readyState=='complete')
       {
          o.disabled = false;
       }
       else
       {
           setTimeout(function(){_this.enableOnComplete(o);}, 500);
       }
    }        
};
function changebase64_util(nameList,formName)
{
    if(!!nameList && nameList.length>0)
    {
        for(var i=0;i<nameList.length;i++)
        {
            var realName = nameList[i];
            var tmpName = realName+"_temp"; 
            try{
                var tmpNameObj = eval("document."+formName+"."+tmpName);
                var nameObj  = eval("document."+formName+"."+realName)
                if(tmpNameObj &&nameObj) 
                {
                    nameObj.value=new  Base64().encode(tmpNameObj.value);
                    new VsbFormFunc().disableAutoEnable(tmpNameObj);
                }
             }catch (e){}
        }    
    }
    return true;
}




