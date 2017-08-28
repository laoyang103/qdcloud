package cn.gatherlife.wms.business.controller;


import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.NewsService;
import cn.gatherlife.wms.business.util.XCOUtil;

@Controller
@RequestMapping("news")
public class NewsController {

	private static Logger	logger	= Logger.getLogger(NewsController.class);
	
	@Autowired
	NewsService newsService;
	
	
	@RequestMapping("newslist")
	public @ResponseBody XCO newslist(@RequestBody XCO xco){
		XCO rep = newsService.newslist(xco);
		return rep;
	}
	
	/**
	 * 插入
	 * @param xco
	 * @return
	 */
	@RequestMapping("insertNews")
	public @ResponseBody XCO userAdd(@RequestBody XCO xco,HttpServletRequest request){
		XCO  userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setStringValue("operator", userInfo.getStringValue("user_name"));
		long count = newsService.insertNews(xco);
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
	@RequestMapping("selectNewsById")
	public @ResponseBody XCO selectNewsById(@RequestBody XCO xco){
		return newsService.selectNewsById(xco);
	}
	
	
	/**
	 * 更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateNews")
	public @ResponseBody XCO updateNews(@RequestBody XCO xco){
		long count = newsService.updateNews(xco);
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
	@RequestMapping("deleteNews")
	public @ResponseBody XCO deleteNews(@RequestBody XCO xco){
		long count = newsService.deleteNews(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "删除失败");
		}else{
			return XCOUtil.getResultXCO(1, "删除成功");
		}
	}
}
