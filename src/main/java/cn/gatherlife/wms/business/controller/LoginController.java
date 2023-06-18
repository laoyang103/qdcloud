package cn.gatherlife.wms.business.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.CommonService;
import cn.gatherlife.wms.business.service.LoginService;
import cn.gatherlife.wms.business.util.MD5Util;
import cn.gatherlife.wms.business.util.XCOUtil;

@Controller
@RequestMapping("login")
public class LoginController {

	private static Logger	logger	= Logger.getLogger(LoginController.class);
	
	@Autowired
	LoginService loginService;
	@Autowired
	CommonService commonService;
	
	@RequestMapping("login")
	@ResponseBody
	public XCO login(@RequestBody XCO xco, HttpServletResponse response,HttpServletRequest request){
		XCO result = new XCO();
		try {
			
			HttpSession session = request.getSession();
			String verifyCode = xco.getStringValue("verifyCode").trim();
			
			// 得到验证码
			String code = (String) session.getAttribute("authcode");
			if (!verifyCode.equalsIgnoreCase(code)) {
				return XCOUtil.getResultXCO(1, "验证码错误");
			}
			
			// TODO 这里不能返回密码
			xco.setStringValue("password", xco.getStringValue("password"));
			result = loginService.dologin(xco);
			if (null == result) {
				return XCOUtil.getResultXCO(2, "该用户不存在");
			}
			
			if (null == result.getStringValue("user_name")) {
				return XCOUtil.getResultXCO(3, "登录失败");
			}
			
			if (result.getIntegerValue("state") == 0) {
				return XCOUtil.getResultXCO(5, "该用户被停用");
			}
			
			// 生产token md5(ID+时间)
			String token = MD5Util.MD5(result.getLongValue("user_id") + "" + new Date().getTime());
			
			XCO userInfo = new XCO();
			
			userInfo.setLongValue("user_id", result.getLongValue("user_id"));
			userInfo.setStringValue("user_name", result.getStringValue("user_name"));
			userInfo.setStringValue("real_name", result.getStringValue("real_name"));
			userInfo.setLongValue("class_id", result.getLongValue("class_id"));
			userInfo.setIntegerValue("type", result.getIntegerValue("type"));
			//查询该用户的菜单
			try {
				XCO xcom = new XCO();
				xcom.setLongValue("role_id", result.getLongValue("role_id"));
				List<XCO> list = commonService.execute("wms-roleservices.queryModuleByRole",xcom);
				if(null != list){
					userInfo.setXCOListValue("data", list);
				}
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
			//把当前用户信息 set session
			session.setAttribute("userInfo", userInfo);
			
			//Cookie cookie = new Cookie("token", token);
			//cookie.setMaxAge(60 * 60 * 24 * 1);
			//cookie.setPath("/");
			//response.addCookie(cookie);
			
		}catch(Exception e){
			logger.error("登陆后设置session OR cookie失败", e);
			return XCOUtil.getResultXCO(4, "系统错误");
		}
		
		return XCOUtil.getResultXCO(0, "登录成功",result);
	}
	
	@RequestMapping("loginout")
	public String loginout(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		session.removeAttribute("userInfo");
		// 清除COOKIE TODO
		return "redirect:/login.jsp";
	}
	
	@RequestMapping("updatePassword")
	@ResponseBody
	public XCO updatePassword(@RequestBody XCO xco, HttpServletResponse response,HttpServletRequest request) {
		XCO userInfo = (XCO) request.getSession().getAttribute("userInfo");
		XCO param = new XCO();
		param.setLongValue("user_id", userInfo.getLongValue("user_id"));
		param.setStringValue("user_name", userInfo.getStringValue("user_name"));
		param.setStringValue("new_password", xco.getStringValue("new_password1"));
		XCO result = loginService.dologin(xco);
		long count = 0;
		if(null == result){
			count = 2;
		}else{
			count = loginService.updatePassword(param);
		}
		XCO req = new XCO();
		req.setLongValue("$$CODE", count);
		return req;
	}

}
