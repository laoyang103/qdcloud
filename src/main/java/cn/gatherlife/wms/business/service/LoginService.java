package cn.gatherlife.wms.business.service;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

import cn.gatherlife.wms.business.util.FileUtil;

@Service
public class LoginService {
	
	/**
	 * 查询登录
	 * @param xco
	 * @return
	 */
	public XCO dologin(XCO xco){
		XCO req = SqlServiceActuator.execute("wms-loginservices.queryUser", xco);
		return req;
	}
	
	/**
	 * 修改密码
	 * @param xco
	 * @return
	 */
	public long updatePassword(XCO xco){
		String user_name = xco.getStringValue("user_name");
		String new_password = xco.getStringValue("new_password");
		System.out.println(xco);
		System.out.println("echo " + new_password + "| ocpasswd -c /etc/ocserv/ocpasswd " + user_name);
		FileUtil.getShellData("echo " + new_password + "| ocpasswd -c /etc/ocserv/ocpasswd " + user_name);
		XCO req = SqlServiceActuator.execute("wms-loginservices.updatePassword", xco);
		return req.getLongValue("count");
	}
}
