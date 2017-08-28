package cn.gatherlife.wms.business.config;

import org.apache.log4j.Logger;

import cn.gatherlife.wms.business.controller.LoginController;

public class TaskJob {
		private static Logger	logger	= Logger.getLogger(LoginController.class);
		public void SayHello() {
		     try {
		    	 logger.info("处理任务开始>........");
		            // 业务逻辑代码调用
		            System.out.println("时间[" + new java.util.Date().toLocaleString()
		                          + "]----->大家好啊！");
		            logger.info("处理任务结束!");
		     } catch (Exception e) {
		    	 logger.error("处理任务出现异常", e);
		     }
		}
}
