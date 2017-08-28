//预加载图像
//imgsrc 图片地址
//imgid 图片id
//onimgload 回调函数, 会把 预加载图片 和 imgid 作为参数传入
function VsbPreloadImg(imgsrc, imgid, onimgload)
{
    var _this = this; //把this保存下来，以后用_this代替this，这样就不会被this弄晕了
	var img = new Image();

    //图片加载完毕事件, 内部调用， 不对外
	var vsbpreloadimg_onimgload = function()
    {
        //循环播放的 gif 每播放一次 会调用 一次 onload 所以在这里进行判断,避免反复调用
         if(img.getAttribute("loadedflag")==true)
        {
            return;   
        }
        img.setAttribute("loadedflag", true);
		if(onimgload != undefined && onimgload != null)
	        onimgload(_this, imgid);
    }

	//显示图片
	//imgobj 要显示的图片对象
	//maxwidth 最大宽 不设置则忽略
	//maxheight 最大高 不设置则忽略
	//stretch 是否变形 默认false 
	//zoomin 是否放大 默认false
	_this.showImg = function(imgobj, maxwidth, maxheight, stretch, zoomin)
	{
		//如果图片未加载完成
		if(img.getAttribute("loadedflag") == null)
		{
			imgobj.src = "about:blank";
			imgobj.removeAttribute("src");
			return;
		}
		
		//图片正常加载
		
		//未设置图片最大大小
		if(maxwidth == undefined || maxheight == undefined || maxwidth == 0 || maxheight == 0)
		{
			imgobj.width = img.width;
			imgobj.height = img.height;
		}
		else
		{
            var widthrate = img.width / maxwidth;
            var heightrate = img.height / maxheight;
            var imgwidth = 0;
            var imgheight = 0;
            if(widthrate > 1 || heightrate > 1) //图片过大时
            {
                if(stretch == undefined || stretch == false)//按比例缩小
                {
                    var rate = Math.max(widthrate, heightrate);
                    
                    imgwidth = Math.max(1, Math.min(Math.ceil(img.width/rate), maxwidth));
                    imgheight = Math.max(1, Math.min(Math.ceil(img.height/rate), maxheight));
                }
                else//拉伸
                {
                    imgwidth = maxwidth;
                    imgheight = maxheight;
                }
            }
            else if(widthrate < 1 || heightrate < 1) //图片小
            {
                if(zoomin == true)//自动放大
                {
                    if(stretch == undefined || stretch == false)//按比例放大
                    {
                        var rate = Math.max(widthrate, heightrate);
                        imgwidth = Math.max(1, Math.min(Math.ceil(img.width/rate), maxwidth));
                        imgheight = Math.max(1, Math.min(Math.ceil(img.height/rate), maxheight));
                    }
                    else //拉伸
                    {
                        imgwidth = maxwidth;
                        imgheight = maxheight;
                    }
                }
                else
                {
                   imgwidth = img.width;
                   imgheight = img.height;
                }
            }
            else
            {
                imgwidth = maxwidth;
                imgheight = maxheight;
            }
            if(imgobj)
            {
            	imgobj.width = imgwidth;
				imgobj.height = imgheight;
            }
		}
		if(imgobj)
        {
			imgobj.src = img.src;
		}
	}
	
	_this.getImage = function()
	{
		return img;
	}
	
	_this.setAttribute = function (name, value)
	{
		img.setAttribute(name, value);
	}

	_this.getAttribute = function (name)
	{
		return img.getAttribute(name);
	}

	_this.getSrc= function ()
	{
		return img.src;
	}
	
	_this.getWidth= function ()
	{
		return img.width;
	}
	
	_this.getHeight = function ()
	{
		return img.height;
	}

	//设置图片
	img.onload = function(){vsbpreloadimg_onimgload()};
	img.src = imgsrc;
}


//预加载图像组
function VsbPreloadImgArray()
{
    var _this = this; //把this保存下来，以后用_this代替this，这样就不会被this弄晕了
    _this.imgs = new Array(); //图片组

    //添加图片
	//imgsrc 图片地址
	//imgid 图片id
	//onimgload 回调函数, 会把 预加载图片 和 imgid 作为参数传入
    _this.addImg = function(imgsrc, imgid, onimgload)
    {
        var imgcount = _this.imgs.length;
        _this.imgs[imgcount] = new VsbPreloadImg(imgsrc, imgid, onimgload);
		_this.imgs[imgcount].setAttribute("imgindex", imgcount);
    }
    
    //获取图片个数
    _this.size = function()
    {
        return _this.imgs.length;
    }
	
	_this.length = _this.size;
	
	_this.getImage = function(index)
	{
		return _this.imgs[index];
	}
	
}