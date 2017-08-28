package cn.gatherlife.wms.business.util;

import java.io.FileWriter;
import java.io.IOException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.xson.tangyuan.executor.monitor.MonitorWriter;

public class MyWriter implements MonitorWriter {
	
	private static Log logger = LogFactory.getLog("MyWriter");
	
	private FileWriter	logWriter	= null;

	public void init() {
		//logWriter = new FileWriter("D:/a.log", true);
		//logWriter = new FileWriter("/tmp/service.log", true);
		//logger1.debug("111111111111111111111111111111111111111111111");
	}

	public void close() {
		if (null != logWriter) {
			try {
				logWriter.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	@Override
	public void writer(StringBuilder builder) {
		//if (null != logWriter) {
				logger.debug(builder.toString());
				//logWriter.write(builder.toString());
				//logWriter.flush();
		//}
	}
}
