package cn.gatherlife.wms.business.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

import cn.gatherlife.wms.business.util.Constant;
import cn.gatherlife.wms.business.util.TimeUtil;
import cn.gatherlife.wms.business.util.XCOUtil;

@Service
public class TaskService {
	
	@Autowired
	ExperimentService experimentService;
	
	@Autowired
	ExampleService exampleService;
	
	@Autowired
	ClassService classService;
	
	@Autowired
	RoomService roomService;
	
	@Autowired
	UserService userService;
	
	/**
	 * 插入班级
	 * @param xco
	 * @return
	 */
	public long insertTask(XCO xco){
		long now_time = new Date().getTime()+Constant.TIME_提前几天绑定课程*24*60*60*1000;
		XCO experiment = experimentService.selectExpById(xco);//实验
		XCO example = exampleService.selectExaById(xco);//习题
		XCO dxco = new XCO();
		dxco.setLongValue("order_id", xco.getLongValue("order_id"));
		XCO orderRoom = roomService.selectOrderRoomTimeById(xco);
		XCO dxco2 = new XCO();
		dxco2.setLongValue("room_id", orderRoom.getLongValue("room_id"));
		XCO room = roomService.selectRoomById(dxco2);
		int place_count = 0;
		if(null!=room){
			place_count = room.getIntegerValue("place_count");
		}
		orderRoom.setIntegerValue("place_count", place_count);
		orderRoom.setIntegerValue("place_ok_count", 0);
		
		long sys_time = 0l;
		try {
			sys_time = Long.valueOf(TimeUtil.dateToStamp(orderRoom.getStringValue("begin_time")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		//预约时间已失效
		if(now_time > sys_time){
			return 5;
		}
		
		if(null!=experiment){
			orderRoom.setStringValue("experiment_name", experiment.getStringValue("experiment_name"));
			orderRoom.setLongValue("experiment_id", experiment.getLongValue("experiment_id"));
		}
		
		if(null!=example){
			orderRoom.setLongValue("example_id", example.getLongValue("example_id"));
			orderRoom.setStringValue("example_name", example.getStringValue("example_name"));
			orderRoom.setStringValue("example_content", example.getStringValue("example_content"));
		}
		
		orderRoom.setStringValue("class_name", "班级1");
		orderRoom.setIntegerValue("class_id", 0);
		orderRoom.setStringValue("course_name", xco.getStringValue("course_name"));
		
		long row = SqlServiceActuator.execute("wms-courseservices.insertCourse", orderRoom);
		return row;
	}
	
	/**
	 * 任务课程列表
	 * @param xco
	 * @return
	 */
	public XCO tasklist(XCO xco){
		XCO rep = SqlServiceActuator.execute("wms-courseservices.courselist", xco);
		long now_time = new Date().getTime()+Constant.TIME_提前几天绑定课程*24*60*60*1000;
		long now_time2 = new Date().getTime();
		if(rep.getLongValue("total") > 0){
			List<XCO> list = rep.getXCOListValue("data");
			if(null!=list && list.size() > 0){
				for(int i=0,j=list.size();i<j;i++){
					long sys_time = 0l;
					try {
						sys_time = Long.valueOf(TimeUtil.dateToStamp(list.get(i).getStringValue("begin_time")));
					} catch (ParseException e) {
						e.printStackTrace();
					}
					long sys_time2 = 0l;
					try {
						sys_time2 = Long.valueOf(TimeUtil.dateToStamp(list.get(i).getStringValue("end_time")));
					} catch (ParseException e) {
						e.printStackTrace();
					}
					//判断当前时间是否可以绑课
					if(now_time > sys_time){
						list.get(i).setIntegerValue("flag", 0);
					}else{
						list.get(i).setIntegerValue("flag", 1);
					}
					
					//判断当前课程是否已上课过
					if(now_time2 > sys_time2){
						list.get(i).setIntegerValue("flag2", 0);
					}else{
						list.get(i).setIntegerValue("flag2", 1);
					}
				}
			}
		}
		return rep;
	}
	
	/**
	 * 学生任务课程列表
	 * @param xco
	 * @return
	 */
	public XCO studenttasklist(XCO xco){
		return SqlServiceActuator.execute("wms-courseservices.studenttasklist", xco);
	}
	
	/**
	 *学生预约后，看到到课程 进行上课列表
	 *	 * @param xco
	 * @return
	 */
	public XCO studentyuyuelist(XCO xco){
		long now_time = new Date().getTime();//+Constant.TIME_提前几天学生选课*24*60*60*1000;
		xco.setStringValue("endd_time", TimeUtil.stampToDate(now_time+""));
		return SqlServiceActuator.execute("wms-courseservices.studentyuyuelist", xco);
	}
	
	/**
	 * 教师批改列表
	 * @param xco
	 * @return
	 */
	public XCO studentCourselist(XCO xco){
		return SqlServiceActuator.execute("wms-courseservices.studentCourselist", xco);
	}
	
	/**
	 * 教师批改作业
	 * @param xco
	 * @return
	 */
	public int updateTeacherCourse(XCO xco){
		return SqlServiceActuator.execute("wms-courseservices.updateTeacherCourse", xco);
	}
	
	
	/**
	 * 教师批改报告
	 * @param xco
	 * @return
	 */
	public int updateTeacherReport(XCO xco){
		return SqlServiceActuator.execute("wms-courseservices.updateTeacherReport", xco);
	}
	
	/**
	 * 学生开始答题
	 * @param xco
	 * @return
	 */
	public int updateBeginTime(XCO xco){
		//更新课程为开始
		SqlServiceActuator.execute("wms-courseservices.updateCourseStart", xco);
		return SqlServiceActuator.execute("wms-courseservices.updateBeginTime", xco);
	}
	
	/**
	 * 学生提交作业
	 * @param xco
	 * @return
	 */
	public int updateStudentCourse(XCO xco){
		
		XCO req = SqlServiceActuator.execute("wms-courseservices.studentTaskById", xco);
		if(req.getIntegerValue("example_score") != 0){
			return 5;
		}else{
			String example_content = XCOUtil.encodeTextForXML(xco.getStringValue("example_content"));
			xco.setStringValue("example_content", example_content);
			return SqlServiceActuator.execute("wms-courseservices.updateStudentCourse", xco);
		}
		
		//SqlServiceActuator.execute("wms-courseservices.updateStudentCourse30", xco);
		
	}
	
	/**
	 * 学生提交报告
	 * @param xco
	 * @return
	 */
	public int updateStudentReport(XCO xco){
		XCO req = SqlServiceActuator.execute("wms-courseservices.studentTaskById", xco);
		if(req.getIntegerValue("experiment_checked") != 0){
			return 5;
		}else{
			return SqlServiceActuator.execute("wms-courseservices.updateStudentReport", xco);
		}
	}
	
	/**
	 * 修改作业未完成
	 * @param xco
	 * @return
	 */
	public int updateStudentCourse30(XCO xco){
		XCO exp = SqlServiceActuator.execute("wms-courseservices.exampleById", xco);
		XCO rep = SqlServiceActuator.execute("wms-courseservices.reportById", xco);
		if(exp.getIntegerValue("state") == 30 && !"".equals(rep.getStringValue("experiment_report"))){
			return SqlServiceActuator.execute("wms-courseservices.updateStudentCourse30", xco);
		}
		return 0;
	}
	
	/**
	 * 判断学生作业是否全部完成
	 * @param xco
	 * @return
	 */
	public void updateComplateCourse(XCO xco){
		SqlServiceActuator.execute("wms-courseservices.updateComplateCourse", xco);
	}
	
	/**
	 * 查找某个课程下面学生已做题的数目
	 * @param xco
	 * @return
	 */
	public long askCourseNum(XCO xco){
		long count = SqlServiceActuator.execute("wms-courseservices.askCourseNum", xco);
		return count;
	}
	
	/**
	 * 查找单个对象
	 * @param xco
	 * @return
	 */
	public XCO selectTaskById(XCO xco){
		XCO req = SqlServiceActuator.execute("wms-courseservices.selectCourseById", xco);
		long room_id = req.getLongValue("room_id");
		long time_id = req.getLongValue("time_id");
		XCO data = new XCO();
		data.setLongValue("room_id", room_id);
		data.setLongValue("time_id", time_id);
		List<XCO> roomlist = SqlServiceActuator.execute("wms-roomservices.kwTimeIdRoomId", data);
		req.setXCOListValue("roomlist", roomlist);
		XCO room = SqlServiceActuator.execute("wms-roomservices.selectRoomById", data);
		req.setXCOValue("room", room);
		System.out.println("-------------------"+req.toXMLString());
		return req;
	}
	
	/**
	 * 查找单个对象
	 * @param xco
	 * @return
	 */
	public XCO studentTaskById(XCO xco){
		return SqlServiceActuator.execute("wms-courseservices.studentTaskById", xco);
	}
	
	/**
	 * 查找单个对象
	 * @param xco
	 * @return
	 */
	public XCO selectCourseById2(XCO xco){
		return SqlServiceActuator.execute("wms-courseservices.selectCourseById2", xco);
	}
	
	/**
	 * 查找单个对象 带课程 班级的
	 * @param xco
	 * @return
	 */
	public XCO studentShangkeById2(XCO xco){
		return SqlServiceActuator.execute("wms-courseservices.studentShangkeById2", xco);
	}
	
	/**
	 * 查询实验 by 任务id
	 * @param xco
	 * @return
	 */
	public XCO selectExpByCourseId(XCO xco){
		return SqlServiceActuator.execute("wms-courseservices.selectExpByCourseId", xco);
	}
	
	public static String getTime(String user_time) {  
		String re_time = null;  
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		Date d;  
		try {  
			d = sdf.parse(user_time);  
			long l = d.getTime();  
			String str = String.valueOf(l);  
			re_time = str.substring(0, 10);  
		} catch (ParseException e) {  
			e.printStackTrace();  
		}  
		return re_time;  
	}  
	
	public static void main(String[] args){
		System.out.println("==============="+getTime("2016-11-11 12:12:12"));
	}
	
	/**
	 * 更新课程
	 * @param xco
	 * @return
	 */
	public int updateTask(XCO xco){
		long now_time = new Date().getTime()+Constant.TIME_提前几天绑定课程*24*60*60*1000;
		//先查询下 该课程是否开始 如果已经开始 就不能更新
		XCO course = SqlServiceActuator.execute("wms-courseservices.selectCourseById", xco);
		long sys_time = 0;
		try {
			sys_time = Long.valueOf(TimeUtil.dateToStamp(course.getStringValue("begin_time")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if(course.getIntegerValue("place_ok_count") > 0){
			return 3;
		}else if(now_time > sys_time){
			return 5;
		}else{
			XCO experiment = experimentService.selectExpById(xco);
			XCO example = exampleService.selectExaById(xco);
			
			if(null!=experiment){
				xco.setStringValue("experiment_name", experiment.getStringValue("experiment_name"));
			}
			
			if(null!=example){
				xco.setStringValue("example_name", example.getStringValue("example_name"));
				xco.setStringValue("example_content", example.getStringValue("example_content"));
			}
			//先更新主表
			SqlServiceActuator.execute("wms-courseservices.updateCourse", xco);
			//删除课程选的学生
			/*
			SqlServiceActuator.execute("wms-courseservices.deleteStudentCourse", xco);
			
			//处理选择的学生
			String delStr = xco.getStringValue("delstr");
			if(null!=delStr && !"".equals(delStr)){
				if(delStr.indexOf(",") > -1){
					String[] arr = delStr.split(",");
					for(int i=0;i<arr.length;i++){
						XCO pxco = new XCO();
						pxco.setStringValue("user_id", arr[i]);
						XCO user = userService.selectUserByUserId(pxco);
						
						XCO dxco = new XCO();
						dxco.setLongValue("course_id", xco.getLongValue("course_id"));
						dxco.setStringValue("course_name", xco.getStringValue("course_name"));
						dxco.setLongValue("student_id", Long.valueOf(arr[i]));
						dxco.setStringValue("student_name", user.getStringValue("real_name"));
						SqlServiceActuator.execute("wms-courseservices.insertStudentCourse", dxco);
					}
				}else{
					XCO pxco = new XCO();
					pxco.setStringValue("user_id", delStr);
					XCO user = userService.selectUserByUserId(pxco);
					
					XCO dxco = new XCO();
					dxco.setLongValue("course_id", xco.getLongValue("course_id"));
					dxco.setStringValue("course_name", xco.getStringValue("course_name"));
					dxco.setLongValue("student_id", Long.valueOf(delStr));
					dxco.setStringValue("student_name", user.getStringValue("real_name"));
					SqlServiceActuator.execute("wms-courseservices.insertStudentCourse", dxco);
				}
			}*/
			return 1;
		}
	}
	
	/**
	 * 删除课程
	 * @param xco
	 * @return
	 */
	public int deleteTask(XCO xco){
		XCO course = SqlServiceActuator.execute("wms-courseservices.selectCourseById", xco);
		long nowtime = new Date().getTime();
		long ctime = 0;
		try {
			ctime = Long.valueOf(TimeUtil.dateToStamp(course.getStringValue("begin_time")));
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		}
		if(nowtime > ctime){
			return 0;
		}else{
			String delStr = xco.getStringValue("delstr");
			if(null!=delStr && !"".equals(delStr)){
				if(delStr.indexOf(",") > -1){
					String[] arr = delStr.split(",");
					for(int i=0;i<arr.length;i++){
						XCO dxco = new XCO();
						dxco.setIntegerValue("course_id", Integer.valueOf(arr[i]));
						SqlServiceActuator.execute("wms-courseservices.deleteCourse", dxco);
						SqlServiceActuator.execute("wms-courseservices.deleteStudentCourse", dxco);
					}
				}else{
					XCO dxco = new XCO();
					dxco.setIntegerValue("course_id", Integer.valueOf(delStr));
					SqlServiceActuator.execute("wms-courseservices.deleteCourse", dxco);
					SqlServiceActuator.execute("wms-courseservices.deleteStudentCourse", dxco);
				}
				return 1;
			}else{
				return 0;
			}
		}
	}
	
	/**
	 * 教师预约实验室课时
	 * @param xco
	 * @return
	 */
	public long orderRoomTimeById(XCO xco){
		XCO orderTime = SqlServiceActuator.execute("wms-roomservices.selectRoomTimeByTimeId", xco);
		if(null != orderTime && orderTime.getIntegerValue("check_state") == 2){
			return 5;//该时间段已被预约
		}else{
			orderTime.setLongValue("teacher_id", xco.getLongValue("operator_id"));
			orderTime.setStringValue("teacher_name", xco.getStringValue("operator"));
			return SqlServiceActuator.execute("wms-courseservices.insertOrderRoomTime", orderTime);
		}
		
	}
	
	/**
	 * 查询单个预约时间详情
	 * @param xco
	 * @return
	 */
	public XCO selectOneByTimeId(XCO xco){
		return SqlServiceActuator.execute("wms-roomservices.selectRoomTimeByTimeId", xco);
	}
	
	/**
	 * 查询单个预约预约号的时间详情
	 * @param xco
	 * @return
	 */
	public XCO selectOrderOneByTimeId(XCO xco){
		return SqlServiceActuator.execute("wms-roomservices.selectOrderOneByTimeId", xco);
	}
	
	/**
	 * 学生预约课程列表
	 * @param xco
	 * @return
	 */
	public XCO courseyuyuelist(XCO xco){
		long now_time = new Date().getTime()+Constant.TIME_提前几天学生选课*24*60*60*1000;
		xco.setStringValue("endd_time", TimeUtil.stampToDate(now_time+""));
		XCO rep = SqlServiceActuator.execute("wms-courseservices.courseyuyuelist", xco);
		return rep;
	}
	
	
	/**
	 * 获取单个学生的教师所座位置
	 * @param xco
	 * @return
	 */
	public XCO oneStatation(XCO xco){
		XCO rep = SqlServiceActuator.execute("wms-courseservices.selectOneStation", xco);
		return rep;
	}
	
	/**
	 * 判断学生是否已经签到
	 * @param xco
	 * @return
	 */
	public long qiandao(XCO xco){
		return SqlServiceActuator.execute("wms-courseservices.sfqiandao", xco);
	}
	
	/**
	 * 插入学生预约课程列表
	 * @param xco
	 * @return
	 */
	public long insertOrderCourse(XCO xco){
		long course_id = xco.getLongValue("course_id");
		long time_id = xco.getLongValue("time_id");
		long station_id = xco.getLongValue("station_id");
		String idStr = xco.getStringValue("student_ids");
		Long operator_id = xco.getLongValue("operator_id");
		//XCO req = SqlServiceActuator.execute("wms-courseservices.selectOrderCourseCount", xco);
		XCO course = SqlServiceActuator.execute("wms-courseservices.selectCourseById", xco);
		XCO dxco = new XCO();
		dxco.setLongValue("course_id", course_id);
		dxco.setLongValue("operator_id", operator_id);
		dxco.setLongValue("class_id", xco.getLongValue("class_id"));
		dxco.setLongValue("time_id", xco.getLongValue("time_id"));
		dxco.setLongValue("user_id", Long.valueOf(idStr));
		//判断该学生是否已经预约过或者别人帮预约过
		long flag = SqlServiceActuator.execute("wms-courseservices.sforder", dxco);
		
		SqlServiceActuator.execute("wms-courseservices.deleteOrderCourseByOptId", dxco);
		
		//int placeCount = course.getIntegerValue("place_count");
		long place_ok_count = course.getLongValue("place_ok_count");
		//int count = 0;
		//long count1 = req.getLongValue("ncount");
		//if(idStr.indexOf(",") > -1){
		//	String[] arr = idStr.split(",");
		//	for(int i=0;i<arr.length;i++){
		//		XCO o = new XCO();
		//		o.setIntegerValue("user_id", Integer.valueOf(arr[i]));
		//		XCO user = userService.selectUserByUserId(o);
		//		
		//		XCO gs = new XCO();
		//		gs.setLongValue("course_id", course_id);
		//		gs.setLongValue("class_id", user.getLongValue("class_id"));
		//		gs.setIntegerValue("student_id", Integer.valueOf(arr[i]));
		//		gs.setStringValue("student_name", user.getStringValue("real_name"));
		//		gs.setStringValue("remark", user.getStringValue("remark"));
		//		gs.setLongValue("operator_id", operator_id);
		//		gs.setLongValue("time_id", time_id);
		//		gs.setStringValue("operator", user.getStringValue("operator"));
		//		SqlServiceActuator.execute("wms-courseservices.insertOrderCourse", gs);
		//		count++;
		//	}
		//}else{
			XCO o = new XCO();
			o.setIntegerValue("user_id", Integer.valueOf(idStr));
			XCO user = userService.selectUserByUserId(o);
			
			XCO gs = new XCO();
			gs.setLongValue("course_id", course_id);
			gs.setLongValue("class_id", user.getLongValue("class_id"));
			gs.setIntegerValue("student_id", Integer.valueOf(idStr));
			gs.setStringValue("student_name", user.getStringValue("real_name"));
			gs.setStringValue("remark", user.getStringValue("remark"));
			gs.setLongValue("operator_id", operator_id);
			gs.setLongValue("time_id", time_id);
			gs.setStringValue("operator", xco.getStringValue("operator"));
			SqlServiceActuator.execute("wms-courseservices.insertOrderCourse", gs);
			//count++;
			
			//学生和课位绑定关系
			XCO kw = new XCO();
			kw.setLongValue("station_id", station_id);
			kw.setLongValue("time_id", time_id);
			kw.setIntegerValue("student_id", Integer.valueOf(idStr));
			kw.setStringValue("student_name", user.getStringValue("real_name"));
			kw.setLongValue("operator_id", operator_id);
			kw.setStringValue("operator", xco.getStringValue("operator"));
			SqlServiceActuator.execute("wms-courseservices.updateLCSS", kw);
		//}
		XCO uxco = new XCO();
		if(flag>0){
			
		}else{
			place_ok_count = place_ok_count+1;
		}
		//place_ok_count = place_ok_count-count1+count;
		uxco.setLongValue("course_id", course_id);
		uxco.setLongValue("place_ok_count", place_ok_count);
		int ncount = SqlServiceActuator.execute("wms-courseservices.updateOrderCount", uxco);
		return ncount;
	}
	
	
	/**
	 * 学生预约课程列表
	 * @param xco
	 * @return
	 */
	public List<XCO> selectCourseOrderSet(XCO xco){
		return SqlServiceActuator.execute("wms-courseservices.selectCourseOrderSet", xco);
	}
	
	/**
	 * 学生点击 上课签到  更新考勤状态
	 * @param xco
	 * @return
	 */
	public int updateCheckWorkState(XCO xco){
		XCO course = SqlServiceActuator.execute("wms-courseservices.selectCourseById", xco);
		long nowtime = new Date().getTime();
		long btime = 0;
		long etime = 0;
		try {
			etime = Long.valueOf(TimeUtil.dateToStamp(course.getStringValue("end_time")));
			btime = Long.valueOf(TimeUtil.dateToStamp(course.getStringValue("begin_time")));
		} catch (Exception e) {
			e.printStackTrace();
		}
		//btime -= 30*60*1000;
		//if(nowtime < btime){
		//	return 4;
		//}
		if(nowtime > etime){
			return 3;
		}else{
			//插入学生的课程表一条数据
			XCO order = SqlServiceActuator.execute("wms-courseservices.selectOrderRoomById", xco);
			XCO cs = new XCO();
			cs.setLongValue("course_id", order.getLongValue("course_id"));
			cs.setLongValue("student_id", order.getLongValue("student_id"));
			cs.setStringValue("course_name", course.getStringValue("course_name"));
			cs.setStringValue("student_name", order.getStringValue("student_name"));
			cs.setStringValue("begin_time", course.getStringValue("begin_time"));
			cs.setStringValue("end_time", course.getStringValue("end_time"));
			cs.setLongValue("time_id", course.getLongValue("time_id"));
			SqlServiceActuator.execute("wms-courseservices.insertStudentCourse", cs);
			int count = SqlServiceActuator.execute("wms-courseservices.updateCheckWorkState", xco);
			return count;
		}
	}
	
	
	/**
	 * 查找单个预约教室
	 * @param xco
	 * @return
	 */
	public XCO selectOrderRoomById(XCO xco){
		XCO course = SqlServiceActuator.execute("wms-courseservices.selectOrderRoomById", xco);
		return course;
	}
	
	
	/**
	 * 学生考勤列表
	 * @param xco
	 * @return
	 */
	public XCO kaoqinlist(XCO xco){
		XCO rep = SqlServiceActuator.execute("wms-courseservices.kaoqinlist", xco);
		return rep;
	}
}
