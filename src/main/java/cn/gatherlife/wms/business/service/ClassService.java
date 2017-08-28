package cn.gatherlife.wms.business.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

@Service
public class ClassService {
	
	/**
	 * 插入班级
	 * @param xco
	 * @return
	 */
	public long insertClass(XCO xco){
		long row = SqlServiceActuator.execute("wms-classservices.insertClass", xco);
		return row;
	}
	
	/**
	 * 班级列表
	 * @param xco
	 * @return
	 */
	public XCO classlist(XCO xco){
		return SqlServiceActuator.execute("wms-classservices.classlist", xco);
	}
	
	/**
	 * 查找单个班级
	 * @param xco
	 * @return
	 */
	public XCO selectClassById(XCO xco){
		return SqlServiceActuator.execute("wms-classservices.selectClassById", xco);
	}
	
	/**
	 * 更新班级
	 * @param xco
	 * @return
	 */
	public int updateClass(XCO xco){
		return SqlServiceActuator.execute("wms-classservices.updateClass", xco);
	}
	
	/**
	 * 删除班级
	 * @param xco
	 * @return
	 */
	public int deleteClass(XCO xco){
		String delStr = xco.getStringValue("delstr");
		if(null!=delStr && !"".equals(delStr)){
			if(delStr.indexOf(",") > -1){
				String[] arr = delStr.split(",");
				for(int i=0;i<arr.length;i++){
					XCO dxco = new XCO();
					dxco.setIntegerValue("class_id", Integer.valueOf(arr[i]));
					SqlServiceActuator.execute("wms-classservices.deleteClass", dxco);
				}
			}else{
				XCO dxco = new XCO();
				dxco.setIntegerValue("class_id", Integer.valueOf(delStr));
				SqlServiceActuator.execute("wms-classservices.deleteClass", dxco);
			}
			return 1;
		}else{
			return 0;
		}
	}
	
	/**
	 * 班级下拉列表
	 * @return
	 */
	public List<XCO> classSelect(){
		XCO xco = new XCO();
		return SqlServiceActuator.execute("wms-classservices.classSelect", xco);
	}
	
	/**
	 * 院系下拉列表
	 * @return
	 */
	public List<XCO> departSelect(){
		XCO xco = new XCO();
		return SqlServiceActuator.executeAlone("wms-classservices.departSelect", xco);
	}
}
