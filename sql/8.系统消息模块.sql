
use lab_db;

DROP TABLE IF EXISTS lab_message;
CREATE TABLE lab_message(
	message_id    		  BIGINT UNSIGNED      		NOT NULL AUTO_INCREMENT COMMENT '实验id',
	message_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '实验室名称',
	message_content  	  VARCHAR(1000)         	NOT NULL 	DEFAULT ''  COMMENT '实验内容',
	sender                TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '发送方类型[1 学生 2 教师 3 系统管理员]',
	receiver              TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '接收方类型[1 学生 2 教师 3 系统管理员]',
	looked                TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '是否查看[0:未查看, 1:已查看]',
	state                 TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	      VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '操作人',
	create_time           DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time           DATETIME                      NULL                COMMENT '修改时间',
	PRIMARY KEY (message_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统消息表';


DROP TABLE IF EXISTS lab_message_one;
CREATE TABLE lab_message_one(
	message_id    		  BIGINT UNSIGNED      		NOT NULL AUTO_INCREMENT COMMENT '实验id',
	message_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '实验室名称',
	message_content  	  VARCHAR(1000)         	NOT NULL 	DEFAULT ''  COMMENT '实验内容',
	sender                BIGINT UNSIGNED           NOT NULL    DEFAULT 0   COMMENT '发送方ID',
	receiver              BIGINT UNSIGNED           NOT NULL    DEFAULT 0   COMMENT '接收方ID',
	looked                TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '是否查看[0:未查看, 1:已查看]',
	state                 TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	      VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '操作人',
	create_time           DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time           DATETIME                      NULL                COMMENT '修改时间',
	PRIMARY KEY (message_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='单发系统消息表';

