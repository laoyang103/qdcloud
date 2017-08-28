package cn.gatherlife.wms.business.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

import cn.gatherlife.wms.business.util.XCOUtil;

@Service
public class ExampleService {
	
	/**
	 * 插入习题
	 * @param xco
	 * @return
	 */
	public long insertExa(XCO xco){
		String example_content = XCOUtil.encodeTextForXML(xco.getStringValue("example_content"));
		xco.setStringValue("example_content", example_content);
		long row = SqlServiceActuator.execute("wms-exampleservices.insertExa", xco);
		return row;
	}
	
	/**
	 * 习题列表
	 * @param xco
	 * @return
	 */
	public XCO exalist(XCO xco){
		return SqlServiceActuator.execute("wms-exampleservices.exalist", xco);
	}
	
	/**
	 * 查找单个习题
	 * @param xco
	 * @return
	 */
	public XCO selectExaById(XCO xco){
		return SqlServiceActuator.execute("wms-exampleservices.selectExaById", xco);
	}
	
	/**
	 * 更新习题
	 * @param xco
	 * @return
	 */
	public int updateExa(XCO xco){
		String example_content = XCOUtil.encodeTextForXML(xco.getStringValue("example_content"));
		xco.setStringValue("example_content", example_content);
		return SqlServiceActuator.execute("wms-exampleservices.updateExa", xco);
	}
	
	/**
	 * 删除习题
	 * @param xco
	 * @return
	 */
	public int deleteExa(XCO xco){
		String delStr = xco.getStringValue("delstr");
		if(null!=delStr && !"".equals(delStr)){
			if(delStr.indexOf(",") > -1){
				String[] arr = delStr.split(",");
				for(int i=0;i<arr.length;i++){
					XCO dxco = new XCO();
					dxco.setIntegerValue("example_id", Integer.valueOf(arr[i]));
					SqlServiceActuator.execute("wms-exampleservices.deleteExa", dxco);
				}
			}else{
				XCO dxco = new XCO();
				dxco.setIntegerValue("example_id", Integer.valueOf(delStr));
				SqlServiceActuator.execute("wms-exampleservices.deleteExa", dxco);
			}
			return 1;
		}else{
			return 0;
		}
	}
	
	/**
	 * 习题下拉列表
	 * @return
	 */
	public List<XCO> exampleSelect(XCO xco){
		return SqlServiceActuator.execute("wms-exampleservices.exampleSelect", xco);
	}
}
