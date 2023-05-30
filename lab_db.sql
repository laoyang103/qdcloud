/*
Navicat MySQL Data Transfer

Source Server         : 218.247.143.208
Source Server Version : 50630
Source Host           : 218.247.143.208:3306
Source Database       : lab_db

Target Server Type    : MYSQL
Target Server Version : 50630
File Encoding         : 65001

Date: 2017-08-31 09:55:20
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `lab_class`
-- ----------------------------
DROP TABLE IF EXISTS `lab_class`;
CREATE TABLE `lab_class` (
  `class_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '班级ID',
  `class_code` varchar(20) NOT NULL DEFAULT '' COMMENT '班级编号',
  `class_name` varchar(50) NOT NULL DEFAULT '' COMMENT '班级名称',
  `department_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '院系ID',
  `department_name` varchar(32) NOT NULL DEFAULT '' COMMENT '院系名称',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='班级表';

-- ----------------------------
-- Records of lab_class
-- ----------------------------
INSERT INTO `lab_class` VALUES ('8', '01', '计算机16', '0', '计算机', '1', '', '2017-04-19 09:52:09', '2017-04-19 09:52:09');
INSERT INTO `lab_class` VALUES ('9', '02', '高三三班', '0', '化学', '1', '', '2017-08-18 10:43:00', '2017-08-18 10:43:00');

-- ----------------------------
-- Table structure for `lab_course`
-- ----------------------------
DROP TABLE IF EXISTS `lab_course`;
CREATE TABLE `lab_course` (
  `course_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `course_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '课程名称',
  `experiment_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '实验id',
  `experiment_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验名称',
  `example_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '习题id',
  `example_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '习题名称',
  `example_content` text COLLATE utf8_bin NOT NULL COMMENT '习题内容',
  `time_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '预约时间id',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `class_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '班级id',
  `class_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '班级名称',
  `room_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '教室id',
  `room_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '教室名称',
  `place_count` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '课位数量',
  `place_ok_count` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '已预约课位数量',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:未开始 20:执行中 30:已完成]',
  `teacher_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '教师id',
  `teacher_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '教师名称',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '教师名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='课程表';

-- ----------------------------
-- Records of lab_course
-- ----------------------------
INSERT INTO `lab_course` VALUES ('11', '2d仿真虚拟实验—WiFi温湿度传感器读取实验', '8', '物联网虚拟仿真实验', '5', '物联网虚拟仿真实验题1', 0xE6A188E4BE8B3120E6B8A9E5AEA4E5AEA4E58685E58589E785A7E5BAA6E79A84E8BF9CE7A88BE79B91E68EA7E68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3220E6B8A9E5AEA4E5AEA4E58685E6B8A9E6B9BFE5BAA6E79A84E8BF9CE7A88BE79B91E68EA7E68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3320E5A4A7E6B094E78EAFE5A283E79A84E7BBBCE59088E79B91E6B58BE7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3420E5AEB6E5B185E7839FE99BBEE79A84E8BF9CE7A88BE68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3520E5AEB6E5B185E4BABAE4BD93E6849FE5BA94E79A84E8BF9CE7A88BE68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3620E5AEB6E5B185E79A84E699BAE883BDE997A8E7A681E68EA7E588B6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3720E4BB93E582A8E79A84E781ABE781BEE9A284E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3820E8B685E5B882E79A84E4BABAE4BD93E6849FE5BA94E5AEA2E6B581E4BCB0E7AE97E7B3BBE7BB9F266C743B6272202F2667743B262378613B266C743B6272202F2667743B, '388', '2017-04-24 19:00:00', '2017-04-24 19:50:00', '0', '班级1', '6', '物联网工程实验室', '30', '1', '1', '38', '刘萍', '', '2017-04-19 14:34:10', '2017-04-21 15:00:47');
INSERT INTO `lab_course` VALUES ('12', '3d智慧农业虚拟实验—光照数据采集实验', '9', '物联网智慧农业3d虚拟仿真实验', '6', '物联网智慧农业3d虚拟仿真实验习题', 0x266C743B7020636C6173733D2671756F743B7265616465722D776F72642D6C61796572207265616465722D776F72642D73352D31342671756F743B207374796C653D2671756F743B636F6C6F723A233030303030303B666F6E742D66616D696C793AE5AE8BE4BD932C2026616D703B71756F743B666F6E742D73697A653A31383570783B666F6E742D7374796C653A6E6F726D616C3B666F6E742D7765696768743A6E6F726D616C3B746578742D616C69676E3A73746172743B746578742D696E64656E743A3070783B6261636B67726F756E642D636F6C6F723A234646464646463B2671756F743B2667743B262378613B09E9809AE8BF87E8999AE68B9FE5AE9EE9AA8CE588A9E794A8E59084E7B1BBE4BCA0E6849FE599A8E98787E99B86E6B8A9E5AEA4E58685E58589E785A7E38081E6B8A9E5BAA6E38081E6B9BFE5BAA6E38081E59C9FE5A3A4E6B8A9E6B9BFE5BAA6E38081E4BA8CE6B0A7E58C96E7A2B3E7AD89E4BD9CE789A9E7949FE995BFE79A84E78EAFE5A283E59BA0E5AD90E695B0E68DAEEFBC8CE8BF9BE8A18CE695B0E68DAEE79A84E5AD98E582A8E38081E58886E69E90E5928CE5AFB9E6AF94E7B3BBE7BB9FE8AEBEE5AE9AE79A84E695B0E68DAEE99888E580BCE38081E4BB8EE8808CE6ADA3E7A1AEE68EA7E588B6E6B8A9E5AEA4E79A84E7AA97E5B898E38081E9809AE9A38EE38081E7A9BAE8B083E7AD89E8AEBEE5A487EFBC8CE4BDBFE6B8A9E5AEA4E78EAFE5A283E4BF9DE68C81E59CA8E98082E5AE9CE4BD9CE789A9E7949FE995BFE79A84E69DA1E4BBB6EFBC8CE4BDBFE5ADA6E7949FE59CA8E8AEA1E7AE97E69CBAE4B88AE7A78DE6A48DE8999AE68B9FE4BD9CE789A9E5928CE8BF9BE8A18CE8999AE68B9FE5869CE794B0E7AEA1E79086EFBC8CE4BA86E8A7A3E6A48DE789A9E7949FE995BFE8BF87E7A88BEFBC8CE79BB4E8A782E79A84E8A782E5AF9FE4BD9CE789A9E7949FE995BFE78AB6E586B5E79A84E58AA8E68081E8BF87E7A88BE58F8AE69C80E7BB88E7BB93E69E9CE38082262378613B266C743B2F702667743B, '389', '2017-04-21 15:45:00', '2017-04-24 20:50:00', '0', '班级1', '6', '物联网工程实验室', '30', '1', '20', '38', '刘萍', '', '2017-04-19 14:34:10', '2017-04-21 15:00:52');
INSERT INTO `lab_course` VALUES ('13', '3d智慧农业虚拟实验—光照数据采集实验', '9', '物联网智慧农业3d虚拟仿真实验', '6', '物联网智慧农业3d虚拟仿真实验习题', 0x266C743B7020636C6173733D2671756F743B7265616465722D776F72642D6C61796572207265616465722D776F72642D73352D31342671756F743B207374796C653D2671756F743B636F6C6F723A233030303030303B666F6E742D66616D696C793AE5AE8BE4BD932C2026616D703B71756F743B666F6E742D73697A653A31383570783B666F6E742D7374796C653A6E6F726D616C3B666F6E742D7765696768743A6E6F726D616C3B746578742D616C69676E3A73746172743B746578742D696E64656E743A3070783B6261636B67726F756E642D636F6C6F723A234646464646463B2671756F743B2667743B262378613B09E9809AE8BF87E8999AE68B9FE5AE9EE9AA8CE588A9E794A8E59084E7B1BBE4BCA0E6849FE599A8E98787E99B86E6B8A9E5AEA4E58685E58589E785A7E38081E6B8A9E5BAA6E38081E6B9BFE5BAA6E38081E59C9FE5A3A4E6B8A9E6B9BFE5BAA6E38081E4BA8CE6B0A7E58C96E7A2B3E7AD89E4BD9CE789A9E7949FE995BFE79A84E78EAFE5A283E59BA0E5AD90E695B0E68DAEEFBC8CE8BF9BE8A18CE695B0E68DAEE79A84E5AD98E582A8E38081E58886E69E90E5928CE5AFB9E6AF94E7B3BBE7BB9FE8AEBEE5AE9AE79A84E695B0E68DAEE99888E580BCE38081E4BB8EE8808CE6ADA3E7A1AEE68EA7E588B6E6B8A9E5AEA4E79A84E7AA97E5B898E38081E9809AE9A38EE38081E7A9BAE8B083E7AD89E8AEBEE5A487EFBC8CE4BDBFE6B8A9E5AEA4E78EAFE5A283E4BF9DE68C81E59CA8E98082E5AE9CE4BD9CE789A9E7949FE995BFE79A84E69DA1E4BBB6EFBC8CE4BDBFE5ADA6E7949FE59CA8E8AEA1E7AE97E69CBAE4B88AE7A78DE6A48DE8999AE68B9FE4BD9CE789A9E5928CE8BF9BE8A18CE8999AE68B9FE5869CE794B0E7AEA1E79086EFBC8CE4BA86E8A7A3E6A48DE789A9E7949FE995BFE8BF87E7A88BEFBC8CE79BB4E8A782E79A84E8A782E5AF9FE4BD9CE789A9E7949FE995BFE78AB6E586B5E79A84E58AA8E68081E8BF87E7A88BE58F8AE69C80E7BB88E7BB93E69E9CE38082262378613B266C743B2F702667743B, '389', '2017-04-24 20:00:00', '2017-04-24 20:50:00', '0', '班级1', '6', '物联网工程实验室', '30', '0', '1', '38', '刘萍', '', '2017-04-19 14:34:10', '2017-04-21 15:00:52');
INSERT INTO `lab_course` VALUES ('14', '温室室内光照度的远程监控报警实验', '8', '物联网虚拟仿真实验', '5', '物联网虚拟仿真实验题1', 0xE6A188E4BE8B3120E6B8A9E5AEA4E5AEA4E58685E58589E785A7E5BAA6E79A84E8BF9CE7A88BE79B91E68EA7E68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3220E6B8A9E5AEA4E5AEA4E58685E6B8A9E6B9BFE5BAA6E79A84E8BF9CE7A88BE79B91E68EA7E68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3320E5A4A7E6B094E78EAFE5A283E79A84E7BBBCE59088E79B91E6B58BE7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3420E5AEB6E5B185E7839FE99BBEE79A84E8BF9CE7A88BE68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3520E5AEB6E5B185E4BABAE4BD93E6849FE5BA94E79A84E8BF9CE7A88BE68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3620E5AEB6E5B185E79A84E699BAE883BDE997A8E7A681E68EA7E588B6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3720E4BB93E582A8E79A84E781ABE781BEE9A284E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3820E8B685E5B882E79A84E4BABAE4BD93E6849FE5BA94E5AEA2E6B581E4BCB0E7AE97E7B3BBE7BB9F266C743B6272202F2667743B262378613B266C743B6272202F2667743B, '415', '2017-05-13 15:00:00', '2017-05-13 15:50:00', '0', '班级1', '6', '物联网工程实验室', '30', '1', '1', '38', '刘萍', '', '2017-05-10 15:25:04', '2017-05-10 15:25:42');
INSERT INTO `lab_course` VALUES ('15', 'XXXXXX', '8', '物联网虚拟仿真实验', '5', '物联网虚拟仿真实验题1', 0xE6A188E4BE8B3120E6B8A9E5AEA4E5AEA4E58685E58589E785A7E5BAA6E79A84E8BF9CE7A88BE79B91E68EA7E68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3220E6B8A9E5AEA4E5AEA4E58685E6B8A9E6B9BFE5BAA6E79A84E8BF9CE7A88BE79B91E68EA7E68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3320E5A4A7E6B094E78EAFE5A283E79A84E7BBBCE59088E79B91E6B58BE7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3420E5AEB6E5B185E7839FE99BBEE79A84E8BF9CE7A88BE68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3520E5AEB6E5B185E4BABAE4BD93E6849FE5BA94E79A84E8BF9CE7A88BE68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3620E5AEB6E5B185E79A84E699BAE883BDE997A8E7A681E68EA7E588B6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3720E4BB93E582A8E79A84E781ABE781BEE9A284E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3820E8B685E5B882E79A84E4BABAE4BD93E6849FE5BA94E5AEA2E6B581E4BCB0E7AE97E7B3BBE7BB9F266C743B6272202F2667743B262378613B266C743B6272202F2667743B, '408', '2017-05-15 21:00:00', '2017-05-15 21:50:00', '0', '班级1', '6', '物联网工程实验室', '30', '1', '1', '38', '刘萍', '', '2017-05-10 15:17:39', '2017-05-10 16:08:50');

-- ----------------------------
-- Table structure for `lab_course_order`
-- ----------------------------
DROP TABLE IF EXISTS `lab_course_order`;
CREATE TABLE `lab_course_order` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '预约id',
  `course_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '课程id',
  `class_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '班级id',
  `student_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '学生名称',
  `remark` varchar(500) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '备注',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `check_work` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '考勤状态[0:未签到, 1:已签到]',
  `work_state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '上课状态[0:未上课, 1:已上课]',
  `operator_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人id',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `time_id` bigint(20) DEFAULT '0' COMMENT '预约时间id',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='学生预约课程表';

-- ----------------------------
-- Records of lab_course_order
-- ----------------------------
INSERT INTO `lab_course_order` VALUES ('67', '10', '8', '37', '张涛', '', '1', '0', '0', '37', 'xuesheng', '2017-04-21 14:31:43', null, '378');
INSERT INTO `lab_course_order` VALUES ('68', '12', '8', '37', '张涛', '', '1', '1', '0', '37', 'xuesheng', '2017-04-21 15:08:12', '2017-04-21 15:30:58', '389');
INSERT INTO `lab_course_order` VALUES ('69', '11', '8', '37', '张涛', '', '1', '0', '0', '37', 'xuesheng', '2017-04-22 10:33:08', null, '388');
INSERT INTO `lab_course_order` VALUES ('70', '14', '8', '37', '张涛', '', '1', '0', '0', '37', 'xuesheng', '2017-05-10 15:27:49', null, '415');
INSERT INTO `lab_course_order` VALUES ('71', '15', '8', '37', '张涛', '', '1', '0', '0', '37', 'xuesheng', '2017-05-10 16:09:37', null, '408');

-- ----------------------------
-- Table structure for `lab_course_student`
-- ----------------------------
DROP TABLE IF EXISTS `lab_course_student`;
CREATE TABLE `lab_course_student` (
  `course_student_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程选择学生id',
  `course_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '课程id',
  `course_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '课程名称',
  `student_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '学生名称',
  `example_content` text COLLATE utf8_bin NOT NULL COMMENT '已做习题内容',
  `example_flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '习题学生已做[0:未做, 1:已做]',
  `example_checked` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '习题是否批改[0:未批改, 1:已批改]',
  `example_score` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '习题评分',
  `example_comment` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '习题评语',
  `experiment_report` varchar(1000) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '学生实验报告',
  `experiment_flag` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '习题学生已做[0:未做, 1:已做]',
  `experiment_checked` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '报告是否批改[0:未批改, 1:已批改]',
  `experiment_score` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '报告评分',
  `experiment_comment` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '报告评语',
  `begin_time` datetime NOT NULL COMMENT '开始答题时间',
  `end_time` datetime NOT NULL COMMENT '结束答题时间',
  `example_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '作业状态[0:停用, 1:未开始 20:执行中 30:已完成]',
  `experiment_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '报告状态[0:停用, 1:未开始 20:执行中 30:已完成]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `time_id` bigint(20) DEFAULT '0' COMMENT '预约时间id',
  PRIMARY KEY (`course_student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='课程学生表';

-- ----------------------------
-- Records of lab_course_student
-- ----------------------------
INSERT INTO `lab_course_student` VALUES ('17', '12', '3d智慧农业虚拟实验—光照数据采集实验', '37', '张涛', '', '0', '0', '0', '', '智能温室的建设引入集物联网、计算机科学、信息处理、控制工程、农业生物学、环境科学等于一体的多元化综合性技术和自动化控制设备，通过传感器实时采集、监测和分析温室内温度湿度、光照强度、土壤水分、二氧化碳等影响作物生长的环境信息，建立温室智能化管理系统，调整温室大棚内生长因子达到作物最佳生长状态，提高作物品质，增加作物产量。实现农业集约、高产、优质、高效、生态、安全的重要支撑，进一步加速农业向现代集约型、智能型农业的转变，有效提升农业产业化经营和管理的水平。同时也为农业和农村经济转型、社会发展提供“智慧”支撑。 智慧农业是农业生产的高级阶段，是集新兴的互联网、移动互联、云计算和物联网技术为一体，依托部署在农业生产现场的各种传感节点（环境温湿度、土壤水分、二氧化碳、图像等）和无线通信网络实现农业生产环境的智能感知、智能预警、智能决策、智能分析、专家在线指导，为农业生产提供精准化种植、可视化管理、智能化决策。', '1', '1', '88', '该生有很多优秀的品质，遵守纪律，热爱班集体，好爱学习，讲卫生，认真做好每一节课的笔记，课堂上听讲专注!学习上，学习刻苦，遇到不懂的问题能不断地向老师请教，有时也较固执。望能进一步完善自我，力争成为一名全面发展的人才', '2017-04-21 15:38:17', '2017-04-24 20:50:00', '20', '30', '', '2017-04-21 15:30:58', '2017-04-21 15:51:08', '389');

-- ----------------------------
-- Table structure for `lab_course_student_station`
-- ----------------------------
DROP TABLE IF EXISTS `lab_course_student_station`;
CREATE TABLE `lab_course_student_station` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '学生预约id',
  `station_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '课位id',
  `time_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '预约时间id',
  `student_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '学生名称',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '当前状态[0:停用, 1:启用]',
  `operator_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '操作人id',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=399 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='学生预约课位表';

-- ----------------------------
-- Records of lab_course_student_station
-- ----------------------------
INSERT INTO `lab_course_student_station` VALUES ('129', '259', '396', '37', '张涛', '0', '37', 'xuesheng', '2017-04-19 14:46:06', '2017-04-20 22:15:33');
INSERT INTO `lab_course_student_station` VALUES ('130', '260', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('131', '261', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('132', '262', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('133', '263', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('134', '264', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('135', '265', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('136', '266', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('137', '267', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('138', '268', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('139', '269', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('140', '270', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('141', '271', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('142', '272', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('143', '273', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('144', '274', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('145', '275', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('146', '276', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('147', '277', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('148', '278', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('149', '279', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('150', '280', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('151', '281', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('152', '282', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('153', '283', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('154', '284', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('155', '285', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('156', '286', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('157', '287', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('158', '288', '396', '0', '', '1', '0', '', '2017-04-19 14:46:06', null);
INSERT INTO `lab_course_student_station` VALUES ('159', '259', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('160', '260', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('161', '261', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('162', '262', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('163', '263', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('164', '264', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('165', '265', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('166', '266', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('167', '267', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('168', '268', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('169', '269', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('170', '270', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('171', '271', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('172', '272', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('173', '273', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('174', '274', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('175', '275', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('176', '276', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('177', '277', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('178', '278', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('179', '279', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('180', '280', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('181', '281', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('182', '282', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('183', '283', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('184', '284', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('185', '285', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('186', '286', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('187', '287', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('188', '288', '394', '0', '', '1', '0', '', '2017-04-19 14:46:16', null);
INSERT INTO `lab_course_student_station` VALUES ('189', '259', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('190', '260', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('191', '261', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('192', '262', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('193', '263', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('194', '264', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('195', '265', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('196', '266', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('197', '267', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('198', '268', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('199', '269', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('200', '270', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('201', '271', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('202', '272', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('203', '273', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('204', '274', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('205', '275', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('206', '276', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('207', '277', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('208', '278', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('209', '279', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('210', '280', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('211', '281', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('212', '282', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('213', '283', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('214', '284', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('215', '285', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('216', '286', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('217', '287', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('218', '288', '397', '0', '', '1', '0', '', '2017-04-19 14:46:24', null);
INSERT INTO `lab_course_student_station` VALUES ('219', '259', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('220', '260', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('221', '261', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('222', '262', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('223', '263', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('224', '264', '363', '37', '张涛', '1', '37', 'xuesheng', '2017-04-19 14:46:32', '2017-04-21 11:10:58');
INSERT INTO `lab_course_student_station` VALUES ('225', '265', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('226', '266', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('227', '267', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('228', '268', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('229', '269', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('230', '270', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('231', '271', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('232', '272', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('233', '273', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('234', '274', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('235', '275', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('236', '276', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('237', '277', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('238', '278', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('239', '279', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('240', '280', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('241', '281', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('242', '282', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('243', '283', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('244', '284', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('245', '285', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('246', '286', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('247', '287', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('248', '288', '363', '0', '', '1', '0', '', '2017-04-19 14:46:32', null);
INSERT INTO `lab_course_student_station` VALUES ('279', '259', '388', '37', '张涛', '1', '37', 'xuesheng', '2017-04-21 15:00:48', '2017-04-22 10:33:08');
INSERT INTO `lab_course_student_station` VALUES ('280', '260', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('281', '261', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('282', '262', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('283', '263', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('284', '264', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('285', '265', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('286', '266', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('287', '267', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('288', '268', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('289', '269', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('290', '270', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('291', '271', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('292', '272', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('293', '273', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('294', '274', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('295', '275', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('296', '276', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('297', '277', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('298', '278', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('299', '279', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('300', '280', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('301', '281', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('302', '282', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('303', '283', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('304', '284', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('305', '285', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('306', '286', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('307', '287', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('308', '288', '388', '0', '', '1', '0', '', '2017-04-21 15:00:48', null);
INSERT INTO `lab_course_student_station` VALUES ('309', '259', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('310', '260', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('311', '261', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('312', '262', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('313', '263', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('314', '264', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('315', '265', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('316', '266', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('317', '267', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('318', '268', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('319', '269', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('320', '270', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('321', '271', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('322', '272', '389', '37', '张涛', '0', '37', 'xuesheng', '2017-04-21 15:00:53', '2017-04-21 15:08:12');
INSERT INTO `lab_course_student_station` VALUES ('323', '273', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('324', '274', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('325', '275', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('326', '276', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('327', '277', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('328', '278', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('329', '279', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('330', '280', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('331', '281', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('332', '282', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('333', '283', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('334', '284', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('335', '285', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('336', '286', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('337', '287', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('338', '288', '389', '0', '', '1', '0', '', '2017-04-21 15:00:53', null);
INSERT INTO `lab_course_student_station` VALUES ('339', '259', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('340', '260', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('341', '261', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('342', '262', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('343', '263', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('344', '264', '415', '37', '张涛', '1', '37', 'xuesheng', '2017-05-10 15:25:43', '2017-05-10 15:27:49');
INSERT INTO `lab_course_student_station` VALUES ('345', '265', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('346', '266', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('347', '267', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('348', '268', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('349', '269', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('350', '270', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('351', '271', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('352', '272', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('353', '273', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('354', '274', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('355', '275', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('356', '276', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('357', '277', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('358', '278', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('359', '279', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('360', '280', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('361', '281', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('362', '282', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('363', '283', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('364', '284', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('365', '285', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('366', '286', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('367', '287', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('368', '288', '415', '0', '', '1', '0', '', '2017-05-10 15:25:43', null);
INSERT INTO `lab_course_student_station` VALUES ('369', '259', '408', '37', '张涛', '1', '37', 'xuesheng', '2017-05-10 16:08:50', '2017-05-10 16:09:37');
INSERT INTO `lab_course_student_station` VALUES ('370', '260', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('371', '261', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('372', '262', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('373', '263', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('374', '264', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('375', '265', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('376', '266', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('377', '267', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('378', '268', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('379', '269', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('380', '270', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('381', '271', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('382', '272', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('383', '273', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('384', '274', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('385', '275', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('386', '276', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('387', '277', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('388', '278', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('389', '279', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('390', '280', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('391', '281', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('392', '282', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('393', '283', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('394', '284', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('395', '285', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('396', '286', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('397', '287', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);
INSERT INTO `lab_course_student_station` VALUES ('398', '288', '408', '0', '', '1', '0', '', '2017-05-10 16:08:50', null);

-- ----------------------------
-- Table structure for `lab_department`
-- ----------------------------
DROP TABLE IF EXISTS `lab_department`;
CREATE TABLE `lab_department` (
  `department_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '院系ID',
  `department_code` varchar(20) NOT NULL DEFAULT '' COMMENT '院系编号',
  `department_name` varchar(50) NOT NULL DEFAULT '' COMMENT '院系名称',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='院系表';

-- ----------------------------
-- Records of lab_department
-- ----------------------------

-- ----------------------------
-- Table structure for `lab_discuss`
-- ----------------------------
DROP TABLE IF EXISTS `lab_discuss`;
CREATE TABLE `lab_discuss` (
  `discuss_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '讨论id',
  `discuss_title` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '讨论标题',
  `discuss_group_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '讨论组id',
  `discuss_group_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '讨论组',
  `discuss_content` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '讨论内容',
  `click_count` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '点击量',
  `reply_count` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '回复量',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人（作者）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`discuss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='讨论主表';

-- ----------------------------
-- Records of lab_discuss
-- ----------------------------

-- ----------------------------
-- Table structure for `lab_discuss_reply`
-- ----------------------------
DROP TABLE IF EXISTS `lab_discuss_reply`;
CREATE TABLE `lab_discuss_reply` (
  `reply_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '讨论回复id',
  `discuss_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '讨论id',
  `reply_content` varchar(1000) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '回复内容',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='讨论回复表';

-- ----------------------------
-- Records of lab_discuss_reply
-- ----------------------------

-- ----------------------------
-- Table structure for `lab_example`
-- ----------------------------
DROP TABLE IF EXISTS `lab_example`;
CREATE TABLE `lab_example` (
  `example_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '习题id',
  `example_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '习题名称',
  `example_content` text COLLATE utf8_bin NOT NULL COMMENT '习题内容',
  `example_use` varchar(500) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '习题用途',
  `looked` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否查看[0:未查看, 1:已查看]',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`example_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='习题表';

-- ----------------------------
-- Records of lab_example
-- ----------------------------
INSERT INTO `lab_example` VALUES ('5', '物联网虚拟仿真实验题1', 0xE6A188E4BE8B3120E6B8A9E5AEA4E5AEA4E58685E58589E785A7E5BAA6E79A84E8BF9CE7A88BE79B91E68EA7E68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3220E6B8A9E5AEA4E5AEA4E58685E6B8A9E6B9BFE5BAA6E79A84E8BF9CE7A88BE79B91E68EA7E68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3320E5A4A7E6B094E78EAFE5A283E79A84E7BBBCE59088E79B91E6B58BE7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3420E5AEB6E5B185E7839FE99BBEE79A84E8BF9CE7A88BE68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3520E5AEB6E5B185E4BABAE4BD93E6849FE5BA94E79A84E8BF9CE7A88BE68AA5E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3620E5AEB6E5B185E79A84E699BAE883BDE997A8E7A681E68EA7E588B6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3720E4BB93E582A8E79A84E781ABE781BEE9A284E8ADA6E7B3BBE7BB9FEFBC9B266C743B6272202F2667743B262378613BE6A188E4BE8B3820E8B685E5B882E79A84E4BABAE4BD93E6849FE5BA94E5AEA2E6B581E4BCB0E7AE97E7B3BBE7BB9F266C743B6272202F2667743B262378613B266C743B6272202F2667743B, '了解物联网网络构建和机制', '0', '1', 'jiaoshi', '2017-04-19 14:22:16', '2017-04-19 14:22:16');
INSERT INTO `lab_example` VALUES ('6', '物联网智慧农业3d虚拟仿真实验习题', 0x266C743B7020636C6173733D2671756F743B7265616465722D776F72642D6C61796572207265616465722D776F72642D73352D31342671756F743B207374796C653D2671756F743B636F6C6F723A233030303030303B666F6E742D66616D696C793AE5AE8BE4BD932C2026616D703B71756F743B666F6E742D73697A653A31383570783B666F6E742D7374796C653A6E6F726D616C3B666F6E742D7765696768743A6E6F726D616C3B746578742D616C69676E3A73746172743B746578742D696E64656E743A3070783B6261636B67726F756E642D636F6C6F723A234646464646463B2671756F743B2667743B262378613B09E9809AE8BF87E8999AE68B9FE5AE9EE9AA8CE588A9E794A8E59084E7B1BBE4BCA0E6849FE599A8E98787E99B86E6B8A9E5AEA4E58685E58589E785A7E38081E6B8A9E5BAA6E38081E6B9BFE5BAA6E38081E59C9FE5A3A4E6B8A9E6B9BFE5BAA6E38081E4BA8CE6B0A7E58C96E7A2B3E7AD89E4BD9CE789A9E7949FE995BFE79A84E78EAFE5A283E59BA0E5AD90E695B0E68DAEEFBC8CE8BF9BE8A18CE695B0E68DAEE79A84E5AD98E582A8E38081E58886E69E90E5928CE5AFB9E6AF94E7B3BBE7BB9FE8AEBEE5AE9AE79A84E695B0E68DAEE99888E580BCE38081E4BB8EE8808CE6ADA3E7A1AEE68EA7E588B6E6B8A9E5AEA4E79A84E7AA97E5B898E38081E9809AE9A38EE38081E7A9BAE8B083E7AD89E8AEBEE5A487EFBC8CE4BDBFE6B8A9E5AEA4E78EAFE5A283E4BF9DE68C81E59CA8E98082E5AE9CE4BD9CE789A9E7949FE995BFE79A84E69DA1E4BBB6EFBC8CE4BDBFE5ADA6E7949FE59CA8E8AEA1E7AE97E69CBAE4B88AE7A78DE6A48DE8999AE68B9FE4BD9CE789A9E5928CE8BF9BE8A18CE8999AE68B9FE5869CE794B0E7AEA1E79086EFBC8CE4BA86E8A7A3E6A48DE789A9E7949FE995BFE8BF87E7A88BEFBC8CE79BB4E8A782E79A84E8A782E5AF9FE4BD9CE789A9E7949FE995BFE78AB6E586B5E79A84E58AA8E68081E8BF87E7A88BE58F8AE69C80E7BB88E7BB93E69E9CE38082262378613B266C743B2F702667743B, '虚拟实验对智慧农业的影响与发展', '0', '1', 'jiaoshi', '2017-04-20 19:29:29', '2017-04-21 10:40:06');

-- ----------------------------
-- Table structure for `lab_experiment`
-- ----------------------------
DROP TABLE IF EXISTS `lab_experiment`;
CREATE TABLE `lab_experiment` (
  `experiment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '实验id',
  `experiment_code` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验编号',
  `experiment_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验名称',
  `type_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '类型id',
  `type_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验类型',
  `student_type` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验者类别',
  `person_count` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '每组人数',
  `study_time` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '计划学时',
  `experiment_book` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验教程',
  `check_type` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '考核方式',
  `experiment_count` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验设备及数量',
  `remark` text COLLATE utf8_bin NOT NULL COMMENT '实验描述',
  `require_content` varchar(1000) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '目的与要求',
  `file_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验名称',
  `file_url` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验url',
  `file_size` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '实验大小',
  `file_name2` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '教学计划名称',
  `file_url2` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '教学计划url',
  `file_name3` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '教学帮助',
  `file_url3` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '教学帮助url',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用 2：正常]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`experiment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验表';

-- ----------------------------
-- Records of lab_experiment
-- ----------------------------
INSERT INTO `lab_experiment` VALUES ('8', '208', '物联网虚拟仿真实验', '0', '', '', '0', '0', '', '', '', 0x266C743B7374726F6E672667743B28E4B88029E38081E59FBAE7A180E5AE9EE9AA8CE9A1B9E79BAEE5908DE7A7B0EFBC9A266C743B2F7374726F6E672667743B266C743B6272202F2667743B262378613BE5AE9EE9AA8C312057694669E6B8A9E6B9BFE5BAA6E4BCA0E6849FE599A8E8AFBBE58F96E5AE9EE9AA8CEFBC9B266C743B6272202F2667743B262378613B266C743B702667743B262378613B09E5AE9EE9AA8C322057694669E58589E785A7E4BCA0E6849FE599A8E8AFBBE58F96E5AE9EE9AA8CEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E5AE9EE9AA8C332057694669E7839FE99BBEE4BCA0E6849FE599A8E8AFBBE58F96E5AE9EE9AA8CEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E5AE9EE9AA8C342057694669E4BABAE4BD93E6A380E6B58BE4BCA0E6849FE599A8E8AFBBE58F96E5AE9EE9AA8CEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E5AE9EE9AA8C35205769466920504D322E35E4BCA0E6849FE599A8E8AFBBE58F96E5AE9EE9AA8CEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E5AE9EE9AA8C362057694669E89C82E9B8A3E599A8E68EA7E588B6E5AE9EE9AA8CEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E5AE9EE9AA8C372057694669E695B0E7A081E7AEA1E68EA7E588B6E5AE9EE9AA8CEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E5AE9EE9AA8C382057694669E79BB4E6B581E794B5E69CBAE68EA7E588B6E5AE9EE9AA8CEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E5AE9EE9AA8C392057694669E6ADA5E8BF9BE794B5E69CBAE68EA7E588B6E5AE9EE9AA8CEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E5AE9EE9AA8C3130205769466920E9AB98E9A29152464944E8AFBBE58DA1E5AE9EE9AA8CEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09266C743B7374726F6E672667743B28E4BA8C29E38081E7BBBCE59088E5AE9EE9AA8CE9A1B9E79BAEE5908DE7A7B0EFBC9A266C743B2F7374726F6E672667743B20262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E6A188E4BE8B3120E6B8A9E5AEA4E5AEA4E58685E58589E785A7E5BAA6E79A84E8BF9CE7A88BE79B91E68EA7E68AA5E8ADA6E7B3BBE7BB9FEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E6A188E4BE8B3220E6B8A9E5AEA4E5AEA4E58685E6B8A9E6B9BFE5BAA6E79A84E8BF9CE7A88BE79B91E68EA7E68AA5E8ADA6E7B3BBE7BB9FEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E6A188E4BE8B3320E5A4A7E6B094E78EAFE5A283E79A84E7BBBCE59088E79B91E6B58BE7B3BBE7BB9FEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E6A188E4BE8B3420E5AEB6E5B185E7839FE99BBEE79A84E8BF9CE7A88BE68AA5E8ADA6E7B3BBE7BB9FEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E6A188E4BE8B3520E5AEB6E5B185E4BABAE4BD93E6849FE5BA94E79A84E8BF9CE7A88BE68AA5E8ADA6E7B3BBE7BB9FEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E6A188E4BE8B3620E5AEB6E5B185E79A84E699BAE883BDE997A8E7A681E68EA7E588B6E7B3BBE7BB9FEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E6A188E4BE8B3720E4BB93E582A8E79A84E781ABE781BEE9A284E8ADA6E7B3BBE7BB9FEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E6A188E4BE8B3820E8B685E5B882E79A84E4BABAE4BD93E6849FE5BA94E5AEA2E6B581E4BCB0E7AE97E7B3BBE7BB9F262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09266C743B7374726F6E672667743B28E4B88929E38081E8999AE68B9FE4BBBFE79C9FE8AEBEE5A487E6B885E58D95EFBC9A266C743B2F7374726F6E672667743B20262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E58C85E590AB77696669504D322E35E4BCA0E6849FE88A82E782B9E3808157694669E695B0E7A081E7AEA1E8BE93E587BAE88A82E782B9E3808157694669E7AA97E5B898E68EA7E588B6E599A8E88A82E782B9E3808157694669E781AFE58589E89C82E9B8A3E599A8E68EA7E588B6E88A82E3808157694669E9A38EE68987E68EA7E588B6E88A82E782B9E3808157694669E58589E785A7E4BCA0E6849FE88A82E782B9E3808157694669E4BABAE4BD93E6849FE5BA94E88A82E782B9E3808157694669E6B8A9E6B9BFE5BAA6E4BCA0E6849FE88A82E782B9E3808157694669E7839FE99BBEE4BCA0E6849FE88A82E782B9E38081E4BD8EE9A29152464944E8AFBBE58DA1E599A8E38081E9AB98E9A29152464944E8AFBBE58DA1E599A8E38081E789B9E9AB98E9A29152464944E8AFBBE58DA1E599A8E38081322E344752464944E8AFBBE58DA1E599A8E5928CE5AE89E58D93E5B9B3E69DBFE7AD89EFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09266C743B7374726F6E672667743B28E59B9B29E38081E5AE9EE9AA8CE5B9B3E58FB0E58A9FE883BDEFBC9A266C743B2F7374726F6E672667743B20262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09E58FAFE4BBA5E4B88EE5AE9EE99985E5AE9EE9AA8CE8AEBEE5A487E695B0E68DAEE4BA92E9809AEFBC8CE8999AE68B9FE8AEBEE5A487E58FAFE9809AE8BF87536F636B6574E9809AE4BFA1E696B9E5BC8FE4B88E504144E993BEE68EA5EFBC8CE4BB8EE8808CE4B88EE5AE9EE789A9E7A1ACE4BBB6E88A82E782B9E79BB8E8BF9EEFBC8CE4B88EE5AE9EE789A9E7A1ACE4BBB6E8BEBEE588B0E695B0E68DAEE5908CE6ADA5E69588E69E9CEFBC8CE4BB8EE8808CE88EB7E58F96E79C9FE5AE9EE695B0E68DAEE38082262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09266C743B7374726F6E672667743B28E4BA9429E38081E6B8A9E5AEA4E5AEA4E58685E58589E785A7E5BAA6E79A84E8BF9CE7A88BE68AA5E8ADA6E7B3BBE7BB9FE6A188E4BE8B266C743B2F7374726F6E672667743B20262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B0931E38081E99C80E794A8E588B0E79A84E7A1ACE4BBB6E8AEBEE5A487262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B0957694669E9AB98E9A29152464944E88A82E782B9E3808157694669E58589E785A7E4BCA0E6849FE88A82E782B9E3808157694669E695B0E7A081E7AEA1E8BE93E587BAE88A82E782B9E3808157694669E781AFE58589E89C82E9B8A3E599A8E68EA7E588B6E88A82E782B9E3808157694669E7AA97E5B898E68EA7E588B6E88A82E782B9E38081E689A7E8A18CE88A82E782B9E38081416E64726F6964E5B9B3E69DBFEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B0932E38081E5AE9EE9AA8CE6ADA5E9AAA4EFBC9A262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B095374657031EFBC9AE59CA8E8BDAFE4BBB6E5B9B3E58FB0E7958CE99DA2E4B88AE68B96E68BBD57694669E9AB98E9A29152464944E88A82E782B9E4B880E4B8AAEFBC8CE68B96E68BBD3132563241E794B5E6BA90E98082E9858DE599A8E4B8BAE585B6E4B88AE794B5E38082E58F8CE587BB57694669E9AB98E9A29152464944E88A82E782B9E4B88AE79A8457694669E6A8A1E59D97EFBC8CE69FA5E79C8BE5B9B6E9858DE7BDAEE7BD91E7BB9CE4BFA1E681AFEFBC8CE5B086E585B6E9858DE7BDAEE68890E4B880E4B8AAE697A0E7BABF4150E782B9EFBC8CE4BAA7E7949FE4B880E4B8AA57694669E7BD91E7BB9CEFBC8CE8AEBEE7BDAE57694669E7BD91E7BB9CE79A84E5908DE7A7B0E4BBA5E58F8AE58AA0E5AF86E696B9E5BC8FE5928CE5AF86E7A081E38082262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B095374657032EFBC9AE59CA8E8BDAFE4BBB6E5B9B3E58FB0E7958CE99DA2E4B88AE68B96E68BBD57694669E58589E785A7E4BCA0E6849FE599A8E88A82E782B9E4B880E4B8AAEFBC8CE68B96E68BBD3132563241E794B5E6BA90E98082E9858DE599A8E4B8BAE585B6E4B88AE794B5E38082E58F8CE587BB57694669E58589E785A7E4BCA0E6849FE599A8E88A82E782B9E79A8457694669E6A8A1E59D97EFBC8CE69FA5E79C8BE5B9B6E9858DE7BDAEE585B6E7BD91E7BB9CE4BFA1E681AFEFBC8CE5B086E585B6E9858DE7BDAEE68890E68EA5E585A557694669E9AB98E9A29152464944E4BAA7E7949FE79A8477696669E7BD91E7BB9CEFBC8CE8BE93E585A5E6ADA3E7A1AEE79A84E7A798E992A5EFBC8CE4BBA5E58F8A4950E59CB0E59D80EFBC8CE8AEBEE7BDAEE68890E4B8BA544350E69C8DE58AA1E599A8EFBC8CE68C87E5AE9AE7ABAFE58FA3E58FB7EFBC8CE5B9B6E9858DE7BDAE4950E59CB0E59D80E38082262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B095374657033EFBC9AE59CA8E8BDAFE4BBB6E5B9B3E58FB0E7958CE99DA2E4B88AE68B96E68BBD57694669E695B0E7A081E7AEA1E8BE93E587BAE88A82E782B9E4B880E4B8AAEFBC8CE68B96E68BBD3132563241E794B5E6BA90E98082E9858DE599A8E4B8BAE585B6E4B88AE794B5E38082E58F8CE587BB57694669E695B0E7A081E7AEA1E8BE93E587BAE88A82E782B9E79A8457694669E6A8A1E59D97EFBC8CE69FA5E79C8BE5B9B6E9858DE7BDAEE585B6E7BD91E7BB9CE4BFA1E681AFEFBC8CE5B086E585B6E9858DE7BDAEE68890E68EA5E585A557694669E9AB98E9A29152464944E4BAA7E7949FE79A8477696669E7BD91E7BB9CEFBC8CE8BE93E585A5E6ADA3E7A1AEE79A84E7A798E992A5EFBC8CE4BBA5E58F8A4950E59CB0E59D80EFBC8CE8AEBEE7BDAEE68890E4B8BA544350E69C8DE58AA1E599A8EFBC8CE68C87E5AE9AE7ABAFE58FA3E58FB7EFBC8CE5B9B6E9858DE7BDAE4950E59CB0E59D80E38082262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B095374657034EFBC9AE59CA8E8BDAFE4BBB6E5B9B3E58FB0E7958CE99DA2E4B88AE68B96E68BBD57694669E781AFE58589E89C82E9B8A3E599A8E68EA7E588B6E88A82E782B9E4B880E4B8AAEFBC8CE68B96E68BBD3132563241E794B5E6BA90E98082E9858DE599A8E4B8BAE585B6E4B88AE794B5E38082E58F8CE587BB57694669E781AFE58589E89C82E9B8A3E599A8E68EA7E588B6E88A82E782B9E79A8457694669E6A8A1E59D97EFBC8CE69FA5E79C8BE5B9B6E9858DE7BDAEE585B6E7BD91E7BB9CE4BFA1E681AFEFBC8CE5B086E585B6E9858DE7BDAEE68890E68EA5E585A557694669E9AB98E9A29152464944E4BAA7E7949FE79A8477696669E7BD91E7BB9CEFBC8CE8BE93E585A5E6ADA3E7A1AEE79A84E7A798E992A5EFBC8CE4BBA5E58F8A4950E59CB0E59D80EFBC8CE8AEBEE7BDAEE68890E4B8BA544350E69C8DE58AA1E599A8EFBC8CE68C87E5AE9AE7ABAFE58FA3E58FB7EFBC8CE5B9B6E9858DE7BDAE4950E59CB0E59D80E38082262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B095374657035EFBC9AE59CA8E8BDAFE4BBB6E5B9B3E58FB0E7958CE99DA2E4B88AE68B96E68BBD57694669E7AA97E5B898E6ADA5E8BF9BE794B5E69CBAE68EA7E588B6E88A82E782B9E4B880E4B8AAEFBC8CE68B96E68BBD3132563241E794B5E6BA90E98082E9858DE599A8E4B8BAE585B6E4B88AE794B5E38082E58F8CE587BB57694669E7AA97E5B898E6ADA5E8BF9BE794B5E69CBAE68EA7E588B6E88A82E782B9E79A8457694669E6A8A1E59D97EFBC8CE69FA5E79C8BE5B9B6E9858DE7BDAEE585B6E7BD91E7BB9CE4BFA1E681AFEFBC8CE5B086E585B6E9858DE7BDAEE68890E68EA5E585A557694669E9AB98E9A29152464944E4BAA7E7949FE79A8477696669E7BD91E7BB9CEFBC8CE8BE93E585A5E6ADA3E7A1AEE79A84E7A798E992A5EFBC8CE4BBA5E58F8A4950E59CB0E59D80EFBC8CE8AEBEE7BDAEE68890E4B8BA544350E69C8DE58AA1E599A8EFBC8CE68C87E5AE9AE7ABAFE58FA3E58FB7EFBC8CE5B9B6E9858DE7BDAE4950E59CB0E59D80E38082262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B095374657036EFBC9AE68B96E68BBD416E64726F6964E5B9B3E69DBFE794B5E88491E887B3E8BDAFE4BBB6E7958CE99DA2EFBC8CE9A696E58588E58F8CE587BB416E64726F6964E5B9B3E69DBFEFBC8CE9858DE7BDAEE585B6E79A84E7BD91E7BB9CE4BFA1E681AFEFBC8CE8AEA9E585B6E8BF9EE585A5E6ADA3E7A1AEE79A84E697A0E7BABFE7BD91E7BB9CE38082262378613B266C743B2F702667743B, '', '物联网仿真实验平台.rar', 'upload\\manager\\20170510\\de98e4ef-6673-4194-b5e6-4ea81533c8c4.rar', '0', '教学计划.doc', 'upload\\manager\\20170420\\9d1d680e-e972-4d69-a95a-2a43e6148eb1.doc', '物联网虚拟仿真实验指导书.doc', 'upload\\manager\\20170424\\a2c8395a-69ff-4f30-90a5-7d73f38c5fe6.doc', '1', 'jiaoshi', '2017-04-19 14:19:54', '2017-05-10 15:13:16');
INSERT INTO `lab_experiment` VALUES ('9', '209', '物联网智慧农业3d虚拟仿真实验', '0', '', '', '0', '0', '', '', '', 0x266C743B702667743B262378613B09266C743B7374726F6E672667743B28E4B88029E38081266C743B7374726F6E672667743BE699BAE685A7E5869CE4B89AE5A4A7E6A39AE59FBAE7A180E5AE9EE9AA8CE9A1B9E79BAEE5908DE7A7B0266C743B2F7374726F6E672667743B266C743B2F7374726F6E672667743B20262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B0931E38081E7A9BAE6B094E6B8A9E6B9BFE5BAA6E98787E99B86E5AE9EE9AA8C266C743B6272202F2667743B262378613B32E38081E58589E785A7E695B0E68DAEE98787E99B86E5AE9EE9AA8C266C743B6272202F2667743B262378613B33E38081E59C9FE5A3A4E6B8A9E6B9BFE5BAA6E98787E99B86E5AE9EE9AA8C262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B0934E38081E6B8A9E5AEA4E58685E8A1A5E58589E68EA7E588B6E5AE9EE9AA8C262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B0935E38081E6B8A9E5AEA4E58685E981AEE58589E68EA7E588B6E5AE9EE9AA8C262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B0936E38081E58AA0E6B8A9E7B3BBE7BB9FE68EA7E588B6E5AE9EE9AA8C262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B0937E38081E7BB84E59088E690ADE5BBBAE6B8A9E5AEA4E4BCA0E6849FE599A8E98787E99B86E5AE9EE9AA8C262378613B266C743B2F702667743B262378613B266C743B7374726F6E672667743B28E4BA8C29E38081E5AE9EE9AA8CE79BAEE79A84266C743B2F7374726F6E672667743B266C743B6272202F2667743B262378613B266C743B702667743B262378613B09E59CA8E9A284E8AEBEE4B889E7BBB4E59CBAE699AFE58685E8BF9BE8A18C5652E58F8AE8999AE68B9FE4BBBFE79C9FE5AE9EE699AFE6BCABE6B8B8EFBC8CE4BA86E8A7A3E789A9E88194E7BD91E79BB8E585B3E7BB84E7BD91E69DA1E4BBB6E5928CE78EAFE5A283EFBC8CE4BDBFE5ADA6E7949FE5AFB9E79C9FE5AE9EE59CBAE699AFE79A84E789A9E88194E7BD91E78EAFE5A283E69C89E4B880E4B8AAE6A8A1E68B9FE8AEA4E79FA5E38082E5AE9EE78EB0E79C9FE5AE9EE6A8A1E68B9FE4B889E7BBB4E59CBAE699AFE79A84E699BAE685A7E5869CE4B89AE69687E6B49BE6B08FE8BF9EE6A08BE5A4A7E6A39AE5928CE9A39EE7919EE69596E5869CE4B89AE6B299E79B98E5819AE8999AE5AE9EE7BB93E59088E5AE9EE9AA8CE9809AE8BF875043E68896E88085E5A4A7E5B18FE5B995E6938DE4BD9CE4BAA4E4BA92E59CA8E5A4A7E6A39AE4B889E7BBB4E59CBAE699AFE4B8ADE7A7BBE58AA8E6BCABE6B8B8EFBC8CE79C8BE588B0E5928CE4BA86E8A7A3E4B88EE789A9E88194E7BD91E79BB8E585B3E8AEBEE5A487E79A84E6A8A1E59E8BE5B9B6E58FAFE4BBA5E5819AE79BB8E585B3E5AE9EE9AA8C262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09266C743B7374726F6E672667743B28E4B88929E38081266C743B2F7374726F6E672667743B266C743B7374726F6E672667743BE4B889E7BBB4E8999AE68B9FE4BBBFE79C9FE8AEBEE5A487E6A8A1E59E8BE6B885E58D95EFBC9A266C743B2F7374726F6E672667743B20262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B095A6967426565E88A82E782B9E8AEBEE5A487E38081E4BCA0E6849FE599A8E7BD91E585B3E38081E59C9FE5A3A4E6B8A9E6B9BFE5BAA6E4BCA0E6849FE599A8E38081E58AA0E6B8A9E68EA7E588B6E599A8E38081E68EA7E588B6E599A8E7BD91E585B3E38081E58589E785A7E4BCA0E6849FE599A8E38081E6B8A9E6B9BFE5BAA6E4BCA0E6849FE599A8E38081E58AA0E6B8A9E68EA7E588B6E599A8E38081E981AEE58589E68EA7E588B6E599A8E38081E8A1A5E58589E68EA7E588B6E599A8262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09266C743B7374726F6E672667743B28E59B9B29E38081E5AE9EE9AA8CE6B689E58F8AE8AEBEE5A487266C743B2F7374726F6E672667743B20262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B0931E380814854435652E4BA91E69599E5AEA4E7A1ACE4BBB6E7B3BBE7BB9FE69599E882B2E4BD93E9AA8CE78988EFBC88E4B889E5A597E5A4B4E79B94E58886E58F91E58F8AE58D8FE5908CE7AEA1E79086EFBC89EFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B0932E38081E699BAE685A7E5869CE4B89A5652E58F8A3344E8999AE68B9FE4BBBFE79C9FE5AE9EE9AA8CE5A597E4BBB6262378613B266C743B2F702667743B262378613B266C743B7374726F6E672667743B28E4BA9429E38081E7A9BAE6B094E6B8A9E6B9BFE5BAA6E98787E99B86E5AE9EE9AA8CE6A188E4BE8B266C743B2F7374726F6E672667743B266C743B6272202F2667743B262378613B31E38081E59CBAE699AFE98089E68BA9E7958CE99DA2EFBC8CE9BCA0E6A087E5B7A6E994AEE58D95E587BBE2809CE7A9BAE6B094E6B8A9E6B9BFE5BAA6E98787E99B86E5AE9EE9AA8CE2809DEFBC8CE8BF9BE585A5E7A9BAE6B094E6B8A9E6B9BFE5BAA6E98787E99B86E5AE9EE9AA8CE38082266C743B6272202F2667743B262378613B32E38081E58F98E9878FEFBC9A266C743B6272202F2667743B262378613BE6B8A9E5BAA6E580BCEFBC9A266C743B6272202F2667743B262378613B3129E6ADA4E695B0E580BCE58FAFE4BBA5E5928CE5AE9EE99985E4BCA0E6849FE599A8E79BB8E8BF9EE68EA5E88EB7E58F96E695B0E68DAEEFBC9B266C743B6272202F2667743B262378613B3229E697A0E79C9FE5AE9EE695B0E68DAEE68EA5E585A5E697B6EFBC8CE9BB98E8AEA4E8B5B7E5A78BE6B8A9E5BAA6E4B8BA3232E28483EFBC9B266C743B6272202F2667743B262378613B3329E68B96E68BBDE585A5E59CBAE699AFE5908EEFBC8CE6ADA4E695B0E580BCE99A8FE69CBAE8BF9BE8A18CE4B88AE58D87E68896E4B88BE9998DEFBC88E6AF8F333053E6B8A9E5BAA6E58D87E9AB98E68896E9998DE4BD8E31E28483EFBC89EFBC9B266C743B6272202F2667743B262378613B3429E6ADA4E695B0E580BCE99A8FE78EAFE5A283E79A84E58F98E58C96E8808CE694B9E58F98E38082266C743B6272202F2667743B262378613BE6B9BFE5BAA6E580BCEFBC9A266C743B6272202F2667743B262378613B3129E6ADA4E695B0E580BCE58FAFE4BBA5E5928CE5AE9EE99985E4BCA0E6849FE599A8E79BB8E8BF9EE68EA5E88EB7E58F96E695B0E68DAEEFBC9B266C743B6272202F2667743B262378613B3229E697A0E79C9FE5AE9EE695B0E68DAEE68EA5E585A5E697B6EFBC8CE9BB98E8AEA4E8B5B7E5A78BE6B9BFE5BAA6E4B8BA343025EFBC9B266C743B6272202F2667743B262378613B3329E68B96E68BBDE585A5E59CBAE699AFE5908EEFBC8CE6ADA4E695B0E580BCE99A8FE69CBAE8BF9BE8A18CE4B88AE58D87E68896E4B88BE9998DEFBC88E6AF8F333053E6B9BFE5BAA6E58D87E9AB98E68896E9998DE4BD8E3525EFBC89EFBC9B266C743B6272202F2667743B262378613B3429E6ADA4E695B0E580BCE99A8FE78EAFE5A283E79A84E58F98E58C96E8808CE694B9E58F98E38082266C743B6272202F2667743B262378613BE4BCA0E6849FE599A8E7BD91E585B3E79A84E58F98E9878FEFBC9A266C743B6272202F2667743B262378613B31294950E59CB0E59D80EFBC9B266C743B6272202F2667743B262378613B3229E7ABAFE58FA3E580BCEFBC9B266C743B6272202F2667743B262378613B33295A6967626565E7BD91E7BB9CE58FB7EFBC9A31E4B8AA3136E8BF9BE588B6E5AD97E88A82EFBC9B266C743B6272202F2667743B262378613B34295A6967626565E88A82E782B9E58FB7EFBC9A32E4B8AA3136E8BF9BE588B6E5AD97E88A82EFBC9B266C743B6272202F2667743B262378613B5A6967626565E6A8A1E59D97E79A84E58F98E9878FEFBC9A266C743B6272202F2667743B262378613B31295A6967626565E7BD91E7BB9CE58FB7EFBC9A31E4B8AA3136E8BF9BE588B6E5AD97E88A82EFBC9B266C743B6272202F2667743B262378613B32295A6967626565E88A82E782B9E58FB7EFBC9A32E4B8AA3136E8BF9BE588B6E5AD97E88A82EFBC9B266C743B6272202F2667743B262378613B3329E4B8B2E58FA3E9858DE7BDAEE4BFA1E681AFE5A682E4B88BEFBC9A266C743B6272202F2667743B262378613BE4B8B2E58FA3E6B3A2E789B9E78E873A266C743B6272202F2667743B262378613B612E3936303020266C743B6272202F2667743B262378613B622E3139323030266C743B6272202F2667743B262378613B632E3537363030266C743B6272202F2667743B262378613B642E313135323030266C743B6272202F2667743B262378613BE4B8B2E58FA3E695B0E68DAEE4BD8D3A266C743B6272202F2667743B262378613B612E37266C743B6272202F2667743B262378613B622E38266C743B6272202F2667743B262378613BE4B8B2E58FA3E6A0A1E9AA8CE4BD8D3A266C743B6272202F2667743B262378613B612E4556454E266C743B6272202F2667743B262378613B622E4F4444266C743B6272202F2667743B262378613B432E4E4F4E45266C743B6272202F2667743B262378613BE4B8B2E58FA3E5819CE6ADA2E4BD8D3A266C743B6272202F2667743B262378613B612E30266C743B6272202F2667743B262378613B622E31266C743B6272202F2667743B262378613B632E32266C743B6272202F2667743B262378613BE4BCA0E6849FE599A8E79A84E58F98E9878FEFBC9A266C743B6272202F2667743B262378613B31EFBC8920E4B8B2E58FA3E9858DE7BDAEE4BFA1E681AFE5A682E4B88BEFBC9A266C743B6272202F2667743B262378613BE4B8B2E58FA3E6B3A2E789B9E78E873A266C743B6272202F2667743B262378613B612E39363030266C743B6272202F2667743B262378613B622E3139323030266C743B6272202F2667743B262378613B632E3537363030266C743B6272202F2667743B262378613B642E313135323030266C743B6272202F2667743B262378613BE4B8B2E58FA3E695B0E68DAEE4BD8D3A266C743B6272202F2667743B262378613B612E37266C743B6272202F2667743B262378613B622E38266C743B6272202F2667743B262378613BE4B8B2E58FA3E6A0A1E9AA8CE4BD8D3A266C743B6272202F2667743B262378613B612E4556454E266C743B6272202F2667743B262378613B622E4F4444266C743B6272202F2667743B262378613B432E4E4F4E45266C743B6272202F2667743B262378613BE4B8B2E58FA3E5819CE6ADA2E4BD8D266C743B6272202F2667743B262378613B612E30266C743B6272202F2667743B262378613B622E31266C743B6272202F2667743B262378613B266C743B702667743B262378613B09632E32262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B0933E38081E6938DE4BD9C262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09266C743B7374726F6E672667743B3129266C743B2F7374726F6E672667743BE9BCA0E6A087E5B7A6E994AEE782B9E587BBE6A8A1E59E8BE58897E8A1A8E4B8ADE79A84E4BCA0E6849FE599A8E7BD91E585B3E38081E7A9BAE6B094E6B8A9E6B9BFE5BAA6E4BCA0E6849FE599A8E380815A6967626565E9809AE4BFA1E6A8A1E59D97EFBC8CE5B086E585B6E68B96E68BBDE588B0E59CBAE699AFE4B8ADEFBC8CE8B083E695B4E588B0E683B3E8A681E694BEE7BDAEE79A84E4BD8DE7BDAEEFBC9B262378613B266C743B2F702667743B262378613B266C743B7374726F6E672667743B3229266C743B2F7374726F6E672667743BE9BCA0E6A087E5B7A6E994AEE782B9E587BBE2809CE7A9BAE6B094E6B8A9E6B9BFE5BAA6E4BCA0E6849FE599A8E2809DE4B8B2E58FA3E7ABAFEFBC8CE5B086E585B6E68B96E68BBDE588B0E2809C5A6967626565E9809AE4BFA1E6A8A1E59D97E2809DE79A84E4B8B2E58FA3E7ABAFE5B9B6E887AAE58AA8E8BF9EE68EA5EFBC9B266C743B6272202F2667743B262378613B266C743B7374726F6E672667743B3329266C743B2F7374726F6E672667743BE9BCA0E6A087E5B7A6E994AEE782B9E587BBE6A8A1E59E8BE58897E8A1A8E4B8ADE79A8420E2809C3132563541E2809DE794B5E6BA90EFBC8CE5B086E585B6E68B96E68BBDE887B3E59CBAE699AFE4B8ADEFBC8CE9BCA0E6A087E68B96E68BBDE794B5E6BA90E68EA5E58FA3E7ABAFE5B086E585B6E68B96E887B3E2809CE4BCA0E6849FE599A8E7BD91E585B3E2809DE79A84E794B5E6BA90E68EA5E58FA3E5B9B6E887AAE58AA8E8BF9EE68EA5EFBC9B266C743B6272202F2667743B262378613B266C743B7374726F6E672667743B3429266C743B2F7374726F6E672667743BE9BCA0E6A087E5B7A6E994AEE782B9E587BBE6A8A1E59E8BE58897E8A1A8E4B8ADE79A8420E2809C3132563541E2809DE794B5E6BA90EFBC8CE5B086E585B6E68B96E68BBDE887B3E59CBAE699AFE4B8ADEFBC8CE9BCA0E6A087E68B96E68BBDE794B5E6BA90E68EA5E58FA3E7ABAFE5B086E585B6E68B96E887B3E2809CE7A9BAE6B094E6B8A9E6B9BFE5BAA6E4BCA0E6849FE599A8E2809DE79A84E794B5E6BA90E68EA5E58FA3E5B9B6E887AAE58AA8E8BF9EE68EA5EFBC9B266C743B6272202F2667743B262378613B266C743B7374726F6E672667743B3529266C743B2F7374726F6E672667743BE9BCA0E6A087E5B7A6E994AEE782B9E587BBE6A8A1E59E8BE58897E8A1A8E4B8ADE79A8420E2809C3132563541E2809DE794B5E6BA90EFBC8CE5B086E585B6E68B96E68BBDE887B3E59CBAE699AFE4B8ADEFBC8CE9BCA0E6A087E68B96E68BBDE794B5E6BA90E68EA5E58FA3E7ABAFE5B086E585B6E68B96E887B3E2809C5A6967626565E9809AE4BFA1E6A8A1E59D97E2809DE79A84E794B5E6BA90E68EA5E58FA3E5B9B6E887AAE58AA8E8BF9EE68EA5EFBC9B266C743B6272202F2667743B262378613B266C743B702667743B262378613B09266C743B7374726F6E672667743B3629266C743B2F7374726F6E672667743BE9BCA0E6A087E682ACE6B5AEE4BA8EE2809C5A6967626565E9809AE4BFA1E6A8A1E59D97E2809DEFBC8CE2809C5A6967626565E9809AE4BFA1E6A8A1E59D97E2809DE4B88AE698BEE7A4BAE4BFA1E681AFEFBC8CE698BEE7A4BA5A6967626565E7BD91E7BB9CE58FB7E5928CE88A82E782B9E58FB7EFBC9A262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B095A6967626565E7BD91E7BB9CE58FB7EFBC9A30302D6666E4B8A4E4BD8DE695B02830313233343536373839616263646566E59D87E4B8BAE59088E6B3952928E8AFA5E695B0E68DAEE7B3BBE7BB9FE99A8FE69CBAE7949FE688903136E8BF9BE588B6E79A84E695B029262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B095A6967626565E88A82E782B9E58FB7EFBC9A30302D6666E59B9BE4BD8DE695B02830313233343536373839616263646566E59D87E4B8BAE59088E6B3952928E8AFA5E695B0E68DAEE7B3BBE7BB9FE99A8FE69CBAE7949FE688903136E8BF9BE588B6E79A84E695B029262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09266C743B7374726F6E672667743B3729266C743B2F7374726F6E672667743BE9BCA0E6A087E682ACE6B5AEE4BA8EE2809CE4BCA0E6849FE599A8E7BD91E585B3E2809DEFBC8CE2809CE4BCA0E6849FE599A8E7BD91E585B3E2809DE4B88AE698BEE7A4BAE4BFA1E681AFEFBC8CE698BEE7A4BA4950E580BCE4B88EE7ABAFE58FA3E58FB7EFBC9A266C743B6272202F2667743B262378613B4950E580BCEFBC9AE69CACE69CBA4950EFBC88E9BB98E8AEA4E7949FE68890EFBC89266C743B6272202F2667743B262378613BE7ABAFE58FA3E58FB7EFBC9A34303031EFBC88E99A8FE69CBAE7949FE68890EFBC89262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09266C743B7374726F6E672667743B3829266C743B2F7374726F6E672667743BE9BCA0E6A087E58FB3E994AEEFBC8CE782B9E587BBE2809CE4BCA0E6849FE599A8E7BD91E585B3E2809DE697B6EFBC8CE5BCB9E587BAE9858DE7BDAEE7958CE99DA2EFBC8CE8BF9BE8A18CE9858DE7BDAEE4BFA1E681AFE98089E68BA9EFBC8CE58C85E68BACE4BBA5E4B88BE587A0E4B8AAE4BFA1E681AFEFBC9A266C743B6272202F2667743B262378613B4950E59CB0E59D80EFBC9AE8A681E4B88EE4BCA0E6849FE599A8E7BD91E585B3E4B88AE698BEE7A4BAE79A844950E580BCE4B880E887B4266C743B6272202F2667743B262378613BE7ABAFE58FA3E58FB7EFBC9AE8A681E4B88EE4BCA0E6849FE599A8E7BD91E585B3E4B88AE698BEE7A4BAE79A84E7ABAFE58FA3E580BCE4B880E887B4266C743B6272202F2667743B262378613B5A6967626565E7BD91E7BB9CE58FB7EFBC9AE8A681E4B88E5A6967626565E9809AE4BFA1E6A8A1E59D97E4B88AE79A84E7BD91E7BB9CE58FB7E4B880E887B4266C743B6272202F2667743B262378613B5A6967626565E88A82E782B9E58FB7EFBC9AE8A681E4B88E5A6967626565E9809AE4BFA1E6A8A1E59D97E4B88AE79A84E88A82E782B9E58FB7E4B880E887B4266C743B6272202F2667743B262378613B266C743B7374726F6E672667743B3929266C743B2F7374726F6E672667743BE782B9E587BBE2809CE9858DE7BDAEE5AE8CE68890E2809DE68C89E992AEEFBC8CE5AE8CE68890E4BFA1E681AFE9858DE7BDAEEFBC8CE9BCA0E6A087E58FB3E994AEE782B9E587BBE2809C5A6967626565E9809AE4BFA1E6A8A1E59D97E2809DEFBC8CE8BF9BE8A18CE4BFA1E681AFE9858DE7BDAEE2809DEFBC9B266C743B6272202F2667743B262378613B266C743B7374726F6E672667743B313029266C743B2F7374726F6E672667743BE9BCA0E6A087E58FB3E994AEEFBC8CE782B9E587BBE2809C5A6967626565E9809AE4BFA1E6A8A1E59D97E2809DE697B6EFBC8CE5BCB9E587BAE9858DE7BDAEE7958CE99DA2EFBC8CE8BF9BE8A18CE9858DE7BDAEE4BFA1E681AFE98089E68BA9EFBC8CE58C85E68BACE4BBA5E4B88BE587A0E4B8AAE4BFA1E681AFEFBC9A266C743B6272202F2667743B262378613BE4B8B2E58FA3E6B3A2E789B9E78E87EFBC9A262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09612E39363030262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09622E3139323030262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09632E3537363030262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09642E313135323030266C743B6272202F2667743B262378613BE4B8B2E58FA3E695B0E68DAEE4BD8DEFBC9A262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09612E37262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09622E38266C743B6272202F2667743B262378613BE4B8B2E58FA3E6A0A1E9AA8CE4BD8D3A262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09612E4556454E262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09622E4F4444262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09632E4E4F4E45266C743B6272202F2667743B262378613BE4B8B2E58FA3E5819CE6ADA2E4BD8DEFBC9A262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09612E30266C743B6272202F2667743B262378613B622E31266C743B6272202F2667743B262378613B632E32266C743B6272202F2667743B262378613B5A6967626565E7BD91E7BB9CE58FB7EFBC9AE8A681E4B88E5A6967626565E9809AE4BFA1E6A8A1E59D97E4B88AE79A84E7BD91E7BB9CE58FB7E4B880E887B4266C743B6272202F2667743B262378613B5A6967626565E88A82E782B9E58FB7EFBC9AE8A681E4B88E5A6967626565E9809AE4BFA1E6A8A1E59D97E4B88AE79A84E88A82E782B9E58FB7E4B880E887B4262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09266C743B7374726F6E672667743B313129266C743B2F7374726F6E672667743BE782B9E587BBE2809CE9858DE7BDAEE5AE8CE68890E2809DE68C89E992AEEFBC8CE5AE8CE68890E4BFA1E681AFE9858DE7BDAEE38082E9BCA0E6A087E58FB3E994AEE782B9E587BBE2809CE7A9BAE6B094E6B8A9E6B9BFE5BAA6E4BCA0E6849FE599A8E2809DEFBC8CE8BF9BE8A18CE4BFA1E681AFE9858DE7BDAEE2809DEFBC9B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09266C743B7374726F6E672667743B313229266C743B2F7374726F6E672667743BE9BCA0E6A087E58FB3E994AEEFBC8CE782B9E587BBE2809CE7A9BAE6B094E6B8A9E6B9BFE5BAA6E4BCA0E6849FE599A8E2809DEFBC8CE5BCB9E587BAE9858DE7BDAEE7958CE99DA2EFBC8CE8BF9BE8A18CE9858DE7BDAEE4BFA1E681AFE98089E68BA9EFBC8CE58C85E68BACE4BBA5E4B88BE587A0E4B8AAE4BFA1E681AFEFBC9A266C743B6272202F2667743B262378613BE4B8B2E58FA3E6B3A2E789B9E78E87EFBC9A262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09612E39363030262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09622E3139323030262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09632E3537363030262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09642E313135323030266C743B6272202F2667743B262378613BE4B8B2E58FA3E695B0E68DAEE4BD8DEFBC9A262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09612E37262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09622E38266C743B6272202F2667743B262378613BE4B8B2E58FA3E6A0A1E9AA8CE4BD8DEFBC9A262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09612E4556454E262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09622E4F4444262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09632E4E4F4E45266C743B6272202F2667743B262378613BE4B8B2E58FA3E5819CE6ADA2E4BD8DEFBC9A262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09612E30266C743B6272202F2667743B262378613B622E31262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09632E32266C743B6272202F2667743B262378613B266C743B7374726F6E672667743B313329266C743B2F7374726F6E672667743BE782B9E587BBE2809CE9858DE7BDAEE5AE8CE68890E2809DE68C89E992AEEFBC8CE5AE8CE68890E4BFA1E681AFE9858DE7BDAEE38082266C743B6272202F2667743B262378613B266C743B7374726F6E672667743B313429266C743B2F7374726F6E672667743BE5B086E9BCA0E6A087E682ACE6B5AEE4BA8EE2809CE7A9BAE6B094E6B8A9E6B9BFE5BAA6E4BCA0E6849FE599A8E2809DE4B88AEFBC8CE698BEE7A4BAE2809CE7A9BAE6B094E6B8A9E6B9BFE5BAA6E4BCA0E6849FE599A8E2809DE68C87E4BBA4E7A0813B262378613B266C743B2F702667743B262378613B266C743B702667743B262378613B09266C743B7374726F6E672667743B313529266C743B2F7374726F6E672667743BE5ADA6E7949FE6A0B9E68DAEE68F90E4BE9BE79A844950E38081E7ABAFE58FA3E580BCEFBC8CE4B88EE2809CE7A9BAE6B094E6B8A9E6B9BFE5BAA6E4BCA0E6849FE599A8E2809DE79A84E68C87E4BBA4E7A081EFBC8CE887AAE5B7B1E7BC96E58699736F636B6574E8BF9EE68EA5EFBC8CE4B88EE8BDAFE4BBB6E8BF9BE8A18CE9809AE4BFA1E38082266C743B6272202F2667743B262378613B266C743B7374726F6E672667743B313629266C743B2F7374726F6E672667743B20E5ADA6E7949FE6A0B9E68DAEE59B9EE58F91E79A84E68C87E4BBA4E7A081EFBC8CE8A7A3E69E90E587BAE6B8A9E5BAA6E4B88EE6B9BFE5BAA6E580BCE38082266C743B6272202F2667743B262378613B266C743B7374726F6E672667743B313729266C743B2F7374726F6E672667743BE8A7A3E69E90E587BAE695B0E580BCE5908EEFBC8CE9BCA0E6A087E5B7A6E994AEE782B9E587BBE2809CE7A9BAE6B094E6B8A9E6B9BFE5BAA6E4BCA0E6849FE599A8E2809DEFBC8CE59CA8E5BCB9E587BAE79A84E8BE93E585A5E6A186E4B8ADE8BE93E585A5E8A7A3E69E90E587BAE79A84E6B8A9E5BAA6E4B88EE6B9BFE5BAA6E580BCE38082E782B9E587BBE2809CE9AA8CE8AF81E2809DE68C89E992AEEFBC8CE5AE8CE68890E5AE9EE9AA8CE6938DE4BD9CE38082262378613B266C743B2F702667743B, '', '智慧农业虚拟搭建系统.zip', 'upload\\manager\\20170421\\bfd437f5-a49d-46b3-a88f-2bb827bae8b3.zip', '0', '教学计划.doc', 'upload\\manager\\20170420\\269261d6-3cc6-4261-80ae-e73d27c4a4ac.doc', '智慧农业基础实验项目指导书.doc', 'upload\\manager\\20170420\\fb0778a8-0520-42ac-8436-b647aab0baa6.doc', '1', 'jiaoshi', '2017-04-20 17:13:11', '2017-04-21 15:35:19');

-- ----------------------------
-- Table structure for `lab_experiment_type`
-- ----------------------------
DROP TABLE IF EXISTS `lab_experiment_type`;
CREATE TABLE `lab_experiment_type` (
  `type_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '实验id',
  `type_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验类型名称',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验类型表';

-- ----------------------------
-- Records of lab_experiment_type
-- ----------------------------

-- ----------------------------
-- Table structure for `lab_group`
-- ----------------------------
DROP TABLE IF EXISTS `lab_group`;
CREATE TABLE `lab_group` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分组id',
  `group_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分组名称',
  `group_num` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分组编号',
  `class_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '班级id',
  `class_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '班级名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '由谁分组[0:教师, 1:学生]',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分组表';

-- ----------------------------
-- Records of lab_group
-- ----------------------------

-- ----------------------------
-- Table structure for `lab_group_student`
-- ----------------------------
DROP TABLE IF EXISTS `lab_group_student`;
CREATE TABLE `lab_group_student` (
  `group_student_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '学生分组id',
  `group_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分组id',
  `group_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分组名称',
  `group_num` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分组编号',
  `student_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '学生id',
  `student_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '学生名称',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`group_student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分组表';

-- ----------------------------
-- Records of lab_group_student
-- ----------------------------

-- ----------------------------
-- Table structure for `lab_index_photo`
-- ----------------------------
DROP TABLE IF EXISTS `lab_index_photo`;
CREATE TABLE `lab_index_photo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `photo_title` varchar(50) NOT NULL DEFAULT '' COMMENT '图片标题',
  `photo_name` varchar(50) NOT NULL DEFAULT '' COMMENT '图片原文件名',
  `photo_src` varchar(150) NOT NULL DEFAULT '' COMMENT '图片路径',
  `photo_link` varchar(150) NOT NULL DEFAULT '' COMMENT '图片连接',
  `photo_type` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '图片类型[0:成果, 1:轮播]',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='首页图片维护表';

-- ----------------------------
-- Records of lab_index_photo
-- ----------------------------
INSERT INTO `lab_index_photo` VALUES ('1', '科研方向', 'zss.jpg', 'img/zss.jpg', 'http://www.jxit.net.cn/jxcginfo.jsp?id=5', '0', '1', '', '2017-02-16 18:29:27', '2017-08-28 14:55:07');
INSERT INTO `lab_index_photo` VALUES ('2', '学术交流', 'zs.png', 'img/zs.png', 'http://www.jxit.net.cn/jxcginfo.jsp?id=4', '0', '1', '', '2017-02-16 18:29:36', '2017-08-28 14:55:07');
INSERT INTO `lab_index_photo` VALUES ('3', '综合实验中心', 'a3.jpg', 'img/a3.jpg', 'http://www.jxit.net.cn/jxcginfo.jsp?id=8', '0', '1', '', '2017-02-16 18:29:41', '2017-08-28 14:55:07');
INSERT INTO `lab_index_photo` VALUES ('4', '轮播电源', 'zss.jpg', 'img/zss.jpg', 'http://www.jxit.net.cn', '1', '1', '', '2017-02-16 18:56:45', '2017-08-28 14:56:09');
INSERT INTO `lab_index_photo` VALUES ('5', '轮播2', 'zs.png', 'img/zs.png', 'http://www.jxit.net.cn', '1', '1', '', '2017-02-16 18:56:45', '2017-08-28 14:56:09');
INSERT INTO `lab_index_photo` VALUES ('6', '轮播3', 'a3.jpg', 'img/a3.jpg', 'http://www.jxit.net.cn', '1', '1', '', '2017-02-16 18:56:45', '2017-08-28 14:56:09');

-- ----------------------------
-- Table structure for `lab_message`
-- ----------------------------
DROP TABLE IF EXISTS `lab_message`;
CREATE TABLE `lab_message` (
  `message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '实验id',
  `message_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验室名称',
  `message_content` varchar(1000) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验内容',
  `sender` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发送方类型[0 学生 1 教师 2 系统管理员]',
  `receiver` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发送方类型[0 学生 1 教师 2 系统管理员]',
  `looked` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否查看[0:未查看, 1:已查看]',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统消息表';

-- ----------------------------
-- Records of lab_message
-- ----------------------------
INSERT INTO `lab_message` VALUES ('10', '觉行职业学校计算机学院网络虚拟空间架设挑战赛', '      为促进计算机网络工程和网络安全技术传播，培养网络方向和安全方向的技术人才，同时为了选拔优秀学生参加国家级网络与安全大赛与企业的网络技能大赛，觉行职业学校计算机学院在北京欧朋兰博企业投资管理有限公司西安分公司的大力支持下，面向全院举办网络虚拟空间架设校内挑战赛，邀请各专业学生积极参加。通过此次大赛，检验参赛同学的局域网络构建能力，提高同学们计算机安全及维护意识，加强同学们对计算机网络的了解。\n  \n       为了加快计算机网络知识在校园内的普及，让更多的同学更熟练地使用计算机网络与安全技术的同时，为同学们提供一个充分展示自己能力、提高团队协作力的平台。并希望通过此次活动，推动我校科技教育工作的全面深入开展，增强校园科技氛围，激发更多的同学对计算机知识的兴趣，做到认真学习，刻苦钻研，知行合一。\n\n现将本次竞赛有关安排通知如下：\n\n一、竞赛形式\n\n竞赛采用现场实际操作方式，所有参赛者独立完成相同的项目，根据参赛者在限定时间内按完成要求的程度、时间的先后、完成的特效等等评定名次，并进行评审奖励。\n\n二、比赛宣讲时间地点：\n\n时间：3月28日晚上19：00-21：00\n\n地点：工科1#楼204\n\n参与学生：计算机学院 大二年级、大三年级全体学生\n\n报名截止时间： 4月5日下午5：00\n\n三、赛前培训时间地点\n\n由于比赛采用实际网络设备，由欧朋工程师提前对比赛所需操作进行讲解，使同学们尽快熟悉设备。\n\n时间：4月5日、6日、11日、12日、13日 晚上19：00-21：00\n\n地点：工科1#楼204\n\n四、奖励及评选规则：\n\n比赛结束后，分别决出一等奖1支队伍、二等奖2支队伍、三等奖3支队伍、优秀奖10支队伍，并将比赛结果及原始数据及时上报\n\n一等奖     颁发获奖证书，价值￥2000元ipad ，学院技能学分1分，并推荐实习就业；\n\n二等奖     颁发获奖证书，价值￥1000元移动硬盘，学院技能学分1分，并推荐实习就业；\n\n三等奖     颁发获奖证书，价值￥500元机械键盘，学院技能学分1分，并推荐实习就业；\n\n优秀奖     颁发获奖证书，价值￥200元U盘，学院技能学分1分，并推荐实习就业；\n\n五、报名方式\n\n竞赛负责人：唐老师，15902962320\n\n竞赛与咨询QQ群：458642170\n觉行职业学校计算机学院\n2017年3月26日', '3', '1', '0', '1', 'admin', '2017-04-19 18:08:31', '2017-04-19 18:15:44');
INSERT INTO `lab_message` VALUES ('11', '关于谭军科同学就业协议书丢失补办的公示', '谭军科，男，我校计算机科学与工程学院网络工程专业2017届毕业生，于2017年3月15日前，将编号为SX2016133758的空白就业协议书丢失，现申请予以补办。根据该同学的申请，对其就业协议书丢失补办的情况予以公示一月（2017年3月29日——2017年4月28日），欢迎广大师生监督。如情况不实，请与学院学生办公室联系。\n\n \n\n   \n\n \n\n \n\n联系电话：86173276 \n\n \n\n \n\n                                                        计算机科学与工程学院\n                                                           2017年3月29日\n', '3', '1', '0', '1', 'admin', '2017-04-19 18:16:13', '2017-04-19 18:16:13');
INSERT INTO `lab_message` VALUES ('12', '“第十三届“博创杯”全国大学生嵌入式设计大赛 暨第一届“博创杯”创新创业电子设计大赛”的通知', '“博创杯”全国大学生嵌入式设计大赛自2005年至今已举办了十二届，累计参赛院校500余所，参赛队伍5000余支，参赛学生多达15000余名。大赛为高校学生提供了一个创新、交流和展示的平台，本着公平、公正、开源、开放的大赛精神，选拔出优秀的人才与大赛作品，吸引国内外优秀的企业积极参与，利用企业平台，实现人才就业与大赛作品的产品化转换。\n\n我校今年协办内蒙古自治区分赛区比赛，现将大赛具体组织工作通知如下：\n一、主办单位：中国教育部高等学校计算机类专业教学指导委员会\n\n              中国电子学会 \n\n    竞赛级别：国家B级\n\n    参赛形式：本次大赛仅设【标准赛项】，分为高职组、本科组，采用大赛指定平台，不限定命题，通过分赛区现场实物评审的形式选拔进入总决赛，进行全国性评审评奖。规则详情请到大赛官网“资料下载”处下载《标准赛项比赛说明》。\n\n    参赛周期：1年一届\n二、参赛对象\n\n具有正式学籍的全日制在校本、专科生均有资格报名参赛；每支参赛队最多三名队员组队，每名队员只能参加一支队伍。\n\n三、大赛命题\n\n本赛事采用开放式命题的形式，让各参赛队伍能有更自由的发挥空间。 设计内容可涵盖：嵌入式、机器人、物联网应用（城市交通，医疗，港口物流，环境监测，多网融合等）、消费类电子、数字电视、GPS导航、智能手机、数字家电、多媒体、视频编码解码、图像处理、安防监控、无线通讯、信息识别、工业应用、医疗卫生领域的硬件设计，应用软件，系统软件等。\n四、报名办法\n\n   2017年4月30日前参赛队伍通过大赛官网（www.cie-eec.org）进行在线报名，报名流程请见附件。\n\n五、大赛时间                    \n\n2017年1月-4月    在线报名，准备作品\n\n2017年5月           修改报名信息\n\n2017年6月           各分赛区比赛，具体比赛时间以官网公布为准\n\n2017年7月           全国总决赛    \n\n六、 联系方式\n\n  竞赛负责人：马静\n\n  联系人：马静13709195258曲少春18629059266\n\n附件：大赛报名参赛流程', '3', '1', '0', '1', 'admin', '2017-04-19 18:17:34', '2017-04-19 18:21:15');
INSERT INTO `lab_message` VALUES ('13', '计算机科学与工程学院2017年硕士研究生调剂招生专业', '我院计算机系统结构（081201）、计算机软件与理论（081202）、计算机应用技术（081203）、武器系统与运用工程（082601）、兵器发射理论与技术（082602）、软件工程（083500）、计算机技术（全日制）（专业硕士085211）、软件工程（全日制）（专业硕士085212）等专业均可接收调剂。\n\n咨询电话：86173270；\n\n办公地址：工1楼301办公室\n\n联系老师：张老师、胡老师、魏老师 \n', '3', '1', '0', '1', 'admin', '2017-04-19 18:22:02', '2017-04-19 18:22:02');
INSERT INTO `lab_message` VALUES ('14', '关于召开ICSNCE 2016国际会议的通知', '为促进我国与国际社会在计算机科学、新型网络检测与控制领域的交流与合作，由新型网络与检测控制国家地方联合工程实验室、觉行职业学校（Xi\'an Technological University）发起，得到美国密苏里西州立大学、新加坡国立大学、香港科技大学等国内外高校与法国Atlantic出版社的大力支持，将于2016年7月8-10日在内蒙古自治区西安市举办网络工程与计算机科学国际会议。会议录用文章将提交ISTP（现改名CPCI）检索，会议相关信息如下：\n\n  会议名称：计算机网络工程与计算机科学国际会议\n\n  英文名称（简称）：2016 International Conference of Network Engineering and Computer Science (ICSNCE2016) \n\n会议举办时间和地点：2016年7月8-10日，西安市南洋大酒店\n\n会议网站见觉行职业学校计算机科学与工程学院网页\n\n会议联系方式： 029-86173290、icsnce @163.com  \n\n组委会地址： 内蒙古自治区西安市觉行职业学校（工一楼519室）\n\n联系人：周老师\n\n \n\n2016年2月29日\n', '3', '1', '0', '1', 'admin', '2017-04-19 18:22:45', '2017-04-19 18:22:45');

-- ----------------------------
-- Table structure for `lab_message_one`
-- ----------------------------
DROP TABLE IF EXISTS `lab_message_one`;
CREATE TABLE `lab_message_one` (
  `message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '实验id',
  `message_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验室名称',
  `message_content` varchar(1000) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验内容',
  `sender` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '发送方ID',
  `receiver` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '接收方ID',
  `looked` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否查看[0:未查看, 1:已查看]',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='单发系统消息表';

-- ----------------------------
-- Records of lab_message_one
-- ----------------------------

-- ----------------------------
-- Table structure for `lab_module`
-- ----------------------------
DROP TABLE IF EXISTS `lab_module`;
CREATE TABLE `lab_module` (
  `module_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块编号',
  `module_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '模块名称',
  `url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '链接',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '模块级别 1-顶级  2-二级 ',
  `f_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '优先级',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单表';

-- ----------------------------
-- Records of lab_module
-- ----------------------------
INSERT INTO `lab_module` VALUES ('1', '学生管理', 'student', '1', '0', '0', null, null);
INSERT INTO `lab_module` VALUES ('2', '教师管理', 'teacher', '1', '0', '0', null, null);
INSERT INTO `lab_module` VALUES ('3', '实验室管理', 'room', '1', '0', '0', null, null);
INSERT INTO `lab_module` VALUES ('4', '班级管理', 'class', '1', '0', '0', null, null);
INSERT INTO `lab_module` VALUES ('5', '学生列表', 'view/student/studentlist.jsp', '2', '1', '0', null, null);
INSERT INTO `lab_module` VALUES ('6', '教师列表', 'view/teacher/teacherlist.jsp', '2', '2', '0', null, null);
INSERT INTO `lab_module` VALUES ('7', '实验室列表', 'view/room/roomlist.jsp', '2', '3', '0', null, null);
INSERT INTO `lab_module` VALUES ('8', '班级列表', 'view/class/classlist.jsp', '2', '4', '0', null, null);
INSERT INTO `lab_module` VALUES ('10', '课程列表', '', '2', '9', '5', null, null);
INSERT INTO `lab_module` VALUES ('11', '系统管理', 'system', '1', '0', '10', null, null);
INSERT INTO `lab_module` VALUES ('12', '管理员权限管理', 'view/system/personlist.jsp', '2', '11', '15', null, null);
INSERT INTO `lab_module` VALUES ('13', '角色管理', 'view/system/rolelist.jsp', '2', '11', '20', null, null);
INSERT INTO `lab_module` VALUES ('14', '分组管理', 'team', '1', '0', '70', null, null);
INSERT INTO `lab_module` VALUES ('15', '分组列表', 'view/team/teamlist.jsp', '2', '14', '71', null, null);
INSERT INTO `lab_module` VALUES ('16', '实验项目管理', 'experiment', '1', '0', '30', null, null);
INSERT INTO `lab_module` VALUES ('17', '实验项目列表', 'view/experiment/experimentlist.jsp', '2', '16', '31', null, null);
INSERT INTO `lab_module` VALUES ('18', '习题管理', 'example', '1', '0', '40', null, null);
INSERT INTO `lab_module` VALUES ('19', '习题列表', 'view/example/examplelist.jsp', '2', '18', '41', null, null);
INSERT INTO `lab_module` VALUES ('20', '实验课管理', 'task', '1', '0', '50', null, null);
INSERT INTO `lab_module` VALUES ('21', '实验课列表', 'view/task/tasklist.jsp', '2', '20', '53', null, null);
INSERT INTO `lab_module` VALUES ('22', '作业列表', 'view/work/worklist.jsp', '2', '20', '55', null, null);
INSERT INTO `lab_module` VALUES ('23', '报告列表', 'view/report/reportlist.jsp', '2', '20', '56', null, null);
INSERT INTO `lab_module` VALUES ('24', '学生实验课管理', 'studenttask', '1', '0', '57', null, null);
INSERT INTO `lab_module` VALUES ('25', '学生实验课列表', 'view/studenttask/tasklist.jsp', '2', '24', '59', null, null);
INSERT INTO `lab_module` VALUES ('26', '讨论管理', '', '1', '0', '60', null, null);
INSERT INTO `lab_module` VALUES ('27', '讨论列表', 'view/discuss/discusslist.jsp', '2', '26', '61', null, null);
INSERT INTO `lab_module` VALUES ('28', '消息管理', '', '1', '0', '80', null, null);
INSERT INTO `lab_module` VALUES ('29', '消息列表', 'view/message/msglist.jsp', '2', '28', '81', null, null);
INSERT INTO `lab_module` VALUES ('30', '管理员消息列表', 'view/message/msgadminlist.jsp', '2', '28', '82', null, null);
INSERT INTO `lab_module` VALUES ('31', '实验室时间设置', 'view/room/roomtimesetlist.jsp', '2', '3', '0', null, null);
INSERT INTO `lab_module` VALUES ('32', '实验室预约审核', 'view/room/roomtimeorderlist.jsp', '2', '3', '0', null, null);
INSERT INTO `lab_module` VALUES ('33', '实验室使用统计', 'view/room/roomstatistics.jsp', '2', '3', '0', null, null);
INSERT INTO `lab_module` VALUES ('34', '考勤管理', 'checkwork', '1', '0', '65', null, null);
INSERT INTO `lab_module` VALUES ('35', '考勤列表', 'view/checkwork/checkworklist.jsp', '2', '34', '66', null, null);
INSERT INTO `lab_module` VALUES ('36', '预约实验课时', 'view/task/roomtimelist.jsp', '2', '20', '51', null, null);
INSERT INTO `lab_module` VALUES ('37', '学生预约课列表', 'view/studenttask/ordercourselist.jsp', '2', '24', '58', null, null);
INSERT INTO `lab_module` VALUES ('38', '成果展示', 'view/system/kycglist.jsp', '2', '11', '25', null, null);
INSERT INTO `lab_module` VALUES ('39', '教学动态', 'view/system/kyxmlist.jsp', '2', '11', '26', null, null);
INSERT INTO `lab_module` VALUES ('40', '成果图片维护', 'view/system/cgphoto.jsp', '2', '11', '27', null, null);
INSERT INTO `lab_module` VALUES ('41', '轮播图片维护', 'view/system/lbphoto.jsp', '2', '11', '28', null, null);
INSERT INTO `lab_module` VALUES ('42', '教师权限管理', 'view/system/teacherlist.jsp', '2', '11', '16', null, null);
INSERT INTO `lab_module` VALUES ('43', '学生权限管理', 'view/system/studentlist.jsp', '2', '11', '17', null, null);

-- ----------------------------
-- Table structure for `lab_module_role`
-- ----------------------------
DROP TABLE IF EXISTS `lab_module_role`;
CREATE TABLE `lab_module_role` (
  `module_role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块角色id',
  `module_id` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '模块id',
  `role_id` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '角色id ',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0-使用  1-停用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`module_role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色模块映射表';

-- ----------------------------
-- Records of lab_module_role
-- ----------------------------
INSERT INTO `lab_module_role` VALUES ('14', '14', '1', '0', null, null);
INSERT INTO `lab_module_role` VALUES ('15', '15', '1', '0', null, null);
INSERT INTO `lab_module_role` VALUES ('16', '24', '1', '0', null, null);
INSERT INTO `lab_module_role` VALUES ('17', '25', '1', '0', null, null);
INSERT INTO `lab_module_role` VALUES ('18', '26', '1', '0', null, null);
INSERT INTO `lab_module_role` VALUES ('19', '27', '1', '0', null, null);
INSERT INTO `lab_module_role` VALUES ('20', '28', '1', '0', null, null);
INSERT INTO `lab_module_role` VALUES ('21', '29', '1', '0', null, null);
INSERT INTO `lab_module_role` VALUES ('100', '37', '1', '0', null, null);
INSERT INTO `lab_module_role` VALUES ('103', '30', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('104', '1', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('105', '5', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('106', '2', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('107', '6', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('108', '3', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('109', '7', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('110', '31', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('111', '32', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('112', '33', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('113', '4', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('114', '8', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('115', '11', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('116', '12', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('117', '13', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('118', '38', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('119', '39', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('120', '34', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('121', '35', '3', '1', '2017-02-08 16:54:43', '2017-02-08 16:54:43');
INSERT INTO `lab_module_role` VALUES ('122', '40', '3', '1', null, null);
INSERT INTO `lab_module_role` VALUES ('123', '41', '3', '1', null, null);
INSERT INTO `lab_module_role` VALUES ('124', '42', '3', '1', null, null);
INSERT INTO `lab_module_role` VALUES ('125', '43', '3', '1', null, null);
INSERT INTO `lab_module_role` VALUES ('162', '14', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');
INSERT INTO `lab_module_role` VALUES ('163', '15', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');
INSERT INTO `lab_module_role` VALUES ('164', '28', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');
INSERT INTO `lab_module_role` VALUES ('165', '29', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');
INSERT INTO `lab_module_role` VALUES ('166', '34', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');
INSERT INTO `lab_module_role` VALUES ('167', '35', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');
INSERT INTO `lab_module_role` VALUES ('168', '16', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');
INSERT INTO `lab_module_role` VALUES ('169', '17', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');
INSERT INTO `lab_module_role` VALUES ('170', '18', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');
INSERT INTO `lab_module_role` VALUES ('171', '19', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');
INSERT INTO `lab_module_role` VALUES ('172', '20', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');
INSERT INTO `lab_module_role` VALUES ('173', '21', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');
INSERT INTO `lab_module_role` VALUES ('174', '22', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');
INSERT INTO `lab_module_role` VALUES ('175', '23', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');
INSERT INTO `lab_module_role` VALUES ('176', '36', '2', '1', '2017-04-14 18:45:28', '2017-04-14 18:45:28');

-- ----------------------------
-- Table structure for `lab_news`
-- ----------------------------
DROP TABLE IF EXISTS `lab_news`;
CREATE TABLE `lab_news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '来源',
  `keyword` varchar(50) NOT NULL DEFAULT '' COMMENT '关键字',
  `abstractTitle` varchar(100) NOT NULL DEFAULT '' COMMENT '摘要',
  `content` text COMMENT '内容',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '类别[1:科研成果, 2:科研项目]',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='新闻表';

-- ----------------------------
-- Records of lab_news
-- ----------------------------
INSERT INTO `lab_news` VALUES ('8', '计算机学院召开2016级英语四、六级经验分享会 ', '', '', '', '&lt;div class=&quot;maincont1 clear&quot;&gt;&#xa;	&lt;div class=&quot;cont_right1 fr&quot;&gt;&#xa;		&lt;table class=&quot;winstyle681466015_18741 ke-zeroborder&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; border=&quot;0&quot; width=&quot;100%&quot;&gt;&#xa;			&lt;tbody&gt;&#xa;				&lt;tr&gt;&#xa;					&lt;td class=&quot;titlestyle681466015_18741&quot; align=&quot;center&quot;&gt;&#xa;						&lt;span&gt;计算机学院召开2016级英语四、六级经验分享会&lt;/span&gt; &#xa;					&lt;/td&gt;&#xa;				&lt;/tr&gt;&#xa;				&lt;tr&gt;&#xa;					&lt;td align=&quot;center&quot;&gt;&#xa;						&lt;span class=&quot;timestyle681466015_18741&quot;&gt;2017-04-10 15:58&lt;/span&gt; &lt;span class=&quot;authorstyle681466015_18741&quot;&gt;&amp;nbsp;&lt;/span&gt; &#xa;					&lt;/td&gt;&#xa;				&lt;/tr&gt;&#xa;				&lt;tr&gt;&#xa;					&lt;td class=&quot;contentstyle681466015_18741&quot;&gt;&#xa;						&lt;div id=&quot;vsb_content&quot;&gt;&#xa;							&lt;div class=&quot;Section1&quot;&gt;&#xa;								&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21pt;&quot; align=&quot;left&quot;&gt;&#xa;									&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp; 为了帮助&lt;span&gt;16&lt;/span&gt;级同学全面了解大学英语四、六级考试，更加科学进行练习备考。&lt;span&gt;2017&lt;/span&gt;年&lt;span&gt;4&lt;/span&gt;月&lt;span&gt;7&lt;/span&gt;日&lt;span&gt;17:10&lt;/span&gt;我院&lt;span&gt;16&lt;/span&gt;级辅导员组织全体同学分别在教&lt;span&gt;1-303&lt;/span&gt;、教&lt;span&gt;1-304&lt;/span&gt;召开英语四、六级经验分享会。&lt;span&gt;14&lt;/span&gt;级方乐同学、&lt;span&gt;15&lt;/span&gt;级余硕同学受邀分别向&lt;span&gt;16&lt;/span&gt;级同学分享了自己在备考和考试中的经验。&lt;/span&gt;&lt;span&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;br /&gt;&#xa;&lt;/span&gt; &#xa;								&lt;/p&gt;&#xa;								&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21pt;&quot; align=&quot;left&quot;&gt;&#xa;									&lt;span style=&quot;font-family:宋体;&quot;&gt;分享会上，方乐同学着重介绍了考试的题型类，分值分布及不同部分的合理时间分配。强调在考试中如遇困难题目，切忌长时间停留，以至后面题目时间不足。余硕同学着重介绍了考试的难点题型，备考中需重点练习的题型及答题时的一些技巧方法。强调在考试快结束前要将因困难未做的题目尽可能作答，尤其是客观题型，切忌空而不做。除了以上，两位同学还共同强调了备考练习中持之以恒的重要性，只有通过长时的积累，水平才会逐渐提高，顺利通过考试也将不期而至。在受邀同学的经验分享后，&lt;span&gt;16&lt;/span&gt;级同学就自己对英语四、六级关心的问题积极踊跃的进行询问，得到了热情、详细的解答。分享会最后，辅导员对受邀同学表示了感谢，会议在热烈的掌声中结束。&lt;/span&gt; &#xa;								&lt;/p&gt;&#xa;								&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.75pt;&quot; align=&quot;left&quot;&gt;&#xa;									&lt;span style=&quot;font-family:宋体;&quot;&gt;通过此次分享会，使&lt;span&gt;16&lt;/span&gt;级同学对英语四、六级考试认识更加清晰，在考前的练习中方向性、针对性更加清楚。相信经过同学们的坚持努力一定会在之后的考试中取得佳绩！&lt;/span&gt;&lt;a name=&quot;_GoBack&quot;&gt;&lt;/a&gt; &#xa;								&lt;/p&gt;&#xa;								&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.75pt;&quot;&gt;&#xa;									&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt; &#xa;								&lt;/p&gt;&#xa;								&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.75pt;&quot;&gt;&#xa;									&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;撰稿人：吴宗原&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;审稿人&lt;span&gt;:&lt;/span&gt;李颖&lt;/span&gt; &#xa;								&lt;/p&gt;&#xa;							&lt;/div&gt;&#xa;						&lt;/div&gt;&#xa;					&lt;/td&gt;&#xa;				&lt;/tr&gt;&#xa;				&lt;tr&gt;&#xa;					&lt;td class=&quot;pagestyle681466015_18741&quot;&gt;&#xa;						&lt;br /&gt;&#xa;					&lt;/td&gt;&#xa;				&lt;/tr&gt;&#xa;				&lt;tr&gt;&#xa;					&lt;td align=&quot;left&quot;&gt;&#xa;						&lt;span&gt;&lt;/span&gt;&lt;br /&gt;&#xa;					&lt;/td&gt;&#xa;				&lt;/tr&gt;&#xa;				&lt;tr&gt;&#xa;					&lt;td align=&quot;center&quot;&gt;&#xa;						&lt;br /&gt;&#xa;					&lt;/td&gt;&#xa;				&lt;/tr&gt;&#xa;				&lt;tr&gt;&#xa;					&lt;td align=&quot;right&quot;&gt;&#xa;						&lt;span&gt;【&lt;/span&gt;&lt;a&gt;&lt;span&gt;关闭窗口&lt;/span&gt;&lt;/a&gt;&lt;span&gt;】&lt;/span&gt; &#xa;					&lt;/td&gt;&#xa;				&lt;/tr&gt;&#xa;			&lt;/tbody&gt;&#xa;		&lt;/table&gt;&#xa;	&lt;/div&gt;&#xa;&lt;/div&gt;', '2', '1', 'admin', '2017-04-19 10:21:48', '2017-04-19 14:35:37');
INSERT INTO `lab_news` VALUES ('9', '农牧学院副校长一行走访座谈 ', '', '', '', '&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:26.25pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;月&lt;span&gt;31&lt;/span&gt;日&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;上午&lt;span&gt;9&lt;/span&gt;点&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#2b2b2b;line-height:150%;&quot;&gt;，校长一行到计算机科学与工程学院走访座谈。计算机学院党政领导、院学术委员会成员、部分科研骨干教师参加了座谈。&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt; &lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:26.25pt;&quot;&gt;&#xa;		&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&lt;img src=&quot;/files\\2017-4-19\\03e54b99-1a06-49d8-a740-ca75fc5636f6_1.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;	&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:26.25pt;&quot;&gt;&#xa;		&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&#xa;		&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:26.25pt;&quot;&gt;&#xa;			&lt;span style=&quot;font-family:宋体;color:#2b2b2b;line-height:150%;&quot;&gt;会上，王建国院长首先对张副校长一行表示热烈欢迎。随后王院长全面汇报了学院的总体情况，重点介绍了近年来学院的学科建设、研究方向、实验环境、人才引进、科研经费、科研基地和科研成果等方面的工作，分析了目前存在的问题和今后的工作重点。与会人员就相关问题进行了热烈的讨论。&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&#xa;		&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\f91626a8-0c71-4b30-86b9-c1583a62a553_15b2776732f.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;	&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:26.25pt;&quot;&gt;&#xa;		&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&#xa;		&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:26.25pt;&quot;&gt;&#xa;			&lt;span style=&quot;font-family:宋体;color:#2b2b2b;line-height:150%;&quot;&gt;经过近三个小时的座谈，张副校长对学院所取得的各项成绩以及学院氛围给予了充分肯定，并对学院今后的工作提出了希望和建议。 &lt;/span&gt;&#xa;		&lt;/p&gt;&#xa;		&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;			&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;文&lt;span&gt;/&lt;/span&gt;图：解军强&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;审稿：李晋惠&lt;/span&gt;&#xa;		&lt;/p&gt;&#xa;		&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;			&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &#xa;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;计算机学院&lt;/span&gt;&#xa;		&lt;/p&gt;&#xa;		&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;			&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &#xa;2017&lt;span&gt;&lt;span&gt;年3&lt;/span&gt;&lt;/span&gt;&lt;span&gt;&lt;span&gt;月31&lt;/span&gt;&lt;/span&gt;&lt;span&gt;&lt;span&gt;日&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&#xa;		&lt;/p&gt;&#xa;&lt;br /&gt;&#xa;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#2b2b2b;line-height:150%;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt; &lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;&lt;/p&gt;', '2', '1', 'admin', '2017-04-19 17:58:59', '2017-04-19 17:58:59');
INSERT INTO `lab_news` VALUES ('10', '计算机科学与工程学院召开党员发展工作会议 ', '', '', '', '&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;text-indent:27pt;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;span&gt;3&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;月&lt;/span&gt;&lt;span&gt;30&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;日&lt;/span&gt;&lt;span&gt;10&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;点，计算机科学与工程学院在工科&lt;/span&gt;&lt;span&gt;1-311&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;室召开&lt;/span&gt;&lt;span&gt;2017&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年度上半年党员发展工作会议。会议由学院党委副书记李颖同志主持，各学生党支部书记和各年级辅导员全部参加。根据校党委&lt;/span&gt;&lt;span&gt;2017&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年度上半年党员发展工作要求，学院党委郭蓉老师就本期党员发展的人数、相关资料的填写要求、时间节点、注意事项等向大家做了详细说明，希望各支部严格按照文件要求开展组织发展相关工作，确保学院组织发展工作按时完成。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;img src=&quot;/files\\2017-4-19\\2e136ef7-0191-4d20-8a0a-056e5c7850dc_15b21fa6dd9.jpg&quot; alt=&quot;&quot; /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;text-indent:27pt;&quot; align=&quot;left&quot;&gt;&#xa;		&lt;span style=&quot;font-family:宋体;&quot;&gt;李颖副书记对本期党员发展工作提出几点具体要求：一是，要求各支部严格组织发展流程，坚持“成熟一个，发展一个”的原则，坚持实事求是，确保党员发展工作的公开、公平、公正。二是，要求对拟发展党员进行党史、党建等相关理论知识答辩，确保新发展党员的质量，坚持宁缺毋滥。三是，要求对拟发展党员在填写相关资料之前进行指导培训，规范组织发展程序。四是，要求各支部严把组织发展关，注重学生党员的后期培养教育，确保学生党员在以后的学生、工作中更好的发挥先锋模范带头作用。&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;&lt;span&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;撰稿人：张红霞&lt;/span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;审稿人：李颖&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;', '2', '1', 'admin', '2017-04-19 18:00:48', '2017-04-19 18:00:48');
INSERT INTO `lab_news` VALUES ('11', '计算机科学与工程学院组织学生观看“感动中国”系列活动 ', '', '', '', '&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;	&lt;span&gt;3&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;月&lt;/span&gt;&lt;/span&gt;23&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;日&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;，&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;计算机科学与工程学院团委组织&lt;/span&gt;&lt;span&gt;16&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;级&lt;/span&gt;&lt;span&gt;1-9&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;班同学在教一&lt;/span&gt;&lt;span&gt;205&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;观看了“&lt;/span&gt;&lt;span&gt;2016&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;感动中国”节目。此次活动由院团委组织部部长姚远主持，带领同学们一起学习、观看了感动中国人物的先进事迹。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;	&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;通过观看“感动中国&lt;/span&gt;&lt;span&gt;2016&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年度人物”视频，使同学们了解并学习到：孙家栋院士为我国航天事业奉献一生；王锋在危难面前舍己救人，无私无畏；文月英老师奉献青春，支教大山深处两代人；秦玥飞求学归来，献身于农村服务；张超临危不惧，英雄身姿展虹霓；李万君钻研技术，为中国梦提速；梁益建医者仁心，打开患者的重叠人生；郭小平校长创建红丝带学校，为艾滋患儿撑死一片天；阿布列林·阿不列孜将“为人民服务”作为信仰，人民的铁面法官；潘建伟坚持科学真谛和宇宙对话；中国女排用毅力与信仰再创中国奇迹！这些人用他们的无私奉献、高尚品质，在各自的工作岗位上成就了自己，创造了辉煌，感动了我们，感动了中国。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;	&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;通过此次活动，增强了同学们的爱国意识，激发了同学们的奉献精神，同时也激励着同学们认真学习，不断充实自己，为实现自己的理想而努力奋斗！&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;	&lt;span&gt;&amp;nbsp;&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;撰稿人：张红霞&lt;/span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;审稿人：李颖&lt;/span&gt;&#xa;&lt;/p&gt;', '2', '1', 'admin', '2017-04-19 18:01:18', '2017-04-19 18:01:18');
INSERT INTO `lab_news` VALUES ('12', '科研方向', '', '', '', '&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span&gt;1&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．人工智能及故障诊断专家系统&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;基于人工智能理论，注重在武器系统故障诊断、智能决策系统、模式识别与图像处理等领域，从“八&lt;/span&gt;&lt;span&gt;.&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;五”起为军队自动化指挥与火控武器系统装备的高效运行、故障维护服务，并先后在“九&lt;/span&gt;&lt;span&gt;.&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;五”、“十&lt;/span&gt;&lt;span&gt;.&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;五”、“十一&lt;/span&gt;&lt;span&gt;.&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;五“等国防及兵器集团项目中围绕军师级防空情报指挥系统、大型重点武器的火控系统故障诊断、在线故障诊断专家系统检测平台等课题开展了深入研究，将人工智能理论、神经网络理论和嵌入式技术引入故障诊断专家系统中，在基于神经网络的故障诊断、数据融合、知识管理与获取方面，取得了一系列具有国际水平的研究成果。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;从&lt;/span&gt;&lt;span&gt;1993&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年起，该方向先后主持并承担了“某型故障诊断专家系统软件（总装备部）”、“集团军（师）炮兵、防空作战指挥系统检测维修车故障诊断专家系统（总装备部）”、“某军用机电设备故障诊断专家系统研制（总装备部）”“高炮、地空导弹旅（团）情报指挥系统检测维修站（兵器工业集团）”、“兵器故障诊断和专家系统实现（兵器工业集团）”、“集团军（师）情报指挥系统故障诊断专家系统（兵器重点型号项目）”、“军用系统故障诊断专家系统”、“军用火控系统故障诊断专家系统”、“远程军用系统维修站”等国家与省部级项目。分别获得国家科技进步二等奖&lt;/span&gt;&lt;span&gt;1&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项、兵器工业科技进步二等奖&lt;/span&gt;&lt;span&gt;3&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项、三等奖&lt;/span&gt;&lt;span&gt;2&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;对提高我国陆军装备的可维修性、机动性做出了突出贡献，其中“军用火控系统故障诊断专家系统”作为型号配备相关武器系统，所开发故障诊断专家系统在总装备部、兵器集团总公司组织的成果鉴定中均优于国内同类产品，具有定位迅速、准确、知识库维护容易等优点，该成果在国内处于领先地位。并在外贸项目中被翻译成英、法文版本销售，创造经济效益近千万元。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span&gt;2&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．情报指挥自动化系统&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;该方向研究人员参加了我国第一套高炮（地空导弹）情报指挥系统（“高炮、地空导弹旅（团）情报指挥系统”）的研制，获兵器部科技进步特等奖。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span&gt;1994&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年以来，基于对神经网络和数据融合理论的研究，本方向承担了多个军品项目的研制，包括重点军品项目“集团军（师）防空指挥系统”、“信息传递模型研究及综合评价（兵器工业集团）”、“神经网络在数据融合中的应用研究（兵器预研支撑基金）”、“机动部队&lt;/span&gt;&lt;span&gt;C3I&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;网络通信协议转换器研制（兵器工业集团）”、“集团军防空作战指挥系统通讯网络”、“数字化智能监控系统”等，项目均通过上级鉴定，共获得内蒙古自治区国防科技进步三等奖&lt;/span&gt;&lt;span&gt;2&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项、兵器工业科技进步三等奖&lt;/span&gt;&lt;span&gt;2&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项。研究成果处于国内先进水平。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span&gt;3&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．智能检测与控制&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;姿态传感器列装多种自行、空降火炮及舰炮系统；传感器、物联网技术得到进一步广泛应用。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;img src=&quot;/files\\2017-4-19\\fcad3959-9c51-465e-8ede-788fd7aacaf2_wfhd_image001.gif&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&#xa;	&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;		&lt;span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;在生理感知计算研究领域，融合生物感知、传感器和机器视觉技术，对人和动物的生理反应进行测量、分析其感知。提出了基于眼动的情感计算模型，研制了“一体化眼动测量系统”交付部队；应用在国家新药特药研发、飞行员眩晕症检测、人机仪表盘布局设计评估、基于人眼的兴趣点分析、基于刺激信号的生物感知实验，情感表达与计算等领域。&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;	&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;		&lt;span style=&quot;font-family:宋体;&quot;&gt;已申请实用新型专利&lt;/span&gt;&lt;span&gt;4&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项，授权专利&lt;/span&gt;&lt;span&gt;3&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项，发表高水平论文&lt;/span&gt;&lt;span&gt;30&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;篇。&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\d7547833-e600-48e1-b5f0-34fbc5c8c3cb_1.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;img src=&quot;/files\\2017-4-19\\503fe25f-f507-4f5f-81e7-6e90a1831bd4_2.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;img src=&quot;/files\\2017-4-19\\7edf40d2-da74-4904-94b8-4cb9a4379147_3.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;img src=&quot;/files\\2017-4-19\\2971c9bf-7f34-4b58-8f83-f115e9b9d081_4.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&#xa;	&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;		&lt;span&gt;4. &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;通信网络仿真技术&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;	&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;		&lt;span style=&quot;font-family:宋体;&quot;&gt;该方向是一个长期的优势研究方向，早在&lt;/span&gt;&lt;span&gt;1996&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年就在该领域开始了研究，主要对军事通信网络的体系结构、通信协议、网络管理、安全策略等进行仿真研究。在国防“九&lt;/span&gt;&lt;span&gt;.&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;五”期间，承担了“野战通讯网络仿真”、“信息传递模型与综合评价指标研究”、“移动式&lt;/span&gt;&lt;span&gt;C3I&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;系统检测评估、试验方法及性能分析”等课题的研究。在国防“九&lt;/span&gt;&lt;span&gt;.&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;五”至“十二五”期间，承担基于&lt;/span&gt;&lt;span&gt;HLA&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;的“&lt;/span&gt;&lt;span&gt;C4ISR&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;通信网”和“战术指挥控制系统通信网”仿真、“战术通信网络”仿真与服务技术、基于天基的“战术通信网络”仿真技术研究。&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;	&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;		&lt;span style=&quot;font-family:宋体;&quot;&gt;学院也在军用网络系统仿真、建模和电力&lt;/span&gt;&lt;span&gt;MIS&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;应用系统开发、计算机网络应用、分布式系统等领域承担了国家、省部级的科研项目，取得了一批具有国内、国际先进水平的科研成果。在军用通信、雷达通信网络系统的仿真中，始终追踪先进的仿真研究成果，扩大无线自组网、无线传感器网络等研究领域，结合前期的科研成果，先后在传感器网络、自组网、实时分布式网络仿真领域取得了开拓性的成果。&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;&lt;/p&gt;', '1', '1', 'admin', '2017-04-19 18:30:11', '2017-04-19 18:30:11');
INSERT INTO `lab_news` VALUES ('13', '学术交流', '', '', '', '&lt;p class=&quot;a&quot; style=&quot;text-indent:0cm;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;觉行职业学校承办第七届全国兵器工程领域工程硕士研究教育工作研讨会&lt;/span&gt;&lt;span style=&quot;color:red;&quot;&gt;&lt;a href=&quot;/system/neweditor/ewebeditor.htm?id=wbcontent&amp;amp;style=standard650&amp;amp;fullscreen=0&amp;amp;codeflag=2#_1._觉行职业学校承办第七届全国兵器工程领域工程硕士研究教育工作研讨会_1&quot;&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;（&lt;span&gt;链&lt;span&gt;接&lt;span&gt;）&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 觉行职业学校计算机科学与工程学院主办“&lt;/span&gt;&lt;span&gt;2012 &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;计算机科学与信息处理国际会议”&lt;/span&gt;&lt;span style=&quot;color:red;&quot;&gt; &lt;span&gt;&lt;a href=&quot;/system/neweditor/ewebeditor.htm?id=wbcontent&amp;amp;style=standard650&amp;amp;fullscreen=0&amp;amp;codeflag=2#_2._觉行职业学校计算机科学与工程学院主办“2012_计算机科学与信息&quot;&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;（链&lt;span&gt;接&lt;span&gt;）&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 南京理工大学杨静宇教授到我校进行学术交流&lt;/span&gt;&lt;span style=&quot;color:red;&quot;&gt;&lt;a href=&quot;/system/neweditor/ewebeditor.htm?id=wbcontent&amp;amp;style=standard650&amp;amp;fullscreen=0&amp;amp;codeflag=2#_3._南京理工大学杨静宇教授到我校进行学术交流&quot;&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;（链接&lt;span&gt;）&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 觉行职业学校举办“&lt;/span&gt;&lt;span&gt;2011&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年网络工程与计算机科学国际学术会议&lt;/span&gt;&lt;span&gt;(ICSNCE2011)&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;”&lt;/span&gt;&lt;span style=&quot;color:red;&quot;&gt;&lt;a href=&quot;/system/neweditor/ewebeditor.htm?id=wbcontent&amp;amp;style=standard650&amp;amp;fullscreen=0&amp;amp;codeflag=2#_4._觉行职业学校举办“2011年网络工程与计算机科学国际学术会议(I&quot;&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;（&lt;span&gt;链&lt;span&gt;接）&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 中国计算机学会和觉行职业学校联合举办“&lt;/span&gt;&lt;span&gt;CCF&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;走进高校”学术活动&lt;/span&gt;&lt;span style=&quot;color:red;&quot;&gt;&lt;a href=&quot;/system/neweditor/ewebeditor.htm?id=wbcontent&amp;amp;style=standard650&amp;amp;fullscreen=0&amp;amp;codeflag=2#_5._中国计算机学会和觉行职业学校联合举办“CCF走进高校”学术活动&quot;&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;（链&lt;span&gt;接&lt;span&gt;）&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 觉行职业学校举办&lt;/span&gt;&lt;span&gt;2011&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;光电工程和信息科学国际会议&lt;/span&gt;&lt;span style=&quot;color:red;&quot;&gt;&lt;a href=&quot;/system/neweditor/ewebeditor.htm?id=wbcontent&amp;amp;style=standard650&amp;amp;fullscreen=0&amp;amp;codeflag=2#_6._觉行职业学校举办2011光电工程和信息科学国际会议&quot;&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;（链&lt;span&gt;接&lt;span&gt;）&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;a name=&quot;_1._觉行职业学校承办第七届全国兵器工程领域工程硕士研究教育工作研讨会&quot;&gt;&lt;/a&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;h1&gt;&#xa;	&lt;span class=&quot;CharChar3&quot;&gt;&lt;span&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span&gt;. &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;觉行职业学校承办第七届全国兵器工程领域工程硕士研究教育工作研讨会&lt;/span&gt; &#xa;&lt;/h1&gt;&#xa;&lt;p class=&quot;MsoTitle&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &#xa;觉行职业学校承办第七届全国兵器工程领域&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoTitle&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 工程硕士研究教育工作研讨会&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;color:red;&quot;&gt;&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:-31.5pt;text-indent:24pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;觉行职业学校承办的“第七届全国兵器工程领域工程硕士研究教育工作研讨会”于&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;2013&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;10&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;15&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;日&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;在觉行职业学校召开，&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;本届研讨会就“兵器工程”领域工程硕士的培养现状与前景、全日制工程硕士的培养工作经验等相关事宜进行了交流与探讨，进一步加强了协作组成员的交流与协作。&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\54f0fbc2-df38-4b33-b6b6-f833ebbcdd17_22.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;img src=&quot;/files\\2017-4-19\\2cfa7773-16b9-4156-95dc-6665573f0188_24.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-52.5pt;text-indent:21pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;白万民&lt;/span&gt;&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;老师（右二）在会上作报告&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;span style=&quot;font-size:10.5pt;font-family:仿宋_GB2312;&quot;&gt;&lt;br /&gt;&#xa;&lt;/span&gt; &#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-52.5pt;text-indent:21pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;h1&gt;&#xa;	&lt;a name=&quot;_2._觉行职业学校计算机科学与工程学院主办“2012_计算机科学与信息&quot;&gt;&lt;/a&gt;&lt;span class=&quot;CharChar3&quot;&gt;&lt;span style=&quot;font-weight:normal;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 2. &lt;/span&gt;&lt;/span&gt;&lt;span class=&quot;CharChar3&quot;&gt;&lt;span style=&quot;font-family:宋体;font-weight:normal;&quot;&gt;觉行职业学校计算机科学与工程学院主办“&lt;/span&gt;&lt;/span&gt;&lt;span class=&quot;CharChar3&quot;&gt;&lt;span style=&quot;font-weight:normal;&quot;&gt;2012 &lt;/span&gt;&lt;/span&gt;&lt;span class=&quot;CharChar3&quot;&gt;&lt;span style=&quot;font-family:宋体;font-weight:normal;&quot;&gt;计算机科学与信息处理国际会议”&lt;/span&gt;&lt;/span&gt; &#xa;&lt;/h1&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;觉行职业学校计算机科学与工程学院主办&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:Cambria;&quot;&gt;“2012 &lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;计算机科学与信息处理国际会议&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:Cambria;&quot;&gt;”&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:-31.5pt;text-indent:24pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;觉行职业学校计算机科学与工程学院主办、&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;IEEE&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;西安分会支持、美国密苏里州立大学协办的&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;2012 &#xa;International Conference on Computer Science and Information &#xa;Processing&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;于&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;2012&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;8&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;24&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;日&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;~26&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;日在南洋大酒店召开。&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\ca4bc37a-1284-4b5f-aa8c-50addebc776f_25.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;参会者合影&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;span style=&quot;font-size:10.5pt;font-family:仿宋_GB2312;&quot;&gt;&lt;br /&gt;&#xa;&lt;/span&gt; &#xa;&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;h1&gt;&#xa;	&lt;a name=&quot;_3._南京理工大学杨静宇教授到我校进行学术交流&quot;&gt;&lt;/a&gt;&lt;span class=&quot;CharChar3&quot;&gt;&lt;span style=&quot;font-weight:normal;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 3. &lt;/span&gt;&lt;/span&gt;&lt;span class=&quot;CharChar3&quot;&gt;&lt;span style=&quot;font-family:宋体;font-weight:normal;&quot;&gt;南京理工大学杨静宇教授到我校进行学术交流&lt;/span&gt;&lt;/span&gt; &#xa;&lt;/h1&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;color:red;&quot;&gt;&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;南京理工大学杨静宇教授到我校进行学术交流&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:-31.5pt;text-indent:24pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;2012&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;16&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;日&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;，应觉行职业学校研究生部和计算机学院邀请，南京理工大学杨静宇教授到校进行学术交流，为我校师生做了题为“人工智能面对应用问题的挑战”的学术讲座。讲座由计算机学院院长白万民主持，南京理工大学机电学院副院长张功萱、我校研究生部主任雷亚萍和电信学院院长雷志勇，以及计算机学院、电信学院、光电学院、机电学院和理学院近&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;300&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;名教师和研究生聆听了讲座。陈桦副校长、研究生部和部分学院教师与杨靖宇、张功萱教授一起就研究生培养与学科建设中感兴趣的话题进行了充分交流，使大家受益匪浅。&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\083ad3c7-6952-4090-94e1-3a870f6eda0f_26.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;img src=&quot;/files\\2017-4-19\\0ff64405-87c3-4574-a71a-ef9ac8e0c276_27.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-52.5pt;text-indent:21pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;师生正在认真听杨静宇教授讲座&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;span style=&quot;font-size:10.5pt;font-family:仿宋_GB2312;&quot;&gt;&lt;br /&gt;&#xa;&lt;/span&gt; &#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-52.5pt;text-indent:21pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;h1&gt;&#xa;	&lt;a name=&quot;_4._觉行职业学校举办“2011年网络工程与计算机科学国际学术会议(I&quot;&gt;&lt;/a&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 4. &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;觉行职业学校举办“&lt;/span&gt;&lt;span&gt;2011&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年网络工程与计算机科学国际学术会议&lt;/span&gt;&lt;span&gt;(ICSNCE2011)&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;”&lt;/span&gt; &#xa;&lt;/h1&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-31.5pt;text-indent:30.1pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;觉行职业学校举办&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-31.5pt;text-indent:30.1pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;“&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;2011&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;年网络工程与计算机科学国际学术会议&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;(ICSNCE2011)&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;”&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-31.5pt;text-indent:30.1pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:-31.5pt;text-indent:24pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;觉行职业学校举办“&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;2011&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;年网络工程与计算机科学国际学术会议&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;(ICSNCE2011)&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;”，会议邀请印度、新加坡、台湾等国外专家，以及复旦大学、武汉大学和清华大学教授做专题报告，会议就计算机网络与计算机科学相关课题进行交流，会议邀请西安交通大学冯博琴教授、西北大学耿国华教授莅临指导。&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\8acc3d52-26bd-487d-aa21-83bb631f7f94_28.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;img src=&quot;/files\\2017-4-19\\c3515952-f0a8-428d-aa23-b2aa3cbed844_29.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-52.5pt;text-indent:21pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;大会会场&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;span style=&quot;font-size:10.5pt;font-family:仿宋_GB2312;&quot;&gt;&lt;br /&gt;&#xa;&lt;/span&gt; &#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-52.5pt;text-indent:21pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;h1&gt;&#xa;	&lt;a name=&quot;_5._中国计算机学会和觉行职业学校联合举办“CCF走进高校”学术活动&quot;&gt;&lt;/a&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 5. &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;中国计算机学会和觉行职业学校联合举办“&lt;/span&gt;&lt;span&gt;CCF&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;走进高校”学术活动&lt;/span&gt; &#xa;&lt;/h1&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-31.5pt;text-indent:30.1pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;中国计算机学会和觉行职业学校联合举办&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-31.5pt;text-indent:30.1pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;“&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;CCF&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;走进高校”学术活动&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-31.5pt;text-indent:30.1pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;margin-left:-31.5pt;text-indent:24pt;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;2011&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;5&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;14&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;日&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;，中国计算机学会和觉行职业学校联合举办的“&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;CCF&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;走进高校”学术活动在觉行职业学校未央新校区图书馆报告厅举行了专场报告会。中国计算机学会秘书长杜子德研究员、学会理事陈沛先生和臧根林先生给师生做了题为“中国搜索引擎技术的机遇与挑战”内容的学术报告、并就计算机学科技术发展、技术人员如何成长和成功回答了同学们的热烈提问。觉行职业学校计算机科学与工程学院近四百研究生、本科生和教师聆听了讲者精彩的报告，报告会由学院院长白万民教授主持。&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\b69ecf28-d051-4776-98c7-e1a91e62de85_222.gif&quot; alt=&quot;&quot; /&gt; &#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;img src=&quot;/files\\2017-4-19\\331ce6f8-2aa4-4e6b-a8e6-08f902368f9f_223.gif&quot; alt=&quot;&quot; /&gt; &#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;h1&gt;&#xa;	&lt;span&gt; 6. &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;觉行职业学校举办&lt;/span&gt;&lt;span&gt;2011&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;光电工程和信息科学国际会议&lt;/span&gt; &#xa;&lt;/h1&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;觉行职业学校举办&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;2011&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;光电工程和信息科学国际会议&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:-31.5pt;text-indent:24pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;觉行职业学校举办&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;2011&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;光电工程和信息科学国际会议，来自美国、澳大利亚、日本、新加坡及中国台湾以及来自省内外高校、科研院所专家学者&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;200&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;余人参加了本次学术会议。参会学者就最新研究成果进行了广泛深入的交流。本次会议对推动我校与世界范围高校在计算机相关领域的学术交流、科技创新和成果转化具有积极的作用，为提升我校在该领域的影响力具有十分重要的意义。&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\82e79fc6-bfb5-4488-9a31-41a8411c5902_30.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;img src=&quot;/files\\2017-4-19\\6335ba32-65e7-47c7-846b-39f262f8ee1c_31.jpg&quot; alt=&quot;&quot; /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;img src=&quot;/files\\2017-4-19\\a1d1cbbe-3d15-4ffd-9573-804a2f4bd503_32.jpg&quot; alt=&quot;&quot; /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;		&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;参会者合影&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;&lt;/p&gt;', '1', '1', 'admin', '2017-04-19 18:39:28', '2017-04-19 18:40:00');
INSERT INTO `lab_news` VALUES ('14', '计算机科学与工程学院综合实验中心', '', '', '', '觉行职业学校计算机综合实验教学中心，最早可以追溯到1978 年建立的西安工业学院电子系计算机实验室和1984年建立的西安工业学院计算中心。西安工业学院早在1978年就开办计算机及应用专业，是内蒙古自治区开办计算机学科专业最早的高等院校之一。当时的计算机及应用专业开设有计算机硬件和计算机软件两个专业方向。建立的实验室主要完成计算机学科专业基础课程的实验、课程设计等。1984年，为了满足计算机专业核心课程（如操作系统、数据结构）以及程序设计实验的需要，西安工业学院耗资50余万美元，建立了高水平的计算中心，该中心的主要设备是VAX8300小型计算机，该小型机拥有60个终端。 &lt;br /&gt;&#xa;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1989年，计算机专业从电子系独立出来，单独成立计算机科学与工程系，并建立了计算机综合实验室，该实验室主要承担计算机专业的专业基础课程、专业课程的课内实验、课程设计以及毕业设计。 &lt;br /&gt;&#xa;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1998年，根据教育部专业调整要求，计算机及应用专业调整为计算机科学与技术专业。此时，原来按照旧的专业模式设置的实验室，布局分散，利用率低，不能很好地适应新专业的发展需求。为了适应教改新形势，反映学科的最新发展，扩大办学规模，在充分调研的基础上，1999年，学校决定将计算中心与计算机综合实验室合并，正式建立“计算机综合实验教学中心”，从而使计算机综合实验教学中心迎来了跨越式的大发展。计算机综合实验教学中心将原有的教学实验设施进行了调整、重组和优化，下设计算机组成原理实验室、电子技术实验室、微机原理与接口实验室、数字逻辑实验室、大学生计算机房等。 &lt;br /&gt;&#xa;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2003年，学校为了推进二级管理，促进我校计算机学科的发展，计算机科学与工程系升格为计算机科学与工程学院，从而计算机学科和专业迎来了新的发展机遇。同年，经过大量调研，结合我校本科人才培养的定位，将计算机科学与技术专业划分为计算机控制、计算机网络和计算机软件三个专业方向。2004年，经教育部批准，开设“软件工程”专业。2005年，开设“信息对抗技术”和“探测制导与控制技术”两个兵器类专业。2006年开设“网络工程”专业。为了适应众多专业的发展和需要，2006年，觉行职业学校召开了“实践教学研讨会”，明确提出了“实验综合化、实践工程化”的实践教学理念。为此，计算机综合实验教学中心，在充分调研的基础上，逐步构建了科学、完善的计算机类专业实践教学体系。该体系包括实践教学目标体系、实践教学内容体系、实践教学管理体系和实践教学条件体系，从而为计算机综合实验教学中心在发展目标、改革方向、改革思路上构建了基本框架。实验中心先后与英蓓特公司建立了“觉行职业学校---英蓓特嵌入式实验室”，与欧姆龙公司建立了“觉行职业学校---欧姆龙PLC实验室”等。2007年，本实验教学中心被评为校级示范教学中心。同年12月，申报的研究课题《应用型软件人才培养模式的研究与实践》获内蒙古自治区教学成果二等奖。 &lt;br /&gt;&#xa;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2008年，实验中心开展了现代工程师培养模式和实践环节体系的研究，并以软件服务外包为典型，开展软件工程实践的改革与创新。2009年10月，中心申报的“服务外包型软件工程师培养模式创新实验区”被内蒙古自治区教育厅批准为内蒙古自治区人才培养创新实验区。2009年12月，软件工程专业被评为国家级第二类特色专业。2008年，中心建立了“探测制导与控制综合实验室”，并更新和扩充了“微机原理实验室”；2009年建立了“网络对抗与信息安全实验室”；2010年建立了“计算机基础教学改革实验室”和“软件建模实验室”；2011年建立了“无线传感器网络实验室”和“软件工程实验室”；目前，正在筹建“嵌入式系统实训基地”。 &lt;br /&gt;&#xa;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2010年，我校确定了教学科研型省属高水平大学的建设目标，同年我校获批为博士点建设立项单位，其中，计算机科学技术学科为博士点建设的支撑学科。2013年，历经三年博士立项建设，国务院学位委员会批准我校为博士学位授予单位。为了适应学校发展步伐，同时推进计算机学科的进一步发展，我们在原来“实验综合化、实践工程化”的实践教学理念基础上，提出了“以综合素质为前提，以提高学生的工程实践与创新能力为关键，符合现代工程特点，实验综合化、实践工程化”的实践教学理念。在具体实施方面，完善和优化实践教学体系，进一步整合实践课程体系，优化实践教学资源，以“产学结合、互相渗透、优势互补、资源互用、利益共享”的模式，寻求与校外知名企业联合培养具有良好工程实践能力和创新能力的人才。 &lt;br /&gt;&#xa;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;经过三十多年的建设与发展，目前计算机综合实验教学中心与内蒙古自治区“服务外包型软件工程师培养模式创新实验区”以及“新型网络与检测控制国家地方联合工程实验室”一起构成了优良的人才培养平台和基地。实验中心拥有一支由专家、教授、高级工程师以及工程技术人员等组成的核心队伍，承担着 45门次课程的实验教学任务，开设出的本科教学实验项目130多个，开设独立实验课5门。中心占地2100余平米，拥有大学生计算机机房、网络工程训练中心、网络对抗与信息安全实验室、探测制导与控制综合实验室、无线传感器网络实验室、嵌入式系统实验室等13个实验室；各种仪器设备3401台套，设备总值2255万元。为全校41个本科专业提供计算机基础教学实验，为22个专业提供微机原理教学实验，为8个专业提供专业基础以及专业实验。同时，为计算机相关专业提供课程设计、独立实验课程、毕业设计等所需要的实验实践平台。近年来，中心加大了实验室的开放，增设了5个开放实验室和2个创新实验室。积极支持和组织学生参加多项国家级、省级竞赛，如电子设计大赛、软件设计与开发大赛、数学建模大赛、信息安全技术大赛等。近三年，共有400多名学生参加各种大赛近20项，获得各种奖项30余项。我们力争将计算机综合实验教学中心建设成一个教学科研成果突出，实验教学水平和硬件设施达到国内领先行列、综合实验和创新教育实践达到国内先进、具有广泛辐射作用的国家级计算机综合实验教学示范中心而努力奋斗。', '1', '1', 'admin', '2017-04-19 18:44:59', '2017-04-19 18:44:59');

-- ----------------------------
-- Table structure for `lab_role`
-- ----------------------------
DROP TABLE IF EXISTS `lab_role`;
CREATE TABLE `lab_role` (
  `role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(35) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_description` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '角色说明',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '0-启用   10-禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `version` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';

-- ----------------------------
-- Records of lab_role
-- ----------------------------
INSERT INTO `lab_role` VALUES ('1', '学生角色', '', '0', '2016-11-11 11:11:11', '2016-10-03 10:55:17', '0');
INSERT INTO `lab_role` VALUES ('2', '教师角色', '', '0', '2016-11-11 11:11:11', null, '0');
INSERT INTO `lab_role` VALUES ('3', '管理员角色', '', '0', '2016-11-11 11:11:11', '2017-02-08 16:54:42', '0');

-- ----------------------------
-- Table structure for `lab_room`
-- ----------------------------
DROP TABLE IF EXISTS `lab_room`;
CREATE TABLE `lab_room` (
  `room_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '教室ID',
  `room_code` varchar(20) NOT NULL DEFAULT '' COMMENT '教室编号',
  `room_name` varchar(50) NOT NULL DEFAULT '' COMMENT '教室名称',
  `department` varchar(50) NOT NULL DEFAULT '' COMMENT '院系名称',
  `measure_area` varchar(50) NOT NULL DEFAULT '' COMMENT '面积',
  `area` varchar(128) NOT NULL DEFAULT '' COMMENT '地点',
  `leader` varchar(32) NOT NULL DEFAULT '' COMMENT '负责人',
  `place_count` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '课位数量',
  `place_ok_count` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '已预约课位数量',
  `room_rows` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '课位排',
  `room_cols` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '课位列',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='教室表';

-- ----------------------------
-- Records of lab_room
-- ----------------------------
INSERT INTO `lab_room` VALUES ('6', '208', '物联网工程实验室', '计算机系', '100', '实验楼208室', '刘萍', '30', '0', '3', '10', '1', '', '2017-04-19 09:54:28', '2017-04-19 09:54:28');

-- ----------------------------
-- Table structure for `lab_room_order`
-- ----------------------------
DROP TABLE IF EXISTS `lab_room_order`;
CREATE TABLE `lab_room_order` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '预约ID',
  `time_id` bigint(20) NOT NULL DEFAULT '0' COMMENT '时间id',
  `room_id` bigint(20) unsigned NOT NULL COMMENT '教室ID',
  `room_code` varchar(20) NOT NULL DEFAULT '' COMMENT '教室编号',
  `room_name` varchar(50) NOT NULL DEFAULT '' COMMENT '教室名称',
  `room_day` varchar(20) NOT NULL DEFAULT '' COMMENT '日期',
  `time_name` varchar(20) NOT NULL DEFAULT '' COMMENT '课时名称',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `teacher_id` bigint(20) unsigned NOT NULL COMMENT '教师ID',
  `teacher_name` varchar(20) NOT NULL DEFAULT '' COMMENT '教师名称',
  `shenhe_id` bigint(20) unsigned NOT NULL COMMENT '审核人ID',
  `audit_state` tinyint(3) unsigned NOT NULL DEFAULT '10' COMMENT '审核状态[0:无效, 10: 预约新提交(审核中), 20:预约重新提交(审核中) , 30: 预约未通过, 100: 预约通过]',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `remark` varchar(512) DEFAULT NULL COMMENT '审核意见[审核通过 就清空,不通过 就填充个意见]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='教师预约实验室表';

-- ----------------------------
-- Records of lab_room_order
-- ----------------------------
INSERT INTO `lab_room_order` VALUES ('20', '389', '6', '208', '物联网工程实验室', '2017-04-24', '2017-04-24晚上第2节课', '2017-04-24 20:00:00', '2017-04-24 20:50:00', '38', '刘萍', '0', '100', '1', '', '', '2017-04-19 14:34:10', '2017-04-21 15:00:52');
INSERT INTO `lab_room_order` VALUES ('21', '388', '6', '208', '物联网工程实验室', '2017-04-24', '2017-04-24晚上第1节课', '2017-04-24 19:00:00', '2017-04-24 19:50:00', '38', '刘萍', '0', '100', '1', '', '', '2017-04-19 14:34:10', '2017-04-21 15:00:47');
INSERT INTO `lab_room_order` VALUES ('22', '385', '6', '208', '物联网工程实验室', '2017-04-27', '2017-04-27下午第2节课', '2017-04-27 14:00:00', '2017-04-27 14:50:00', '38', '刘萍', '0', '10', '1', '', '', '2017-04-19 14:34:10', null);
INSERT INTO `lab_room_order` VALUES ('23', '394', '6', '208', '物联网工程实验室', '2017-04-27', '2017-04-27晚上第1节课', '2017-04-27 19:00:00', '2017-04-27 19:50:00', '38', '刘萍', '0', '10', '1', '', '', '2017-04-19 14:34:10', null);
INSERT INTO `lab_room_order` VALUES ('24', '395', '6', '208', '物联网工程实验室', '2017-04-27', '2017-04-27晚上第2节课', '2017-04-27 20:00:00', '2017-04-27 20:50:00', '38', '刘萍', '0', '10', '1', '', '', '2017-04-19 14:34:10', null);
INSERT INTO `lab_room_order` VALUES ('25', '375', '6', '208', '物联网工程实验室', '2017-04-28', '2017-04-28上午第1节课', '2017-04-28 08:00:00', '2017-04-28 08:50:00', '38', '刘萍', '0', '10', '1', '', '', '2017-04-19 14:34:10', null);
INSERT INTO `lab_room_order` VALUES ('26', '415', '6', '208', '物联网工程实验室', '2017-05-13', '2017-05-13下午第3节课', '2017-05-13 15:00:00', '2017-05-13 15:50:00', '38', '刘萍', '0', '100', '1', '', '', '2017-05-10 15:25:04', '2017-05-10 15:25:42');
INSERT INTO `lab_room_order` VALUES ('27', '408', '6', '208', '物联网工程实验室', '2017-05-15', '2017-05-15晚上第3节课', '2017-05-15 21:00:00', '2017-05-15 21:50:00', '38', '刘萍', '0', '100', '1', '', '', '2017-05-10 15:17:39', '2017-05-10 16:08:50');

-- ----------------------------
-- Table structure for `lab_room_station`
-- ----------------------------
DROP TABLE IF EXISTS `lab_room_station`;
CREATE TABLE `lab_room_station` (
  `station_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '课位ID',
  `room_id` bigint(20) unsigned NOT NULL COMMENT '教室ID',
  `room_row` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '课位第几排',
  `room_col` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '课位第几列',
  `station_name` varchar(32) NOT NULL DEFAULT '' COMMENT '课位名字',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8 COMMENT='教室课位表';

-- ----------------------------
-- Records of lab_room_station
-- ----------------------------
INSERT INTO `lab_room_station` VALUES ('259', '6', '1', '1', '第1排，第1列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('260', '6', '1', '2', '第1排，第2列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('261', '6', '1', '3', '第1排，第3列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('262', '6', '1', '4', '第1排，第4列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('263', '6', '1', '5', '第1排，第5列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('264', '6', '1', '6', '第1排，第6列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('265', '6', '1', '7', '第1排，第7列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('266', '6', '1', '8', '第1排，第8列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('267', '6', '1', '9', '第1排，第9列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('268', '6', '1', '10', '第1排，第10列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('269', '6', '2', '1', '第2排，第1列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('270', '6', '2', '2', '第2排，第2列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('271', '6', '2', '3', '第2排，第3列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('272', '6', '2', '4', '第2排，第4列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('273', '6', '2', '5', '第2排，第5列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('274', '6', '2', '6', '第2排，第6列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('275', '6', '2', '7', '第2排，第7列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('276', '6', '2', '8', '第2排，第8列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('277', '6', '2', '9', '第2排，第9列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('278', '6', '2', '10', '第2排，第10列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('279', '6', '3', '1', '第3排，第1列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('280', '6', '3', '2', '第3排，第2列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('281', '6', '3', '3', '第3排，第3列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('282', '6', '3', '4', '第3排，第4列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('283', '6', '3', '5', '第3排，第5列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('284', '6', '3', '6', '第3排，第6列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('285', '6', '3', '7', '第3排，第7列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('286', '6', '3', '8', '第3排，第8列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('287', '6', '3', '9', '第3排，第9列', '1', '', '2017-04-19 09:54:28', null);
INSERT INTO `lab_room_station` VALUES ('288', '6', '3', '10', '第3排，第10列', '1', '', '2017-04-19 09:54:28', null);

-- ----------------------------
-- Table structure for `lab_room_time`
-- ----------------------------
DROP TABLE IF EXISTS `lab_room_time`;
CREATE TABLE `lab_room_time` (
  `time_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '教室ID',
  `room_id` bigint(20) unsigned NOT NULL COMMENT '教室ID',
  `room_code` varchar(20) NOT NULL DEFAULT '' COMMENT '教室编号',
  `room_name` varchar(50) NOT NULL DEFAULT '' COMMENT '教室名称',
  `room_day` varchar(20) NOT NULL DEFAULT '' COMMENT '日期',
  `time_name` varchar(40) NOT NULL DEFAULT '' COMMENT '课时名称',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `room_time_type` varchar(20) NOT NULL DEFAULT '' COMMENT '时间周期：上午 下午 晚上',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `check_state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '是否可预约[1:可预约, 2:不可预约]',
  `audit_state` tinyint(3) DEFAULT '0' COMMENT '审核状态 0:无效, 1: 审核不通过, 2: 审核通过 ',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`time_id`)
) ENGINE=InnoDB AUTO_INCREMENT=420 DEFAULT CHARSET=utf8 COMMENT='实验室时间表';

-- ----------------------------
-- Records of lab_room_time
-- ----------------------------
INSERT INTO `lab_room_time` VALUES ('363', '6', '208', '物联网工程实验室', '2017-04-24', '2017-04-24上午第1节课', '2017-04-24 08:00:00', '2017-04-24 08:50:00', '上午', '1', '1', '0', '', '2017-04-19 14:34:09', '2017-04-19 14:46:32');
INSERT INTO `lab_room_time` VALUES ('364', '6', '208', '物联网工程实验室', '2017-04-24', '2017-04-24上午第2节课', '2017-04-24 09:00:00', '2017-04-24 09:50:00', '上午', '1', '1', '0', '', '2017-04-19 14:34:09', '2017-04-19 14:34:09');
INSERT INTO `lab_room_time` VALUES ('365', '6', '208', '物联网工程实验室', '2017-04-24', '2017-04-24上午第3节课', '2017-04-24 10:00:00', '2017-04-24 10:50:00', '上午', '1', '1', '0', '', '2017-04-19 14:34:09', '2017-04-19 14:34:09');
INSERT INTO `lab_room_time` VALUES ('366', '6', '208', '物联网工程实验室', '2017-04-25', '2017-04-25上午第1节课', '2017-04-25 08:00:00', '2017-04-25 08:50:00', '上午', '1', '1', '0', '', '2017-04-19 14:34:09', '2017-04-19 14:34:09');
INSERT INTO `lab_room_time` VALUES ('367', '6', '208', '物联网工程实验室', '2017-04-25', '2017-04-25上午第2节课', '2017-04-25 09:00:00', '2017-04-25 09:50:00', '上午', '1', '1', '0', '', '2017-04-19 14:34:09', '2017-04-19 14:34:09');
INSERT INTO `lab_room_time` VALUES ('368', '6', '208', '物联网工程实验室', '2017-04-25', '2017-04-25上午第3节课', '2017-04-25 10:00:00', '2017-04-25 10:50:00', '上午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('369', '6', '208', '物联网工程实验室', '2017-04-26', '2017-04-26上午第1节课', '2017-04-26 08:00:00', '2017-04-26 08:50:00', '上午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('370', '6', '208', '物联网工程实验室', '2017-04-26', '2017-04-26上午第2节课', '2017-04-26 09:00:00', '2017-04-26 09:50:00', '上午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('371', '6', '208', '物联网工程实验室', '2017-04-26', '2017-04-26上午第3节课', '2017-04-26 10:00:00', '2017-04-26 10:50:00', '上午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('372', '6', '208', '物联网工程实验室', '2017-04-27', '2017-04-27上午第1节课', '2017-04-27 08:00:00', '2017-04-27 08:50:00', '上午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('373', '6', '208', '物联网工程实验室', '2017-04-27', '2017-04-27上午第2节课', '2017-04-27 09:00:00', '2017-04-27 09:50:00', '上午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('374', '6', '208', '物联网工程实验室', '2017-04-27', '2017-04-27上午第3节课', '2017-04-27 10:00:00', '2017-04-27 10:50:00', '上午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('375', '6', '208', '物联网工程实验室', '2017-04-28', '2017-04-28上午第1节课', '2017-04-28 08:00:00', '2017-04-28 08:50:00', '上午', '1', '2', '0', '', '2017-04-19 14:34:10', '2017-04-22 10:19:48');
INSERT INTO `lab_room_time` VALUES ('376', '6', '208', '物联网工程实验室', '2017-04-28', '2017-04-28上午第2节课', '2017-04-28 09:00:00', '2017-04-28 09:50:00', '上午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('377', '6', '208', '物联网工程实验室', '2017-04-28', '2017-04-28上午第3节课', '2017-04-28 10:00:00', '2017-04-28 10:50:00', '上午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('378', '6', '208', '物联网工程实验室', '2017-04-24', '2017-04-24下午第1节课', '2017-04-24 13:00:00', '2017-04-24 13:50:00', '下午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-21 11:06:45');
INSERT INTO `lab_room_time` VALUES ('379', '6', '208', '物联网工程实验室', '2017-04-24', '2017-04-24下午第2节课', '2017-04-24 14:00:00', '2017-04-24 14:50:00', '下午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('380', '6', '208', '物联网工程实验室', '2017-04-25', '2017-04-25下午第1节课', '2017-04-25 13:00:00', '2017-04-25 13:50:00', '下午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('381', '6', '208', '物联网工程实验室', '2017-04-25', '2017-04-25下午第2节课', '2017-04-25 14:00:00', '2017-04-25 14:50:00', '下午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('382', '6', '208', '物联网工程实验室', '2017-04-26', '2017-04-26下午第1节课', '2017-04-26 13:00:00', '2017-04-26 13:50:00', '下午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('383', '6', '208', '物联网工程实验室', '2017-04-26', '2017-04-26下午第2节课', '2017-04-26 14:00:00', '2017-04-26 14:50:00', '下午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('384', '6', '208', '物联网工程实验室', '2017-04-27', '2017-04-27下午第1节课', '2017-04-27 13:00:00', '2017-04-27 13:50:00', '下午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('385', '6', '208', '物联网工程实验室', '2017-04-27', '2017-04-27下午第2节课', '2017-04-27 14:00:00', '2017-04-27 14:50:00', '下午', '1', '2', '0', '', '2017-04-19 14:34:10', '2017-04-22 10:19:36');
INSERT INTO `lab_room_time` VALUES ('386', '6', '208', '物联网工程实验室', '2017-04-28', '2017-04-28下午第1节课', '2017-04-28 13:00:00', '2017-04-28 13:50:00', '下午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('387', '6', '208', '物联网工程实验室', '2017-04-28', '2017-04-28下午第2节课', '2017-04-28 14:00:00', '2017-04-28 14:50:00', '下午', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('388', '6', '208', '物联网工程实验室', '2017-04-24', '2017-04-24晚上第1节课', '2017-04-24 19:00:00', '2017-04-24 19:50:00', '晚上', '1', '2', '2', '', '2017-04-19 14:34:10', '2017-04-21 15:00:47');
INSERT INTO `lab_room_time` VALUES ('389', '6', '208', '物联网工程实验室', '2017-04-24', '2017-04-24晚上第2节课', '2017-04-24 20:00:00', '2017-04-24 20:50:00', '晚上', '1', '2', '2', '', '2017-04-19 14:34:10', '2017-04-21 15:00:52');
INSERT INTO `lab_room_time` VALUES ('390', '6', '208', '物联网工程实验室', '2017-04-25', '2017-04-25晚上第1节课', '2017-04-25 19:00:00', '2017-04-25 19:50:00', '晚上', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('391', '6', '208', '物联网工程实验室', '2017-04-25', '2017-04-25晚上第2节课', '2017-04-25 20:00:00', '2017-04-25 20:50:00', '晚上', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('392', '6', '208', '物联网工程实验室', '2017-04-26', '2017-04-26晚上第1节课', '2017-04-26 19:00:00', '2017-04-26 19:50:00', '晚上', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('393', '6', '208', '物联网工程实验室', '2017-04-26', '2017-04-26晚上第2节课', '2017-04-26 20:00:00', '2017-04-26 20:50:00', '晚上', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:34:10');
INSERT INTO `lab_room_time` VALUES ('394', '6', '208', '物联网工程实验室', '2017-04-27', '2017-04-27晚上第1节课', '2017-04-27 19:00:00', '2017-04-27 19:50:00', '晚上', '1', '2', '0', '', '2017-04-19 14:34:10', '2017-04-22 10:19:40');
INSERT INTO `lab_room_time` VALUES ('395', '6', '208', '物联网工程实验室', '2017-04-27', '2017-04-27晚上第2节课', '2017-04-27 20:00:00', '2017-04-27 20:50:00', '晚上', '1', '2', '0', '', '2017-04-19 14:34:10', '2017-04-22 10:19:44');
INSERT INTO `lab_room_time` VALUES ('396', '6', '208', '物联网工程实验室', '2017-04-28', '2017-04-28晚上第1节课', '2017-04-28 19:00:00', '2017-04-28 19:50:00', '晚上', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:46:06');
INSERT INTO `lab_room_time` VALUES ('397', '6', '208', '物联网工程实验室', '2017-04-28', '2017-04-28晚上第2节课', '2017-04-28 20:00:00', '2017-04-28 20:50:00', '晚上', '1', '1', '0', '', '2017-04-19 14:34:10', '2017-04-19 14:46:23');
INSERT INTO `lab_room_time` VALUES ('398', '6', '208', '物联网工程实验室', '2017-05-15', '2017-05-15上午第1节课', '2017-05-15 08:00:00', '2017-05-15 08:50:00', '上午', '1', '1', '0', '', '2017-05-10 15:17:39', '2017-05-10 15:17:39');
INSERT INTO `lab_room_time` VALUES ('399', '6', '208', '物联网工程实验室', '2017-05-15', '2017-05-15上午第2节课', '2017-05-15 09:00:00', '2017-05-15 09:50:00', '上午', '1', '1', '0', '', '2017-05-10 15:17:39', '2017-05-10 15:17:39');
INSERT INTO `lab_room_time` VALUES ('400', '6', '208', '物联网工程实验室', '2017-05-15', '2017-05-15上午第3节课', '2017-05-15 10:00:00', '2017-05-15 10:50:00', '上午', '1', '1', '0', '', '2017-05-10 15:17:39', '2017-05-10 15:17:39');
INSERT INTO `lab_room_time` VALUES ('401', '6', '208', '物联网工程实验室', '2017-05-15', '2017-05-15上午第4节课', '2017-05-15 11:00:00', '2017-05-15 11:50:00', '上午', '1', '1', '0', '', '2017-05-10 15:17:39', '2017-05-10 15:17:39');
INSERT INTO `lab_room_time` VALUES ('402', '6', '208', '物联网工程实验室', '2017-05-15', '2017-05-15下午第1节课', '2017-05-15 13:00:00', '2017-05-15 13:50:00', '下午', '1', '1', '0', '', '2017-05-10 15:17:39', '2017-05-10 15:17:39');
INSERT INTO `lab_room_time` VALUES ('403', '6', '208', '物联网工程实验室', '2017-05-15', '2017-05-15下午第2节课', '2017-05-15 14:00:00', '2017-05-15 14:50:00', '下午', '1', '1', '0', '', '2017-05-10 15:17:39', '2017-05-10 15:17:39');
INSERT INTO `lab_room_time` VALUES ('404', '6', '208', '物联网工程实验室', '2017-05-15', '2017-05-15下午第3节课', '2017-05-15 15:00:00', '2017-05-15 15:50:00', '下午', '1', '1', '0', '', '2017-05-10 15:17:39', '2017-05-10 15:17:39');
INSERT INTO `lab_room_time` VALUES ('405', '6', '208', '物联网工程实验室', '2017-05-15', '2017-05-15下午第4节课', '2017-05-15 16:00:00', '2017-05-15 16:50:00', '下午', '1', '1', '0', '', '2017-05-10 15:17:39', '2017-05-10 15:17:39');
INSERT INTO `lab_room_time` VALUES ('406', '6', '208', '物联网工程实验室', '2017-05-15', '2017-05-15晚上第1节课', '2017-05-15 19:00:00', '2017-05-15 19:50:00', '晚上', '1', '1', '0', '', '2017-05-10 15:17:39', '2017-05-10 15:17:39');
INSERT INTO `lab_room_time` VALUES ('407', '6', '208', '物联网工程实验室', '2017-05-15', '2017-05-15晚上第2节课', '2017-05-15 20:00:00', '2017-05-15 20:50:00', '晚上', '1', '1', '0', '', '2017-05-10 15:17:39', '2017-05-10 15:17:39');
INSERT INTO `lab_room_time` VALUES ('408', '6', '208', '物联网工程实验室', '2017-05-15', '2017-05-15晚上第3节课', '2017-05-15 21:00:00', '2017-05-15 21:50:00', '晚上', '1', '2', '2', '', '2017-05-10 15:17:39', '2017-05-10 16:08:50');
INSERT INTO `lab_room_time` VALUES ('409', '6', '208', '物联网工程实验室', '2017-05-13', '2017-05-13上午第1节课', '2017-05-13 08:00:00', '2017-05-13 08:50:00', '上午', '1', '1', '0', '', '2017-05-10 15:25:04', '2017-05-10 15:25:04');
INSERT INTO `lab_room_time` VALUES ('410', '6', '208', '物联网工程实验室', '2017-05-13', '2017-05-13上午第2节课', '2017-05-13 09:00:00', '2017-05-13 09:50:00', '上午', '1', '1', '0', '', '2017-05-10 15:25:04', '2017-05-10 15:25:04');
INSERT INTO `lab_room_time` VALUES ('411', '6', '208', '物联网工程实验室', '2017-05-13', '2017-05-13上午第3节课', '2017-05-13 10:00:00', '2017-05-13 10:50:00', '上午', '1', '1', '0', '', '2017-05-10 15:25:04', '2017-05-10 15:25:04');
INSERT INTO `lab_room_time` VALUES ('412', '6', '208', '物联网工程实验室', '2017-05-13', '2017-05-13上午第4节课', '2017-05-13 11:00:00', '2017-05-13 11:50:00', '上午', '1', '1', '0', '', '2017-05-10 15:25:04', '2017-05-10 15:25:04');
INSERT INTO `lab_room_time` VALUES ('413', '6', '208', '物联网工程实验室', '2017-05-13', '2017-05-13下午第1节课', '2017-05-13 13:00:00', '2017-05-13 13:50:00', '下午', '1', '1', '0', '', '2017-05-10 15:25:04', '2017-05-10 15:25:04');
INSERT INTO `lab_room_time` VALUES ('414', '6', '208', '物联网工程实验室', '2017-05-13', '2017-05-13下午第2节课', '2017-05-13 14:00:00', '2017-05-13 14:50:00', '下午', '1', '1', '0', '', '2017-05-10 15:25:04', '2017-05-10 15:25:04');
INSERT INTO `lab_room_time` VALUES ('415', '6', '208', '物联网工程实验室', '2017-05-13', '2017-05-13下午第3节课', '2017-05-13 15:00:00', '2017-05-13 15:50:00', '下午', '1', '2', '2', '', '2017-05-10 15:25:04', '2017-05-10 15:25:42');
INSERT INTO `lab_room_time` VALUES ('416', '6', '208', '物联网工程实验室', '2017-05-13', '2017-05-13下午第4节课', '2017-05-13 16:00:00', '2017-05-13 16:50:00', '下午', '1', '1', '0', '', '2017-05-10 15:25:04', '2017-05-10 15:25:04');
INSERT INTO `lab_room_time` VALUES ('417', '6', '208', '物联网工程实验室', '2017-05-13', '2017-05-13晚上第1节课', '2017-05-13 19:00:00', '2017-05-13 19:50:00', '晚上', '1', '1', '0', '', '2017-05-10 15:25:04', '2017-05-10 15:25:04');
INSERT INTO `lab_room_time` VALUES ('418', '6', '208', '物联网工程实验室', '2017-05-13', '2017-05-13晚上第2节课', '2017-05-13 20:00:00', '2017-05-13 20:50:00', '晚上', '1', '1', '0', '', '2017-05-10 15:25:04', '2017-05-10 15:25:04');
INSERT INTO `lab_room_time` VALUES ('419', '6', '208', '物联网工程实验室', '2017-05-13', '2017-05-13晚上第3节课', '2017-05-13 21:00:00', '2017-05-13 21:50:00', '晚上', '1', '1', '0', '', '2017-05-10 15:25:04', '2017-05-10 15:25:04');

-- ----------------------------
-- Table structure for `lab_user`
-- ----------------------------
DROP TABLE IF EXISTS `lab_user`;
CREATE TABLE `lab_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '人员ID',
  `user_num` varchar(20) NOT NULL COMMENT '人员编号',
  `user_name` varchar(50) NOT NULL COMMENT '人员登录账号',
  `real_name` varchar(32) NOT NULL DEFAULT '' COMMENT '姓名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '性别 0 男 1 女',
  `class_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '班级ID',
  `class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '班级',
  `type` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '人员类型 1 学生 2 教师 3 系统管理员',
  `role_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `state` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='人员表';

-- ----------------------------
-- Records of lab_user
-- ----------------------------
INSERT INTO `lab_user` VALUES ('14', '0200', 'admin', '管理员', '202CB962AC59075B964B07152D234B70', '0', '0', '', '3', '3', '1', '', '2016-11-11 11:11:11', null);
INSERT INTO `lab_user` VALUES ('37', '02013', 'xuesheng', '张涛', '202CB962AC59075B964B07152D234B70', '0', '8', '计算机16', '1', '1', '0', '', '2017-04-19 10:10:30', '2017-04-19 10:10:30');
INSERT INTO `lab_user` VALUES ('38', '0208', 'jiaoshi', '刘萍', '202CB962AC59075B964B07152D234B70', '1', '8', '计算机16', '2', '2', '1', '', '2017-04-19 10:11:08', '2017-04-19 10:11:08');
INSERT INTO `lab_user` VALUES ('39', '02014', 'xuesheng111', '你妹', '202CB962AC59075B964B07152D234B70', '0', '8', '计算机16', '1', '1', '1', '', '2017-08-18 10:42:04', '2017-08-18 10:42:04');
INSERT INTO `lab_user` VALUES ('40', '02015', 'xuesheng123', '你妹啊', '202CB962AC59075B964B07152D234B70', '0', '9', '高三三班', '1', '1', '1', '', '2017-08-18 10:43:27', '2017-08-18 10:43:27');
INSERT INTO `lab_user` VALUES ('43', '01012', 'xuesheng222', 'XA', 'E4C2E8EDAC362ACAB7123654B9E73432', '0', '8', '计算机16', '1', '1', '1', '', '2017-08-18 10:49:44', '2017-08-18 10:49:44');
INSERT INTO `lab_user` VALUES ('44', '01013', 'xuesheng333', 'XB', 'E4C2E8EDAC362ACAB7123654B9E73432', '0', '8', '计算机16', '1', '1', '1', '', '2017-08-18 10:49:44', '2017-08-18 10:49:44');

-- ----------------------------
-- Table structure for `seq`
-- ----------------------------
DROP TABLE IF EXISTS `seq`;
CREATE TABLE `seq` (
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '序列名称',
  `start_with` bigint(20) unsigned NOT NULL DEFAULT '1' COMMENT '序列起始值',
  `curr_value` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '当前值',
  `next_step` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '增长的长度',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='主键序列表';

-- ----------------------------
-- Records of seq
-- ----------------------------
INSERT INTO `seq` VALUES ('admin', '1', '8', '1');
INSERT INTO `seq` VALUES ('class', '1', '4', '1');
INSERT INTO `seq` VALUES ('group', '1', '12', '1');
INSERT INTO `seq` VALUES ('room', '1', '6', '1');
INSERT INTO `seq` VALUES ('student', '1', '13', '1');
INSERT INTO `seq` VALUES ('teacher', '1', '15', '1');
