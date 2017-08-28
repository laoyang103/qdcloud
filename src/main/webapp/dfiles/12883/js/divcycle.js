// JavaScript Document

/*****
@author leaves chen (leaves615@gmail.com)
@copyright 2009
*****/
var pause=false;
var scrollTimeId=null;
var container=null;
var lineHeight=null;
var speed=0;
var delay=0;
simpleScroll=function(container1,lineHeight1,speed1,delay1){
container=document.getElementById(container1);
lineHeight=lineHeight1;
speed=speed1;
delay=delay1;
//滚动效果
scrollexc=function(){
if(pause) return ;
container.scrollTop+=2;
var lh=lineHeight||container.getElementsByTagName('li')[0].offsetHeight;
if(container.scrollTop%lh<=1){
clearInterval(scrollTimeId);
fire();
container.scrollTop=0;
setTimeout(start,delay*1000);
}
};
//开始滚动
start=function(){
var lh=lineHeight||container.getElementsByTagName('li')[0].offsetHeight;
if (container.scrollHeight - container.offsetHeight >= lh)
scrollTimeId = setInterval(scrollexc, speed);
};
//把子节点树中的第一个移动到最后
fire=function(){
container.appendChild(container.getElementsByTagName('li')[0]);
};
container.onmouseover=function(){pause=true;};
container.onmouseout=function(){pause=false;};
setTimeout(start,delay*1000);
};