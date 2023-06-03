package cn.gatherlife.wms.business.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.UserService;
import cn.gatherlife.wms.business.util.XCOUtil;

@Controller
@RequestMapping("user")
public class UserController {

	private static Logger	logger	= Logger.getLogger(UserController.class);
	
	@Autowired
	
	UserService userService;
	
	/**
	 * 查询列表
	 * @param xco
	 * @return
	 */
	@RequestMapping("userlist")
	public @ResponseBody XCO programlist(@RequestBody XCO xco){
		//执行导入
		XCO rep = userService.userlist(xco);
		return rep;
	}
	
	/**
	 * 查询列表
	 * @param xco
	 * @return
	 */
	@RequestMapping("personlist")
	public @ResponseBody XCO personlist(@RequestBody XCO xco){
		//执行导入
		XCO rep = userService.personlist(xco);
		return rep;
	}
	
	/**查找该班级下所有的学生
	 * @param xco
	 * @return
	 */
	@RequestMapping("studentbyclassid")
	public @ResponseBody XCO listbygroupid(@RequestBody XCO xco){
		List<XCO> list = userService.studentbyclassid(xco);
		XCO select = new XCO();
		select.setXCOListValue("data", list);
		return select;
	}
	
	/**
	 * 插入
	 * @param xco
	 * @return
	 */
	@RequestMapping("insertUser")
	public @ResponseBody XCO userAdd(@RequestBody XCO xco){
		long count = 0;
		long flag = 0;
		flag = userService.studentbyUserName(xco);
		if(flag > 0){
			return XCOUtil.getResultXCO(2, "用户名重复");
		}else{
			count = userService.insertUser(xco);
			if(count == 0){
				return XCOUtil.getResultXCO(0, "保存失败");
			}else{
				return XCOUtil.getResultXCO(1, "保存成功");
			}
		}
	}
	
	/**
	 * 查询单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectUserByUserId")
	public @ResponseBody XCO selectUserByUserId(@RequestBody XCO xco){
		return userService.selectUserByUserId(xco);
	}
	
	/**
	 * 查询单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectUserByUserId2")
	public @ResponseBody XCO selectUserByUserId2(@RequestBody XCO xco){
		return userService.selectUserByUserId2(xco);
	}
	
	
	/**
	 * 更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateUser")
	public @ResponseBody XCO updateUser(@RequestBody XCO xco){
		long count = userService.updateUser(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "更新失败");
		}else{
			return XCOUtil.getResultXCO(1, "更新成功");
		}
	}
	
	/**停用更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("delUser")
	public @ResponseBody XCO delUser(@RequestBody XCO xco){
		long count = userService.deleteUser(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "停用失败");
		}else{
			return XCOUtil.getResultXCO(1, "停用成功");
		}
	}
	
	/**启用更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("startUser")
	public @ResponseBody XCO startUser(@RequestBody XCO xco){
		long count = userService.startUser(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "启用失败");
		}else{
			return XCOUtil.getResultXCO(1, "启用成功");
		}
	}
	
	/**彻底删除单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("deletedUser")
	public @ResponseBody XCO deletedUser(@RequestBody XCO xco){
		long count = userService.deletedUser(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "删除失败");
		}else{
			return XCOUtil.getResultXCO(1, "删除成功");
		}
	}
	
	/**彻底删除单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("deletedUser2")
	public @ResponseBody XCO deletedUser2(@RequestBody XCO xco){
		long count = userService.deletedUser2(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "删除失败");
		}else{
			return XCOUtil.getResultXCO(1, "删除成功");
		}
	}
	@RequestMapping("resetPwd")
	public @ResponseBody XCO resetPwd(@RequestBody XCO xco){
		int count = userService.resetPwd(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(1, "重置密码失败");
		}else{
			return XCOUtil.getResultXCO(0, "重置密码成功");
		}
	}
	
	@RequestMapping("userSelect")
	public @ResponseBody XCO userSelect(@RequestBody XCO xco){
		//执行导入
		List<XCO> list = userService.userSelect(xco);
		XCO select = new XCO();
		select.setXCOListValue("data", list);
		return select;
	}
	
}
