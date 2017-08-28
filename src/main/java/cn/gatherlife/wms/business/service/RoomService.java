package cn.gatherlife.wms.business.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;
import org.xson.common.object.XCO;
import org.xson.tangyuan.executor.SqlServiceActuator;

import cn.gatherlife.wms.business.util.Constant;
import cn.gatherlife.wms.business.util.TimeUtil;
import cn.gatherlife.wms.business.util.XCOUtil;

@Service
public class RoomService {
	
	/**
	 * 插入教室
	 * @param xco
	 * @return
	 */
	public long insertRoom(XCO xco){
		long row = SqlServiceActuator.execute("wms-roomservices.insertRoom", xco);
		int rows = xco.getIntegerValue("room_rows");
		int cols = xco.getIntegerValue("room_cols");
		long flag = 0;
		for(int i=0;i<rows;i++){
			for(int j=0;j<cols;j++){
				XCO sta = new XCO();
				sta.setLongValue("room_id", row);
				sta.setIntegerValue("room_row", i+1);
				sta.setLongValue("room_col", j+1);
				sta.setStringValue("station_name", "第"+(i+1)+"排，第"+(j+1)+"列");
				flag = SqlServiceActuator.execute("wms-roomservices.insertStation", sta);
			}
		}
		return flag;
	}
	
	/**
	 * 班级教室
	 * @param xco
	 * @return
	 */
	public XCO roomlist(XCO xco){
		return SqlServiceActuator.execute("wms-roomservices.roomlist", xco);
	}
	
	/**
	 * 查找单个教室
	 * @param xco
	 * @return
	 */
	public XCO selectRoomById(XCO xco){
		return SqlServiceActuator.execute("wms-roomservices.selectRoomById", xco);
	}
	
	/**
	 * 更新教室
	 * @param xco
	 * @return
	 */
	public int updateRoom(XCO xco){
		XCO req = SqlServiceActuator.execute("wms-roomservices.updateRoom", xco);
		//SqlServiceActuator.execute("wms-roomservices.updateRoom1", xco);
		//SqlServiceActuator.execute("wms-roomservices.updateRoom2", xco);
		//SqlServiceActuator.execute("wms-roomservices.updateRoom3", xco);
		return req.getIntegerValue("count");
	}
	
	/**
	 * 教室预约时间列表
	 * @param xco
	 * @return
	 */
	public XCO roomtimelist(XCO xco){
		//只能预约当前时间后加上3天后的教室
		if(xco.getIntegerValue("flag") == 1){
			SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			long begin_long_time = new Date().getTime();
			try {
				begin_long_time = Long.valueOf(TimeUtil.dateToStamp(simpleDateFormat.format(new Date())));
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (ParseException e) {
				e.printStackTrace();
			}
			long end_long_time = begin_long_time+Constant.TIME_提前几天预约实验室*24*60*60*1000;//3天后的时间
			xco.setStringValue("endd_time", TimeUtil.stampToDate(end_long_time+""));
		}
		if(null!=xco.getStringValue("begin_time") && !"".equals(xco.getStringValue("begin_time"))){
			xco.setStringValue("begin_time", xco.getStringValue("begin_time")+" 00:00:00");
		}
		if(null!=xco.getStringValue("end_time") && !"".equals(xco.getStringValue("end_time"))){
			xco.setStringValue("end_time", xco.getStringValue("end_time")+" 23:59:59");
		}
		return SqlServiceActuator.execute("wms-roomservices.roomtimelist", xco);
	}
	
	/**
	 * 删除教室
	 * @param xco
	 * @return
	 */
	public int deleteRoom(XCO xco){
		String delStr = xco.getStringValue("delstr");
		if(null!=delStr && !"".equals(delStr)){
			int flag = 1;
			if(delStr.indexOf(",") > -1){
				String[] arr = delStr.split(",");
				for(int i=0;i<arr.length;i++){
					XCO dxco = new XCO();
					dxco.setIntegerValue("check_state", 2);
					dxco.setIntegerValue("room_id", Integer.valueOf(arr[i]));
					SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					dxco.setStringValue("endd_time", simpleDateFormat.format(new Date()));
					List<XCO> list = SqlServiceActuator.execute("wms-roomservices.roomTimeListSelect", dxco);
					if(null!=list && list.size() > 0){
						flag = 0;
						break;
					}
				}
				if(flag == 1){
					for(int i=0;i<arr.length;i++){
						XCO dxco = new XCO();
						dxco.setIntegerValue("room_id", Integer.valueOf(arr[i]));
						SqlServiceActuator.execute("wms-roomservices.deleteRoom", dxco);
					}
				}else{
					return 2;
				}
			}else{
				XCO dxco = new XCO();
				dxco.setIntegerValue("room_id", Integer.valueOf(delStr));
				dxco.setIntegerValue("check_state", 2);
				SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				dxco.setStringValue("endd_time", simpleDateFormat.format(new Date()));
				List<XCO> list = SqlServiceActuator.execute("wms-roomservices.roomTimeListSelect", dxco);
				if(null!=list && list.size() > 0){
					flag = 0;
				}
				if(flag == 1){
					SqlServiceActuator.execute("wms-roomservices.deleteRoom", dxco);
				}else{
					return 2;
				}
			}
			return 1;
		}else{
			return 0;
		}
	}
	
	/**
	 * 设置单个教室的预约时间
	 * @param room_ids          预约实验室ids
	 * @param room_names        预约实验室names
	 * @param begin_time        预约开始时间
	 * @param end_time          预约结束时间
	 * @param zhouliu           周六
	 * @param zhouliu           周日
	 * @param shangwukejie1             上午课节
	 * @param shangwukejian1          上午课间
	 * @param shangwukechang1        上午课长
	 * @param shangwukaike1             上午开课时间
	 * @param xiawukejie2                  下午课节
	 * @param xiawukejian2               下午课间
	 * @param xiawukechang2             下午课长
	 * @param xiawukaike2                  下午开课时间
	 * @param wanshangkejie3           晚上课节
	 * @param wanshangkejian3        晚上课间
	 * @param wanshangkechang3     晚上课长
	 * @param wanshangkaike3          晚上开课时间
	 * 
	 * @return
	 */
	public XCO setRoomTime(String room_ids,String room_names,String begin_time,String end_time,int zhouliu,int zhouri,
			int shangwukejie1,int shangwukejian1,int shangwukechang1,String shangwukaike1,
			int xiawukejie2,int xiawukejian2,int xiawukechang2,String xiawukaike2,
			int wanshangkejie3,int wanshangkejian3,int wanshangkechang3,String wanshangkaike3) throws Exception{
		//开始时间
		String s_shangwukaike1 = begin_time+" "+shangwukaike1;
		String s_xiawukaike2 = begin_time+" "+xiawukaike2;
		String s_wanshangkaike3 = begin_time+" "+wanshangkaike3;
		//结束时间
		String e_shangwukaike1 = end_time+" "+shangwukaike1;
		String e_xiawukaike2 = end_time+" "+xiawukaike2;
		String e_wanshangkaike3 = end_time+" "+wanshangkaike3;
		//判断该时间段内是否有教师预约
		XCO txco = new XCO();
		txco.setStringValue("room_id", room_ids);
		txco.setIntegerValue("check_state", 2);
		txco.setStringValue("begin_time", begin_time);
		txco.setStringValue("end_time", end_time);
		List<XCO> list = SqlServiceActuator.execute("wms-roomservices.roomTimeListSelect", txco);
		if(null!=list && list.size() > 0){
			return XCOUtil.getResultXCO(10101, "时间段【"+list.get(0).getStringValue("time_name")+"】已经有教师预约");
		}
		//多个实验室
		if(room_ids.indexOf(",") > -1){
			String[] arrids = room_ids.split(",");
			String[] arrnames = room_ids.split(",");
			for(int i=0,j=arrids.length;i<j;i++){
				dealRoomTime(arrids[i],arrnames[i],s_shangwukaike1,s_xiawukaike2,s_wanshangkaike3,e_shangwukaike1,e_xiawukaike2,e_wanshangkaike3,
						zhouliu,zhouri,shangwukejie1,shangwukejian1,shangwukechang1,xiawukejie2,xiawukejian2,xiawukechang2,wanshangkejie3,
						wanshangkejian3,wanshangkechang3);
			}
		}
		//单个实验室
		else{
			dealRoomTime(room_ids,room_names,s_shangwukaike1,s_xiawukaike2,s_wanshangkaike3,e_shangwukaike1,e_xiawukaike2,e_wanshangkaike3,
					zhouliu,zhouri,shangwukejie1,shangwukejian1,shangwukechang1,xiawukejie2,xiawukejian2,xiawukechang2,wanshangkejie3,
					wanshangkejian3,wanshangkechang3);
		}
		
		return XCOUtil.getResultXCO(1, "生成成功");
	}
	
	/**
	 * 处理逻辑
	 * @param room_ids
	 * @param room_names
	 * @param s_shangwukaike1
	 * @param s_xiawukaike2
	 * @param s_wanshangkaike3
	 * @param e_shangwukaike1
	 * @param e_xiawukaike2
	 * @param e_wanshangkaike3
	 * @param zhouliu
	 * @param zhouri
	 * @param shangwukejie1
	 * @param shangwukejian1
	 * @param shangwukechang1
	 * @param xiawukejie2
	 * @param xiawukejian2
	 * @param xiawukechang2
	 * @param wanshangkejie3
	 * @param wanshangkejian3
	 * @param wanshangkechang3
	 */
	public void dealRoomTime(String room_ids,String room_names,String s_shangwukaike1,String s_xiawukaike2,String s_wanshangkaike3,String e_shangwukaike1,String e_xiawukaike2,String e_wanshangkaike3,
			int zhouliu,int zhouri,int shangwukejie1,int shangwukejian1,int shangwukechang1,int xiawukejie2,int xiawukejian2,int xiawukechang2,
			int wanshangkejie3,int wanshangkejian3,int wanshangkechang3) throws Exception{
		
		XCO roomXCO = new XCO();
		roomXCO.setStringValue("room_id", room_ids);
		XCO room = SqlServiceActuator.execute("wms-roomservices.selectRoomById", roomXCO);
		
		long s_s_kaike = Long.valueOf(TimeUtil.dateToStamp(s_shangwukaike1));
		long s_x_kaike = Long.valueOf(TimeUtil.dateToStamp(s_xiawukaike2));
		long s_w_kaike = Long.valueOf(TimeUtil.dateToStamp(s_wanshangkaike3));
		
		long e_s_kaike = Long.valueOf(TimeUtil.dateToStamp(e_shangwukaike1));
		long e_x_kaike = Long.valueOf(TimeUtil.dateToStamp(e_xiawukaike2));
		long e_w_kaike = Long.valueOf(TimeUtil.dateToStamp(e_wanshangkaike3));
		String room_day = TimeUtil.stampToDate(s_s_kaike+"").substring(0, 10);
		//查询已经生成的时间
		XCO getXco = new XCO();
		getXco.setStringValue("room_id", room_ids);
		getXco.setStringValue("room_day", room_day);
		long count = SqlServiceActuator.execute("wms-roomservices.getRoomTime", getXco);

		if(count==0){
			while(s_s_kaike <= e_s_kaike){
				long t_s_kaike = s_s_kaike;
				room_day = TimeUtil.stampToDate(s_s_kaike+"").substring(0, 10);
				int flag = 1;
				//如果没有选择周六，当前日期为周六
				if(zhouliu == 0 && TimeUtil.checkSaturday(room_day)){
					flag = 0;
				}
				//如果没有选择周日，当前日期为周日
				if(zhouri == 0 && TimeUtil.checkSunday(room_day)){
					flag = 0;
				}
				//处理上午
				if(flag == 1){
					for(int i=0;i<shangwukejie1;i++){
						XCO xco1 = new XCO();
						xco1.setStringValue("room_id", room_ids);
						xco1.setStringValue("room_code", room.getStringValue("room_code"));
						xco1.setStringValue("room_name", room.getStringValue("room_name"));
						xco1.setStringValue("room_day", room_day);
						xco1.setStringValue("time_name", room_day+"上午第"+(i+1)+"节课");
						xco1.setStringValue("begin_time", TimeUtil.stampToDate(t_s_kaike+""));
						xco1.setStringValue("end_time", TimeUtil.stampToDate(t_s_kaike+shangwukechang1*60*1000+""));
						xco1.setStringValue("room_time_type", "上午");
						xco1.setStringValue("check_state", "1");
						//System.out.println("------------------"+xco1.toXMLString());
						SqlServiceActuator.execute("wms-roomservices.insertRoomTime", xco1);
						t_s_kaike = t_s_kaike+(shangwukejian1+shangwukechang1)*60*1000;
					}
				}
				s_s_kaike = s_s_kaike+24*60*60*1000;
			}
			//处理下午
			while(s_x_kaike <= e_x_kaike){
				long t_x_kaike = s_x_kaike;
				room_day = TimeUtil.stampToDate(s_x_kaike+"").substring(0, 10);
				//如果没有选择周六，当前日期为周六
				int flag = 1;
				//如果没有选择周六，当前日期为周六
				if(zhouliu == 0 && TimeUtil.checkSaturday(room_day)){
					flag = 0;
				}
				//如果没有选择周日，当前日期为周日
				if(zhouri == 0 && TimeUtil.checkSunday(room_day)){
					flag = 0;
				}
				if(flag == 1){
					for(int i=0;i<xiawukejie2;i++){
						XCO xco1 = new XCO();
						xco1.setStringValue("room_id", room_ids);
						xco1.setStringValue("room_code", room.getStringValue("room_code"));
						xco1.setStringValue("room_name", room.getStringValue("room_name"));
						xco1.setStringValue("room_day", room_day);
						xco1.setStringValue("time_name", room_day+"下午第"+(i+1)+"节课");
						xco1.setStringValue("begin_time", TimeUtil.stampToDate(t_x_kaike+""));
						xco1.setStringValue("end_time", TimeUtil.stampToDate(t_x_kaike+xiawukechang2*60*1000+""));
						xco1.setStringValue("room_time_type", "下午");
						xco1.setStringValue("check_state", "1");
						//System.out.println("------------------"+xco1.toXMLString());
						SqlServiceActuator.execute("wms-roomservices.insertRoomTime", xco1);
						t_x_kaike = t_x_kaike+(xiawukejian2+xiawukechang2)*60*1000;
					}
				}
				s_x_kaike = s_x_kaike+24*60*60*1000;
			}
				
			//处理晚上
			while(s_w_kaike <= e_w_kaike){
			    long t_w_kaike = s_w_kaike;
				room_day = TimeUtil.stampToDate(s_w_kaike+"").substring(0, 10);
				int flag = 1;
				//如果没有选择周六，当前日期为周六
				if(zhouliu == 0 && TimeUtil.checkSaturday(room_day)){
					flag = 0;
				}
				//如果没有选择周日，当前日期为周日
				if(zhouri == 0 && TimeUtil.checkSunday(room_day)){
					flag = 0;
				}
				if(flag == 1){
					for(int i=0;i<wanshangkejie3;i++){
						XCO xco1 = new XCO();
						xco1.setStringValue("room_id", room_ids);
						xco1.setStringValue("room_code", room.getStringValue("room_code"));
						xco1.setStringValue("room_name", room.getStringValue("room_name"));
						xco1.setStringValue("room_day", room_day);
						xco1.setStringValue("time_name", room_day+"晚上第"+(i+1)+"节课");
						xco1.setStringValue("begin_time", TimeUtil.stampToDate(t_w_kaike+""));
						xco1.setStringValue("end_time", TimeUtil.stampToDate(t_w_kaike+wanshangkechang3*60*1000+""));
						xco1.setStringValue("room_time_type", "晚上");
						xco1.setStringValue("check_state", "1");
						//System.out.println("------------------"+xco1.toXMLString());
						SqlServiceActuator.execute("wms-roomservices.insertRoomTime", xco1);
						t_w_kaike = t_w_kaike+(wanshangkejian3+wanshangkechang3)*60*1000;
					}
				}
				s_w_kaike = s_w_kaike+24*60*60*1000;
			}
		}
			
		System.out.println(count+"=====================================");
		
		
	}
	
	/**
	 * 教室下拉列表
	 * @return
	 */
	public List<XCO> roomSelect(){
		XCO xco = new XCO();
		return SqlServiceActuator.execute("wms-roomservices.roomSelect", xco);
	}
	
	/**
	 * 检查删除单个教室预约时间
	 * @param xco
	 * @return
	 */
	public XCO checkdelRoomTimeById(XCO xco){
		return SqlServiceActuator.execute("wms-roomservices.checkdelRoomTimeById", xco);
	}
	
	/**
	 * 删除单个教室预约时间
	 * @param xco
	 * @return
	 */
	public XCO deleteRoomTimeById(XCO xco){
		return SqlServiceActuator.execute("wms-roomservices.delRoomTimeById", xco);
	}
	
	/**
	 * 实验室预约审核列表
	 * @param xco
	 * @return
	 */
	public XCO roomtimeorderlist(XCO xco){
		return SqlServiceActuator.execute("wms-roomservices.roomtimeorderlist", xco);
	}
	
	/**
	 * 审核教师预约的实验室
	 * @param xco
	 * @return
	 */
	public XCO checkOrderById(XCO xco){
		return SqlServiceActuator.execute("wms-roomservices.checkOrderById", xco);
	}
	
	/**
	 * 查找单个预约信息
	 * @param xco
	 * @return
	 */
	public XCO selectOrderRoomTimeById(XCO xco){
		return SqlServiceActuator.execute("wms-roomservices.selectOrderRoomTimeById", xco);
	}
	
	/**
	 * 教室占用情况
	 * @param xco
	 * @return
	 */
	public XCO roomZhanyongList(XCO xco){
		return SqlServiceActuator.execute("wms-roomservices.roomZhanyongList", xco);
	}
}


