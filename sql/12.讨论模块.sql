
use lab_db;

DROP TABLE IF EXISTS lab_discuss;
CREATE TABLE lab_discuss(
	discuss_id    		  BIGINT UNSIGNED      		NOT NULL AUTO_INCREMENT COMMENT '讨论id',
	discuss_title  		  VARCHAR(100)         		NOT NULL 	DEFAULT ''  COMMENT '讨论标题',
	discuss_group_id      BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '讨论组id',
	discuss_group_name    VARCHAR(100)         		NOT NULL 	DEFAULT ''  COMMENT '讨论组',
	discuss_content       VARCHAR(100)         		NOT NULL 	DEFAULT ''  COMMENT '讨论内容',
	click_count           TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '点击量',
	reply_count           TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '回复量',
	state                 TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	      VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '操作人（作者）',
	create_time           DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time           DATETIME                      NULL                COMMENT '修改时间',
	PRIMARY KEY (discuss_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='讨论主表';

DROP TABLE IF EXISTS lab_discuss_reply;
CREATE TABLE lab_discuss_reply(
	reply_id      		  BIGINT UNSIGNED      		NOT NULL AUTO_INCREMENT COMMENT '讨论回复id',
	discuss_id            BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '讨论id',
	reply_content  		  VARCHAR(1000)         	NOT NULL 	DEFAULT ''  COMMENT '回复内容',
	state                 TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	      VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '操作人',
	create_time           DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time           DATETIME                      NULL                COMMENT '修改时间',
	PRIMARY KEY (reply_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='讨论回复表';


