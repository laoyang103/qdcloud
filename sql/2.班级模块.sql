
use lab_db;

DROP TABLE IF EXISTS lab_class;
CREATE TABLE lab_class (
    class_id         BIGINT UNSIGNED           NOT NULL AUTO_INCREMENT COMMENT '班级ID',
	class_code       VARCHAR(20)           	   NOT NULL 	DEFAULT '' COMMENT '班级编号',
    class_name       VARCHAR(50)           	   NOT NULL 	DEFAULT '' COMMENT '班级名称',
	department_id    BIGINT UNSIGNED           NOT NULL     DEFAULT 0  COMMENT '院系ID',
	department_name  VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '院系名称',		
	state            TINYINT UNSIGNED          NOT NULL     DEFAULT 1  COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	 VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '操作人',
	create_time      DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time      DATETIME                      NULL                COMMENT '修改时间',
    PRIMARY KEY (class_id)		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级表';


DROP TABLE IF EXISTS lab_department;
CREATE TABLE lab_department (
    department_id         BIGINT UNSIGNED           NOT NULL AUTO_INCREMENT COMMENT '院系ID',
	department_code       VARCHAR(20)           	   NOT NULL 	DEFAULT '' COMMENT '院系编号',
    department_name       VARCHAR(50)           	   NOT NULL 	DEFAULT '' COMMENT '院系名称',
	state            TINYINT UNSIGNED          NOT NULL     DEFAULT 1  COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	 VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '操作人',
	create_time      DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time      DATETIME                      NULL                COMMENT '修改时间',
    PRIMARY KEY (department_id)		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='院系表';

