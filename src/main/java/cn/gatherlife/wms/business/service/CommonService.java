package cn.gatherlife.wms.business.service;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;
@Service
public class CommonService {

	public <T> T execute(String serviceId, XCO request){
		return SqlServiceActuator.execute(serviceId, request);
	}
	
}
