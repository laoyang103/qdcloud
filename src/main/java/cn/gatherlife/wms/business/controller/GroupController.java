package cn.gatherlife.wms.business.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.GroupService;
import cn.gatherlife.wms.business.util.XCOUtil;

@Controller
@RequestMapping("group")
public class GroupController {

	private static Logger	logger	= Logger.getLogger(GroupController.class);
	
	@Autowired
	GroupService groupService;
	
	/**
	 * 查询列表
	 * @param xco
	 * @return
	 */
	@RequestMapping("grouplist")
	public @ResponseBody XCO grouplist(@RequestBody XCO xco){
		//执行导入
		XCO rep = groupService.grouplist(xco);
		return rep;
	}
	
	/**
	 * 插入
	 * @param xco
	 * @return
	 */
	@RequestMapping("insertGroup")
	public @ResponseBody XCO insertGroup(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		if(userInfo.getLongValue("type") == 1){
			xco.setIntegerValue("type", 1);
		}
		if(userInfo.getLongValue("type") == 2){
			xco.setIntegerValue("type", 0);
		}
		long count = groupService.insertGroup(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "保存失败");
		}else{
			return XCOUtil.getResultXCO(1, "保存成功");
		}
	}
	
	/**
	 * 查询单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectGroupById")
	public @ResponseBody XCO selectGroupById(@RequestBody XCO xco){
		return groupService.selectGroupById(xco);
	}
	
	
	/**
	 * 更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateGroup")
	public @ResponseBody XCO updateGroup(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		if(userInfo.getLongValue("type") == 1){
			xco.setIntegerValue("type", 1);
		}
		if(userInfo.getLongValue("type") == 2){
			xco.setIntegerValue("type", 0);
		}
		long count = groupService.updateGroup(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "更新失败");
		}else{
			return XCOUtil.getResultXCO(1, "更新成功");
		}
	}

	/**彻底删除单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("deleteGroup")
	public @ResponseBody XCO deleteGroup(@RequestBody XCO xco){
		long count = groupService.deleteGroup(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "删除失败");
		}else{
			return XCOUtil.getResultXCO(1, "删除成功");
		}
	}
	
	/**查找该组已经有的学生
	 * @param xco
	 * @return
	 */
	@RequestMapping("listbygroupid")
	public @ResponseBody XCO listbygroupid(@RequestBody XCO xco){
		List<XCO> list = groupService.listbygroupid(xco);
		XCO select = new XCO();
		select.setXCOListValue("data", list);
		return select;
	}
	
	/**查找某班级下所有的学生
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectStudentById")
	public @ResponseBody XCO selectStudentById(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		if(xco.getLongValue("class_id") ==  0){
			xco.setLongValue("class_id", userInfo.getLongValue("class_id"));
		}
		List<XCO> list = groupService.selectStudentById(xco);
		XCO select = new XCO();
		select.setXCOListValue("data", list);
		return select;
	}
	
	/**查找某班级下所有的学生
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectStudentById2")
	public @ResponseBody XCO selectStudentById2(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		if(xco.getLongValue("class_id") ==  0){
			xco.setLongValue("class_id", userInfo.getLongValue("class_id"));
		}
		List<XCO> list = groupService.selectStudentById2(xco);
		XCO select = new XCO();
		select.setXCOListValue("data", list);
		return select;
	}
	
	@RequestMapping("groupSelect")
	public @ResponseBody XCO groupSelect(@RequestBody XCO xco){
		List<XCO> list = groupService.groupSelect();
		XCO select = new XCO();
		select.setXCOListValue("data", list);
		return select;
	}
	
}
