package cn.gatherlife.wms.business.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.ImportExcelService;

@Controller
@RequestMapping("uploadExcel")
public class ImportExcelController {
	
	@Autowired
	ImportExcelService importExcelService;
	
	
	
	@RequestMapping("excel")
	public @ResponseBody XCO ImportExcel(HttpServletRequest request,
			@RequestParam("file") MultipartFile file,ModelMap map) throws IOException {
		
		HttpSession session = request.getSession();
		XCO userInfo = (XCO) session.getAttribute("userInfo");
		String userName = userInfo.getStringValue("user_name");
		//执行导入
		//XCO x = new XCO();
		//x.setIntegerValue("code", 1);
		//return x;
		return importExcelService.ImportExcel(request, file,userName);
		
	}
}
