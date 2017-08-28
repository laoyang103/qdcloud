package cn.gatherlife.wms.business.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.CommonService;

public class StaticController {
	
	@Autowired
	private CommonService commonService;

	private static Logger	log	= Logger.getLogger(StaticController.class);

	// public static Object getUserModuleByRole(int role_id) {
	public Map<String, LinkedHashMap<String, String>> getUserModuleByRole(int role_id) {
		try {
			XCO request = new XCO();
			request.setIntegerValue("role_id", role_id);
			//XCO result = RpcClient.call(Domain.BUSINESS_HOST + "wms-systemservice/queryModuleByRole", request);
			XCO result = commonService.execute("wms-roleservices.queryModuleByRole",request);
			Map<String, LinkedHashMap<String, String>> leftNav = new LinkedHashMap<String, LinkedHashMap<String, String>>();
			Map<Long, String> moduleNameMap = new HashMap<Long, String>();
			if (null != result && 0 == result.getCode()) {
				// System.out.println(result);
				List<XCO> list = result.getXCOListValue("data");
				for (XCO item : list) {
					// System.out.println(item);
					LinkedHashMap<String, String> itemMap = null;
					int level = item.getIntegerValue("level");
					if (1 == level) {
						moduleNameMap.put(item.getLongValue("module_id"), item.getStringValue("module_name"));
						itemMap = new LinkedHashMap<String, String>();
						leftNav.put(item.getStringValue("module_name"), itemMap);
					} else {
						itemMap = leftNav.get(moduleNameMap.get(item.getLongValue("f_id")));
						if(null!=itemMap){
							itemMap.put(item.getStringValue("module_name"), item.getStringValue("url"));
						}
					}
				}
				return leftNav;
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
		return null;
	}
/**
	public static List<XCO> selectSupplier() {
		XCO result = RpcClient.call(Domain.BUSINESS_HOST + "wms-jspservices/selectSupplier", new XCO());
		if (null != result && 0 == result.getCode()) {
			return result.getXCOListValue("data");
		}
		return null;
	}
	//查询库房
	public static List<XCO> selectStorage() {
		XCO result = RpcClient.call(Domain.BUSINESS_HOST + "wms-jspservices/selectStorage", new XCO());
		if (null != result && 0 == result.getCode()) {
			return result.getXCOListValue("data");
		}
		return null;
	}
	
	//查询店铺
	public static List<XCO> selectShop() {
		XCO result = RpcClient.call(Domain.BUSINESS_HOST + "wms-jspservices/selectShop", new XCO());
		if (null != result && 0 == result.getCode()) {
			return result.getXCOListValue("data");
		}
		return null;
	}

	
	public static int selectPSQ() {
		XCO xco=RpcClient.call(Domain.BUSINESS_HOST+"wms-distributionservices/selectPSQ");
		
		return (int)xco.getLongValue("data");
	}
	
	public static List<XCO> selectRoutes() {
		XCO xco=RpcClient.call(Domain.BUSINESS_HOST+"wms-distributionservices/selectRouteids");
		return xco.getXCOListValue("data");
	}
	
	
	public static void main(String[] args) {
		// getUserModuleByRole(2);
		selectSupplier();
		selectStorage();
	}
	
	*/
}
