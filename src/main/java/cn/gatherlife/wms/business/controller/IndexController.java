package cn.gatherlife.wms.business.controller;


import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.IndexService;
import cn.gatherlife.wms.business.util.XCOUtil;

@Controller
@RequestMapping("index")
public class IndexController {

	private static Logger	logger	= Logger.getLogger(IndexController.class);
	
	@Autowired
	IndexService indexService;
	
	
	@RequestMapping("photolist")
	public @ResponseBody XCO photolist(@RequestBody XCO xco){
		XCO rep = indexService.photolist(xco);
		return rep;
	}
	
	/**
	 * 插入
	 * @param xco
	 * @return
	 */
	@RequestMapping("insertIndex")
	public @ResponseBody XCO insertIndex(@RequestBody XCO xco){
		long count = indexService.insertIndex(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "保存失败");
		}else{
			return XCOUtil.getResultXCO(1, "保存成功");
		}
	}
	

}
