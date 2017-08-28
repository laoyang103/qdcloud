
use lab_db;

DROP TABLE IF EXISTS lab_role;
CREATE TABLE lab_role(
	role_id   			 BIGINT  UNSIGNED    	   NOT NULL     AUTO_INCREMENT   COMMENT '角色id',
	role_name 			 VARCHAR(35)          	   NOT NULL     DEFAULT ''  COMMENT '角色名称',
	role_description	 VARCHAR(255) 		       NOT NULL     DEFAULT ''  COMMENT '角色说明',
	state				 TINYINT UNSIGNED  	       NOT NULL		DEFAULT 0   COMMENT '0-启用   10-禁用',
	create_time          DATETIME                  NOT NULL                 COMMENT '创建时间',
    update_time          DATETIME                      NULL                 COMMENT '修改时间',
	version				 TINYINT UNSIGNED  	       NOT NULL		DEFAULT 0,
  PRIMARY KEY (role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

