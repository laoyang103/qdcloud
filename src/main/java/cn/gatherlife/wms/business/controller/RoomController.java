package cn.gatherlife.wms.business.controller;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.xson.common.object.XCO;

import cn.gatherlife.wms.business.service.RoomService;
import cn.gatherlife.wms.business.util.TimeUtil;
import cn.gatherlife.wms.business.util.XCOUtil;

@Controller
@RequestMapping("room")
public class RoomController {

	private static Logger	logger	= Logger.getLogger(RoomController.class);
	
	@Autowired
	RoomService roomService;
	
	
	@RequestMapping("roomlist")
	public @ResponseBody XCO roomlist(@RequestBody XCO xco){
	
		XCO rep = roomService.roomlist(xco);
		return rep;
	}
	
	/**
	 * 插入
	 * @param xco
	 * @return
	 */
	@RequestMapping("insertRoom")
	public @ResponseBody XCO insertRoom(@RequestBody XCO xco){
		//执行导入
		long count = roomService.insertRoom(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "保存失败");
		}else{
			return XCOUtil.getResultXCO(1, "保存成功");
		}
	}
	
	/**
	 * 查询单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectRoomById")
	public @ResponseBody XCO selectRoomById(@RequestBody XCO xco){
		return roomService.selectRoomById(xco);
	}
	
	
	/**
	 * 更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("updateRoom")
	public @ResponseBody XCO updateRoom(@RequestBody XCO xco){
		long count = roomService.updateRoom(xco);
		if(count == 0){
			return XCOUtil.getResultXCO(0, "更新失败");
		}else{
			return XCOUtil.getResultXCO(1, "更新成功");
		}
	}
	
	/**删除更新单个对象
	 * @param xco
	 * @return
	 */
	@RequestMapping("deleteRoom")
	public @ResponseBody XCO deleteRoom(@RequestBody XCO xco){
		long count = roomService.deleteRoom(xco);
		if(count == 2){
			return XCOUtil.getResultXCO(0, "所选择的实验室已经被预约");
		}
		else if(count == 0){
			return XCOUtil.getResultXCO(0, "删除失败");
		}else{
			return XCOUtil.getResultXCO(1, "删除成功");
		}
	}
	
	
	
	@RequestMapping("roomSelect")
	public @ResponseBody XCO roomSelect(@RequestBody XCO xco){
		//执行导入
		List<XCO> list = roomService.roomSelect();
		XCO select = new XCO();
		select.setXCOListValue("data", list);
		return select;
	}
	
	@RequestMapping("insertRoomSet")
	public @ResponseBody XCO insertRoomSet(@RequestBody XCO xco) throws Exception{
		int zhouliu = xco.getIntegerValue("zhouliu");
		int zhouri = xco.getIntegerValue("zhouri");
		String room_ids = xco.getStringValue("room_ids");
		String room_names = xco.getStringValue("room_names");
		String begin_time = xco.getStringValue("begin_time");
		String end_time = xco.getStringValue("end_time");
		int shangwukejie1 = Integer.valueOf(xco.getStringValue("shangwukejie1"));
		int shangwukejian1 = Integer.valueOf(xco.getStringValue("shangwukejian1"));
		int shangwukechang1 = Integer.valueOf(xco.getStringValue("shangwukechang1"));
		String shangwukaike1 = xco.getStringValue("shangwukaike1");
		int xiawukejie2 = Integer.valueOf(xco.getStringValue("xiawukejie2"));
		int xiawukejian2 = Integer.valueOf(xco.getStringValue("xiawukejian2"));
		int xiawukechang2 = Integer.valueOf(xco.getStringValue("xiawukechang2"));
		String xiawukaike2 = xco.getStringValue("xiawukaike2");
		int wanshangkejie3 = Integer.valueOf(xco.getStringValue("wanshangkejie3"));
		int wanshangkejian3 = Integer.valueOf(xco.getStringValue("wanshangkejian3"));
		int wanshangkechang3 = Integer.valueOf(xco.getStringValue("wanshangkechang3"));
		String wanshangkaike3 = xco.getStringValue("wanshangkaike3");
		
		String t_shangwukaike1 = begin_time+" "+shangwukaike1;
		long t_shangwukaike1_long = Long.valueOf(TimeUtil.dateToStamp(t_shangwukaike1));
		long t_long = (shangwukejian1+shangwukechang1)*shangwukejie1*60*1000;//毫秒
		
		String t_xiawukaike2 = begin_time+" "+xiawukaike2;
		long t_xiawukaike2_long = Long.valueOf(TimeUtil.dateToStamp(t_xiawukaike2));
		
		if((t_shangwukaike1_long + t_long) > t_xiawukaike2_long){
			return XCOUtil.getResultXCO(16001, "上午上课结束时间大于下午开课时间");
		}
		
		long tx_long = (xiawukejian2+xiawukechang2)*xiawukejie2*60*1000;//毫秒
		
		String t_wanshangkaike3 = begin_time+" "+wanshangkaike3;
		long t_wanshangkaike3_long = Long.valueOf(TimeUtil.dateToStamp(t_wanshangkaike3));
		
		if((t_xiawukaike2_long + tx_long) > t_wanshangkaike3_long){
			return XCOUtil.getResultXCO(16002, "下午上课结束时间大于晚上开课时间");
		}
		
		long tw_long = (wanshangkejian3+wanshangkechang3)*wanshangkejie3*60*1000;//毫秒
		long tt_long = Long.valueOf(TimeUtil.dateToStamp(begin_time+" 23:59:59"));
		if((t_wanshangkaike3_long + tw_long) > tt_long){
			return XCOUtil.getResultXCO(16003, "晚上上课结束时间大于当天晚上12点");
		}
		return roomService.setRoomTime(room_ids,room_names,begin_time,end_time,zhouliu,zhouri,shangwukejie1,shangwukejian1,shangwukechang1,shangwukaike1,
				xiawukejie2,xiawukejian2,xiawukechang2,xiawukaike2,wanshangkejie3,wanshangkejian3,wanshangkechang3,wanshangkaike3);
	}
	
	
	@RequestMapping("roomtimelist")
	public @ResponseBody XCO roomtimelist(@RequestBody XCO xco){
	
		XCO rep = roomService.roomtimelist(xco);
		return rep;
	}
	
	/**
	 * 删除单个预约时间 bY id
	 * @param xco
	 * @return
	 */
	@RequestMapping("deleteRoomTimeById")
	public @ResponseBody XCO deleteRoomTimeById(@RequestBody XCO xco){
		XCO rep2 = roomService.checkdelRoomTimeById(xco);
		if(rep2.getXCOValue("time").getIntegerValue("check_state") == 2){
			return XCOUtil.getResultXCO(3, "该时间已经被预约，不能进行删除");
		}else{
			XCO rep = roomService.deleteRoomTimeById(xco);
			if(rep.getIntegerValue("rowCount") == 1){
				return XCOUtil.getResultXCO(1, "删除成功");
			}else{
				return XCOUtil.getResultXCO(0, "删除失败");
			}
		}
	}
	
	/**
	 * 实验室预约审核列表
	 * @param xco
	 * @return
	 */
	@RequestMapping("roomtimeorderlist")
	public @ResponseBody XCO roomtimeorderlist(@RequestBody XCO xco){
	
		XCO rep = roomService.roomtimeorderlist(xco);
		return rep;
	}
	
	/**
	 * 审核教师预约的实验室
	 * @param xco
	 * @return
	 */
	@RequestMapping("checkOrderById")
	public @ResponseBody XCO checkOrderById(@RequestBody XCO xco){
		XCO rep = roomService.checkOrderById(xco);
		if(rep.getIntegerValue("rowCount") == 1){
			return XCOUtil.getResultXCO(1, "审核成功");
		}else{
			return XCOUtil.getResultXCO(0, "审核失败");
		}
	}
	
	
	/**
	 * 查找单个预约信息
	 * @param xco
	 * @return
	 */
	@RequestMapping("selectOrderRoomTimeById")
	public @ResponseBody XCO selectOrderRoomTimeById(@RequestBody XCO xco){
		XCO rep = roomService.selectOrderRoomTimeById(xco);
		return rep;
	}
	
	/**
	 * 实验室课时占用列表
	 * @param xco
	 * @return
	 */
	@RequestMapping("roomZhanyongList")
	public @ResponseBody XCO roomZhanyongList(@RequestBody XCO xco){
		XCO rep = roomService.roomZhanyongList(xco);
		return rep;
	}
		
	
	public static void main(String[] args) throws ParseException {
		String tbegin_time = "12:12:11";
		String begin_time = "2016-11-11 11:11:11";
		System.out.println("--------------------"+begin_time.substring(0, 11)+tbegin_time);
		System.out.println("--------------------"+begin_time.substring(0, 10));
		
		DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");        
		String bDate = "2017-01-07"; 
		Date bdate = format1.parse(bDate); 
		    Calendar cal = Calendar.getInstance();
		    cal.setTime(bdate);
		    if(cal.get(Calendar.DAY_OF_WEEK)==Calendar.SATURDAY||cal.get(Calendar.DAY_OF_WEEK)==Calendar.SUNDAY)
		 {
		 // System.out.print("ok");
		 }
		// else System.out.print("no");
		    
		 int i = 1;
		 while(i < 5){
			 if(i == 3)
				 continue;
			 System.out.println("-------"+i);
			 i++;
		 }
	}
	
	
}
