package cn.gatherlife.wms.business.util;

import org.xson.tangyuan.bridge.XMLBridgedCallHandler;

public class JavaBridgedCallHandler implements XMLBridgedCallHandler {

	@Override
	public Object call(String service, Object request) {
		if ("xxxxxxx".equals(service)) {
			System.out.println(request);
			// XCO xco = new XCO();
			return "调用成功";
		}
		return null;
	}

}
