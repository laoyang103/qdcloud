package cn.gatherlife.wms.business.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.ExperimentService;
import cn.gatherlife.wms.business.util.XCOUtil;

@Controller
@RequestMapping("experiment")
public class ExperimentController {

	private static Logger	logger	= Logger.getLogger(ExperimentController.class);
	
	@Autowired
	ExperimentService experimentService;
	
	/**
	 * 查询列表
	 * @param xco
	 * @return
	 */
	@RequestMapping("experimentlist")
	public @ResponseBody XCO experimentlist(@RequestBody XCO xco,HttpServletRequest request){
		//XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		//xco.setStringValue("operator", userInfo.getStringValue("user_name"));
		//执行导入
		XCO rep = experimentService.explist(xco);
		return rep;
	}
	
	/**查找该班级下所有的学生
	 * @param xco
	 * @return
	 */
	@RequestMapping("typeSelect")
	public @ResponseBody XCO typeSelect(@RequestBody XCO xco){
		List<XCO> list = experimentService.typeSelect();
		XCO select = new XCO();
		select.setXCOListValue("data", list);
		return select;
	}
	
	/**
	 * 插入
	 * @param xco
	 * @return
	 */
	@RequestMapping("insertExp")
	public @ResponseBody XCO insertExp(@RequestBody XCO xco,HttpServletRequest request){
		//执行导入
		XCO  userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setStringValue("operator", userInfo.getStringValue("user_name"));
		long count = experimentService.insertExp(xco);
		if(count == 5){
			return XCOUtil.getResultXCO(5, "实验编号重复");
		}else if(count == 0){
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
	@RequestMapping("selectExpById")
	public @ResponseBody XCO selectExpById(@RequestBody XCO xco){
		return experimentService.selectExpById(xco);
	}
	
	
	/**
	 * 更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateExp")
	public @ResponseBody XCO updateExp(@RequestBody XCO xco,HttpServletRequest request){
		XCO  userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setStringValue("operator", userInfo.getStringValue("user_name"));
		long count = experimentService.updateExp(xco);
		if(count == 5){
			return XCOUtil.getResultXCO(5, "实验编号重复");
		}else if(count == 0){
			return XCOUtil.getResultXCO(0, "更新失败");
		}else{
			return XCOUtil.getResultXCO(1, "更新成功");
		}
	}
	
	/**删除对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("deleteExp")
	public @ResponseBody XCO delUser(@RequestBody XCO xco){
		long count = experimentService.deleteExp(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "删除失败");
		}else{
			return XCOUtil.getResultXCO(1, "删除成功");
		}
	}	
	
	@RequestMapping("experimentSelect")
	public @ResponseBody XCO experimentSelect(@RequestBody XCO xco,HttpServletRequest request){
		//long t = xco.getLongValue("t");
		//if(t == 0){
		//	XCO  userInfo = (XCO)request.getSession().getAttribute("userInfo");
		//	xco.setStringValue("operator", userInfo.getStringValue("user_name"));
		//}
		//执行导入
		List<XCO> list = experimentService.experimentSelect(xco);
		XCO select = new XCO();
		select.setXCOListValue("data", list);
		return select;
	}
	
}
