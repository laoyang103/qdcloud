package cn.gatherlife.wms.business.service;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

import cn.gatherlife.wms.business.util.XCOUtil;

@Service
public class MessageService {
	
	/**
	 * 插入消息
	 * @param xco
	 * @return
	 */
	public long insertMsg(XCO xco){
		String message_content = XCOUtil.encodeTextForXML(xco.getStringValue("message_content"));
		xco.setStringValue("message_content", message_content);
		long row = SqlServiceActuator.execute("wms-messageservices.insertMsg", xco);
		return row;
	}
	
	/**
	 * 消息列表
	 * @param xco
	 * @return
	 */
	public XCO msglist(XCO xco){
		return SqlServiceActuator.execute("wms-messageservices.msglist", xco);
	}
	
	/**
	 * 查找单个消息
	 * @param xco
	 * @return
	 */
	public XCO selectMsgById(XCO xco){
		return SqlServiceActuator.execute("wms-messageservices.selectMsgById", xco);
	}
	
	/**
	 * 更新消息
	 * @param xco
	 * @return
	 */
	public int updateMsg(XCO xco){
		String message_content = XCOUtil.encodeTextForXML(xco.getStringValue("message_content"));
		xco.setStringValue("message_content", message_content);
		return SqlServiceActuator.execute("wms-messageservices.updateMsg", xco);
	}
	
	/**
	 * 删除消息
	 * @param xco
	 * @return
	 */
	public int deleteMsg(XCO xco){
		return SqlServiceActuator.execute("wms-messageservices.deleteMsg", xco);
	}
}
