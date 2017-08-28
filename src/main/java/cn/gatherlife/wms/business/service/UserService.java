package cn.gatherlife.wms.business.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

import cn.gatherlife.wms.business.util.MD5Util;

@Service
public class UserService {
	
	/**
	 * 插入用户（学生 或者教师）
	 * @param xco
	 * @return
	 */
	public long insertUser(XCO xco){
		long row = SqlServiceActuator.execute("wms-userservices.insertUser", xco);
		return row;
	}
	

	/**
	 * 判断账号是否存在
	 * @param xco
	 * @return
	 */
	public long studentbyUserName(XCO xco){
		long row = SqlServiceActuator.execute("wms-userservices.studentbyUserName", xco);
		return row;
	}
	
	/**
	 * 用户列表
	 * @param xco
	 * @return
	 */
	public XCO userlist(XCO xco){
		return SqlServiceActuator.execute("wms-userservices.userlist", xco);
	}
	
	/**
	 * 用户列表
	 * @param xco
	 * @return
	 */
	public XCO personlist(XCO xco){
		return SqlServiceActuator.execute("wms-userservices.personlist", xco);
	}
	
	/**
	 * 用户列表
	 * @param xco
	 * @return
	 */
	public List<XCO> studentbyclassid(XCO xco){
		return SqlServiceActuator.execute("wms-userservices.studentbyclassid", xco);
	}
	
	/**
	 * 查找单个用户
	 * @param xco
	 * @return
	 */
	public XCO selectUserByUserId(XCO xco){
		return SqlServiceActuator.execute("wms-userservices.selectUserByUserId", xco);
	}
	
	/**
	 * 查找单个用户
	 * @param xco
	 * @return
	 */
	public XCO selectUserByUserId2(XCO xco){
		return SqlServiceActuator.execute("wms-userservices.selectUserByUserId2", xco);
	}
	
	/**
	 * 更新用户
	 * @param xco
	 * @return
	 */
	public int updateUser(XCO xco){
		XCO user = SqlServiceActuator.execute("wms-userservices.selectUserByUserId2", xco);
		//user.setStringValue("password", xco.getStringValue("password"));
		user.setStringValue("real_name", xco.getStringValue("real_name"));
		user.setIntegerValue("sex", xco.getIntegerValue("sex"));
		return SqlServiceActuator.execute("wms-userservices.updateUser", user);
	}
	
	/**
	 * 停用用户
	 * @param xco
	 * @return
	 */
	public int deleteUser(XCO xco){
		return SqlServiceActuator.execute("wms-userservices.deleteUser", xco);
	}
	
	/**
	 * 启用用户
	 * @param xco
	 * @return
	 */
	public int startUser(XCO xco){
		return SqlServiceActuator.execute("wms-userservices.startUser", xco);
	}
	
	
	/**
	 * 彻底删除用户
	 * @param xco
	 * @return
	 */
	public int deletedUser(XCO xco){
		String delStr = xco.getStringValue("delstr");
		if(null!=delStr && !"".equals(delStr)){
			if(delStr.indexOf(",") > -1){
				String[] arr = delStr.split(",");
				for(int i=0;i<arr.length;i++){
					XCO dxco = new XCO();
					dxco.setIntegerValue("user_id", Integer.valueOf(arr[i]));
					SqlServiceActuator.execute("wms-userservices.deletedUser", dxco);
				}
			}else{
				XCO dxco = new XCO();
				dxco.setIntegerValue("user_id", Integer.valueOf(delStr));
				SqlServiceActuator.execute("wms-userservices.deletedUser", dxco);
			}
			return 1;
		}else{
			return 0;
		}
	}
	
	/**
	 * 彻底删除用户
	 * @param xco
	 * @return
	 */
	public int deletedUser2(XCO xco){
		int count = SqlServiceActuator.execute("wms-userservices.deletedUser", xco);
		return count;
	}
	
	/**
	 * 用户下拉列表
	 * @return
	 */
	public List<XCO> userSelect(XCO xco){
		return SqlServiceActuator.execute("wms-userservices.userSelect", xco);
	}
	
	/**
	 * 重置密码
	 * @param xco
	 * @return
	 */
	public int resetPwd(XCO xco){
		xco.setStringValue("password", MD5Util.MD5("123456"));
		int count = SqlServiceActuator.execute("wms-userservices.resetPwd", xco);
		return count;
	}
}
