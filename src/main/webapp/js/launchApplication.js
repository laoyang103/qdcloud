function launchApplication(url, success, fail) {  
    if('msLaunchUri' in navigator){//如果是windows8，IE10+，可以支持这种方式调起客户端。  
        navigator.msLaunchUri(url, success, fail);  
        return;  
    }  
    if (!isDone) return;//如果上次调起客户端没有完成，则直接返回，防止重复调用。  
        isDone = false;  
  
        assistEl.focus();  
        assistEl.onblur = function () {  
        if (document.activeElement && document.activeElement !== assistEl) {  
            assistEl.focus(); //防止用户因为随机操作，而误认为是调起了客户端。  
        } else {  
            done();  
            success();//如果焦点元素，快速失去了焦点，说明客户端已经被调起。  
        }  
    };  
    timeout = setTimeout(function () {  
        done();  
        fail();//如果超过一定时间仍然没有变化，说明没有注册协议  
    },1200);  
    triggerEl.onerror = function () {  
        done();  
        fail();//进入错误事件回调函数说明没有注册协议  
    };  
    try {  
        triggerEl.src = url;  
    } catch(e) {  
        done();  
        fail(); //捕获到异常说明没有注册协议  
    }  
}  