package cn.gatherlife.wms.business.service;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

import cn.gatherlife.wms.business.util.XCOUtil;

@Service
public class NewsService {
	
	/**
	 * 插入新闻
	 * @param xco
	 * @return
	 */
	public long insertNews(XCO xco){
		//String content = XCOUtil.encodeTextForXML(xco.getStringValue("content"));
		//System.out.println("======================"+content);
		//xco.setStringValue("content", content);
		long row = SqlServiceActuator.execute("wms-newsservices.insertNews", xco);
		return row;
	}
	
	/**
	 * 新闻列表
	 * @param xco
	 * @return
	 */
	public XCO newslist(XCO xco){
		return SqlServiceActuator.execute("wms-newsservices.newslist", xco);
	}
	
	/**
	 * 查找单个新闻
	 * @param xco
	 * @return
	 */
	public XCO selectNewsById(XCO xco){
		return SqlServiceActuator.execute("wms-newsservices.selectNewsById", xco);
	}
	
	/**
	 * 更新新闻
	 * @param xco
	 * @return
	 */
	public int updateNews(XCO xco){
		//String content = XCOUtil.encodeTextForXML(xco.getStringValue("content"));
		//xco.setStringValue("content", content);
		return SqlServiceActuator.execute("wms-newsservices.updateNews", xco);
	}
	
	/**
	 * 删除新闻
	 * @param xco
	 * @return
	 */
	public int deleteNews(XCO xco){
		String delStr = xco.getStringValue("delstr");
		if(null!=delStr && !"".equals(delStr)){
			if(delStr.indexOf(",") > -1){
				String[] arr = delStr.split(",");
				for(int i=0;i<arr.length;i++){
					XCO dxco = new XCO();
					dxco.setLongValue("id", Long.valueOf(arr[i]));
					SqlServiceActuator.execute("wms-newsservices.deleteNews", dxco);
				}
			}else{
				XCO dxco = new XCO();
				dxco.setLongValue("id", Long.valueOf(delStr));
				SqlServiceActuator.execute("wms-newsservices.deleteNews", dxco);
			}
			return 1;
		}else{
			return 0;
		}
	}
}
