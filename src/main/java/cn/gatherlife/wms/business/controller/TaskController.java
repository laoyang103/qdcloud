package cn.gatherlife.wms.business.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.TaskService;
import cn.gatherlife.wms.business.util.XCOUtil;

@Controller
@RequestMapping("task")
public class TaskController {
	
	@Autowired
	TaskService TaskService;
	
	@RequestMapping("tasklist")
	public @ResponseBody XCO tasklist(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setStringValue("user_name", userInfo.getStringValue("user_name"));
		xco.setLongValue("user_id", userInfo.getLongValue("user_id"));
		XCO rep = TaskService.tasklist(xco);
		return rep;
	}
	
	/**
	 * 学生预约后，看到到课程 进行上课列表
	 * @param xco
	 * @return
	 */
	@RequestMapping("studentyuyuelist")
	public @ResponseBody XCO studentyuyuelist(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setLongValue("student_id", userInfo.getLongValue("user_id"));
		XCO rep = TaskService.studentyuyuelist(xco);
		return rep;
	}
	
	
	/**
	 * 学生看到的任务
	 * @param xco
	 * @return
	 */
	@RequestMapping("studenttasklist")
	public @ResponseBody XCO studenttasklist(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setLongValue("student_id", userInfo.getLongValue("user_id"));
		XCO rep = TaskService.studenttasklist(xco);
		return rep;
	}

	@RequestMapping("studentCourselist")
	public @ResponseBody XCO studentCourselist(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setLongValue("user_id", userInfo.getLongValue("user_id"));
		XCO rep = TaskService.studentCourselist(xco);
		return rep;
	}
	
    /**
	 * 插入
	 * @param xco
	 * @return
	 */
	@RequestMapping("insertTask")
	public @ResponseBody XCO insertTask(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setStringValue("user_name", userInfo.getStringValue("user_name"));
		long count = TaskService.insertTask(xco);
		if(count == 5){
			return XCOUtil.getResultXCO(5, "预约时间已失效");
		}if(count == 0){
			return XCOUtil.getResultXCO(0, "保存失败");
		}else{
			return XCOUtil.getResultXCO(1, "保存成功");
		}
	}
	
	/**
	 * 更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateTask")
	public @ResponseBody XCO updateTask(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setStringValue("operator", userInfo.getStringValue("user_name"));
		long count = TaskService.updateTask(xco);
		if(count == 5){
			return XCOUtil.getResultXCO(5, "实验室预约时间已失效");
		}else if(count == 3){
			return XCOUtil.getResultXCO(3, "该课程已经有学生预约，禁止编辑");
		}else{
			return XCOUtil.getResultXCO(1, "更新成功");
		}
	}
	
	/**
	 * 学生点击 上课签到  更新考勤状态
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateCheckWorkState")
	public @ResponseBody XCO updateCheckWorkState(@RequestBody XCO xco){
		int count = TaskService.updateCheckWorkState(xco);
		//if(count == 4){
		//	return XCOUtil.getResultXCO(4, "请稍等,还未到上课签到时间");
		//}else 
		if(count == 3){
			return XCOUtil.getResultXCO(3, "本次课已结束，无法签到");
		}else if(count == 1){
			return XCOUtil.getResultXCO(1, "签到成功");
		}else{
			return XCOUtil.getResultXCO(0, "签到失败");
		}
	}
	
	/**
	 * 查询单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectTaskById")
	public @ResponseBody XCO selectTaskById(@RequestBody XCO xco){
		return TaskService.selectTaskById(xco);
	}
	
	/**
	 * 查找单个预约教室
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectOrderRoomById")
	public @ResponseBody XCO selectOrderRoomById(@RequestBody XCO xco){
		return TaskService.selectOrderRoomById(xco);
	}
	
	/**
	 * 查询学生上课信息
	 * @param xco
	 * @return
	 */
	@RequestMapping("studentTaskById")
	public @ResponseBody XCO studentTaskById(@RequestBody XCO xco){
		return TaskService.studentTaskById(xco);
	}
	
	/**
	 * 查询学生zuoye信息
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectCourseById2")
	public @ResponseBody XCO selectCourseById2(@RequestBody XCO xco){
		return TaskService.selectCourseById2(xco);
	}
	
	/**
	 * 查询学生上课信息 带课程 班级的
	 * @param xco
	 * @return
	 */
	@RequestMapping("studentShangkeById2")
	public @ResponseBody XCO studentShangkeById2(@RequestBody XCO xco){
		return TaskService.studentShangkeById2(xco);
	}
	
	/**
	 * 查询实验 by 任务id
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectExpByCourseId")
	public @ResponseBody XCO selectExpByCourseId(@RequestBody XCO xco){
		return TaskService.selectExpByCourseId(xco);
	}
	
	/**
	 * 学生开始答题
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateBeginTime")
	public @ResponseBody XCO updateBeginTime(@RequestBody XCO xco){
		long count = TaskService.updateBeginTime(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "开始失败");
		}else{
			return XCOUtil.getResultXCO(1, "开始成功");
		}
	}
	
	/**
	 * 学生提交作业
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateStudentCourse")
	public @ResponseBody XCO updateStudentCourse(@RequestBody XCO xco){
		long count = TaskService.updateStudentCourse(xco);
		//TaskService.updateStudentCourse30(xco);
		//判断学生全部完成作业
		//TaskService.updateComplateCourse(xco);
		if(count == 5){
			return XCOUtil.getResultXCO(5, "老师已批改");
		}else if(count == 0){
			return XCOUtil.getResultXCO(0, "提交失败");
		}else{
			return XCOUtil.getResultXCO(1, "提交成功");
		}
	}
	
	/**
	 * 学生提交报告
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateStudentReport")
	public @ResponseBody XCO updateStudentReport(@RequestBody XCO xco){
		long count = TaskService.updateStudentReport(xco);
		//TaskService.updateStudentCourse30(xco);
		//判断学生全部完成作业
		//TaskService.updateComplateCourse(xco);
		if(count == 5){
			return XCOUtil.getResultXCO(5, "老师已批改");
		}else if(count == 0){
			return XCOUtil.getResultXCO(0, "提交失败");
		}else{
			return XCOUtil.getResultXCO(1, "提交成功");
		}
	}
	
	/**
	 * 教师批改作业
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateTeacherCourse")
	public @ResponseBody XCO updateTeacherCourse(@RequestBody XCO xco){
		long count = TaskService.updateTeacherCourse(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "批改失败");
		}else{
			return XCOUtil.getResultXCO(1, "批改成功");
		}
	}
	
	/**
	 * 教师批改报告
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateTeacherReport")
	public @ResponseBody XCO updateTeacherReport(@RequestBody XCO xco){
		long count = TaskService.updateTeacherReport(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "批改失败");
		}else{
			return XCOUtil.getResultXCO(1, "批改成功");
		}
	}
	
	/**删除更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("deleteTask")
	public @ResponseBody XCO deleteRoom(@RequestBody XCO xco){
		long count = TaskService.deleteTask(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "删除失败");
		}else{
			return XCOUtil.getResultXCO(1, "删除成功");
		}
	}
	
	/**
	 * 查询单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectOneByTimeId")
	public @ResponseBody XCO selectOneByTimeId(@RequestBody XCO xco){
		return TaskService.selectOneByTimeId(xco);
	}
	
	/**
	 * 查询单个预约好的对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectOrderOneByTimeId")
	public @ResponseBody XCO selectOrderOneByTimeId(@RequestBody XCO xco){
		return TaskService.selectOrderOneByTimeId(xco);
	}
	
	
	/**
	 * 教师预约实验室课时
	 * @param xco
	 * @return
	 */
	@RequestMapping("orderRoomTimeById")
	public @ResponseBody XCO orderRoomTimeById(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setLongValue("operator_id", userInfo.getLongValue("user_id"));
		xco.setStringValue("operator", userInfo.getStringValue("real_name"));
		long count = TaskService.orderRoomTimeById(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "预约失败");
		}else if(count == 5){
			return XCOUtil.getResultXCO(5, "该时间段已经被预约,请选择其他时间段");
		}else{
			return XCOUtil.getResultXCO(1, "预约成功");
		}
	}
	
	/**
	 * 
	 * @param xco
	 * @param request
	 * @return
	 */
	@RequestMapping("courseyuyuelist")
	public @ResponseBody XCO courseyuyuelist(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		XCO rep = TaskService.courseyuyuelist(xco);
		if(null!=rep && null!=rep.getXCOListValue("data")){
			for(XCO o:rep.getXCOListValue("data")){
				o.setLongValue("class_id",  userInfo.getLongValue("class_id"));
			}
		}
		return rep;
	}
	
	/**
	 * 
	 * @param xco
	 * @param request
	 * @return
	 */
	@RequestMapping("insertOrderCourse")
	public @ResponseBody XCO insertOrderCourse(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		xco.setStringValue("operator", userInfo.getStringValue("user_name"));
		xco.setLongValue("operator_id", userInfo.getLongValue("user_id"));
		xco.setLongValue("class_id", userInfo.getLongValue("class_id"));
		XCO m = TaskService.oneStatation(xco);
		if(m!=null && m.getIntegerValue("state") == 0){
			return XCOUtil.getResultXCO(0, "该位置上的学生已经签到");
		}else{
			long flag = TaskService.qiandao(xco);
			if(flag == 0){
				long count = TaskService.insertOrderCourse(xco);
				if(count == 0){
					return XCOUtil.getResultXCO(0, "预约失败");
				}else{
					return XCOUtil.getResultXCO(1, "预约成功");
				}
			}else{
				return XCOUtil.getResultXCO(0, "该学生已经签到,不能再次预约");
			}
		}
		
	}
	
	/**
	 * 查询已经预约的人
	 * @param xco
	 * @param request
	 * @return
	 */
	@RequestMapping("selectCourseOrderSet")
	public @ResponseBody XCO selectCourseOrderSet(@RequestBody XCO xco){
		XCO req = new XCO();
		List<XCO> list = TaskService.selectCourseOrderSet(xco);
		req.setXCOListValue("data", list);
		return req;
	}
	
	/**
	 * 考勤列表
	 * @param xco
	 * @param request
	 * @return
	 */
	@RequestMapping("kaoqinlist")
	public @ResponseBody XCO kaoqinlist(@RequestBody XCO xco,HttpServletRequest request){
		XCO userInfo = (XCO)request.getSession().getAttribute("userInfo");
		int type = userInfo.getIntegerValue("type");
		XCO rep = new XCO();
		if(type == 2){
			xco.setLongValue("teacher_id", userInfo.getLongValue("user_id"));
		}
		rep = TaskService.kaoqinlist(xco);
		return rep;
	}
	
}
