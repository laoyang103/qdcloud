package cn.gatherlife.wms.business.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.ClassService;
import cn.gatherlife.wms.business.util.XCOUtil;

@Controller
@RequestMapping("class")
public class ClassController {

	private static Logger	logger	= Logger.getLogger(ClassController.class);
	
	@Autowired
	ClassService classService;
	
	
	@RequestMapping("classlist")
	public @ResponseBody XCO programlist(@RequestBody XCO xco){
		//执行导入
		
		XCO rep = classService.classlist(xco);
		return rep;
	}
	
	/**
	 * 插入
	 * @param xco
	 * @return
	 */
	@RequestMapping("insertClass")
	public @ResponseBody XCO userAdd(@RequestBody XCO xco){
		//执行导入
		long count = classService.insertClass(xco);
		if(count == 1){
			return XCOUtil.getResultXCO(0, "班号重复，请查证后输入");
		}else{
			return XCOUtil.getResultXCO(1, "保存成功");
		}
	}
	
	/**
	 * 查询单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectClassById")
	public @ResponseBody XCO selectClassById(@RequestBody XCO xco){
		return classService.selectClassById(xco);
	}
	
	
	/**
	 * 更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateClass")
	public @ResponseBody XCO updateClass(@RequestBody XCO xco){
		long count = classService.updateClass(xco);
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
	@RequestMapping("deleteClass")
	public @ResponseBody XCO deleteClass(@RequestBody XCO xco){
		long count = classService.deleteClass(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "删除失败");
		}else{
			return XCOUtil.getResultXCO(1, "删除成功");
		}
	}
	
	
	
	@RequestMapping("classSelect")
	public @ResponseBody XCO classSelect(@RequestBody XCO xco){
		//执行导入
		List<XCO> list = classService.classSelect();
		XCO select = new XCO();
		select.setXCOListValue("data", list);
		return select;
	}
	
	@RequestMapping("departSelect")
	public @ResponseBody XCO departSelect(@RequestBody XCO xco){
		//执行导入
		List<XCO> list = classService.departSelect();
		XCO select = new XCO();
		select.setXCOListValue("data", list);
		return select;
	}
	
	
}
