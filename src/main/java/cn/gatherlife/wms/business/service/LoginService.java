package cn.gatherlife.wms.business.service;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

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
		XCO req = SqlServiceActuator.execute("wms-loginservices.updatePassword", xco);
		return req.getLongValue("count");
	}
}
