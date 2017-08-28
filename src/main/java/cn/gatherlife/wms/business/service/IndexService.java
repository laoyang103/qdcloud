package cn.gatherlife.wms.business.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

@Service
public class IndexService {
	
	/**
	 * 插入班级
	 * @param xco
	 * @return
	 */
	public long insertIndex(XCO xco){
		String photo_title1 = xco.getStringValue("title1");
		String photo_title2 = xco.getStringValue("title2");
		String photo_title3 = xco.getStringValue("title3");
		Integer photo_type = xco.getIntegerValue("photo_type");
		String photo_src1 = xco.getStringValue("file_url1");
		String photo_src2 = xco.getStringValue("file_url2");
		String photo_src3 = xco.getStringValue("file_url3");
		String photo_link1 = xco.getStringValue("link1");
		String photo_link2 = xco.getStringValue("link2");
		String photo_link3 = xco.getStringValue("link3");
		String photo_name1 = xco.getStringValue("file_name1");
		String photo_name2 = xco.getStringValue("file_name2");
		String photo_name3 = xco.getStringValue("file_name3");
		long id1 = xco.getLongValue("id1");
		long id2 = xco.getLongValue("id2");
		long id3 = xco.getLongValue("id3");
		long row = 0;
		XCO req = new XCO();
		XCO xco1 = new XCO();
		xco1.setStringValue("photo_title", photo_title1);
		xco1.setStringValue("photo_src", photo_src1);
		xco1.setStringValue("photo_link", photo_link1);
		xco1.setStringValue("photo_name", photo_name1);
		xco1.setIntegerValue("photo_type", photo_type);
		if(id1 == 0){
			row = SqlServiceActuator.execute("wms-indexservices.insertPhoto", xco1);
		}else{
			xco1.setLongValue("id",id1);
			req = SqlServiceActuator.execute("wms-indexservices.updatePhoto", xco1);
			row = req.getLongValue("count");
		}
		
		XCO xco2 = new XCO();
		xco2.setStringValue("photo_title", photo_title2);
		xco2.setStringValue("photo_src", photo_src2);
		xco2.setStringValue("photo_link", photo_link2);
		xco2.setStringValue("photo_name", photo_name2);
		xco2.setIntegerValue("photo_type", photo_type);
		if(id2 == 0){
			row = SqlServiceActuator.execute("wms-indexservices.insertPhoto", xco2);
		}else{
			xco2.setLongValue("id",id2);
			req = SqlServiceActuator.execute("wms-indexservices.updatePhoto", xco2);
			row = req.getLongValue("count");
		}
		
		XCO xco3 = new XCO();
		xco3.setStringValue("photo_title", photo_title3);
		xco3.setStringValue("photo_src", photo_src3);
		xco3.setStringValue("photo_link", photo_link3);
		xco3.setStringValue("photo_name", photo_name3);
		xco3.setIntegerValue("photo_type", photo_type);
		if(id3 == 0){
			row = SqlServiceActuator.execute("wms-indexservices.insertPhoto", xco3);
		}else{
			xco3.setLongValue("id",id3);
			req = SqlServiceActuator.execute("wms-indexservices.updatePhoto", xco3);
			row = req.getLongValue("count");
		}
		return row;
	}
	
	/**
	 * 班级列表
	 * @param xco
	 * @return
	 */
	public XCO photolist(XCO xco){
		return SqlServiceActuator.execute("wms-indexservices.photolist", xco);
	}
	
}
