/*
Navicat MySQL Data Transfer

Source Server         : spanker
Source Server Version : 50520
Source Host           : 127.0.0.1:3306
Source Database       : hsoa_v1

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2014-06-24 13:55:22
*/

set global log_bin_trust_function_creators=1;
set global event_scheduler =1;
SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for config_estimate
-- ----------------------------
DROP TABLE IF EXISTS `config_estimate`;
CREATE TABLE `config_estimate` (
  `EstimateID` int(11) NOT NULL AUTO_INCREMENT,
  `EstName` varchar(50) DEFAULT NULL,
  `MinValue` decimal(8,2) DEFAULT NULL,
  `MaxValue` decimal(8,2) DEFAULT NULL,
  `EstValue` varchar(50) DEFAULT NULL,
  `EstIntro` varchar(100) DEFAULT NULL,
  `Remark` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`EstimateID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config_estimate
-- ----------------------------

-- ----------------------------
-- Table structure for info_class
-- ----------------------------
DROP TABLE IF EXISTS `info_class`;
CREATE TABLE `info_class` (
  `ClassID` int(11) NOT NULL AUTO_INCREMENT COMMENT '班级ID',
  `SchoolID` int(11) NOT NULL COMMENT '学校ID',
  `GradeID` int(11) NOT NULL COMMENT '年级ID',
  `ClassName` varchar(32) NOT NULL COMMENT '班级名称',
  `Type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0.不区分 1.文 2.理',
  `ClassLevel` tinyint(4) DEFAULT NULL COMMENT '层次类型',
  `CreatorID` int(11) NOT NULL COMMENT '创建人',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `State` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0.无效 1.有效',
  PRIMARY KEY (`ClassID`),
  KEY `Index_SGT` (`SchoolID`,`GradeID`,`Type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='班级信息表';

-- ----------------------------
-- Records of info_class
-- ----------------------------

-- ----------------------------
-- Table structure for info_class_manage
-- ----------------------------
DROP TABLE IF EXISTS `info_class_manage`;
CREATE TABLE `info_class_manage` (
  `UID` int(11) NOT NULL COMMENT '用户ID',
  `ClassID` int(11) NOT NULL COMMENT '班级ID',
  `SchoolID` int(11) NOT NULL COMMENT '学校ID',
  `GradeID` int(11) NOT NULL COMMENT '年级ID',
  `CreatorID` int(11) NOT NULL COMMENT '创建人',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `State` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0.无效1.有效',
  PRIMARY KEY (`UID`,`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级管理人员表';

-- ----------------------------
-- Records of info_class_manage
-- ----------------------------

-- ----------------------------
-- Table structure for info_exam
-- ----------------------------
DROP TABLE IF EXISTS `info_exam`;
CREATE TABLE `info_exam` (
  `ExamID` int(11) NOT NULL AUTO_INCREMENT COMMENT '考试ID',
  `ExamName` varchar(64) NOT NULL COMMENT '考试名称',
  `ExamTime` datetime NOT NULL COMMENT '考试时间',
  `SchoolID` int(11) NOT NULL COMMENT '学校ID',
  `GradeID` int(11) NOT NULL COMMENT '年级ID',
  `ClassID` int(11) NOT NULL COMMENT '班级ID',
  `Type` tinyint(4) DEFAULT '0' COMMENT '0.不区分 1.文 2.理',
  `Scope` tinyint(4) DEFAULT '1' COMMENT '0.班级 1.年级 2.校级',
  `Rank1` int(11) DEFAULT NULL COMMENT '一本参照排名',
  `Rank2` int(11) DEFAULT NULL COMMENT '二本参照排名',
  `Rank3` int(11) DEFAULT NULL COMMENT '三本参照排名',
  `CreatorID` int(11) NOT NULL COMMENT '创建人',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `State` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0.无效 1.有效',
  PRIMARY KEY (`ExamID`),
  KEY `Index_GCT` (`GradeID`,`ClassID`,`Type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='考试信息表';

-- ----------------------------
-- Records of info_exam
-- ----------------------------

-- ----------------------------
-- Table structure for info_examupdatetime
-- ----------------------------
DROP TABLE IF EXISTS `info_examupdatetime`;
CREATE TABLE `info_examupdatetime` (
  `UniID` int(11) NOT NULL AUTO_INCREMENT,
  `ExamID` int(11) DEFAULT NULL COMMENT '考试ID',
  `LastUpdateTime` datetime DEFAULT NULL COMMENT '最近更新时间',
  `IsDeal` tinyint(4) DEFAULT NULL COMMENT '是否处理',
  `DealTime` datetime DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`UniID`),
  KEY `Index_ExamID` (`ExamID`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='考试得分最近更新表,用于批量生成数据时用';

-- ----------------------------
-- Records of info_examupdatetime
-- ----------------------------

-- ----------------------------
-- Table structure for info_exam_class_stat
-- ----------------------------
DROP TABLE IF EXISTS `info_exam_class_stat`;
CREATE TABLE `info_exam_class_stat` (
  `ExamID` int(11) NOT NULL COMMENT '考试ID',
  `GradeID` int(11) NOT NULL COMMENT '年级ID',
  `ClassID` int(11) NOT NULL COMMENT '班级ID',
  `SubjectID` int(11) NOT NULL COMMENT '科目ID',
  `UID` int(11) NOT NULL COMMENT '用户ID（教师）',
  `Count` smallint(6) DEFAULT NULL COMMENT '总人数',
  `Avg` decimal(8,2) DEFAULT NULL COMMENT '平均分',
  `AvgRank` tinyint(4) DEFAULT NULL,
  `Max` decimal(8,2) DEFAULT NULL COMMENT '最高分',
  `MaxRank` tinyint(4) DEFAULT NULL,
  `Min` decimal(8,2) DEFAULT NULL COMMENT '最低分',
  `MinRank` tinyint(4) DEFAULT NULL,
  `PassCount` smallint(6) DEFAULT NULL COMMENT '及格人数',
  `PassRank` tinyint(4) DEFAULT NULL,
  `ScoreRange` varchar(256) DEFAULT NULL COMMENT '分数段人数',
  `RankRange` varchar(256) DEFAULT NULL COMMENT '名次段人数',
  `StDeviation` decimal(8,2) DEFAULT NULL,
  `StDeviationRank` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`ExamID`,`GradeID`,`ClassID`,`SubjectID`),
  KEY `Index_UID` (`UID`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试班级统计信息表';

-- ----------------------------
-- Records of info_exam_class_stat
-- ----------------------------

-- ----------------------------
-- Table structure for info_exam_class_yscore
-- ----------------------------
DROP TABLE IF EXISTS `info_exam_class_yscore`;
CREATE TABLE `info_exam_class_yscore` (
  `ExamID` int(11) NOT NULL COMMENT '考试ID',
  `GradeID` int(11) NOT NULL COMMENT '年级ID',
  `ClassID` int(11) NOT NULL COMMENT '班级ID',
  `SubjectID` int(11) NOT NULL COMMENT '科目ID',
  `UID` int(11) NOT NULL COMMENT '用户ID（教师）',
  `AvgYScore` decimal(8,2) DEFAULT NULL COMMENT '本次平均Y分数',
  `MaxYScore` decimal(8,2) DEFAULT NULL COMMENT '本次最高Y分数',
  `MinYScore` decimal(8,2) DEFAULT NULL COMMENT '本次最低Y分数',
  `AvgCYScore` decimal(8,2) DEFAULT NULL COMMENT '加权平均Y分数',
  `AvgCYScoreRank` tinyint(4) DEFAULT NULL,
  `MaxCYScore` decimal(8,2) DEFAULT NULL COMMENT '加权最高Y分数',
  `MaxCYScoreRank` tinyint(4) DEFAULT NULL,
  `MinCYScore` decimal(8,2) DEFAULT NULL COMMENT '加权最低Y分数',
  `MinCYScoreRank` tinyint(4) DEFAULT NULL,
  `AvgSta` decimal(8,2) DEFAULT NULL COMMENT '平均稳定性',
  `AvgStaRank` tinyint(4) DEFAULT NULL,
  `MaxSta` decimal(8,2) DEFAULT NULL COMMENT '最高稳定性',
  `MaxStaRank` tinyint(4) DEFAULT NULL,
  `MinSta` decimal(8,2) DEFAULT NULL COMMENT '最低稳定性',
  `MinStaRank` tinyint(4) DEFAULT NULL,
  `AvgImp` decimal(8,2) DEFAULT NULL,
  `AvgImpRank` tinyint(4) DEFAULT NULL,
  `MaxImp` decimal(8,2) DEFAULT NULL,
  `MaxImpRank` tinyint(4) DEFAULT NULL,
  `MinImp` decimal(8,2) DEFAULT NULL,
  `MinImpRank` tinyint(4) DEFAULT NULL,
  `ScatterYScore` decimal(8,2) DEFAULT NULL,
  `ScatterCYScore` decimal(8,2) DEFAULT NULL,
  `DiffYScore` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`ExamID`,`GradeID`,`ClassID`,`SubjectID`),
  KEY `Index_UID` (`UID`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试班级毅瓢指数信息表';

-- ----------------------------
-- Records of info_exam_class_yscore
-- ----------------------------

-- ----------------------------
-- Table structure for info_exam_grade_stat
-- ----------------------------
DROP TABLE IF EXISTS `info_exam_grade_stat`;
CREATE TABLE `info_exam_grade_stat` (
  `ExamID` int(11) NOT NULL COMMENT '考试ID',
  `GradeID` int(11) NOT NULL COMMENT '年级ID',
  `SubjectID` int(11) NOT NULL COMMENT '科目ID',
  `Count` smallint(6) DEFAULT NULL COMMENT '总人数',
  `Avg` decimal(8,2) DEFAULT NULL COMMENT '平均分',
  `Max` decimal(8,2) DEFAULT NULL COMMENT '最高分',
  `Min` decimal(8,2) DEFAULT NULL COMMENT '最低分',
  `PassCount` smallint(6) DEFAULT NULL COMMENT '及格人数',
  `ScoreRange` varchar(256) DEFAULT NULL COMMENT '分数段人数',
  `StDeviation` decimal(8,2) DEFAULT NULL COMMENT '标准差',
  PRIMARY KEY (`ExamID`,`GradeID`,`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试年级统计信息表';

-- ----------------------------
-- Records of info_exam_grade_stat
-- ----------------------------

-- ----------------------------
-- Table structure for info_exam_recently
-- ----------------------------
DROP TABLE IF EXISTS `info_exam_recently`;
CREATE TABLE `info_exam_recently` (
  `SeqID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL COMMENT '用户ID',
  `SubjectID` int(11) NOT NULL COMMENT '科目ID',
  `ExamID` int(11) DEFAULT NULL COMMENT '目前的ExamID',
  `YScore` decimal(8,2) DEFAULT NULL COMMENT 'Y分数1',
  `FScore` decimal(8,2) DEFAULT NULL COMMENT 'F分数1，参展Y-该生Y',
  PRIMARY KEY (`SeqID`),
  KEY `Index_USE` (`UID`,`SubjectID`,`ExamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='最近四次考试信息表';

-- ----------------------------
-- Records of info_exam_recently
-- ----------------------------

-- ----------------------------
-- Table structure for info_exam_score
-- ----------------------------
DROP TABLE IF EXISTS `info_exam_score`;
CREATE TABLE `info_exam_score` (
  `SeqID` int(11) NOT NULL AUTO_INCREMENT COMMENT '流水号',
  `ExamID` int(11) NOT NULL COMMENT '考试ID',
  `SubjectID` int(11) NOT NULL COMMENT '科目ID',
  `UID` int(11) NOT NULL COMMENT '用户ID',
  `GradeID` int(11) NOT NULL COMMENT '年级ID',
  `ClassID` int(11) NOT NULL COMMENT '班级ID',
  `Score` decimal(8,2) DEFAULT NULL COMMENT '分数',
  `ClassRank` int(11) DEFAULT NULL COMMENT '班级排名',
  `GradeRank` int(11) DEFAULT NULL COMMENT '年级排名',
  PRIMARY KEY (`SeqID`),
  KEY `Index_ESU` (`ExamID`,`SubjectID`,`UID`),
  KEY `Index_ClassID` (`ClassID`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='考试得分信息表';

-- ----------------------------
-- Records of info_exam_score
-- ----------------------------

-- ----------------------------
-- Table structure for info_exam_subject
-- ----------------------------
DROP TABLE IF EXISTS `info_exam_subject`;
CREATE TABLE `info_exam_subject` (
  `ExamID` int(11) NOT NULL COMMENT '考试ID',
  `SubjectID` int(11) NOT NULL COMMENT '科目ID',
  `FullScore` decimal(8,2) DEFAULT NULL COMMENT '总分',
  `PassScore` decimal(8,2) DEFAULT NULL,
  `YRefer` decimal(8,2) DEFAULT NULL COMMENT 'Y分数参照，一个区域学生的Y分数平均',
  `ScoreRange` varchar(128) DEFAULT NULL COMMENT '一个数字表示区间距或者0-10,11-100形式',
  `State` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0.无效 1.有效',
  PRIMARY KEY (`ExamID`,`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试科目信息表';

-- ----------------------------
-- Records of info_exam_subject
-- ----------------------------

-- ----------------------------
-- Table structure for info_exam_usersend
-- ----------------------------
DROP TABLE IF EXISTS `info_exam_usersend`;
CREATE TABLE `info_exam_usersend` (
  `UID` int(11) NOT NULL DEFAULT '0',
  `ExamID` int(11) NOT NULL DEFAULT '0',
  `SendTime` datetime NOT NULL,
  PRIMARY KEY (`UID`,`ExamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_exam_usersend
-- ----------------------------

-- ----------------------------
-- Table structure for info_exam_yscore
-- ----------------------------
DROP TABLE IF EXISTS `info_exam_yscore`;
CREATE TABLE `info_exam_yscore` (
  `ExamID` int(11) NOT NULL COMMENT '考试ID',
  `SubjectID` int(11) NOT NULL COMMENT '科目ID',
  `UID` int(11) NOT NULL COMMENT '用户ID',
  `GradeID` int(11) NOT NULL COMMENT '年级ID',
  `ClassID` int(11) NOT NULL COMMENT '班级ID',
  `YScore` decimal(8,2) DEFAULT NULL COMMENT '本次Y分数',
  `CYScore` decimal(8,2) DEFAULT NULL COMMENT '加权Y分数',
  `Stability` decimal(8,2) DEFAULT '0.00' COMMENT '稳定指数',
  `Improve` decimal(8,2) DEFAULT '0.00' COMMENT '进步指数',
  `CYClaRank` int(11) DEFAULT NULL COMMENT '加权Y分数班级排名',
  `CYGraRank` int(11) DEFAULT NULL COMMENT '加权Y分数年级排名',
  `StaClaRank` int(11) DEFAULT NULL COMMENT '稳定性班级排名',
  `StaGraRank` int(11) DEFAULT NULL COMMENT '稳定性年级排名',
  `ImpClaRank` int(11) DEFAULT NULL COMMENT '进步指数班级排名',
  `ImpGraRank` int(11) DEFAULT NULL COMMENT '进步指数年级排名',
  PRIMARY KEY (`ExamID`,`SubjectID`,`UID`),
  KEY `Index_ClassID` (`ClassID`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试毅瓢指数信息表';

-- ----------------------------
-- Records of info_exam_yscore
-- ----------------------------

-- ----------------------------
-- Table structure for info_grade
-- ----------------------------
DROP TABLE IF EXISTS `info_grade`;
CREATE TABLE `info_grade` (
  `GradeID` int(11) NOT NULL AUTO_INCREMENT COMMENT '年级ID',
  `SchoolID` int(11) NOT NULL COMMENT '学校ID',
  `GradeName` varchar(32) NOT NULL COMMENT '年级名称',
  `CreatorID` int(11) NOT NULL COMMENT '创建人',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `State` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0.无效 1.有效',
  PRIMARY KEY (`GradeID`),
  KEY `Index_SchoolD` (`SchoolID`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='年级信息表';

-- ----------------------------
-- Records of info_grade
-- ----------------------------

-- ----------------------------
-- Table structure for info_grade_manage
-- ----------------------------
DROP TABLE IF EXISTS `info_grade_manage`;
CREATE TABLE `info_grade_manage` (
  `GradeID` int(11) NOT NULL COMMENT '年级ID',
  `SchoolID` int(11) DEFAULT NULL COMMENT '学校ID',
  `UID` int(11) NOT NULL COMMENT '用户ID',
  `CreatorID` int(11) DEFAULT NULL COMMENT '创建人',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `State` tinyint(4) DEFAULT '1' COMMENT '0.无效1.有效',
  PRIMARY KEY (`GradeID`,`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='年级管理人员表';

-- ----------------------------
-- Records of info_grade_manage
-- ----------------------------

-- ----------------------------
-- Table structure for info_product
-- ----------------------------
DROP TABLE IF EXISTS `info_product`;
CREATE TABLE `info_product` (
  `ProductID` int(11) NOT NULL AUTO_INCREMENT,
  `PackageID` int(11) NOT NULL,
  `ProductName` varchar(200) NOT NULL,
  `MonthNum` tinyint(4) DEFAULT NULL,
  `Amount` decimal(8,2) NOT NULL,
  `CreateTime` datetime NOT NULL,
  `State` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`ProductID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_product
-- ----------------------------
INSERT INTO `info_product` VALUES ('1', '1', '1个月', '1', '8.00', '0000-00-00 00:00:00', '1');
INSERT INTO `info_product` VALUES ('2', '1', '3个月', '3', '24.00', '0000-00-00 00:00:00', '1');
INSERT INTO `info_product` VALUES ('3', '1', '6个月', '6', '45.00', '0000-00-00 00:00:00', '1');
INSERT INTO `info_product` VALUES ('4', '1', '12个月', '12', '90.00', '0000-00-00 00:00:00', '1');
INSERT INTO `info_product` VALUES ('5', '1', '24个月', '24', '168.00', '0000-00-00 00:00:00', '1');
INSERT INTO `info_product` VALUES ('6', '1', '36个月', '36', '240.00', '0000-00-00 00:00:00', '1');

-- ----------------------------
-- Table structure for info_school
-- ----------------------------
DROP TABLE IF EXISTS `info_school`;
CREATE TABLE `info_school` (
  `SchoolID` int(11) NOT NULL AUTO_INCREMENT COMMENT '学校ID',
  `SchoolName` varchar(128) NOT NULL COMMENT '学校名称',
  `Province` varchar(32) DEFAULT NULL COMMENT '省份',
  `City` varchar(32) DEFAULT NULL COMMENT '城市',
  `Phone` varchar(32) DEFAULT NULL COMMENT '联系电话',
  `Fax` varchar(32) DEFAULT NULL COMMENT '传真',
  `Address` varchar(128) DEFAULT NULL COMMENT '地址',
  `PostCode` varchar(16) DEFAULT NULL COMMENT '邮编',
  `HomePage` varchar(64) DEFAULT NULL COMMENT '主页',
  `Email` varchar(64) DEFAULT NULL COMMENT 'Email',
  `BackDir` varchar(128) DEFAULT NULL,
  `CreatorID` int(11) NOT NULL COMMENT '创建人',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `SmsSignature` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`SchoolID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='学校信息表';

-- ----------------------------
-- Records of info_school
-- ----------------------------
INSERT INTO `info_school` VALUES ('1', '攀枝花市第三高级中学', '四川省', '攀枝花市', null, null, null, null, null, null, null, '0', '2013-07-06 00:06:31', '市三中');

-- ----------------------------
-- Table structure for info_student
-- ----------------------------
DROP TABLE IF EXISTS `info_student`;
CREATE TABLE `info_student` (
  `UID` int(11) NOT NULL COMMENT '用户ID',
  `SchoolID` int(11) NOT NULL COMMENT '学校ID',
  `GradeID` int(11) DEFAULT NULL COMMENT '年级ID',
  `ClassID` int(11) DEFAULT NULL COMMENT '班级ID',
  `Name` varchar(32) NOT NULL COMMENT '姓名',
  `Sex` tinyint(4) NOT NULL COMMENT '0.女 1.男',
  `StudyNo` varchar(32) NOT NULL COMMENT '学号',
  `Type` tinyint(4) DEFAULT NULL COMMENT '0.应届 1.往届',
  `IsLocal` tinyint(4) DEFAULT NULL COMMENT '1.是 0.否',
  `GraSchool` varchar(32) DEFAULT NULL COMMENT '毕业学校',
  `EntryTime` datetime DEFAULT NULL COMMENT '入学时间',
  `CreatorID` int(11) NOT NULL COMMENT '创建人',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `State` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0.注销 1.注册',
  PRIMARY KEY (`UID`),
  UNIQUE KEY `Index_SS` (`SchoolID`,`StudyNo`) USING BTREE,
  KEY `Index_ClassID` (`ClassID`) USING HASH
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生信息表';

-- ----------------------------
-- Records of info_student
-- ----------------------------

-- ----------------------------
-- Table structure for info_subject
-- ----------------------------
DROP TABLE IF EXISTS `info_subject`;
CREATE TABLE `info_subject` (
  `SubjectID` int(11) NOT NULL AUTO_INCREMENT COMMENT '科目ID',
  `SubjectName` varchar(32) NOT NULL COMMENT '科目名称',
  `Type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0.不区分 1.文 2.理',
  `ReferSubjectID` varchar(64) DEFAULT NULL COMMENT '关联科目ID',
  `SchoolID` int(11) NOT NULL COMMENT '0.默认初始 >0.创建学校ID',
  `FullScore` decimal(8,2) DEFAULT NULL COMMENT '总分',
  `PassScore` decimal(8,2) DEFAULT NULL,
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `CreatorID` int(11) NOT NULL COMMENT '创建人',
  `State` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0.无效 1.有效',
  PRIMARY KEY (`SubjectID`),
  UNIQUE KEY `Index_NS` (`SubjectName`,`SchoolID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='科目信息表';

-- ----------------------------
-- Records of info_subject
-- ----------------------------
INSERT INTO `info_subject` VALUES ('1', '语文', '0', '', '0', '150.00', '90.00', '2013-07-06 00:09:06', '0', '1');
INSERT INTO `info_subject` VALUES ('2', '数学', '0', '', '0', '150.00', '90.00', '2013-07-06 00:09:22', '0', '1');
INSERT INTO `info_subject` VALUES ('3', '英语', '0', '', '0', '150.00', '90.00', '2013-07-06 00:09:28', '0', '1');
INSERT INTO `info_subject` VALUES ('4', '物理', '2', '', '0', '100.00', '60.00', '2013-07-06 00:09:37', '0', '1');
INSERT INTO `info_subject` VALUES ('5', '化学', '2', '', '0', '100.00', '60.00', '2013-07-06 00:09:45', '0', '1');
INSERT INTO `info_subject` VALUES ('6', '生物', '2', '', '0', '100.00', '60.00', '2013-07-06 00:09:51', '0', '1');
INSERT INTO `info_subject` VALUES ('7', '政治', '1', '', '0', '100.00', '60.00', '2013-07-06 00:09:56', '0', '1');
INSERT INTO `info_subject` VALUES ('8', '历史', '1', '', '0', '100.00', '60.00', '2013-07-06 00:10:01', '0', '1');
INSERT INTO `info_subject` VALUES ('9', '地理', '1', '', '0', '100.00', '60.00', '2013-07-06 00:10:06', '0', '1');
INSERT INTO `info_subject` VALUES ('10', '理科综合', '2', '4,5,6', '0', '300.00', '180.00', '2013-07-06 00:11:08', '0', '1');
INSERT INTO `info_subject` VALUES ('11', '文科综合', '1', '7,8,9', '0', '300.00', '180.00', '2013-07-06 00:11:20', '0', '1');
INSERT INTO `info_subject` VALUES ('12', '总分(理科)', '2', '1,2,3,4,5,6', '0', '750.00', '450.00', '2013-07-06 00:13:16', '0', '1');
INSERT INTO `info_subject` VALUES ('13', '总分(文科)', '1', '1,2,3,7,8,9', '0', '750.00', '450.00', '2013-07-27 19:26:05', '0', '1');
INSERT INTO `info_subject` VALUES ('14', '总分', '0', '1,2,3,4,5,6,7,8,9', '0', '1050.00', '630.00', '2013-07-27 19:26:05', '0', '1');

-- ----------------------------
-- Table structure for info_suggest
-- ----------------------------
DROP TABLE IF EXISTS `info_suggest`;
CREATE TABLE `info_suggest` (
  `SuggestID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `Type` int(11) NOT NULL,
  `Page` varchar(32) DEFAULT NULL,
  `Description` text,
  `CreateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`SuggestID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_suggest
-- ----------------------------

-- ----------------------------
-- Table structure for info_sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `info_sys_notice`;
CREATE TABLE `info_sys_notice` (
  `NoticeID` int(11) NOT NULL AUTO_INCREMENT COMMENT '告公ID',
  `Title` varchar(128) NOT NULL COMMENT '标题',
  `Content` longtext NOT NULL COMMENT '内容',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`NoticeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_sys_notice
-- ----------------------------

-- ----------------------------
-- Table structure for info_teacher
-- ----------------------------
DROP TABLE IF EXISTS `info_teacher`;
CREATE TABLE `info_teacher` (
  `UID` int(11) NOT NULL COMMENT '用户ID',
  `SchoolID` int(11) NOT NULL COMMENT '学校ID',
  `SubjectID` smallint(6) DEFAULT NULL COMMENT '科目ID',
  `Name` varchar(32) NOT NULL COMMENT '姓名',
  `Sex` tinyint(4) NOT NULL COMMENT '0.女 1.男',
  `Position` varchar(64) DEFAULT NULL COMMENT '职务',
  `EntryTime` datetime DEFAULT NULL COMMENT '入职时间',
  `CreatorID` int(11) NOT NULL COMMENT '创建人',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `State` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0.注销 1.注册',
  PRIMARY KEY (`UID`),
  KEY `Index_Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师信息表';

-- ----------------------------
-- Records of info_teacher
-- ----------------------------
INSERT INTO `info_teacher` VALUES ('1', '1', null, '管理员', '1', null, '2013-09-18 22:51:46', '0', '2013-09-18 22:51:46', '1');

-- ----------------------------
-- Table structure for info_teachrelation
-- ----------------------------
DROP TABLE IF EXISTS `info_teachrelation`;
CREATE TABLE `info_teachrelation` (
  `TeachID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL COMMENT '用户ID（教师）',
  `GradeID` int(11) NOT NULL COMMENT '年级ID',
  `ClassID` int(11) NOT NULL COMMENT '班级ID',
  `SubjectID` int(11) NOT NULL COMMENT '科目ID',
  `CreatorID` int(11) NOT NULL COMMENT '创建人',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `State` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0.无效 1.有效',
  PRIMARY KEY (`TeachID`),
  KEY `Index_UCS` (`UID`,`ClassID`,`SubjectID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='教师授课关系表';

-- ----------------------------
-- Records of info_teachrelation
-- ----------------------------

-- ----------------------------
-- Table structure for info_user
-- ----------------------------
DROP TABLE IF EXISTS `info_user`;
CREATE TABLE `info_user` (
  `UID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `UserName` varchar(32) NOT NULL COMMENT '用户名',
  `Pwd` varchar(32) NOT NULL COMMENT '密码',
  `Email` varchar(32) DEFAULT NULL COMMENT 'Email',
  `Phone` varchar(32) DEFAULT NULL COMMENT '电话',
  `RegTime` datetime NOT NULL COMMENT '注册时间',
  `State` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0.注销 1.注册',
  `Verify` varchar(3) NOT NULL DEFAULT '000' COMMENT '0+邮箱+手机',
  PRIMARY KEY (`UID`),
  UNIQUE KEY `Index_UserName` (`UserName`) USING HASH,
  KEY `Index_Email` (`Email`) USING HASH,
  KEY `Index_Phone` (`Phone`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of info_user
-- ----------------------------
INSERT INTO `info_user` VALUES ('1', 'pzhszadmin', '666666', '', '', '2013-09-18 22:51:46', '1', '000');

-- ----------------------------
-- Table structure for info_user_fee
-- ----------------------------
DROP TABLE IF EXISTS `info_user_fee`;
CREATE TABLE `info_user_fee` (
  `SeqID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `PackageID` int(11) NOT NULL,
  `MonthNum` tinyint(4) DEFAULT NULL,
  `Amount` decimal(8,2) NOT NULL COMMENT '金额',
  `FeeType` smallint(6) NOT NULL COMMENT '1.网银在线 2.',
  `PaySeqID` int(11) DEFAULT NULL,
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `State` smallint(6) NOT NULL DEFAULT '0' COMMENT '0.初始 1.支付成功 2.支付失败',
  `PayTime` datetime DEFAULT NULL,
  PRIMARY KEY (`SeqID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_user_fee
-- ----------------------------

-- ----------------------------
-- Table structure for info_user_package
-- ----------------------------
DROP TABLE IF EXISTS `info_user_package`;
CREATE TABLE `info_user_package` (
  `UID` int(11) NOT NULL,
  `PackageID` int(11) NOT NULL DEFAULT '1',
  `Validity` datetime NOT NULL,
  `State` int(11) NOT NULL DEFAULT '1',
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`UID`,`PackageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_user_package
-- ----------------------------

-- ----------------------------
-- Table structure for info_user_phone
-- ----------------------------
DROP TABLE IF EXISTS `info_user_phone`;
CREATE TABLE `info_user_phone` (
  `SeqID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL DEFAULT '0',
  `Phone` varchar(20) NOT NULL DEFAULT '',
  `Remark` varchar(64) DEFAULT NULL,
  `State` tinyint(4) NOT NULL DEFAULT '1',
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`SeqID`),
  UNIQUE KEY `index_UP` (`UID`,`Phone`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_user_phone
-- ----------------------------

-- ----------------------------
-- Table structure for info_user_wx
-- ----------------------------
DROP TABLE IF EXISTS `info_user_wx`;
CREATE TABLE `info_user_wx` (
  `SeqID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL DEFAULT '0',
  `WxID` varchar(64) NOT NULL DEFAULT '',
  `State` tinyint(4) NOT NULL DEFAULT '1',
  `CreateTime` datetime NOT NULL,
  PRIMARY KEY (`SeqID`),
  UNIQUE KEY `index_UW` (`UID`,`WxID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_user_wx
-- ----------------------------

-- ----------------------------
-- Table structure for info_verifycode
-- ----------------------------
DROP TABLE IF EXISTS `info_verifycode`;
CREATE TABLE `info_verifycode` (
  `SeqID` int(11) NOT NULL AUTO_INCREMENT,
  `UID` int(11) NOT NULL,
  `Phone` varchar(32) NOT NULL,
  `Type` smallint(6) NOT NULL DEFAULT '1' COMMENT '1.手机验证',
  `VerifyCode` varchar(6) NOT NULL,
  `ValidityTime` datetime NOT NULL,
  `State` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0.未验证 1.已验证',
  PRIMARY KEY (`SeqID`),
  KEY `index_UPT` (`UID`,`Phone`,`Type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of info_verifycode
-- ----------------------------

-- ----------------------------
-- Table structure for p_menu
-- ----------------------------
DROP TABLE IF EXISTS `p_menu`;
CREATE TABLE `p_menu` (
  `MenuID` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `PMenuID` int(11) NOT NULL COMMENT '父节点菜单ID',
  `Icon` varchar(64) DEFAULT NULL,
  `Isleaf` tinyint(4) NOT NULL,
  `Name` varchar(64) NOT NULL COMMENT '菜单名称',
  `Url` varchar(64) NOT NULL COMMENT '菜单路径',
  `OrderIndex` tinyint(4) NOT NULL,
  PRIMARY KEY (`MenuID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of p_menu
-- ----------------------------
INSERT INTO `p_menu` VALUES ('1', '0', 'house', '1', '首页', '/school/welcome/index', '0');
INSERT INTO `p_menu` VALUES ('2', '0', 'computer', '0', '系统管理', '', '3');
INSERT INTO `p_menu` VALUES ('3', '0', 'book_open', '0', '成绩统计', '', '4');
INSERT INTO `p_menu` VALUES ('4', '0', 'chart_bar', '0', '成绩分析', '', '5');
INSERT INTO `p_menu` VALUES ('5', '2', null, '1', '班级管理', '/school/manClass/index', '1');
INSERT INTO `p_menu` VALUES ('6', '2', '', '1', '教师管理', '/school/manTeacher/index', '2');
INSERT INTO `p_menu` VALUES ('7', '2', null, '1', '科目管理', '/school/manSubject/index', '5');
INSERT INTO `p_menu` VALUES ('8', '2', null, '1', '学生管理', '/school/manStudent/index', '6');
INSERT INTO `p_menu` VALUES ('9', '2', null, '1', '考试管理', '/school/manExam/index', '7');
INSERT INTO `p_menu` VALUES ('10', '2', null, '1', '成绩管理', '/school/manScore/index', '8');
INSERT INTO `p_menu` VALUES ('11', '3', null, '1', '学生成绩', '/school/statStudent/index', '1');
INSERT INTO `p_menu` VALUES ('12', '3', null, '1', '学生排名', '/school/statSturank/index', '2');
INSERT INTO `p_menu` VALUES ('13', '3', null, '1', '班级成绩', '/school/statClass/index', '3');
INSERT INTO `p_menu` VALUES ('14', '4', null, '1', '我的老师', '/school/anaTeacher/index', '3');
INSERT INTO `p_menu` VALUES ('15', '4', null, '1', '我的班级', '/school/anaClass/index', '2');
INSERT INTO `p_menu` VALUES ('16', '3', null, '1', '我的成绩', '/school/statStudentper/index', '1');
INSERT INTO `p_menu` VALUES ('17', '4', null, '1', '我的分析', '/school/anaStudentper/index', '1');
INSERT INTO `p_menu` VALUES ('18', '3', null, '1', '我的班级', '/school/statClassper/index', '2');
INSERT INTO `p_menu` VALUES ('19', '3', null, '1', '我的年级', '/school/statClass/index', '3');
INSERT INTO `p_menu` VALUES ('20', '0', 'pencil', '1', '问题建议', '/school/suggest/index', '6');
INSERT INTO `p_menu` VALUES ('21', '2', null, '1', '授课管理', '/school/manTeachRelation/index', '3');
INSERT INTO `p_menu` VALUES ('22', '0', 'user', '0', '个人设置', '', '2');
INSERT INTO `p_menu` VALUES ('23', '22', null, '1', '资料设置', '/school/setProfile/index', '1');
INSERT INTO `p_menu` VALUES ('24', '22', null, '1', '高级设置', '/school/setSenior/index', '2');
INSERT INTO `p_menu` VALUES ('25', '0', 'asterisk_yellow', '1', '升级版本', '/school/pay/index', '1');

-- ----------------------------
-- Table structure for p_resource
-- ----------------------------
DROP TABLE IF EXISTS `p_resource`;
CREATE TABLE `p_resource` (
  `ResourceID` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `PResourceID` int(11) NOT NULL COMMENT '父节点菜单ID',
  `Name` varchar(64) NOT NULL COMMENT '菜单名称',
  `Url` varchar(64) NOT NULL COMMENT '菜单路径',
  `OrderIndex` tinyint(4) NOT NULL,
  PRIMARY KEY (`ResourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of p_resource
-- ----------------------------

-- ----------------------------
-- Table structure for p_role
-- ----------------------------
DROP TABLE IF EXISTS `p_role`;
CREATE TABLE `p_role` (
  `RoleID` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `RoleName` varchar(64) NOT NULL COMMENT '角色名称',
  PRIMARY KEY (`RoleID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='角色名称表';

-- ----------------------------
-- Records of p_role
-- ----------------------------
INSERT INTO `p_role` VALUES ('1', '学生(未付费)');
INSERT INTO `p_role` VALUES ('2', '任课教师');
INSERT INTO `p_role` VALUES ('3', '班级管理人');
INSERT INTO `p_role` VALUES ('4', '年级管理人');
INSERT INTO `p_role` VALUES ('5', '教务管理人');
INSERT INTO `p_role` VALUES ('6', '学生');

-- ----------------------------
-- Table structure for p_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `p_role_menu`;
CREATE TABLE `p_role_menu` (
  `RoleID` int(11) NOT NULL COMMENT '角色ID',
  `MenuID` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`RoleID`,`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色菜单表';

-- ----------------------------
-- Records of p_role_menu
-- ----------------------------
INSERT INTO `p_role_menu` VALUES ('1', '0');
INSERT INTO `p_role_menu` VALUES ('1', '1');
INSERT INTO `p_role_menu` VALUES ('1', '3');
INSERT INTO `p_role_menu` VALUES ('1', '16');
INSERT INTO `p_role_menu` VALUES ('1', '18');
INSERT INTO `p_role_menu` VALUES ('1', '20');
INSERT INTO `p_role_menu` VALUES ('1', '22');
INSERT INTO `p_role_menu` VALUES ('1', '23');
INSERT INTO `p_role_menu` VALUES ('2', '1');
INSERT INTO `p_role_menu` VALUES ('2', '2');
INSERT INTO `p_role_menu` VALUES ('2', '10');
INSERT INTO `p_role_menu` VALUES ('2', '20');
INSERT INTO `p_role_menu` VALUES ('3', '1');
INSERT INTO `p_role_menu` VALUES ('3', '2');
INSERT INTO `p_role_menu` VALUES ('3', '10');
INSERT INTO `p_role_menu` VALUES ('3', '20');
INSERT INTO `p_role_menu` VALUES ('4', '0');
INSERT INTO `p_role_menu` VALUES ('4', '1');
INSERT INTO `p_role_menu` VALUES ('4', '2');
INSERT INTO `p_role_menu` VALUES ('4', '6');
INSERT INTO `p_role_menu` VALUES ('4', '8');
INSERT INTO `p_role_menu` VALUES ('4', '9');
INSERT INTO `p_role_menu` VALUES ('4', '10');
INSERT INTO `p_role_menu` VALUES ('4', '20');
INSERT INTO `p_role_menu` VALUES ('5', '0');
INSERT INTO `p_role_menu` VALUES ('5', '1');
INSERT INTO `p_role_menu` VALUES ('5', '2');
INSERT INTO `p_role_menu` VALUES ('5', '5');
INSERT INTO `p_role_menu` VALUES ('5', '6');
INSERT INTO `p_role_menu` VALUES ('5', '7');
INSERT INTO `p_role_menu` VALUES ('5', '8');
INSERT INTO `p_role_menu` VALUES ('5', '9');
INSERT INTO `p_role_menu` VALUES ('5', '10');
INSERT INTO `p_role_menu` VALUES ('5', '20');
INSERT INTO `p_role_menu` VALUES ('5', '21');
INSERT INTO `p_role_menu` VALUES ('6', '0');
INSERT INTO `p_role_menu` VALUES ('6', '1');
INSERT INTO `p_role_menu` VALUES ('6', '3');
INSERT INTO `p_role_menu` VALUES ('6', '4');
INSERT INTO `p_role_menu` VALUES ('6', '15');
INSERT INTO `p_role_menu` VALUES ('6', '16');
INSERT INTO `p_role_menu` VALUES ('6', '17');
INSERT INTO `p_role_menu` VALUES ('6', '18');
INSERT INTO `p_role_menu` VALUES ('6', '19');
INSERT INTO `p_role_menu` VALUES ('6', '20');
INSERT INTO `p_role_menu` VALUES ('6', '22');
INSERT INTO `p_role_menu` VALUES ('6', '23');
INSERT INTO `p_role_menu` VALUES ('6', '24');

-- ----------------------------
-- Table structure for p_role_resource
-- ----------------------------
DROP TABLE IF EXISTS `p_role_resource`;
CREATE TABLE `p_role_resource` (
  `RoleID` int(11) NOT NULL COMMENT '角色ID',
  `ResourceID` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`RoleID`,`ResourceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色资源表';

-- ----------------------------
-- Records of p_role_resource
-- ----------------------------

-- ----------------------------
-- Table structure for p_user_role
-- ----------------------------
DROP TABLE IF EXISTS `p_user_role`;
CREATE TABLE `p_user_role` (
  `UID` int(11) NOT NULL COMMENT '用户ID',
  `RoleID` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of p_user_role
-- ----------------------------
INSERT INTO `p_user_role` VALUES ('1', '5');

-- ----------------------------
-- Table structure for sms_recvmsg
-- ----------------------------
DROP TABLE IF EXISTS `sms_recvmsg`;
CREATE TABLE `sms_recvmsg` (
  `SeqID` int(11) NOT NULL DEFAULT '0',
  `Phone` varchar(20) NOT NULL,
  `DestNum` varchar(20) NOT NULL,
  `MsgContent` varchar(500) NOT NULL,
  `RecvTime` datetime NOT NULL,
  PRIMARY KEY (`SeqID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sms_recvmsg
-- ----------------------------

-- ----------------------------
-- Table structure for sms_sendmsg
-- ----------------------------
DROP TABLE IF EXISTS `sms_sendmsg`;
CREATE TABLE `sms_sendmsg` (
  `SeqID` bigint(20) NOT NULL AUTO_INCREMENT,
  `UID` int(11) DEFAULT NULL,
  `MsgWord` varchar(10) NOT NULL,
  `MsgIndex` int(11) NOT NULL,
  `MsgCount` int(11) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `SrcPhone` varchar(20) NOT NULL,
  `MsgContent` varchar(500) NOT NULL,
  `SendTime` datetime NOT NULL,
  `GateNo` int(11) NOT NULL DEFAULT '1',
  `Priority` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`SeqID`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sms_sendmsg
-- ----------------------------

-- ----------------------------
-- Table structure for sms_sendmsgret
-- ----------------------------
DROP TABLE IF EXISTS `sms_sendmsgret`;
CREATE TABLE `sms_sendmsgret` (
  `SeqID` bigint(20) NOT NULL,
  `UID` int(11) DEFAULT NULL,
  `MsgWord` varchar(10) NOT NULL,
  `MsgIndex` int(11) NOT NULL,
  `MsgCount` int(11) NOT NULL,
  `Phone` varchar(20) NOT NULL,
  `SrcPhone` varchar(20) NOT NULL,
  `MsgContent` varchar(500) NOT NULL,
  `SendTime` datetime NOT NULL,
  `GateNo` int(11) NOT NULL DEFAULT '1',
  `Priority` tinyint(4) NOT NULL DEFAULT '0',
  `SentTime` datetime NOT NULL,
  `Result` tinyint(4) NOT NULL DEFAULT '0',
  `RespTime` datetime DEFAULT NULL,
  `ReportTime` datetime DEFAULT NULL,
  `ResultCode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`SeqID`),
  KEY `Index_Phone` (`Phone`),
  KEY `Index_UID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sms_sendmsgret
-- ----------------------------

-- ----------------------------
-- Table structure for sms_templet
-- ----------------------------
DROP TABLE IF EXISTS `sms_templet`;
CREATE TABLE `sms_templet` (
  `ParamName` varchar(50) NOT NULL,
  `ParamValue` varchar(500) NOT NULL,
  PRIMARY KEY (`ParamName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sms_templet
-- ----------------------------
INSERT INTO `sms_templet` VALUES ('密码重置', '您申请的密码重置已生效，新的密码为:%s。【一瓢计算】');
INSERT INTO `sms_templet` VALUES ('成绩通知', '%n在%d参加%e的成绩为[%s]。');
INSERT INTO `sms_templet` VALUES ('验证码', '您的操作验证码为:%s(3分钟内有效，如非本人操作请忽略)。【一瓢计算】');

-- ----------------------------
-- Table structure for wx_recvmsg
-- ----------------------------
DROP TABLE IF EXISTS `wx_recvmsg`;
CREATE TABLE `wx_recvmsg` (
  `SeqID` int(11) NOT NULL DEFAULT '0',
  `WxID` varchar(20) NOT NULL,
  `DestNum` varchar(20) NOT NULL,
  `MsgContent` varchar(500) NOT NULL,
  `RecvTime` datetime NOT NULL,
  PRIMARY KEY (`SeqID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_recvmsg
-- ----------------------------

-- ----------------------------
-- View structure for v_class_exam
-- ----------------------------
DROP VIEW IF EXISTS `v_class_exam`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_class_exam` AS select `e`.`ExamID` AS `ExamID`,`e`.`ExamName` AS `ExamName`,`e`.`ExamTime` AS `ExamTime`,`e`.`SchoolID` AS `SchoolID`,`e`.`GradeID` AS `GradeID`,`e`.`ClassID` AS `ClassID`,`e`.`Type` AS `Type`,`e`.`Scope` AS `Scope`,`e`.`Rank1` AS `Rank1`,`e`.`Rank2` AS `Rank2`,`e`.`Rank3` AS `Rank3`,`e`.`CreatorID` AS `CreatorID`,`e`.`CreateTime` AS `CreateTime`,`e`.`State` AS `State`,`c`.`ClassID` AS `ClassIDq`

 from (`info_class` `c` join `info_exam` `e`) 

where ((`c`.`GradeID` = `e`.`GradeID`) and (`c`.`Type` = `e`.`Type`  OR `e`.`Type` = 0)) ;

-- ----------------------------
-- View structure for v_exam_subject
-- ----------------------------
DROP VIEW IF EXISTS `v_exam_subject`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_exam_subject` AS select `es`.`ExamID` AS `ExamID`,`es`.`SubjectID` AS `SubjectID`,`es`.`FullScore` AS `FullScore`,`es`.`PassScore` AS `PassScore`,`es`.`YRefer` AS `YRefer`,`es`.`ScoreRange` AS `ScoreRange`,`es`.`State` AS `State`,`s`.`SubjectName` AS `subjectname`,`s`.`ReferSubjectID` AS `ReferSubjectID` from (`info_exam_subject` `es` join `info_subject` `s`) where (`es`.`SubjectID` = `s`.`SubjectID`) ;

-- ----------------------------
-- View structure for v_teacher
-- ----------------------------
DROP VIEW IF EXISTS `v_teacher`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_teacher` AS select `t`.`UID` AS `UID`,`t`.`SchoolID` AS `SchoolID`,`t`.`SubjectID` AS `SubjectID`,`t`.`Name` AS `Name`,`t`.`Sex` AS `Sex`,`t`.`Position` AS `Position`,`t`.`EntryTime` AS `EntryTime`,`t`.`CreatorID` AS `CreatorID`,`t`.`CreateTime` AS `CreateTime`,`t`.`State` AS `State`,`tr`.`GradeID` AS `gradeid`,`tr`.`ClassID` AS `classid`,`cm`.`ClassID` AS `classidm`,`gm`.`GradeID` AS `gradeidm`,`ur`.`RoleID` AS `RoleID`,`u`.`UserName` AS `username` from (((((`info_teacher` `t` left join `info_teachrelation` `tr` on(((`t`.`UID` = `tr`.`UID`) and (`tr`.`State` = 1)))) left join `info_class_manage` `cm` on(((`t`.`UID` = `cm`.`UID`) and (`cm`.`State` = 1)))) left join `info_grade_manage` `gm` on(((`t`.`UID` = `gm`.`UID`) and (`gm`.`State` = 1)))) left join `p_user_role` `ur` on((`t`.`UID` = `ur`.`UID`))) left join `info_user` `u` on((`t`.`UID` = `u`.`UID`))) ;

-- ----------------------------
-- Procedure structure for sp_exam_class_stat_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_exam_class_stat_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exam_class_stat_update`(IN ExamID int(11))
    READS SQL DATA
    COMMENT '更新考试班级统计'
BEGIN
	DECLARE SeqID INT;  
	DECLARE SubjectID INT;  
	DECLARE GradeID INT;
	DECLARE ClassID INT;

	DECLARE AvgScore FLOAT;
	DECLARE MaxScore FLOAT;
	DECLARE MinScore FLOAT;
	DECLARE Count INT;
	DECLARE PassCount INT;
	DECLARE StDeviation FLOAT;
	DECLARE UID INT;
	DECLARE done INT DEFAULT 0;

	DECLARE ScoreRange VARCHAR(256) DEFAULT '';
	DECLARE ScoreRangeSet VARCHAR(256) DEFAULT '';
	DECLARE done2 INT DEFAULT 0;
	DECLARE ScoreTemp VARCHAR(20) DEFAULT '';
	DECLARE ScoreCount INT DEFAULT 0;
	DECLARE pos INT DEFAULT 0;
	DECLARE isfirst INT DEFAULT 1;

	DECLARE cur1 CURSOR FOR SELECT DISTINCT es.SubjectID, es.GradeID, es.ClassID FROM info_exam_score es WHERE es.ExamID = ExamID and es.Score > 0;  
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  

	OPEN cur1;  
	FETCH cur1 INTO SubjectID,GradeID,ClassID;
	WHILE done <> 1 DO

		SET AvgScore = (SELECT AVG(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Score > 0);
		SET MaxScore = (SELECT Max(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Score > 0);
		SET MinScore = (SELECT Min(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Score > 0);
		SET Count = (SELECT Count(es.SeqID) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Score > 0);
		SET PassCount = (SELECT Count(es.SeqID) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID 
												AND es.Score > (SELECT s.PassScore FROM info_exam_subject s WHERE s.ExamID = ExamID AND s.SubjectID = SubjectID));

		SET ScoreRangeSet = '';
		SET ScoreRangeSet = (SELECT s.ScoreRange FROM info_exam_subject s WHERE s.ExamID = ExamID AND s.SubjectID = SubjectID);
		SET done2 = 0;
		SET ScoreRange = '';
		SET isfirst = 1;
		SET pos = 0;
	
		CALL sp_util_split(ScoreRangeSet,',');
		BEGIN
			DECLARE cur2 CURSOR FOR SELECT VALUE FROM splittable ORDER BY id;  
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET done2=1;  

			OPEN cur2;  
			FETCH cur2 INTO ScoreTemp;
			WHILE done2 <> 1 DO
				SET pos = INSTR(ScoreTemp,'-');
			#	SELECT SUBSTRING(ScoreTemp,pos+1,LENGTH(ScoreTemp)-pos),SUBSTRING(ScoreTemp,1,pos-1);
				SET ScoreCount = (SELECT Count(es.SeqID) FROM info_exam_score es where es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID 
																				AND es.Score >= SUBSTRING(ScoreTemp,1,pos-1) AND es.Score <= SUBSTRING(ScoreTemp,pos+1,CHAR_LENGTH(ScoreTemp)-pos));
				IF (isfirst) THEN
					SET ScoreRange = CONCAT(ScoreRange,ScoreCount);
				ELSE
					SET ScoreRange = CONCAT(ScoreRange,',',ScoreCount);
				END IF;

				SET isfirst = 0;
				FETCH cur2 INTO ScoreTemp;
			END WHILE;
		END;
		
		IF EXISTS(SELECT * FROM info_subject s WHERE s.SubjectID = SubjectID AND s.State = 1 AND s.ReferSubjectID <> '') THEN
			SET UID = (SELECT m.UID FROM info_class_manage m WHERE m.ClassID = ClassID AND m.State = 1 LIMIT 1);
		ELSE 
			SET UID = (SELECT m.UID FROM info_teachrelation m WHERE m.ClassID = ClassID AND m.SubjectID = SubjectID AND m.State = 1 LIMIT 1);
		END IF;
		IF(UID IS NULL) THEN
			SET UID = 0;
		END IF;
		SET StDeviation = (SELECT SQRT(SUM(POWER((es.Score-AvgScore),2))/COUNT(es.SeqID))
												FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Score > 0);

		IF EXISTS(SELECT c.ExamID FROM info_exam_class_stat c WHERE c.ExamID = ExamID AND c.GradeID = GradeID AND c.ClassID = ClassID AND c.SubjectID = SubjectID) THEN
			UPDATE info_exam_class_stat c SET c.StDeviation = StDeviation,c.ScoreRange = ScoreRange,c.Avg = AvgScore,c.Max = MaxScore,c.Min = MinScore,c.Count = Count,c.PassCount = PassCount,c.UID = UID WHERE  c.ExamID = ExamID AND c.GradeID = GradeID AND c.ClassID = ClassID AND c.SubjectID = SubjectID;
		ELSE 
			INSERT INTO info_exam_class_stat(StDeviation,ExamID,GradeID,ClassID,SubjectID,Avg,Max,Min,Count,PassCount,UID,ScoreRange) VALUES(StDeviation,ExamID,GradeID,ClassID,SubjectID,AvgScore,MaxScore,MinScore,Count,PassCount,UID,ScoreRange);
		END IF;

		FETCH cur1 INTO SubjectID,GradeID,ClassID;
		
	END WHILE;


	update info_exam_class_stat e
	set e.AvgRank =
	( select  t3.AvgRank  from
		(select  count(t2.Avg) as AvgRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_stat t2,info_exam_class_stat t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.Avg<t2.Avg or (t1.Avg=t2.Avg and t1.ClassID=t2.ClassID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	update info_exam_class_stat e
	set MaxRank =
	( select  t3.MaxRank  from
		( select  count(t2.Max) as MaxRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_stat t2,info_exam_class_stat t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.Max<t2.Max or (t1.Max=t2.Max and t1.ClassID=t2.ClassID ))
    	 	group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	update info_exam_class_stat e
	set MinRank =
	( select  t3.MinRank  from
		( select  count(t2.Min) as MinRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_stat t2,info_exam_class_stat t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.Min<t2.Min or (t1.Min=t2.Min and t1.ClassID=t2.ClassID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	update info_exam_class_stat e
	set PassRank =
	( select  t3.PassRank  from
		( select count(t2.PassCount/t2.Count) as PassRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_stat t2,info_exam_class_stat t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and (( t1.PassCount/t1.Count)<(t2.PassCount/t2.Count) or ((t1.PassCount/t1.Count)=(t2.PassCount/t2.Count) and t1.ClassID=t2.ClassID ))
  	  	 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	update info_exam_class_stat e
	set StDeviationRank =
	( select  t3.StDeviationRank  from
		( select  count(t2.StDeviation) as StDeviationRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_stat t2,info_exam_class_stat t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.StDeviation>t2.StDeviation or (t1.StDeviation=t2.StDeviation and t1.ClassID=t2.ClassID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_exam_grade_stat_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_exam_grade_stat_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exam_grade_stat_update`(IN ExamID int(11))
    READS SQL DATA
    COMMENT '更新考试班级统计'
BEGIN
	DECLARE SubjectID INT;  
	DECLARE GradeID INT;

	DECLARE AvgScore FLOAT;
	DECLARE MaxScore FLOAT;
	DECLARE MinScore FLOAT;
	DECLARE Count INT;
	DECLARE PassCount INT;
	DECLARE StDeviation FLOAT;
	DECLARE done INT DEFAULT 0;  

	DECLARE ScoreRange VARCHAR(256) DEFAULT '';
	DECLARE ScoreRangeSet VARCHAR(256) DEFAULT '';
	DECLARE done2 INT DEFAULT 0;
	DECLARE ScoreTemp VARCHAR(20) DEFAULT '';
	DECLARE ScoreCount INT DEFAULT 0;
	DECLARE pos INT DEFAULT 0;
	DECLARE isfirst INT DEFAULT 1;

	DECLARE cur1 CURSOR FOR SELECT DISTINCT es.SubjectID, es.GradeID FROM info_exam_score es WHERE es.ExamID = ExamID and es.Score > 0;  
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  

	OPEN cur1;  
	emp_loop: LOOP  
		FETCH cur1 INTO SubjectID,GradeID;
		IF done=1 THEN 
			LEAVE emp_loop;  
		END IF;
		SET AvgScore = (SELECT AVG(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.Score > 0);
		SET MaxScore = (SELECT Max(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.Score > 0);
		SET MinScore = (SELECT Min(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.Score > 0);
		SET Count = (SELECT Count(es.SeqID) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.Score > 0);
		SET PassCount = (SELECT Count(es.SeqID) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID 
												AND es.Score > (SELECT s.PassScore FROM info_exam_subject s WHERE s.ExamID = ExamID AND s.SubjectID = SubjectID));
		
		SET ScoreRangeSet = '';
		SET ScoreRangeSet = (SELECT s.ScoreRange FROM info_exam_subject s WHERE s.ExamID = ExamID AND s.SubjectID = SubjectID);
		SET done2 = 0;
		SET ScoreRange = '';
		SET isfirst = 1;
		SET pos = 0;
		CALL sp_util_split(ScoreRangeSet,',');
		BEGIN
			DECLARE cur2 CURSOR FOR SELECT VALUE FROM splittable ORDER BY id;  
			DECLARE CONTINUE HANDLER FOR NOT FOUND SET done2=1;  

			OPEN cur2;  
			FETCH cur2 INTO ScoreTemp;
			WHILE done2 <> 1 DO
				SET pos = INSTR(ScoreTemp,'-');
			#	SELECT SUBSTRING(ScoreTemp,pos+1,LENGTH(ScoreTemp)-pos),SUBSTRING(ScoreTemp,1,pos-1);
				SET ScoreCount = (SELECT Count(es.SeqID) FROM info_exam_score es where es.ExamID = ExamID AND es.SubjectID = SubjectID
																				AND es.Score >= SUBSTRING(ScoreTemp,1,pos-1) AND es.Score <= SUBSTRING(ScoreTemp,pos+1,CHAR_LENGTH(ScoreTemp)-pos));
				IF (isfirst) THEN
					SET ScoreRange = CONCAT(ScoreRange,ScoreCount);
				ELSE
					SET ScoreRange = CONCAT(ScoreRange,',',ScoreCount);
				END IF;

				SET isfirst = 0;
				FETCH cur2 INTO ScoreTemp;
			END WHILE;
		END;
		
		SET StDeviation = (SELECT SQRT(SUM(POWER((es.Score-AvgScore),2))/COUNT(es.SeqID))
												FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.Score > 0);

		IF EXISTS(SELECT c.ExamID FROM info_exam_grade_stat c WHERE c.ExamID = ExamID AND c.GradeID = GradeID AND c.SubjectID = SubjectID) THEN
			UPDATE info_exam_grade_stat c SET c.StDeviation = StDeviation,c.ScoreRange = ScoreRange,c.Avg = AvgScore,c.Max = MaxScore,c.Min = MinScore,c.Count = Count,c.PassCount = PassCount WHERE  c.ExamID = ExamID AND c.GradeID = GradeID AND c.SubjectID = SubjectID;
		ELSE 
			INSERT INTO info_exam_grade_stat(StDeviation,ExamID,GradeID,SubjectID,Avg,Max,Min,Count,PassCount,ScoreRange) VALUES(StDeviation,ExamID,GradeID,SubjectID,AvgScore,MaxScore,MinScore,Count,PassCount,ScoreRange);
		END IF;
	END LOOP emp_loop;  
	CLOSE cur1;  	


END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_exam_msgsend
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_exam_msgsend`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exam_msgsend`(IN ExamID int(11))
    READS SQL DATA
    COMMENT '更新考试关联分数'
BEGIN
  DECLARE UIDTemp INT DEFAULT 0;  
	DECLARE Msg VARCHAR(512) DEFAULT '';
	DECLARE MsgTemplet VARCHAR(512) DEFAULT '';
	DECLARE MsgTempletSend VARCHAR(512) DEFAULT '';
	DECLARE SendTime DATETIME;

  DECLARE UID INT;  
	DECLARE StuName VARCHAR(64);
	DECLARE SubjectName VARCHAR(64);
	DECLARE Score FLOAT;
	DECLARE ClassRank INT;
	DECLARE GradeRank INT;
	DECLARE ExamTime VARCHAR(64) ;
	DECLARE ExamName VARCHAR(64) ;

	DECLARE SchoolID INT;
	DECLARE GradeID INT;
	DECLARE ClassID INT;
	DECLARE SmsSign VARCHAR(50);


	DECLARE Phone VARCHAR(20);

	DECLARE done INT DEFAULT 0;  
	DECLARE done2 INT DEFAULT 0;

	DECLARE cur1 CURSOR FOR SELECT s.UID,st.`Name`,j.SubjectName,s.Score,s.ClassRank,s.GradeRank FROM info_user_package p,info_exam_score s,info_subject j,info_student st
													 WHERE s.ExamID = ExamID AND s.UID = p.UID AND j.SubjectID = s.SubjectID AND s.UID = st.UID AND p.PackageID = 1 AND p.State = 1 
													AND NOT EXISTS(SELECT * FROM info_exam_usersend u WHERE u.ExamID = ExamID AND u.UID = s.UID)
													order by s.UID,s.SubjectID; 
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  
	#查询短信签名
	SELECT e.SchoolID,e.GradeID,e.ClassID INTO SchoolID,GradeID,ClassID  FROM info_exam e where e.ExamID = ExamID;
	CALL sp_sms_getsign(SchoolID,GradeID,ClassID,SmsSign);

	#查询考试时间
	SELECT date_format(e.ExamTime,'%Y-%m-%d'),e.ExamName INTO ExamTime,ExamName FROM info_exam e WHERE e.ExamID = ExamID ;
	SET MsgTemplet = (SELECT ParamValue FROM sms_templet where ParamName = '成绩通知');
	SET MsgTemplet = REPLACE(REPLACE(MsgTemplet,'%d',ExamTime),'%e',ExamName);
	
	#获取发送时间，晚上7点至第二天早上10点 延迟到第二天早上10点钟发送
	IF(HOUR(NOW()) > '18' ) THEN
		SET SendTime = date_add(date_format(NOW(),'%Y-%m-%d'),interval 34 hour);
	ELSEIF(HOUR(NOW()) < '10') THEN
		SET SendTime = date_add(date_format(NOW(),'%Y-%m-%d'),interval 10 hour);
	ELSE
		SET SendTime = NOW();
	END IF;

	OPEN cur1;  
	emp_loop: LOOP  
		FETCH cur1 INTO UID,StuName,SubjectName,Score,ClassRank,GradeRank;
		IF done=1 THEN 
			LEAVE emp_loop;  
		END IF;

		IF(UIDTemp <> UID) THEN  #新用户
			IF(UIDTemp > 0) THEN#发送短信
				SET MsgTempletSend = CONCAT(REPLACE(MsgTempletSend,'%s',Msg),SmsSign);
				BEGIN
					DECLARE cur2 CURSOR FOR SELECT p.Phone FROM info_user_phone p WHERE p.UID = UIDTemp AND p.State = 1;  
					DECLARE CONTINUE HANDLER FOR NOT FOUND SET done2=1;  
					
					INSERT INTO info_exam_usersend(UID,ExamID,SendTime) VALUES(UIDTemp,ExamID,NOW());
					OPEN cur2;  
					FETCH cur2 INTO Phone;
					WHILE done2 <> 1 DO
						CALL sp_sms_sendmsginsert(UIDTemp, Phone ,'',MsgTempletSend,SendTime ,1,0);
		#				SELECT UIDTemp,Phone,MsgTempletSend,SendTime;
						FETCH cur2 INTO Phone;
					END WHILE;

				END;
			END IF;
			SET MsgTempletSend = REPLACE(MsgTemplet,'%n',StuName);
			SET Msg = CONCAT(SubjectName,':',Score);
		ELSE
			SET Msg = CONCAT(Msg,',',SubjectName,':',Score);
		END IF;
		SET UIDTemp = UID;

	END LOOP emp_loop;  
	CLOSE cur1;  

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_exam_rank_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_exam_rank_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exam_rank_update`(IN ExamID int(11))
    READS SQL DATA
    COMMENT '更新考试排名'
BEGIN
	update info_exam_score e
	set e.ClassRank =
	( select  t3.ClassRank  from
		(select  count(t2.Score) as ClassRank,t1.ExamID,t1.SubjectID,t1.UID from info_exam_score t2,info_exam_score t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID AND t1.ClassID = t2.ClassID
			and ( t1.Score<t2.Score or (t1.Score=t2.Score and t1.UID=t2.UID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.UID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.UID = e.UID
	)
	where e.ExamID = ExamID AND e.Score > 0;


	update info_exam_score e
	set e.GradeRank =
	( select  t3.GradeRank  from
		(select  count(t2.Score) as GradeRank,t1.ExamID,t1.SubjectID,t1.UID from info_exam_score t2,info_exam_score t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID AND t1.GradeID = t2.GradeID
			and ( t1.Score<t2.Score or (t1.Score=t2.Score and t1.UID=t2.UID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.UID 
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.UID = e.UID 
	)
	where e.ExamID = ExamID AND e.Score > 0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_exam_score_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_exam_score_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exam_score_update`(IN ExamID int(11))
    READS SQL DATA
    COMMENT '更新考试关联分数'
BEGIN
	DECLARE SeqID INT;  
	DECLARE SubjectID INT;  
	DECLARE ReferSubjectID VARCHAR(256);

	DECLARE done INT DEFAULT 0;  

	DECLARE cur1 CURSOR FOR SELECT es.SubjectID,es.ReferSubjectID FROM v_exam_subject es WHERE es.ExamID = ExamID AND es.State = 1 AND es.ReferSubjectID <>'';  
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  

	OPEN cur1;  
	emp_loop: LOOP  
		FETCH cur1 INTO SubjectID,ReferSubjectID;
		IF done=1 THEN 
			LEAVE emp_loop;  
		END IF;

		SET ReferSubjectID = CONCAT('^[',ReferSubjectID,']{1}$');

		#先更新有的
		UPDATE info_exam_score e,
		(SELECT es.ExamID,es.UID,es.GradeID,es.ClassID,SubjectID AS SubjectID,SUM(es.Score) AS Score FROM info_exam_score es WHERE es.ExamID =ExamID  AND es.SubjectID REGEXP ReferSubjectID
		GROUP BY es.ExamID,es.UID,es.GradeID,es.ClassID
		HAVING COUNT(es.Score) = 1+(CHAR_LENGTH(ReferSubjectID) - CHAR_LENGTH(REPLACE(ReferSubjectID,',','')))
		) AS t
		SET e.Score = t.Score
		WHERE e.ExamID = t.ExamID AND e.UID = t.UID AND e.SubjectID = t.SubjectID;
		
		INSERT INTO info_exam_score(ExamID,UID,GradeID,ClassID,SubjectID,Score)
		SELECT es.ExamID,es.UID,es.GradeID,es.ClassID,SubjectID,SUM(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID REGEXP ReferSubjectID 
		AND NOT EXISTS (SELECT s.SeqID FROM info_exam_score s WHERE s.ExamID = ExamID AND s.UID = es.UID AND s.SubjectID = SubjectID)
		GROUP BY es.ExamID,es.UID,es.GradeID,es.ClassID
		HAVING COUNT(es.Score) = 1+(CHAR_LENGTH(ReferSubjectID) - CHAR_LENGTH(REPLACE(ReferSubjectID,',','')));

	END LOOP emp_loop;  
	CLOSE cur1;  
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_exam_yscore_class_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_exam_yscore_class_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exam_yscore_class_update`(IN ExamID int(11))
    READS SQL DATA
    COMMENT '更新考试排名'
BEGIN
	DECLARE SubjectID INT;  
	DECLARE GradeID INT;
	DECLARE ClassID INT;

	DECLARE AvgYScore FLOAT;
	DECLARE MaxYScore FLOAT;
	DECLARE MinYScore FLOAT;

	DECLARE AvgCYScore FLOAT;
	DECLARE MaxCYScore FLOAT;
	DECLARE MinCYScore FLOAT;

	DECLARE AvgSta FLOAT;
	DECLARE MaxSta FLOAT;
	DECLARE MinSta FLOAT;

	DECLARE AvgImp FLOAT;
	DECLARE MaxImp FLOAT;
	DECLARE MinImp FLOAT;

	DECLARE ScatterYScore FLOAT;
	DECLARE ScatterCYScore FLOAT;
	DECLARE DiffYScore FLOAT;
	DECLARE LastYScore FLOAT DEFAULT 0;
	DECLARE ClassType INT;
	DECLARE LastExamID INT DEFAULT 0;

	DECLARE UID INT;

	DECLARE done INT DEFAULT 0;

	DECLARE cur1 CURSOR FOR SELECT DISTINCT es.SubjectID, es.GradeID, es.ClassID FROM info_exam_yscore es WHERE es.ExamID = ExamID;  
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  

	OPEN cur1;  
	emp_loop: LOOP  
		FETCH cur1 INTO SubjectID,GradeID,ClassID;
		IF done=1 THEN 
			LEAVE emp_loop;  
		END IF;

		SET AvgYScore = (SELECT AVG(es.YScore) FROM info_exam_yscore es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.YScore IS NOT NULL);
		SET MaxYScore = (SELECT Max(es.YScore) FROM info_exam_yscore es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.YScore IS NOT NULL);
		SET MinYScore = (SELECT Min(es.YScore) FROM info_exam_yscore es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.YScore IS NOT NULL);

		SET AvgCYScore = (SELECT AVG(es.CYScore) FROM info_exam_yscore es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.CYScore IS NOT NULL);
		SET MaxCYScore = (SELECT Max(es.CYScore) FROM info_exam_yscore es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.CYScore IS NOT NULL);
		SET MinCYScore = (SELECT Min(es.CYScore) FROM info_exam_yscore es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.CYScore IS NOT NULL);
				
		SET AvgSta = (SELECT AVG(es.Stability) FROM info_exam_yscore es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Stability IS NOT NULL);
		SET MaxSta = (SELECT Max(es.Stability) FROM info_exam_yscore es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Stability IS NOT NULL);
		SET MinSta = (SELECT Min(es.Stability) FROM info_exam_yscore es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Stability IS NOT NULL);

		SET AvgImp = (SELECT AVG(es.Improve) FROM info_exam_yscore es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Improve IS NOT NULL);
		SET MaxImp = (SELECT Max(es.Improve) FROM info_exam_yscore es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Improve IS NOT NULL);
		SET MinImp = (SELECT Min(es.Improve) FROM info_exam_yscore es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.Improve IS NOT NULL);

		SET ClassType = (SELECT c.Type FROM info_class c WHERE c.ClassID = ClassID);
		SET LastExamID = (SELECT es.ExamID FROM info_exam_yscore es,info_exam c WHERE es.ExamID < ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND c.ExamID = es.ExamID AND c.Type = ClassType ORDER BY es.ExamID DESC LIMIT 1);
		IF(LastExamID <> 0) THEN
			SET LastYScore = (SELECT es.AvgYScore FROM info_exam_class_yscore es WHERE es.ExamID = LastExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.AvgYScore IS NOT NULL);
		ELSE
			SET LastYScore = AvgYScore;
		END IF;
		
		SET DiffYScore = AvgYScore - LastYScore;
	
		IF EXISTS(SELECT * FROM info_subject s WHERE s.SubjectID = SubjectID AND s.State = 1 AND s.ReferSubjectID <> '') THEN
			SET UID = (SELECT m.UID FROM info_class_manage m WHERE m.ClassID = ClassID AND m.State = 1 LIMIT 1);
		ELSE 
			SET UID = (SELECT m.UID FROM info_teachrelation m WHERE m.ClassID = ClassID AND m.SubjectID = SubjectID AND m.State = 1 LIMIT 1);
		END IF;
		IF(UID IS NULL) THEN
			SET UID = 0;
		END IF;
		SET ScatterYScore = (SELECT SQRT(SUM(POWER((es.YScore-AvgYScore),2))/COUNT(*))
											FROM info_exam_yscore es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.YScore IS NOT NULL);

		SET ScatterCYScore = (SELECT SQRT(SUM(POWER((es.CYScore-AvgCYScore),2))/COUNT(*))
											FROM info_exam_yscore es WHERE es.ExamID = ExamID AND es.SubjectID = SubjectID AND es.ClassID = ClassID AND es.CYScore IS NOT NULL);


		IF EXISTS(SELECT c.ExamID FROM info_exam_class_yscore c WHERE c.ExamID = ExamID AND c.GradeID = GradeID AND c.ClassID = ClassID AND c.SubjectID = SubjectID) THEN
			UPDATE info_exam_class_yscore y 
			SET y.AvgYScore = AvgYScore,y.MaxYScore =  MaxYScore,y.MinYScore = MinYScore ,
					y.AvgCYScore = AvgCYScore,y.MaxCYScore =  MaxCYScore,y.MinCYScore = MinCYScore ,
					y.AvgSta = AvgSta,y.MaxSta =  MaxSta,y.MinSta = MinSta ,
					y.AvgImp = AvgImp,y.MaxImp =  MaxImp,y.MinImp = MinImp ,
					y.DiffYScore = DiffYScore,y.ScatterYScore = ScatterYScore,y.ScatterCYScore = ScatterCYScore
			WHERE y.ExamID = ExamID AND y.SubjectID = SubjectID AND y.ClassID = ClassID;
		ELSE 
			INSERT INTO info_exam_class_yscore(ExamID,GradeID,ClassID,SubjectID,UID,AvgYScore,MaxYScore,MinYScore,AvgCYScore,MaxCYScore,MinCYScore,AvgSta,MaxSta,MinSta,AvgImp,MaxImp,MinImp,DiffYScore,ScatterYScore,ScatterCYScore) 
			VALUES(ExamID,GradeID,ClassID,SubjectID,UID,AvgYScore,MaxYScore,MinYScore,AvgCYScore,MaxCYScore,MinCYScore,AvgSta,MaxSta,MinSta,AvgImp,MaxImp,MinImp,DiffYScore,ScatterYScore,ScatterCYScore);
		END IF;

	END LOOP emp_loop;  
	CLOSE cur1;  

	update info_exam_class_yscore e
	set e.AvgCYScoreRank =
	( select  t3.AvgCYScoreRank  from
		(select  count(t2.AvgCYScore) as AvgCYScoreRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_yscore t2,info_exam_class_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.AvgCYScore<t2.AvgCYScore or (t1.AvgCYScore=t2.AvgCYScore and t1.ClassID=t2.ClassID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	update info_exam_class_yscore e
	set e.MaxCYScoreRank =
	( select  t3.MaxCYScoreRank  from
		(select  count(t2.MaxCYScore) as MaxCYScoreRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_yscore t2,info_exam_class_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.MaxCYScore<t2.MaxCYScore or (t1.MaxCYScore=t2.MaxCYScore and t1.ClassID=t2.ClassID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	update info_exam_class_yscore e
	set e.MinCYScoreRank =
	( select  t3.MinCYScoreRank  from
		(select  count(t2.MinCYScore) as MinCYScoreRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_yscore t2,info_exam_class_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.MinCYScore<t2.MinCYScore or (t1.MinCYScore=t2.MinCYScore and t1.ClassID=t2.ClassID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	#稳定性排名更新
	update info_exam_class_yscore e
	set e.AvgStaRank =
	( select  t3.AvgStaRank  from
		(select  count(t2.AvgSta) as AvgStaRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_yscore t2,info_exam_class_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.AvgSta<t2.AvgSta or (t1.AvgSta=t2.AvgSta and t1.ClassID=t2.ClassID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	update info_exam_class_yscore e
	set e.MaxStaRank =
	( select  t3.MaxStaRank  from
		(select  count(t2.MaxSta) as MaxStaRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_yscore t2,info_exam_class_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.MaxSta<t2.MaxSta or (t1.MaxSta=t2.MaxSta and t1.ClassID=t2.ClassID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	update info_exam_class_yscore e
	set e.MinStaRank =
	( select  t3.MinStaRank  from
		(select  count(t2.MinSta) as MinStaRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_yscore t2,info_exam_class_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.MinSta<t2.MinSta or (t1.MinSta=t2.MinSta and t1.ClassID=t2.ClassID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	#进步值排名更新
	update info_exam_class_yscore e
	set e.AvgImpRank =
	( select  t3.AvgImpRank  from
		(select  count(t2.AvgImp) as AvgImpRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_yscore t2,info_exam_class_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.AvgImp<t2.AvgImp or (t1.AvgImp=t2.AvgImp and t1.ClassID=t2.ClassID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	update info_exam_class_yscore e
	set e.MaxImpRank =
	( select  t3.MaxImpRank  from
		(select  count(t2.MaxImp) as MaxImpRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_yscore t2,info_exam_class_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.MaxImp<t2.MaxImp or (t1.MaxImp=t2.MaxImp and t1.ClassID=t2.ClassID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;

	update info_exam_class_yscore e
	set e.MinImpRank =
	( select  t3.MinImpRank  from
		(select  count(t2.MinImp) as MinImpRank,t1.ExamID,t1.SubjectID,t1.ClassID from info_exam_class_yscore t2,info_exam_class_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID
			and ( t1.MinImp<t2.MinImp or (t1.MinImp=t2.MinImp and t1.ClassID=t2.ClassID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.ClassID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.ClassID = e.ClassID
	)
	where e.ExamID = ExamID;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_exam_yscore_stat_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_exam_yscore_stat_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exam_yscore_stat_update`(IN ExamID int(11))
    READS SQL DATA
    COMMENT '更新考试排名'
BEGIN
	DECLARE UID INT;  
	DECLARE SubjectID INT;  
	DECLARE GradeID INT;
	DECLARE ClassID INT;
	DECLARE YScore FLOAT;
	DECLARE CYScore FLOAT DEFAULT 0;
	DECLARE YScoreAvg FLOAT DEFAULT 0;
	DECLARE Stability FLOAT DEFAULT 0;
	DECLARE Improve decimal(8,2) DEFAULT 0;
	DECLARE done INT DEFAULT 0;

	DECLARE ExamIDLast INT DEFAULT 0; 
	DECLARE YScoreLast FLOAT DEFAULT 0;
	DECLARE CYScoreLast FLOAT DEFAULT 0;
	DECLARE ImproveLast decimal(8,2) DEFAULT 0;
	DECLARE CurIndex INT DEFAULT 0;

	DECLARE cur1 CURSOR FOR SELECT es.UID, es.SubjectID, es.GradeID, es.ClassID, es.YScore FROM info_exam_yscore es WHERE es.ExamID = ExamID;  
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  

	OPEN cur1;  
	emp_loop: LOOP  
		FETCH cur1 INTO UID,SubjectID,GradeID,ClassID,YScore;
		IF done=1 THEN 
			LEAVE emp_loop;  
		END IF;
		
		SET Improve = 0;
		SET Stability =0;

		SET CurIndex = 0;
		SET CYScore = YScore;
		SET YScoreAvg = 0;

		SET ExamIDLast = 0; 
		SET YScoreLast = 0;
		SET CYScoreLast =0;
		SET ImproveLast = 0;

		#计算稳定性
		SET CurIndex = (SELECT COUNT(DISTINCT r.ExamID) FROM info_exam_yscore r WHERE r.UID = UID  AND r.SubjectID = SubjectID AND r.ExamID <= ExamID);
		IF (CurIndex > 4) THEN
			SET CurIndex = 4;
		END IF;
		IF (CurIndex > 1) THEN
		BEGIN
			SET YScoreAvg = (SELECT AVG(r.YScore) FROM info_exam_yscore r WHERE r.UID = UID  AND r.SubjectID = SubjectID AND r.ExamID <= ExamID ORDER BY r.ExamID DESC Limit 4);
			SET Stability = (SELECT SQRT(SUM(POWER((r.YScore-YScoreAvg),2))/CurIndex)
												FROM info_exam_yscore r WHERE r.UID = UID  AND r.SubjectID = SubjectID  AND r.ExamID <= ExamID ORDER BY r.ExamID DESC Limit 4);
			#查询上次考试的数据
			SET ExamIDLast = (SELECT MAX(r.ExamID) FROM info_exam_yscore r WHERE r.UID = UID  AND r.SubjectID = SubjectID AND r.ExamID < ExamID);
			SELECT r.YScore,r.CYScore,r.Improve INTO YScoreLast,CYScoreLast,ImproveLast
			FROM info_exam_yscore r WHERE r.ExamID = ExamIDLast AND r.UID = UID  AND r.SubjectID = SubjectID; 
			#计算进步值
			IF (CurIndex = 2 ) THEN
				BEGIN
					SET  Improve = YScore - YScoreLast;
				END;
			END IF;
			IF (CurIndex > 2) THEN
				BEGIN
					SET  Improve = 0.618*ImproveLast + 0.382*(YScore - CYScoreLast);
				END;
			END IF;

			SET  CYScore = 0.618*CYScoreLast + 0.382*YScore;

		END;
		END IF;

		UPDATE info_exam_yscore y SET y.Improve = Improve,y.CYScore = CYScore,y.Stability = Stability WHERE y.ExamID = ExamID AND y.SubjectID = SubjectID AND y.UID = UID;

	END LOOP emp_loop;  
	CLOSE cur1;  
	#更新排名
	update info_exam_yscore e
	set e.CYClaRank =
	( select  t3.CYClaRank  from
		(select  count(t2.CYScore) as CYClaRank,t1.ExamID,t1.SubjectID,t1.UID from info_exam_yscore t2,info_exam_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID AND t1.ClassID = t2.ClassID
			and ( t1.CYScore<t2.CYScore or (t1.CYScore=t2.CYScore and t1.UID=t2.UID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.UID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.UID = e.UID
	)
	where e.ExamID = ExamID AND e.CYScore IS NOT NULL;

	update info_exam_yscore e
	set e.CYGraRank =
	( select  t3.CYGraRank  from
		(select  count(t2.CYScore) as CYGraRank ,t1.ExamID,t1.SubjectID,t1.UID from info_exam_yscore t2,info_exam_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID AND t1.GradeID = t2.GradeID
			and ( t1.CYScore<t2.CYScore or (t1.CYScore=t2.CYScore and t1.UID=t2.UID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.UID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.UID = e.UID
	)
	where e.ExamID = ExamID AND e.CYScore IS NOT NULL;

	#稳定性排名
	update info_exam_yscore e
	set e.StaClaRank =
	( select  t3.StaClaRank  from
		(select  count(t2.Stability) as StaClaRank,t1.ExamID,t1.SubjectID,t1.UID from info_exam_yscore t2,info_exam_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID AND t1.ClassID = t2.ClassID
			and ( t1.Stability>t2.Stability or (t1.Stability=t2.Stability and t1.UID=t2.UID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.UID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.UID = e.UID
	)
	where e.ExamID = ExamID AND e.Stability IS NOT NULL;

	update info_exam_yscore e
	set e.StaGraRank =
	( select  t3.StaGraRank  from
		(select  count(t2.Stability) as StaGraRank,t1.ExamID,t1.SubjectID,t1.UID from info_exam_yscore t2,info_exam_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID AND t1.GradeID = t2.GradeID
			and ( t1.Stability>t2.Stability or (t1.Stability=t2.Stability and t1.UID=t2.UID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.UID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.UID = e.UID
	)
	where e.ExamID = ExamID AND e.Stability IS NOT NULL;

	#进步值排名
	update info_exam_yscore e
	set e.ImpClaRank =
	( select  t3.ImpClaRank  from
		(select  count(t2.Improve) as ImpClaRank,t1.ExamID,t1.SubjectID,t1.UID from info_exam_yscore t2,info_exam_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID AND t1.ClassID = t2.ClassID
			and ( t1.Improve<t2.Improve or (t1.Improve=t2.Improve and t1.UID=t2.UID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.UID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.UID = e.UID
	)
	where e.ExamID = ExamID AND e.Improve IS NOT NULL;

	update info_exam_yscore e
	set e.ImpGraRank =
	( select  t3.ImpGraRank  from
		(select  count(t2.Improve) as ImpGraRank,t1.ExamID,t1.SubjectID,t1.UID from info_exam_yscore t2,info_exam_yscore t1
			where t1.ExamID = ExamID
			and t1.ExamID = t2.ExamID and  t1.SubjectID = t2.SubjectID AND t1.GradeID = t2.GradeID
			and ( t1.Improve<t2.Improve or (t1.Improve=t2.Improve and t1.UID=t2.UID ))
    		 group by t1.ExamID, t1.SubjectID ,t1.UID
		)t3
		where  t3.ExamID = e.ExamID and  t3.SubjectID = e.SubjectID and t3.UID = e.UID
	)
	where e.ExamID = ExamID AND e.Improve IS NOT NULL;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_exam_yscore_update
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_exam_yscore_update`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exam_yscore_update`(IN ExamID int(11))
    READS SQL DATA
    COMMENT '更新考试关联分数'
BEGIN
	DECLARE YCount INT;
	DECLARE YRefer FLOAT;

	DECLARE done INT DEFAULT 0;  
	DECLARE SubjectID INT;  
	#先更新有的
	UPDATE info_exam_yscore e,
				info_exam_score t,
				info_exam_grade_stat g
	SET e.YScore = 70 + 12*(t.Score - g.avg)/g.StDeviation
	WHERE e.ExamID = ExamID AND
	e.ExamID = t.ExamID AND e.UID = t.UID AND e.SubjectID = t.SubjectID AND e.ExamID = g.ExamID AND e.SubjectID = g.SubjectID;
	

	INSERT INTO info_exam_yscore(ExamID,UID,GradeID,ClassID,SubjectID,YScore)
	SELECT es.ExamID,es.UID,es.GradeID,es.ClassID,es.SubjectID,(70 + 12*(es.Score - g.avg)/g.StDeviation) AS YSecore
	FROM info_exam_score es,info_exam_grade_stat g
	WHERE es.ExamID = ExamID AND es.ExamID = g.ExamID AND es.SubjectID = g.SubjectID AND es.Score > 0
	AND NOT EXISTS (SELECT s.ExamID FROM info_exam_yscore s WHERE s.ExamID = ExamID AND s.UID = es.UID AND s.SubjectID = es.SubjectID)
	ORDER BY es.ExamID,es.SubjectID,es.UID,es.GradeID,es.ClassID;

	#更新参照yscore 暂时不需要
/*
	BEGIN
		DECLARE cur1 CURSOR FOR SELECT es.SubjectID FROM v_exam_subject es WHERE es.ExamID = ExamID AND es.State = 1;  
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  

		OPEN cur1;  
		emp_loop: LOOP  
			FETCH cur1 INTO SubjectID;
			IF done=1 THEN 
				LEAVE emp_loop;  
			END IF;
			SET YCount = 0;
			SET YCount = (SELECT g.Count/20 FROM info_exam_grade_stat g WHERE g.ExamID = ExamID AND g.SubjectID = SubjectID);

			UPDATE info_exam_subject s,
					(SELECT e.ExamID,e.SubjectID,avg(e.YScore) AS YRefer FROM
						(SELECT y.ExamID,y.SubjectID,y.YScore FROM info_exam_yscore y where y.examid = ExamID and y.subjectid = SubjectID
						ORDER BY YScore DESC
						limit 0,YCount) as e
					GROUP BY e.ExamID,e.SubjectID) AS t
			SET s.YRefer = t.YRefer
			WHERE s.ExamID = t.ExamID AND s.SubjectID = t.SubjectID;

		END LOOP emp_loop;  
		CLOSE cur1;  
	END;*/
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_sms_getsendmsg
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sms_getsendmsg`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sms_getsendmsg`(IN GateNo int(11), RowCount INT,Priority INT)
    READS SQL DATA
BEGIN
	START TRANSACTION;  
	
	CREATE TEMPORARY TABLE tmp_SMS_SendMsg(SequenceID INT PRIMARY KEY);

	#符合条件的写入临时表
	INSERT  INTO tmp_SMS_SendMsg
					(SequenceID
					)
					SELECT  s.SeqID
					FROM    sms_sendmsg s
					WHERE   s.SendTime < NOW()
									AND s.GateNo = GateNo
					LIMIT 0,RowCount ;
					

	INSERT  INTO sms_sendmsgret(SeqID,`UID`,`MsgWord`,`MsgIndex`,`MsgCount`,`Phone`,`SrcPhone`,`MsgContent`,`SendTime`,`GateNo`,`Priority`,SentTime)
					SELECT A.SeqID,A.`UID`,A.`MsgWord`,A.`MsgIndex`,A.`MsgCount`,A.`Phone`,A.`SrcPhone`,A.`MsgContent`,A.`SendTime`,A.`GateNo`,A.`Priority`,NOW()
					FROM    sms_sendmsg A,
									tmp_SMS_SendMsg B
					WHERE   A.SeqID = B.SequenceID;

	SELECT  A.SeqID AS SequenceID,
					A.`MsgWord` AS MsgTemp,
					A.`MsgIndex`,
					A.`MsgCount`,
					0 AS MsgID,
					8 AS MsgFmt,
					0 AS CredibilityTransmit,
					49 AS ProtocolType,
					A.GateNo,
					CONCAT('@',A.`MsgWord`,'[',CONVERT(A.MsgIndex,CHAR),'/',CONVERT(A.MsgCount,CHAR),']',A.MsgContent) AS MsgContent,
					'' AS ServiceID,
					A.Phone AS FeeTerminalID,
					'' AS FeeType,
					'' AS FeeCode,
					A.SrcPhone AS SrcTerminalID,
					A.Phone AS DestTerminalID,
					'' AS LinkID,
					0 AS TryTimes,
					'' AS LastSubmitTime
	FROM    sms_sendmsg A,
					tmp_SMS_SendMsg B
	WHERE   A.SeqID = B.SequenceID;

	#删除待发表
	DELETE  A
	FROM    sms_sendmsg A
					INNER JOIN tmp_SMS_SendMsg B
					ON A.SeqID = B.SequenceID;

	DROP TABLE tmp_SMS_SendMsg;
	COMMIT;  
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_sms_getsign
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sms_getsign`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sms_getsign`(SchoolID INT,GradeID INT ,ClassID INT,OUT SmsSignature VARCHAR(50))
BEGIN
	SET SmsSignature = CONCAT('【',(SELECT s.SmsSignature FROM info_school s WHERE s.SchoolID = SchoolID ),'】');
	SELECT SmsSignature AS result;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_sms_report
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sms_report`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sms_report`(IN SeqID int(11), Result int(11), report varchar(60))
    READS SQL DATA
BEGIN

	IF Result <> 0 
			THEN
					UPDATE  sms_sendmsgret s
					SET     s.ResultCode = report ,
									s.Result = 4 ,
									s.ReportTime = NOW()
					WHERE   s.SeqID = SeqID;
	ELSE 
					UPDATE  sms_sendmsgret s
					SET     s.ResultCode = report ,
									s.Result = 3 ,
									s.ReportTime = NOW()
					WHERE   s.SeqID = SeqID;
	END IF;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_sms_sendmsginsert
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sms_sendmsginsert`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sms_sendmsginsert`(IN UID int(11), Phone VARCHAR(20),SrcPhone VARCHAR(20),MsgContent VARCHAR(2000),SendTime DATETIME,GateNo INT,Priority INT)
    READS SQL DATA
BEGIN
	DECLARE Result INT;
	DECLARE Split VARCHAR(8);
	DECLARE SingleLen INT;
	DECLARE MsgCount INT;
	DECLARE Word VARCHAR(20);
	DECLARE MsgContentTemp VARCHAR(2000);
	IF (LEFT(Phone , 2) NOT IN ('13', '18', '15', '14','17')AND CHAR_LENGTH(Phone) <> 11) THEN
		#手机号码不正确
		SET Result = 1;
	ELSE
		#设置分割符
		SET Split = '%|$';
		SET SingleLen = 67;
		CALL sp_sms_splitcontent(SingleLen,Split, MsgCount, MsgContent,MsgContentTemp);
		SET Word = char(round(rand()*25+97));
		
	#	select MsgContentTemp;
		START TRANSACTION;  
		DROP TABLE IF EXISTS splittable;
		CALL sp_util_split(MsgContentTemp,Split);
		INSERT INTO sms_sendmsg (`UID`,`MsgWord`,`MsgIndex`,`MsgCount`,`Phone`,`SrcPhone`,`MsgContent`,`SendTime`,`GateNo`,`Priority`)
		SELECT UID ,Word,id,MsgCount,Phone ,SrcPhone,VALUE,SendTime,GateNo,Priority FROM splittable;
		DROP TABLE IF EXISTS splittable;
		COMMIT;  
		SET Result = 0;
	END IF;
	SELECT Result AS Result;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_sms_splitcontent
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sms_splitcontent`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sms_splitcontent`(IN SingleLen int(11), SplitR VARCHAR(20),OUT Count int(11), Content varchar(2000),OUT Contentout varchar(2000))
    READS SQL DATA
BEGIN
	DECLARE  ContentTemp VARCHAR(4000);
	DECLARE MsgIndex INT;
	DECLARE Pos INT;
	DECLARE PartMsg1 VARCHAR(280);
	
	SET Content = TRIM(Content);
	SET ContentTemp = '';
	SET Contentout = Content;
	SET MsgIndex = 1;
	SET Count = 1;
	IF(char_length(Content) <= SingleLen)
	THEN
		SET Count = 1;
	ELSE
		SET Count = (char_length(Content) + SingleLen  - 1) / SingleLen;

			WHILE (char_length(Content) > SingleLen)  DO
				SET PartMsg1 = '';
				SET PartMsg1 = LEFT(Content, SingleLen);
				SET Content = RIGHT(Content, char_length(Content) - SingleLen);
				IF(MsgIndex = 1) THEN
					SET ContentTemp = PartMsg1;
				ELSE
					SET ContentTemp = CONCAT(ContentTemp,SplitR,PartMsg1);
				END IF;			
					
				SET MsgIndex = MsgIndex + 1;
			END WHILE;
			IF (char_length(Content) > 0) THEN
				SET ContentTemp = CONCAT(ContentTemp,SplitR,Content);
      END IF;
			SET Contentout = ContentTemp;
	END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_sms_submit
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sms_submit`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sms_submit`(IN SeqID int(11))
    READS SQL DATA
BEGIN

	UPDATE  sms_sendmsgret s
	SET     s.Result = 0,
          s.ResultCode= '已发送',
					s.SentTime = NOW()
	WHERE   s.SeqID = SeqID;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_sms_submitresp
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_sms_submitresp`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_sms_submitresp`(IN SeqID int(11), Result int(11))
    READS SQL DATA
BEGIN

DECLARE Des VARCHAR(20);
SET Des = CONCAT('提交应答(' , CONVERT(Result,CHAR) , ')');
IF (Result = 0) 
THEN
		UPDATE  sms_sendmsgret s
		SET     s.Result = 1,
						s.RespTime = NOW(),
						s.ResultCode= Des
		WHERE   s.SeqID = SeqID;
ELSE 
		UPDATE  sms_sendmsgret s
		SET     s.Result = 2,
						s.RespTime = NOW(),
						s.ResultCode= Des
		WHERE   s.SeqID = SeqID;
END IF;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_task_updatescore
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_task_updatescore`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_task_updatescore`()
BEGIN
	DECLARE ExamIDTemp INT;
	DECLARE UniIDTemp INT;
	DECLARE done INT DEFAULT 0;  

	DECLARE curexmaid CURSOR FOR SELECT ExamID,UniID FROM info_examupdatetime WHERE IsDeal = 0 ORDER BY UniID;  
	DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=1;  

	OPEN curexmaid;  
	emp_loop: LOOP  
		FETCH curexmaid INTO ExamIDTemp,UniIDTemp;
		IF done=1 THEN 
			LEAVE emp_loop;  
		END IF;
		## 1.更新关联分数
		CALL sp_exam_score_update(ExamIDTemp);

		## 2.更新学生排名
		CALL sp_exam_rank_update(ExamIDTemp);

		## 3.更新班级统计
		CALL sp_exam_class_stat_update(ExamIDTemp);

		## 4.更新年级统计
		CALL sp_exam_grade_stat_update(ExamIDTemp);

		## 5.更新y分数
		CALL sp_exam_yscore_update(ExamIDTemp);

		## 6.更新y分数统计
		CALL sp_exam_yscore_stat_update(ExamIDTemp);

		## 7.更新y分数班级统计
		CALL sp_exam_yscore_class_update(ExamIDTemp);
			
		## 8.给用户发送短信
		CALL sp_exam_msgsend(ExamIDTemp);

		## 9.更新处理记录
		UPDATE info_examupdatetime SET IsDeal = 1,DealTime = NOW() WHERE UniID = UniIDTemp;
	END LOOP emp_loop;  
	CLOSE curexmaid;  

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for sp_util_split
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_util_split`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_util_split`(inputstring VARCHAR(4000),
    delim CHAR(4))
BEGIN
    DECLARE strlen INT;
    DECLARE last_index INT;
    DECLARE cur_index INT;
    DECLARE cur_char VARCHAR(200);
    DECLARE len INT;
		DECLARE isfirst INT;
    SET cur_index=1;
		SET isfirst = 1;
    SET last_index=0;
    SET strlen=char_length(inputstring);  
    DROP TABLE IF EXISTS splittable;
    CREATE TEMPORARY TABLE splittable(
        id INT AUTO_INCREMENT,
        VALUE VARCHAR(200),
        PRIMARY KEY (`ID`),
        UNIQUE KEY `ID` (`ID`)
    ) ;
    WHILE(cur_index<=strlen) DO    
    BEGIN
        IF SUBSTRING(inputstring FROM cur_index FOR char_length(delim))=delim OR cur_index=strlen THEN
            SET len=cur_index-last_index-char_length(delim);
            IF cur_index=strlen THEN
               SET len=len+1;
            END IF;
	
						IF(isfirst = 1) THEN
							INSERT INTO splittable(`value`)VALUES(SUBSTRING(inputstring FROM last_index+1 FOR len+char_length(delim)-1));
						ELSE
							INSERT INTO splittable(`value`)VALUES(SUBSTRING(inputstring FROM (last_index+char_length(delim )) FOR len));
						END IF;
						SET isfirst = 0;
            SET last_index=cur_index;
        END IF;
        SET cur_index=cur_index+1;
    END;
    END WHILE;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for fun_exam_stuintro_get
-- ----------------------------
DROP FUNCTION IF EXISTS `fun_exam_stuintro_get`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fun_exam_stuintro_get`(`UID` int,`ExamID` int,`SubjectID` int) RETURNS varchar(500) CHARSET utf8
BEGIN
	DECLARE Intro VARCHAR(500);
	DECLARE CYScore FLOAT;
	DECLARE Stability FLOAT;
	DECLARE Improve FLOAT;
	DECLARE ReferSubject VARCHAR(50);

	SET Intro = '';
	SET CYScore = (SELECT ey.CYScore FROM info_exam_yscore ey WHERE ey.ExamID = ExamID AND ey.SubjectID = SubjectID AND ey.UID = UID);
	SET Stability = (SELECT ey.Stability FROM info_exam_yscore ey WHERE ey.ExamID = ExamID AND ey.SubjectID = SubjectID AND ey.UID = UID);
	SET Improve = (SELECT ey.Improve FROM info_exam_yscore ey WHERE ey.ExamID = ExamID AND ey.SubjectID = SubjectID AND ey.UID = UID);
	#查询是否关联科目，关联科目需要计算偏科指数
	SET ReferSubject = (SELECT ves.ReferSubjectID FROM v_exam_subject ves WHERE ves.ExamID = ExamID AND ves.SubjectID = SubjectID);
	IF ReferSubject = '' THEN
		SET Intro = (SELECT Intro+'最近能力：'+e.EstValue FROM config_estimate e WHERE e.EstName = 'ability' AND e.MinValue < CYScore AND e.MaxValue >= CYScore );
	END IF;
	RETURN Intro;
END
;;
DELIMITER ;

-- ----------------------------
-- Function structure for fun_util_split
-- ----------------------------
DROP FUNCTION IF EXISTS `fun_util_split`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fun_util_split`(f_string varchar(1000)  ,f_delimiter varchar(5),f_order int) RETURNS varchar(255) CHARSET utf8
BEGIN
	declare result varchar(255) CHARSET utf8 default '';
	set result = reverse(substring_index(reverse(substring_index(f_string,f_delimiter,f_order)),f_delimiter,1));
	return result;
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for task_updateexam
-- ----------------------------
DROP EVENT IF EXISTS `task_updateexam`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `task_updateexam` ON SCHEDULE EVERY 1 DAY STARTS '2014-04-16 01:00:00' ON COMPLETION PRESERVE ENABLE DO BEGIN
	
	CALL sp_task_updatescore();

END
;;
DELIMITER ;
