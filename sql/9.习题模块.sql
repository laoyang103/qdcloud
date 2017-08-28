
use lab_db;

DROP TABLE IF EXISTS lab_example;
CREATE TABLE lab_example(
	example_id    		  BIGINT UNSIGNED      		NOT NULL AUTO_INCREMENT COMMENT '习题id',
	example_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '习题名称',
	example_content  	  text         	            NOT NULL 	DEFAULT ''  COMMENT '习题内容',
	example_use  	      VARCHAR(500)         	    NOT NULL 	DEFAULT ''  COMMENT '习题用途',
	looked                TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '是否查看[0:未查看, 1:已查看]',
	state                 TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	      VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '操作人',
	create_time           DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time           DATETIME                      NULL                COMMENT '修改时间',
	PRIMARY KEY (example_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='习题表';

