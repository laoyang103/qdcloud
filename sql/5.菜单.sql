
use lab_db;

DROP TABLE IF EXISTS lab_module;
CREATE TABLE lab_module(
	module_id    		  BIGINT UNSIGNED      		NOT NULL AUTO_INCREMENT COMMENT '模块编号',
	module_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '模块名称',
	url					  VARCHAR(255)				NOT NULL    DEFAULT ''  COMMENT  '链接',
	level        		  TINYINT UNSIGNED    		NOT NULL 	DEFAULT 1   COMMENT '模块级别 1-顶级  2-二级 ',
	f_id         		  BIGINT UNSIGNED   		NOT NULL    DEFAULT 0   COMMENT '父级id',
	sort				  TINYINT UNSIGNED  	    NOT NULL	DEFAULT 0   COMMENT '优先级',
	create_time           DATETIME             		NOT NULL                COMMENT '创建时间',
	update_time           DATETIME                 		NULL                COMMENT '修改时间',
	PRIMARY KEY (module_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

