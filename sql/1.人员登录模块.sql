DROP DATABASE IF EXISTS lab_db;
CREATE DATABASE lab_db CHARACTER SET utf8 COLLATE=utf8_bin;

use lab_db;

DROP TABLE IF EXISTS lab_user;
CREATE TABLE lab_user (
    user_id        	 BIGINT UNSIGNED           NOT NULL AUTO_INCREMENT COMMENT '人员ID',
	user_num      	 VARCHAR(20)           	   NOT NULL 			   COMMENT '人员编号',
    user_name      	 VARCHAR(50)           	   NOT NULL 			   COMMENT '人员登录账号',
	real_name      	 VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '姓名',
	password   	     VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '密码',
    sex   	 	     TINYINT UNSIGNED          NOT NULL 	DEFAULT 0  COMMENT '性别 0 男 1 女',
	class_id   	     BIGINT UNSIGNED           NOT NULL     DEFAULT 0  COMMENT '班级ID',	
    class_name   	 VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '班级',		
	type   	 	     TINYINT UNSIGNED          NOT NULL 	DEFAULT 0  COMMENT '人员类型 1 学生 2 教师 3 系统管理员',
	role_id   	     BIGINT UNSIGNED           NOT NULL     DEFAULT 0  COMMENT '角色ID'	,
	state            TINYINT UNSIGNED          NOT NULL     DEFAULT 1  COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	 VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '操作人',
	create_time      DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time      DATETIME                      NULL                COMMENT '修改时间',
    PRIMARY KEY (user_id)		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员表';

