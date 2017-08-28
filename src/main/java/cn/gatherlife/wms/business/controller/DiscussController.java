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

import cn.gatherlife.wms.business.service.DiscussService;
import cn.gatherlife.wms.business.util.XCOUtil;

@Controller
@RequestMapping("discuss")
public class DiscussController {

	private static Logger	logger	= Logger.getLogger(ClassController.class);
	
	@Autowired
	DiscussService discussService;
	
	
	@RequestMapping("discusslist")
	public @ResponseBody XCO discusslist(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setLongValue("student_id", userInfo.getLongValue("user_id"));
		XCO rep = discussService.discusslist(xco);
		return rep;
	}
	
	/**
	 * 插入
	 * @param xco
	 * @return
	 */
	@RequestMapping("insertDiscuss")
	public @ResponseBody XCO userAdd(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setStringValue("operator", userInfo.getStringValue("real_name"));
		long count = discussService.insertDiscuss(xco);
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
	@RequestMapping("selectDiscussById")
	public @ResponseBody XCO selectClassById(@RequestBody XCO xco){
		return discussService.selectDiscussById(xco);
	}
	

	/**删除更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("deleteDiscuss")
	public @ResponseBody XCO deleteDiscuss(@RequestBody XCO xco){
		long count = discussService.deleteDiscuss(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "删除失败");
		}else{
			return XCOUtil.getResultXCO(1, "删除成功");
		}
	}
	
	@RequestMapping("discussReplylist")
	public @ResponseBody XCO discussReplylist(@RequestBody XCO xco){
		List<XCO> list = discussService.discussReplylist(xco);
		XCO select = new XCO();
		select.setXCOListValue("data", list);
		return select;
	}
	
	/**保存回复话题
	 * @param xco
	 * @return
	 */
	@RequestMapping("discussReplay")
	public @ResponseBody XCO discussReplay(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setStringValue("operator", userInfo.getStringValue("real_name"));
		long count = discussService.discussReplay(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "回复失败");
		}else{
			return XCOUtil.getResultXCO(1, "回复成功");
		}
	}

}
