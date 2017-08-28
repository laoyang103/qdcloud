
use lab_db;

DROP TABLE IF EXISTS lab_course;
CREATE TABLE lab_course(
	course_id    		  BIGINT UNSIGNED      		NOT NULL AUTO_INCREMENT COMMENT '课程id',
	course_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '课程名称',
	experiment_id    	  BIGINT UNSIGNED      		NOT NULL 	DEFAULT 0	COMMENT '实验id',
	experiment_name  	  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '实验名称',
	example_id    		  BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '习题id',
	example_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '习题名称',
	example_content  	  text         	            NOT NULL 	DEFAULT ''  COMMENT '习题内容',
	time_id    	          BIGINT UNSIGNED      		NOT NULL 	DEFAULT 0	COMMENT '预约时间id',
	begin_time            DATETIME                  NOT NULL                COMMENT '开始时间',
	end_time              DATETIME                  NOT NULL                COMMENT '结束时间',
	class_id    		  BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '班级id',
	class_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '班级名称',
	room_id    		      BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '教室id',
	room_name  		      VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '教室名称',
    place_count           TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '课位数量',
	place_ok_count        TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '已预约课位数量',	
	state                 TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '删除状态[0:停用, 1:未开始 20:执行中 30:已完成]',
	teacher_id   	 	  BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '教师id',
    teacher_name   	 	  VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '教师名称',
	operator   	 	      VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '教师名称',
	create_time           DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time           DATETIME                      NULL                COMMENT '修改时间',
	PRIMARY KEY (course_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='课程表';


DROP TABLE IF EXISTS lab_course_order;
CREATE TABLE lab_course_order(
    order_id              BIGINT UNSIGNED      		NOT NULL AUTO_INCREMENT COMMENT '预约id',
	time_id    	          BIGINT UNSIGNED      		NOT NULL 	DEFAULT 0	COMMENT '预约时间id',
	course_id    		  BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '课程id',
	class_id    		  BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '班级id',
	student_id    		  BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '学生id',
	student_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '学生名称',
	remark  		      VARCHAR(500)         		NOT NULL 	DEFAULT ''  COMMENT '备注',
	state                 TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '删除状态[0:停用, 1:启用]',
	check_work            TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '考勤状态[0:未签到, 1:已签到]',
	work_state            TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '上课状态[0:未上课, 1:已上课]',
	operator_id   	 	  VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '操作人id',
	operator   	 	      VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '操作人名称',
	create_time           DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time           DATETIME                      NULL                COMMENT '修改时间',
	PRIMARY KEY (order_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='学生预约课程表';


DROP TABLE IF EXISTS lab_course_student;
CREATE TABLE lab_course_student(
	course_student_id     BIGINT UNSIGNED      		NOT NULL AUTO_INCREMENT COMMENT '课程选择学生id',
	time_id    	          BIGINT UNSIGNED      		NOT NULL 	DEFAULT 0	COMMENT '预约时间id',
	course_id    		  BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '课程id',
	course_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '课程名称',
	student_id    		  BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '学生id',
	student_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '学生名称',	
	example_content  	  text         	            NOT NULL 	DEFAULT ''  COMMENT '已做习题内容',
	example_flag  	      TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '习题学生已做[0:未做, 1:已做]',
	example_checked       TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '习题是否批改[0:未批改, 1:已批改]',
	example_score         TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '习题评分',
	example_comment  	  VARCHAR(300)         		NOT NULL 	DEFAULT ''  COMMENT '习题评语',	
	experiment_report     VARCHAR(1000)             NOT NULL 	DEFAULT ''  COMMENT '学生实验报告',
	experiment_flag  	  TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '习题学生已做[0:未做, 1:已做]',
	experiment_checked    TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '报告是否批改[0:未批改, 1:已批改]',
	experiment_score      TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '报告评分',
	experiment_comment    VARCHAR(300)         		NOT NULL 	DEFAULT ''  COMMENT '报告评语',		
	begin_time            DATETIME                  NOT NULL                COMMENT '开始答题时间',
	end_time              DATETIME                  NOT NULL                COMMENT '结束答题时间',
	example_state         TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '作业状态[0:停用, 1:未开始 20:执行中 30:已完成]',
	experiment_state      TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '报告状态[0:停用, 1:未开始 20:执行中 30:已完成]',
    operator   	 	      VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '操作人',
	create_time           DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time           DATETIME                      NULL                COMMENT '修改时间',
	PRIMARY KEY (course_student_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='课程学生表';

DROP TABLE IF EXISTS lab_course_student_station;
CREATE TABLE lab_course_student_station(
	id                    BIGINT UNSIGNED      		NOT NULL AUTO_INCREMENT COMMENT '学生预约id',
	station_id    	      BIGINT UNSIGNED      		NOT NULL 	DEFAULT 0	COMMENT '课位id',
	time_id    	          BIGINT UNSIGNED      		NOT NULL 	DEFAULT 0	COMMENT '预约时间id',
	student_id    		  BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '学生id',
	student_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '学生名称',
	state                 TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '当前状态[0:停用, 1:启用]',
	operator_id    	      BIGINT UNSIGNED      		NOT NULL 	DEFAULT 0	COMMENT '操作人id',
    operator   	 	      VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '操作人',
	create_time           DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time           DATETIME                      NULL                COMMENT '修改时间',
	PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='学生预约课位表';

