package cn.gatherlife.wms.business.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;
import org.xson.tangyuan.executor.SqlServiceException;

import cn.gatherlife.wms.business.util.XCOUtil;

@Service("importExcelService")
public class ImportExcelService {

	XCO returnXCO = new XCO();
	
	/**
	 * 导入主业务方法
	 * @param request
	 * @param file
	 * @throws IOException
	 */
	public XCO ImportExcel(HttpServletRequest request,MultipartFile file,String userName) throws IOException {
		
		InputStream stream = null;	
		List<XCO> xcolist = new ArrayList<XCO>();
		//列规则
		List<XCO> xcoimplist = new ArrayList<XCO>();
		XCO returnXCO = new XCO();
		
		//String fileType = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".")+1,file.getOriginalFilename().length());
		//
		//returnXCO.setStringValue("program_name", oldfileName);
		System.out.println("-------------------"+file.getOriginalFilename());
		returnXCO.setStringValue("operator", userName);
		try {
			stream = file.getInputStream();
			HSSFWorkbook hwk = new HSSFWorkbook(stream);
			HSSFSheet hssfSheet = hwk.getSheetAt(0);
			
			//判断重复的map
			Map<String, String> unimap = new HashMap<String, String>();
			
			//循环判断账号是否重复
		
			for (int rowNum = 1; rowNum < hssfSheet.getLastRowNum() + 1; rowNum++) {
				
				HSSFRow hssfRow = hssfSheet.getRow(rowNum);
				//学生账号
				if (hssfRow != null) {
					// 学生登录账户
					HSSFCell user_name = hssfRow.getCell(0);
					// 学生登录密码
					HSSFCell password = hssfRow.getCell(1);
					// 学生姓名
					HSSFCell real_name = hssfRow.getCell(2);
					// 学生性别
					HSSFCell sex = hssfRow.getCell(3);
					// 学生所在班级
					HSSFCell class_name = hssfRow.getCell(4);
					
					long class_id = 0;
					if(class_name!=null){
						XCO xco4 = new XCO();
						xco4.setStringValue("class_name",class_name.toString().trim());
						try {
							class_id = SqlServiceActuator.execute("wms-importexcelservices.getCId", xco4);
						} catch (NullPointerException e) {
							class_id = 0;
						}
					}
					
					//判断每行每列 规则是否符合要求
					List<XCO> excolist = shopRowException(unimap,xcoimplist,rowNum,user_name,password,real_name,sex,class_name,class_id);
					
					if(excolist != null && excolist.size() > 0){
						returnXCO.setXCOListValue("imxcoilist", excolist);
					}else{
						XCO xco = new XCO();
						xco.setStringValue("user_name", user_name.toString().trim());
						xco.setStringValue("password", password.toString());
						xco.setStringValue("real_name", real_name.toString().trim());
						xco.setLongValue("class_id", class_id);
						if(sex.toString().trim().equals("女")){
							xco.setIntegerValue("sex", 1);
						}else{
							xco.setIntegerValue("sex", 0);
						}
						xco.setStringValue("class_name", class_name.toString().trim());
						xcolist.add(xco);
					}
					
				}
			} 
			returnXCO.setXCOListValue("xcolist", xcolist);
			if(null!=returnXCO.getXCOListValue("imxcoilist") && returnXCO.getXCOListValue("imxcoilist").size() > 0){
				//插入异常数据
				System.out.println(returnXCO.toXMLString());
				XCO xco=XCOUtil.getResultXCO(110, "数据异常",returnXCO);
				System.out.println(xco);
				return xco;
			}else{
				for(int i= 0;i<xcolist.size();i++){
					SqlServiceActuator.execute("wms-importexcelservices.insertExcel", xcolist.get(i));
				}
				return XCOUtil.getResultXCO(0,"导入成功！");
			}
//			System.out.println("----------------------------------");
//			return XCOUtil.getResultXCO(120, "数据异常");
		}catch(SqlServiceException e){
			return XCOUtil.getResultXCO(e.getErrorCode(), e.getErrorMessage());
		}
		
	}
	
	/**
	 * 检测异常
	 * @param xcoimplist
	 * @param row
	 * @param user_name
	 * @param password
	 * @param real_name
	 * @param sex
	 * @param class_name
	 * @return
	 */
	public List<XCO> shopRowException(Map<String, String> unimap,List<XCO> xcoimplist,int row,HSSFCell user_name,HSSFCell password,HSSFCell real_name,HSSFCell sex,HSSFCell class_name,long class_id){
		int realRow = row+1;
		if(null==user_name || "".equals(user_name.toString())){
			XCO xco0 = new XCO();
			xco0.setStringValue("msg", "excel中第"+realRow+"行，账号为空！");
			xcoimplist.add(xco0);
		}else{
			if(unimap.containsKey(user_name.toString().trim())){
				XCO uxco = new XCO();
				uxco.setStringValue("msg", "excel中第"+realRow+"行，账号"+user_name.toString().trim()+"重复！");
				xcoimplist.add(uxco);
			}else{
				XCO exco = new XCO();
				exco.setStringValue("user_name",user_name.toString().trim());
				long count = SqlServiceActuator.execute("wms-importexcelservices.existUserName", exco);
				if(count==0){
					unimap.put(user_name.toString(), null);
				}else{
					XCO uxco1 = new XCO();
					uxco1.setStringValue("msg", "excel中第"+realRow+"行，账号"+user_name.toString().trim()+"已存在！");
					xcoimplist.add(uxco1);
				}
			}
		}
		
		if(null==password || "".equals(password.toString())){
			XCO xco1 = new XCO();
			xco1.setStringValue("msg", "excel中第"+realRow+"行，密码为空！");
			xcoimplist.add(xco1);
		}
		
		if(null==real_name || "".equals(real_name.toString())){
			XCO xco2 = new XCO();
			xco2.setStringValue("msg", "excel中第"+realRow+"行，姓名为空！");
			xcoimplist.add(xco2);
		}
		
		if(null==class_name || "".equals(class_name.toString())){
			XCO xco3 = new XCO();
			xco3.setStringValue("msg", "excel中第"+realRow+"行，班级为空！");
			xcoimplist.add(xco3);
		}else if(class_name!=null&&class_id==0){
			XCO xcoc = new XCO();
			xcoc.setStringValue("msg","excel中第"+realRow+"行，班级不存在！");
			xcoimplist.add(xcoc);
		}
		
		return xcoimplist;
	}
	
	
}
