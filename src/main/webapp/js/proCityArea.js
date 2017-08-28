//*****************************  省市区 三级联动  [auth:jiangbo;date:2016-06-28;]        start   *************************//  
/**
 * desc:页面中 省、市、区的下拉框的ID 必须依次为 province city area ，页面中只要有以下示例代码即可
 * 
 * <label for="exampleInputName2" class="mar-t-15">省</label>
 *   <select name="" id="province" class="w164">
 *       <option value="">全部</option>
 *   </select>
 *  <label class="dis-i-b" for="form-field-1" style="width: 30px !important;vertical-align: bottom;padding: 0 5px;">市</label>
 *
 *   <select name="" id="city" class="w164">
 *       <option value="">全部</option>
 *   </select>
 *   <label class="dis-i-b" for="form-field-1" style="width: 30px !important;vertical-align: bottom;padding: 0 5px;">区</label>
 *   <select name="" id="area" class="w164">
 *       <option value="">全部</option>
 *   </select>
 * 
 * 
 */

var isHavePro = $("#province").length;
var isHaveCity = $("#city").length;
var isHaveArea = $("#area").length; 
if(isHavePro==1 && isHaveCity==1 && isHaveArea==1) {
	initAreaInfo();
}
//分类初始化
function initAreaInfo(area_code,area_level) {
	var url = "/stocktaking/selectAreaList.jhtml";
	var xco=new XCO();
       if(area_code!=null) {
       		xco.setStringValue("area_code",area_code);
       }
       if(area_level!=null) {
       		xco.setIntegerValue("area_level",area_level);
       }
       var options ={
           url:url,
           data:xco,
           async:false,
           success: showAreaData
       };
       $.doXcoRequest(options);
}
//解析数据		
function showAreaData(xco) {
	var total = xco.getObjectValue("total");
       var _dataList = xco.getXCOListValue("data");
       var len = _dataList.length;
       var level = _dataList[0].getObjectValue("area_level");
       var str = "<option value=0 >全部</option>";
       //var str = "";
       for(var i = 0;i<len;i++) {
       	str += "<option value='"+_dataList[i].getObjectValue("area_code")+"'>"
       		+_dataList[i].getObjectValue("area_name")+"</option>";
       }
       if(level==1) {
           	$("#province").html(str);
           	$("#province").bind("change",function() {
           		var area_code = $(this).val();
           		if(area_code!=0) {
           			initAreaInfo(area_code,1);
           			$("#area").html("<option value=0 >全部</option>");
           		}
           	});
       }
       if(level==2) {
           	$("#city").html(str);
           	$("#city").bind("change",function() {
           		var area_code = $(this).val();
           		if(area_code!=0) {
           			initAreaInfo(area_code,2);
           		}
           	});
       }
       if(level==3) {
           	$("#area").html(str);
       }
}		

//*****************************  省市区 三级联动  [auth:jiangbo;date:2016-06-28]        end   *************************//

