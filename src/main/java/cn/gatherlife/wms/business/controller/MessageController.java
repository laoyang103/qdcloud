package cn.gatherlife.wms.business.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.MessageService;
import cn.gatherlife.wms.business.util.XCOUtil;

@Controller
@RequestMapping("message")
public class MessageController {

	private static Logger	logger	= Logger.getLogger(MessageController.class);
	
	@Autowired
	MessageService messageService;
	
	/**
	 * 查询列表
	 * @param xco
	 * @return
	 */
	@RequestMapping("messagelist")
	public @ResponseBody XCO messagelist(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setIntegerValue("receiver", userInfo.getIntegerValue("type"));
		XCO rep = messageService.msglist(xco);
		rep.setIntegerValue("type", userInfo.getIntegerValue("type"));
		return rep;
	}
	
	
	/**
	 * 查询列表
	 * @param xco
	 * @return
	 */
	@RequestMapping("messagelist2")
	public @ResponseBody XCO messagelist2(@RequestBody XCO xco,HttpServletRequest request){
		XCO rep = messageService.msglist(xco);
		return rep;
	}
	
	
	/**
	 * 查询列表
	 * @param xco
	 * @return
	 */
	@RequestMapping("messageadminlist")
	public @ResponseBody XCO messageadminlist(@RequestBody XCO xco,HttpServletRequest request){
		//XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		//xco.setIntegerValue("receiver", userInfo.getIntegerValue("type"));
		XCO rep = messageService.msglist(xco);
		return rep;
	}
	
	/**
	 * 插入
	 * @param xco
	 * @return
	 */
	@RequestMapping("insertMsg")
	public @ResponseBody XCO insertMsg(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setIntegerValue("sender", userInfo.getIntegerValue("type"));
		xco.setStringValue("operator", userInfo.getStringValue("user_name"));
		long count = messageService.insertMsg(xco);
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
	@RequestMapping("selectMsgById")
	public @ResponseBody XCO selectMsgById(@RequestBody XCO xco){
		return messageService.selectMsgById(xco);
	}
	
	
	/**
	 * 更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateMsg")
	public @ResponseBody XCO updateUser(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setIntegerValue("sender", userInfo.getIntegerValue("type"));
		long count = messageService.updateMsg(xco);
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
	@RequestMapping("deleteMsg")
	public @ResponseBody XCO deleteMsg(@RequestBody XCO xco){
		long count = messageService.deleteMsg(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "删除失败");
		}else{
			return XCOUtil.getResultXCO(1, "删除成功");
		}
	}
	
}
