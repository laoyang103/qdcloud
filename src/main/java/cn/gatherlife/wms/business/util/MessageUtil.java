package cn.gatherlife.wms.business.util;

import java.util.HashMap;
import java.util.Map;
import java.util.Properties;


public class MessageUtil {
	public static  Map msg2role = new HashMap<>();

	public static void putMsg2role(Properties properties) {
		for (Object key : properties.keySet()) {
			msg2role.put(key, properties.get(key));
		}
	}
	
}
