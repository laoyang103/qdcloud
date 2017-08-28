
use lab_db;

DROP TABLE IF EXISTS lab_module_role;
CREATE TABLE lab_module_role(
	module_role_id     	BIGINT  UNSIGNED     		NOT NULL AUTO_INCREMENT COMMENT '模块角色id',
    module_id     		INT     UNSIGNED     		NOT NULL	DEFAULT 1   COMMENT '模块id',
    role_id      		TINYINT UNSIGNED     		NOT NULL	DEFAULT 1   COMMENT '角色id ',
    state        		TINYINT UNSIGNED     		NOT NULL    DEFAULT 0   COMMENT '0-使用  1-停用',
    create_time         DATETIME             		NOT NULL                COMMENT '创建时间',
    update_time         DATETIME                 		NULL                COMMENT '修改时间',
  PRIMARY KEY (module_role_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色模块映射表';

