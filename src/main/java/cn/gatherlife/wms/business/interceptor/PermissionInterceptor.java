package cn.gatherlife.wms.business.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.xson.common.object.XCO;

public class PermissionInterceptor implements HandlerInterceptor {

	private void setLoginFailed(HttpServletResponse response) throws IOException {
		// 每个页面查看其返回头，如果有其返回头，就跳转到登录页面
		/*XCO xco = new XCO();
		response.setContentType("application/json;charset=UTF-8");
		xco.setIntegerValue("$$CODE", 1);
		xco.setStringValue("$$MESSAGE", "用户没有登录");
		response.getWriter().write(xco.toXMLString());
		response.getWriter().flush();*/
		response.sendRedirect("/index.jsp");
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession session = request.getSession();
		
		XCO userInfo = (XCO)session.getAttribute("userInfo");
		if (null == userInfo) {
			setLoginFailed(response);
			return false;
		}

		if (null != userInfo) {
			// TODO
			// 获取用权限列表, 判断该URL是否为该用户所有
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
		
	}

}
