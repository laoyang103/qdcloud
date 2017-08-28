
use lab_db;

DROP TABLE IF EXISTS lab_experiment;
CREATE TABLE lab_experiment(
	experiment_id    		  BIGINT UNSIGNED      		NOT NULL AUTO_INCREMENT COMMENT '实验id',
	experiment_code  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '实验编号',
	experiment_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '实验名称',
	type_id  		          BIGINT UNSIGNED      		NOT NULL    DEFAULT 0   COMMENT '类型id',
	type_name  		          VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '实验类型',
	student_type  		      VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '实验者类别',
	person_count  		      TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '每组人数',
	study_time  		      TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '计划学时',
	experiment_book  	      VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '实验教程',
	check_type  	          VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '考核方式',
	experiment_count  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '实验设备及数量',
	remark                    text(1000)         	    NOT NULL 	DEFAULT ''  COMMENT '实验描述',
	require_content           VARCHAR(1000)         	NOT NULL 	DEFAULT ''  COMMENT '目的与要求',
	file_name  	              VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '实验名称',
	file_url  	              VARCHAR(300)         		NOT NULL 	DEFAULT ''  COMMENT '实验url',
	file_size  	              TINYINT UNSIGNED          NOT NULL    DEFAULT 0   COMMENT '实验大小',
	file_name2  	          VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '教学计划名称',
	file_url2  	              VARCHAR(300)         		NOT NULL 	DEFAULT ''  COMMENT '教学计划url',
	file_name3  	          VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '教学帮助',
	file_url3  	              VARCHAR(300)         		NOT NULL 	DEFAULT ''  COMMENT '教学帮助url',
	state                     TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '删除状态[0:停用, 1:启用 2：正常]',
    operator   	 	          VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '操作人',
	create_time               DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time               DATETIME                      NULL                COMMENT '修改时间',
	PRIMARY KEY (experiment_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验表';


DROP TABLE IF EXISTS lab_experiment_type;
CREATE TABLE lab_experiment_type(
	type_id    		  BIGINT UNSIGNED      		NOT NULL AUTO_INCREMENT COMMENT '实验id',
	type_name  		  VARCHAR(50)         		NOT NULL 	DEFAULT ''  COMMENT '实验类型名称',
	state             TINYINT UNSIGNED          NOT NULL    DEFAULT 1   COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	  VARCHAR(32)           	NOT NULL 	DEFAULT ''  COMMENT '操作人',
	create_time       DATETIME                  NOT NULL                COMMENT '创建时间',
    update_time       DATETIME                      NULL                COMMENT '修改时间',
	PRIMARY KEY (type_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验类型表';

