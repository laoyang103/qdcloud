
use lab_db;

DROP TABLE IF EXISTS lab_group;
CREATE TABLE lab_group(
	group_id    		  BIGINT UNSIGNED      		NOT NULL AUTO_INCREMENT COMMENT '分组id',
	group_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '分组名称',
	group_num  	          VARCHAR(32)         		NOT NULL 	DEFAULT ''  COMMENT '分组编号',
	class_id  		      BIGINT UNSIGNED           NOT NULL 	DEFAULT 0   COMMENT '班级id',
	class_name  	      VARCHAR(32)         		NOT NULL 	DEFAULT ''  COMMENT '班级名称',
	type                  TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '由谁分组[0:教师, 1:学生]',
	state                 TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	      VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '操作人',
	create_time           DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time           DATETIME                      NULL                COMMENT '修改时间',
	PRIMARY KEY (group_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分组表';

DROP TABLE IF EXISTS lab_group_student;
CREATE TABLE lab_group_student(
	group_student_id      BIGINT UNSIGNED      		NOT NULL AUTO_INCREMENT COMMENT '学生分组id',
	group_id    		  BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '分组id',
	group_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '分组名称',
	group_num  	          VARCHAR(32)         		NOT NULL 	DEFAULT ''  COMMENT '分组编号',
	student_id    		  BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '学生id',
	student_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '学生名称',
	state                 TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	      VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '操作人',
	create_time           DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time           DATETIME                      NULL                COMMENT '修改时间',
	PRIMARY KEY (group_student_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分组表';


