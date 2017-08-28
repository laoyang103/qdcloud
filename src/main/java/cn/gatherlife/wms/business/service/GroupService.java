package cn.gatherlife.wms.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

@Service
public class GroupService {
	
	@Autowired
	UserService userService;
	
	/**
	 * 新建分组  -》 保存
	 * 插入组（学生 ）
	 * @param xco
	 * @return
	 */
	public long insertGroup(XCO xco){
		long row = SqlServiceActuator.execute("wms-groupservices.insertGroup", xco);
		String idStr = xco.getStringValue("student_ids");
		if(idStr.indexOf(",") > -1){
			String[] arr = idStr.split(",");
			for(int i=0;i<arr.length;i++){
				XCO o = new XCO();
				o.setIntegerValue("user_id", Integer.valueOf(arr[i]));
				XCO user = userService.selectUserByUserId(o);
				
				XCO gs = new XCO();
				gs.setLongValue("group_id", row);
				gs.setStringValue("group_name", xco.getStringValue("group_name"));
				gs.setIntegerValue("student_id", Integer.valueOf(arr[i]));
				gs.setStringValue("student_name", user.getStringValue("real_name"));
				SqlServiceActuator.execute("wms-groupservices.insertGroupStudent", gs);
			}
		}else{
			XCO o = new XCO();
			o.setIntegerValue("user_id", Integer.valueOf(idStr));
			XCO user = userService.selectUserByUserId(o);
			
			XCO gs = new XCO();
			gs.setLongValue("group_id", row);
			gs.setStringValue("group_name", xco.getStringValue("group_name"));
			gs.setIntegerValue("student_id", Integer.valueOf(idStr));
			gs.setStringValue("student_name", user.getStringValue("real_name"));
			SqlServiceActuator.execute("wms-groupservices.insertGroupStudent", gs);
		}
		
		return row;
	}
	
	/**
	 * 分组管理-分组列表
	 */
	public XCO grouplist(XCO xco){
		return SqlServiceActuator.execute("wms-groupservices.grouplist", xco);
	}
	
	/**
	 * 查找单个用户
	 * @param xco
	 * @return
	 */
	public XCO selectGroupById(XCO xco){
		return SqlServiceActuator.execute("wms-groupservices.selectGroupById", xco);
	}
	
	/**
	 * 更新组信息
	 * @param xco
	 * @return
	 */
	public int updateGroup(XCO xco){
		int row = SqlServiceActuator.execute("wms-groupservices.updateGroup", xco);
		//先删除该组的学生
		SqlServiceActuator.execute("wms-groupservices.deleteGroupStudent", xco);
		//然后再添加
		String idStr = xco.getStringValue("student_ids");
		if(idStr.indexOf(",") > -1){
			String[] arr = idStr.split(",");
			for(int i=0;i<arr.length;i++){
				XCO o = new XCO();
				o.setIntegerValue("user_id", Integer.valueOf(arr[i]));
				XCO user = userService.selectUserByUserId(o);
				
				XCO gs = new XCO();
				gs.setLongValue("group_id", xco.getLongValue("group_id"));
				gs.setStringValue("group_name", xco.getStringValue("group_name"));
				gs.setIntegerValue("student_id", Integer.valueOf(arr[i]));
				gs.setStringValue("student_name", user.getStringValue("real_name"));
				SqlServiceActuator.execute("wms-groupservices.insertGroupStudent", gs);
			}
		}else{
			XCO o = new XCO();
			o.setIntegerValue("user_id", Integer.valueOf(idStr));
			XCO user = userService.selectUserByUserId(o);
			
			XCO gs = new XCO();
			gs.setLongValue("group_id", xco.getLongValue("group_id"));
			gs.setStringValue("group_name", xco.getStringValue("group_name"));
			gs.setIntegerValue("student_id", Integer.valueOf(idStr));
			gs.setStringValue("student_name", user.getStringValue("real_name"));
			SqlServiceActuator.execute("wms-groupservices.insertGroupStudent", gs);
		}
		
		return row;
	}
	
	/**
	 * 删除用户
	 * @param xco
	 * @return
	 */
	public int deleteGroup(XCO xco){
		String delStr = xco.getStringValue("delstr");
		if(null!=delStr && !"".equals(delStr)){
			if(delStr.indexOf(",") > -1){
				String[] arr = delStr.split(",");
				for(int i=0;i<arr.length;i++){
					XCO dxco = new XCO();
					dxco.setIntegerValue("group_id", Integer.valueOf(arr[i]));
					SqlServiceActuator.execute("wms-groupservices.deleteGroup", dxco);
				}
			}else{
				XCO dxco = new XCO();
				dxco.setIntegerValue("group_id", Integer.valueOf(delStr));
				SqlServiceActuator.execute("wms-groupservices.deleteGroup", dxco);
			}
			return 1;
		}else{
			return 0;
		}
	}
	
	/**
	 * 查找该组已经有的学生
	 * @param xco
	 * @return
	 */
	public List<XCO> listbygroupid(XCO xco){
		return SqlServiceActuator.execute("wms-groupservices.listbygroupid", xco);
	}
	
	/**
	 * 查找某班级下所有的学生
	 * @param xco
	 * @return
	 */
	public List<XCO> selectStudentById(XCO xco){
		xco.setIntegerValue("type", 1);
		return SqlServiceActuator.execute("wms-userservices.studentbyclassid", xco);
	}
	
	/**
	 * 学生预约===================查找某班级下所有的学生2
	 * @param xco
	 * @return
	 */
	public List<XCO> selectStudentById2(XCO xco){
		xco.setIntegerValue("type", 1);
		return SqlServiceActuator.execute("wms-userservices.studentbyclassid2", xco);
	}
	
	/**
	 * 组下拉列表
	 * @return
	 */
	public List<XCO> groupSelect(){
		XCO xco = new XCO();
		return SqlServiceActuator.execute("wms-groupservices.groupSelect", xco);
	}
	
}
