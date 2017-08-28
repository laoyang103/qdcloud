
use lab_db;

DROP TABLE IF EXISTS lab_index_photo;
CREATE TABLE lab_index_photo (
    id                BIGINT UNSIGNED              NOT NULL AUTO_INCREMENT COMMENT 'ID',
    photo_title       VARCHAR(50)           	   NOT NULL 	DEFAULT '' COMMENT '图片标题',
	photo_src         VARCHAR(150)           	   NOT NULL 	DEFAULT '' COMMENT '图片路径',
	photo_link        VARCHAR(150)           	   NOT NULL 	DEFAULT '' COMMENT '图片连接',
	photo_type        TINYINT UNSIGNED             NOT NULL     DEFAULT 1  COMMENT '图片类型[0:成果, 1:轮播]',
	state             TINYINT UNSIGNED             NOT NULL     DEFAULT 1  COMMENT '删除状态[0:停用, 1:启用]',
    operator   	 	  VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '操作人',
	create_time       DATETIME                     NOT NULL                COMMENT '创建时间',
    update_time       DATETIME                      NULL                COMMENT '修改时间',
    PRIMARY KEY (id)		
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页图片维护表';


