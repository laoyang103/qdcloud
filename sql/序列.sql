use wms_db;

DROP TABLE IF EXISTS seq;
CREATE TABLE seq(
    name		         VARCHAR(32)           	   NOT NULL 	DEFAULT '' COMMENT '序列名称',
	start_with         	 BIGINT UNSIGNED           NOT NULL 	DEFAULT 1  COMMENT '序列起始值',
	curr_value         	 BIGINT UNSIGNED           NOT NULL 	DEFAULT 0  COMMENT '当前值',
	next_step	   	 	 INTEGER UNSIGNED          NOT NULL 	DEFAULT 1  COMMENT '增长的长度',
	PRIMARY KEY(name)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主键序列表';

set global log_bin_trust_function_creators=TRUE;

DROP FUNCTION IF EXISTS nextval;
DELIMITER $
CREATE FUNCTION nextval(seq_name VARCHAR(100)) RETURNS BIGINT CONTAINS SQL
BEGIN
	DECLARE seq_curr_value BIGINT;
	DECLARE seq_next_step INT(4);
	SELECT curr_value, next_step INTO seq_curr_value, seq_next_step FROM seq where name = seq_name FOR UPDATE;
	SET seq_curr_value = seq_curr_value + seq_next_step;
	UPDATE seq SET curr_value = seq_curr_value where name = seq_name;
	RETURN seq_curr_value;
END$
DELIMITER ;

DROP FUNCTION IF EXISTS nextval_string;
DELIMITER $
CREATE FUNCTION nextval_string(seq_name VARCHAR(64), seq_prefix VARCHAR(32), seq_length INT(4)) RETURNS VARCHAR(255) CONTAINS SQL
BEGIN
	DECLARE seq_curr_value BIGINT;
	DECLARE seq_next_step INT(4);
	DECLARE seq_curr_value_string VARCHAR(255);
	DECLARE temp VARCHAR(32);
	SELECT curr_value, next_step INTO seq_curr_value, seq_next_step FROM seq where name = seq_name FOR UPDATE;
	SET seq_curr_value = seq_curr_value + seq_next_step;
	UPDATE seq SET curr_value = seq_curr_value where name = seq_name;
	SET temp = CONCAT('0', seq_curr_value);
	IF (LENGTH(temp) > seq_length) THEN
		SET temp = CONCAT('', seq_curr_value);
	END IF;
	SET seq_curr_value_string = CONCAT(seq_prefix, temp);
	RETURN seq_curr_value_string;
END$
DELIMITER ;