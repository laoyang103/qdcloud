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

import cn.gatherlife.wms.business.service.ExampleService;
import cn.gatherlife.wms.business.util.XCOUtil;

@Controller
@RequestMapping("example")
public class ExampleController {

	private static Logger	logger	= Logger.getLogger(ExampleController.class);
	
	@Autowired
	ExampleService axampleService;
	
	
	@RequestMapping("exalist")
	public @ResponseBody XCO exalist(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setStringValue("operator", userInfo.getStringValue("user_name"));
		XCO rep = axampleService.exalist(xco);
		return rep;
	}
	
	/**
	 * 插入
	 * @param xco
	 * @return
	 */
	@RequestMapping("insertExa")
	public @ResponseBody XCO insertExa(HttpServletRequest request){
		XCO xco = new XCO();
		String example_name = request.getParameter("example_name2");
		String example_use = request.getParameter("example_use2");
		String example_content = request.getParameter("example_content2");
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setStringValue("operator", userInfo.getStringValue("user_name"));
		xco.setStringValue("example_name", example_name);
		xco.setStringValue("example_use", example_use);
		xco.setStringValue("example_content", example_content);
		long count = axampleService.insertExa(xco);
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
	@RequestMapping("selectExaById")
	public @ResponseBody XCO selectExaById(@RequestBody XCO xco){
		return axampleService.selectExaById(xco);
	}
	
	
	/**
	 * 更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateExa")
	public @ResponseBody XCO updateClass(HttpServletRequest request){
		XCO xco = new XCO();
		String example_id = request.getParameter("example_id");
		String example_name = request.getParameter("example_name2");
		String example_use = request.getParameter("example_use2");
		String example_content = request.getParameter("example_content2");
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setStringValue("operator", userInfo.getStringValue("user_name"));
		xco.setStringValue("example_id", example_id);
		xco.setStringValue("example_name", example_name);
		xco.setStringValue("example_use", example_use);
		xco.setStringValue("example_content", example_content);
		long count = axampleService.updateExa(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "更新失败");
		}else{
			return XCOUtil.getResultXCO(1, "更新成功");
		}
	}
	
	/**删除更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("deleteExa")
	public @ResponseBody XCO deleteExa(@RequestBody XCO xco){
		long count = axampleService.deleteExa(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "删除失败");
		}else{
			return XCOUtil.getResultXCO(1, "删除成功");
		}
	}
	
	
	@RequestMapping("exampleSelect")
	public @ResponseBody XCO exampleSelect(@RequestBody XCO xco,HttpServletRequest request){
		//long t = xco.getLongValue("t");
		//if(t == 0){
		//	XCO  userInfo = (XCO)request.getSession().getAttribute("userInfo");
		//	xco.setStringValue("operator", userInfo.getStringValue("user_name"));
		//}
		//执行导入
		List<XCO> list = axampleService.exampleSelect(xco);
		XCO select = new XCO();
		select.setXCOListValue("data", list);
		return select;
	}
	
}
