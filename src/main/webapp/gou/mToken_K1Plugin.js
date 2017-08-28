/**********************************************************
 *
 * 使用此JS脚本之前请先仔细阅读mToken K1帮助文档!
 * 
 * @author		Longmai
 * @version		1.0
 * @date		2014/12/24
 * @explanation	操作系统支持: Windows, Linux, Mac OS
 *				浏览器支持: IE, Firefox, Chrome, Safari, 以及目前市面上使用这些浏览器核心的其它浏览器;
 *              如猎豹，360，QQ, 遨游等等。
 *
**********************************************************/

	var K1mToken = new mToken("mTokenPlugin");
	var g_keyUID = "";
	/*******************************************************
	*
	* 函数名称：K1_mTokenFindDevice
	* 功    能：查找K1 mToken设备
	* 输    入：
	* 返 回 值：查找到设备个数，返回值大于1成功，否则失败可调用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：此方法是使用K1第一个调用的函数，返回值是查找到设备个数。
	*
	**********************************************************/	
	function K1mTokenFindDevice()
	{
		K1mToken.LoadLibrary();
		var keyNumber = 0;
		keyNumber =  K1mToken.K1_mTokenFindDevice();
		if(keyNumber < 1)
		{
			alert("请插入USB Key");	
			return false ;
		}
		return true;
	}
	
	
	/*******************************************************
	*
	* 函数名称：K1_mTokenFindDevice
	* 功    能：查找K1 mToken设备
	* 输    入：
	* 返 回 值：查找到设备个数，返回值大于1成功，否则失败可调用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：此方法是使用K1第一个调用的函数，返回值是查找到设备个数。
	*
	**********************************************************/	
	function K1mTokenFindDevice2()
	{
		K1mToken.LoadLibrary();
		var keyNumber = 0;
		keyNumber =  K1mToken.K1_mTokenFindDevice();
		if(keyNumber < 1)
		{
			//alert("请插入USB Key");	
			return false ;
		}
		return true;
	}
	

	/*******************************************************
	*
	* 函数名称：K1_mTokenGetVersion
	* 功    能：获取插件版本号
	* 输    入：无
	* 返 回 值：版本号
	* 说	明：若版本有升级，可通过此版本号获取当前插件版本区别
	*
	**********************************************************/
	function K1mTokenGetVersion()
	{
		var version = 0;
		version =  K1mToken.K1_mTokenGetVersion();
		if(version != null || version != "")
		{
			alert("获取版本失败,错误码:" + K1mToken.K1_mTokenGetLastError());
			return ;
		}

		return version;
	}
	
	/*******************************************************
	*
	* 函数名称：K1_mTokenGetLastError
	* 功    能：获取最后一次调用接口错误码
	* 输    入：
	* 返 回 值：错误码
	* 说	明：当调用接口返回值错误，可用此函数获取错误码，通过错误码可分析出错原因
	*
	**********************************************************/
	function K1GetLastError()
	{
		var errorCode = 0;
		errorCode =  K1mToken.K1_GetLastError();
		
		return errorCode;
	}

	/*******************************************************
	*
	* 函数名称：K1_mTokenGetUID(int keyIndex)
	* 功    能：查找K1 mToken设备
	* 输    入：keyIndex 从1开始，小于等于查找到设备的个数
	* 返 回 值：非空 成功，空 失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：获取设备唯一硬件ID
	*
	**********************************************************/	
	function K1mTokenGetUID()
	{
		var keyUID = "";
		keyUID = K1mToken.K1_mTokenGetUID(1);
		if(keyUID == null || keyUID == "")
		{
			alert("获取设备唯一硬件ID失败,错误码:" + K1mToken.K1_mTokenGetLastError());
			document.getElementById("txt_keyUID").value = "";
			return ;
		}
		
		g_keyUID = keyUID;	
		document.getElementById("txt_keyUID").value = keyUID;
	}

	/*******************************************************
	*
	* 函数名称：K1mTokenOpen(string keyUID, string keyPassword)
	* 功    能：打开mToken K1 设备用户权限
	* 输    入：keyUID，设备唯一硬件ID
	*           keyPassword mToken K1用户密码   
	* 返 回 值：0 成功，非0 失败，使用K1_mTokenGetLastError()函数获取错误码
	* 说	明：根据唯一硬件ID获取和用户密码获取设备用户权限
	*
	**********************************************************/
	function K1mTokenOpen()
	{
		var keyPassword = document.getElementById("txt_pwd").value;			
		var nRet = K1mToken.K1_mTokenOpen(g_keyUID, keyPassword);
		if(nRet != 0)
		{
			alert("验证用户密码权限失败,错误码:" + K1mToken.K1_mTokenGetLastError());
		}		
	}
		
	/*******************************************************
	*
	* 函数名称：K1_mTokenClose()
	* 功    能：关闭设备
	* 输    入：无
	* 返 回 值：0 成功，非0 失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：关闭当前打开的设备，与K1_mTokenOpen成对使用
	*
	**********************************************************/
	function K1mTokenClose()
	{
		return K1mToken.mTokenClose();
	}

	/*******************************************************
	*
	* 函数名称：K1_mTokenChangePwd(string keyUID, string oldPassword, string newPassword)
	* 功    能：修改密码
	* 输    入：keyUID,设备唯一硬件ID
	*			oldPassword,原密码
	*			newPassword,新密码
	* 返 回 值：0 成功，非0 失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：修改指定的mToken K1设备用户密码
	*
	**********************************************************/
	function K1mTokenChangePwd()
	{
		var oldPassword = document.getElementById("txt_oldPwd").value;	
		var newPassword = document.getElementById("txt_newPwd").value;	
	
		var nRet = K1mToken.K1_mTokenChangePwd(g_keyUID, oldPassword, newPassword);
		if(nRet != 0)
		{
			alert("修改用户密码失败,错误码:" + K1mToken.K1_mTokenGetLastError());
		}
	}

	/*******************************************************
	*
	* 函数名称：K1_mTokenSHA1WithSeed(string keyUID, string randomStr)
	* 功    能：SHA1摘要生成
	* 输    入：keyUID，设备唯一硬件ID
	*           randomStr,随机数（由服务端生成，BASE64编码）
	* 返 回 值：非空值成功，SHA1摘要（通过BASE64编码）
	*           空值失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：通过随机数和锁内种子码生成SHA1摘要，注意数据传入和传出经过BASE64编码
	*
	**********************************************************/
	function K1mTokenSHA1WithSeed()
	{
		var randomStr = document.getElementById("txt_RandomStr").value;	
		
		var sha1Str = K1mToken.K1_mTokenSHA1WithSeed(g_keyUID, randomStr);
		if(sha1Str == null || sha1Str == "")
		{
			alert("SHA1摘要生成失败,错误码:" + K1mToken.K1_mTokenGetLastError());
			return ;
		}
		
		document.getElementById("txt_sha1").value = sha1Str;
	}

	/*******************************************************
	*
	* 函数名称：K1_mTokenGenResetPwdRequest(string keyUID)
	* 功    能：用户权限密码重置申请
	* 输    入：keyUID，设备唯一硬件ID
	* 返 回 值：非空值成功，请求用户密码重置申请字符串（通过BASE64编码）
	*           空值失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：若K1 mToken用户密码忘记，可通过此接口申请密码重置，把申请字符串发送到设备管理商
	*
	**********************************************************/	
	function K1mTokenGenResetPwdRequest()
	{
		var resetPwdRequest = K1mToken.K1_mTokenGenResetPwdRequest(g_keyUID, "longmai");
		if(resetPwdRequest == null || resetPwdRequest == "")
		{
			alert("密码重置申请失败,错误码:" + K1mToken.K1_mTokenGetLastError());
			return ;
		}
		
		document.getElementById("txt_resetPwdRequest").value = resetPwdRequest;
	}
		
	/*******************************************************
	*
	* 函数名称：K1_mTokenResetPassword（string keyUID, string serverResponse）
	* 功    能：重置指定设备密码
	* 输    入：keyUID，设备唯一硬件ID
	*           serverResponse,由设备提供商返回的重置密码字符串
	* 返 回 值：0 成功，用户密码被重置
	*           非0 失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：此接口与K1_mTokenGenResetPwdRequest匹配使用，
	*           先申请密码重置，仅授权此设备的管理商具有重置此设备用户密码权限
	*
	**********************************************************/
	function K1mTokenResetPassword()
	{
		var serverResponse = document.getElementById("txt_resetPassword").value;	
		var nRet = K1mToken.K1_mTokenResetPassword(g_keyUID, serverResponse);
		if(nRet != 0)
		{
			alert("重置用户密码失败,错误码:" + K1mToken.K1_mTokenGetLastError());
			return;
		}
	}
	
	/*******************************************************
	*
	* 函数名称：K1_mTokenGenRandom（string keyUID, int randomLength）
	* 功    能：由设备生成随机数
	* 输    入：keyUID，设备唯一硬件ID
	*           randomLength,需要生成的随机数长度
	* 返 回 值：非空值成功，随机数（BASE64编码）
	*           非0 失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：设备内生成真随机数
	*
	**********************************************************/
	function K1mTokenGenRandom()
	{	
		var keyUID = document.getElementById("txt_keyUID").value;
		
		var randomStr = K1mToken.K1_mTokenGenRandom(g_keyUID, 32);
		if(randomStr == null || randomStr == "")
		{
			alert("获取设备唯一硬件ID失败,错误码:" + K1mToken.K1_mTokenGetLastError());
			return;
		}
		
		document.getElementById("txt_RandomStr").value = randomStr;		
	}
	
	/*******************************************************
	*
	* 函数名称：K1_mTokenReadSecureStorage（string keyUID, int offset, int readLength)
	* 功    能：获取设备安全存储区数据
	* 输    入：keyUID，设备唯一硬件ID
	*           offset, 读安全存储区开始地址
	*           readLength，需要读取数据的长度
	* 返 回 值：非空值成功，正确安全存储区数据，此数据为密文（经过BASE64编码）
	*           空值失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：获取设备安全存储区设备，获取的数据是密文且经过BASE64编码
	*
	**********************************************************/
	function K1mTokenReadSecureStorage()
	{
		var offset = 0;
		var readLength = 128;
		var readSecureData = K1mToken.K1_mTokenReadSecureStorage(g_keyUID, offset, readLength);
		if(readSecureData == null || readSecureData == "")
		{
			alert("获取安全存储区数据失败,错误码:" + K1mToken.K1_mTokenGetLastError());
			return;
		}
		
		document.getElementById("txt_readSafeData").value = readSecureData;	
		return 
	}
	
	/*******************************************************
	*
	* 函数名称：K1_mTokenWriteSecureStorage（string keyUID, int offset, string writeData)
	* 功    能：获取设备安全存储区数据
	* 输    入：keyUID,设备唯一硬件ID
	*           offset,写安全存储区数据开始地址
	*           writeData,此数据必须是密文，加密数据的秘钥必须与锁内一致才能正确写入到设备存储区（BASE64编码）
	* 返 回 值：0 成功，数据成功写入设备
	*           非0 失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：写入到设备的数据必须为密文且经过BASE64编码，加密数据的秘钥必须与设备内秘钥一致。
	*
	**********************************************************/
	function K1mTokenWriteSecureStorag()
	{
		var offset = 0;
		var txtBuffer = document.getElementById("txt_writeSafeData").value;
		
		if(txtBuffer == null || txtBuffer == "")
		{
			alert("写入数据不能为空！");
			return;
		}
		
		var nRet = K1mToken.K1_mTokenWriteSecureStorag(g_keyUID, offset, txtBuffer);
		if(nRet != 0 || nRet == null)
		{
			alert("写安全存储区数据失败,错误码:" + K1mToken.K1_mTokenGetLastError());
			return;
		}
		
	}
	
	/*******************************************************
	*
	* 函数名称：K1_mTokenReadUserStorage（string keyUID, int offset, int DataLength)
	* 功    能：获取设备用户存储区数据
	* 输    入：keyUID,设备唯一硬件ID
	*           offset,读用户存储区开始地址
	*           DataLength,需要读取的数据长度     
	* 返 回 值：非空值成功，正确获取用户存储区数据（BASE64编码）
	*           空置失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：获取到用户存储区的数据经过BASE64编码，查看正确的用户存储区设备数据请还原BASE64编码
	*
	**********************************************************/
	function K1mTokenReadUserStorage()
	{
		var userData = "";
		var offset = 0;
		var dataLength = 128;
		userData = K1mToken.K1_mTokenReadUserStorage(g_keyUID, offset, dataLength);
		if(userData == null || userData == "")
		{
			document.getElementById("txt_readUserData").value = userData;	
			alert("读取用户存储区数据失败,错误码:" + K1mToken.K1_mTokenGetLastError());
			return;
		}
		
		document.getElementById("txt_readUserData").value = userData;	
		
	}

	/*******************************************************
	*
	* 函数名称：K1_mTokenWriteUserStorage（string keyUID, int offset, string writeData)
	* 功    能：写数据到设备用户存储区数据
	* 输    入：keyUID,设备唯一硬件ID
	*           offset，写用户存储区开始地址
	*           writeData,写入到用户存储区的数据（BASE64编码）
	* 返 回 值：0 成功，正确把数据存储到设备用户存储区
	*           非0 失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：写入到设备用户存储区的数据需把原数据经过BASE64处理
	*
	**********************************************************/	
	function K1mTokenWriteUserStorage()
	{
		var offset = 0;
		var WriteBuffer = document.getElementById("txt_writeUserData").value;
		var Base64WriteData = _Base64encode(WriteBuffer);
		
		var nRet = K1mToken.K1_mTokenWriteUserStorage(g_keyUID, offset, Base64WriteData);
		if(nRet != 0)
		{	
			alert("写用户存储区数据失败,错误码:" + K1mToken.K1_mTokenGetLastError());
		}	
	}
	
	/*******************************************************
	*
	* 函数名称：K1_mTokenGetURL（string keyUID)
	* 功    能：获取设备配置区网址
	* 输    入：keyUID,设备唯一硬件ID
	* 返 回 值：非空值 成功，正确获取设备配置区URL
	*           空  值 失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：URL的信息由设备提供商预先设置，使用此函数可获取
	*
	**********************************************************/
	function K1mTokenGetURL()
	{
		var urlStr = K1mToken.K1_mTokenGetURL(g_keyUID);
		if(urlStr == null ||urlStr == "")
		{
			alert("获取配置区网址失败,错误码:" + K1mToken.K1_mTokenGetLastError());
		}		
		
		document.getElementById("txt_url").value = urlStr;
	}
	
	/*******************************************************
	*
	* 函数名称：K1_mTokenGetLabel（string keyUID)
	* 功    能：获取设备Label
	* 输    入：keyUID,设备唯一硬件ID
	* 返 回 值：非空值 成功，正确获取设备配置区Label
	*           空  值 失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：Label的信息由设备提供商预先设置，使用此函数可获取
	*
	**********************************************************/
	function K1mTokenGetLabel()
	{
		var label = K1mToken.K1_mTokenGetLabel(g_keyUID);
		if(label == null ||label == "")
		{
			alert("获取配置区设备别名失败,错误码:" + K1mToken.K1_mTokenGetLastError());
		}		
		
		document.getElementById("txt_label").value = label;
		return 
	}
	
	/*******************************************************
	*
	* 函数名称：K1_mTokenGetCompanyName（string keyUID)
	* 功    能：获取设备配置区公司名称
	* 输    入：keyUID,设备唯一硬件ID
	* 返 回 值：非空值 成功，正确获取设备配置区存储的公司名称
	*           空  值 失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：公司名称的信息由设备提供商预先设置，使用此函数可获取
	*
	**********************************************************/	
	function K1mTokenGetCompanyName()
	{	
		var companyName = K1mToken.K1_mTokenGetCompanyName(g_keyUID);
		if(companyName == null ||companyName == "")
		{
			alert("获取配置区公司名称失败,错误码:" + K1mToken.K1_mTokenGetLastError());
		}		
		
		document.getElementById("txt_companyName").value = companyName;
	}
	
	/*******************************************************
	*
	* 函数名称：K1_mTokenGetRemarks（string keyUID)
	* 功    能：获取设备配置区备注信息
	* 输    入：keyUID,设备唯一硬件ID
	* 返 回 值：非空值 成功，正确获取设备配置区存储的备注信息
	*           空  值 失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：备注信息由设备提供商预先设置，使用此函数可获取
	*
	**********************************************************/
	function K1mTokenGetRemark()
	{
		var remark = K1mToken.K1_mTokenGetRemark(g_keyUID);
		if(remark == null ||remark == "")
		{
			alert("获取配置区备注信息失败,错误码:" + K1mToken.K1_mTokenGetLastError());
		}		
		
		document.getElementById("txt_remark").value = remark;
	}
	
	
	/*******************************************************
	*
	* 函数名称：K1_mTokenGetOpenType（string keyUID)
	* 功    能：获取指定客户端浏览器打开类型
	* 输    入：keyUID,设备唯一硬件ID
	* 返 回 值：非空值 成功,客户端托盘程序可通过此值打开指定的端浏览器
	*           空  值 失败，使用K1_mTokenGetLastError()函数获取错误码。
	* 说	明：可指定使用IE浏览器打开设备存储区网址或使用客户端设置的默认浏览器打开设备存储区的网址
	*
	**********************************************************/
	function K1mTokenGetOpenType()
	{
		var openType = K1mToken.K1_mTokenGetOpenType(g_keyUID);
		if(openType == null ||openType == "")
		{
			alert("获取配置区客户端浏览器打开类型失败,错误码:" + K1mToken.K1_mTokenGetLastError());
		}		
		
		document.getElementById("txt_openType").value = openType;
	}
	
	function K1mTokenEncrypt()
	{
		var encryptMethod = document.getElementById("encryptmech").value;
		var encryptBuffer = document.getElementById("txt_encrypt").value;
		var encryptData = K1mToken.K1_mTokenEncrypt(g_keyUID, encryptMethod, encryptBuffer);
		if(encryptData == null ||encryptData == "")
		{
			alert("加密失败,错误码:" + K1mToken.K1_mTokenGetLastError());
		}		
		
		document.getElementById("txt_encrypt").value = encryptData;
	}
	
	function K1mTokenDecrypt()
	{
		var encryptMethod = document.getElementById("encryptmech").value;
		var encryptBuffer = document.getElementById("txt_encrypt").value;
		var decryptData = K1mToken.K1_mTokenDecrypt(g_keyUID, encryptMethod, encryptBuffer);
		if(decryptData == null ||decryptData == "")
		{
			alert("获取配置区客户端浏览器打开类型失败,错误码:" + K1mToken.K1_mTokenGetLastError());
		}		
		
		document.getElementById("txt_decrypt").value = decryptData;
	}

	//定时检测K1是否连接
	function K1StartCheckTimer(interval, errMsg, logonUrl)
	{
		K1mToken.LoadLibrary();
		K1mToken.K1_StartCheckTimer(interval, errMsg, logonUrl);
	}

	function K1mTokenGetMacAddr()
	{
		document.getElementById("txt_MacAddr").value = K1mToken.K1_GetMacAddr();
	}