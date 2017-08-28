
function isIe()
{
	return ("ActiveXObject" in window);
}

function mToken(obj){
	this.obj = obj;	
	
	
	var g_mTokenPlugin = null;

	
	this.LoadLibrary = function()
	{
		g_mTokenPlugin = new K1ClientPlugin();//新
		
		if(g_mTokenPlugin == null)
		{
			return -1;
		}
		
		return 0;
	};
	
	this.K1_mTokenGetVersion = function()
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenGetVersion();
	};

	this.K1_mTokenFindDevice = function()
	{
		if(g_mTokenPlugin == null)
		{
			return -1;
		}
		
		return g_mTokenPlugin.mTokenFindDevice();
	};

	this.K1_mTokenGetLastError = function()
	{
		if(g_mTokenPlugin == null)
		{
			return -1;
		}
		
		return g_mTokenPlugin.mTokenGetLastError();
	};

	this.K1_mTokenGetUID = function(keyIndex)
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenGetUID(keyIndex);
	};

	this.K1_mTokenOpen = function(keyUID, keyPassword)
	{
		if(g_mTokenPlugin == null)
		{
			return -1;
		}
		
		return g_mTokenPlugin.mTokenOpen(keyUID, keyPassword, 1);
	};

	this.K1_mTokenClose = function()
	{
		if(g_mTokenPlugin == null)
		{
			return -1;
		}
		
		return g_mTokenPlugin.mTokenClose();
	};

	this.K1_mTokenChangePwd = function(keyUID,oldPassword, newPassword)
	{
		if(g_mTokenPlugin == null)
		{
			return -1;
		}
		
		return g_mTokenPlugin.mTokenChangePwd(keyUID, 1, oldPassword, newPassword);
	};

	this.K1_mTokenSHA1WithSeed = function(keyUID, randomStr)
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenSHA1WithSeed(keyUID, randomStr);
	};

	this.K1_mTokenGenResetPwdRequest = function(keyUID, userInfo)
	{
		if(g_mTokenPlugin == null)
		{
			return -1;
		}
		
		return g_mTokenPlugin.mTokenGenResetPwdRequest(keyUID, userInfo);
	};

	this.K1_mTokenResetPassword = function(keyUID, serverResponse)
	{
		if(g_mTokenPlugin == null)
		{
			return -1;
		}
		
		return g_mTokenPlugin.mTokenResetPassword(keyUID, serverResponse);
	};
	
	this.K1_mTokenGenRandom = function(keyUID, randomLength)
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenGenRandom(keyUID, randomLength);
	};

	this.K1_mTokenReadSecureStorage = function(keyUID, offset, dataLength)
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenReadSecureStorage(keyUID, offset, dataLength);
	};

	this.K1_mTokenWriteSecureStorag = function(keyUID, offset, writeData)
	{
		if(g_mTokenPlugin == null)
		{
			return -1;
		}
		
		return g_mTokenPlugin.mTokenWriteSecureStorage(keyUID, offset, writeData);
	};

	this.K1_mTokenReadUserStorage = function(keyUID, offset, dataLength)
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenReadUserStorage(keyUID, offset, dataLength);
	};

	this.K1_mTokenWriteUserStorage = function(keyUID, offset, writeData)
	{
		if(g_mTokenPlugin == null)
		{
			return -1;
		}
		
		return g_mTokenPlugin.mTokenWriteUserStorage(keyUID, offset, writeData);
	};

	this.K1_mTokenGetURL = function(keyUID)
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenGetURL(keyUID);
	};

	this.K1_mTokenGetLabel = function(keyUID)
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenGetLabel(keyUID);
	};

	this.K1_mTokenGetCompanyName = function(keyUID)
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenGetCompanyName(keyUID);
	};

	this.K1_mTokenGetRemark = function(keyUID)
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenGetRemarks(keyUID);
	};
	this.K1_mTokenGetOpenType = function(keyUID)
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenGetOpenType(keyUID);
	};	
	
	this.K1_mTokenPwdRetryCount = function(keyUID)
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenPwdRetryCount(keyUID, 1);
	};	
	this.K1_mTokenEncrypt = function(keyUID, method, data)
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenEncrypt(keyUID,  method, 1,  data);
	};	
	this.K1_mTokenDecrypt = function(keyUID,  method,  data)
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenDecrypt(keyUID,  method, 1, data);
	};	
	
	this.K1_GetMacAddr = function()
	{
		if(g_mTokenPlugin == null)
		{
			return null;
		}
		
		return g_mTokenPlugin.mTokenGetMacAddr();
	};
	
	var _TimerErrorMessage;
	var _ExpireUrl;
	/*******************************************************
	*
	* 函数名称：K1_CheckExist()
	* 功    能：检查USB Key是否存在
	* 说	明：此方法结合K1_StartCheckTimer方法可用来定时
	*           检测USB Key是否存在,不存在即返回到指定页面(
	*           _ExpireUrl)
	*
	**********************************************************/
	function K1_CheckExist()
	{
		var rtn =g_mTokenPlugin.mTokenFindDevice();
		if(rtn < 1)
		{
			if(_TimerErrorMessage != null)
			{
				alert(_TimerErrorMessage);
			}
			if(_ExpireUrl != null)
			{
				window.location = _ExpireUrl;
			}
		}
		return rtn;
	};
	/*******************************************************
	*
	* 函数名称：K1_StartCheckTimer()
	* 功    能：定时操作方法
	* 输    入：interval：时间1000/秒；errMsg：输出的错误信息
	*           logonUrl：跳转地址
	* 说	明：此方法结合CheckExist方法可用来定时检测加
	*           密Key是否存在,不存在即返回到指定页面(_ExpireUrl)
	*
	**********************************************************/
	this.K1_StartCheckTimer = function(interval, errMsg, logonUrl)
	{
		_TimerErrorMessage  = errMsg;
		_ExpireUrl = logonUrl;
		//定时检测
		window.setInterval(K1_CheckExist, interval);
	};
	
}



function K1ClientPlugin()
{
	var url = "http://127.0.0.1:51111/K1_Client";
	
	var xmlhttp ;
	function AjaxIO(json) {
		if(xmlhttp == null) {
			if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
				xmlhttp = new XMLHttpRequest();
			} else {// code for IE6, IE5
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
		}
		if("https:" == document.location.protocol)
		{
			url = "https://127.0.0.1:51121/K1_Client";
		}
		xmlhttp.open("POST", url, false);
		xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		xmlhttp.send("json=" + json);
	}
	
	this.mTokenGetVersion = function()
	{
		var json = '{"function":"mTokenGetVersion"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.outData;
		}else{
			return "";
		}
	};

	this.mTokenFindDevice = function()
	{
		var json = '{"function":"mTokenFindDevice"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.devCount;
		}else{
			return -2;
		}
	};

	this.mTokenGetLastError = function()
	{
		var json = '{"function":"mTokenGetLastError"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.errorCode;
		}else{
			return -2;
		}
	};

	this.mTokenGetUID = function(keyIndex)
	{
		var json = '{"function":"mTokenGetUID", "keyIndex":' + keyIndex + '}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.outData;
		}else{
			return "";
		}
	};

	this.mTokenOpen = function(keyUID, keyPassword, type)
	{
		var json = '{"function":"mTokenOpen", "keyUID":"' + keyUID + '", "passWd":"' + keyPassword + '", "passWdType":' + type + '}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.rtn;
		}else{
			return 1;
		}
	};

	this.mTokenClose = function()
	{
		var json = '{"function":"mTokenClose"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.rtn;
		}else{
			return 1;
		}
	};

	this.mTokenChangePwd = function(keyUID, type, oldPassword, newPassword)
	{
		var json = '{"function":"mTokenChangePwd", "keyUID":"' + keyUID + '", "oldUpin":"' + oldPassword + '", "newUpin":"' + newPassword + '", "passWdType":' + type + '}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.rtn;
		}else{
			return 1;
		}
	};

	this.mTokenSHA1WithSeed = function(keyUID, randomStr)
	{
		var json = '{"function":"mTokenSHA1WithSeed", "keyUID":"' + keyUID + '", "random":"' + randomStr + '"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.outData;
		}else{
			return "";
		}
	};

	this.mTokenGenResetPwdRequest = function(keyUID, userInfo)
	{
		var json = '{"function":"mTokenGenResetPwdRequest", "keyUID":"' + keyUID + '", "userInfo":"' + userInfo + '"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.outData;
		}else{
			return "";
		}
	};

	this.mTokenResetPassword = function(keyUID, serverResponse)
	{
		var json = '{"function":"mTokenResetPassword", "keyUID":"' + keyUID + '", "response":"' + serverResponse + '"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.rtn;
		}else{
			return 1;
		}
	};
	
	this.mTokenGenRandom = function(keyUID, randomLength)
	{
		var json = '{"function":"mTokenGenRandom", "keyUID":"' + keyUID + '", "inDataLen":' + randomLength + '}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.outData;
		}else{
			return "";
		}
	};

	this.mTokenReadSecureStorage = function(keyUID, offset, dataLength)
	{
		var json = '{"function":"mTokenReadSecureStorage", "keyUID":"' + keyUID + '", "offset":' + offset + ', "inDataLen":' + dataLength + '}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.outData;
		}else{
			return "";
		}
	};

	this.mTokenWriteSecureStorage = function(keyUID, offset, writeData)
	{
		var json = '{"function":"mTokenWriteSecureStorage", "keyUID":"' + keyUID + '", "offset":' + offset + ', "inData":"' + writeData + '"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.rtn;
		}else{
			return 1;
		}
	};

	this.mTokenReadUserStorage = function(keyUID, offset, dataLength)
	{
		var json = '{"function":"mTokenReadUserStorage", "keyUID":"' + keyUID + '", "offset":' + offset + ', "inDataLen":' + dataLength + '}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.outData;
		}else{
			return "";
		}
	};

	this.mTokenWriteUserStorage = function(keyUID, offset, writeData)
	{
		var json = '{"function":"mTokenWriteUserStorage", "keyUID":"' + keyUID + '", "offset":' + offset + ', "inData":"' + writeData + '"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.rtn;
		}else{
			return 1;
		}
	};

	this.mTokenGetURL = function(keyUID)
	{
		var json = '{"function":"mTokenGetURL", "keyUID":"' + keyUID + '"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.outData;
		}else{
			return "";
		}
	};

	this.mTokenGetLabel = function(keyUID)
	{
		var json = '{"function":"mTokenGetLabel", "keyUID":"' + keyUID + '"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.outData;
		}else{
			return "";
		}
	};

	this.mTokenGetCompanyName = function(keyUID)
	{
		var json = '{"function":"mTokenGetCompanyName", "keyUID":"' + keyUID + '"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.outData;
		}else{
			return "";
		}
	};

	this.mTokenGetRemarks = function(keyUID)
	{
		var json = '{"function":"mTokenGetRemarks", "keyUID":"' + keyUID + '"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.outData;
		}else{
			return "";
		}
	};
	
	this.mTokenGetOpenType = function(keyUID)
	{
		var json = '{"function":"mTokenGetOpenType", "keyUID":"' + keyUID + '"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.openType;
		}else{
			return -1;
		}
	};	
	
	this.mTokenPwdRetryCount = function(keyUID, passwdType)
	{	
		var json = '{"function":"mTokenPwdRetryCount", "keyUID":"' + keyUID + '", "passWdType":' + passwdType + '}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.pwdRetryCount;
		}else{
			return -1;
		}
	};	
	
	this.mTokenEncrypt = function(keyUID, method, paddingType, data)
	{
		var json = '{"function":"mTokenEncrypt", "keyUID":"' + keyUID + '", "method":' + method + ', "paddingType":' + paddingType + ', "inData":"' + data + '"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.outData;
		}else{
			return "";
		}
	};	
	
	this.mTokenDecrypt = function(keyUID,  method, paddingType, data)
	{
		var json = '{"function":"mTokenDecrypt", "keyUID":"' + keyUID + '", "method":' + method + ', "paddingType":' + paddingType + ', "inData":"' + data + '"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.outData;
		}else{
			return "";
		}	
	};	
	
	this.mTokenGetMacAddr = function()
	{
		var json = '{"function":"mTokenGetMacAddr"}';
		AjaxIO(json);
		if(xmlhttp.readyState == 4 && xmlhttp.status == 200) {
			var obj = eval("(" + xmlhttp.responseText + ")");
			return obj.outData;
		}else{
			return "";
		}	
	}
	
}

