package cn.gatherlife.wms.business.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

@Service
public class RoleService {
	
	/**
	 * 插入角色
	 * @param xco
	 * @return
	 */
	public long insertRole(XCO xco){
		long row = SqlServiceActuator.execute("wms-roleservices.insertRole", xco);
		return row;
	}
	
	/**
	 * 角色列表
	 * @param xco
	 * @return
	 */
	public XCO rolelist(XCO xco){
		return SqlServiceActuator.execute("wms-roleservices.rolelist", xco);
	}
	
	
	/**
	 * 菜单列表
	 * @param xco
	 * @return
	 */
	public XCO modellist(XCO xco){
		XCO req = new XCO();
		xco.setIntegerValue("level", 1);
		List<XCO> flist = SqlServiceActuator.executeAlone("wms-roleservices.selectModel", xco);
		xco.setIntegerValue("level", 2);
		List<XCO> slist = SqlServiceActuator.executeAlone("wms-roleservices.selectModel", xco);
		XCO param = new XCO();
		param.setIntegerValue("level", 1);
		List<XCO> tlist = SqlServiceActuator.executeAlone("wms-roleservices.selectModel", param);
		param.setIntegerValue("level", 2);
		List<XCO> alist = SqlServiceActuator.executeAlone("wms-roleservices.selectModel", param);
		req.setXCOListValue("flist", flist);
		req.setXCOListValue("slist", slist);
		req.setXCOListValue("tlist", tlist);
		req.setXCOListValue("alist", alist);
		return req;
	}
	
	
	/**
	 * 保存用户选择的权限角色
	 * @param xco
	 * @return
	 */
	public int saveRoleModel(XCO xco){
		//更新角色状态
		SqlServiceActuator.execute("wms-roleservices.updateRoleState", xco);
		//先删除该角色下的所有菜单  在新增
		SqlServiceActuator.execute("wms-roleservices.deleteRoleModel", xco);
		
		String delStr = xco.getStringValue("delstr");
		if(null!=delStr && !"".equals(delStr)){
			if(delStr.indexOf(",") > -1){
				String[] arr = delStr.split(",");
				for(int i=0;i<arr.length;i++){
					XCO dxco = new XCO();
					dxco.setIntegerValue("module_id", Integer.valueOf(arr[i]));
					dxco.setIntegerValue("role_id", xco.getIntegerValue("role_id"));
					SqlServiceActuator.execute("wms-roleservices.saveModel", dxco);
				}
			}else{
				XCO dxco = new XCO();
				dxco.setIntegerValue("module_id", Integer.valueOf(delStr));
				dxco.setIntegerValue("role_id", xco.getIntegerValue("role_id"));
				SqlServiceActuator.execute("wms-roleservices.saveModel", dxco);
			}
			return 1;
		}else{
			return 0;
		}
	}
	
	/**
	 * 查找单个角色
	 * @param xco
	 * @return
	 */
	public XCO selectRoleById(XCO xco){
		return SqlServiceActuator.execute("wms-roleservices.selectRoleById", xco);
	}
	
	/**
	 * 更新角色
	 * @param xco
	 * @return
	 */
	public int updateRole(XCO xco){
		return SqlServiceActuator.execute("wms-roleservices.updateRole", xco);
	}
	
	/**
	 * 删除角色
	 * @param xco
	 * @return
	 */
	public int deleteRole(XCO xco){
		return SqlServiceActuator.execute("wms-roleservices.deleteRole", xco);
	}
	
	/**
	 * 查询菜单
	 * @param xco
	 * @return
	 */
	public XCO queryModuleByRole(XCO xco){
		return SqlServiceActuator.execute("wms-roleservices.queryModuleByRole", xco);
	}
}
