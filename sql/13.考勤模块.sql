
use lab_db;

DROP TABLE IF EXISTS lab_check_work;
CREATE TABLE lab_check_work (
    check_id          BIGINT UNSIGNED              NOT NULL AUTO_INCREMENT COMMENT '考勤ID',
	user_id           BIGINT UNSIGNED              NOT NULL                COMMENT '学生ID',
    user_name         VARCHAR(50)           	   NOT NULL 	DEFAULT '' COMMENT '学生名称',
	course_id    	  BIGINT UNSIGNED      		   NOT NULL    DEFAULT 0   COMMENT '课程id',
	state             TINYINT UNSIGNED             NOT NULL     DEFAULT 1  COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	  VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '操作人',
	create_time       DATETIME                     NOT NULL                COMMENT '创建时间',
    update_time       DATETIME                      NULL                COMMENT '修改时间',
    PRIMARY KEY (check_id)		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤表';


