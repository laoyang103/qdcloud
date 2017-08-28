/*var start = 0;//当前页码
var pageSize = 10;
var total = 0;
$(function(){
	//上一页
	$("#topclick").click(function(){
		if(start>0){
			start--;
			doSubmit(start*pageSize,pageSize);
		}
	});
	//下一页
	$("#downclick").click(function(){
		if(start < parseInt(total/pageSize)){
			start++;
			doSubmit(start*pageSize,pageSize);
		}
		start++;
		doSubmit(start*pageSize,pageSize);
	});
	
	//分页的的首页和未页
	$("#first").bind("click",function(){
		start = 0;
		doSubmit(start,pageSize);
	});
	$("#last").bind("click",function(){
		if(total > 0){
			start=parseInt(total/pageSize);
			doSubmit(start*pageSize,pageSize);
		}
	});
})
*/

var pageSize = 10;
// 简单FORM参数采集
function simpleFormCollect(request, keyOptions){
	for(var k=0; k<keyOptions.length; k++){
		var item = keyOptions[k];
		var _itemKey = item.itemKey;
		var _type = item.type;
		var _xcoKey = item.xcoKey;
		var _ignore = item.ignore;
		if(undefined == _xcoKey){
			_xcoKey = _itemKey;
		}
		if(undefined == _type){
			_type = 'string';
		}
		if(undefined == _ignore){
			_ignore = true;
		}
		var _temp = $('#' + _itemKey).val();
		if(!_ignore || (_temp != '' && undefined != _temp)){
			setXCORequest(request, _type, _xcoKey, _temp);
		}
	}
}

function setXCORequest(request, type, key, val){
	if('int' == type){
		request.setIntegerValue(key, parseInt(val));
	} else if('long' == type){
		request.setLongValue(key, parseInt(val));
	} else if('string' == type){
		request.setStringValue(key, val);
	} else if('date' == type){
		request.setDateTimeValue(key, val);
	}
}

function renderTable(container, dataList, keyOptions, trClass,noclear){
	if(!noclear)$(container).empty();
		
	var html = '';
	var _trClass = '';
	if(undefined != trClass){
		_trClass = ' ' + trClass;
	}

	if(null == dataList || undefined == dataList){
		return;
	}

	for(var i=0; i<dataList.length; i++){
		var dataItem = dataList[i];
		html += '<tr'+ _trClass +'>';
		for(var k=0; k<keyOptions.length; k++){
			var dataKey = keyOptions[k];
			if('string' == typeof(dataKey)){
				html += '<td>'+ dataItem.get(dataKey) +'</td>';
			} else if('function' == typeof(dataKey)) {
				html += '<td>'+ dataKey(dataItem) +'</td>';
			} else if('object' == typeof(dataKey)) {
				var _key = dataKey.key;
				var _td = dataKey.td;
				var _handler = dataKey.handler;
				if(undefined != _key && undefined != _td){
					html += '<td '+ _td +'>'+ dataItem.get(_key) +'</td>';
				} else if(undefined != _handler && undefined != _td) {
					html += '<td '+ _td +'>'+ _handler(dataItem) +'</td>';
				} else {
					html += '<td>请不要这样使用</td>';
				}
			}
		}
		html += '</tr>';
	}
	console.log(html);
	$(container).append(html);
}
//填充详情信息
function showInfo(request, showOptions,isInput){
	for(var k=0; k<showOptions.length; k++){
		var item = showOptions[k];
		var _itemKey = item.itemKey;
		var _xcoKey = item.xcoKey;
		var _defaultVal = item.defaultVal;
		var _func = item.function;
		if(_itemKey.indexOf("#")<0 && _itemKey.indexOf(".")<0 ){
			_itemKey = "#"+_itemKey;
		}
		if(undefined == _xcoKey){//#.
			_xcoKey = _itemKey.substr(1,_itemKey.length);
		}
		if(undefined == _defaultVal){
			_defaultVal = '-';
		}
		var _temp = request.get(_xcoKey);
		
		if(undefined != _func){
			if(isInput){
				$(_itemKey).val(_func(_temp));
			}else{
				$(_itemKey).html(_func(_temp));
			}
		}else{
			if(_temp == null || undefined == _temp){
				_temp = _defaultVal
			}
			if(isInput){
				$(_itemKey).val(_temp);
			}else{
				$(_itemKey).html(_temp);
			}
		}
	}
}
/**
 * 初始化select工具
 * @param selectId	容器
 * @param url		
 * @param optionVal	 选项value对于的xco的key
 * @param optionName	选项的name对于的xco的key
 * @param checkedVal	预选中的值
 */
function initSelectOption(selectId,url,optionVal,optionName,checkedVal){
	var options ={
			url:url,
			data:new XCO(),
			success: render
	};
	$.doXcoRequest(options);
	function render(data){
		var list = data.get("data");
		if(!list)list = data.get("list");
		if(list){
			for(var i=0;i<list.length;i++){
				$("#"+selectId).append("<option xco='"+list[i]+"'  value='"+list[i].get(optionVal)+"' "+(list[i].get(optionVal)==checkedVal?"selected":"")+">"+list[i].get(optionName)+"</option>");
			}
		}
	}
}

/**
 * 初始化班级
 * @param selectId	容器	
 */
function initClass(selectId,t){
	var xco = new XCO();
	var options ={
			url:"/class/classSelect.jhtml",
			data:xco,
			success: render
	};
	$.doXcoRequest(options);
	function render(data){
		var list = data.get("data");
		if(list){
			for(var i=0;i<list.length;i++){
				if(list[i].get("class_id") == t){
					$("#"+selectId).append("<option selected value='"+list[i].get("class_id")+"'>"+list[i].get("class_name")+"</option>");
				}else{
					$("#"+selectId).append("<option value='"+list[i].get("class_id")+"'>"+list[i].get("class_name")+"</option>");
				}
			}
		}
	}
}

/**
 * 初始化院系
 * @param selectId	容器	
 */
function initDept(selectId,t){
	var xco = new XCO();
	var options ={
			url:"/class/departSelect.jhtml",
			data:xco,
			success: render
	};
	$.doXcoRequest(options);
	function render(data){
		var list = data.get("data");
		if(list){
			for(var i=0;i<list.length;i++){
				if(list[i].get("department_id") == t){
					$("#"+selectId).append("<option selected value='"+list[i].get("department_id")+"'>"+list[i].get("department_name")+"</option>");
				}else{
					$("#"+selectId).append("<option value='"+list[i].get("department_id")+"'>"+list[i].get("department_name")+"</option>");
				}
			}
		}
	}
}

/**
 * 初始化实验类型
 * @param selectId	容器	
 */
function initType(selectId,t){
	var xco = new XCO();
	var options ={
			url:"/experiment/typeSelect.jhtml",
			data:xco,
			success: render
	};
	$.doXcoRequest(options);
	function render(data){
		var list = data.get("data");
		if(list){
			for(var i=0;i<list.length;i++){
				if(list[i].get("type_id") == t){
					$("#"+selectId).append("<option selected value='"+list[i].get("type_id")+"'>"+list[i].get("type_name")+"</option>");
				}else{
					$("#"+selectId).append("<option value='"+list[i].get("type_id")+"'>"+list[i].get("type_name")+"</option>");
				}
			}
		}
	}
}

/**
 * 初始化教室
 * @param selectId	容器	
 */
function initRoom(selectId,t){
	var xco = new XCO();
	var options ={
			url:"/room/roomSelect.jhtml",
			data:xco,
			success: render
	};
	$.doXcoRequest(options);
	function render(data){
		var list = data.get("data");
		if(list){
			for(var i=0;i<list.length;i++){
				if(list[i].get("room_id") == t){
					$("#"+selectId).append("<option selected value='"+list[i].get("room_id")+"'>"+list[i].get("room_name")+"</option>");
				}else{
					$("#"+selectId).append("<option value='"+list[i].get("room_id")+"'>"+list[i].get("room_name")+"</option>");
				}
			}
		}
	}
}

/**
 * 初始化教师
 * @param selectId	容器	
 */
function initTeacher(selectId,type,t){
	var xco = new XCO();
	xco.setIntegerValue("type",type);
	var options ={
			url:"/user/userSelect.jhtml",
			data:xco,
			success: render
	};
	$.doXcoRequest(options);
	function render(data){
		var list = data.get("data");
		if(list){
			for(var i=0;i<list.length;i++){
				if(list[i].get("user_id") == t){
					$("#"+selectId).append("<option selected value='"+list[i].get("user_id")+"'>"+list[i].get("real_name")+"</option>");
				}else{
					$("#"+selectId).append("<option value='"+list[i].get("user_id")+"'>"+list[i].get("real_name")+"</option>");
				}
			}
		}
	}
}

/**
 * 初始化组
 * @param selectId	容器	
 */
function initGroup(selectId,t){
	var xco = new XCO();
	var options ={
			url:"/group/groupSelect.jhtml",
			data:xco,
			success: render
	};
	$.doXcoRequest(options);
	function render(data){
		var list = data.get("data");
		if(list){
			for(var i=0;i<list.length;i++){
				if(list[i].get("group_id") == t){
					$("#"+selectId).append("<option selected value='"+list[i].get("group_id")+"'>"+list[i].get("group_name")+"</option>");
				}else{
					$("#"+selectId).append("<option value='"+list[i].get("group_id")+"'>"+list[i].get("group_name")+"</option>");
				}
			}
		}
	}
}

/**
 * 初始化实验下拉框
 * @param selectId	容器	
 */
function initExperiment(selectId,t){
	var xco = new XCO();
	//if(t){
	//	xco.setLongValue("t",t);
	//}else{
	//	xco.setLongValue("t",0);
	//}
	var options ={
			url:"/experiment/experimentSelect.jhtml",
			data:xco,
			success: render
	};
	$.doXcoRequest(options);
	function render(data){
		var list = data.get("data");
		if(list){
			for(var i=0;i<list.length;i++){
				if(list[i].get("experiment_id") == t){
					$("#"+selectId).append("<option selected value='"+list[i].get("experiment_id")+"'>"+list[i].get("experiment_name")+"</option>");
				}else{
					$("#"+selectId).append("<option value='"+list[i].get("experiment_id")+"'>"+list[i].get("experiment_name")+"</option>");
				}
			}
		}
	}
}

/**
 * 初始化习题下拉框
 * @param selectId	容器	
 */
function initExample(selectId,t){
	var xco = new XCO();
	//if(t){
	//	xco.setLongValue("t",t);
	//}else{
	//	xco.setLongValue("t",0);
	//}
	var options ={
			url:"/example/exampleSelect.jhtml",
			data:xco,
			success: render
	};
	$.doXcoRequest(options);
	function render(data){
		var list = data.get("data");
		if(list){
			for(var i=0;i<list.length;i++){
				if(list[i].get("example_id") == t){
					$("#"+selectId).append("<option selected value='"+list[i].get("example_id")+"'>"+list[i].get("example_name")+"</option>");
				}else{
					$("#"+selectId).append("<option value='"+list[i].get("example_id")+"'>"+list[i].get("example_name")+"</option>");
				}
			}
		}
	}
}

/**
 * 初始化货位规格
 * @param selectId	容器	
 */
function initSpaceSpec(selectId){
	var xco = new XCO();
	var options ={
			url:"/instock/initSpaceSpec.jhtml",
			data:xco,
			success: render
	};
	$.doXcoRequest(options);
	function render(data){
		var list = data.get("data");
		if(list){
			for(var i=0;i<list.length;i++){
				$("#"+selectId).append("<option value='"+list[i].get("area_code")+"'>"+list[i].get("name")+"</option>");
			}
		}
	}
}

function getURLparam(name) {
    var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
    var r = window.location.search.substr(1).match(reg);
    if (r != null) {
        return unescape(r[2]);
    }
    return null;
}

//设置URL参数的方法
function setURLparam(parms, parmsValue) {
    var urlstrings = document.URL;
    var values = getURLparam(parms);
    //如果参数不存在，则添加参数       
    if (values == undefined) {
        var query = location.search.substring(1); //获取查询串 
        //如果Url中已经有参数，则附加参数
        if (query) {
            urlstrings += ("&" + parms + "=" + parmsValue);
        }
        else {
            urlstrings += ("?" + parms + "=" + parmsValue);  //向Url中添加第一个参数
        }
        window.location = urlstrings;
    }
    else {
        window.location = updateParms(parms, parmsValue);  //修改参数
    }
}

//修改URL参数，parms：参数名，parmsValue：参数值，return：修改后的URL
function updateParms(parms, parmsValue) {
    var newUrlParms = "";
    var newUrlBase = location.href.substring(0, location.href.indexOf("?") + 1); //截取查询字符串前面的url
    var query = location.search.substring(1); //获取查询串   
    var pairs = query.split("&"); //在逗号处断开   
    for (var i = 0; i < pairs.length; i++) {
        var pos = pairs[i].indexOf('='); //查找name=value   
        if (pos == -1) continue; //如果没有找到就跳过   
        var argname = pairs[i].substring(0, pos); //提取name   
        var value = pairs[i].substring(pos + 1); //提取value 
        //如果找到了要修改的参数
        if (findText(argname, parms)) {
            newUrlParms = newUrlParms + (argname + "=" + parmsValue + "&");
        }
        else {
            newUrlParms += (argname + "=" + value + "&");
        }
    }
    return newUrlBase + newUrlParms.substring(0, newUrlParms.length - 1);
}

//辅助方法
function findText(urlString, keyWord) {
    return urlString.toLowerCase().indexOf(keyWord.toLowerCase()) != -1 ? true : false;
}
function multiply(num){
	return parseInt(num)*1000;
}
function divide(num){
	return parseInt(num)/1000;
}
/**
 * 
 * @param shelf_code
 * @param index
 * @returns
 */
function manageCode(shelf_code,index){
	if(index){
		index +=3;
	}else{
		index=2;
		if(shelf_code==undefined || shelf_code.indexOf("_")>-1){
			return ;
		}
	}
	
	if(shelf_code.length>index){
		shelf_code = shelf_code.substr(0,index)+"_"+shelf_code.substr(index);
		return manageCode(shelf_code,index);
	}
	return shelf_code;
}


/**@auth:jiangbo
 * @date:2016-06-29
 * @desc:校验表格数据是否异常,异常变色
 * @param index1 [td 下标1]
 * @param index2 [td 下标2]
 * @param bgColor[背景颜色]
 * @param color	 [字体颜色]
 * @param tbId	 [表格ID]
 * @returns
 */

function checkTableData(tbId,index1,index2,bgColor,color) {
	$("#"+tbId+" tr").each(function() {
		var should_num = $(this).find("td:eq("+index1+")").text();
		var real_num = $(this).find("td:eq("+index2+")").text();
		if(should_num!=real_num) {
			$(this).find("td").css("background",bgColor).css("color",color);
			$(this).find("td:eq("+index1+")").css("background","gray").css("color",color);
			$(this).find("td:eq("+index2+")").css("background","gray").css("color",color);
		}
	});
}


//function errMsg(xco){
function checkError(xco){
	if(xco.getCode()==0){
		return false;
	}else{
		$("#errormsg").html(xco.getMessage());
		$("#errdialog").modal("show");
		return true;
	}
}

//function errMsg(xco){
function showErrorMessage(message){
	$("#errormsg").html(message);
	$("#errdialog").modal("show");
}

function showMessage(message){
	$("#normalmsg").html(message);
	$("#normaldialog").modal("show");
}
