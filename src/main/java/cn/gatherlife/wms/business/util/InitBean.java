package cn.gatherlife.wms.business.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.xson.tangyuan.TangYuanContainer;
import org.xson.tangyuan.bridge.BridgedCallSupport;

public class InitBean {

	private Logger		logger	= Logger.getLogger(InitBean.class);

	private MyWriter	writer	= null;

	private String		msgResource;

	public void setMsgResource(String msgResource) {
		this.msgResource = msgResource;
	}

	public void init() throws Throwable {
		if (null != msgResource) {
			Properties prop = new Properties();
			try {
				InputStream ins = this.getClass().getResourceAsStream(msgResource);
				prop.load(ins);
				MessageUtil.putMsg2role(prop);
			} catch (IOException e) {
				logger.info("初始化消息通知对应角色失败,请检查配置文件是否存在");
			}
		}
		System.out.println("xxxx");
		BridgedCallSupport.register("JAVA://", new JavaBridgedCallHandler());
		BridgedCallSupport.register("SPRING://", new SpringBridgedCallHandler());

		writer = new MyWriter();
		writer.init();
		TangYuanContainer.getInstance().startMonitor(writer);
	}

	public void destroy() {
		try {

			if (null != writer) {
				writer.close();
			}

			logger.info("message stop ...");
		} catch (Throwable e) {
			logger.error("message stop failure...", e);
		}
	}
}
