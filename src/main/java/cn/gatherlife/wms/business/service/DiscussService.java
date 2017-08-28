package cn.gatherlife.wms.business.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

@Service
public class DiscussService {
	
	/**
	 * 插入话题
	 * @param xco
	 * @return
	 */
	public long insertDiscuss(XCO xco){
		long row = SqlServiceActuator.execute("wms-discussservices.insertDiscuss", xco);
		return row;
	}
	
	/**
	 * 插入话题回复
	 * @param xco
	 * @return
	 */
	public long discussReplay(XCO xco){
		long row = SqlServiceActuator.execute("wms-discussservices.discussReplay", xco);
		return row;
	}
	
	/**
	 * 话题列表
	 * @param xco
	 * @return
	 */
	public XCO discusslist(XCO xco){
		return SqlServiceActuator.execute("wms-discussservices.discusslist", xco);
	}
	
	/**
	 * 查找单个话题
	 * @param xco
	 * @return
	 */
	public XCO selectDiscussById(XCO xco){
		//更新点击量
		SqlServiceActuator.execute("wms-discussservices.discussClick", xco);
		return SqlServiceActuator.execute("wms-discussservices.selectDiscussById", xco);
	}
	
	/**
	 * 更新话题
	 * @param xco
	 * @return
	 */
	public int updateDiscuss(XCO xco){
		return SqlServiceActuator.execute("wms-discussservices.updateDiscuss", xco);
	}
	
	/**
	 * 删除话题
	 * @param xco
	 * @return
	 */
	public int deleteDiscuss(XCO xco){
		return SqlServiceActuator.execute("wms-discussservices.deleteDiscuss", xco);
	}
	
	/**
	 * 讨论回复
	 * @param xco
	 * @return
	 */
	public List<XCO> discussReplylist(XCO xco){
		return SqlServiceActuator.execute("wms-discussservices.discussReplylist", xco);
	}
}
