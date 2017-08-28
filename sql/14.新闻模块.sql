
use lab_db;

DROP TABLE IF EXISTS lab_news;
CREATE TABLE lab_news (
    id                BIGINT UNSIGNED              NOT NULL AUTO_INCREMENT   COMMENT 'ID',
    title             VARCHAR(100)           	   NOT NULL 	DEFAULT ''   COMMENT '标题',
	source            VARCHAR(50)           	   NOT NULL 	DEFAULT ''   COMMENT '来源',
	keyword           VARCHAR(50)           	   NOT NULL 	DEFAULT ''   COMMENT '关键字',
	abstractTitle     VARCHAR(100)           	   NOT NULL 	DEFAULT ''   COMMENT '摘要',
	content           Text           	               NULL 	DEFAULT ''   COMMENT '内容',
	flag              TINYINT UNSIGNED             NOT NULL     DEFAULT 1    COMMENT '类别[1:科研成果, 2:科研项目]',
	state             TINYINT UNSIGNED             NOT NULL     DEFAULT 1    COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	  VARCHAR(32)           	   NOT NULL 	DEFAULT ''   COMMENT '操作人',
	create_time       DATETIME                     NOT NULL                  COMMENT '创建时间',
    update_time       DATETIME                      NULL                     COMMENT '修改时间',
    PRIMARY KEY (id)		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻表';


