package cn.gatherlife.wms.business.controller;

import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.RoleService;
import cn.gatherlife.wms.business.util.XCOUtil;

@Controller
@RequestMapping("role")
public class RoleController {

	private static Logger	logger	= Logger.getLogger(UserController.class);
	
	@Autowired
	RoleService roleService;
	
	/**
	 * 查询列表
	 * @param xco
	 * @return
	 */
	@RequestMapping("rolelist")
	public @ResponseBody XCO rolelist(@RequestBody XCO xco){
		//执行导入
		XCO rep = roleService.rolelist(xco);
		return rep;
	}
	
	/**
	 * 查询列表
	 * @param xco
	 * @return
	 */
	@RequestMapping("modellist")
	public @ResponseBody XCO modellist(@RequestBody XCO xco){
		//执行导入
		XCO rep = roleService.modellist(xco);
		//System.out.println("--------------"+rep.toXMLString());
		return rep;
	}
	
	/**
	 * 查询列表
	 * @param xco
	 * @return
	 */
	@RequestMapping("saveRoleModel")
	public @ResponseBody XCO saveRoleModel(@RequestBody XCO xco){
		//执行导入
		int  flag = roleService.saveRoleModel(xco);
		if(flag == 1){
			return XCOUtil.getResultXCO(1, "保存成功");
		}else{
			return XCOUtil.getResultXCO(0, "保存失败");
		}
	}
	
	/**
	 * 查询单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectRoleById")
	public @ResponseBody XCO selectRoleById(@RequestBody XCO xco){
		return roleService.selectRoleById(xco);
	}
	

	@RequestMapping("getUserModuleByRole")
	public Map<String, LinkedHashMap<String, String>> getUserModuleByRole(int role_id) {
			try {
				XCO request = new XCO();
				request.setIntegerValue("role_id", role_id);
				//XCO result = RpcClient.call(Domain.BUSINESS_HOST + "wms-systemservice/queryModuleByRole", request);
				XCO result = roleService.queryModuleByRole(request);
				Map<String, LinkedHashMap<String, String>> leftNav = new LinkedHashMap<String, LinkedHashMap<String, String>>();
				Map<Long, String> moduleNameMap = new HashMap<Long, String>();
				if (null != result && 0 == result.getCode()) {
					// System.out.println(result);
					List<XCO> list = result.getXCOListValue("data");
					for (XCO item : list) {
						// System.out.println(item);
						LinkedHashMap<String, String> itemMap = null;
						int level = item.getIntegerValue("level");
						if (1 == level) {
							moduleNameMap.put(item.getLongValue("module_id"), item.getStringValue("module_name"));
							itemMap = new LinkedHashMap<String, String>();
							leftNav.put(item.getStringValue("module_name"), itemMap);
						} else {
							itemMap = leftNav.get(moduleNameMap.get(item.getLongValue("f_id")));
							if(null!=itemMap){
								itemMap.put(item.getStringValue("module_name"), item.getStringValue("url"));
							}
						}
					}
					return leftNav;
				}
			} catch (Exception e) {
				logger.error(e.getMessage(), e);
			}
			return null;
		}
}
