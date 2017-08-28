package cn.gatherlife.wms.web;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.GroupService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:application_context.xml")
public class GroupTest {
	
	//@Autowired
	//private CommonService commonService;
	
	@Autowired
	private GroupService groupService;
	
	@Test
	public void insertGroup() {
		XCO xco=new XCO();
		xco.setStringValue("idStr", "1,2");
		xco.setStringValue("group_name", "测试组");
		groupService.insertGroup(xco);
	}
	
}
