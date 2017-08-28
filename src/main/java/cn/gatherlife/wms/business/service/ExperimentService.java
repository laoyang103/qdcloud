package cn.gatherlife.wms.business.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

import cn.gatherlife.wms.business.util.XCOUtil;

@Service
public class ExperimentService {
	
	/**
	 * 插入实验室
	 * @param xco
	 * @return
	 */
	public long insertExp(XCO xco){
		long row = 0;
		row = SqlServiceActuator.execute("wms-experimentservices.checkDupExp", xco);
		if(row > 0){
			return 5;
		}else{
			String remark = XCOUtil.encodeTextForXML(xco.getStringValue("remark"));
			xco.setStringValue("remark", remark);
			row = SqlServiceActuator.execute("wms-experimentservices.insertExp", xco);
			return row;
		}
	}
	
	/**
	 * 实验室列表
	 * @param xco
	 * @return
	 */
	public XCO explist(XCO xco){
		return SqlServiceActuator.execute("wms-experimentservices.explist", xco);
	}
	
	/**
	 * 查找单个实验室
	 * @param xco
	 * @return
	 */
	public XCO selectExpById(XCO xco){
		return SqlServiceActuator.execute("wms-experimentservices.selectExpById", xco);
	}
	
	/**
	 * 更新实验室
	 * @param xco
	 * @return
	 */
	public int updateExp(XCO xco){
		XCO exp = SqlServiceActuator.execute("wms-experimentservices.checkDupExp2", xco);
		if(null!=exp && (exp.getLongValue("experiment_id") != xco.getLongValue("experiment_id"))){
			return 5;
		}
		String remark = XCOUtil.encodeTextForXML(xco.getStringValue("remark"));
		xco.setStringValue("remark", remark);
		return SqlServiceActuator.execute("wms-experimentservices.updateExp", xco);
	}
	
	/**
	 * 删除实验室
	 * @param xco
	 * @return
	 */
	public int deleteExp(XCO xco){
		String delStr = xco.getStringValue("delstr");
		if(null!=delStr && !"".equals(delStr)){
			if(delStr.indexOf(",") > -1){
				String[] arr = delStr.split(",");
				for(int i=0;i<arr.length;i++){
					XCO dxco = new XCO();
					dxco.setIntegerValue("experiment_id", Integer.valueOf(arr[i]));
					SqlServiceActuator.execute("wms-experimentservices.deleteExp", dxco);
				}
			}else{
				XCO dxco = new XCO();
				dxco.setIntegerValue("experiment_id", Integer.valueOf(delStr));
				SqlServiceActuator.execute("wms-experimentservices.deleteExp", dxco);
			}
			return 1;
		}else{
			return 0;
		}
		//return SqlServiceActuator.execute("wms-experimentservices.deleteExp", xco);
	}
	
	/**
	 * 实验室下拉列表
	 * @return
	 */
	public List<XCO> typeSelect(){
		XCO xco = new XCO();
		return SqlServiceActuator.execute("wms-experimentservices.typeSelect", xco);
	}
	
	/**
	 * 实验下拉列表
	 * @return
	 */
	public List<XCO> experimentSelect(XCO xco){
		return SqlServiceActuator.execute("wms-experimentservices.experimentSelect", xco);
	}
}
