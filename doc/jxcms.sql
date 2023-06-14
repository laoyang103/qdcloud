--
-- Table structure for table `lab_hpv`
--

DROP TABLE IF EXISTS `lab_hpv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_hpv` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '宿主机编号',
  `name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '宿主机名称',
  `ipaddr` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '宿主机IP',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='虚拟机表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_hpv`
--

LOCK TABLES `lab_hpv` WRITE;
/*!40000 ALTER TABLE `lab_hpv` DISABLE KEYS */;
INSERT INTO `lab_hpv` VALUES (1 ,'jxkvm1' ,'10.16.255.1');
INSERT INTO `lab_hpv` VALUES (2 ,'jxkvm2' ,'10.16.255.2');
INSERT INTO `lab_hpv` VALUES (3 ,'jxkvm3' ,'10.16.255.3');
UNLOCK TABLES;

--
-- Table structure for table `lab_vm`
--
DROP TABLE IF EXISTS `lab_vm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_vm` (
  `id` int unsigned NOT NULL AUTO_INCREMENT COMMENT '虚拟机编号',
  `name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '虚拟机名称',
  `ipaddr` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '虚拟机IP',
  `vmdisk` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '磁盘文件名',
  `cpu` int unsigned NOT NULL DEFAULT 0 COMMENT 'CPU核心数',
  `mem` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '内存字节数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='虚拟机表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_vm`
--

LOCK TABLES `lab_vm` WRITE;
/*!40000 ALTER TABLE `lab_vm` DISABLE KEYS */;
INSERT INTO `lab_vm` VALUES (1 ,'jx-nginx-11' ,'10.10.10.11','jx-nginx-11.qcow2' ,2, 2097152);
INSERT INTO `lab_vm` VALUES (2 ,'jx-nginx-12' ,'10.10.10.12','jx-nginx-12.qcow2' ,2, 2097152);
INSERT INTO `lab_vm` VALUES (3 ,'jx-nginx-13' ,'10.10.10.13','jx-nginx-13.qcow2' ,2, 2097152);
INSERT INTO `lab_vm` VALUES (4 ,'jx-apache-21','10.10.10.21','jx-apache-21.qcow2',2, 2097152);
INSERT INTO `lab_vm` VALUES (5 ,'jx-apache-22','10.10.10.22','jx-apache-22.qcow2',2, 2097152);
INSERT INTO `lab_vm` VALUES (6 ,'jx-redis-26' ,'10.10.10.26','jx-redis-26.qcow2' ,2, 2097152);
INSERT INTO `lab_vm` VALUES (7 ,'jx-redis-27' ,'10.10.10.27','jx-redis-27.qcow2' ,2, 2097152);
INSERT INTO `lab_vm` VALUES (8 ,'jx-redis-28' ,'10.10.10.28','jx-redis-28.qcow2' ,2, 2097152);

INSERT INTO `lab_vm` VALUES (9 ,'jx-mysql-proxy-31'  ,'10.10.10.31','jx-mysql-proxy-31.qcow2' ,2, 2097152);
INSERT INTO `lab_vm` VALUES (10,'jx-mysql-proxy-32'  ,'10.10.10.32','jx-mysql-proxy-32.qcow2' ,2, 2097152);
INSERT INTO `lab_vm` VALUES (11,'jx-mysql-master-36' ,'10.10.10.36','jx-mysql-master-36.qcow2',2, 2097152);
INSERT INTO `lab_vm` VALUES (12,'jx-mysql-slave-37'  ,'10.10.10.37','jx-mysql-slave-37.qcow2' ,2, 2097152);
INSERT INTO `lab_vm` VALUES (13,'jx-mysql-slave-38'  ,'10.10.10.38','jx-mysql-slave-38.qcow2' ,2, 2097152);

INSERT INTO `lab_vm` VALUES (14,'jx-pxeboot-51' ,'10.10.10.51' ,'jx-pxeboot-51.qcow2',2, 2097152);
INSERT INTO `lab_vm` VALUES (15,'jx-pxeboot-52' ,'10.10.10.52' ,'jx-pxeboot-52.qcow2',2, 2097152);
INSERT INTO `lab_vm` VALUES (16,'jx-dev-71'     ,'10.10.10.71' ,'jx-dev-71.qcow2'    ,2, 2097152);
INSERT INTO `lab_vm` VALUES (17,'jx-gitlab-76'  ,'10.10.10.76' ,'jx-gitlab-76.qcow2' ,2, 6097152);
INSERT INTO `lab_vm` VALUES (18,'jx-ops-81'     ,'10.10.10.81' ,'jx-ops-81.qcow2'    ,2, 2097152);
UNLOCK TABLES;

--
-- Table structure for table `lab_module`
--
DROP TABLE IF EXISTS `lab_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_module` (
  `module_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块编号',
  `module_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '模块名称',
  `url` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '链接',
  `level` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '模块级别 1-顶级  2-二级 ',
  `f_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '父级id',
  `sort` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '优先级',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`module_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='模块表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_module`
--

LOCK TABLES `lab_module` WRITE;
/*!40000 ALTER TABLE `lab_module` DISABLE KEYS */;
INSERT INTO `lab_module` VALUES (1,'学生管理','student',1,0,0,NULL,NULL);
INSERT INTO `lab_module` VALUES (2,'教师管理','teacher',1,0,0,NULL,NULL);
INSERT INTO `lab_module` VALUES (3,'实验室管理','room',1,0,0,NULL,NULL);
INSERT INTO `lab_module` VALUES (4,'班级管理','class',1,0,0,NULL,NULL);
INSERT INTO `lab_module` VALUES (5,'学生列表','view/student/studentlist.jsp',2,1,0,NULL,NULL);
INSERT INTO `lab_module` VALUES (6,'教师列表','view/teacher/teacherlist.jsp',2,2,0,NULL,NULL);
INSERT INTO `lab_module` VALUES (7,'实验室列表','view/room/roomlist.jsp',2,3,0,NULL,NULL);
INSERT INTO `lab_module` VALUES (8,'班级列表','view/class/classlist.jsp',2,4,0,NULL,NULL);
INSERT INTO `lab_module` VALUES (10,'课程列表','',2,9,5,NULL,NULL);
INSERT INTO `lab_module` VALUES (11,'系统管理','system',1,0,10,NULL,NULL);
INSERT INTO `lab_module` VALUES (12,'管理员权限管理','view/system/personlist.jsp',2,11,15,NULL,NULL);
INSERT INTO `lab_module` VALUES (13,'角色管理','view/system/rolelist.jsp',2,11,20,NULL,NULL);
INSERT INTO `lab_module` VALUES (14,'分组管理','team',1,0,70,NULL,NULL);
INSERT INTO `lab_module` VALUES (15,'分组列表','view/team/teamlist.jsp',2,14,71,NULL,NULL);
INSERT INTO `lab_module` VALUES (16,'实验项目管理','experiment',1,0,30,NULL,NULL);
INSERT INTO `lab_module` VALUES (17,'实验项目列表','view/experiment/experimentlist.jsp',2,16,31,NULL,NULL);
INSERT INTO `lab_module` VALUES (18,'习题管理','example',1,0,40,NULL,NULL);
INSERT INTO `lab_module` VALUES (19,'习题列表','view/example/examplelist.jsp',2,18,41,NULL,NULL);
INSERT INTO `lab_module` VALUES (20,'实验课管理','task',1,0,50,NULL,NULL);
INSERT INTO `lab_module` VALUES (21,'实验课列表','view/task/tasklist.jsp',2,20,53,NULL,NULL);
INSERT INTO `lab_module` VALUES (22,'作业列表','view/work/worklist.jsp',2,20,55,NULL,NULL);
INSERT INTO `lab_module` VALUES (23,'报告列表','view/report/reportlist.jsp',2,20,56,NULL,NULL);
INSERT INTO `lab_module` VALUES (24,'环境管理','studenttask',1,0,57,NULL,NULL);
INSERT INTO `lab_module` VALUES (25,'学生实验课列表','view/studenttask/tasklist.jsp',2,24,59,NULL,NULL);
INSERT INTO `lab_module` VALUES (26,'讨论管理','',1,0,60,NULL,NULL);
INSERT INTO `lab_module` VALUES (27,'讨论列表','view/discuss/discusslist.jsp',2,26,61,NULL,NULL);
INSERT INTO `lab_module` VALUES (28,'消息管理','',1,0,80,NULL,NULL);
INSERT INTO `lab_module` VALUES (29,'消息列表','view/message/msglist.jsp',2,28,81,NULL,NULL);
INSERT INTO `lab_module` VALUES (30,'管理员消息列表','view/message/msgadminlist.jsp',2,28,82,NULL,NULL);
INSERT INTO `lab_module` VALUES (31,'实验室时间设置','view/room/roomtimesetlist.jsp',2,3,0,NULL,NULL);
INSERT INTO `lab_module` VALUES (32,'实验室预约审核','view/room/roomtimeorderlist.jsp',2,3,0,NULL,NULL);
INSERT INTO `lab_module` VALUES (33,'实验室使用统计','view/room/roomstatistics.jsp',2,3,0,NULL,NULL);
INSERT INTO `lab_module` VALUES (34,'考勤管理','checkwork',1,0,65,NULL,NULL);
INSERT INTO `lab_module` VALUES (35,'考勤列表','view/checkwork/checkworklist.jsp',2,34,66,NULL,NULL);
INSERT INTO `lab_module` VALUES (36,'预约实验课时','view/task/roomtimelist.jsp',2,20,51,NULL,NULL);
INSERT INTO `lab_module` VALUES (37,'虚拟机列表','view/studenttask/vmlist.jsp',2,24,58,NULL,NULL);
INSERT INTO `lab_module` VALUES (38,'成果展示','view/system/kycglist.jsp',2,11,25,NULL,NULL);
INSERT INTO `lab_module` VALUES (39,'教学动态','view/system/kyxmlist.jsp',2,11,26,NULL,NULL);
INSERT INTO `lab_module` VALUES (40,'成果图片维护','view/system/cgphoto.jsp',2,11,27,NULL,NULL);
INSERT INTO `lab_module` VALUES (41,'轮播图片维护','view/system/lbphoto.jsp',2,11,28,NULL,NULL);
INSERT INTO `lab_module` VALUES (42,'教师权限管理','view/system/teacherlist.jsp',2,11,16,NULL,NULL);
INSERT INTO `lab_module` VALUES (43,'学生权限管理','view/system/studentlist.jsp',2,11,17,NULL,NULL);
/*!40000 ALTER TABLE `lab_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_module_role`
--

DROP TABLE IF EXISTS `lab_module_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_module_role` (
  `module_role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '模块角色id',
  `module_id` int(10) unsigned NOT NULL DEFAULT 1 COMMENT '模块id',
  `role_id` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '角色id ',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '0-使用  1-停用',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`module_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色模块映射表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_module_role`
--

LOCK TABLES `lab_module_role` WRITE;
/*!40000 ALTER TABLE `lab_module_role` DISABLE KEYS */;
-- 学生可用模块
INSERT INTO `lab_module_role` VALUES (NULL,14,1,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,15,1,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,24,1,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,25,1,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,26,1,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,27,1,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,28,1,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,29,1,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,37,1,0,NULL,NULL);
-- 教师可用模块
INSERT INTO `lab_module_role` VALUES (NULL,14,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,15,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,24,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,28,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,29,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,34,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,35,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,16,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,17,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,18,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,19,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,20,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,21,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,22,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,23,2,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,36,2,0,NULL,NULL);
-- 管理员可用模块
INSERT INTO `lab_module_role` VALUES (NULL,1 ,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,2 ,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,3 ,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,4 ,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,5 ,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,6 ,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,7 ,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,8 ,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,10,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,11,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,12,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,13,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,24,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,30,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,31,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,32,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,33,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,34,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,35,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,38,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,39,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,40,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,41,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,42,3,0,NULL,NULL);
INSERT INTO `lab_module_role` VALUES (NULL,43,3,0,NULL,NULL);
/*!40000 ALTER TABLE `lab_module_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_class`
--
DROP TABLE IF EXISTS `lab_class`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_class` (
  `class_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '班级ID',
  `class_code` varchar(20) NOT NULL DEFAULT '' COMMENT '班级编号',
  `class_name` varchar(50) NOT NULL DEFAULT '' COMMENT '班级名称',
  `department_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '院系ID',
  `department_name` varchar(32) NOT NULL DEFAULT '' COMMENT '院系名称',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_class`
--

LOCK TABLES `lab_class` WRITE;
/*!40000 ALTER TABLE `lab_class` DISABLE KEYS */;
INSERT INTO `lab_class` VALUES (1, 'jx2108','jx2108',0,'觉行IT教育',1,'admin','2021-08-19 09:52:09','2021-08-19 09:52:09');
INSERT INTO `lab_class` VALUES (2, 'jx2110','jx2110',0,'觉行IT教育',1,'admin','2021-08-19 09:52:09','2021-08-19 09:52:09');
INSERT INTO `lab_class` VALUES (3, 'jx2202','jx2202',0,'觉行IT教育',1,'admin','2022-02-19 09:52:09','2022-02-19 09:52:09');
INSERT INTO `lab_class` VALUES (4, 'jx2203','jx2203',0,'觉行IT教育',1,'admin','2022-03-19 09:52:09','2022-03-19 09:52:09');
INSERT INTO `lab_class` VALUES (5, 'jx2204','jx2204',0,'觉行IT教育',1,'admin','2022-03-19 09:52:09','2022-03-19 09:52:09');
INSERT INTO `lab_class` VALUES (6, 'jx2210','jx2210',0,'觉行IT教育',1,'admin','2022-10-19 09:52:09','2022-10-19 09:52:09');
INSERT INTO `lab_class` VALUES (7, 'jx2211','jx2211',0,'觉行IT教育',1,'admin','2022-11-18 10:43:00','2022-11-18 10:43:00');
INSERT INTO `lab_class` VALUES (8, 'jx2301','jx2301',0,'觉行IT教育',1,'admin','2023-01-31 15:36:44','2023-01-31 15:36:44');
INSERT INTO `lab_class` VALUES (9, 'jx2302','jx2302',0,'觉行IT教育',1,'admin','2023-02-01 15:37:00','2023-02-01 15:37:00');
/*!40000 ALTER TABLE `lab_class` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_user`
--

DROP TABLE IF EXISTS `lab_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_user` (
  `user_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '人员ID',
  `user_name` varchar(50) NOT NULL COMMENT '人员登录账号',
  `real_name` varchar(32) NOT NULL DEFAULT '' COMMENT '姓名',
  `password` varchar(32) NOT NULL DEFAULT '' COMMENT '密码',
  `sex` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '性别 0 男 1 女',
  `class_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '班级ID',
  `class_name` varchar(32) NOT NULL DEFAULT '' COMMENT '班级',
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '人员类型 1 学生 2 教师 3 系统管理员',
  `role_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '角色ID',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_user`
--

LOCK TABLES `lab_user` WRITE;
/*!40000 ALTER TABLE `lab_user` DISABLE KEYS */;
INSERT INTO `lab_user` VALUES (1,  'jx00000001','滕文超','123456',0,0,'',2,2,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (2,  'jx00000002','韩磊'  ,'123456',0,0,'',2,2,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (3,  'jx00000003','杨佳楠','123456',0,8,'',3,3,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (4,  'jx00000004','刘艳平','123456',0,9,'',2,2,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (5,  'jx00000005','肖茜'  ,'123456',0,0,'',2,2,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (6,  'jx00000006','孙宝龙','123456',0,0,'',2,2,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (7,  'jx00000007','商金来','123456',0,0,'',2,2,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (8,  'jx00000008','郭启明','123456',0,0,'',2,2,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (9,  'jx00000009','霍岩'  ,'123456',0,0,'',2,2,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (10, 'jx00000010','吕文鑫','123456',0,0,'',2,2,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
;
INSERT INTO `lab_user` VALUES (101,'jx21080001','索良尧','123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (102,'jx21080002','张明亮','123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (103,'jx21080003','尚磊'  ,'123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (104,'jx21080004','王宇航','123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (105,'jx21080005','孙树平','123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (106,'jx21080006','于文龙','123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (107,'jx21080007','钱宏'  ,'123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (108,'jx21080008','刘超'  ,'123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (109,'jx21080009','尚嘉星','123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (110,'jx21080010','车向东','123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (111,'jx21080011','那日苏','123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (112,'jx21080012','娄海峰','123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (113,'jx21080013','胡天宇','123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (114,'jx21080014','徐宏达','123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (115,'jx21080015','孟凡杰','123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (116,'jx21080016','高岩松','123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (117,'jx21080017','王皓月','123456',0,1,'jx2108',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');

INSERT INTO `lab_user` VALUES (128,'jx21100001','任强'  ,'123456',0,2,'jx2110',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (129,'jx21100002','鲍天宇','123456',0,2,'jx2110',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (131,'jx21100003','李宇佳','123456',0,2,'jx2110',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (132,'jx21100004','孙家刚','123456',0,2,'jx2110',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (133,'jx21100005','罗文宇','123456',0,2,'jx2110',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (134,'jx21100006','给龙嘎','123456',0,2,'jx2110',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (135,'jx21100007','于洪飞','123456',0,2,'jx2110',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (136,'jx21100008','张志佳','123456',0,2,'jx2110',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (137,'jx21100009','陈艳平','123456',0,2,'jx2110',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (138,'jx21100010','张宏伟','123456',0,2,'jx2110',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (139,'jx21100011','李寅龙','123456',0,2,'jx2110',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (140,'jx21100012','陈佳磊','123456',0,2,'jx2110',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (141,'jx21100013','张新宇','123456',0,2,'jx2110',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
;
INSERT INTO `lab_user` VALUES (151,'jx22020001','任志强','123456',0,3,'jx2202',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (152,'jx22020002','孙宇'  ,'123456',0,3,'jx2202',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (153,'jx22020003','于帅'  ,'123456',0,3,'jx2202',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (154,'jx22020004','丁广星','123456',0,3,'jx2202',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (155,'jx22020005','李淑慧','123456',1,3,'jx2202',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (156,'jx22020006','李海轩','123456',0,3,'jx2202',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (157,'jx22020007','王国俊','123456',0,3,'jx2202',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (158,'jx22020008','吴家乐','123456',0,3,'jx2202',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (159,'jx22020009','刘镕硕','123456',0,3,'jx2202',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (160,'jx22020010','王建国','123456',0,3,'jx2202',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (161,'jx22020011','朱占武','123456',0,3,'jx2202',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (162,'jx22020012','郝丽燃','123456',0,3,'jx2202',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (163,'jx22020013','耿锐'  ,'123456',0,3,'jx2202',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
;
INSERT INTO `lab_user` VALUES (171,'jx22030001','宫佳琪','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (172,'jx22030002','郭东浩','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (173,'jx22030003','周瑞楠','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (174,'jx22030004','平川驰','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (175,'jx22030005','朱剑波','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (176,'jx22030006','白冰'  ,'123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (177,'jx22030007','王景韬','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (178,'jx22030008','冯新波','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (179,'jx22030009','宣新宇','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (180,'jx22030010','贾勇其','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (181,'jx22030011','孙东浩','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (183,'jx22030012','张文举','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (184,'jx22030013','姚艳旭','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (185,'jx22030014','宋常英','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (186,'jx22030015','梁伟军','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (187,'jx22030016','郑力月','123456',0,4,'jx2203',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
;
INSERT INTO `lab_user` VALUES (191,'jx22040001','张志强','123456',0,5,'jx2204',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (192,'jx22040002','张冰飞','123456',0,5,'jx2204',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (193,'jx22040003','荆可新','123456',0,5,'jx2204',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (194,'jx22040004','李德元','123456',0,5,'jx2204',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (195,'jx22040005','王鑫'  ,'123456',0,5,'jx2204',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (196,'jx22040006','刘嘉尧','123456',0,5,'jx2204',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (197,'jx22040007','刘洋'  ,'123456',0,5,'jx2204',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
;
INSERT INTO `lab_user` VALUES (201,'jx22100001','李万博','123456',0,6,'jx2210',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (202,'jx22100002','高金库','123456',0,6,'jx2210',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (203,'jx22100003','陈云龙','123456',0,6,'jx2210',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (204,'jx22100004','韩庆广','123456',0,6,'jx2210',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (205,'jx22100005','柴新雨','123456',0,6,'jx2210',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (206,'jx22100006','彭立波','123456',0,6,'jx2210',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (207,'jx22100007','王志伟','123456',0,6,'jx2210',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (208,'jx22100008','张宏伟','123456',0,6,'jx2210',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
;
INSERT INTO `lab_user` VALUES (211,'jx22110001','纪茗伟','123456',0,7,'jx2211',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (212,'jx22110002','李志会','123456',0,7,'jx2211',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (213,'jx22110003','李健'  ,'123456',0,7,'jx2211',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (214,'jx22110004','韩英春','123456',0,7,'jx2211',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (215,'jx22110005','周志胤','123456',0,7,'jx2211',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (216,'jx22110006','白亚明','123456',0,7,'jx2211',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (217,'jx22110007','丁乙'  ,'123456',0,7,'jx2211',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (218,'jx22110008','袁文涛','123456',0,7,'jx2211',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (219,'jx22110009','王鹏'  ,'123456',0,7,'jx2211',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (220,'jx22110010','吴秀鹏','123456',0,7,'jx2211',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
;
INSERT INTO `lab_user` VALUES (231,'jx23010001','张文钰','123456',0,8,'jx2301',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (232,'jx23010002','李艳东','123456',0,8,'jx2301',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (233,'jx23010003','赵伟'  ,'123456',0,8,'jx2301',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (234,'jx23010004','葛玉达','123456',0,8,'jx2301',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (235,'jx23010005','张洁'  ,'123456',0,8,'jx2301',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (236,'jx23010006','谢志强','123456',0,8,'jx2301',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (237,'jx23010007','杜新磊','123456',0,8,'jx2301',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (238,'jx23010008','石磊'  ,'123456',0,8,'jx2301',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (239,'jx23010009','张启维','123456',0,8,'jx2301',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (230,'jx23010010','刘麒'  ,'123456',1,8,'jx2301',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (241,'jx23010011','张玮'  ,'123456',0,8,'jx2301',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (242,'jx23010012','刘赵杰','123456',0,8,'jx2301',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (243,'jx23010013','于天奇','123456',0,8,'jx2301',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');

INSERT INTO `lab_user` VALUES (251,'jx23020001','吴浩然','123456',0,8,'jx2302',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (252,'jx23020002','贺九锡','123456',0,8,'jx2302',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (253,'jx23020003','赵云博','123456',0,8,'jx2302',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (254,'jx23020004','吴海玉','123456',0,8,'jx2302',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (255,'jx23020005','乔东杰','123456',0,8,'jx2302',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (256,'jx23020006','吕岩松','123456',0,8,'jx2302',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (257,'jx23020007','张悦'  ,'123456',0,8,'jx2302',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (258,'jx23020008','李云鹏','123456',0,8,'jx2302',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (259,'jx23020009','李思彤','123456',0,8,'jx2302',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
INSERT INTO `lab_user` VALUES (260,'jx23020010','牛浩然','123456',1,8,'jx2302',1,1,1,'','2023-05-31 12:04:08','2023-05-31 12:04:08');
/*!40000 ALTER TABLE `lab_user`ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `lab_course`
--

DROP TABLE IF EXISTS `lab_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_course` (
  `course_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程id',
  `course_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '课程名称',
  `experiment_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '实验id',
  `experiment_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验名称',
  `example_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '习题id',
  `example_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '习题名称',
  `example_content` text COLLATE utf8_bin NOT NULL COMMENT '习题内容',
  `time_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '预约时间id',
  `begin_time` datetime NOT NULL COMMENT '开始时间',
  `end_time` datetime NOT NULL COMMENT '结束时间',
  `class_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '班级id',
  `class_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '班级名称',
  `room_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '教室id',
  `room_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '教室名称',
  `place_count` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '课位数量',
  `place_ok_count` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '已预约课位数量',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:未开始 20:执行中 30:已完成]',
  `teacher_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '教师id',
  `teacher_name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '教师名称',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '教师名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_course`
--

LOCK TABLES `lab_course` WRITE;
/*!40000 ALTER TABLE `lab_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_course_order`
--

DROP TABLE IF EXISTS `lab_course_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_course_order` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '预约id',
  `course_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '课程id',
  `class_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '班级id',
  `student_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '学生id',
  `student_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '学生名称',
  `remark` varchar(500) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '备注',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `check_work` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '考勤状态[0:未签到, 1:已签到]',
  `work_state` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '上课状态[0:未上课, 1:已上课]',
  `operator_id` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人id',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人名称',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `time_id` bigint(20) DEFAULT 0 COMMENT '预约时间id',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='学生预约课程表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_course_order`
--

LOCK TABLES `lab_course_order` WRITE;
/*!40000 ALTER TABLE `lab_course_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_course_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_course_student`
--

DROP TABLE IF EXISTS `lab_course_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_course_student` (
  `course_student_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '课程选择学生id',
  `course_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '课程id',
  `course_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '课程名称',
  `student_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '学生id',
  `student_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '学生名称',
  `example_content` text COLLATE utf8_bin NOT NULL COMMENT '已做习题内容',
  `example_flag` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '习题学生已做[0:未做, 1:已做]',
  `example_checked` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '习题是否批改[0:未批改, 1:已批改]',
  `example_score` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '习题评分',
  `example_comment` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '习题评语',
  `experiment_report` varchar(1000) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '学生实验报告',
  `experiment_flag` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '习题学生已做[0:未做, 1:已做]',
  `experiment_checked` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '报告是否批改[0:未批改, 1:已批改]',
  `experiment_score` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '报告评分',
  `experiment_comment` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '报告评语',
  `begin_time` datetime NOT NULL COMMENT '开始答题时间',
  `end_time` datetime NOT NULL COMMENT '结束答题时间',
  `example_state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '作业状态[0:停用, 1:未开始 20:执行中 30:已完成]',
  `experiment_state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '报告状态[0:停用, 1:未开始 20:执行中 30:已完成]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `time_id` bigint(20) DEFAULT 0 COMMENT '预约时间id',
  PRIMARY KEY (`course_student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='课程学生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_course_student`
--

LOCK TABLES `lab_course_student` WRITE;
/*!40000 ALTER TABLE `lab_course_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_course_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_course_student_station`
--

DROP TABLE IF EXISTS `lab_course_student_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_course_student_station` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '学生预约id',
  `station_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '课位id',
  `time_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '预约时间id',
  `student_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '学生id',
  `student_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '学生名称',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '当前状态[0:停用, 1:启用]',
  `operator_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '操作人id',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='学生预约课位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_course_student_station`
--

LOCK TABLES `lab_course_student_station` WRITE;
/*!40000 ALTER TABLE `lab_course_student_station` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_course_student_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_department`
--

DROP TABLE IF EXISTS `lab_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_department` (
  `department_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '院系ID',
  `department_code` varchar(20) NOT NULL DEFAULT '' COMMENT '院系编号',
  `department_name` varchar(50) NOT NULL DEFAULT '' COMMENT '院系名称',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='院系表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_department`
--

LOCK TABLES `lab_department` WRITE;
/*!40000 ALTER TABLE `lab_department` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_discuss`
--

DROP TABLE IF EXISTS `lab_discuss`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_discuss` (
  `discuss_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '讨论id',
  `discuss_title` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '讨论标题',
  `discuss_group_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '讨论组id',
  `discuss_group_name` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '讨论组',
  `discuss_content` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '讨论内容',
  `click_count` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '点击量',
  `reply_count` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '回复量',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人（作者）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`discuss_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='讨论主表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_discuss`
--

LOCK TABLES `lab_discuss` WRITE;
/*!40000 ALTER TABLE `lab_discuss` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_discuss` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_discuss_reply`
--

DROP TABLE IF EXISTS `lab_discuss_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_discuss_reply` (
  `reply_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '讨论回复id',
  `discuss_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '讨论id',
  `reply_content` varchar(1000) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '回复内容',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`reply_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='讨论回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_discuss_reply`
--

LOCK TABLES `lab_discuss_reply` WRITE;
/*!40000 ALTER TABLE `lab_discuss_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_discuss_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_example`
--

DROP TABLE IF EXISTS `lab_example`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_example` (
  `example_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '习题id',
  `example_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '习题名称',
  `example_content` text COLLATE utf8_bin NOT NULL COMMENT '习题内容',
  `example_use` varchar(500) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '习题用途',
  `looked` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '是否查看[0:未查看, 1:已查看]',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`example_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='习题表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_example`
--

LOCK TABLES `lab_example` WRITE;
/*!40000 ALTER TABLE `lab_example` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_example` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_experiment`
--

DROP TABLE IF EXISTS `lab_experiment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_experiment` (
  `experiment_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '实验id',
  `experiment_code` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验编号',
  `experiment_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验名称',
  `type_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '类型id',
  `type_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验类型',
  `student_type` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验者类别',
  `person_count` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '每组人数',
  `study_time` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '计划学时',
  `experiment_book` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验教程',
  `check_type` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '考核方式',
  `experiment_count` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验设备及数量',
  `remark` text COLLATE utf8_bin NOT NULL COMMENT '实验描述',
  `require_content` varchar(1000) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '目的与要求',
  `file_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验名称',
  `file_url` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验url',
  `file_size` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '实验大小',
  `file_name2` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '教学计划名称',
  `file_url2` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '教学计划url',
  `file_name3` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '教学帮助',
  `file_url3` varchar(300) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '教学帮助url',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用 2：正常]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`experiment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_experiment`
--

LOCK TABLES `lab_experiment` WRITE;
/*!40000 ALTER TABLE `lab_experiment` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_experiment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_experiment_type`
--

DROP TABLE IF EXISTS `lab_experiment_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_experiment_type` (
  `type_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '实验id',
  `type_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验类型名称',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='实验类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_experiment_type`
--

LOCK TABLES `lab_experiment_type` WRITE;
/*!40000 ALTER TABLE `lab_experiment_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_experiment_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_group`
--

DROP TABLE IF EXISTS `lab_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_group` (
  `group_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分组id',
  `group_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分组名称',
  `group_num` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分组编号',
  `class_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '班级id',
  `class_name` varchar(32) COLLATE utf8_bin DEFAULT '' COMMENT '班级名称',
  `type` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '由谁分组[0:教师, 1:学生]',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_group`
--

LOCK TABLES `lab_group` WRITE;
/*!40000 ALTER TABLE `lab_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_group_student`
--

DROP TABLE IF EXISTS `lab_group_student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_group_student` (
  `group_student_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '学生分组id',
  `group_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '分组id',
  `group_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分组名称',
  `group_num` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '分组编号',
  `student_id` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '学生id',
  `student_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '学生名称',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`group_student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='分组表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_group_student`
--

LOCK TABLES `lab_group_student` WRITE;
/*!40000 ALTER TABLE `lab_group_student` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_group_student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_index_photo`
--

DROP TABLE IF EXISTS `lab_index_photo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_index_photo` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `photo_title` varchar(50) NOT NULL DEFAULT '' COMMENT '图片标题',
  `photo_name` varchar(50) NOT NULL DEFAULT '' COMMENT '图片原文件名',
  `photo_src` varchar(150) NOT NULL DEFAULT '' COMMENT '图片路径',
  `photo_link` varchar(150) NOT NULL DEFAULT '' COMMENT '图片连接',
  `photo_type` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '图片类型[0:成果, 1:轮播]',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页图片维护表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_index_photo`
--

LOCK TABLES `lab_index_photo` WRITE;
/*!40000 ALTER TABLE `lab_index_photo` DISABLE KEYS */;
INSERT INTO `lab_index_photo` VALUES (1,'科研方向','zss.jpg','img/zss.jpg','http://www.jxit.net.cn/jxcginfo.jsp?id=5',0,1,'','2017-02-16 18:29:27','2017-08-28 14:55:07'),(2,'学术交流','zs.png','img/zs.png','http://www.jxit.net.cn/jxcginfo.jsp?id=4',0,1,'','2017-02-16 18:29:36','2017-08-28 14:55:07'),(3,'综合实验中心','syzx.jpg','img/syzx.jpg','http://www.jxit.net.cn/jxcginfo.jsp?id=8',0,1,'','2017-02-16 18:29:41','2017-08-28 14:55:07'),(4,'项目实战','zss.jpg','img/zss.jpg','http://www.jxit.net.cn',1,1,'','2017-02-16 18:56:45','2017-08-28 14:56:09'),(5,'学术讲座','zs.png','img/zs.png','http://www.jxit.net.cn',1,1,'','2017-02-16 18:56:45','2017-08-28 14:56:09'),(6,'学校前台','a3.jpg','img/a3.jpg','http://www.jxit.net.cn',1,1,'','2017-02-16 18:56:45','2017-08-28 14:56:09');
/*!40000 ALTER TABLE `lab_index_photo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_message`
--

DROP TABLE IF EXISTS `lab_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_message` (
  `message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '实验id',
  `message_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验室名称',
  `message_content` varchar(1000) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验内容',
  `sender` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '发送方类型[0 学生 1 教师 2 系统管理员]',
  `receiver` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '发送方类型[0 学生 1 教师 2 系统管理员]',
  `looked` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '是否查看[0:未查看, 1:已查看]',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_message`
--

LOCK TABLES `lab_message` WRITE;
/*!40000 ALTER TABLE `lab_message` DISABLE KEYS */;
INSERT INTO `lab_message` VALUES (1,'关于谭军科同学就业协议书丢失补办的公示','谭军科，男，我校计算机科学与工程学院网络工程专业2017届毕业生，于2017年3月15日前，将编号为SX2016133758的空白就业协议书丢失，现申请予以补办。根据该同学的申请，对其就业协议书丢失补办的情况予以公示一月（2017年3月29日——2017年4月28日），欢迎广大师生监督。如情况不实，请与学院学生办公室联系。\n\n \n\n   \n\n \n\n \n\n联系电话：86173276 \n\n \n\n \n\n                                                        计算机科学与工程学院\n                                                           2017年3月29日\n',3,1,0,1,'admin','2017-04-19 18:16:13','2017-04-19 18:16:13'),(2,'“第十三届“博创杯”全国大学生嵌入式设计大赛 暨第一届“博创杯”创新创业电子设计大赛”的通知','“博创杯”全国大学生嵌入式设计大赛自2005年至今已举办了十二届，累计参赛院校500余所，参赛队伍5000余支，参赛学生多达15000余名。大赛为高校学生提供了一个创新、交流和展示的平台，本着公平、公正、开源、开放的大赛精神，选拔出优秀的人才与大赛作品，吸引国内外优秀的企业积极参与，利用企业平台，实现人才就业与大赛作品的产品化转换。\n\n我校今年协办内蒙古自治区分赛区比赛，现将大赛具体组织工作通知如下：\n一、主办单位：中国教育部高等学校计算机类专业教学指导委员会\n\n              中国电子学会 \n\n    竞赛级别：国家B级\n\n    参赛形式：本次大赛仅设【标准赛项】，分为高职组、本科组，采用大赛指定平台，不限定命题，通过分赛区现场实物评审的形式选拔进入总决赛，进行全国性评审评奖。规则详情请到大赛官网“资料下载”处下载《标准赛项比赛说明》。\n\n    参赛周期：1年一届\n二、参赛对象\n\n具有正式学籍的全日制在校本、专科生均有资格报名参赛；每支参赛队最多三名队员组队，每名队员只能参加一支队伍。\n\n三、大赛命题\n\n本赛事采用开放式命题的形式，让各参赛队伍能有更自由的发挥空间。 设计内容可涵盖：嵌入式、机器人、物联网应用（城市交通，医疗，港口物流，环境监测，多网融合等）、消费类电子、数字电视、GPS导航、智能手机、数字家电、多媒体、视频编码解码、图像处理、安防监控、无线通讯、信息识别、工业应用、医疗卫生领域的硬件设计，应用软件，系统软件等。\n四、报名办法\n\n   2017年4月30日前参赛队伍通过大赛官网（www.cie-eec.org）进行在线报名，报名流程请见附件。\n\n五、大赛时间                    \n\n2017年1月-4月    在线报名，准备作品\n\n2017年5月           修改报名信息\n\n2017年6月           各分赛区比赛，具体比赛时间以官网公布为准\n\n2017年7月           全国总决赛    \n\n六、 联系方式\n\n  竞赛负责人：马静\n\n  联系人：马静13709195258曲少春18629059266\n\n附件：大赛报名参赛流程',3,1,0,1,'admin','2017-04-19 18:17:34','2017-04-19 18:21:15'),(3,'计算机科学与工程学院2017年硕士研究生调剂招生专业','我院计算机系统结构（081201）、计算机软件与理论（081202）、计算机应用技术（081203）、武器系统与运用工程（082601）、兵器发射理论与技术（082602）、软件工程（083500）、计算机技术（全日制）（专业硕士085211）、软件工程（全日制）（专业硕士085212）等专业均可接收调剂。\n\n咨询电话：86173270；\n\n办公地址：工1楼301办公室\n\n联系老师：张老师、胡老师、魏老师 \n',3,1,0,1,'admin','2017-04-19 18:22:02','2017-04-19 18:22:02'),(4,'关于召开ICSNCE 2016国际会议的通知','为促进我国与国际社会在计算机科学、新型网络检测与控制领域的交流与合作，由新型网络与检测控制国家地方联合工程实验室、觉行职业学校（Xi\'an Technological University）发起，得到美国密苏里西州立大学、新加坡国立大学、香港科技大学等国内外高校与法国Atlantic出版社的大力支持，将于2016年7月8-10日在内蒙古自治区西安市举办网络工程与计算机科学国际会议。会议录用文章将提交ISTP（现改名CPCI）检索，会议相关信息如下：\n\n  会议名称：计算机网络工程与计算机科学国际会议\n\n  英文名称（简称）：2016 International Conference of Network Engineering and Computer Science (ICSNCE2016) \n\n会议举办时间和地点：2016年7月8-10日，西安市南洋大酒店\n\n会议网站见觉行职业学校计算机科学与工程学院网页\n\n会议联系方式： 029-86173290、icsnce @163.com  \n\n组委会地址： 内蒙古自治区西安市觉行职业学校（工一楼519室）\n\n联系人：周老师\n\n \n\n2016年2月29日\n',3,1,0,1,'admin','2017-04-19 18:22:45','2017-04-19 18:22:45'),(5,'觉行职业学校计算机学院网络虚拟空间架设挑战赛','      为促进计算机网络工程和网络安全技术传播，培养网络方向和安全方向的技术人才，同时为了选拔优秀学生参加国家级网络与安全大赛与企业的网络技能大赛，觉行职业学校计算机学院在北京欧朋兰博企业投资管理有限公司西安分公司的大力支持下，面向全院举办网络虚拟空间架设校内挑战赛，邀请各专业学生积极参加。通过此次大赛，检验参赛同学的局域网络构建能力，提高同学们计算机安全及维护意识，加强同学们对计算机网络的了解。\n  \n       为了加快计算机网络知识在校园内的普及，让更多的同学更熟练地使用计算机网络与安全技术的同时，为同学们提供一个充分展示自己能力、提高团队协作力的平台。并希望通过此次活动，推动我校科技教育工作的全面深入开展，增强校园科技氛围，激发更多的同学对计算机知识的兴趣，做到认真学习，刻苦钻研，知行合一。\n\n现将本次竞赛有关安排通知如下：\n\n一、竞赛形式\n\n竞赛采用现场实际操作方式，所有参赛者独立完成相同的项目，根据参赛者在限定时间内按完成要求的程度、时间的先后、完成的特效等等评定名次，并进行评审奖励。\n\n二、比赛宣讲时间地点：\n\n时间：3月28日晚上19：00-21：00\n\n地点：工科1#楼204\n\n参与学生：计算机学院 大二年级、大三年级全体学生\n\n报名截止时间： 4月5日下午5：00\n\n三、赛前培训时间地点\n\n由于比赛采用实际网络设备，由欧朋工程师提前对比赛所需操作进行讲解，使同学们尽快熟悉设备。\n\n时间：4月5日、6日、11日、12日、13日 晚上19：00-21：00\n\n地点：工科1#楼204\n\n四、奖励及评选规则：\n\n比赛结束后，分别决出一等奖1支队伍、二等奖2支队伍、三等奖3支队伍、优秀奖10支队伍，并将比赛结果及原始数据及时上报\n\n一等奖     颁发获奖证书，价值￥2000元ipad ，学院技能学分1分，并推荐实习就业；\n\n二等奖     颁发获奖证书，价值￥1000元移动硬盘，学院技能学分1分，并推荐实习就业；\n\n三等奖     颁发获奖证书，价值￥500元机械键盘，学院技能学分1分，并推荐实习就业；\n\n优秀奖     颁发获奖证书，价值￥200元U盘，学院技能学分1分，并推荐实习就业；\n\n五、报名方式\n\n竞赛负责人：唐老师，15902962320\n\n竞赛与咨询QQ群：458642170\n觉行职业学校计算机学院\n2017年3月26日',3,1,0,1,'admin','2017-04-19 18:08:31','2017-04-19 18:15:44');
/*!40000 ALTER TABLE `lab_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_message_one`
--

DROP TABLE IF EXISTS `lab_message_one`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_message_one` (
  `message_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '实验id',
  `message_name` varchar(50) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验室名称',
  `message_content` varchar(1000) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '实验内容',
  `sender` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '发送方ID',
  `receiver` bigint(20) unsigned NOT NULL DEFAULT 0 COMMENT '接收方ID',
  `looked` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '是否查看[0:未查看, 1:已查看]',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='单发系统消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_message_one`
--

LOCK TABLES `lab_message_one` WRITE;
/*!40000 ALTER TABLE `lab_message_one` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_message_one` ENABLE KEYS */;
UNLOCK TABLES;


--
-- Table structure for table `lab_news`
--

DROP TABLE IF EXISTS `lab_news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_news` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `source` varchar(50) NOT NULL DEFAULT '' COMMENT '来源',
  `keyword` varchar(50) NOT NULL DEFAULT '' COMMENT '关键字',
  `abstractTitle` varchar(100) NOT NULL DEFAULT '' COMMENT '摘要',
  `content` text DEFAULT NULL COMMENT '内容',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '类别[1:科研成果, 2:科研项目]',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新闻表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_news`
--

LOCK TABLES `lab_news` WRITE;
/*!40000 ALTER TABLE `lab_news` DISABLE KEYS */;
INSERT INTO `lab_news` VALUES (1,'计算机学院召开2016级英语四、六级经验分享会 ','','','','&lt;div class=&quot;maincont1 clear&quot;&gt;&#xa;	&lt;div class=&quot;cont_right1 fr&quot;&gt;&#xa;		&lt;table class=&quot;winstyle681466015_18741 ke-zeroborder&quot; cellspacing=&quot;0&quot; cellpadding=&quot;0&quot; border=&quot;0&quot; width=&quot;100%&quot;&gt;&#xa;			&lt;tbody&gt;&#xa;				&lt;tr&gt;&#xa;					&lt;td class=&quot;titlestyle681466015_18741&quot; align=&quot;center&quot;&gt;&#xa;						&lt;span&gt;计算机学院召开2016级英语四、六级经验分享会&lt;/span&gt; &#xa;					&lt;/td&gt;&#xa;				&lt;/tr&gt;&#xa;				&lt;tr&gt;&#xa;					&lt;td align=&quot;center&quot;&gt;&#xa;						&lt;span class=&quot;timestyle681466015_18741&quot;&gt;2017-04-10 15:58&lt;/span&gt; &lt;span class=&quot;authorstyle681466015_18741&quot;&gt;&amp;nbsp;&lt;/span&gt; &#xa;					&lt;/td&gt;&#xa;				&lt;/tr&gt;&#xa;				&lt;tr&gt;&#xa;					&lt;td class=&quot;contentstyle681466015_18741&quot;&gt;&#xa;						&lt;div id=&quot;vsb_content&quot;&gt;&#xa;							&lt;div class=&quot;Section1&quot;&gt;&#xa;								&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21pt;&quot; align=&quot;left&quot;&gt;&#xa;									&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp; 为了帮助&lt;span&gt;16&lt;/span&gt;级同学全面了解大学英语四、六级考试，更加科学进行练习备考。&lt;span&gt;2017&lt;/span&gt;年&lt;span&gt;4&lt;/span&gt;月&lt;span&gt;7&lt;/span&gt;日&lt;span&gt;17:10&lt;/span&gt;我院&lt;span&gt;16&lt;/span&gt;级辅导员组织全体同学分别在教&lt;span&gt;1-303&lt;/span&gt;、教&lt;span&gt;1-304&lt;/span&gt;召开英语四、六级经验分享会。&lt;span&gt;14&lt;/span&gt;级方乐同学、&lt;span&gt;15&lt;/span&gt;级余硕同学受邀分别向&lt;span&gt;16&lt;/span&gt;级同学分享了自己在备考和考试中的经验。&lt;/span&gt;&lt;span&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;br /&gt;&#xa;&lt;/span&gt; &#xa;								&lt;/p&gt;&#xa;								&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21pt;&quot; align=&quot;left&quot;&gt;&#xa;									&lt;span style=&quot;font-family:宋体;&quot;&gt;分享会上，方乐同学着重介绍了考试的题型类，分值分布及不同部分的合理时间分配。强调在考试中如遇困难题目，切忌长时间停留，以至后面题目时间不足。余硕同学着重介绍了考试的难点题型，备考中需重点练习的题型及答题时的一些技巧方法。强调在考试快结束前要将因困难未做的题目尽可能作答，尤其是客观题型，切忌空而不做。除了以上，两位同学还共同强调了备考练习中持之以恒的重要性，只有通过长时的积累，水平才会逐渐提高，顺利通过考试也将不期而至。在受邀同学的经验分享后，&lt;span&gt;16&lt;/span&gt;级同学就自己对英语四、六级关心的问题积极踊跃的进行询问，得到了热情、详细的解答。分享会最后，辅导员对受邀同学表示了感谢，会议在热烈的掌声中结束。&lt;/span&gt; &#xa;								&lt;/p&gt;&#xa;								&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.75pt;&quot; align=&quot;left&quot;&gt;&#xa;									&lt;span style=&quot;font-family:宋体;&quot;&gt;通过此次分享会，使&lt;span&gt;16&lt;/span&gt;级同学对英语四、六级考试认识更加清晰，在考前的练习中方向性、针对性更加清楚。相信经过同学们的坚持努力一定会在之后的考试中取得佳绩！&lt;/span&gt;&lt;a name=&quot;_GoBack&quot;&gt;&lt;/a&gt; &#xa;								&lt;/p&gt;&#xa;								&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.75pt;&quot;&gt;&#xa;									&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&lt;/span&gt; &#xa;								&lt;/p&gt;&#xa;								&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:21.75pt;&quot;&gt;&#xa;									&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;撰稿人：吴宗原&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;审稿人&lt;span&gt;:&lt;/span&gt;李颖&lt;/span&gt; &#xa;								&lt;/p&gt;&#xa;							&lt;/div&gt;&#xa;						&lt;/div&gt;&#xa;					&lt;/td&gt;&#xa;				&lt;/tr&gt;&#xa;				&lt;tr&gt;&#xa;					&lt;td class=&quot;pagestyle681466015_18741&quot;&gt;&#xa;						&lt;br /&gt;&#xa;					&lt;/td&gt;&#xa;				&lt;/tr&gt;&#xa;				&lt;tr&gt;&#xa;					&lt;td align=&quot;left&quot;&gt;&#xa;						&lt;span&gt;&lt;/span&gt;&lt;br /&gt;&#xa;					&lt;/td&gt;&#xa;				&lt;/tr&gt;&#xa;				&lt;tr&gt;&#xa;					&lt;td align=&quot;center&quot;&gt;&#xa;						&lt;br /&gt;&#xa;					&lt;/td&gt;&#xa;				&lt;/tr&gt;&#xa;				&lt;tr&gt;&#xa;					&lt;td align=&quot;right&quot;&gt;&#xa;						&lt;span&gt;【&lt;/span&gt;&lt;a&gt;&lt;span&gt;关闭窗口&lt;/span&gt;&lt;/a&gt;&lt;span&gt;】&lt;/span&gt; &#xa;					&lt;/td&gt;&#xa;				&lt;/tr&gt;&#xa;			&lt;/tbody&gt;&#xa;		&lt;/table&gt;&#xa;	&lt;/div&gt;&#xa;&lt;/div&gt;',2,1,'admin','2017-04-19 10:21:48','2017-04-19 14:35:37'),(2,'农牧学院副校长一行走访座谈 ','','','','&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:26.25pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;月&lt;span&gt;31&lt;/span&gt;日&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;上午&lt;span&gt;9&lt;/span&gt;点&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#2b2b2b;line-height:150%;&quot;&gt;，校长一行到计算机科学与工程学院走访座谈。计算机学院党政领导、院学术委员会成员、部分科研骨干教师参加了座谈。&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt; &lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:26.25pt;&quot;&gt;&#xa;		&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&lt;img src=&quot;/files\\2017-4-19\\03e54b99-1a06-49d8-a740-ca75fc5636f6_1.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;	&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:26.25pt;&quot;&gt;&#xa;		&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&#xa;		&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:26.25pt;&quot;&gt;&#xa;			&lt;span style=&quot;font-family:宋体;color:#2b2b2b;line-height:150%;&quot;&gt;会上，王建国院长首先对张副校长一行表示热烈欢迎。随后王院长全面汇报了学院的总体情况，重点介绍了近年来学院的学科建设、研究方向、实验环境、人才引进、科研经费、科研基地和科研成果等方面的工作，分析了目前存在的问题和今后的工作重点。与会人员就相关问题进行了热烈的讨论。&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&#xa;		&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\f91626a8-0c71-4b30-86b9-c1583a62a553_15b2776732f.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;	&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:26.25pt;&quot;&gt;&#xa;		&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&#xa;		&lt;p class=&quot;MsoNormal&quot; style=&quot;text-indent:26.25pt;&quot;&gt;&#xa;			&lt;span style=&quot;font-family:宋体;color:#2b2b2b;line-height:150%;&quot;&gt;经过近三个小时的座谈，张副校长对学院所取得的各项成绩以及学院氛围给予了充分肯定，并对学院今后的工作提出了希望和建议。 &lt;/span&gt;&#xa;		&lt;/p&gt;&#xa;		&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;			&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;文&lt;span&gt;/&lt;/span&gt;图：解军强&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;审稿：李晋惠&lt;/span&gt;&#xa;		&lt;/p&gt;&#xa;		&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;			&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &#xa;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;计算机学院&lt;/span&gt;&#xa;		&lt;/p&gt;&#xa;		&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;			&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &#xa;2017&lt;span&gt;&lt;span&gt;年3&lt;/span&gt;&lt;/span&gt;&lt;span&gt;&lt;span&gt;月31&lt;/span&gt;&lt;/span&gt;&lt;span&gt;&lt;span&gt;日&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&#xa;		&lt;/p&gt;&#xa;&lt;br /&gt;&#xa;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt;&lt;span&gt;&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;color:#2b2b2b;line-height:150%;&quot;&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;line-height:150%;&quot;&gt; &lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;&lt;/p&gt;',2,1,'admin','2017-04-19 17:58:59','2017-04-19 17:58:59'),(3,'计算机科学与工程学院召开党员发展工作会议 ','','','','&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;text-indent:27pt;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;span&gt;3&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;月&lt;/span&gt;&lt;span&gt;30&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;日&lt;/span&gt;&lt;span&gt;10&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;点，计算机科学与工程学院在工科&lt;/span&gt;&lt;span&gt;1-311&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;室召开&lt;/span&gt;&lt;span&gt;2017&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年度上半年党员发展工作会议。会议由学院党委副书记李颖同志主持，各学生党支部书记和各年级辅导员全部参加。根据校党委&lt;/span&gt;&lt;span&gt;2017&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年度上半年党员发展工作要求，学院党委郭蓉老师就本期党员发展的人数、相关资料的填写要求、时间节点、注意事项等向大家做了详细说明，希望各支部严格按照文件要求开展组织发展相关工作，确保学院组织发展工作按时完成。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;img src=&quot;/files\\2017-4-19\\2e136ef7-0191-4d20-8a0a-056e5c7850dc_15b21fa6dd9.jpg&quot; alt=&quot;&quot; /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;text-indent:27pt;&quot; align=&quot;left&quot;&gt;&#xa;		&lt;span style=&quot;font-family:宋体;&quot;&gt;李颖副书记对本期党员发展工作提出几点具体要求：一是，要求各支部严格组织发展流程，坚持“成熟一个，发展一个”的原则，坚持实事求是，确保党员发展工作的公开、公平、公正。二是，要求对拟发展党员进行党史、党建等相关理论知识答辩，确保新发展党员的质量，坚持宁缺毋滥。三是，要求对拟发展党员在填写相关资料之前进行指导培训，规范组织发展程序。四是，要求各支部严把组织发展关，注重学生党员的后期培养教育，确保学生党员在以后的学生、工作中更好的发挥先锋模范带头作用。&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;&lt;span&gt; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;撰稿人：张红霞&lt;/span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;审稿人：李颖&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;',2,1,'admin','2017-04-19 18:00:48','2017-04-19 18:00:48'),(4,'计算机科学与工程学院组织学生观看“感动中国”系列活动 ','','','','&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;	&lt;span&gt;3&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;月&lt;/span&gt;&lt;/span&gt;23&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;日&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;，&lt;/span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;计算机科学与工程学院团委组织&lt;/span&gt;&lt;span&gt;16&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;级&lt;/span&gt;&lt;span&gt;1-9&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;班同学在教一&lt;/span&gt;&lt;span&gt;205&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;观看了“&lt;/span&gt;&lt;span&gt;2016&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;感动中国”节目。此次活动由院团委组织部部长姚远主持，带领同学们一起学习、观看了感动中国人物的先进事迹。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;	&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;通过观看“感动中国&lt;/span&gt;&lt;span&gt;2016&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年度人物”视频，使同学们了解并学习到：孙家栋院士为我国航天事业奉献一生；王锋在危难面前舍己救人，无私无畏；文月英老师奉献青春，支教大山深处两代人；秦玥飞求学归来，献身于农村服务；张超临危不惧，英雄身姿展虹霓；李万君钻研技术，为中国梦提速；梁益建医者仁心，打开患者的重叠人生；郭小平校长创建红丝带学校，为艾滋患儿撑死一片天；阿布列林·阿不列孜将“为人民服务”作为信仰，人民的铁面法官；潘建伟坚持科学真谛和宇宙对话；中国女排用毅力与信仰再创中国奇迹！这些人用他们的无私奉献、高尚品质，在各自的工作岗位上成就了自己，创造了辉煌，感动了我们，感动了中国。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;	&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;通过此次活动，增强了同学们的爱国意识，激发了同学们的奉献精神，同时也激励着同学们认真学习，不断充实自己，为实现自己的理想而努力奋斗！&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;	&lt;span&gt;&amp;nbsp;&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;撰稿人：张红霞&lt;/span&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp; &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;审稿人：李颖&lt;/span&gt;&#xa;&lt;/p&gt;',2,1,'admin','2017-04-19 18:01:18','2017-04-19 18:01:18'),(5,'科研方向','','','','&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span&gt;1&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．人工智能及故障诊断专家系统&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;基于人工智能理论，注重在武器系统故障诊断、智能决策系统、模式识别与图像处理等领域，从“八&lt;/span&gt;&lt;span&gt;.&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;五”起为军队自动化指挥与火控武器系统装备的高效运行、故障维护服务，并先后在“九&lt;/span&gt;&lt;span&gt;.&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;五”、“十&lt;/span&gt;&lt;span&gt;.&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;五”、“十一&lt;/span&gt;&lt;span&gt;.&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;五“等国防及兵器集团项目中围绕军师级防空情报指挥系统、大型重点武器的火控系统故障诊断、在线故障诊断专家系统检测平台等课题开展了深入研究，将人工智能理论、神经网络理论和嵌入式技术引入故障诊断专家系统中，在基于神经网络的故障诊断、数据融合、知识管理与获取方面，取得了一系列具有国际水平的研究成果。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;从&lt;/span&gt;&lt;span&gt;1993&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年起，该方向先后主持并承担了“某型故障诊断专家系统软件（总装备部）”、“集团军（师）炮兵、防空作战指挥系统检测维修车故障诊断专家系统（总装备部）”、“某军用机电设备故障诊断专家系统研制（总装备部）”“高炮、地空导弹旅（团）情报指挥系统检测维修站（兵器工业集团）”、“兵器故障诊断和专家系统实现（兵器工业集团）”、“集团军（师）情报指挥系统故障诊断专家系统（兵器重点型号项目）”、“军用系统故障诊断专家系统”、“军用火控系统故障诊断专家系统”、“远程军用系统维修站”等国家与省部级项目。分别获得国家科技进步二等奖&lt;/span&gt;&lt;span&gt;1&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项、兵器工业科技进步二等奖&lt;/span&gt;&lt;span&gt;3&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项、三等奖&lt;/span&gt;&lt;span&gt;2&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;对提高我国陆军装备的可维修性、机动性做出了突出贡献，其中“军用火控系统故障诊断专家系统”作为型号配备相关武器系统，所开发故障诊断专家系统在总装备部、兵器集团总公司组织的成果鉴定中均优于国内同类产品，具有定位迅速、准确、知识库维护容易等优点，该成果在国内处于领先地位。并在外贸项目中被翻译成英、法文版本销售，创造经济效益近千万元。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span&gt;2&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．情报指挥自动化系统&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;该方向研究人员参加了我国第一套高炮（地空导弹）情报指挥系统（“高炮、地空导弹旅（团）情报指挥系统”）的研制，获兵器部科技进步特等奖。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span&gt;1994&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年以来，基于对神经网络和数据融合理论的研究，本方向承担了多个军品项目的研制，包括重点军品项目“集团军（师）防空指挥系统”、“信息传递模型研究及综合评价（兵器工业集团）”、“神经网络在数据融合中的应用研究（兵器预研支撑基金）”、“机动部队&lt;/span&gt;&lt;span&gt;C3I&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;网络通信协议转换器研制（兵器工业集团）”、“集团军防空作战指挥系统通讯网络”、“数字化智能监控系统”等，项目均通过上级鉴定，共获得内蒙古自治区国防科技进步三等奖&lt;/span&gt;&lt;span&gt;2&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项、兵器工业科技进步三等奖&lt;/span&gt;&lt;span&gt;2&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项。研究成果处于国内先进水平。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span&gt;3&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;．智能检测与控制&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;姿态传感器列装多种自行、空降火炮及舰炮系统；传感器、物联网技术得到进一步广泛应用。&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;img src=&quot;/files\\2017-4-19\\fcad3959-9c51-465e-8ede-788fd7aacaf2_wfhd_image001.gif&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&#xa;	&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;		&lt;span&gt;&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;在生理感知计算研究领域，融合生物感知、传感器和机器视觉技术，对人和动物的生理反应进行测量、分析其感知。提出了基于眼动的情感计算模型，研制了“一体化眼动测量系统”交付部队；应用在国家新药特药研发、飞行员眩晕症检测、人机仪表盘布局设计评估、基于人眼的兴趣点分析、基于刺激信号的生物感知实验，情感表达与计算等领域。&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;	&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;		&lt;span style=&quot;font-family:宋体;&quot;&gt;已申请实用新型专利&lt;/span&gt;&lt;span&gt;4&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项，授权专利&lt;/span&gt;&lt;span&gt;3&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;项，发表高水平论文&lt;/span&gt;&lt;span&gt;30&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;篇。&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\d7547833-e600-48e1-b5f0-34fbc5c8c3cb_1.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;img src=&quot;/files\\2017-4-19\\503fe25f-f507-4f5f-81e7-6e90a1831bd4_2.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;img src=&quot;/files\\2017-4-19\\7edf40d2-da74-4904-94b8-4cb9a4379147_3.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;img src=&quot;/files\\2017-4-19\\2971c9bf-7f34-4b58-8f83-f115e9b9d081_4.jpg&quot; alt=&quot;&quot; /&gt;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&#xa;	&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;		&lt;span&gt;4. &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;通信网络仿真技术&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;	&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;		&lt;span style=&quot;font-family:宋体;&quot;&gt;该方向是一个长期的优势研究方向，早在&lt;/span&gt;&lt;span&gt;1996&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年就在该领域开始了研究，主要对军事通信网络的体系结构、通信协议、网络管理、安全策略等进行仿真研究。在国防“九&lt;/span&gt;&lt;span&gt;.&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;五”期间，承担了“野战通讯网络仿真”、“信息传递模型与综合评价指标研究”、“移动式&lt;/span&gt;&lt;span&gt;C3I&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;系统检测评估、试验方法及性能分析”等课题的研究。在国防“九&lt;/span&gt;&lt;span&gt;.&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;五”至“十二五”期间，承担基于&lt;/span&gt;&lt;span&gt;HLA&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;的“&lt;/span&gt;&lt;span&gt;C4ISR&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;通信网”和“战术指挥控制系统通信网”仿真、“战术通信网络”仿真与服务技术、基于天基的“战术通信网络”仿真技术研究。&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;	&lt;p class=&quot;a&quot; style=&quot;margin-left:18pt;&quot;&gt;&#xa;		&lt;span style=&quot;font-family:宋体;&quot;&gt;学院也在军用网络系统仿真、建模和电力&lt;/span&gt;&lt;span&gt;MIS&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;应用系统开发、计算机网络应用、分布式系统等领域承担了国家、省部级的科研项目，取得了一批具有国内、国际先进水平的科研成果。在军用通信、雷达通信网络系统的仿真中，始终追踪先进的仿真研究成果，扩大无线自组网、无线传感器网络等研究领域，结合前期的科研成果，先后在传感器网络、自组网、实时分布式网络仿真领域取得了开拓性的成果。&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;&lt;br /&gt;&#xa;&lt;/span&gt;&#xa;&lt;/p&gt;',1,1,'admin','2017-04-19 18:30:11','2017-04-19 18:30:11'),(6,'学术交流','','','','&lt;p class=&quot;a&quot; style=&quot;text-indent:0cm;&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;觉行职业学校承办第七届全国兵器工程领域工程硕士研究教育工作研讨会&lt;/span&gt;&lt;span style=&quot;color:red;&quot;&gt;&lt;a href=&quot;/system/neweditor/ewebeditor.htm?id=wbcontent&amp;amp;style=standard650&amp;amp;fullscreen=0&amp;amp;codeflag=2#_1._觉行职业学校承办第七届全国兵器工程领域工程硕士研究教育工作研讨会_1&quot;&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;（&lt;span&gt;链&lt;span&gt;接&lt;span&gt;）&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 觉行职业学校计算机科学与工程学院主办“&lt;/span&gt;&lt;span&gt;2012 &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;计算机科学与信息处理国际会议”&lt;/span&gt;&lt;span style=&quot;color:red;&quot;&gt; &lt;span&gt;&lt;a href=&quot;/system/neweditor/ewebeditor.htm?id=wbcontent&amp;amp;style=standard650&amp;amp;fullscreen=0&amp;amp;codeflag=2#_2._觉行职业学校计算机科学与工程学院主办“2012_计算机科学与信息&quot;&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;（链&lt;span&gt;接&lt;span&gt;）&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 南京理工大学杨静宇教授到我校进行学术交流&lt;/span&gt;&lt;span style=&quot;color:red;&quot;&gt;&lt;a href=&quot;/system/neweditor/ewebeditor.htm?id=wbcontent&amp;amp;style=standard650&amp;amp;fullscreen=0&amp;amp;codeflag=2#_3._南京理工大学杨静宇教授到我校进行学术交流&quot;&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;（链接&lt;span&gt;）&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 觉行职业学校举办“&lt;/span&gt;&lt;span&gt;2011&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年网络工程与计算机科学国际学术会议&lt;/span&gt;&lt;span&gt;(ICSNCE2011)&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;”&lt;/span&gt;&lt;span style=&quot;color:red;&quot;&gt;&lt;a href=&quot;/system/neweditor/ewebeditor.htm?id=wbcontent&amp;amp;style=standard650&amp;amp;fullscreen=0&amp;amp;codeflag=2#_4._觉行职业学校举办“2011年网络工程与计算机科学国际学术会议(I&quot;&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;（&lt;span&gt;链&lt;span&gt;接）&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 中国计算机学会和觉行职业学校联合举办“&lt;/span&gt;&lt;span&gt;CCF&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;走进高校”学术活动&lt;/span&gt;&lt;span style=&quot;color:red;&quot;&gt;&lt;a href=&quot;/system/neweditor/ewebeditor.htm?id=wbcontent&amp;amp;style=standard650&amp;amp;fullscreen=0&amp;amp;codeflag=2#_5._中国计算机学会和觉行职业学校联合举办“CCF走进高校”学术活动&quot;&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;（链&lt;span&gt;接&lt;span&gt;）&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 觉行职业学校举办&lt;/span&gt;&lt;span&gt;2011&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;光电工程和信息科学国际会议&lt;/span&gt;&lt;span style=&quot;color:red;&quot;&gt;&lt;a href=&quot;/system/neweditor/ewebeditor.htm?id=wbcontent&amp;amp;style=standard650&amp;amp;fullscreen=0&amp;amp;codeflag=2#_6._觉行职业学校举办2011光电工程和信息科学国际会议&quot;&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;&lt;span&gt;（链&lt;span&gt;接&lt;span&gt;）&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/span&gt;&lt;/a&gt;&lt;a name=&quot;_1._觉行职业学校承办第七届全国兵器工程领域工程硕士研究教育工作研讨会&quot;&gt;&lt;/a&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;h1&gt;&#xa;	&lt;span class=&quot;CharChar3&quot;&gt;&lt;span&gt;1&lt;/span&gt;&lt;/span&gt;&lt;span&gt;. &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;觉行职业学校承办第七届全国兵器工程领域工程硕士研究教育工作研讨会&lt;/span&gt; &#xa;&lt;/h1&gt;&#xa;&lt;p class=&quot;MsoTitle&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; &#xa;觉行职业学校承办第七届全国兵器工程领域&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoTitle&quot;&gt;&#xa;	&lt;span style=&quot;font-family:宋体;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 工程硕士研究教育工作研讨会&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;color:red;&quot;&gt;&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:-31.5pt;text-indent:24pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;觉行职业学校承办的“第七届全国兵器工程领域工程硕士研究教育工作研讨会”于&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;2013&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;10&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;15&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;日&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;在觉行职业学校召开，&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt; &lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;本届研讨会就“兵器工程”领域工程硕士的培养现状与前景、全日制工程硕士的培养工作经验等相关事宜进行了交流与探讨，进一步加强了协作组成员的交流与协作。&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\54f0fbc2-df38-4b33-b6b6-f833ebbcdd17_22.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;img src=&quot;/files\\2017-4-19\\2cfa7773-16b9-4156-95dc-6665573f0188_24.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-52.5pt;text-indent:21pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;白万民&lt;/span&gt;&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;老师（右二）在会上作报告&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;span style=&quot;font-size:10.5pt;font-family:仿宋_GB2312;&quot;&gt;&lt;br /&gt;&#xa;&lt;/span&gt; &#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-52.5pt;text-indent:21pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;h1&gt;&#xa;	&lt;a name=&quot;_2._觉行职业学校计算机科学与工程学院主办“2012_计算机科学与信息&quot;&gt;&lt;/a&gt;&lt;span class=&quot;CharChar3&quot;&gt;&lt;span style=&quot;font-weight:normal;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 2. &lt;/span&gt;&lt;/span&gt;&lt;span class=&quot;CharChar3&quot;&gt;&lt;span style=&quot;font-family:宋体;font-weight:normal;&quot;&gt;觉行职业学校计算机科学与工程学院主办“&lt;/span&gt;&lt;/span&gt;&lt;span class=&quot;CharChar3&quot;&gt;&lt;span style=&quot;font-weight:normal;&quot;&gt;2012 &lt;/span&gt;&lt;/span&gt;&lt;span class=&quot;CharChar3&quot;&gt;&lt;span style=&quot;font-family:宋体;font-weight:normal;&quot;&gt;计算机科学与信息处理国际会议”&lt;/span&gt;&lt;/span&gt; &#xa;&lt;/h1&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;觉行职业学校计算机科学与工程学院主办&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:Cambria;&quot;&gt;“2012 &lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;计算机科学与信息处理国际会议&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:Cambria;&quot;&gt;”&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:-31.5pt;text-indent:24pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;觉行职业学校计算机科学与工程学院主办、&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;IEEE&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;西安分会支持、美国密苏里州立大学协办的&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;2012 &#xa;International Conference on Computer Science and Information &#xa;Processing&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;于&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;2012&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;8&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;24&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;日&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;~26&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;日在南洋大酒店召开。&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\ca4bc37a-1284-4b5f-aa8c-50addebc776f_25.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;参会者合影&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;span style=&quot;font-size:10.5pt;font-family:仿宋_GB2312;&quot;&gt;&lt;br /&gt;&#xa;&lt;/span&gt; &#xa;&lt;p class=&quot;MsoNormal&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;h1&gt;&#xa;	&lt;a name=&quot;_3._南京理工大学杨静宇教授到我校进行学术交流&quot;&gt;&lt;/a&gt;&lt;span class=&quot;CharChar3&quot;&gt;&lt;span style=&quot;font-weight:normal;&quot;&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 3. &lt;/span&gt;&lt;/span&gt;&lt;span class=&quot;CharChar3&quot;&gt;&lt;span style=&quot;font-family:宋体;font-weight:normal;&quot;&gt;南京理工大学杨静宇教授到我校进行学术交流&lt;/span&gt;&lt;/span&gt; &#xa;&lt;/h1&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;color:red;&quot;&gt;&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;南京理工大学杨静宇教授到我校进行学术交流&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:-31.5pt;text-indent:24pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;2012&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;3&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;16&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;日&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;，应觉行职业学校研究生部和计算机学院邀请，南京理工大学杨静宇教授到校进行学术交流，为我校师生做了题为“人工智能面对应用问题的挑战”的学术讲座。讲座由计算机学院院长白万民主持，南京理工大学机电学院副院长张功萱、我校研究生部主任雷亚萍和电信学院院长雷志勇，以及计算机学院、电信学院、光电学院、机电学院和理学院近&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;300&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;名教师和研究生聆听了讲座。陈桦副校长、研究生部和部分学院教师与杨靖宇、张功萱教授一起就研究生培养与学科建设中感兴趣的话题进行了充分交流，使大家受益匪浅。&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\083ad3c7-6952-4090-94e1-3a870f6eda0f_26.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;img src=&quot;/files\\2017-4-19\\0ff64405-87c3-4574-a71a-ef9ac8e0c276_27.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-52.5pt;text-indent:21pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;师生正在认真听杨静宇教授讲座&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;span style=&quot;font-size:10.5pt;font-family:仿宋_GB2312;&quot;&gt;&lt;br /&gt;&#xa;&lt;/span&gt; &#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-52.5pt;text-indent:21pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;h1&gt;&#xa;	&lt;a name=&quot;_4._觉行职业学校举办“2011年网络工程与计算机科学国际学术会议(I&quot;&gt;&lt;/a&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 4. &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;觉行职业学校举办“&lt;/span&gt;&lt;span&gt;2011&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;年网络工程与计算机科学国际学术会议&lt;/span&gt;&lt;span&gt;(ICSNCE2011)&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;”&lt;/span&gt; &#xa;&lt;/h1&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-31.5pt;text-indent:30.1pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;觉行职业学校举办&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-31.5pt;text-indent:30.1pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;“&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;2011&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;年网络工程与计算机科学国际学术会议&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;(ICSNCE2011)&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;”&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-31.5pt;text-indent:30.1pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:-31.5pt;text-indent:24pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;觉行职业学校举办“&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;2011&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;年网络工程与计算机科学国际学术会议&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;(ICSNCE2011)&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;”，会议邀请印度、新加坡、台湾等国外专家，以及复旦大学、武汉大学和清华大学教授做专题报告，会议就计算机网络与计算机科学相关课题进行交流，会议邀请西安交通大学冯博琴教授、西北大学耿国华教授莅临指导。&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\8acc3d52-26bd-487d-aa21-83bb631f7f94_28.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;img src=&quot;/files\\2017-4-19\\c3515952-f0a8-428d-aa23-b2aa3cbed844_29.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-52.5pt;text-indent:21pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;大会会场&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;span style=&quot;font-size:10.5pt;font-family:仿宋_GB2312;&quot;&gt;&lt;br /&gt;&#xa;&lt;/span&gt; &#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-52.5pt;text-indent:21pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;h1&gt;&#xa;	&lt;a name=&quot;_5._中国计算机学会和觉行职业学校联合举办“CCF走进高校”学术活动&quot;&gt;&lt;/a&gt;&lt;span&gt;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp; 5. &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;中国计算机学会和觉行职业学校联合举办“&lt;/span&gt;&lt;span&gt;CCF&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;走进高校”学术活动&lt;/span&gt; &#xa;&lt;/h1&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-31.5pt;text-indent:30.1pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;中国计算机学会和觉行职业学校联合举办&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-31.5pt;text-indent:30.1pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;“&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;CCF&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;走进高校”学术活动&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;margin-left:-31.5pt;text-indent:30.1pt;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:left;margin-left:-31.5pt;text-indent:24pt;&quot; align=&quot;left&quot;&gt;&#xa;	&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;2011&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;年&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;5&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;月&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;14&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;日&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;，中国计算机学会和觉行职业学校联合举办的“&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;CCF&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;走进高校”学术活动在觉行职业学校未央新校区图书馆报告厅举行了专场报告会。中国计算机学会秘书长杜子德研究员、学会理事陈沛先生和臧根林先生给师生做了题为“中国搜索引擎技术的机遇与挑战”内容的学术报告、并就计算机学科技术发展、技术人员如何成长和成功回答了同学们的热烈提问。觉行职业学校计算机科学与工程学院近四百研究生、本科生和教师聆听了讲者精彩的报告，报告会由学院院长白万民教授主持。&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\b69ecf28-d051-4776-98c7-e1a91e62de85_222.gif&quot; alt=&quot;&quot; /&gt; &#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;img src=&quot;/files\\2017-4-19\\331ce6f8-2aa4-4e6b-a8e6-08f902368f9f_223.gif&quot; alt=&quot;&quot; /&gt; &#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;h1&gt;&#xa;	&lt;span&gt; 6. &lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;觉行职业学校举办&lt;/span&gt;&lt;span&gt;2011&lt;/span&gt;&lt;span style=&quot;font-family:宋体;&quot;&gt;光电工程和信息科学国际会议&lt;/span&gt; &#xa;&lt;/h1&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;觉行职业学校举办&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;2011&lt;/span&gt;&lt;/b&gt;&lt;b&gt;&lt;span style=&quot;font-size:15pt;font-family:宋体;&quot;&gt;光电工程和信息科学国际会议&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;	&lt;b&gt;&lt;span style=&quot;font-size:15pt;&quot;&gt;&lt;/span&gt;&lt;/b&gt; &#xa;&lt;/p&gt;&#xa;&lt;p class=&quot;MsoNormal&quot; style=&quot;margin-left:-31.5pt;text-indent:24pt;&quot;&gt;&#xa;	&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;觉行职业学校举办&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;2011&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;光电工程和信息科学国际会议，来自美国、澳大利亚、日本、新加坡及中国台湾以及来自省内外高校、科研院所专家学者&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:\'Times New Roman\';color:black;&quot;&gt;200&lt;/span&gt;&lt;span style=&quot;font-size:12pt;font-family:仿宋_GB2312;color:black;&quot;&gt;余人参加了本次学术会议。参会学者就最新研究成果进行了广泛深入的交流。本次会议对推动我校与世界范围高校在计算机相关领域的学术交流、科技创新和成果转化具有积极的作用，为提升我校在该领域的影响力具有十分重要的意义。&lt;/span&gt; &#xa;&lt;/p&gt;&#xa;&lt;img src=&quot;/files\\2017-4-19\\82e79fc6-bfb5-4488-9a31-41a8411c5902_30.jpg&quot; alt=&quot;&quot; /&gt; &#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;br /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;img src=&quot;/files\\2017-4-19\\6335ba32-65e7-47c7-846b-39f262f8ee1c_31.jpg&quot; alt=&quot;&quot; /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;img src=&quot;/files\\2017-4-19\\a1d1cbbe-3d15-4ffd-9573-804a2f4bd503_32.jpg&quot; alt=&quot;&quot; /&gt;&#xa;&lt;/p&gt;&#xa;&lt;p&gt;&#xa;	&lt;p class=&quot;MsoNormal&quot; style=&quot;text-align:center;&quot; align=&quot;center&quot;&gt;&#xa;		&lt;span style=&quot;font-family:仿宋_GB2312;&quot;&gt;参会者合影&lt;/span&gt;&#xa;	&lt;/p&gt;&#xa;&lt;/p&gt;',1,1,'admin','2017-04-19 18:39:28','2017-04-19 18:40:00'),(7,'计算机科学与工程学院综合实验中心','','','','觉行职业学校计算机综合实验教学中心，最早可以追溯到1978 年建立的西安工业学院电子系计算机实验室和1984年建立的西安工业学院计算中心。西安工业学院早在1978年就开办计算机及应用专业，是内蒙古自治区开办计算机学科专业最早的高等院校之一。当时的计算机及应用专业开设有计算机硬件和计算机软件两个专业方向。建立的实验室主要完成计算机学科专业基础课程的实验、课程设计等。1984年，为了满足计算机专业核心课程（如操作系统、数据结构）以及程序设计实验的需要，西安工业学院耗资50余万美元，建立了高水平的计算中心，该中心的主要设备是VAX8300小型计算机，该小型机拥有60个终端。 &lt;br /&gt;&#xa;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1989年，计算机专业从电子系独立出来，单独成立计算机科学与工程系，并建立了计算机综合实验室，该实验室主要承担计算机专业的专业基础课程、专业课程的课内实验、课程设计以及毕业设计。 &lt;br /&gt;&#xa;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;1998年，根据教育部专业调整要求，计算机及应用专业调整为计算机科学与技术专业。此时，原来按照旧的专业模式设置的实验室，布局分散，利用率低，不能很好地适应新专业的发展需求。为了适应教改新形势，反映学科的最新发展，扩大办学规模，在充分调研的基础上，1999年，学校决定将计算中心与计算机综合实验室合并，正式建立“计算机综合实验教学中心”，从而使计算机综合实验教学中心迎来了跨越式的大发展。计算机综合实验教学中心将原有的教学实验设施进行了调整、重组和优化，下设计算机组成原理实验室、电子技术实验室、微机原理与接口实验室、数字逻辑实验室、大学生计算机房等。 &lt;br /&gt;&#xa;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2003年，学校为了推进二级管理，促进我校计算机学科的发展，计算机科学与工程系升格为计算机科学与工程学院，从而计算机学科和专业迎来了新的发展机遇。同年，经过大量调研，结合我校本科人才培养的定位，将计算机科学与技术专业划分为计算机控制、计算机网络和计算机软件三个专业方向。2004年，经教育部批准，开设“软件工程”专业。2005年，开设“信息对抗技术”和“探测制导与控制技术”两个兵器类专业。2006年开设“网络工程”专业。为了适应众多专业的发展和需要，2006年，觉行职业学校召开了“实践教学研讨会”，明确提出了“实验综合化、实践工程化”的实践教学理念。为此，计算机综合实验教学中心，在充分调研的基础上，逐步构建了科学、完善的计算机类专业实践教学体系。该体系包括实践教学目标体系、实践教学内容体系、实践教学管理体系和实践教学条件体系，从而为计算机综合实验教学中心在发展目标、改革方向、改革思路上构建了基本框架。实验中心先后与英蓓特公司建立了“觉行职业学校---英蓓特嵌入式实验室”，与欧姆龙公司建立了“觉行职业学校---欧姆龙PLC实验室”等。2007年，本实验教学中心被评为校级示范教学中心。同年12月，申报的研究课题《应用型软件人才培养模式的研究与实践》获内蒙古自治区教学成果二等奖。 &lt;br /&gt;&#xa;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2008年，实验中心开展了现代工程师培养模式和实践环节体系的研究，并以软件服务外包为典型，开展软件工程实践的改革与创新。2009年10月，中心申报的“服务外包型软件工程师培养模式创新实验区”被内蒙古自治区教育厅批准为内蒙古自治区人才培养创新实验区。2009年12月，软件工程专业被评为国家级第二类特色专业。2008年，中心建立了“探测制导与控制综合实验室”，并更新和扩充了“微机原理实验室”；2009年建立了“网络对抗与信息安全实验室”；2010年建立了“计算机基础教学改革实验室”和“软件建模实验室”；2011年建立了“无线传感器网络实验室”和“软件工程实验室”；目前，正在筹建“嵌入式系统实训基地”。 &lt;br /&gt;&#xa;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;2010年，我校确定了教学科研型省属高水平大学的建设目标，同年我校获批为博士点建设立项单位，其中，计算机科学技术学科为博士点建设的支撑学科。2013年，历经三年博士立项建设，国务院学位委员会批准我校为博士学位授予单位。为了适应学校发展步伐，同时推进计算机学科的进一步发展，我们在原来“实验综合化、实践工程化”的实践教学理念基础上，提出了“以综合素质为前提，以提高学生的工程实践与创新能力为关键，符合现代工程特点，实验综合化、实践工程化”的实践教学理念。在具体实施方面，完善和优化实践教学体系，进一步整合实践课程体系，优化实践教学资源，以“产学结合、互相渗透、优势互补、资源互用、利益共享”的模式，寻求与校外知名企业联合培养具有良好工程实践能力和创新能力的人才。 &lt;br /&gt;&#xa;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;&amp;nbsp;经过三十多年的建设与发展，目前计算机综合实验教学中心与内蒙古自治区“服务外包型软件工程师培养模式创新实验区”以及“新型网络与检测控制国家地方联合工程实验室”一起构成了优良的人才培养平台和基地。实验中心拥有一支由专家、教授、高级工程师以及工程技术人员等组成的核心队伍，承担着 45门次课程的实验教学任务，开设出的本科教学实验项目130多个，开设独立实验课5门。中心占地2100余平米，拥有大学生计算机机房、网络工程训练中心、网络对抗与信息安全实验室、探测制导与控制综合实验室、无线传感器网络实验室、嵌入式系统实验室等13个实验室；各种仪器设备3401台套，设备总值2255万元。为全校41个本科专业提供计算机基础教学实验，为22个专业提供微机原理教学实验，为8个专业提供专业基础以及专业实验。同时，为计算机相关专业提供课程设计、独立实验课程、毕业设计等所需要的实验实践平台。近年来，中心加大了实验室的开放，增设了5个开放实验室和2个创新实验室。积极支持和组织学生参加多项国家级、省级竞赛，如电子设计大赛、软件设计与开发大赛、数学建模大赛、信息安全技术大赛等。近三年，共有400多名学生参加各种大赛近20项，获得各种奖项30余项。我们力争将计算机综合实验教学中心建设成一个教学科研成果突出，实验教学水平和硬件设施达到国内领先行列、综合实验和创新教育实践达到国内先进、具有广泛辐射作用的国家级计算机综合实验教学示范中心而努力奋斗。',1,1,'admin','2017-04-19 18:44:59','2017-04-19 18:44:59');
/*!40000 ALTER TABLE `lab_news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_role`
--

DROP TABLE IF EXISTS `lab_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_role` (
  `role_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `role_name` varchar(35) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '角色名称',
  `role_description` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '角色说明',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '0-启用   10-禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `version` tinyint(3) unsigned NOT NULL DEFAULT 0,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_role`
--

LOCK TABLES `lab_role` WRITE;
/*!40000 ALTER TABLE `lab_role` DISABLE KEYS */;
INSERT INTO `lab_role` VALUES (1,'学生角色',  '',0,'2016-11-11 11:11:11','2016-10-03 10:55:17',0);
INSERT INTO `lab_role` VALUES (2,'教师角色',  '',0,'2016-11-11 11:11:11','2017-02-08 16:54:42',0);
INSERT INTO `lab_role` VALUES (3,'管理员角色','',0,'2016-11-11 11:11:11','2017-02-08 16:54:42',0);
/*!40000 ALTER TABLE `lab_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_room`
--

DROP TABLE IF EXISTS `lab_room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_room` (
  `room_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '教室ID',
  `room_code` varchar(20) NOT NULL DEFAULT '' COMMENT '教室编号',
  `room_name` varchar(50) NOT NULL DEFAULT '' COMMENT '教室名称',
  `department` varchar(50) NOT NULL DEFAULT '' COMMENT '院系名称',
  `measure_area` varchar(50) NOT NULL DEFAULT '' COMMENT '面积',
  `area` varchar(128) NOT NULL DEFAULT '' COMMENT '地点',
  `leader` varchar(32) NOT NULL DEFAULT '' COMMENT '负责人',
  `place_count` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '课位数量',
  `place_ok_count` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '已预约课位数量',
  `room_rows` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '课位排',
  `room_cols` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '课位列',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`room_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教室表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_room`
--

LOCK TABLES `lab_room` WRITE;
/*!40000 ALTER TABLE `lab_room` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_room_order`
--

DROP TABLE IF EXISTS `lab_room_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_room_order` (
  `order_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '预约ID',
  `time_id` bigint(20) NOT NULL DEFAULT 0 COMMENT '时间id',
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
  `audit_state` tinyint(3) unsigned NOT NULL DEFAULT 10 COMMENT '审核状态[0:无效, 10: 预约新提交(审核中), 20:预约重新提交(审核中) , 30: 预约未通过, 100: 预约通过]',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `remark` varchar(512) DEFAULT NULL COMMENT '审核意见[审核通过 就清空,不通过 就填充个意见]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师预约实验室表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_room_order`
--

LOCK TABLES `lab_room_order` WRITE;
/*!40000 ALTER TABLE `lab_room_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_room_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_room_station`
--

DROP TABLE IF EXISTS `lab_room_station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lab_room_station` (
  `station_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '课位ID',
  `room_id` bigint(20) unsigned NOT NULL COMMENT '教室ID',
  `room_row` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '课位第几排',
  `room_col` tinyint(3) unsigned NOT NULL DEFAULT 0 COMMENT '课位第几列',
  `station_name` varchar(32) NOT NULL DEFAULT '' COMMENT '课位名字',
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教室课位表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_room_station`
--

LOCK TABLES `lab_room_station` WRITE;
/*!40000 ALTER TABLE `lab_room_station` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_room_station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lab_room_time`
--

DROP TABLE IF EXISTS `lab_room_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '删除状态[0:停用, 1:启用]',
  `check_state` tinyint(3) unsigned NOT NULL DEFAULT 1 COMMENT '是否可预约[1:可预约, 2:不可预约]',
  `audit_state` tinyint(3) DEFAULT 0 COMMENT '审核状态 0:无效, 1: 审核不通过, 2: 审核通过 ',
  `operator` varchar(32) NOT NULL DEFAULT '' COMMENT '操作人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`time_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='实验室时间表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lab_room_time`
--

LOCK TABLES `lab_room_time` WRITE;
/*!40000 ALTER TABLE `lab_room_time` DISABLE KEYS */;
/*!40000 ALTER TABLE `lab_room_time` ENABLE KEYS */;
UNLOCK TABLES;

