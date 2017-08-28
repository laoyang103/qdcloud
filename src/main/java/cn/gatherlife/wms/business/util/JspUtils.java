package cn.gatherlife.wms.business.util;

import java.util.UUID;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

public class JspUtils {

/*	*//**
	 * 获取Token
	 *//*
	public static String getToken(HttpServletRequest request) {
		Cookie cookies[] = request.getCookies();
		Cookie sCookie = null;
		for (int i = 0; i < cookies.length; i++) {
			sCookie = cookies[i];
			if (sCookie != null) {
				if ("token".equalsIgnoreCase(sCookie.getName())) {
					return sCookie.getValue();
				}
			}
		}
		return null;
	}*/

/*	*//**
	 * 获取用户Token信息
	 *//*
	public static XCO getUserInfo(String token) {
		XCO xco = null;
		try {
			String xml = ManagerConfig.jedisClient.get(token);
			if (null != xml) {
				xco = XCO.fromXML(xml);
			}
		} catch (Throwable e) {
			logger.error("REDIS获取用户信息失败", e);
		}
		return xco;
	}
*/
	public static String getImageVerifyKey() {
		String uuid = UUID.randomUUID().toString();
		uuid = "IV" + uuid.replaceAll("-", "").substring(0, 30);
		//System.out.println(uuid);
		return uuid;
	}
}
