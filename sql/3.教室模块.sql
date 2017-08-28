
use lab_db;

DROP TABLE IF EXISTS lab_room;
CREATE TABLE lab_room (
    room_id          BIGINT UNSIGNED           NOT NULL AUTO_INCREMENT COMMENT '教室ID',
	room_code        VARCHAR(20)           	   NOT NULL 	DEFAULT '' COMMENT '教室编号',
    room_name        VARCHAR(50)           	   NOT NULL 	DEFAULT '' COMMENT '教室名称',	
    department	     VARCHAR(50)           	   NOT NULL 	DEFAULT '' COMMENT '院系名称',
	measure_area	 VARCHAR(50)           	   NOT NULL 	DEFAULT '' COMMENT '面积',
	area	         VARCHAR(128)              NOT NULL 	DEFAULT '' COMMENT '地点',
	leader   	 	 VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '负责人',
	place_count      TINYINT UNSIGNED          NOT NULL     DEFAULT 0  COMMENT '课位数量',
	place_ok_count   TINYINT UNSIGNED          NOT NULL     DEFAULT 0  COMMENT '已预约课位数量',
	room_rows        TINYINT UNSIGNED          NOT NULL     DEFAULT 0  COMMENT '课位排',
	room_cols        TINYINT UNSIGNED          NOT NULL     DEFAULT 0  COMMENT '课位列',
	state            TINYINT UNSIGNED          NOT NULL     DEFAULT 1  COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	 VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '操作人',
	create_time      DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time      DATETIME                      NULL                COMMENT '修改时间',
    PRIMARY KEY (room_id)		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教室表';

DROP TABLE IF EXISTS lab_room_station;
CREATE TABLE lab_room_station (
	station_id       BIGINT UNSIGNED           NOT NULL AUTO_INCREMENT COMMENT '课位ID',
    room_id          BIGINT UNSIGNED           NOT NULL                COMMENT '教室ID',
	room_row         TINYINT UNSIGNED          NOT NULL     DEFAULT 0  COMMENT '课位第几排',
	room_col         TINYINT UNSIGNED          NOT NULL     DEFAULT 0  COMMENT '课位第几列',
	station_name     VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '课位名字',
	state            TINYINT UNSIGNED          NOT NULL     DEFAULT 1  COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	 VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '操作人',
	create_time      DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time      DATETIME                      NULL                COMMENT '修改时间',
    PRIMARY KEY (station_id)		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教室课位表';

DROP TABLE IF EXISTS lab_room_time;
CREATE TABLE lab_room_time (
    time_id           BIGINT UNSIGNED              NOT NULL AUTO_INCREMENT COMMENT '时间ID',
	room_id           BIGINT UNSIGNED              NOT NULL                COMMENT '教室ID',
	room_code         VARCHAR(20)           	   NOT NULL 	DEFAULT '' COMMENT '教室编号',
    room_name         VARCHAR(50)           	   NOT NULL 	DEFAULT '' COMMENT '教室名称',	
    room_day          VARCHAR(20)           	   NOT NULL 	DEFAULT '' COMMENT '日期',
	time_name         VARCHAR(40)                  NOT NULL 	DEFAULT '' COMMENT '课时名称',
	begin_time        DATETIME                     NOT NULL 	           COMMENT '开始时间',
	end_time          DATETIME                     NOT NULL 	           COMMENT '结束时间',
	room_time_type    VARCHAR(20)           	   NOT NULL 	DEFAULT '' COMMENT '时间周期：上午 下午 晚上',
	state             TINYINT UNSIGNED             NOT NULL     DEFAULT 1  COMMENT '删除状态[0:停用, 1:启用]',
	check_state       TINYINT UNSIGNED             NOT NULL     DEFAULT 1  COMMENT '是否可预约[1:可预约, 2:不可预约]',
	audit_state	      TINYINT UNSIGNED             NOT NULL     DEFAULT 0  COMMENT '审核状态[0:无效, 1: 审核不通过, 2: 审核通过]',
    operator   	 	  VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '操作人',
	create_time       DATETIME                     NOT NULL                COMMENT '创建时间',
    update_time       DATETIME                      NULL                COMMENT '修改时间',
    PRIMARY KEY (time_id)		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实验室时间表';



DROP TABLE IF EXISTS lab_room_order;
CREATE TABLE lab_room_order (
    order_id          BIGINT UNSIGNED              NOT NULL AUTO_INCREMENT COMMENT '预约ID',
	time_id           BIGINT UNSIGNED              NOT NULL     DEFAULT 0  COMMENT '时间ID',
	room_id           BIGINT UNSIGNED              NOT NULL                COMMENT '教室ID',
	room_code         VARCHAR(20)           	   NOT NULL 	DEFAULT '' COMMENT '教室编号',
    room_name         VARCHAR(50)           	   NOT NULL 	DEFAULT '' COMMENT '教室名称',	
    room_day          VARCHAR(20)           	   NOT NULL 	DEFAULT '' COMMENT '日期',
	time_name         VARCHAR(20)                  NOT NULL 	DEFAULT '' COMMENT '课时名称',
    begin_time        DATETIME                     NOT NULL 	           COMMENT '开始时间',
	end_time          DATETIME                     NOT NULL 	           COMMENT '结束时间',
	teacher_id        BIGINT UNSIGNED              NOT NULL                COMMENT '教师ID',
	teacher_name      VARCHAR(20)                  NOT NULL 	DEFAULT '' COMMENT '教师名称',
	shenhe_id         BIGINT UNSIGNED              NOT NULL                COMMENT '审核人ID',
	audit_state	      TINYINT UNSIGNED             NOT NULL     DEFAULT 10 COMMENT '审核状态[0:无效, 10: 预约新提交(审核中), 20:预约重新提交(审核中) , 30: 预约未通过, 100: 预约通过]',
	state             TINYINT UNSIGNED             NOT NULL     DEFAULT 1  COMMENT '删除状态[0:停用, 1:启用]',
	remark	 	 	  VARCHAR(512)          	   NULL 	    DEFAULT '' COMMENT '审核意见[审核通过 就清空,不通过 就填充个意见]',
    operator   	 	  VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '操作人',
	create_time       DATETIME                     NOT NULL                COMMENT '创建时间',
    update_time       DATETIME                     NULL                COMMENT '修改时间',
    PRIMARY KEY (order_id)		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师预约实验室表';

