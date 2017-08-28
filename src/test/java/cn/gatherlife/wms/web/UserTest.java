package cn.gatherlife.wms.web;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.CommonService;
import cn.gatherlife.wms.business.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:application_context.xml")
public class UserTest {
	
	//@Autowired
	//private CommonService commonService;
	
	@Autowired
	private UserService userService;
	
	@Test
	public void insertUser() {
		XCO xco=new XCO();
		xco.setStringValue("real_name", "张三老是");
		xco.setStringValue("user_name", "zhangsanlaoshi");
		xco.setStringValue("password", "123456");
		xco.setIntegerValue("sex", 0);
		xco.setIntegerValue("class_id", 1);
		xco.setStringValue("class_name", "高三一班");
		xco.setIntegerValue("type", 1);
		xco.setIntegerValue("role_id", 1);
		xco.setIntegerValue("state", 1);
		userService.insertUser(xco);
	}
	
	@Test
	public void userlist() {
		XCO xco=new XCO();
		xco.setIntegerValue("type", 0);
		XCO req = userService.userlist(xco);
		System.out.println("-------------total--------------"+req.getLongValue("total"));
		System.out.println("-------------data--------------"+req.getXCOListValue("data").toString());
	}
	
	@Test
	public void updateUser() {
		XCO xco=new XCO();
		xco.setLongValue("user_id", 1);
		XCO req = userService.selectUserByUserId(xco);
		req.setStringValue("password", "123");
		int id = userService.updateUser(req);
		System.out.println("==========================="+id);
	}
	
	@Test
	public void deleteUser() {
		XCO xco=new XCO();
		xco.setLongValue("user_id", 1);
		XCO req = userService.selectUserByUserId(xco);
		req.setIntegerValue("state", 0);
		int id = userService.deleteUser(req);
		System.out.println("==========================="+id);
	}
	
	
}
