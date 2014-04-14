/*
Navicat MySQL Data Transfer

Source Server         : spanker
Source Server Version : 50520
Source Host           : 127.0.0.1:3306
Source Database       : hsoa_v1

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2014-04-13 22:33:21
*/

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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='班级信息表';

-- ----------------------------
-- Records of info_class
-- ----------------------------
INSERT INTO `info_class` VALUES ('28', '1', '2', '高2016级1班', '0', '0', '1', '2014-04-12 14:45:54', '1');
INSERT INTO `info_class` VALUES ('29', '1', '2', '高2016级2班', '0', '0', '1', '2014-04-12 14:46:00', '1');
INSERT INTO `info_class` VALUES ('30', '1', '2', '高2016级3班', '0', '0', '1', '2014-04-12 14:46:06', '1');
INSERT INTO `info_class` VALUES ('31', '1', '2', '高2016级4班', '0', '0', '1', '2014-04-12 14:46:11', '1');
INSERT INTO `info_class` VALUES ('32', '1', '2', '高2016级5班', '0', '0', '1', '2014-04-12 14:46:15', '1');
INSERT INTO `info_class` VALUES ('33', '1', '2', '高2016级6班', '0', '0', '1', '2014-04-12 14:46:19', '1');
INSERT INTO `info_class` VALUES ('34', '1', '2', '高2016级7班', '0', '0', '1', '2014-04-12 14:46:24', '1');
INSERT INTO `info_class` VALUES ('35', '1', '2', '高2016级8班', '0', '0', '1', '2014-04-12 14:46:28', '1');
INSERT INTO `info_class` VALUES ('36', '1', '2', '高2016级9班', '0', '0', '1', '2014-04-12 14:46:33', '1');
INSERT INTO `info_class` VALUES ('37', '1', '2', '高2016级10班', '0', '0', '1', '2014-04-12 14:46:38', '1');
INSERT INTO `info_class` VALUES ('38', '1', '2', '高2016级11班', '0', '0', '1', '2014-04-12 14:46:42', '1');
INSERT INTO `info_class` VALUES ('39', '1', '2', '高2016级12班', '0', '0', '1', '2014-04-12 14:46:47', '1');
INSERT INTO `info_class` VALUES ('40', '1', '2', '高2016级13班', '0', '0', '1', '2014-04-12 14:46:58', '1');
INSERT INTO `info_class` VALUES ('41', '1', '2', '高2016级14班', '0', '0', '1', '2014-04-12 14:47:03', '1');
INSERT INTO `info_class` VALUES ('42', '1', '2', '高2016级15班', '0', '0', '1', '2014-04-12 14:47:08', '1');
INSERT INTO `info_class` VALUES ('43', '1', '2', '高2016级16班', '0', '0', '1', '2014-04-12 14:47:19', '1');
INSERT INTO `info_class` VALUES ('44', '1', '2', '高2016级17班', '0', '0', '1', '2014-04-12 14:47:24', '1');
INSERT INTO `info_class` VALUES ('45', '1', '2', '高2016级18班', '0', '0', '1', '2014-04-12 14:47:29', '1');
INSERT INTO `info_class` VALUES ('46', '1', '2', '高2016级19班', '0', '0', '1', '2014-04-12 14:47:34', '1');
INSERT INTO `info_class` VALUES ('47', '1', '2', '高2016级20班', '0', '0', '1', '2014-04-12 14:47:40', '1');
INSERT INTO `info_class` VALUES ('48', '1', '2', '高2016级21班', '0', '0', '1', '2014-04-12 14:47:47', '1');
INSERT INTO `info_class` VALUES ('49', '1', '2', '高2016级22班', '0', '0', '1', '2014-04-12 14:47:51', '1');
INSERT INTO `info_class` VALUES ('50', '1', '2', '高2016级23班', '0', '0', '1', '2014-04-12 14:47:56', '1');

-- ----------------------------
-- Table structure for info_class_manage
-- ----------------------------
DROP TABLE IF EXISTS `info_class_manage`;
CREATE TABLE `info_class_manage` (
  `UID` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `ClassID` int(11) NOT NULL COMMENT '班级ID',
  `SchoolID` int(11) NOT NULL COMMENT '学校ID',
  `GradeID` int(11) NOT NULL COMMENT '年级ID',
  `CreatorID` int(11) NOT NULL COMMENT '创建人',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `State` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0.无效1.有效',
  PRIMARY KEY (`UID`,`ClassID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COMMENT='班级管理人员表';

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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='考试信息表';

-- ----------------------------
-- Records of info_exam
-- ----------------------------
INSERT INTO `info_exam` VALUES ('9', '高一上第一次月考', '2013-10-09 00:00:00', '1', '2', '0', '0', '1', null, null, null, '1', '2014-04-13 03:52:23', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='考试得分最近更新表,用于批量生成数据时用';

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
) ENGINE=InnoDB AUTO_INCREMENT=44913 DEFAULT CHARSET=utf8 COMMENT='考试得分信息表';

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
INSERT INTO `info_exam_subject` VALUES ('9', '1', '150.00', '90.00', null, '', '1');
INSERT INTO `info_exam_subject` VALUES ('9', '2', '150.00', '90.00', null, '', '1');
INSERT INTO `info_exam_subject` VALUES ('9', '3', '100.00', '60.00', null, '', '1');
INSERT INTO `info_exam_subject` VALUES ('9', '4', '100.00', '60.00', null, '', '1');
INSERT INTO `info_exam_subject` VALUES ('9', '5', '100.00', '60.00', null, '', '1');
INSERT INTO `info_exam_subject` VALUES ('9', '6', '100.00', '60.00', null, '', '1');
INSERT INTO `info_exam_subject` VALUES ('9', '7', '100.00', '60.00', null, '', '1');
INSERT INTO `info_exam_subject` VALUES ('9', '8', '100.00', '60.00', null, '', '1');
INSERT INTO `info_exam_subject` VALUES ('9', '9', '100.00', '60.00', null, '', '1');
INSERT INTO `info_exam_subject` VALUES ('9', '10', '300.00', '180.00', null, '', '1');
INSERT INTO `info_exam_subject` VALUES ('9', '11', '300.00', '180.00', null, '', '1');
INSERT INTO `info_exam_subject` VALUES ('9', '12', '750.00', '450.00', null, '', '0');
INSERT INTO `info_exam_subject` VALUES ('9', '13', '750.00', '450.00', null, '', '0');
INSERT INTO `info_exam_subject` VALUES ('9', '14', '1000.00', '600.00', null, '', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='年级信息表';

-- ----------------------------
-- Records of info_grade
-- ----------------------------
INSERT INTO `info_grade` VALUES ('2', '1', '高2016级', '1', '2014-04-12 14:45:07', '1');

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
  PRIMARY KEY (`SchoolID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='学校信息表';

-- ----------------------------
-- Records of info_school
-- ----------------------------
INSERT INTO `info_school` VALUES ('1', '攀枝花市第三高级中学', '四川省', '攀枝花市', null, null, null, null, null, null, null, '0', '2013-07-06 00:06:31');

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
INSERT INTO `info_student` VALUES ('2', '1', '2', '28', '温济恺', '1', '510400201330110039', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:24', '1');
INSERT INTO `info_student` VALUES ('3', '1', '2', '28', '廖芳杰', '0', '510400201330120029', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:24', '1');
INSERT INTO `info_student` VALUES ('4', '1', '2', '28', '李沅希', '1', '510400201330110028', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:24', '1');
INSERT INTO `info_student` VALUES ('5', '1', '2', '28', '陈俊儒', '1', '510400201330110001', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:24', '1');
INSERT INTO `info_student` VALUES ('6', '1', '2', '28', '陈雨禾', '0', '510400201330120016', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('7', '1', '2', '28', '刘文莉', '0', '510400201330120031', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('8', '1', '2', '28', '蒋偲', '0', '510400201330120023', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('9', '1', '2', '28', '李蕤桐', '0', '510400201330120005', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('10', '1', '2', '28', '万静意', '0', '510400201330120037', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('11', '1', '2', '28', '陈浩松', '0', '510400201330120014', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('12', '1', '2', '28', '吕俊霖', '1', '510400201330110033', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('13', '1', '2', '28', '甘沛翰', '1', '510400201330110004', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('14', '1', '2', '28', '毛鹏宇', '1', '510400201330110034', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('15', '1', '2', '28', '李俊文', '1', '510400201330110025', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('16', '1', '2', '28', '李睿熙', '1', '510400201330110026', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('17', '1', '2', '28', '张脐尹', '0', '510400201330120043', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('18', '1', '2', '28', '陈梓涵', '0', '510400201330120003', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('19', '1', '2', '28', '唐甜雨', '0', '510400201330120010', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('20', '1', '2', '28', '朱堂龙', '1', '510400201330110011', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('21', '1', '2', '28', '方冰洁', '0', '510400201330120017', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('22', '1', '2', '28', '卢柏宇', '1', '510400201330110032', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('23', '1', '2', '28', '杨熙贤', '0', '510400201330120041', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('24', '1', '2', '28', '李昕', '0', '510400201330120027', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('25', '1', '2', '28', '张冕', '1', '510400201330110042', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('26', '1', '2', '28', '许凯', '1', '510400201330110040', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('27', '1', '2', '28', '刘芸', '0', '510400201330120009', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('28', '1', '2', '28', '曾金茹', '0', '510400201330120013', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('29', '1', '2', '28', '雷蕾', '0', '510400201330120024', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('30', '1', '2', '28', '黄子洋', '1', '510400201330110020', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('31', '1', '2', '28', '廖寿恒', '1', '510400201330110030', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('32', '1', '2', '28', '宋奥林', '0', '510400201330120036', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('33', '1', '2', '28', '刘凌雁', '0', '510400201330120007', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('34', '1', '2', '28', '刘豪', '1', '510400201330110006', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('35', '1', '2', '28', '刘爽', '1', '510400201330110008', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('36', '1', '2', '28', '何虹娴', '0', '510400201330120018', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('37', '1', '2', '28', '蔡亚岑', '0', '510400201330120012', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('38', '1', '2', '28', '江怡萱', '0', '510400201330120022', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('39', '1', '2', '28', '贾显', '1', '510400201330110021', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('40', '1', '2', '28', '张芯溢', '0', '510400201330120044', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('41', '1', '2', '28', '何可人', '0', '510400201330120019', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('42', '1', '2', '28', '陈柯屹', '1', '510400201330110015', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('43', '1', '2', '28', '王梦琦', '0', '510400201330120038', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('44', '1', '2', '28', '陈思聿', '1', '510400201330110002', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('45', '1', '2', '28', '屈芷萱', '0', '510400201330120035', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('46', '1', '2', '29', '周玥辰', '0', '510400201330120082', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('47', '1', '2', '29', '熊珂', '1', '510400201330110077', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('48', '1', '2', '29', '李洋', '1', '510400201330110059', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('49', '1', '2', '29', '邓描', '1', '510400201330110052', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('50', '1', '2', '29', '聂翔宇', '1', '510400201330110068', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('51', '1', '2', '29', '张雯雯', '0', '510400201330120081', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('52', '1', '2', '29', '范瀚水', '1', '510400201330110053', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('53', '1', '2', '29', '刘思薇', '0', '510400201330120063', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('54', '1', '2', '29', '董欣然', '0', '510400201330120046', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('55', '1', '2', '29', '王照鸿', '1', '510400201330110074', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('56', '1', '2', '29', '罗承东', '1', '510400201330110066', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('57', '1', '2', '29', '吴忧', '0', '510400201330120075', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('58', '1', '2', '29', '杨丁豪', '1', '510400201330110811', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('59', '1', '2', '29', '邹铨', '1', '510400201330110083', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('60', '1', '2', '29', '廖诗鸣', '0', '510400201330120060', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('61', '1', '2', '29', '谢沁宏', '1', '510400201330110076', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('62', '1', '2', '29', '龙泉羽', '1', '510400201330110065', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('63', '1', '2', '29', '杨哲宇', '1', '510400201330110078', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('64', '1', '2', '29', '何煦', '0', '510400201330120055', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('65', '1', '2', '29', '刘奕杉', '0', '510400201330120064', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('66', '1', '2', '29', '刘潞', '0', '510400201330120061', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('67', '1', '2', '29', '冯海钊', '1', '510400201330110054', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('68', '1', '2', '29', '罗俊棋', '1', '510400201330110067', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('69', '1', '2', '29', '卢潇', '0', 'pzhsz00001', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('70', '1', '2', '29', '蒋骋昊', '1', '510400201330110056', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('71', '1', '2', '29', '李明玉', '0', '510400201330120057', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('72', '1', '2', '29', '曾紫琪', '0', '510400201330120050', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('73', '1', '2', '29', '陈奕霖', '0', '510400201330120051', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('74', '1', '2', '29', '田晨凤', '0', '510400201330120070', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('75', '1', '2', '29', '王雨荷', '0', '510400201330120073', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('76', '1', '2', '29', '陈琳', '0', '510400201330120045', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('77', '1', '2', '29', '李秋阳', '1', '510400201330110058', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('78', '1', '2', '29', '杨鸣', '0', '510400201330120049', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('79', '1', '2', '29', '刘尚学', '1', '510400201330110062', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('80', '1', '2', '29', '罗晨风', '1', '510400201330110047', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('81', '1', '2', '29', '张凤羽', '0', '510400201330120080', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('82', '1', '2', '29', '唐蝶', '0', '510400201330120069', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('83', '1', '2', '29', '王垚', '1', '510400201330110072', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('84', '1', '2', '29', '喻鹏宇', '1', '510400201330110079', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('85', '1', '2', '29', '杨鉴琪', '0', '510400201330120048', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('86', '1', '2', '29', '袁丹夫', '1', '510400201330110812', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('87', '1', '2', '29', '汪浩天', '1', '510400201330110071', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('88', '1', '2', '29', '刘晋源', '1', 'pzhsz00002', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('89', '1', '2', '30', '杨添', '1', '510400201330110815', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('90', '1', '2', '30', '蔡菡', '0', '510400201330120090', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('91', '1', '2', '30', '窦珺铧', '1', '510400201330110085', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('92', '1', '2', '30', '文竟丞', '1', '510400201330110105', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('93', '1', '2', '30', '彭丽寻', '0', '510400201330120099', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('94', '1', '2', '30', '陈怡君', '0', '510400201330120091', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('95', '1', '2', '30', '罗小双', '1', '510400201330110097', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('96', '1', '2', '30', '米宸玉', '1', '510400201330110098', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('97', '1', '2', '30', '王宇溪', '0', '510400201330120104', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('98', '1', '2', '30', '戴天', '1', '510400201330110092', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('99', '1', '2', '30', '姚沛', '1', '510400201330110108', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('100', '1', '2', '30', '兰雅欣', '0', '510400201330120813', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('101', '1', '2', '30', '兰诗艺', '0', '510400201330120095', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('102', '1', '2', '30', '王海霏', '0', '510400201330120101', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('103', '1', '2', '30', '邓皓予', '1', '510400201330110093', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('104', '1', '2', '30', '翁子恒', '1', '510400201330110814', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('105', '1', '2', '30', '邱瑶', '0', '510400201330120089', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('106', '1', '2', '30', '宋美杰', '0', '510400201330120100', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('107', '1', '2', '30', '蒋钰琪', '0', '510400201330120094', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('108', '1', '2', '30', '卞榉梵', '1', '510400201330110084', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('109', '1', '2', '30', '王思颖', '0', '510400201330120103', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('110', '1', '2', '30', '方婳', '0', '510400201330120087', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('111', '1', '2', '30', '杨舒涵', '0', '510400201330120107', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('112', '1', '2', '30', '李松岳', '1', '510400201330110096', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('113', '1', '2', '30', '兰玉', '0', '510400201330120088', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('114', '1', '2', '30', '颜明昊', '1', '510400201330110106', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('115', '1', '2', '30', '王瑞彬', '0', '510400201330120102', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('116', '1', '2', '30', '杜玥锜', '0', '510400201330120086', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('117', '1', '2', '30', '朱培丽', '0', '510400201330120109', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('118', '1', '2', '30', '周凌倩', '0', '510400201330120816', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('119', '1', '2', '31', '黄鑫', '1', '510400201330110123', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('120', '1', '2', '31', '赖嘉', '0', '510400201330120127', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('121', '1', '2', '31', '夏镱睿', '0', '510400201330120154', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('122', '1', '2', '31', '唐梦晗', '0', '510400201330120148', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('123', '1', '2', '31', '郑长攀', '1', '510400201330110165', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('124', '1', '2', '31', '陈柯旭', '1', '510400201330110118', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('125', '1', '2', '31', '赵尹杰', '0', '510400201330120164', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('126', '1', '2', '31', '罗颖睿', '0', '510400201330120113', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('127', '1', '2', '31', '王奕淞', '1', '510400201330110152', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('128', '1', '2', '31', '赵浩荃', '1', '510400201330110163', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('129', '1', '2', '31', '肖雨杨', '0', '510400201330120155', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('130', '1', '2', '31', '罗子朋', '1', '510400201330110136', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('131', '1', '2', '31', '孙苇如', '0', '510400201330120147', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('132', '1', '2', '31', '龙嘉锐', '1', '510400201330110135', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:25', '1');
INSERT INTO `info_student` VALUES ('133', '1', '2', '31', '刘思懿', '0', '510400201330120132', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('134', '1', '2', '31', '李玉婷', '0', '510400201330120112', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('135', '1', '2', '31', '徐若尘', '1', '510400201330110156', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('136', '1', '2', '31', '张森林', '1', '510400201330110161', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('137', '1', '2', '31', '任志苓', '0', '510400201330120144', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('138', '1', '2', '31', '刘峻汐', '0', '510400201330120130', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('139', '1', '2', '31', '刘斯睿', '1', '510400201330110133', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('140', '1', '2', '31', '钱艺文', '0', '510400201330120142', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('141', '1', '2', '31', '郎钧', '1', '510400201330110111', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('142', '1', '2', '31', '唐文颖', '0', '510400201330120149', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('143', '1', '2', '31', '廖乙鉴', '1', '510400201330110129', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('144', '1', '2', '31', '梁宇驰', '0', '510400201330120128', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('145', '1', '2', '31', '刘意洋', '1', '510400201330110823', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('146', '1', '2', '31', '陈祉汛', '0', '510400201330120119', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('147', '1', '2', '31', '范珂诚', '1', '510400201330110120', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('148', '1', '2', '31', '张雪娇', '0', '510400201330120162', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('149', '1', '2', '31', '张朵', '0', '510400201330120159', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('150', '1', '2', '31', '刘天杰', '1', '510400201330110134', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('151', '1', '2', '31', '张格悠', '1', '510400201330110160', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('152', '1', '2', '31', '周希', '0', '510400201330120168', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('153', '1', '2', '31', '钟昊原', '1', '510400201330110166', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('154', '1', '2', '31', '蒋佳蕊', '0', '510400201330120126', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('155', '1', '2', '31', '胡妍', '0', '510400201330120121', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('156', '1', '2', '31', '马升', '1', '510400201330110137', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('157', '1', '2', '31', '马志刚', '1', '510400201330110139', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('158', '1', '2', '31', '余巧婧', '0', '510400201330120158', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('159', '1', '2', '31', '舒琪森', '1', '510400201330110146', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('160', '1', '2', '31', '王姣姣', '0', '510400201330120150', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('161', '1', '2', '31', '蒋丰翼', '1', '510400201330110125', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('162', '1', '2', '31', '贾国弘', '1', '510400201330110124', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('163', '1', '2', '31', '杨玉菡', '0', '510400201330120157', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('164', '1', '2', '31', '刘力丰', '1', '510400201330110131', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('165', '1', '2', '31', '吴沛衡', '1', '510400201330110153', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('166', '1', '2', '31', '王芊入', '0', '510400201330120151', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('167', '1', '2', '31', '杨晨', '0', '510400201330120114', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('168', '1', '2', '31', '曹龙骧', '1', '510400201330110116', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('169', '1', '2', '31', '黄思涵', '0', '510400201330120122', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('170', '1', '2', '31', '车奕威', '1', '510400201330110117', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('171', '1', '2', '31', '何沛玲', '0', '510400201330120110', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('172', '1', '2', '31', '马晚心', '0', '510400201330120138', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('173', '1', '2', '31', '杨悦', '1', '510400201330110115', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('174', '1', '2', '31', '佘云松', '1', '510400201330110145', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('175', '1', '2', '31', '任玲漪', '0', '510400201330120143', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('176', '1', '2', '31', '钱泓伍', '1', '510400201330110141', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('177', '1', '2', '31', '钟蕊羽', '0', '510400201330120167', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('178', '1', '2', '31', '李林泽', '1', '510400201330110821', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('179', '1', '2', '31', '李雨潼', '0', '510400201330120822', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('180', '1', '2', '31', '何瑞', '1', '510400201330110819', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('181', '1', '2', '31', '穆枭寒', '1', '510400201330110140', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('182', '1', '2', '31', '何沁洋', '1', '510400201330110818', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('183', '1', '2', '31', '陈思雨', '0', '510400201330120817', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('184', '1', '2', '31', '李玉皓', '1', 'pzhsz00003', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('185', '1', '2', '31', '柯子彦', '1', '510400201330110820', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('186', '1', '2', '32', '王浩舟', '1', '510400201330110205', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('187', '1', '2', '32', '卢畅', '0', '510400201330120198', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('188', '1', '2', '32', '刘相辉', '1', '510400201330110197', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('189', '1', '2', '32', '张元', '0', '510400201330120220', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('190', '1', '2', '32', '邱林', '1', '510400201330110203', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('191', '1', '2', '32', '叶露', '0', '510400201330120215', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('192', '1', '2', '32', '杜月鑫', '1', '510400201330110181', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('193', '1', '2', '32', '潘宗梅', '0', '510400201330120202', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('194', '1', '2', '32', '马懿琦', '0', '510400201330120200', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('195', '1', '2', '32', '陈渝峰', '1', '510400201330110178', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('196', '1', '2', '32', '黄帅铭', '1', '510400201330110170', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('197', '1', '2', '32', '刘忱', '0', '510400201330120194', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('198', '1', '2', '32', '肖天宇', '1', '510400201330110212', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('199', '1', '2', '32', '蒋月', '0', '510400201330120189', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('200', '1', '2', '32', '赵艺璇', '0', '510400201330120221', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('201', '1', '2', '32', '王梓帆', '1', '510400201330110209', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('202', '1', '2', '32', '刘姝雅', '0', '510400201330120196', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('203', '1', '2', '32', '侯金山', '1', '510400201330110186', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('204', '1', '2', '32', '王文超', '1', '510400201330110206', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('205', '1', '2', '32', '吴奕颖', '0', '510400201330120210', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('206', '1', '2', '32', '尹颢霖', '0', '510400201330120216', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('207', '1', '2', '32', '曹浏', '1', '510400201330110173', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('208', '1', '2', '32', '尚文祚', '1', '510400201330110171', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('209', '1', '2', '32', '艾昕仪', '0', '510400201330120172', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('210', '1', '2', '32', '陈静', '0', '510400201330120177', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('211', '1', '2', '32', '张涛', '1', '510400201330110830', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('212', '1', '2', '32', '王欣然', '0', '510400201330120207', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('213', '1', '2', '32', '李朝洋', '0', '510400201330120192', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('214', '1', '2', '32', '罗鸿渝', '1', '510400201330110199', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('215', '1', '2', '32', '杨雅懿', '0', '510400201330120214', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('216', '1', '2', '32', '李若宇', '1', '510400201330110826', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('217', '1', '2', '32', '郭红梅', '0', '510400201330120184', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('218', '1', '2', '32', '黄崴', '1', '510400201330110187', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('219', '1', '2', '32', '仇跃铭', '1', '510400201330110179', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('220', '1', '2', '32', '陈杰', '0', '510400201330120176', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('221', '1', '2', '32', '古华燕', '0', '510400201330120183', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('222', '1', '2', '32', '朱亮东', '1', '510400201330110224', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('223', '1', '2', '32', '刘若瑜', '0', '510400201330120195', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('224', '1', '2', '32', '陈泓宇', '0', '510400201330120175', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('225', '1', '2', '32', '晋越', '1', '510400201330110190', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('226', '1', '2', '32', '邓晶', '0', '510400201330120180', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('227', '1', '2', '32', '杨奇', '1', '510400201330110213', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('228', '1', '2', '32', '何雨芮', '0', '510400201330120185', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('229', '1', '2', '32', '黄宇帆', '1', '510400201330110188', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('230', '1', '2', '32', '何海磊', '1', '510400201330110169', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('231', '1', '2', '32', '张映娇', '0', '510400201330120219', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('232', '1', '2', '32', '侯永飞', '1', '510400201330110825', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('233', '1', '2', '32', '苏贤', '0', '510400201330120204', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('234', '1', '2', '32', '李颜', '1', '510400201330110827', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('235', '1', '2', '32', '周薇', '0', '510400201330120832', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('236', '1', '2', '32', '李安健', '1', '510400201330110191', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('237', '1', '2', '32', '张炫礡', '1', '510400201330110218', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('238', '1', '2', '32', '梅之潇', '0', '510400201330120201', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('239', '1', '2', '32', '向文汐', '0', '510400201330120211', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('240', '1', '2', '32', '庄耀兴', '1', '510400201330110225', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('241', '1', '2', '32', '朱蓓', '0', '510400201330120223', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('242', '1', '2', '32', '王一诺', '1', '510400201330110208', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('243', '1', '2', '32', '李汶键', '1', '510400201330110193', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('244', '1', '2', '32', '钟诗睿', '0', '510400201330120222', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('245', '1', '2', '32', '袁满', '0', '510400201330120217', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('246', '1', '2', '32', '柴先鸿', '1', '510400201330110174', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('247', '1', '2', '32', '张柏林', '1', '510400201330110829', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('248', '1', '2', '32', '何雨亭', '0', '510400201330120824', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('249', '1', '2', '32', '龚详峻', '1', '510400201330110182', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('250', '1', '2', '32', '张雨潇', '1', '510400201330110831', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('251', '1', '2', '32', '唐瑞昕', '1', '510400201330110828', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('252', '1', '2', '32', '吴永丰', '1', 'pzhsz00004', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('253', '1', '2', '32', '彭淑楚', '0', 'pzhsz00005', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('254', '1', '2', '33', '王燚', '1', '510400201330110262', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('255', '1', '2', '33', '刘鑫', '0', '510400201330120248', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('256', '1', '2', '33', '李恒', '1', '510400201330110243', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('257', '1', '2', '33', '刘鑫', '1', '510400201330110249', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('258', '1', '2', '33', '张梦柔', '0', '510400201330120842', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('259', '1', '2', '33', '李俊霖', '1', '510400201330110244', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('260', '1', '2', '33', '谢峻琰', '0', '510400201330120266', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('261', '1', '2', '33', '伍泓锦', '1', '510400201330110840', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('262', '1', '2', '33', '周明雨', '0', '510400201330120278', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('263', '1', '2', '33', '甘旭阳', '1', '510400201330110234', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('264', '1', '2', '33', '代大名', '1', '510400201330110227', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('265', '1', '2', '33', '王佳怡', '0', '510400201330120259', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('266', '1', '2', '33', '郭婷婷', '0', '510400201330120235', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('267', '1', '2', '33', '王义鑫', '1', '510400201330110261', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('268', '1', '2', '33', '张平', '0', '510400201330120273', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('269', '1', '2', '33', '傅经纬', '1', '510400201330110233', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('270', '1', '2', '33', '余瑾', '0', '510400201330120271', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('271', '1', '2', '33', '龙昱宏', '1', '510400201330110251', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('272', '1', '2', '33', '冯驰', '1', '510400201330110232', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:26', '1');
INSERT INTO `info_student` VALUES ('273', '1', '2', '33', '贾茹月', '0', '510400201330120239', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('274', '1', '2', '33', '叶家麟', '1', '510400201330110270', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('275', '1', '2', '33', '姚清云', '0', '510400201330120269', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('276', '1', '2', '33', '谢金池', '1', '510400201330110265', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('277', '1', '2', '33', '起雨涵', '0', '510400201330120256', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('278', '1', '2', '33', '杜名苑', '0', '510400201330120230', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('279', '1', '2', '33', '彭耀杨', '1', '510400201330110255', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('280', '1', '2', '33', '唐云晞', '0', '510400201330120257', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('281', '1', '2', '33', '王雨鑫', '0', '510400201330120263', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('282', '1', '2', '33', '吴若斌', '1', '510400201330110264', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('283', '1', '2', '33', '黄鑫', '0', '510400201330120238', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('284', '1', '2', '33', '江凌林', '1', '510400201330110240', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('285', '1', '2', '33', '韩沛岑', '0', '510400201330120236', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('286', '1', '2', '33', '李远航', '1', '510400201330110246', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('287', '1', '2', '33', '周麟', '1', '510400201330110277', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('288', '1', '2', '33', '马悦', '0', '510400201330120252', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('289', '1', '2', '33', '彭鹏豪', '1', '510400201330110254', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('290', '1', '2', '33', '王文馨', '0', '510400201330120260', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('291', '1', '2', '33', '贺琦', '0', '510400201330120237', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('292', '1', '2', '33', '李飞龙', '1', '510400201330110242', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('293', '1', '2', '33', '曾成', '0', '510400201330120226', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('294', '1', '2', '33', '邓浩宇', '1', '510400201330110228', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('295', '1', '2', '33', '李超', '1', '510400201330110241', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('296', '1', '2', '33', '刘荃芃', '0', '510400201330120247', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('297', '1', '2', '33', '张怡喆', '1', '510400201330110274', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('298', '1', '2', '33', '许馨尹', '0', '510400201330120267', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('299', '1', '2', '33', '周焓', '0', '510400201330120276', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('300', '1', '2', '33', '毛谚翎', '1', '510400201330110253', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('301', '1', '2', '33', '杨沛然', '1', '510400201330110268', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('302', '1', '2', '33', '李杰', '1', '510400201330110835', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('303', '1', '2', '33', '李昕怡', '0', '510400201330120245', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('304', '1', '2', '33', '段雨昕', '0', '510400201330120231', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('305', '1', '2', '33', '汪定弘', '1', '510400201330110258', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('306', '1', '2', '33', '张婕', '0', '510400201330120272', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('307', '1', '2', '33', '刘洲', '1', '510400201330110250', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('308', '1', '2', '33', '董翔锐', '1', '510400201330110229', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('309', '1', '2', '33', '郑雪婧', '0', '510400201330120275', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('310', '1', '2', '33', '任获舒崭', '1', '510400201330110838', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('311', '1', '2', '33', '秦翊珺', '1', '510400201330110837', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('312', '1', '2', '33', '何奕霏', '0', '510400201330120834', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('313', '1', '2', '33', '刘柯江', '0', '510400201330120836', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('314', '1', '2', '33', '汪沁怡', '0', '510400201330120839', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('315', '1', '2', '33', '肖宇峰', '1', '510400201330110841', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('316', '1', '2', '33', '何匡达', '1', '510400201330110833', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('317', '1', '2', '33', '钱星颖', '0', 'pzhsz00006', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('318', '1', '2', '33', '杨泰然', '1', 'pzhsz00007', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('319', '1', '2', '33', '雷雅涵', '0', 'pzhsz00008', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('320', '1', '2', '34', '毛玥颖', '0', '510400201330120312', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('321', '1', '2', '34', '沈岐', '1', '510400201330110316', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('322', '1', '2', '34', '段诗雅', '0', '510400201330120289', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('323', '1', '2', '34', '陈泓宇', '1', '510400201330110283', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('324', '1', '2', '34', '王瑶', '0', '510400201330120319', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('325', '1', '2', '34', '蒲泠岑', '0', '510400201330120313', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('326', '1', '2', '34', '唐寅凯', '1', '510400201330110318', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('327', '1', '2', '34', '李彦龙', '1', '510400201330110304', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('328', '1', '2', '34', '陈俊任', '1', '510400201330110279', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('329', '1', '2', '34', '杨蕾', '0', '510400201330120324', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('330', '1', '2', '34', '张钰婕', '0', '510400201330120328', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('331', '1', '2', '34', '傅与天', '1', '510400201330110290', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('332', '1', '2', '34', '徐健', '1', '510400201330110323', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('333', '1', '2', '34', '游倩如', '0', '510400201330120326', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('334', '1', '2', '34', '邓兰馨', '0', '510400201330120286', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('335', '1', '2', '34', '宾学昊', '1', '510400201330110282', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('336', '1', '2', '34', '林洁', '0', '510400201330120845', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('337', '1', '2', '34', '李正鹏', '1', '510400201330110844', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('338', '1', '2', '34', '郑浩然', '0', '510400201330120331', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('339', '1', '2', '34', '毕钰婕', '0', '510400201330120281', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('340', '1', '2', '34', '吴哲林', '1', '510400201330110320', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('341', '1', '2', '34', '段哲文', '1', '510400201330110843', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('342', '1', '2', '34', '段然', '0', '510400201330120288', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('343', '1', '2', '34', '任益苇', '0', '510400201330120315', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('344', '1', '2', '34', '开心', '0', '510400201330120297', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('345', '1', '2', '34', '郭一磊', '1', '510400201330110293', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('346', '1', '2', '34', '邓婷', '0', '510400201330120287', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('347', '1', '2', '34', '赵靖杰', '1', '510400201330110329', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('348', '1', '2', '34', '陈泞静', '0', '510400201330120285', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('349', '1', '2', '34', '黄艺璇', '0', '510400201330120296', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('350', '1', '2', '34', '夏鑫', '1', '510400201330110321', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('351', '1', '2', '34', '高溯', '0', '510400201330120291', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('352', '1', '2', '34', '张瀚予', '0', '510400201330120327', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('353', '1', '2', '34', '郝方润', '1', '510400201330110294', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('354', '1', '2', '34', '夏阳', '1', '510400201330110322', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('355', '1', '2', '34', '朱沁怡', '0', '510400201330120333', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('356', '1', '2', '34', '周晓', '0', '510400201330120332', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('357', '1', '2', '34', '苏培超', '1', '510400201330110317', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('358', '1', '2', '34', '雷晓薇', '0', '510400201330120298', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('359', '1', '2', '34', '李松昊', '1', '510400201330110302', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('360', '1', '2', '34', '赵若竹', '0', '510400201330120330', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('361', '1', '2', '34', '李燕', '0', '510400201330120305', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('362', '1', '2', '34', '罗淏炜', '1', '510400201330110310', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('363', '1', '2', '34', '唐德洪', '1', '510400201330110280', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('364', '1', '2', '34', '龙娇', '0', '510400201330120309', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('365', '1', '2', '34', '李润阳', '1', '510400201330110301', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('366', '1', '2', '34', '刘韵月', '0', '510400201330120308', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('367', '1', '2', '34', '李欣桐', '0', '510400201330120303', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('368', '1', '2', '34', '夏苗', '0', '510400201330120851', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('369', '1', '2', '34', '李雨轩', '1', '510400201330110306', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('370', '1', '2', '34', '廖仕昌', '1', '510400201330110307', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('371', '1', '2', '34', '刘俊材', '1', '510400201330110846', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('372', '1', '2', '34', '李畅', '0', '510400201330120299', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('373', '1', '2', '34', '陈金豪', '1', '510400201330110284', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('374', '1', '2', '34', '罗宇峰', '1', '510400201330110311', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('375', '1', '2', '34', '李沁珂', '0', '510400201330120300', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('376', '1', '2', '34', '冉雨婕', '0', '510400201330120314', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('377', '1', '2', '34', '刘珂辰', '1', '510400201330110847', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('378', '1', '2', '34', '邹国庆', '0', '510400201330120852', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('379', '1', '2', '34', '龙玺羽', '0', '510400201330120848', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('380', '1', '2', '34', '王菁', '0', '510400201330120850', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('381', '1', '2', '34', '邱鸿宇', '1', '510400201330110849', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('382', '1', '2', '34', '管柏钧', '1', '510400201330110292', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('383', '1', '2', '34', '胡峻豪', '1', '510400201330110295', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('384', '1', '2', '34', '杨璐畅', '1', '510400201330110325', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('385', '1', '2', '34', '夏晓语', '0', 'pzhsz00009', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('386', '1', '2', '34', '刘洲瑞 ', '1', 'pzhsz00010', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('387', '1', '2', '34', '刘泓舟', '1', 'pzhsz00011', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('388', '1', '2', '35', '郑若冰', '0', '510400201330120385', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('389', '1', '2', '35', '朱文婧', '0', '510400201330120387', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('390', '1', '2', '35', '潘柏廷', '1', '510400201330110364', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('391', '1', '2', '35', '苟梦琪', '0', '510400201330120347', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('392', '1', '2', '35', '罗梓瑞', '1', '510400201330110361', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('393', '1', '2', '35', '杨舒涵', '0', '510400201330120380', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('394', '1', '2', '35', '陈建良', '1', '510400201330110343', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('395', '1', '2', '35', '李增俊', '1', '510400201330110357', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('396', '1', '2', '35', '杨识晓', '0', '510400201330120379', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('397', '1', '2', '35', '陆森', '1', '510400201330110359', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('398', '1', '2', '35', '秦小枫', '0', '510400201330120368', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('399', '1', '2', '35', '卓佳', '0', '510400201330120388', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('400', '1', '2', '35', '张晏如', '0', '510400201330120384', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('401', '1', '2', '35', '安剑', '1', '510400201330110339', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('402', '1', '2', '35', '韩慧珠', '0', '510400201330120349', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('403', '1', '2', '35', '何化吉', '1', '510400201330110350', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('404', '1', '2', '35', '徐佳钰', '0', '510400201330120337', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('405', '1', '2', '35', '赖玉铭', '1', '510400201330110353', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:27', '1');
INSERT INTO `info_student` VALUES ('406', '1', '2', '35', '周婷', '0', '510400201330120338', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('407', '1', '2', '35', '严渊', '1', '510400201330110377', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('408', '1', '2', '35', '起楠', '0', '510400201330120367', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('409', '1', '2', '35', '王嘉辉', '1', '510400201330110372', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('410', '1', '2', '35', '潘星越', '0', '510400201330120365', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('411', '1', '2', '35', '陈奕州', '1', '510400201330110853', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('412', '1', '2', '35', '安琴', '0', '510400201330120340', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('413', '1', '2', '35', '王欣怡', '0', '510400201330120373', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('414', '1', '2', '35', '毕姗姗', '0', '510400201330120341', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('415', '1', '2', '35', '郭轩', '0', '510400201330120348', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('416', '1', '2', '35', '何金佩', '1', '510400201330110351', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('417', '1', '2', '35', '李好', '0', '510400201330120354', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('418', '1', '2', '35', '陈相', '1', '510400201330110344', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('419', '1', '2', '35', '蒋雨桐', '0', '510400201330120352', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('420', '1', '2', '35', '王浩宇', '1', '510400201330110336', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('421', '1', '2', '35', '谭月影', '0', '510400201330120371', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('422', '1', '2', '35', '代宇航', '1', '510400201330110854', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('423', '1', '2', '35', '沙兰', '0', '510400201330120369', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('424', '1', '2', '35', '廖元植', '1', '510400201330110358', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('425', '1', '2', '35', '马银康', '1', '510400201330110363', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('426', '1', '2', '35', '游洋', '1', '510400201330110382', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('427', '1', '2', '35', '李雨萌', '0', '510400201330120356', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('428', '1', '2', '35', '赖宇琪', '0', '510400201330120857', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('429', '1', '2', '35', '吕磊', '1', '510400201330110362', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('430', '1', '2', '35', '孙梦', '0', '510400201330120370', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('431', '1', '2', '35', '刀平鸿', '1', '510400201330110334', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('432', '1', '2', '35', '周俊洁', '0', '510400201330120386', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('433', '1', '2', '35', '王振国', '1', '510400201330110374', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('434', '1', '2', '35', '叶潘', '0', '510400201330120381', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('435', '1', '2', '35', '范蓓蓓', '0', '510400201330120346', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('436', '1', '2', '35', '曹廷巍', '1', '510400201330110342', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('437', '1', '2', '35', '徐平', '1', '510400201330110376', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('438', '1', '2', '35', '陈雪雯', '0', '510400201330120345', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('439', '1', '2', '35', '张佩玲', '0', '510400201330120383', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('440', '1', '2', '35', '潘颖迪', '1', '510400201330120366', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('441', '1', '2', '35', '罗红杰', '1', '510400201330110360', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('442', '1', '2', '35', '伍博言', '0', '510400201330120375', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('443', '1', '2', '35', '胡建', '1', '510400201330110856', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('444', '1', '2', '35', '李抒泽', '0', '510400201330120355', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('445', '1', '2', '35', '阳沛霖', '1', '510400201330110378', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('446', '1', '2', '35', '赵西岳', '1', '510400201330110860', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('447', '1', '2', '35', '张超旭', '1', '510400201330110859', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('448', '1', '2', '35', '罗莉莎', '0', '510400201330120335', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('449', '1', '2', '35', '辜梦轩', '1', '510400201330110855', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('450', '1', '2', '35', '盛琳钦', '0', '510400201330120858', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('451', '1', '2', '35', '李卓峻', '1', 'pzhsz00012', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('452', '1', '2', '35', '曹潺', '0', 'pzhsz00013', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('453', '1', '2', '36', '汪洁伊', '0', '510400201330120425', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('454', '1', '2', '36', '李珂', '0', '510400201330120406', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('455', '1', '2', '36', '罗岩松', '1', '510400201330110416', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('456', '1', '2', '36', '官嫒林', '0', '510400201330120390', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('457', '1', '2', '36', '齐开颜', '1', '510400201330110421', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('458', '1', '2', '36', '李林涛', '1', '510400201330110392', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('459', '1', '2', '36', '董哲含', '0', '510400201330120398', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('460', '1', '2', '36', '张庭瑞', '1', '510400201330110439', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('461', '1', '2', '36', '余可馨', '0', '510400201330120437', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('462', '1', '2', '36', '郑璐茜', '0', '510400201330120441', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('463', '1', '2', '36', '彭超', '1', '510400201330110419', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('464', '1', '2', '36', '谢明松', '1', '510400201330110433', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('465', '1', '2', '36', '雷晶', '0', '510400201330120404', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('466', '1', '2', '36', '鲜坤锦', '1', '510400201330110431', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('467', '1', '2', '36', '谢雨萱', '0', '510400201330120434', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('468', '1', '2', '36', '王洁', '0', '510400201330120426', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('469', '1', '2', '36', '刘岑仪', '1', '510400201330110410', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('470', '1', '2', '36', '刘洵', '1', '510400201330110413', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('471', '1', '2', '36', '林馨', '0', '510400201330120409', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('472', '1', '2', '36', '赵河彬', '1', '510400201330110440', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('473', '1', '2', '36', '白珊榕', '0', '510400201330120395', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('474', '1', '2', '36', '罗健', '1', '510400201330110415', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('475', '1', '2', '36', '李承琳', '0', '510400201330120405', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('476', '1', '2', '36', '刁宜欣', '1', '510400201330110397', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('477', '1', '2', '36', '陈柄翰', '1', '510400201330110396', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('478', '1', '2', '36', '冉芸声', '0', '510400201330120422', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('479', '1', '2', '36', '孙靖山', '1', '510400201330110423', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('480', '1', '2', '36', '杨慧思', '0', '510400201330120435', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('481', '1', '2', '36', '刘静', '0', '510400201330120411', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('482', '1', '2', '36', '倪菀妍', '0', '510400201330120417', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('483', '1', '2', '36', '周星池', '0', '510400201330120442', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('484', '1', '2', '36', '黄灏', '1', '510400201330110402', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('485', '1', '2', '36', '夏磊', '1', '510400201330110430', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('486', '1', '2', '36', '肖茹双', '0', '510400201330120393', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('487', '1', '2', '36', '彭茂', '1', '510400201330110420', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('488', '1', '2', '36', '魏静文', '0', '510400201330120428', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('489', '1', '2', '36', '谢欣', '1', '510400201330110394', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('490', '1', '2', '36', '李涵涵', '0', '510400201330120391', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('491', '1', '2', '36', '伍俊涛', '1', '510400201330110429', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('492', '1', '2', '36', '高建峰', '1', '510400201330110400', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('493', '1', '2', '36', '张晋海', '1', '510400201330110438', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('494', '1', '2', '36', '李锐', '1', '510400201330110407', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('495', '1', '2', '36', '刘欣雨', '0', '510400201330120412', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('496', '1', '2', '36', '朱雅如', '0', '510400201330120443', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('497', '1', '2', '36', '尹新', '1', '510400201330110436', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('498', '1', '2', '36', '陶霖', '0', '510400201330120424', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('499', '1', '2', '36', '张明月', '0', '510400201330120867', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('500', '1', '2', '36', '肖俊杰', '1', '510400201330110432', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('501', '1', '2', '36', '谢珍', '0', '510400201330120866', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('502', '1', '2', '36', '王湛博', '1', '510400201330110861', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('503', '1', '2', '36', '代蕴蓬', '0', '510400201330120389', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('504', '1', '2', '36', '蒋佳成', '1', '510400201330110444', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('505', '1', '2', '36', '王锐燕', '0', '510400201330120427', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('506', '1', '2', '36', '冯钧', '1', '510400201330110862', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('507', '1', '2', '36', '廖应超', '1', '510400201330110408', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('508', '1', '2', '36', '庞楠炯', '1', '510400201330110418', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('509', '1', '2', '36', '范思懿', '0', '510400201330120399', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('510', '1', '2', '36', '黄玉', '0', '510400201330120403', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('511', '1', '2', '36', '刘炎', '1', '510400201330110414', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('512', '1', '2', '36', '古济铭', '1', '510400201330110401', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('513', '1', '2', '36', '郭茂', '1', '510400201330110863', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('514', '1', '2', '36', '刘慧云', '0', '510400201330120868', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('515', '1', '2', '36', '王悦丞', '1', '510400201330110865', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('516', '1', '2', '36', '姜梦睿', '0', '510400201330120864', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('517', '1', '2', '36', '聂洋', '1', 'pzhsz00014', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('518', '1', '2', '36', '刘羽涵', '0', 'pzhsz00015', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('519', '1', '2', '36', '文梦瑶', '0', 'pzhsz00016', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('520', '1', '2', '36', '陈麒羽', '0', 'pzhsz00017', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('521', '1', '2', '37', '苏婉瑄', '0', '510400201330120477', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('522', '1', '2', '37', '肖莲', '0', '510400201330120489', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('523', '1', '2', '37', '林嘉源', '1', '510400201330110465', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('524', '1', '2', '37', '唐茜', '0', '510400201330120479', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('525', '1', '2', '37', '张洋', '1', '510400201330110496', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('526', '1', '2', '37', '尹恒', '1', '510400201330110492', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('527', '1', '2', '37', '李欣燕', '0', '510400201330120464', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('528', '1', '2', '37', '甘小川', '0', '510400201330120456', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('529', '1', '2', '37', '林夕涵', '1', '510400201330110466', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('530', '1', '2', '37', '严飞', '1', '510400201330110491', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('531', '1', '2', '37', '刘心语', '0', '510400201330120447', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('532', '1', '2', '37', '蒋一枫', '1', '510400201330110459', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('533', '1', '2', '37', '李镐月', '0', '510400201330120462', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:28', '1');
INSERT INTO `info_student` VALUES ('534', '1', '2', '37', '汪琪炜', '1', '510400201330110480', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('535', '1', '2', '37', '蒋雨汐', '0', '510400201330120460', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('536', '1', '2', '37', '马彦红', '0', '510400201330120471', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('537', '1', '2', '37', '倪春雨', '0', '510400201330120473', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('538', '1', '2', '37', '成安林', '1', '510400201330110453', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('539', '1', '2', '37', '毛誉', '1', '510400201330110472', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('540', '1', '2', '37', '陈枫', '0', '510400201330120450', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('541', '1', '2', '37', '魏威', '1', '510400201330110486', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('542', '1', '2', '37', '周俊岑', '0', '510400201330120498', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('543', '1', '2', '37', '牛一霖', '1', '510400201330110474', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('544', '1', '2', '37', '文雯', '0', '510400201330120874', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('545', '1', '2', '37', '应该', '1', '510400201330110493', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('546', '1', '2', '37', '蒋滨如', '0', '510400201330120446', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('547', '1', '2', '37', '宇文东方', '0', '510400201330120494', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('548', '1', '2', '37', '王柏崴', '1', '510400201330110481', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('549', '1', '2', '37', '侯梦兰', '0', '510400201330120445', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('550', '1', '2', '37', '朱贵萍', '0', '510400201330120499', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('551', '1', '2', '37', '王语然', '0', '510400201330120485', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('552', '1', '2', '37', '陈景', '0', '510400201330120451', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('553', '1', '2', '37', '邓瑞林', '1', '510400201330110454', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('554', '1', '2', '37', '刘佳', '0', '510400201330120467', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('555', '1', '2', '37', '刘忞朋', '1', '510400201330110468', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('556', '1', '2', '37', '李馥江', '0', '510400201330120461', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('557', '1', '2', '37', '邓诗瀚', '1', '510400201330110455', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('558', '1', '2', '37', '彭丹', '0', '510400201330120475', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('559', '1', '2', '37', '王双铭', '1', '510400201330110484', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('560', '1', '2', '37', '张习凤', '0', '510400201330120495', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('561', '1', '2', '37', '吴雨桐', '1', '510400201330110488', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('562', '1', '2', '37', '陈瑞阳', '1', '510400201330110452', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('563', '1', '2', '37', '郭新月', '0', '510400201330120457', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('564', '1', '2', '37', '卢思宇', '1', '510400201330110470', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('565', '1', '2', '37', '马友寿', '1', '510400201330110449', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('566', '1', '2', '37', '赵洪彦', '0', '510400201330120876', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('567', '1', '2', '37', '黄瑶', '0', '510400201330120458', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('568', '1', '2', '37', '王辽森', '1', '510400201330110482', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('569', '1', '2', '37', '马小清', '0', '510400201330120448', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('570', '1', '2', '37', '李浩', '1', '510400201330110463', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('571', '1', '2', '37', '王诗婷', '0', '510400201330120483', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('572', '1', '2', '37', '谢磊', '1', '510400201330110490', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('573', '1', '2', '37', '钟可儿', '0', '510400201330120497', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('574', '1', '2', '37', '吴杰', '1', '510400201330110487', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('575', '1', '2', '37', '宋妍如', '0', '510400201330120476', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('576', '1', '2', '37', '刘辰', '1', '510400201330110869', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('577', '1', '2', '37', '张明恒', '1', '510400201330110875', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('578', '1', '2', '37', '唐大宇', '1', '510400201330110478', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('579', '1', '2', '37', '刘芷璇', '0', '510400201330120469', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('580', '1', '2', '37', '郭芯妤', '0', '510400201330120870', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('581', '1', '2', '37', '周子琳', '0', '510400201330120877', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('582', '1', '2', '37', '母奇东', '1', '510400201330110873', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('583', '1', '2', '37', '李震宇', '1', '510400201330110871', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('584', '1', '2', '37', '刘奕宏', '0', '510400201330120872', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('585', '1', '2', '37', '李思璇', '0', 'pzhsz00018', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('586', '1', '2', '37', '苟镭', '1', 'pzhsz00019', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('587', '1', '2', '38', '雷峥', '1', '510400201330110515', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('588', '1', '2', '38', '郭晋龙', '1', '510400201330110500', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('589', '1', '2', '38', '姚静', '0', '510400201330120548', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('590', '1', '2', '38', '李沐紫', '0', '510400201330120519', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('591', '1', '2', '38', '庞源', '1', '510400201330110533', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('592', '1', '2', '38', '陈文', '1', '510400201330110507', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('593', '1', '2', '38', '杨倩', '0', '510400201330120546', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('594', '1', '2', '38', '刘柯妤', '0', '510400201330120525', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('595', '1', '2', '38', '梁峻菠', '1', '510400201330110522', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('596', '1', '2', '38', '程浩', '1', '510400201330110512', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('597', '1', '2', '38', '李诗雨', '0', '510400201330120501', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('598', '1', '2', '38', '詹洁', '0', '510400201330120550', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('599', '1', '2', '38', '胥峰溢', '1', '510400201330110542', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('600', '1', '2', '38', '李飞', '1', '510400201330110516', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('601', '1', '2', '38', '龙靖', '0', '510400201330120505', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('602', '1', '2', '38', '卢柘屹', '1', '510400201330110529', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('603', '1', '2', '38', '项渝茜', '0', '510400201330120540', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('604', '1', '2', '38', '刘益多', '1', '510400201330110527', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('605', '1', '2', '38', '刘梦婷', '0', '510400201330120503', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('606', '1', '2', '38', '赵铭卓', '1', '510400201330110554', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('607', '1', '2', '38', '夏丹婷', '0', '510400201330120539', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('608', '1', '2', '38', '张登', '1', '510400201330110551', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('609', '1', '2', '38', '柳婷', '0', '510400201330120504', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('610', '1', '2', '38', '刘明皓', '1', '510400201330110526', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('611', '1', '2', '38', '李怡亭', '0', '510400201330120521', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('612', '1', '2', '38', '刘智宜', '1', '510400201330110528', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('613', '1', '2', '38', '赵欢', '0', '510400201330120506', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('614', '1', '2', '38', '陈虹锦', '0', '510400201330120555', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('615', '1', '2', '38', '罗源丰', '1', '510400201330110531', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('616', '1', '2', '38', '马洛萌', '0', '510400201330120532', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('617', '1', '2', '38', '詹国鑫', '1', '510400201330110549', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('618', '1', '2', '38', '王玉洁', '0', '510400201330120886', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('619', '1', '2', '38', '杨宜欣', '1', '510400201330110547', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('620', '1', '2', '38', '李清珠', '0', '510400201330120520', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('621', '1', '2', '38', '李秀竹', '0', '510400201330120502', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('622', '1', '2', '38', '罗浩宇', '1', '510400201330110530', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('623', '1', '2', '38', '陈玥', '0', '510400201330120511', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('624', '1', '2', '38', '刘凡', '1', '510400201330110524', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('625', '1', '2', '38', '李金津', '0', '510400201330120517', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('626', '1', '2', '38', '彭波', '1', '510400201330110534', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('627', '1', '2', '38', '秦诗韵', '0', '510400201330120535', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('628', '1', '2', '38', '杨东', '1', '510400201330110545', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('629', '1', '2', '38', '严习井', '0', '510400201330120544', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('630', '1', '2', '38', '李科', '1', '510400201330110518', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('631', '1', '2', '38', '杨洪海', '1', '510400201330110887', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('632', '1', '2', '38', '张鹏', '1', '510400201330110552', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('633', '1', '2', '38', '张婉诗', '0', '510400201330120553', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('634', '1', '2', '38', '代文远', '1', '510400201330110513', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('635', '1', '2', '38', '廖熊', '0', '510400201330120523', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('636', '1', '2', '38', '陈芋融', '0', '510400201330120510', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('637', '1', '2', '38', '任嘉敏', '0', '510400201330120536', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('638', '1', '2', '38', '高乐金', '1', '510400201330110879', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('639', '1', '2', '38', '严习', '0', '510400201330120543', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('640', '1', '2', '38', '肖涵', '1', '510400201330110541', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('641', '1', '2', '38', '胡鹏', '1', '510400201330110880', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('642', '1', '2', '38', '蒋琳', '0', '510400201330120514', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('643', '1', '2', '38', '陈鑫', '1', '510400201330110508', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('644', '1', '2', '38', '陈泳吉', '1', '510400201330110509', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('645', '1', '2', '38', '汪柳岑', '0', '510400201330120537', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('646', '1', '2', '38', '王麒宇', '1', '510400201330110885', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('647', '1', '2', '38', '唐静宜', '0', '510400201330120883', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('648', '1', '2', '38', '蔚林峰', '1', '510400201330110538', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('649', '1', '2', '38', '蒲李莉', '0', '510400201330120881', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('650', '1', '2', '38', '王丞疆', '1', '510400201330110884', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('651', '1', '2', '38', '代旻明', '0', '510400201330120878', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('652', '1', '2', '38', '施可', '1', '510400201330110882', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('653', '1', '2', '38', '唐铭', '0', 'pzhsz00020', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('654', '1', '2', '39', '肖鸿锋', '1', '510400201330110916', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('655', '1', '2', '39', '雷钰', '0', '510400201330120560', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('656', '1', '2', '39', '李文俊', '1', '510400201330110563', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('657', '1', '2', '39', '雷婕', '0', '510400201330120559', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('658', '1', '2', '39', '郑啟明', '1', '510400201330110577', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('659', '1', '2', '39', '李寿竹', '0', '510400201330120562', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('660', '1', '2', '39', '蒲恒斌', '1', '510400201330110568', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('661', '1', '2', '39', '李想', '0', '510400201330120564', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('662', '1', '2', '39', '刘思伽', '1', '510400201330110566', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('663', '1', '2', '39', '魏国楠', '1', '510400201330110572', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('664', '1', '2', '39', '罗天姿', '0', '510400201330120567', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('665', '1', '2', '39', '李鑫', '1', '510400201330110565', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('666', '1', '2', '39', '赵思齐', '0', '510400201330120926', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('667', '1', '2', '39', '尤乾敏', '0', '510400201330120576', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('668', '1', '2', '39', '谢磊', '1', '510400201330110574', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('669', '1', '2', '39', '宋德仙', '0', '510400201330120569', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('670', '1', '2', '39', '陈俊辰', '1', '510400201330110557', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('671', '1', '2', '39', '何孟雪', '0', '510400201330120558', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('672', '1', '2', '39', '吴豪', '0', '510400201330120573', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('673', '1', '2', '39', '朱文静', '0', '510400201330120927', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('674', '1', '2', '39', '石川', '1', '510400201330110911', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:29', '1');
INSERT INTO `info_student` VALUES ('675', '1', '2', '39', '杨开碧', '0', '510400201330120575', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('676', '1', '2', '39', '李剑敖', '1', '510400201330110561', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('677', '1', '2', '39', '王杨', '1', '510400201330110570', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('678', '1', '2', '39', '魏丹', '0', '510400201330120571', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('679', '1', '2', '39', '粟颖聪', '0', '510400201330120913', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('680', '1', '2', '39', '武睿', '1', '510400201330110915', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('681', '1', '2', '39', '陈璐嘉', '0', '510400201330120890', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('682', '1', '2', '39', '金玲', '0', '510400201330120902', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('683', '1', '2', '39', '刘明辉', '1', '510400201330110906', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('684', '1', '2', '39', '张淦钦', '1', '510400201330110924', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('685', '1', '2', '39', '程裔珏', '0', '510400201330120892', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('686', '1', '2', '39', '何易航', '1', '510400201330110897', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('687', '1', '2', '39', '蔡思怡', '0', '510400201330120556', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('688', '1', '2', '39', '何阳', '1', '510400201330110896', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('689', '1', '2', '39', '樊嘉欣', '0', '510400201330120895', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('690', '1', '2', '39', '孙帝曦', '1', '510400201330110914', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('691', '1', '2', '39', '余彦林', '0', '510400201330120923', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('692', '1', '2', '39', '谢远冲', '1', '510400201330110918', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('693', '1', '2', '39', '史程熙', '0', '510400201330120912', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('694', '1', '2', '39', '刘静婷', '0', '510400201330120905', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('695', '1', '2', '39', '游德麟', '1', '510400201330110922', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('696', '1', '2', '39', '尹俪橦', '0', '510400201330120921', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('697', '1', '2', '39', '何震寰', '1', '510400201330110898', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('698', '1', '2', '39', '刘子谦', '1', '510400201330110908', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('699', '1', '2', '39', '胡大岳', '1', '510400201330110899', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('700', '1', '2', '39', '张鑫', '0', '510400201330120925', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('701', '1', '2', '39', '蒋泽骁', '1', '510400201330110901', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('702', '1', '2', '39', '杜秋潼', '0', '510400201330120894', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('703', '1', '2', '39', '邱科宾', '1', '510400201330110910', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('704', '1', '2', '39', '杨睿', '0', '510400201330120919', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('705', '1', '2', '39', '邹祎', '1', '510400201330110888', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('706', '1', '2', '39', '程韵竹', '0', '510400201330120893', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('707', '1', '2', '39', '李知书', '1', '510400201330110904', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('708', '1', '2', '39', '刘熠', '0', '510400201330120907', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('709', '1', '2', '39', '卢昕祎', '1', '510400201330110909', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('710', '1', '2', '39', '陈柏宇', '1', '510400201330110889', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('711', '1', '2', '39', '李剑琴', '0', '510400201330120903', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('712', '1', '2', '39', '成林骏', '1', '510400201330110891', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('713', '1', '2', '39', '杨旭东', '1', '510400201330110920', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('714', '1', '2', '39', '姜孟琳', '0', '510400201330120900', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('715', '1', '2', '39', '谢雪娇', '0', '510400201330120917', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('716', '1', '2', '40', '周佳豹', '1', '510400201330110600', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('717', '1', '2', '40', '邹明君', '1', '510400201330110601', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('718', '1', '2', '40', '段翔', '0', '510400201330120580', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('719', '1', '2', '40', '张子荐', '1', '510400201330110597', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('720', '1', '2', '40', '汤雪纯', '0', '510400201330120946', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('721', '1', '2', '40', '张颖', '0', '510400201330120596', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('722', '1', '2', '40', '关翔峰', '1', '510400201330110581', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('723', '1', '2', '40', '田茜', '0', '510400201330120591', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('724', '1', '2', '40', '唐川东', '1', '510400201330110590', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('725', '1', '2', '40', '熊高杰', '1', '510400201330110593', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('726', '1', '2', '40', '聂梦倩', '0', '510400201330120587', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('727', '1', '2', '40', '黄乙峰', '1', '510400201330110583', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('728', '1', '2', '40', '关雅', '0', '510400201330120582', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('729', '1', '2', '40', '邱云岭', '1', '510400201330110589', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('730', '1', '2', '40', '杜玟瑾', '0', '510400201330120598', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('731', '1', '2', '40', '李颖', '0', '510400201330120585', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('732', '1', '2', '40', '王梓丞', '1', '510400201330110592', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('733', '1', '2', '40', '李露', '0', '510400201330120937', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('734', '1', '2', '40', '周宏玮', '0', '510400201330120599', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('735', '1', '2', '40', '李军燕', '0', '510400201330120584', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('736', '1', '2', '40', '刘欣雨', '0', '510400201330120578', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('737', '1', '2', '40', '张家铬', '1', '510400201330110595', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('738', '1', '2', '40', '蒲高钰', '1', '510400201330110588', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('739', '1', '2', '40', '周岚馨', '0', '510400201330120965', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('740', '1', '2', '40', '陈向华', '1', '510400201330110579', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('741', '1', '2', '40', '魏潘婷', '0', '510400201330120952', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('742', '1', '2', '40', '邓慧婷', '0', '510400201330120932', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('743', '1', '2', '40', '杨岱礼', '1', '510400201330110954', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('744', '1', '2', '40', '杨岚', '0', '510400201330120955', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('745', '1', '2', '40', '刘尧颖', '0', '510400201330120942', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('746', '1', '2', '40', '赵源毅', '0', '510400201330120964', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('747', '1', '2', '40', '杨颖攀', '1', '510400201330110594', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('748', '1', '2', '40', '余锦年', '1', '510400201330110959', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('749', '1', '2', '40', '万清淋', '0', '510400201330120948', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('750', '1', '2', '40', '马珊珊', '0', '510400201330120945', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('751', '1', '2', '40', '王浚宇', '1', '510400201330110951', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('752', '1', '2', '40', '夏彬杰', '1', '510400201330110953', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('753', '1', '2', '40', '刘姝妤', '0', '510400201330120941', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('754', '1', '2', '40', '罗清徽', '1', '510400201330110586', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('755', '1', '2', '40', '王涵', '0', '510400201330120949', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('756', '1', '2', '40', '张筝芷', '0', '510400201330120963', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('757', '1', '2', '40', '李锐', '1', '510400201330110938', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('758', '1', '2', '40', '蒋安妮', '0', '510400201330120936', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('759', '1', '2', '40', '甘俊鹏', '1', '510400201330110933', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('760', '1', '2', '40', '张思洋', '1', '510400201330110961', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('761', '1', '2', '40', '杨镒光', '1', '510400201330110958', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('762', '1', '2', '40', '李亚', '0', '510400201330120939', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('763', '1', '2', '40', '陈羿文', '1', '510400201330110930', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('764', '1', '2', '40', '任文竹', '0', '510400201330120928', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('765', '1', '2', '40', '汪飞宇', '1', '510400201330110929', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('766', '1', '2', '40', '林涵', '1', '510400201330110940', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('767', '1', '2', '40', '何采怡', '0', '510400201330120934', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('768', '1', '2', '40', '陈跃林', '1', '510400201330110931', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('769', '1', '2', '40', '王婷', '0', '510400201330120950', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('770', '1', '2', '40', '张馨予', '0', '510400201330120962', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('771', '1', '2', '40', '朱杰', '1', '510400201330110966', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('772', '1', '2', '40', '张皓钦', '1', '510400201330110960', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('773', '1', '2', '40', '刘羽涵', '0', '510400201330120943', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('774', '1', '2', '40', '黄治霖', '1', '510400201330110935', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('775', '1', '2', '40', '杨珉', '1', '510400201330110956', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('776', '1', '2', '40', '杨盛钧', '1', '510400201330110957', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('777', '1', '2', '40', '罗曼诗韵', '0', '510400201330120944', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('778', '1', '2', '40', '唐彬', '1', '510400201330110947', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('779', '1', '2', '41', '郭世鹏', '1', '510400201330110608', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('780', '1', '2', '41', '刘玲', '0', '510400201330120616', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('781', '1', '2', '41', '李卓城', '1', '510400201330110614', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('782', '1', '2', '41', '廖敏', '0', '510400201330120615', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('783', '1', '2', '41', '杨春玲', '0', '510400201330120622', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('784', '1', '2', '41', '冯嘉伟', '1', '510400201330110605', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('785', '1', '2', '41', '陆泳屹', '0', '510400201330120618', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('786', '1', '2', '41', '冯翔宇', '1', '510400201330110606', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('787', '1', '2', '41', '曾新亮', '1', '510400201330110968', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('788', '1', '2', '41', '付海兰', '0', '510400201330120607', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('789', '1', '2', '41', '王培宇', '1', '510400201330110620', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('790', '1', '2', '41', '李爽', '0', '510400201330120612', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('791', '1', '2', '41', '蒋钟军', '1', '510400201330110611', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('792', '1', '2', '41', '刘露遥', '0', '510400201330120617', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('793', '1', '2', '41', '何林蔓', '0', '510400201330120609', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('794', '1', '2', '41', '徐丹', '0', '510400201330120621', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('795', '1', '2', '41', '罗雅', '0', '510400201330120986', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('796', '1', '2', '41', '陆星宇', '1', '510400201330110602', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('797', '1', '2', '41', '廖光菊', '0', '510400201330120981', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('798', '1', '2', '41', '张晴晴', '0', '510400201330120623', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('799', '1', '2', '41', '李先发', '1', '510400201330110613', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('800', '1', '2', '41', '张旭', '1', '510400201330110624', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('801', '1', '2', '41', '蒋金宏', '1', '510400201330110610', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('802', '1', '2', '41', '李月如', '0', '510400201330120979', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('803', '1', '2', '41', '刘玥岑', '0', '510400201330120983', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('804', '1', '2', '41', '何天扬', '1', '510400201330110973', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('805', '1', '2', '41', '倪畅', '0', '510400201330120619', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('806', '1', '2', '41', '陈高艳', '0', '510400201330120603', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('807', '1', '2', '41', '辜睿', '1', '510400201330110972', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('808', '1', '2', '41', '于姗姗', '0', '510400201330121001', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('809', '1', '2', '41', '汪阳', '0', '510400201330120990', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('810', '1', '2', '41', '吴思灏', '1', '510400201330110994', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('811', '1', '2', '41', '邹宇骋', '1', '510400201330111004', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('812', '1', '2', '41', '瞿春宇', '0', '510400201330120988', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('813', '1', '2', '41', '付月', '0', '510400201330120970', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('814', '1', '2', '41', '黄莉捷', '0', '510400201330120975', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('815', '1', '2', '41', '彭溢', '1', '510400201330110987', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('816', '1', '2', '41', '雍楚晗', '0', '510400201330121000', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('817', '1', '2', '41', '戈心悦', '0', '510400201330120971', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('818', '1', '2', '41', '程宇鑫', '1', '510400201330110969', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:30', '1');
INSERT INTO `info_student` VALUES ('819', '1', '2', '41', '娄艺耀', '1', '510400201330110984', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('820', '1', '2', '41', '夏湘宁', '0', '510400201330120995', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('821', '1', '2', '41', '迟海', '0', '510400201330120604', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('822', '1', '2', '41', '张峻川', '1', '510400201330111002', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('823', '1', '2', '41', '颜镜恒', '1', '510400201330110997', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('824', '1', '2', '41', '刘柏林', '1', '510400201330110982', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('825', '1', '2', '41', '郑红攀', '0', '510400201330121003', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('826', '1', '2', '41', '王兰司', '0', '510400201330120991', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('827', '1', '2', '41', '雷政达', '1', '510400201330110977', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('828', '1', '2', '41', '徐溯', '0', '510400201330120996', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('829', '1', '2', '41', '江柯辛', '1', '510400201330110976', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('830', '1', '2', '41', '唐潘豪', '1', '510400201330110989', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('831', '1', '2', '41', '李宗正', '1', '510400201330110980', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('832', '1', '2', '41', '李明泽', '1', '510400201330110978', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('833', '1', '2', '41', '叶倚晨', '0', '510400201330120999', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('834', '1', '2', '41', '王雪蔚', '0', '510400201330120992', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('835', '1', '2', '41', '罗庆峰', '1', '510400201330110985', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('836', '1', '2', '41', '邱奕宁', '0', 'pzhsz00021', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('837', '1', '2', '41', '王耀苇', '1', '510400201330110993', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('838', '1', '2', '41', '黄嘉钰', '0', '510400201330120974', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('839', '1', '2', '41', '颜铭江', '1', '510400201330110998', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('840', '1', '2', '42', '施浩', '1', '510400201330110639', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('841', '1', '2', '42', '邓豪', '1', '510400201330110629', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('842', '1', '2', '42', '田佳乐', '0', '510400201330120645', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('843', '1', '2', '42', '韩晓茜', '0', '510400201330120632', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('844', '1', '2', '42', '马晓旭', '1', '510400201330110637', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('845', '1', '2', '42', '夏源', '0', '510400201330120626', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('846', '1', '2', '42', '廖科', '1', '510400201330110635', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('847', '1', '2', '42', '谭雨欣', '0', '510400201330121025', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('848', '1', '2', '42', '唐清杨', '1', '510400201330110643', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('849', '1', '2', '42', '唐久然', '1', '510400201330110642', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('850', '1', '2', '42', '杨璐萌', '0', '510400201330120649', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('851', '1', '2', '42', '张皓宇', '1', '510400201330111034', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('852', '1', '2', '42', '王叶青', '0', '510400201330120647', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('853', '1', '2', '42', '庞勤明', '1', '510400201330110638', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('854', '1', '2', '42', '李雯涛', '0', '510400201330120634', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('855', '1', '2', '42', '吴雨朦', '0', '510400201330120648', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('856', '1', '2', '42', '唐润超', '1', '510400201330110644', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('857', '1', '2', '42', '宋军钢', '1', '510400201330110641', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('858', '1', '2', '42', '安智芸', '0', '510400201330120627', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('859', '1', '2', '42', '王何', '0', '510400201330120625', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('860', '1', '2', '42', '张玲', '0', '510400201330120651', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('861', '1', '2', '42', '万娇', '0', '510400201330120646', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('862', '1', '2', '42', '舒玉林', '0', '510400201330120640', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('863', '1', '2', '42', '李彬', '1', '510400201330110633', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('864', '1', '2', '42', '张航', '1', '510400201330110650', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('865', '1', '2', '42', '董成丽', '0', '510400201330120630', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('866', '1', '2', '42', '付智宇', '1', '510400201330111007', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('867', '1', '2', '42', '王思懿', '0', '510400201330121027', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('868', '1', '2', '42', '哈玟西', '0', '510400201330121010', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('869', '1', '2', '42', '葛欣怡', '0', '510400201330120631', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('870', '1', '2', '42', '张茂文', '1', '510400201330110652', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('871', '1', '2', '42', '蒲培松', '1', '510400201330111020', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('872', '1', '2', '42', '龚爱梅', '0', '510400201330121009', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('873', '1', '2', '42', '陈贵缘', '0', '510400201330120628', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('874', '1', '2', '42', '池兆民', '1', '510400201330111006', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('875', '1', '2', '42', '李想', '0', '510400201330121014', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('876', '1', '2', '42', '孙梦圆', '0', '510400201330121024', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('877', '1', '2', '42', '张栋耀', '1', '510400201330111033', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('878', '1', '2', '42', '李丽娜', '0', '510400201330121013', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('879', '1', '2', '42', '赵栎棋', '1', '510400201330111035', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('880', '1', '2', '42', '唐煜', '0', '510400201330121005', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('881', '1', '2', '42', '吕柯男', '1', '510400201330110636', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('882', '1', '2', '42', '肖金池', '1', '510400201330111030', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('883', '1', '2', '42', '雷子艺', '0', '510400201330121012', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('884', '1', '2', '42', '舒钰涵', '0', '510400201330121023', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('885', '1', '2', '42', '刘浩东', '1', '510400201330111016', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('886', '1', '2', '42', '唐诗婕', '0', '510400201330121026', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('887', '1', '2', '42', '李旭', '1', '510400201330111015', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('888', '1', '2', '42', '高昕玉', '0', '510400201330121008', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('889', '1', '2', '42', '谢宇翔', '1', '510400201330111032', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('890', '1', '2', '42', '王梓屹', '1', '510400201330111028', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('891', '1', '2', '42', '文艺', '0', '510400201330121029', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('892', '1', '2', '42', '刘浪', '1', '510400201330111017', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('893', '1', '2', '42', '史薪煜', '0', '510400201330121022', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('894', '1', '2', '42', '张子勃', '1', '510400201330110653', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('895', '1', '2', '42', '史翰文', '1', '510400201330111021', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('896', '1', '2', '42', '谢汶玲', '0', '510400201330121031', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('897', '1', '2', '42', '蒋煜明', '1', '510400201330111011', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('898', '1', '2', '42', '刘奕含', '0', '510400201330121018', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('899', '1', '2', '42', '黄奕睿', '1', '510400201330110654', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('900', '1', '2', '43', '梁宇翔', '1', '510400201330110666', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('901', '1', '2', '43', '杨佳航', '1', '510400201330110660', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('902', '1', '2', '43', '谢鲜', '0', '510400201330120659', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('903', '1', '2', '43', '何思奇', '1', '510400201330110663', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('904', '1', '2', '43', '任钇潼', '0', '510400201330120671', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('905', '1', '2', '43', '周伟彬', '1', '510400201330110680', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('906', '1', '2', '43', '黄月', '0', '510400201330120657', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('907', '1', '2', '43', '刘科', '1', '510400201330110667', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('908', '1', '2', '43', '赵峻民', '1', '510400201330110679', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('909', '1', '2', '43', '王语佳', '0', '510400201330120676', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('910', '1', '2', '43', '王海波', '1', '510400201330110674', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('911', '1', '2', '43', '潘罗', '0', '510400201330120670', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('912', '1', '2', '43', '谭翔宇', '1', '510400201330110672', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('913', '1', '2', '43', '冯柔', '0', '510400201330120655', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('914', '1', '2', '43', '李金昆', '1', '510400201330110665', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('915', '1', '2', '43', '隆勇彦', '0', '510400201330120669', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('916', '1', '2', '43', '苟正宇', '0', '510400201330110662', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('917', '1', '2', '43', '王瑞丰', '0', '510400201330120675', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('918', '1', '2', '43', '唐俊', '1', '510400201330110673', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('919', '1', '2', '43', '钟源', '1', '510400201330111066', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('920', '1', '2', '43', '张潇月', '0', '510400201330120678', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('921', '1', '2', '43', '龙荟', '0', '510400201330120668', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('922', '1', '2', '43', '马继许', '1', '510400201330110658', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('923', '1', '2', '43', '陈婷', '0', '510400201330120661', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('924', '1', '2', '43', '伍倩薇', '0', '510400201330120677', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('925', '1', '2', '43', '黄梓倩', '0', '510400201330121047', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('926', '1', '2', '43', '何力', '1', '510400201330110656', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('927', '1', '2', '43', '周子涵', '1', '510400201330111069', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('928', '1', '2', '43', '王雪蕊', '0', '510400201330121061', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('929', '1', '2', '43', '张帮琳', '0', '510400201330121041', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('930', '1', '2', '43', '祝寅凯', '1', '510400201330111070', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('931', '1', '2', '43', '孙菲悦', '0', '510400201330121056', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('932', '1', '2', '43', '姚毓', '1', '510400201330111040', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('933', '1', '2', '43', '夏頔', '1', '510400201330111062', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('934', '1', '2', '43', '何胜兰', '0', '510400201330121046', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('935', '1', '2', '43', '刘洋汐', '0', '510400201330121052', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('936', '1', '2', '43', '王柯', '1', '510400201330111059', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('937', '1', '2', '43', '周思齐', '0', '510400201330121068', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('938', '1', '2', '43', '索浩笙', '1', '510400201330111057', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('939', '1', '2', '43', '邹欣言', '0', '510400201330121071', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('940', '1', '2', '43', '李婷', '0', '510400201330121049', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('941', '1', '2', '43', '徐胜煜', '1', '510400201330111063', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('942', '1', '2', '43', '李坤芮', '0', '510400201330121048', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('943', '1', '2', '43', '曹辉', '1', '510400201330111043', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('944', '1', '2', '43', '谭鼎正', '1', '510400201330111058', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('945', '1', '2', '43', '于抒含', '0', '510400201330121064', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:31', '1');
INSERT INTO `info_student` VALUES ('946', '1', '2', '43', '高宇', '1', '510400201330111038', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('947', '1', '2', '43', '曾灏爻', '1', '510400201330111036', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('948', '1', '2', '43', '李政阳', '1', '510400201330111051', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('949', '1', '2', '43', '周文', '0', '510400201330121042', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('950', '1', '2', '43', '毛崟汀', '1', '510400201330111053', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('951', '1', '2', '43', '龚倍', '0', '510400201330121044', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('952', '1', '2', '43', '黄钰涵', '0', '510400201330121039', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('953', '1', '2', '43', '王平林', '1', '510400201330111060', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('954', '1', '2', '43', '郑皓匀', '1', '510400201330111065', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('955', '1', '2', '43', '周俊辰', '0', '510400201330121067', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('956', '1', '2', '43', '傅裕', '1', '510400201330111037', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('957', '1', '2', '43', '孟星舟', '1', '510400201330111054', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('958', '1', '2', '43', '黄淏楠', '1', '510400201330110664', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('959', '1', '2', '43', '李雨轩', '0', '510400201330121050', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('960', '1', '2', '43', '蒲柯君', '1', '510400201330111055', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('961', '1', '2', '43', '陈泊翰', '1', '510400201330111072', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('962', '1', '2', '43', '龚钰博', '0', '510400201330121045', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('963', '1', '2', '43', '李家武', '1', 'pzhsz00022', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('964', '1', '2', '44', '张雯捷', '0', '510400201330120707', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('965', '1', '2', '44', '李复林', '1', '510400201330110691', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('966', '1', '2', '44', '张海驰', '0', '510400201330120706', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('967', '1', '2', '44', '王自立', '1', '510400201330110700', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('968', '1', '2', '44', '陈楠', '0', '510400201330120683', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('969', '1', '2', '44', '杨丰瑞', '1', '510400201330110702', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('970', '1', '2', '44', '黄植', '0', '510400201330120689', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('971', '1', '2', '44', '代晴', '0', '510400201330120685', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('972', '1', '2', '44', '闵浩珂', '1', '510400201330110695', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('973', '1', '2', '44', '韩明洲', '1', '510400201330111078', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('974', '1', '2', '44', '杨子寅', '1', '510400201330110704', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('975', '1', '2', '44', '李泽榕', '0', '510400201330120692', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('976', '1', '2', '44', '邱涌森', '1', '510400201330110696', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('977', '1', '2', '44', '张小梅', '0', '510400201330120708', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('978', '1', '2', '44', '何谦', '0', '510400201330120688', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('979', '1', '2', '44', '陈怡帆', '1', '510400201330110684', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('980', '1', '2', '44', '林子琪', '0', '510400201330120693', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('981', '1', '2', '44', '王俊杰', '1', '510400201330110699', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('982', '1', '2', '44', '郭丹', '0', '510400201330120687', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('983', '1', '2', '44', '李惠芸', '0', '510400201330121081', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('984', '1', '2', '44', '杨小刚', '1', '510400201330110703', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('985', '1', '2', '44', '杨霄', '0', '510400201330120681', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('986', '1', '2', '44', '鲍金梅', '0', '510400201330120682', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('987', '1', '2', '44', '孙昭', '1', '510400201330110697', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('988', '1', '2', '44', '胥诺', '0', '510400201330120701', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('989', '1', '2', '44', '李彦佳', '0', '510400201330121083', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('990', '1', '2', '44', '高蕴琦', '0', '510400201330120686', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('991', '1', '2', '44', '钱瑞康', '1', '510400201330111087', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('992', '1', '2', '44', '余卓林', '1', '510400201330110705', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('993', '1', '2', '44', '王梦书', '1', '510400201330111089', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('994', '1', '2', '44', '田凌菥', '0', '510400201330120698', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('995', '1', '2', '44', '谢飞', '1', '510400201330111095', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('996', '1', '2', '44', '陈奕璇', '0', '510400201330121074', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('997', '1', '2', '44', '王科婷', '0', '510400201330121088', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('998', '1', '2', '44', '姚智馨', '1', '510400201330111098', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('999', '1', '2', '44', '夏子寒', '0', '510400201330121093', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1000', '1', '2', '44', '胡安镝', '1', '510400201330111079', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1001', '1', '2', '44', '徐小棣', '0', '510400201330121096', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1002', '1', '2', '44', '钟羽丰', '0', '510400201330121102', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1003', '1', '2', '44', '袁航', '1', 'pzhsz00023', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1004', '1', '2', '44', '禇怡帆', '1', '510400201330111101', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1005', '1', '2', '44', '袁浩', '1', '510400201330111099', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1006', '1', '2', '44', '刘芷含', '0', '510400201330120694', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1007', '1', '2', '44', '王显博', '1', '510400201330111090', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1008', '1', '2', '44', '杨小钵', '1', '510400201330111097', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1009', '1', '2', '44', '崔馨月', '0', '510400201330121075', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1010', '1', '2', '44', '寇怀旻', '1', '510400201330110690', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1011', '1', '2', '44', '韦懿芯', '0', '510400201330121091', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1012', '1', '2', '44', '吴浩宇', '1', '510400201330111092', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1013', '1', '2', '44', '母紫薇', '0', '510400201330121086', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1014', '1', '2', '44', '李镇佑', '1', '510400201330111084', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1015', '1', '2', '44', '陈虹宇', '1', '510400201330111073', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1016', '1', '2', '44', '李和森', '1', '510400201330111080', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1017', '1', '2', '44', '段奕宏', '1', '510400201330111076', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1018', '1', '2', '44', '李佩恒', '1', '510400201330111082', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1019', '1', '2', '44', '刘宸希', '0', '510400201330121085', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1020', '1', '2', '44', '高宇扬', '1', '510400201330111077', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1021', '1', '2', '44', '赵柔婷', '0', '510400201330121100', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1022', '1', '2', '44', '周智豪', '1', '510400201330111103', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1023', '1', '2', '44', '肖霞', '0', '510400201330121094', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1024', '1', '2', '44', '宋岱维', '1', 'pzhsz00024', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1025', '1', '2', '44', '李轩冉', '1', 'pzhsz00025', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1026', '1', '2', '45', '程上镔', '1', '510400201330111115', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1027', '1', '2', '45', '何娜', '0', '510400201330120709', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1028', '1', '2', '45', '何杰', '0', '510400201330121119', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1029', '1', '2', '45', '孙丽婷', '0', '510400201330121109', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1030', '1', '2', '45', '王凌', '0', '510400201330121143', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1031', '1', '2', '45', '李彬', '1', '510400201330111155', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1032', '1', '2', '45', '孔伟琼', '0', '510400201330120715', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1033', '1', '2', '45', '张欣妍', '0', '510400201330121152', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1034', '1', '2', '45', '印一凡', '1', '510400201330111110', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1035', '1', '2', '45', '何玥璇', '0', '510400201330121120', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1036', '1', '2', '45', '袁铭浩', '1', '510400201330111111', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1037', '1', '2', '45', '张纯', '0', '510400201330121149', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1038', '1', '2', '45', '谢谨鸿', '1', '510400201330111145', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1039', '1', '2', '45', '龙莹', '0', '510400201330120719', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1040', '1', '2', '45', '汪子欣', '0', '510400201330121142', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1041', '1', '2', '45', '赵敏', '0', '510400201330120720', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1042', '1', '2', '45', '李登臣', '1', '510400201330110716', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1043', '1', '2', '45', '周羽晗', '0', '510400201330121112', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1044', '1', '2', '45', '李云翔', '1', '510400201330111127', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1045', '1', '2', '45', '高俣林', '1', '510400201330111117', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1046', '1', '2', '45', '邓雯', '0', '510400201330121116', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1047', '1', '2', '45', '刘利俊', '1', '510400201330111131', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1048', '1', '2', '45', '李媛', '0', '510400201330120717', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1049', '1', '2', '45', '李东尧', '1', '510400201330111106', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1050', '1', '2', '45', '陈兰静', '0', '510400201330121113', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1051', '1', '2', '45', '杨洁', '0', '510400201330120711', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1052', '1', '2', '45', '张雷', '1', '510400201330111151', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1053', '1', '2', '45', '毛兴建', '1', '510400201330110710', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1054', '1', '2', '45', '陈玉燕', '0', '510400201330120712', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1055', '1', '2', '45', '张家俊', '1', '510400201330111150', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1056', '1', '2', '45', '李启航', '1', '510400201330111125', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1057', '1', '2', '45', '罗霞', '0', '510400201330121134', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1058', '1', '2', '45', '胡超', '1', '510400201330110714', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1059', '1', '2', '45', '杨黎康', '0', '510400201330121147', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1060', '1', '2', '45', '王萍', '0', '510400201330121144', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1061', '1', '2', '45', '胡慈航', '0', '510400201330121121', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1062', '1', '2', '45', '杨浩珑', '1', '510400201330111146', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1063', '1', '2', '45', '唐晓宇', '0', '510400201330121140', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1064', '1', '2', '45', '何金戌', '1', '510400201330111154', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1065', '1', '2', '45', '郭建洲', '1', '510400201330111118', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1066', '1', '2', '45', '唐月', '0', '510400201330121141', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1067', '1', '2', '45', '陈序祥', '1', '510400201330111104', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1068', '1', '2', '45', '黄昌华', '1', '510400201330111122', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1069', '1', '2', '45', '凌一鸣', '0', '510400201330121128', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1070', '1', '2', '45', '黄丹', '0', '510400201330121123', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1071', '1', '2', '45', '唐浩铭', '1', '510400201330111139', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1072', '1', '2', '45', '刘婕', '0', '510400201330121129', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1073', '1', '2', '45', '李超锋', '1', '510400201330111124', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1074', '1', '2', '45', '聂富宁', '1', '510400201330111108', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1075', '1', '2', '45', '谭崟俊', '1', '510400201330111138', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1076', '1', '2', '45', '张钰晨', '1', '510400201330111153', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1077', '1', '2', '45', '孙佩玲', '0', '510400201330121137', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1078', '1', '2', '45', '方美懿', '0', '510400201330121105', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1079', '1', '2', '45', '刘梓桐', '0', '510400201330120718', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1080', '1', '2', '45', '陈禹', '1', '510400201330111114', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1081', '1', '2', '45', '鹿凤鑫', '0', '510400201330121133', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1082', '1', '2', '45', '张蓓', '0', '510400201330121148', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1083', '1', '2', '45', '范铁平', '1', '510400201330110713', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1084', '1', '2', '45', '苏筱涵', '1', '510400201330111136', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1085', '1', '2', '45', '冉茂淳', '1', '510400201330111135', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1086', '1', '2', '45', '廖若雅', '0', '510400201330121107', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1087', '1', '2', '45', '刘美伶', '0', '510400201330121132', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1088', '1', '2', '45', '刘静波', '1', '510400201330111130', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:32', '1');
INSERT INTO `info_student` VALUES ('1089', '1', '2', '45', '李思璇', '0', '510400201330121126', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1090', '1', '2', '46', '陈静', '0', '510400201330121161', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1091', '1', '2', '46', '程春烨', '1', '510400201330111163', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1092', '1', '2', '46', '陈彦圻', '1', '510400201330110724', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1093', '1', '2', '46', '张淳', '0', '510400201330120737', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1094', '1', '2', '46', '李世兰', '0', '510400201330120728', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1095', '1', '2', '46', '李明兆', '1', '510400201330111174', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1096', '1', '2', '46', '徐小丽', '0', '510400201330120735', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1097', '1', '2', '46', '黄兰杰', '0', '510400201330120726', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1098', '1', '2', '46', '田思杰', '1', '510400201330111189', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1099', '1', '2', '46', '谯夕然', '0', '510400201330121184', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1100', '1', '2', '46', '徐晨阳', '1', '510400201330111192', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1101', '1', '2', '46', '钟紫璇', '0', '510400201330121198', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1102', '1', '2', '46', '阙清双', '1', '510400201330111185', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1103', '1', '2', '46', '刘杨', '0', '510400201330121156', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1104', '1', '2', '46', '张淡豪', '1', '510400201330111196', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1105', '1', '2', '46', '王婷婷', '0', '510400201330120732', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1106', '1', '2', '46', '凌之岚', '0', '510400201330121177', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1107', '1', '2', '46', '谢佳', '0', '510400201330120734', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1108', '1', '2', '46', '贺壬智', '1', '510400201330110725', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1109', '1', '2', '46', '谢义嘉', '1', '510400201330111158', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1110', '1', '2', '46', '曾雨虹', '0', '510400201330121159', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1111', '1', '2', '46', '姚富安', '1', '510400201330110723', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1112', '1', '2', '46', '郭黛蝶', '0', '510400201330121168', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1113', '1', '2', '46', '严明霖', '0', '510400201330121193', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1114', '1', '2', '46', '张强', '1', '510400201330110738', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1115', '1', '2', '46', '史佩玉', '0', '510400201330120731', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1116', '1', '2', '46', '李博文', '1', '510400201330111172', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1117', '1', '2', '46', '马娇娇', '0', '510400201330121180', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1118', '1', '2', '46', '陈文强', '1', '510400201330110721', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1119', '1', '2', '46', '李立学', '1', '510400201330110727', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1120', '1', '2', '46', '刘悦', '0', '510400201330120730', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1121', '1', '2', '46', '张梓晗', '1', '510400201330110740', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1122', '1', '2', '46', '侯河金', '1', '510400201330110722', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1123', '1', '2', '46', '叶思言', '0', '510400201330120736', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1124', '1', '2', '46', '刘洋明', '1', '510400201330111157', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1125', '1', '2', '46', '陈星佚', '0', '510400201330121162', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1126', '1', '2', '46', '黄小珂', '0', '510400201330121169', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1127', '1', '2', '46', '管若辰', '0', '510400201330121167', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1128', '1', '2', '46', '康晟源', '1', '510400201330111171', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1129', '1', '2', '46', '梅世豪', '1', '510400201330111182', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1130', '1', '2', '46', '张诗敏', '0', '510400201330121197', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1131', '1', '2', '46', '范启明', '1', '510400201330111166', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1132', '1', '2', '46', '唐宇科', '1', '510400201330111187', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1133', '1', '2', '46', '张玉珊', '0', '510400201330120739', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1134', '1', '2', '46', '罗梓纭', '1', '510400201330111179', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1135', '1', '2', '46', '袁月', '0', '510400201330121195', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1136', '1', '2', '46', '梁尧', '0', '510400201330121176', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1137', '1', '2', '46', '江镇林', '1', '510400201330111170', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1138', '1', '2', '46', '马斓心', '0', '510400201330121181', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1139', '1', '2', '46', '莫与浩', '1', '510400201330111183', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1140', '1', '2', '46', '邹璐键', '1', '510400201330111199', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1141', '1', '2', '46', '王中鹏', '1', '510400201330111191', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1142', '1', '2', '46', '陈泓洁', '0', '510400201330121160', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1143', '1', '2', '46', '杨明钢', '1', '510400201330111194', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1144', '1', '2', '46', '王艺璇', '0', '510400201330120733', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1145', '1', '2', '46', '孙晨蔚', '0', '510400201330121186', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1146', '1', '2', '46', '李美熹', '0', '510400201330121173', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1147', '1', '2', '46', '程航', '1', '510400201330111164', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1148', '1', '2', '46', '田开友', '1', '510400201330111188', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1149', '1', '2', '46', '厉文倩', '0', '510400201330120729', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1150', '1', '2', '46', '王振宇', '1', '510400201330111190', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1151', '1', '2', '46', '李姝凝', '0', '510400201330121175', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1152', '1', '2', '46', '罗明航', '1', '510400201330111178', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1153', '1', '2', '46', '唐子豪', '1', 'pzhsz00026', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1154', '1', '2', '46', '程漪涵', '0', '510400201330121165', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1155', '1', '2', '47', '程婷婷', '0', '510400201330120742', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1156', '1', '2', '47', '曹文栋', '1', '510400201330111201', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1157', '1', '2', '47', '张莉悦', '0', '510400201330121238', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1158', '1', '2', '47', '邓思远', '1', '510400201330111206', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1159', '1', '2', '47', '范洁', '1', '510400201330111207', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1160', '1', '2', '47', '唐乙力', '0', '510400201330120754', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1161', '1', '2', '47', '蒲思洪', '0', '510400201330120751', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1162', '1', '2', '47', '罗晨泸', '0', '510400201330120750', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1163', '1', '2', '47', '胡佳宏', '0', '510400201330120745', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1164', '1', '2', '47', '刘金孟', '1', '510400201330110749', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1165', '1', '2', '47', '邹芳雅', '0', '510400201330120758', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1166', '1', '2', '47', '汤子樊', '1', '510400201330110753', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1167', '1', '2', '47', '游绍凯', '1', '510400201330110756', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1168', '1', '2', '47', '邹懿', '0', '510400201330121243', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1169', '1', '2', '47', '潘幸', '1', '510400201330110741', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1170', '1', '2', '47', '王娟', '0', '510400201330121221', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1171', '1', '2', '47', '熊雪羽', '0', '510400201330121229', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1172', '1', '2', '47', '钟楠', '0', '510400201330121241', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1173', '1', '2', '47', '郑雁秋', '1', '510400201330111240', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1174', '1', '2', '47', '王薇', '0', '510400201330121224', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1175', '1', '2', '47', '罗兴远', '1', '510400201330111216', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1176', '1', '2', '47', '向阳', '1', '510400201330111228', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1177', '1', '2', '47', '李梦铃', '0', '510400201330120748', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1178', '1', '2', '47', '奉玲玲', '0', '510400201330120743', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1179', '1', '2', '47', '秦帅斌', '1', '510400201330110752', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1180', '1', '2', '47', '伏聪', '1', '510400201330111208', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1181', '1', '2', '47', '王脘棋', '0', '510400201330121223', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1182', '1', '2', '47', '陈天云', '1', '510400201330111202', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1183', '1', '2', '47', '谷佳窈', '0', '510400201330120744', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1184', '1', '2', '47', '张雪', '0', '510400201330120757', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1185', '1', '2', '47', '邓海啸', '1', '510400201330111203', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1186', '1', '2', '47', '纪金昆', '1', '510400201330110746', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1187', '1', '2', '47', '王悦舟', '1', '510400201330111225', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1188', '1', '2', '47', '江越', '0', '510400201330121213', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1189', '1', '2', '47', '胥尤波', '1', '510400201330111230', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1190', '1', '2', '47', '莫涵涵', '0', '510400201330121218', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1191', '1', '2', '47', '李晓琳', '0', '510400201330121215', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1192', '1', '2', '47', '王鹏程', '1', '510400201330111222', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1193', '1', '2', '47', '江林静', '0', '510400201330121212', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1194', '1', '2', '47', '郭曦', '0', '510400201330121210', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1195', '1', '2', '47', '邓锦明', '1', '510400201330111205', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1196', '1', '2', '47', '高一铭', '1', '510400201330111209', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1197', '1', '2', '47', '韩昌霖', '1', '510400201330111211', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1198', '1', '2', '47', '向守瑞', '1', '510400201330111227', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1199', '1', '2', '47', '李佳欣', '0', '510400201330121214', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1200', '1', '2', '47', '杨轲涵', '0', '510400201330121233', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1201', '1', '2', '47', '游德骏', '1', '510400201330111236', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1202', '1', '2', '47', '季靓丽', '0', '510400201330120747', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1203', '1', '2', '47', '谭铭', '1', '510400201330111220', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1204', '1', '2', '47', '鲜雯', '0', '510400201330121226', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1205', '1', '2', '47', '姚宇航', '1', '510400201330111235', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1206', '1', '2', '47', '徐家伟', '1', '510400201330111232', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1207', '1', '2', '47', '包悦涵', '1', '510400201330111200', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1208', '1', '2', '47', '徐浩源', '1', '510400201330111231', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1209', '1', '2', '47', '赵雪岩', '0', '510400201330121239', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1210', '1', '2', '47', '周一帆', '0', '510400201330121242', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1211', '1', '2', '47', '邓杰', '1', '510400201330111204', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1212', '1', '2', '47', '杨茗', '0', '510400201330120755', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1213', '1', '2', '47', '余童', '0', '510400201330121237', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1214', '1', '2', '47', '罗雪平', '1', '510400201330111217', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1215', '1', '2', '47', '杨文武', '1', '510400201330111234', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1216', '1', '2', '48', '代颖', '0', '510400201330121249', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1217', '1', '2', '48', '周斯曼', '0', '510400201330121292', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1218', '1', '2', '48', '蔡宇航', '1', '510400201330111294', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:33', '1');
INSERT INTO `info_student` VALUES ('1219', '1', '2', '48', '程和煦', '1', '510400201330111248', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1220', '1', '2', '48', '吴心雅', '0', '510400201330121276', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1221', '1', '2', '48', '张珂雨', '0', '510400201330121286', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1222', '1', '2', '48', '罗力杰', '1', '510400201330110766', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1223', '1', '2', '48', '高健', '1', '510400201330111255', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1224', '1', '2', '48', '喻沁然', '0', '510400201330121285', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1225', '1', '2', '48', '胡箐', '0', '510400201330121256', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1226', '1', '2', '48', '杜梦', '0', '510400201330120761', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1227', '1', '2', '48', '赵一泽', '0', '510400201330121288', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1228', '1', '2', '48', '郑圳', '1', '510400201330110759', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1229', '1', '2', '48', '古俊', '1', '510400201330110762', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1230', '1', '2', '48', '李思蒙', '0', '510400201330121261', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1231', '1', '2', '48', '蒲嘉靖', '1', '510400201330110767', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1232', '1', '2', '48', '宁馨珏', '0', '510400201330121269', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1233', '1', '2', '48', '杨兰', '0', '510400201330120770', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1234', '1', '2', '48', '飞天静', '0', '510400201330121251', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1235', '1', '2', '48', '冉钶炜', '1', '510400201330111272', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1236', '1', '2', '48', '唐国腾', '1', '510400201330111273', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1237', '1', '2', '48', '李雨洲', '0', '510400201330121262', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1238', '1', '2', '48', '张语秋', '0', '510400201330121287', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1239', '1', '2', '48', '李聪', '1', '510400201330111258', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1240', '1', '2', '48', '郎超', '1', '510400201330110764', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1241', '1', '2', '48', '彭舒心', '0', '510400201330121270', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1242', '1', '2', '48', '杨洪', '1', '510400201330111282', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1243', '1', '2', '48', '王小丹', '0', '510400201330120769', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1244', '1', '2', '48', '何道宽', '1', '510400201330110763', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1245', '1', '2', '48', '滕露阳', '0', '510400201330120768', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1246', '1', '2', '48', '傅相钦', '1', '510400201330111254', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1247', '1', '2', '48', '董从群', '0', '510400201330120760', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1248', '1', '2', '48', '杨浩艺', '1', '510400201330111281', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1249', '1', '2', '48', '陈希', '0', '510400201330121247', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1250', '1', '2', '48', '冯根', '1', '510400201330111252', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1251', '1', '2', '48', '唐浩鸿', '1', '510400201330111274', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1252', '1', '2', '48', '陈程', '0', '510400201330121245', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1253', '1', '2', '48', '林玥', '0', '510400201330121265', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1254', '1', '2', '48', '姜正浩', '1', '510400201330111257', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1255', '1', '2', '48', '徐梦玲', '0', '510400201330121279', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1256', '1', '2', '48', '趙雲', '0', '510400201330121289', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1257', '1', '2', '48', '罗浩文', '1', '510400201330111267', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1258', '1', '2', '48', '姚瑶', '0', '510400201330121283', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1259', '1', '2', '48', '樊晨', '1', '510400201330111295', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1260', '1', '2', '48', '廖禹休', '1', '510400201330111263', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1261', '1', '2', '48', '周泽宇', '1', '510400201330111293', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1262', '1', '2', '48', '郑喻文', '0', '510400201330121290', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1263', '1', '2', '48', '徐天赐', '1', '510400201330111280', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1264', '1', '2', '48', '陈柯翰', '1', '510400201330111246', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1265', '1', '2', '48', '田欣玉', '0', '510400201330121244', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1266', '1', '2', '48', '乔雨', '0', '510400201330121271', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1267', '1', '2', '48', '刘哲瑞', '1', '510400201330110765', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1268', '1', '2', '48', '武嘉政', '0', '510400201330111277', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1269', '1', '2', '48', '林东阳', '1', '510400201330111264', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1270', '1', '2', '48', '余亚婕', '0', '510400201330121284', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1271', '1', '2', '48', '李立鹏', '1', '510400201330111260', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1272', '1', '2', '48', '邓宇婧', '0', '510400201330121250', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1273', '1', '2', '48', '谢佳伟', '1', '510400201330111278', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1274', '1', '2', '48', '唐淇', '0', '510400201330121275', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1275', '1', '2', '48', '李科沛', '1', '510400201330111259', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1276', '1', '2', '48', '吕欣瑶', '0', '510400201330121268', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1277', '1', '2', '48', '周思廷', '0', '510400201330121291', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1278', '1', '2', '48', '刘成阳', '1', '510400201330111266', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1279', '1', '2', '48', '付冰淋', '0', '510400201330121253', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1280', '1', '2', '49', '王楠', '0', '510400201330121329', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1281', '1', '2', '49', '彭武鑫', '0', '510400201330121320', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1282', '1', '2', '49', '赵博', '1', '510400201330110775', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1283', '1', '2', '49', '张焕菊', '0', '510400201330120785', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1284', '1', '2', '49', '邵帅', '1', '510400201330110778', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1285', '1', '2', '49', '苏妍', '0', '510400201330121323', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1286', '1', '2', '49', '郑豪', '1', '510400201330111341', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1287', '1', '2', '49', '唐彩霞', '0', '510400201330120779', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1288', '1', '2', '49', '尹帅', '1', '510400201330110774', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1289', '1', '2', '49', '李家怡', '0', '510400201330121314', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1290', '1', '2', '49', '安玲', '0', '510400201330120771', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1291', '1', '2', '49', '陈柯翰', '1', 'pzhsz00027', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1292', '1', '2', '49', '吴佳美', '0', '510400201330120781', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1293', '1', '2', '49', '陈俐君', '0', '510400201330121309', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1294', '1', '2', '49', '吴睿', '1', '510400201330111331', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1295', '1', '2', '49', '冯傲雪', '0', '510400201330120777', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1296', '1', '2', '49', '刘兵权', '1', '510400201330111301', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1297', '1', '2', '49', '杨玉超', '0', '510400201330120783', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1298', '1', '2', '49', '刘思茜', '0', '510400201330121317', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1299', '1', '2', '49', '唐龙', '1', '510400201330111305', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1300', '1', '2', '49', '廖富敏', '0', '510400201330120772', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1301', '1', '2', '49', '邹瀚霆', '1', '510400201330111343', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1302', '1', '2', '49', '王晏殊', '0', '510400201330121330', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1303', '1', '2', '49', '杜希', '0', '510400201330121311', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1304', '1', '2', '49', '韩其忻', '1', '510400201330111312', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1305', '1', '2', '49', '赵梓竣', '1', '510400201330111340', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1306', '1', '2', '49', '王星', '0', '510400201330120780', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1307', '1', '2', '49', '王明睿', '1', '510400201330111328', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1308', '1', '2', '49', '张世蕾', '0', '510400201330121338', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1309', '1', '2', '49', '徐黎军', '1', '510400201330110773', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1310', '1', '2', '49', '杨博', '1', '510400201330110782', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1311', '1', '2', '49', '林小琳', '0', '510400201330121316', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1312', '1', '2', '49', '邓霖', '0', '510400201330120776', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1313', '1', '2', '49', '刘勤', '0', '510400201330121303', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1314', '1', '2', '49', '唐莎', '1', '510400201330121327', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1315', '1', '2', '49', '余朋澄', '1', '510400201330111336', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1316', '1', '2', '49', '冉攀岑', '0', '510400201330121321', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1317', '1', '2', '49', '何保霖', '0', '510400201330121297', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1318', '1', '2', '49', '金月柔', '1', '510400201330121300', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1319', '1', '2', '49', '朱攀林', '0', '510400201330121342', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1320', '1', '2', '49', '吴则成', '1', '510400201330111332', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1321', '1', '2', '49', '唐昊立', '1', '510400201330111326', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1322', '1', '2', '49', '余洁', '0', '510400201330121335', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1323', '1', '2', '49', '蒋林权', '1', '510400201330111313', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1324', '1', '2', '49', '刘尉宇', '0', '510400201330121318', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1325', '1', '2', '49', '杨翔宇', '1', '510400201330111333', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1326', '1', '2', '49', '陈鑫畅', '1', '510400201330111310', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1327', '1', '2', '49', '宋展鸿', '1', '510400201330111322', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1328', '1', '2', '49', '何茹', '0', '510400201330121298', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1329', '1', '2', '49', '姚炫宇', '1', '510400201330111334', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1330', '1', '2', '49', '孙姝雨', '0', '510400201330121324', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1331', '1', '2', '49', '曾文', '1', '510400201330111308', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1332', '1', '2', '49', '余奕璇', '0', '510400201330121337', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1333', '1', '2', '49', '刘艺', '0', '510400201330121304', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1334', '1', '2', '49', '曹越', '1', '510400201330111307', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1335', '1', '2', '49', '廖敏宏', '0', '510400201330121315', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1336', '1', '2', '49', '冯博轩', '1', '510400201330111296', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1337', '1', '2', '49', '马琲佳', '0', '510400201330121319', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1338', '1', '2', '49', '何仪轩', '1', '510400201330111299', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1339', '1', '2', '49', '吴沛轩', '1', '510400201330111306', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1340', '1', '2', '49', '孙瑜', '0', '510400201330121325', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1341', '1', '2', '49', '刘倩', '0', '510400201330121302', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1342', '1', '2', '49', '张泽东', '1', '510400201330111339', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1343', '1', '2', '50', '叶霏', '0', '510400201330120809', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1344', '1', '2', '50', '范治昊', '1', '510400201330110791', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1345', '1', '2', '50', '秦浩然', '1', '510400201330110803', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1346', '1', '2', '50', '李柯岚', '0', '510400201330120795', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1347', '1', '2', '50', '谭静', '0', '510400201330120786', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1348', '1', '2', '50', '曾磬颖', '0', '510400201330120788', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1349', '1', '2', '50', '郭恭雨', '1', '510400201330110792', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1350', '1', '2', '50', '谈有清', '0', '510400201330120805', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1351', '1', '2', '50', '文龙', '1', '510400201330111370', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1352', '1', '2', '50', '李鑫', '1', '510400201330110796', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1353', '1', '2', '50', '何旭东', '1', '510400201330110793', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1354', '1', '2', '50', '刘磊', '1', '510400201330110798', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1355', '1', '2', '50', '姚雨成', '1', '510400201330110808', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1356', '1', '2', '50', '李珂', '0', '510400201330120794', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1357', '1', '2', '50', '倪培杰', '1', '510400201330110801', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1358', '1', '2', '50', '程栋伟', '1', '510400201330110790', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1359', '1', '2', '50', '宋文敉', '1', '510400201330110804', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1360', '1', '2', '50', '张禄提', '1', '510400201330111374', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1361', '1', '2', '50', '钱泓竹', '0', '510400201330120802', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1362', '1', '2', '50', '赵婧妤', '0', '510400201330120810', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:34', '1');
INSERT INTO `info_student` VALUES ('1363', '1', '2', '50', '刘博文', '1', '510400201330110797', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1364', '1', '2', '50', '刘玲玲', '0', '510400201330120799', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1365', '1', '2', '50', '陈汶锦', '0', '510400201330120789', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1366', '1', '2', '50', '肖道杰', '1', '510400201330110807', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1367', '1', '2', '50', '汪应霞', '0', '510400201330120806', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1368', '1', '2', '50', '曹童', '1', '510400201330110787', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1369', '1', '2', '50', '马一真', '1', '510400201330110800', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1370', '1', '2', '50', '杨璐西', '0', '510400201330121371', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1371', '1', '2', '50', '刘柯言', '0', '510400201330121356', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1372', '1', '2', '50', '刘久炜', '1', '510400201330111355', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1373', '1', '2', '50', '范卿畅', '1', '510400201330111346', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1374', '1', '2', '50', '宋雨峰', '1', '510400201330111362', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1375', '1', '2', '50', '李荣程', '1', '510400201330111352', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1376', '1', '2', '50', '王天宝', '1', '510400201330111367', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1377', '1', '2', '50', '孙思明', '1', '510400201330111364', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1378', '1', '2', '50', '汪建宏', '1', '510400201330111366', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1379', '1', '2', '50', '张鑫喆', '1', '510400201330111375', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1380', '1', '2', '50', '赵玟翔', '1', '510400201330111376', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1381', '1', '2', '50', '李俊澄', '1', '510400201330111351', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1382', '1', '2', '50', '舒周淋', '0', '510400201330121361', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1383', '1', '2', '50', '付尔丽', '0', '510400201330121347', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1384', '1', '2', '50', '雷鹏', '1', '510400201330111349', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1385', '1', '2', '50', '刘洹辰', '1', '510400201330111354', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1386', '1', '2', '50', '余朝雪', '0', '510400201330121373', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1387', '1', '2', '50', '袁梓珺', '0', '510400201330121378', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1388', '1', '2', '50', '罗国洪', '1', '510400201330111358', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1389', '1', '2', '50', '苏代娟', '0', '510400201330121363', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1390', '1', '2', '50', '赵明俊', '1', '510400201330111377', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1391', '1', '2', '50', '马诗媛', '0', '510400201330121359', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1392', '1', '2', '50', '杨阳', '1', '510400201330111372', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1393', '1', '2', '50', '段晓晓', '0', '510400201330121345', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1394', '1', '2', '50', '魏剑春', '1', '510400201330111369', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1395', '1', '2', '50', '王云辉', '1', '510400201330111368', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1396', '1', '2', '50', '谭钧文', '1', '510400201330111365', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1397', '1', '2', '50', '黄兴华', '0', '510400201330121348', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1398', '1', '2', '50', '龙长江', '1', '510400201330111357', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1399', '1', '2', '50', '许天莉', '0', '510400201330121344', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1400', '1', '2', '50', '卿钰婕', '0', '510400201330121360', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1401', '1', '2', '50', '李宗芸', '0', '510400201330121353', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1402', '1', '2', '50', '何海龙', '1', '510400201330111379', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');
INSERT INTO `info_student` VALUES ('1403', '1', '2', '50', '冷晓钰', '0', '510400201330121350', null, null, null, '2013-09-02 00:00:00', '1', '2014-04-13 13:24:35', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8 COMMENT='教师授课关系表';

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
  PRIMARY KEY (`UID`),
  UNIQUE KEY `Index_UserName` (`UserName`) USING HASH,
  KEY `Index_Email` (`Email`) USING HASH,
  KEY `Index_Phone` (`Phone`) USING HASH
) ENGINE=InnoDB AUTO_INCREMENT=1404 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of info_user
-- ----------------------------
INSERT INTO `info_user` VALUES ('1', 'admin', '841024', '', '', '2013-09-18 22:51:46', '1');
INSERT INTO `info_user` VALUES ('2', '510400201330110039', '110039', null, null, '2014-04-13 13:24:24', '1');
INSERT INTO `info_user` VALUES ('3', '510400201330120029', '120029', null, null, '2014-04-13 13:24:24', '1');
INSERT INTO `info_user` VALUES ('4', '510400201330110028', '110028', null, null, '2014-04-13 13:24:24', '1');
INSERT INTO `info_user` VALUES ('5', '510400201330110001', '110001', null, null, '2014-04-13 13:24:24', '1');
INSERT INTO `info_user` VALUES ('6', '510400201330120016', '120016', null, null, '2014-04-13 13:24:24', '1');
INSERT INTO `info_user` VALUES ('7', '510400201330120031', '120031', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('8', '510400201330120023', '120023', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('9', '510400201330120005', '120005', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('10', '510400201330120037', '120037', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('11', '510400201330120014', '120014', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('12', '510400201330110033', '110033', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('13', '510400201330110004', '110004', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('14', '510400201330110034', '110034', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('15', '510400201330110025', '110025', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('16', '510400201330110026', '110026', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('17', '510400201330120043', '120043', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('18', '510400201330120003', '120003', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('19', '510400201330120010', '120010', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('20', '510400201330110011', '110011', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('21', '510400201330120017', '120017', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('22', '510400201330110032', '110032', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('23', '510400201330120041', '120041', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('24', '510400201330120027', '120027', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('25', '510400201330110042', '110042', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('26', '510400201330110040', '110040', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('27', '510400201330120009', '120009', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('28', '510400201330120013', '120013', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('29', '510400201330120024', '120024', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('30', '510400201330110020', '110020', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('31', '510400201330110030', '110030', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('32', '510400201330120036', '120036', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('33', '510400201330120007', '120007', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('34', '510400201330110006', '110006', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('35', '510400201330110008', '110008', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('36', '510400201330120018', '120018', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('37', '510400201330120012', '120012', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('38', '510400201330120022', '120022', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('39', '510400201330110021', '110021', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('40', '510400201330120044', '120044', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('41', '510400201330120019', '120019', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('42', '510400201330110015', '110015', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('43', '510400201330120038', '120038', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('44', '510400201330110002', '110002', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('45', '510400201330120035', '120035', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('46', '510400201330120082', '120082', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('47', '510400201330110077', '110077', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('48', '510400201330110059', '110059', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('49', '510400201330110052', '110052', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('50', '510400201330110068', '110068', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('51', '510400201330120081', '120081', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('52', '510400201330110053', '110053', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('53', '510400201330120063', '120063', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('54', '510400201330120046', '120046', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('55', '510400201330110074', '110074', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('56', '510400201330110066', '110066', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('57', '510400201330120075', '120075', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('58', '510400201330110811', '110811', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('59', '510400201330110083', '110083', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('60', '510400201330120060', '120060', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('61', '510400201330110076', '110076', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('62', '510400201330110065', '110065', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('63', '510400201330110078', '110078', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('64', '510400201330120055', '120055', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('65', '510400201330120064', '120064', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('66', '510400201330120061', '120061', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('67', '510400201330110054', '110054', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('68', '510400201330110067', '110067', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('69', 'pzhsz00001', 'z00001', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('70', '510400201330110056', '110056', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('71', '510400201330120057', '120057', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('72', '510400201330120050', '120050', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('73', '510400201330120051', '120051', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('74', '510400201330120070', '120070', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('75', '510400201330120073', '120073', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('76', '510400201330120045', '120045', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('77', '510400201330110058', '110058', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('78', '510400201330120049', '120049', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('79', '510400201330110062', '110062', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('80', '510400201330110047', '110047', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('81', '510400201330120080', '120080', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('82', '510400201330120069', '120069', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('83', '510400201330110072', '110072', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('84', '510400201330110079', '110079', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('85', '510400201330120048', '120048', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('86', '510400201330110812', '110812', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('87', '510400201330110071', '110071', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('88', 'pzhsz00002', 'z00002', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('89', '510400201330110815', '110815', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('90', '510400201330120090', '120090', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('91', '510400201330110085', '110085', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('92', '510400201330110105', '110105', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('93', '510400201330120099', '120099', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('94', '510400201330120091', '120091', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('95', '510400201330110097', '110097', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('96', '510400201330110098', '110098', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('97', '510400201330120104', '120104', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('98', '510400201330110092', '110092', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('99', '510400201330110108', '110108', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('100', '510400201330120813', '120813', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('101', '510400201330120095', '120095', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('102', '510400201330120101', '120101', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('103', '510400201330110093', '110093', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('104', '510400201330110814', '110814', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('105', '510400201330120089', '120089', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('106', '510400201330120100', '120100', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('107', '510400201330120094', '120094', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('108', '510400201330110084', '110084', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('109', '510400201330120103', '120103', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('110', '510400201330120087', '120087', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('111', '510400201330120107', '120107', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('112', '510400201330110096', '110096', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('113', '510400201330120088', '120088', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('114', '510400201330110106', '110106', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('115', '510400201330120102', '120102', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('116', '510400201330120086', '120086', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('117', '510400201330120109', '120109', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('118', '510400201330120816', '120816', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('119', '510400201330110123', '110123', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('120', '510400201330120127', '120127', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('121', '510400201330120154', '120154', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('122', '510400201330120148', '120148', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('123', '510400201330110165', '110165', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('124', '510400201330110118', '110118', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('125', '510400201330120164', '120164', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('126', '510400201330120113', '120113', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('127', '510400201330110152', '110152', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('128', '510400201330110163', '110163', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('129', '510400201330120155', '120155', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('130', '510400201330110136', '110136', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('131', '510400201330120147', '120147', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('132', '510400201330110135', '110135', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('133', '510400201330120132', '120132', null, null, '2014-04-13 13:24:25', '1');
INSERT INTO `info_user` VALUES ('134', '510400201330120112', '120112', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('135', '510400201330110156', '110156', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('136', '510400201330110161', '110161', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('137', '510400201330120144', '120144', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('138', '510400201330120130', '120130', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('139', '510400201330110133', '110133', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('140', '510400201330120142', '120142', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('141', '510400201330110111', '110111', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('142', '510400201330120149', '120149', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('143', '510400201330110129', '110129', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('144', '510400201330120128', '120128', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('145', '510400201330110823', '110823', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('146', '510400201330120119', '120119', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('147', '510400201330110120', '110120', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('148', '510400201330120162', '120162', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('149', '510400201330120159', '120159', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('150', '510400201330110134', '110134', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('151', '510400201330110160', '110160', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('152', '510400201330120168', '120168', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('153', '510400201330110166', '110166', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('154', '510400201330120126', '120126', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('155', '510400201330120121', '120121', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('156', '510400201330110137', '110137', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('157', '510400201330110139', '110139', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('158', '510400201330120158', '120158', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('159', '510400201330110146', '110146', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('160', '510400201330120150', '120150', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('161', '510400201330110125', '110125', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('162', '510400201330110124', '110124', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('163', '510400201330120157', '120157', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('164', '510400201330110131', '110131', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('165', '510400201330110153', '110153', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('166', '510400201330120151', '120151', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('167', '510400201330120114', '120114', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('168', '510400201330110116', '110116', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('169', '510400201330120122', '120122', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('170', '510400201330110117', '110117', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('171', '510400201330120110', '120110', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('172', '510400201330120138', '120138', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('173', '510400201330110115', '110115', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('174', '510400201330110145', '110145', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('175', '510400201330120143', '120143', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('176', '510400201330110141', '110141', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('177', '510400201330120167', '120167', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('178', '510400201330110821', '110821', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('179', '510400201330120822', '120822', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('180', '510400201330110819', '110819', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('181', '510400201330110140', '110140', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('182', '510400201330110818', '110818', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('183', '510400201330120817', '120817', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('184', 'pzhsz00003', 'z00003', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('185', '510400201330110820', '110820', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('186', '510400201330110205', '110205', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('187', '510400201330120198', '120198', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('188', '510400201330110197', '110197', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('189', '510400201330120220', '120220', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('190', '510400201330110203', '110203', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('191', '510400201330120215', '120215', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('192', '510400201330110181', '110181', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('193', '510400201330120202', '120202', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('194', '510400201330120200', '120200', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('195', '510400201330110178', '110178', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('196', '510400201330110170', '110170', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('197', '510400201330120194', '120194', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('198', '510400201330110212', '110212', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('199', '510400201330120189', '120189', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('200', '510400201330120221', '120221', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('201', '510400201330110209', '110209', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('202', '510400201330120196', '120196', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('203', '510400201330110186', '110186', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('204', '510400201330110206', '110206', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('205', '510400201330120210', '120210', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('206', '510400201330120216', '120216', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('207', '510400201330110173', '110173', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('208', '510400201330110171', '110171', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('209', '510400201330120172', '120172', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('210', '510400201330120177', '120177', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('211', '510400201330110830', '110830', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('212', '510400201330120207', '120207', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('213', '510400201330120192', '120192', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('214', '510400201330110199', '110199', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('215', '510400201330120214', '120214', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('216', '510400201330110826', '110826', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('217', '510400201330120184', '120184', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('218', '510400201330110187', '110187', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('219', '510400201330110179', '110179', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('220', '510400201330120176', '120176', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('221', '510400201330120183', '120183', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('222', '510400201330110224', '110224', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('223', '510400201330120195', '120195', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('224', '510400201330120175', '120175', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('225', '510400201330110190', '110190', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('226', '510400201330120180', '120180', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('227', '510400201330110213', '110213', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('228', '510400201330120185', '120185', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('229', '510400201330110188', '110188', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('230', '510400201330110169', '110169', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('231', '510400201330120219', '120219', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('232', '510400201330110825', '110825', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('233', '510400201330120204', '120204', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('234', '510400201330110827', '110827', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('235', '510400201330120832', '120832', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('236', '510400201330110191', '110191', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('237', '510400201330110218', '110218', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('238', '510400201330120201', '120201', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('239', '510400201330120211', '120211', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('240', '510400201330110225', '110225', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('241', '510400201330120223', '120223', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('242', '510400201330110208', '110208', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('243', '510400201330110193', '110193', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('244', '510400201330120222', '120222', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('245', '510400201330120217', '120217', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('246', '510400201330110174', '110174', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('247', '510400201330110829', '110829', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('248', '510400201330120824', '120824', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('249', '510400201330110182', '110182', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('250', '510400201330110831', '110831', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('251', '510400201330110828', '110828', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('252', 'pzhsz00004', 'z00004', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('253', 'pzhsz00005', 'z00005', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('254', '510400201330110262', '110262', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('255', '510400201330120248', '120248', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('256', '510400201330110243', '110243', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('257', '510400201330110249', '110249', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('258', '510400201330120842', '120842', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('259', '510400201330110244', '110244', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('260', '510400201330120266', '120266', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('261', '510400201330110840', '110840', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('262', '510400201330120278', '120278', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('263', '510400201330110234', '110234', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('264', '510400201330110227', '110227', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('265', '510400201330120259', '120259', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('266', '510400201330120235', '120235', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('267', '510400201330110261', '110261', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('268', '510400201330120273', '120273', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('269', '510400201330110233', '110233', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('270', '510400201330120271', '120271', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('271', '510400201330110251', '110251', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('272', '510400201330110232', '110232', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('273', '510400201330120239', '120239', null, null, '2014-04-13 13:24:26', '1');
INSERT INTO `info_user` VALUES ('274', '510400201330110270', '110270', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('275', '510400201330120269', '120269', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('276', '510400201330110265', '110265', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('277', '510400201330120256', '120256', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('278', '510400201330120230', '120230', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('279', '510400201330110255', '110255', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('280', '510400201330120257', '120257', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('281', '510400201330120263', '120263', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('282', '510400201330110264', '110264', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('283', '510400201330120238', '120238', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('284', '510400201330110240', '110240', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('285', '510400201330120236', '120236', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('286', '510400201330110246', '110246', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('287', '510400201330110277', '110277', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('288', '510400201330120252', '120252', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('289', '510400201330110254', '110254', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('290', '510400201330120260', '120260', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('291', '510400201330120237', '120237', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('292', '510400201330110242', '110242', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('293', '510400201330120226', '120226', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('294', '510400201330110228', '110228', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('295', '510400201330110241', '110241', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('296', '510400201330120247', '120247', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('297', '510400201330110274', '110274', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('298', '510400201330120267', '120267', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('299', '510400201330120276', '120276', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('300', '510400201330110253', '110253', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('301', '510400201330110268', '110268', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('302', '510400201330110835', '110835', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('303', '510400201330120245', '120245', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('304', '510400201330120231', '120231', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('305', '510400201330110258', '110258', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('306', '510400201330120272', '120272', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('307', '510400201330110250', '110250', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('308', '510400201330110229', '110229', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('309', '510400201330120275', '120275', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('310', '510400201330110838', '110838', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('311', '510400201330110837', '110837', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('312', '510400201330120834', '120834', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('313', '510400201330120836', '120836', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('314', '510400201330120839', '120839', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('315', '510400201330110841', '110841', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('316', '510400201330110833', '110833', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('317', 'pzhsz00006', 'z00006', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('318', 'pzhsz00007', 'z00007', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('319', 'pzhsz00008', 'z00008', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('320', '510400201330120312', '120312', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('321', '510400201330110316', '110316', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('322', '510400201330120289', '120289', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('323', '510400201330110283', '110283', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('324', '510400201330120319', '120319', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('325', '510400201330120313', '120313', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('326', '510400201330110318', '110318', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('327', '510400201330110304', '110304', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('328', '510400201330110279', '110279', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('329', '510400201330120324', '120324', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('330', '510400201330120328', '120328', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('331', '510400201330110290', '110290', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('332', '510400201330110323', '110323', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('333', '510400201330120326', '120326', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('334', '510400201330120286', '120286', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('335', '510400201330110282', '110282', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('336', '510400201330120845', '120845', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('337', '510400201330110844', '110844', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('338', '510400201330120331', '120331', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('339', '510400201330120281', '120281', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('340', '510400201330110320', '110320', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('341', '510400201330110843', '110843', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('342', '510400201330120288', '120288', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('343', '510400201330120315', '120315', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('344', '510400201330120297', '120297', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('345', '510400201330110293', '110293', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('346', '510400201330120287', '120287', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('347', '510400201330110329', '110329', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('348', '510400201330120285', '120285', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('349', '510400201330120296', '120296', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('350', '510400201330110321', '110321', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('351', '510400201330120291', '120291', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('352', '510400201330120327', '120327', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('353', '510400201330110294', '110294', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('354', '510400201330110322', '110322', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('355', '510400201330120333', '120333', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('356', '510400201330120332', '120332', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('357', '510400201330110317', '110317', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('358', '510400201330120298', '120298', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('359', '510400201330110302', '110302', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('360', '510400201330120330', '120330', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('361', '510400201330120305', '120305', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('362', '510400201330110310', '110310', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('363', '510400201330110280', '110280', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('364', '510400201330120309', '120309', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('365', '510400201330110301', '110301', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('366', '510400201330120308', '120308', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('367', '510400201330120303', '120303', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('368', '510400201330120851', '120851', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('369', '510400201330110306', '110306', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('370', '510400201330110307', '110307', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('371', '510400201330110846', '110846', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('372', '510400201330120299', '120299', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('373', '510400201330110284', '110284', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('374', '510400201330110311', '110311', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('375', '510400201330120300', '120300', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('376', '510400201330120314', '120314', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('377', '510400201330110847', '110847', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('378', '510400201330120852', '120852', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('379', '510400201330120848', '120848', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('380', '510400201330120850', '120850', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('381', '510400201330110849', '110849', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('382', '510400201330110292', '110292', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('383', '510400201330110295', '110295', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('384', '510400201330110325', '110325', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('385', 'pzhsz00009', 'z00009', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('386', 'pzhsz00010', 'z00010', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('387', 'pzhsz00011', 'z00011', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('388', '510400201330120385', '120385', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('389', '510400201330120387', '120387', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('390', '510400201330110364', '110364', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('391', '510400201330120347', '120347', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('392', '510400201330110361', '110361', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('393', '510400201330120380', '120380', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('394', '510400201330110343', '110343', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('395', '510400201330110357', '110357', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('396', '510400201330120379', '120379', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('397', '510400201330110359', '110359', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('398', '510400201330120368', '120368', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('399', '510400201330120388', '120388', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('400', '510400201330120384', '120384', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('401', '510400201330110339', '110339', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('402', '510400201330120349', '120349', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('403', '510400201330110350', '110350', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('404', '510400201330120337', '120337', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('405', '510400201330110353', '110353', null, null, '2014-04-13 13:24:27', '1');
INSERT INTO `info_user` VALUES ('406', '510400201330120338', '120338', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('407', '510400201330110377', '110377', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('408', '510400201330120367', '120367', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('409', '510400201330110372', '110372', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('410', '510400201330120365', '120365', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('411', '510400201330110853', '110853', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('412', '510400201330120340', '120340', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('413', '510400201330120373', '120373', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('414', '510400201330120341', '120341', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('415', '510400201330120348', '120348', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('416', '510400201330110351', '110351', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('417', '510400201330120354', '120354', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('418', '510400201330110344', '110344', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('419', '510400201330120352', '120352', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('420', '510400201330110336', '110336', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('421', '510400201330120371', '120371', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('422', '510400201330110854', '110854', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('423', '510400201330120369', '120369', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('424', '510400201330110358', '110358', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('425', '510400201330110363', '110363', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('426', '510400201330110382', '110382', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('427', '510400201330120356', '120356', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('428', '510400201330120857', '120857', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('429', '510400201330110362', '110362', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('430', '510400201330120370', '120370', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('431', '510400201330110334', '110334', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('432', '510400201330120386', '120386', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('433', '510400201330110374', '110374', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('434', '510400201330120381', '120381', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('435', '510400201330120346', '120346', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('436', '510400201330110342', '110342', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('437', '510400201330110376', '110376', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('438', '510400201330120345', '120345', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('439', '510400201330120383', '120383', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('440', '510400201330120366', '120366', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('441', '510400201330110360', '110360', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('442', '510400201330120375', '120375', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('443', '510400201330110856', '110856', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('444', '510400201330120355', '120355', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('445', '510400201330110378', '110378', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('446', '510400201330110860', '110860', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('447', '510400201330110859', '110859', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('448', '510400201330120335', '120335', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('449', '510400201330110855', '110855', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('450', '510400201330120858', '120858', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('451', 'pzhsz00012', 'z00012', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('452', 'pzhsz00013', 'z00013', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('453', '510400201330120425', '120425', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('454', '510400201330120406', '120406', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('455', '510400201330110416', '110416', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('456', '510400201330120390', '120390', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('457', '510400201330110421', '110421', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('458', '510400201330110392', '110392', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('459', '510400201330120398', '120398', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('460', '510400201330110439', '110439', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('461', '510400201330120437', '120437', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('462', '510400201330120441', '120441', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('463', '510400201330110419', '110419', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('464', '510400201330110433', '110433', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('465', '510400201330120404', '120404', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('466', '510400201330110431', '110431', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('467', '510400201330120434', '120434', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('468', '510400201330120426', '120426', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('469', '510400201330110410', '110410', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('470', '510400201330110413', '110413', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('471', '510400201330120409', '120409', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('472', '510400201330110440', '110440', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('473', '510400201330120395', '120395', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('474', '510400201330110415', '110415', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('475', '510400201330120405', '120405', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('476', '510400201330110397', '110397', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('477', '510400201330110396', '110396', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('478', '510400201330120422', '120422', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('479', '510400201330110423', '110423', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('480', '510400201330120435', '120435', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('481', '510400201330120411', '120411', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('482', '510400201330120417', '120417', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('483', '510400201330120442', '120442', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('484', '510400201330110402', '110402', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('485', '510400201330110430', '110430', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('486', '510400201330120393', '120393', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('487', '510400201330110420', '110420', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('488', '510400201330120428', '120428', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('489', '510400201330110394', '110394', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('490', '510400201330120391', '120391', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('491', '510400201330110429', '110429', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('492', '510400201330110400', '110400', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('493', '510400201330110438', '110438', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('494', '510400201330110407', '110407', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('495', '510400201330120412', '120412', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('496', '510400201330120443', '120443', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('497', '510400201330110436', '110436', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('498', '510400201330120424', '120424', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('499', '510400201330120867', '120867', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('500', '510400201330110432', '110432', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('501', '510400201330120866', '120866', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('502', '510400201330110861', '110861', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('503', '510400201330120389', '120389', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('504', '510400201330110444', '110444', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('505', '510400201330120427', '120427', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('506', '510400201330110862', '110862', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('507', '510400201330110408', '110408', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('508', '510400201330110418', '110418', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('509', '510400201330120399', '120399', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('510', '510400201330120403', '120403', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('511', '510400201330110414', '110414', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('512', '510400201330110401', '110401', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('513', '510400201330110863', '110863', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('514', '510400201330120868', '120868', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('515', '510400201330110865', '110865', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('516', '510400201330120864', '120864', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('517', 'pzhsz00014', 'z00014', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('518', 'pzhsz00015', 'z00015', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('519', 'pzhsz00016', 'z00016', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('520', 'pzhsz00017', 'z00017', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('521', '510400201330120477', '120477', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('522', '510400201330120489', '120489', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('523', '510400201330110465', '110465', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('524', '510400201330120479', '120479', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('525', '510400201330110496', '110496', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('526', '510400201330110492', '110492', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('527', '510400201330120464', '120464', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('528', '510400201330120456', '120456', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('529', '510400201330110466', '110466', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('530', '510400201330110491', '110491', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('531', '510400201330120447', '120447', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('532', '510400201330110459', '110459', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('533', '510400201330120462', '120462', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('534', '510400201330110480', '110480', null, null, '2014-04-13 13:24:28', '1');
INSERT INTO `info_user` VALUES ('535', '510400201330120460', '120460', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('536', '510400201330120471', '120471', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('537', '510400201330120473', '120473', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('538', '510400201330110453', '110453', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('539', '510400201330110472', '110472', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('540', '510400201330120450', '120450', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('541', '510400201330110486', '110486', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('542', '510400201330120498', '120498', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('543', '510400201330110474', '110474', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('544', '510400201330120874', '120874', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('545', '510400201330110493', '110493', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('546', '510400201330120446', '120446', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('547', '510400201330120494', '120494', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('548', '510400201330110481', '110481', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('549', '510400201330120445', '120445', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('550', '510400201330120499', '120499', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('551', '510400201330120485', '120485', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('552', '510400201330120451', '120451', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('553', '510400201330110454', '110454', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('554', '510400201330120467', '120467', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('555', '510400201330110468', '110468', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('556', '510400201330120461', '120461', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('557', '510400201330110455', '110455', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('558', '510400201330120475', '120475', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('559', '510400201330110484', '110484', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('560', '510400201330120495', '120495', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('561', '510400201330110488', '110488', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('562', '510400201330110452', '110452', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('563', '510400201330120457', '120457', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('564', '510400201330110470', '110470', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('565', '510400201330110449', '110449', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('566', '510400201330120876', '120876', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('567', '510400201330120458', '120458', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('568', '510400201330110482', '110482', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('569', '510400201330120448', '120448', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('570', '510400201330110463', '110463', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('571', '510400201330120483', '120483', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('572', '510400201330110490', '110490', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('573', '510400201330120497', '120497', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('574', '510400201330110487', '110487', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('575', '510400201330120476', '120476', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('576', '510400201330110869', '110869', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('577', '510400201330110875', '110875', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('578', '510400201330110478', '110478', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('579', '510400201330120469', '120469', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('580', '510400201330120870', '120870', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('581', '510400201330120877', '120877', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('582', '510400201330110873', '110873', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('583', '510400201330110871', '110871', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('584', '510400201330120872', '120872', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('585', 'pzhsz00018', 'z00018', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('586', 'pzhsz00019', 'z00019', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('587', '510400201330110515', '110515', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('588', '510400201330110500', '110500', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('589', '510400201330120548', '120548', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('590', '510400201330120519', '120519', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('591', '510400201330110533', '110533', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('592', '510400201330110507', '110507', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('593', '510400201330120546', '120546', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('594', '510400201330120525', '120525', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('595', '510400201330110522', '110522', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('596', '510400201330110512', '110512', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('597', '510400201330120501', '120501', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('598', '510400201330120550', '120550', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('599', '510400201330110542', '110542', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('600', '510400201330110516', '110516', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('601', '510400201330120505', '120505', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('602', '510400201330110529', '110529', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('603', '510400201330120540', '120540', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('604', '510400201330110527', '110527', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('605', '510400201330120503', '120503', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('606', '510400201330110554', '110554', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('607', '510400201330120539', '120539', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('608', '510400201330110551', '110551', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('609', '510400201330120504', '120504', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('610', '510400201330110526', '110526', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('611', '510400201330120521', '120521', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('612', '510400201330110528', '110528', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('613', '510400201330120506', '120506', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('614', '510400201330120555', '120555', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('615', '510400201330110531', '110531', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('616', '510400201330120532', '120532', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('617', '510400201330110549', '110549', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('618', '510400201330120886', '120886', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('619', '510400201330110547', '110547', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('620', '510400201330120520', '120520', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('621', '510400201330120502', '120502', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('622', '510400201330110530', '110530', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('623', '510400201330120511', '120511', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('624', '510400201330110524', '110524', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('625', '510400201330120517', '120517', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('626', '510400201330110534', '110534', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('627', '510400201330120535', '120535', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('628', '510400201330110545', '110545', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('629', '510400201330120544', '120544', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('630', '510400201330110518', '110518', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('631', '510400201330110887', '110887', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('632', '510400201330110552', '110552', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('633', '510400201330120553', '120553', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('634', '510400201330110513', '110513', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('635', '510400201330120523', '120523', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('636', '510400201330120510', '120510', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('637', '510400201330120536', '120536', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('638', '510400201330110879', '110879', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('639', '510400201330120543', '120543', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('640', '510400201330110541', '110541', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('641', '510400201330110880', '110880', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('642', '510400201330120514', '120514', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('643', '510400201330110508', '110508', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('644', '510400201330110509', '110509', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('645', '510400201330120537', '120537', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('646', '510400201330110885', '110885', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('647', '510400201330120883', '120883', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('648', '510400201330110538', '110538', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('649', '510400201330120881', '120881', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('650', '510400201330110884', '110884', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('651', '510400201330120878', '120878', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('652', '510400201330110882', '110882', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('653', 'pzhsz00020', 'z00020', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('654', '510400201330110916', '110916', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('655', '510400201330120560', '120560', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('656', '510400201330110563', '110563', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('657', '510400201330120559', '120559', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('658', '510400201330110577', '110577', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('659', '510400201330120562', '120562', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('660', '510400201330110568', '110568', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('661', '510400201330120564', '120564', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('662', '510400201330110566', '110566', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('663', '510400201330110572', '110572', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('664', '510400201330120567', '120567', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('665', '510400201330110565', '110565', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('666', '510400201330120926', '120926', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('667', '510400201330120576', '120576', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('668', '510400201330110574', '110574', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('669', '510400201330120569', '120569', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('670', '510400201330110557', '110557', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('671', '510400201330120558', '120558', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('672', '510400201330120573', '120573', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('673', '510400201330120927', '120927', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('674', '510400201330110911', '110911', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('675', '510400201330120575', '120575', null, null, '2014-04-13 13:24:29', '1');
INSERT INTO `info_user` VALUES ('676', '510400201330110561', '110561', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('677', '510400201330110570', '110570', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('678', '510400201330120571', '120571', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('679', '510400201330120913', '120913', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('680', '510400201330110915', '110915', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('681', '510400201330120890', '120890', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('682', '510400201330120902', '120902', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('683', '510400201330110906', '110906', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('684', '510400201330110924', '110924', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('685', '510400201330120892', '120892', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('686', '510400201330110897', '110897', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('687', '510400201330120556', '120556', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('688', '510400201330110896', '110896', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('689', '510400201330120895', '120895', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('690', '510400201330110914', '110914', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('691', '510400201330120923', '120923', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('692', '510400201330110918', '110918', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('693', '510400201330120912', '120912', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('694', '510400201330120905', '120905', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('695', '510400201330110922', '110922', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('696', '510400201330120921', '120921', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('697', '510400201330110898', '110898', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('698', '510400201330110908', '110908', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('699', '510400201330110899', '110899', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('700', '510400201330120925', '120925', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('701', '510400201330110901', '110901', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('702', '510400201330120894', '120894', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('703', '510400201330110910', '110910', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('704', '510400201330120919', '120919', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('705', '510400201330110888', '110888', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('706', '510400201330120893', '120893', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('707', '510400201330110904', '110904', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('708', '510400201330120907', '120907', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('709', '510400201330110909', '110909', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('710', '510400201330110889', '110889', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('711', '510400201330120903', '120903', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('712', '510400201330110891', '110891', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('713', '510400201330110920', '110920', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('714', '510400201330120900', '120900', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('715', '510400201330120917', '120917', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('716', '510400201330110600', '110600', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('717', '510400201330110601', '110601', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('718', '510400201330120580', '120580', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('719', '510400201330110597', '110597', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('720', '510400201330120946', '120946', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('721', '510400201330120596', '120596', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('722', '510400201330110581', '110581', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('723', '510400201330120591', '120591', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('724', '510400201330110590', '110590', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('725', '510400201330110593', '110593', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('726', '510400201330120587', '120587', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('727', '510400201330110583', '110583', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('728', '510400201330120582', '120582', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('729', '510400201330110589', '110589', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('730', '510400201330120598', '120598', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('731', '510400201330120585', '120585', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('732', '510400201330110592', '110592', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('733', '510400201330120937', '120937', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('734', '510400201330120599', '120599', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('735', '510400201330120584', '120584', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('736', '510400201330120578', '120578', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('737', '510400201330110595', '110595', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('738', '510400201330110588', '110588', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('739', '510400201330120965', '120965', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('740', '510400201330110579', '110579', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('741', '510400201330120952', '120952', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('742', '510400201330120932', '120932', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('743', '510400201330110954', '110954', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('744', '510400201330120955', '120955', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('745', '510400201330120942', '120942', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('746', '510400201330120964', '120964', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('747', '510400201330110594', '110594', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('748', '510400201330110959', '110959', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('749', '510400201330120948', '120948', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('750', '510400201330120945', '120945', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('751', '510400201330110951', '110951', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('752', '510400201330110953', '110953', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('753', '510400201330120941', '120941', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('754', '510400201330110586', '110586', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('755', '510400201330120949', '120949', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('756', '510400201330120963', '120963', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('757', '510400201330110938', '110938', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('758', '510400201330120936', '120936', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('759', '510400201330110933', '110933', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('760', '510400201330110961', '110961', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('761', '510400201330110958', '110958', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('762', '510400201330120939', '120939', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('763', '510400201330110930', '110930', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('764', '510400201330120928', '120928', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('765', '510400201330110929', '110929', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('766', '510400201330110940', '110940', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('767', '510400201330120934', '120934', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('768', '510400201330110931', '110931', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('769', '510400201330120950', '120950', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('770', '510400201330120962', '120962', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('771', '510400201330110966', '110966', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('772', '510400201330110960', '110960', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('773', '510400201330120943', '120943', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('774', '510400201330110935', '110935', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('775', '510400201330110956', '110956', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('776', '510400201330110957', '110957', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('777', '510400201330120944', '120944', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('778', '510400201330110947', '110947', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('779', '510400201330110608', '110608', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('780', '510400201330120616', '120616', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('781', '510400201330110614', '110614', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('782', '510400201330120615', '120615', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('783', '510400201330120622', '120622', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('784', '510400201330110605', '110605', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('785', '510400201330120618', '120618', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('786', '510400201330110606', '110606', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('787', '510400201330110968', '110968', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('788', '510400201330120607', '120607', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('789', '510400201330110620', '110620', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('790', '510400201330120612', '120612', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('791', '510400201330110611', '110611', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('792', '510400201330120617', '120617', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('793', '510400201330120609', '120609', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('794', '510400201330120621', '120621', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('795', '510400201330120986', '120986', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('796', '510400201330110602', '110602', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('797', '510400201330120981', '120981', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('798', '510400201330120623', '120623', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('799', '510400201330110613', '110613', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('800', '510400201330110624', '110624', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('801', '510400201330110610', '110610', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('802', '510400201330120979', '120979', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('803', '510400201330120983', '120983', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('804', '510400201330110973', '110973', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('805', '510400201330120619', '120619', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('806', '510400201330120603', '120603', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('807', '510400201330110972', '110972', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('808', '510400201330121001', '121001', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('809', '510400201330120990', '120990', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('810', '510400201330110994', '110994', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('811', '510400201330111004', '111004', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('812', '510400201330120988', '120988', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('813', '510400201330120970', '120970', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('814', '510400201330120975', '120975', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('815', '510400201330110987', '110987', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('816', '510400201330121000', '121000', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('817', '510400201330120971', '120971', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('818', '510400201330110969', '110969', null, null, '2014-04-13 13:24:30', '1');
INSERT INTO `info_user` VALUES ('819', '510400201330110984', '110984', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('820', '510400201330120995', '120995', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('821', '510400201330120604', '120604', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('822', '510400201330111002', '111002', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('823', '510400201330110997', '110997', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('824', '510400201330110982', '110982', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('825', '510400201330121003', '121003', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('826', '510400201330120991', '120991', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('827', '510400201330110977', '110977', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('828', '510400201330120996', '120996', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('829', '510400201330110976', '110976', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('830', '510400201330110989', '110989', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('831', '510400201330110980', '110980', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('832', '510400201330110978', '110978', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('833', '510400201330120999', '120999', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('834', '510400201330120992', '120992', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('835', '510400201330110985', '110985', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('836', 'pzhsz00021', 'z00021', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('837', '510400201330110993', '110993', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('838', '510400201330120974', '120974', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('839', '510400201330110998', '110998', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('840', '510400201330110639', '110639', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('841', '510400201330110629', '110629', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('842', '510400201330120645', '120645', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('843', '510400201330120632', '120632', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('844', '510400201330110637', '110637', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('845', '510400201330120626', '120626', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('846', '510400201330110635', '110635', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('847', '510400201330121025', '121025', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('848', '510400201330110643', '110643', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('849', '510400201330110642', '110642', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('850', '510400201330120649', '120649', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('851', '510400201330111034', '111034', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('852', '510400201330120647', '120647', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('853', '510400201330110638', '110638', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('854', '510400201330120634', '120634', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('855', '510400201330120648', '120648', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('856', '510400201330110644', '110644', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('857', '510400201330110641', '110641', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('858', '510400201330120627', '120627', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('859', '510400201330120625', '120625', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('860', '510400201330120651', '120651', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('861', '510400201330120646', '120646', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('862', '510400201330120640', '120640', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('863', '510400201330110633', '110633', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('864', '510400201330110650', '110650', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('865', '510400201330120630', '120630', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('866', '510400201330111007', '111007', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('867', '510400201330121027', '121027', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('868', '510400201330121010', '121010', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('869', '510400201330120631', '120631', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('870', '510400201330110652', '110652', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('871', '510400201330111020', '111020', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('872', '510400201330121009', '121009', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('873', '510400201330120628', '120628', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('874', '510400201330111006', '111006', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('875', '510400201330121014', '121014', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('876', '510400201330121024', '121024', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('877', '510400201330111033', '111033', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('878', '510400201330121013', '121013', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('879', '510400201330111035', '111035', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('880', '510400201330121005', '121005', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('881', '510400201330110636', '110636', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('882', '510400201330111030', '111030', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('883', '510400201330121012', '121012', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('884', '510400201330121023', '121023', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('885', '510400201330111016', '111016', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('886', '510400201330121026', '121026', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('887', '510400201330111015', '111015', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('888', '510400201330121008', '121008', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('889', '510400201330111032', '111032', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('890', '510400201330111028', '111028', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('891', '510400201330121029', '121029', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('892', '510400201330111017', '111017', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('893', '510400201330121022', '121022', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('894', '510400201330110653', '110653', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('895', '510400201330111021', '111021', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('896', '510400201330121031', '121031', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('897', '510400201330111011', '111011', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('898', '510400201330121018', '121018', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('899', '510400201330110654', '110654', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('900', '510400201330110666', '110666', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('901', '510400201330110660', '110660', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('902', '510400201330120659', '120659', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('903', '510400201330110663', '110663', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('904', '510400201330120671', '120671', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('905', '510400201330110680', '110680', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('906', '510400201330120657', '120657', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('907', '510400201330110667', '110667', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('908', '510400201330110679', '110679', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('909', '510400201330120676', '120676', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('910', '510400201330110674', '110674', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('911', '510400201330120670', '120670', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('912', '510400201330110672', '110672', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('913', '510400201330120655', '120655', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('914', '510400201330110665', '110665', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('915', '510400201330120669', '120669', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('916', '510400201330110662', '110662', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('917', '510400201330120675', '120675', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('918', '510400201330110673', '110673', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('919', '510400201330111066', '111066', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('920', '510400201330120678', '120678', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('921', '510400201330120668', '120668', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('922', '510400201330110658', '110658', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('923', '510400201330120661', '120661', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('924', '510400201330120677', '120677', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('925', '510400201330121047', '121047', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('926', '510400201330110656', '110656', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('927', '510400201330111069', '111069', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('928', '510400201330121061', '121061', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('929', '510400201330121041', '121041', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('930', '510400201330111070', '111070', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('931', '510400201330121056', '121056', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('932', '510400201330111040', '111040', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('933', '510400201330111062', '111062', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('934', '510400201330121046', '121046', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('935', '510400201330121052', '121052', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('936', '510400201330111059', '111059', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('937', '510400201330121068', '121068', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('938', '510400201330111057', '111057', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('939', '510400201330121071', '121071', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('940', '510400201330121049', '121049', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('941', '510400201330111063', '111063', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('942', '510400201330121048', '121048', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('943', '510400201330111043', '111043', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('944', '510400201330111058', '111058', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('945', '510400201330121064', '121064', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('946', '510400201330111038', '111038', null, null, '2014-04-13 13:24:31', '1');
INSERT INTO `info_user` VALUES ('947', '510400201330111036', '111036', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('948', '510400201330111051', '111051', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('949', '510400201330121042', '121042', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('950', '510400201330111053', '111053', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('951', '510400201330121044', '121044', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('952', '510400201330121039', '121039', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('953', '510400201330111060', '111060', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('954', '510400201330111065', '111065', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('955', '510400201330121067', '121067', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('956', '510400201330111037', '111037', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('957', '510400201330111054', '111054', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('958', '510400201330110664', '110664', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('959', '510400201330121050', '121050', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('960', '510400201330111055', '111055', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('961', '510400201330111072', '111072', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('962', '510400201330121045', '121045', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('963', 'pzhsz00022', 'z00022', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('964', '510400201330120707', '120707', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('965', '510400201330110691', '110691', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('966', '510400201330120706', '120706', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('967', '510400201330110700', '110700', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('968', '510400201330120683', '120683', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('969', '510400201330110702', '110702', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('970', '510400201330120689', '120689', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('971', '510400201330120685', '120685', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('972', '510400201330110695', '110695', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('973', '510400201330111078', '111078', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('974', '510400201330110704', '110704', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('975', '510400201330120692', '120692', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('976', '510400201330110696', '110696', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('977', '510400201330120708', '120708', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('978', '510400201330120688', '120688', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('979', '510400201330110684', '110684', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('980', '510400201330120693', '120693', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('981', '510400201330110699', '110699', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('982', '510400201330120687', '120687', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('983', '510400201330121081', '121081', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('984', '510400201330110703', '110703', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('985', '510400201330120681', '120681', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('986', '510400201330120682', '120682', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('987', '510400201330110697', '110697', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('988', '510400201330120701', '120701', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('989', '510400201330121083', '121083', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('990', '510400201330120686', '120686', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('991', '510400201330111087', '111087', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('992', '510400201330110705', '110705', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('993', '510400201330111089', '111089', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('994', '510400201330120698', '120698', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('995', '510400201330111095', '111095', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('996', '510400201330121074', '121074', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('997', '510400201330121088', '121088', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('998', '510400201330111098', '111098', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('999', '510400201330121093', '121093', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1000', '510400201330111079', '111079', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1001', '510400201330121096', '121096', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1002', '510400201330121102', '121102', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1003', 'pzhsz00023', 'z00023', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1004', '510400201330111101', '111101', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1005', '510400201330111099', '111099', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1006', '510400201330120694', '120694', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1007', '510400201330111090', '111090', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1008', '510400201330111097', '111097', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1009', '510400201330121075', '121075', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1010', '510400201330110690', '110690', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1011', '510400201330121091', '121091', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1012', '510400201330111092', '111092', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1013', '510400201330121086', '121086', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1014', '510400201330111084', '111084', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1015', '510400201330111073', '111073', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1016', '510400201330111080', '111080', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1017', '510400201330111076', '111076', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1018', '510400201330111082', '111082', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1019', '510400201330121085', '121085', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1020', '510400201330111077', '111077', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1021', '510400201330121100', '121100', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1022', '510400201330111103', '111103', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1023', '510400201330121094', '121094', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1024', 'pzhsz00024', 'z00024', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1025', 'pzhsz00025', 'z00025', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1026', '510400201330111115', '111115', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1027', '510400201330120709', '120709', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1028', '510400201330121119', '121119', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1029', '510400201330121109', '121109', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1030', '510400201330121143', '121143', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1031', '510400201330111155', '111155', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1032', '510400201330120715', '120715', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1033', '510400201330121152', '121152', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1034', '510400201330111110', '111110', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1035', '510400201330121120', '121120', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1036', '510400201330111111', '111111', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1037', '510400201330121149', '121149', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1038', '510400201330111145', '111145', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1039', '510400201330120719', '120719', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1040', '510400201330121142', '121142', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1041', '510400201330120720', '120720', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1042', '510400201330110716', '110716', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1043', '510400201330121112', '121112', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1044', '510400201330111127', '111127', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1045', '510400201330111117', '111117', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1046', '510400201330121116', '121116', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1047', '510400201330111131', '111131', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1048', '510400201330120717', '120717', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1049', '510400201330111106', '111106', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1050', '510400201330121113', '121113', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1051', '510400201330120711', '120711', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1052', '510400201330111151', '111151', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1053', '510400201330110710', '110710', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1054', '510400201330120712', '120712', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1055', '510400201330111150', '111150', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1056', '510400201330111125', '111125', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1057', '510400201330121134', '121134', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1058', '510400201330110714', '110714', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1059', '510400201330121147', '121147', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1060', '510400201330121144', '121144', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1061', '510400201330121121', '121121', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1062', '510400201330111146', '111146', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1063', '510400201330121140', '121140', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1064', '510400201330111154', '111154', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1065', '510400201330111118', '111118', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1066', '510400201330121141', '121141', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1067', '510400201330111104', '111104', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1068', '510400201330111122', '111122', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1069', '510400201330121128', '121128', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1070', '510400201330121123', '121123', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1071', '510400201330111139', '111139', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1072', '510400201330121129', '121129', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1073', '510400201330111124', '111124', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1074', '510400201330111108', '111108', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1075', '510400201330111138', '111138', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1076', '510400201330111153', '111153', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1077', '510400201330121137', '121137', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1078', '510400201330121105', '121105', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1079', '510400201330120718', '120718', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1080', '510400201330111114', '111114', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1081', '510400201330121133', '121133', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1082', '510400201330121148', '121148', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1083', '510400201330110713', '110713', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1084', '510400201330111136', '111136', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1085', '510400201330111135', '111135', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1086', '510400201330121107', '121107', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1087', '510400201330121132', '121132', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1088', '510400201330111130', '111130', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1089', '510400201330121126', '121126', null, null, '2014-04-13 13:24:32', '1');
INSERT INTO `info_user` VALUES ('1090', '510400201330121161', '121161', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1091', '510400201330111163', '111163', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1092', '510400201330110724', '110724', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1093', '510400201330120737', '120737', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1094', '510400201330120728', '120728', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1095', '510400201330111174', '111174', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1096', '510400201330120735', '120735', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1097', '510400201330120726', '120726', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1098', '510400201330111189', '111189', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1099', '510400201330121184', '121184', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1100', '510400201330111192', '111192', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1101', '510400201330121198', '121198', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1102', '510400201330111185', '111185', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1103', '510400201330121156', '121156', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1104', '510400201330111196', '111196', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1105', '510400201330120732', '120732', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1106', '510400201330121177', '121177', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1107', '510400201330120734', '120734', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1108', '510400201330110725', '110725', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1109', '510400201330111158', '111158', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1110', '510400201330121159', '121159', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1111', '510400201330110723', '110723', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1112', '510400201330121168', '121168', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1113', '510400201330121193', '121193', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1114', '510400201330110738', '110738', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1115', '510400201330120731', '120731', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1116', '510400201330111172', '111172', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1117', '510400201330121180', '121180', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1118', '510400201330110721', '110721', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1119', '510400201330110727', '110727', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1120', '510400201330120730', '120730', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1121', '510400201330110740', '110740', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1122', '510400201330110722', '110722', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1123', '510400201330120736', '120736', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1124', '510400201330111157', '111157', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1125', '510400201330121162', '121162', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1126', '510400201330121169', '121169', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1127', '510400201330121167', '121167', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1128', '510400201330111171', '111171', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1129', '510400201330111182', '111182', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1130', '510400201330121197', '121197', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1131', '510400201330111166', '111166', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1132', '510400201330111187', '111187', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1133', '510400201330120739', '120739', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1134', '510400201330111179', '111179', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1135', '510400201330121195', '121195', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1136', '510400201330121176', '121176', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1137', '510400201330111170', '111170', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1138', '510400201330121181', '121181', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1139', '510400201330111183', '111183', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1140', '510400201330111199', '111199', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1141', '510400201330111191', '111191', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1142', '510400201330121160', '121160', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1143', '510400201330111194', '111194', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1144', '510400201330120733', '120733', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1145', '510400201330121186', '121186', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1146', '510400201330121173', '121173', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1147', '510400201330111164', '111164', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1148', '510400201330111188', '111188', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1149', '510400201330120729', '120729', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1150', '510400201330111190', '111190', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1151', '510400201330121175', '121175', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1152', '510400201330111178', '111178', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1153', 'pzhsz00026', 'z00026', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1154', '510400201330121165', '121165', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1155', '510400201330120742', '120742', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1156', '510400201330111201', '111201', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1157', '510400201330121238', '121238', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1158', '510400201330111206', '111206', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1159', '510400201330111207', '111207', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1160', '510400201330120754', '120754', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1161', '510400201330120751', '120751', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1162', '510400201330120750', '120750', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1163', '510400201330120745', '120745', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1164', '510400201330110749', '110749', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1165', '510400201330120758', '120758', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1166', '510400201330110753', '110753', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1167', '510400201330110756', '110756', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1168', '510400201330121243', '121243', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1169', '510400201330110741', '110741', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1170', '510400201330121221', '121221', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1171', '510400201330121229', '121229', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1172', '510400201330121241', '121241', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1173', '510400201330111240', '111240', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1174', '510400201330121224', '121224', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1175', '510400201330111216', '111216', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1176', '510400201330111228', '111228', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1177', '510400201330120748', '120748', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1178', '510400201330120743', '120743', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1179', '510400201330110752', '110752', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1180', '510400201330111208', '111208', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1181', '510400201330121223', '121223', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1182', '510400201330111202', '111202', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1183', '510400201330120744', '120744', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1184', '510400201330120757', '120757', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1185', '510400201330111203', '111203', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1186', '510400201330110746', '110746', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1187', '510400201330111225', '111225', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1188', '510400201330121213', '121213', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1189', '510400201330111230', '111230', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1190', '510400201330121218', '121218', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1191', '510400201330121215', '121215', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1192', '510400201330111222', '111222', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1193', '510400201330121212', '121212', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1194', '510400201330121210', '121210', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1195', '510400201330111205', '111205', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1196', '510400201330111209', '111209', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1197', '510400201330111211', '111211', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1198', '510400201330111227', '111227', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1199', '510400201330121214', '121214', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1200', '510400201330121233', '121233', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1201', '510400201330111236', '111236', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1202', '510400201330120747', '120747', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1203', '510400201330111220', '111220', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1204', '510400201330121226', '121226', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1205', '510400201330111235', '111235', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1206', '510400201330111232', '111232', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1207', '510400201330111200', '111200', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1208', '510400201330111231', '111231', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1209', '510400201330121239', '121239', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1210', '510400201330121242', '121242', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1211', '510400201330111204', '111204', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1212', '510400201330120755', '120755', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1213', '510400201330121237', '121237', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1214', '510400201330111217', '111217', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1215', '510400201330111234', '111234', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1216', '510400201330121249', '121249', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1217', '510400201330121292', '121292', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1218', '510400201330111294', '111294', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1219', '510400201330111248', '111248', null, null, '2014-04-13 13:24:33', '1');
INSERT INTO `info_user` VALUES ('1220', '510400201330121276', '121276', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1221', '510400201330121286', '121286', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1222', '510400201330110766', '110766', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1223', '510400201330111255', '111255', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1224', '510400201330121285', '121285', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1225', '510400201330121256', '121256', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1226', '510400201330120761', '120761', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1227', '510400201330121288', '121288', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1228', '510400201330110759', '110759', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1229', '510400201330110762', '110762', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1230', '510400201330121261', '121261', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1231', '510400201330110767', '110767', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1232', '510400201330121269', '121269', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1233', '510400201330120770', '120770', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1234', '510400201330121251', '121251', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1235', '510400201330111272', '111272', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1236', '510400201330111273', '111273', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1237', '510400201330121262', '121262', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1238', '510400201330121287', '121287', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1239', '510400201330111258', '111258', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1240', '510400201330110764', '110764', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1241', '510400201330121270', '121270', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1242', '510400201330111282', '111282', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1243', '510400201330120769', '120769', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1244', '510400201330110763', '110763', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1245', '510400201330120768', '120768', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1246', '510400201330111254', '111254', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1247', '510400201330120760', '120760', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1248', '510400201330111281', '111281', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1249', '510400201330121247', '121247', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1250', '510400201330111252', '111252', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1251', '510400201330111274', '111274', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1252', '510400201330121245', '121245', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1253', '510400201330121265', '121265', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1254', '510400201330111257', '111257', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1255', '510400201330121279', '121279', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1256', '510400201330121289', '121289', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1257', '510400201330111267', '111267', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1258', '510400201330121283', '121283', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1259', '510400201330111295', '111295', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1260', '510400201330111263', '111263', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1261', '510400201330111293', '111293', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1262', '510400201330121290', '121290', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1263', '510400201330111280', '111280', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1264', '510400201330111246', '111246', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1265', '510400201330121244', '121244', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1266', '510400201330121271', '121271', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1267', '510400201330110765', '110765', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1268', '510400201330111277', '111277', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1269', '510400201330111264', '111264', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1270', '510400201330121284', '121284', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1271', '510400201330111260', '111260', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1272', '510400201330121250', '121250', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1273', '510400201330111278', '111278', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1274', '510400201330121275', '121275', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1275', '510400201330111259', '111259', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1276', '510400201330121268', '121268', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1277', '510400201330121291', '121291', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1278', '510400201330111266', '111266', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1279', '510400201330121253', '121253', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1280', '510400201330121329', '121329', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1281', '510400201330121320', '121320', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1282', '510400201330110775', '110775', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1283', '510400201330120785', '120785', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1284', '510400201330110778', '110778', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1285', '510400201330121323', '121323', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1286', '510400201330111341', '111341', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1287', '510400201330120779', '120779', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1288', '510400201330110774', '110774', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1289', '510400201330121314', '121314', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1290', '510400201330120771', '120771', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1291', 'pzhsz00027', 'z00027', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1292', '510400201330120781', '120781', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1293', '510400201330121309', '121309', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1294', '510400201330111331', '111331', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1295', '510400201330120777', '120777', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1296', '510400201330111301', '111301', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1297', '510400201330120783', '120783', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1298', '510400201330121317', '121317', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1299', '510400201330111305', '111305', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1300', '510400201330120772', '120772', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1301', '510400201330111343', '111343', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1302', '510400201330121330', '121330', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1303', '510400201330121311', '121311', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1304', '510400201330111312', '111312', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1305', '510400201330111340', '111340', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1306', '510400201330120780', '120780', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1307', '510400201330111328', '111328', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1308', '510400201330121338', '121338', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1309', '510400201330110773', '110773', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1310', '510400201330110782', '110782', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1311', '510400201330121316', '121316', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1312', '510400201330120776', '120776', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1313', '510400201330121303', '121303', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1314', '510400201330121327', '121327', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1315', '510400201330111336', '111336', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1316', '510400201330121321', '121321', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1317', '510400201330121297', '121297', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1318', '510400201330121300', '121300', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1319', '510400201330121342', '121342', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1320', '510400201330111332', '111332', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1321', '510400201330111326', '111326', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1322', '510400201330121335', '121335', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1323', '510400201330111313', '111313', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1324', '510400201330121318', '121318', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1325', '510400201330111333', '111333', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1326', '510400201330111310', '111310', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1327', '510400201330111322', '111322', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1328', '510400201330121298', '121298', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1329', '510400201330111334', '111334', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1330', '510400201330121324', '121324', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1331', '510400201330111308', '111308', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1332', '510400201330121337', '121337', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1333', '510400201330121304', '121304', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1334', '510400201330111307', '111307', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1335', '510400201330121315', '121315', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1336', '510400201330111296', '111296', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1337', '510400201330121319', '121319', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1338', '510400201330111299', '111299', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1339', '510400201330111306', '111306', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1340', '510400201330121325', '121325', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1341', '510400201330121302', '121302', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1342', '510400201330111339', '111339', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1343', '510400201330120809', '120809', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1344', '510400201330110791', '110791', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1345', '510400201330110803', '110803', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1346', '510400201330120795', '120795', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1347', '510400201330120786', '120786', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1348', '510400201330120788', '120788', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1349', '510400201330110792', '110792', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1350', '510400201330120805', '120805', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1351', '510400201330111370', '111370', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1352', '510400201330110796', '110796', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1353', '510400201330110793', '110793', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1354', '510400201330110798', '110798', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1355', '510400201330110808', '110808', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1356', '510400201330120794', '120794', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1357', '510400201330110801', '110801', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1358', '510400201330110790', '110790', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1359', '510400201330110804', '110804', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1360', '510400201330111374', '111374', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1361', '510400201330120802', '120802', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1362', '510400201330120810', '120810', null, null, '2014-04-13 13:24:34', '1');
INSERT INTO `info_user` VALUES ('1363', '510400201330110797', '110797', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1364', '510400201330120799', '120799', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1365', '510400201330120789', '120789', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1366', '510400201330110807', '110807', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1367', '510400201330120806', '120806', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1368', '510400201330110787', '110787', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1369', '510400201330110800', '110800', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1370', '510400201330121371', '121371', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1371', '510400201330121356', '121356', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1372', '510400201330111355', '111355', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1373', '510400201330111346', '111346', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1374', '510400201330111362', '111362', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1375', '510400201330111352', '111352', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1376', '510400201330111367', '111367', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1377', '510400201330111364', '111364', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1378', '510400201330111366', '111366', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1379', '510400201330111375', '111375', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1380', '510400201330111376', '111376', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1381', '510400201330111351', '111351', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1382', '510400201330121361', '121361', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1383', '510400201330121347', '121347', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1384', '510400201330111349', '111349', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1385', '510400201330111354', '111354', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1386', '510400201330121373', '121373', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1387', '510400201330121378', '121378', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1388', '510400201330111358', '111358', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1389', '510400201330121363', '121363', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1390', '510400201330111377', '111377', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1391', '510400201330121359', '121359', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1392', '510400201330111372', '111372', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1393', '510400201330121345', '121345', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1394', '510400201330111369', '111369', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1395', '510400201330111368', '111368', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1396', '510400201330111365', '111365', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1397', '510400201330121348', '121348', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1398', '510400201330111357', '111357', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1399', '510400201330121344', '121344', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1400', '510400201330121360', '121360', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1401', '510400201330121353', '121353', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1402', '510400201330111379', '111379', null, null, '2014-04-13 13:24:35', '1');
INSERT INTO `info_user` VALUES ('1403', '510400201330121350', '121350', null, null, '2014-04-13 13:24:35', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of p_menu
-- ----------------------------
INSERT INTO `p_menu` VALUES ('1', '0', 'plugin', '1', '首页', '/school/welcome/index', '1');
INSERT INTO `p_menu` VALUES ('2', '0', 'computer', '0', '系统管理', '', '2');
INSERT INTO `p_menu` VALUES ('3', '0', 'book_open', '0', '成绩统计', '', '3');
INSERT INTO `p_menu` VALUES ('4', '0', 'chart_bar', '0', '成绩分析', '', '4');
INSERT INTO `p_menu` VALUES ('5', '2', null, '1', '班级管理', '/school/manClass/index', '1');
INSERT INTO `p_menu` VALUES ('6', '2', '', '1', '教师管理', '/school/manTeacher/index', '2');
INSERT INTO `p_menu` VALUES ('7', '2', null, '1', '科目管理', '/school/manSubject/index', '3');
INSERT INTO `p_menu` VALUES ('8', '2', null, '1', '学生管理', '/school/manStudent/index', '4');
INSERT INTO `p_menu` VALUES ('9', '2', null, '1', '考试管理', '/school/manExam/index', '5');
INSERT INTO `p_menu` VALUES ('10', '2', null, '1', '成绩管理', '/school/manScore/index', '6');
INSERT INTO `p_menu` VALUES ('11', '3', null, '1', '学生成绩', '/school/statStudent/index', '1');
INSERT INTO `p_menu` VALUES ('12', '3', null, '1', '学生排名', '/school/statSturank/index', '2');
INSERT INTO `p_menu` VALUES ('13', '3', null, '1', '班级成绩', '/school/statClass/index', '3');
INSERT INTO `p_menu` VALUES ('14', '4', null, '1', '学生分析', '/school/anaStudent/index', '1');
INSERT INTO `p_menu` VALUES ('15', '4', null, '1', '班级分析', '/school/anaClass/index', '2');
INSERT INTO `p_menu` VALUES ('16', '3', null, '1', '我的成绩', '/school/statStudentper/index', '1');
INSERT INTO `p_menu` VALUES ('17', '4', null, '1', '我的分析', '/school/anaStudentper/index', '1');
INSERT INTO `p_menu` VALUES ('18', '3', null, '1', '我的班级', '/school/statClassper/index', '2');
INSERT INTO `p_menu` VALUES ('19', '3', null, '1', '我的年级', '/school/statClass/index', '3');
INSERT INTO `p_menu` VALUES ('20', '0', 'pencil', '1', '问题建议', '/school/suggest/index', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色名称表';

-- ----------------------------
-- Records of p_role
-- ----------------------------
INSERT INTO `p_role` VALUES ('1', '学生');
INSERT INTO `p_role` VALUES ('2', '任课教师');
INSERT INTO `p_role` VALUES ('3', '班级管理人');
INSERT INTO `p_role` VALUES ('4', '年级管理人');
INSERT INTO `p_role` VALUES ('5', '教务管理人');

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
INSERT INTO `p_role_menu` VALUES ('1', '4');
INSERT INTO `p_role_menu` VALUES ('1', '16');
INSERT INTO `p_role_menu` VALUES ('1', '17');
INSERT INTO `p_role_menu` VALUES ('1', '18');
INSERT INTO `p_role_menu` VALUES ('1', '19');
INSERT INTO `p_role_menu` VALUES ('1', '20');
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
INSERT INTO `p_user_role` VALUES ('2', '1');
INSERT INTO `p_user_role` VALUES ('3', '1');
INSERT INTO `p_user_role` VALUES ('4', '1');
INSERT INTO `p_user_role` VALUES ('5', '1');
INSERT INTO `p_user_role` VALUES ('6', '1');
INSERT INTO `p_user_role` VALUES ('7', '1');
INSERT INTO `p_user_role` VALUES ('8', '1');
INSERT INTO `p_user_role` VALUES ('9', '1');
INSERT INTO `p_user_role` VALUES ('10', '1');
INSERT INTO `p_user_role` VALUES ('11', '1');
INSERT INTO `p_user_role` VALUES ('12', '1');
INSERT INTO `p_user_role` VALUES ('13', '1');
INSERT INTO `p_user_role` VALUES ('14', '1');
INSERT INTO `p_user_role` VALUES ('15', '1');
INSERT INTO `p_user_role` VALUES ('16', '1');
INSERT INTO `p_user_role` VALUES ('17', '1');
INSERT INTO `p_user_role` VALUES ('18', '1');
INSERT INTO `p_user_role` VALUES ('19', '1');
INSERT INTO `p_user_role` VALUES ('20', '1');
INSERT INTO `p_user_role` VALUES ('21', '1');
INSERT INTO `p_user_role` VALUES ('22', '1');
INSERT INTO `p_user_role` VALUES ('23', '1');
INSERT INTO `p_user_role` VALUES ('24', '1');
INSERT INTO `p_user_role` VALUES ('25', '1');
INSERT INTO `p_user_role` VALUES ('26', '1');
INSERT INTO `p_user_role` VALUES ('27', '1');
INSERT INTO `p_user_role` VALUES ('28', '1');
INSERT INTO `p_user_role` VALUES ('29', '1');
INSERT INTO `p_user_role` VALUES ('30', '1');
INSERT INTO `p_user_role` VALUES ('31', '1');
INSERT INTO `p_user_role` VALUES ('32', '1');
INSERT INTO `p_user_role` VALUES ('33', '1');
INSERT INTO `p_user_role` VALUES ('34', '1');
INSERT INTO `p_user_role` VALUES ('35', '1');
INSERT INTO `p_user_role` VALUES ('36', '1');
INSERT INTO `p_user_role` VALUES ('37', '1');
INSERT INTO `p_user_role` VALUES ('38', '1');
INSERT INTO `p_user_role` VALUES ('39', '1');
INSERT INTO `p_user_role` VALUES ('40', '1');
INSERT INTO `p_user_role` VALUES ('41', '1');
INSERT INTO `p_user_role` VALUES ('42', '1');
INSERT INTO `p_user_role` VALUES ('43', '1');
INSERT INTO `p_user_role` VALUES ('44', '1');
INSERT INTO `p_user_role` VALUES ('45', '1');
INSERT INTO `p_user_role` VALUES ('46', '1');
INSERT INTO `p_user_role` VALUES ('47', '1');
INSERT INTO `p_user_role` VALUES ('48', '1');
INSERT INTO `p_user_role` VALUES ('49', '1');
INSERT INTO `p_user_role` VALUES ('50', '1');
INSERT INTO `p_user_role` VALUES ('51', '1');
INSERT INTO `p_user_role` VALUES ('52', '1');
INSERT INTO `p_user_role` VALUES ('53', '1');
INSERT INTO `p_user_role` VALUES ('54', '1');
INSERT INTO `p_user_role` VALUES ('55', '1');
INSERT INTO `p_user_role` VALUES ('56', '1');
INSERT INTO `p_user_role` VALUES ('57', '1');
INSERT INTO `p_user_role` VALUES ('58', '1');
INSERT INTO `p_user_role` VALUES ('59', '1');
INSERT INTO `p_user_role` VALUES ('60', '1');
INSERT INTO `p_user_role` VALUES ('61', '1');
INSERT INTO `p_user_role` VALUES ('62', '1');
INSERT INTO `p_user_role` VALUES ('63', '1');
INSERT INTO `p_user_role` VALUES ('64', '1');
INSERT INTO `p_user_role` VALUES ('65', '1');
INSERT INTO `p_user_role` VALUES ('66', '1');
INSERT INTO `p_user_role` VALUES ('67', '1');
INSERT INTO `p_user_role` VALUES ('68', '1');
INSERT INTO `p_user_role` VALUES ('69', '1');
INSERT INTO `p_user_role` VALUES ('70', '1');
INSERT INTO `p_user_role` VALUES ('71', '1');
INSERT INTO `p_user_role` VALUES ('72', '1');
INSERT INTO `p_user_role` VALUES ('73', '1');
INSERT INTO `p_user_role` VALUES ('74', '1');
INSERT INTO `p_user_role` VALUES ('75', '1');
INSERT INTO `p_user_role` VALUES ('76', '1');
INSERT INTO `p_user_role` VALUES ('77', '1');
INSERT INTO `p_user_role` VALUES ('78', '1');
INSERT INTO `p_user_role` VALUES ('79', '1');
INSERT INTO `p_user_role` VALUES ('80', '1');
INSERT INTO `p_user_role` VALUES ('81', '1');
INSERT INTO `p_user_role` VALUES ('82', '1');
INSERT INTO `p_user_role` VALUES ('83', '1');
INSERT INTO `p_user_role` VALUES ('84', '1');
INSERT INTO `p_user_role` VALUES ('85', '1');
INSERT INTO `p_user_role` VALUES ('86', '1');
INSERT INTO `p_user_role` VALUES ('87', '1');
INSERT INTO `p_user_role` VALUES ('88', '1');
INSERT INTO `p_user_role` VALUES ('89', '1');
INSERT INTO `p_user_role` VALUES ('90', '1');
INSERT INTO `p_user_role` VALUES ('91', '1');
INSERT INTO `p_user_role` VALUES ('92', '1');
INSERT INTO `p_user_role` VALUES ('93', '1');
INSERT INTO `p_user_role` VALUES ('94', '1');
INSERT INTO `p_user_role` VALUES ('95', '1');
INSERT INTO `p_user_role` VALUES ('96', '1');
INSERT INTO `p_user_role` VALUES ('97', '1');
INSERT INTO `p_user_role` VALUES ('98', '1');
INSERT INTO `p_user_role` VALUES ('99', '1');
INSERT INTO `p_user_role` VALUES ('100', '1');
INSERT INTO `p_user_role` VALUES ('101', '1');
INSERT INTO `p_user_role` VALUES ('102', '1');
INSERT INTO `p_user_role` VALUES ('103', '1');
INSERT INTO `p_user_role` VALUES ('104', '1');
INSERT INTO `p_user_role` VALUES ('105', '1');
INSERT INTO `p_user_role` VALUES ('106', '1');
INSERT INTO `p_user_role` VALUES ('107', '1');
INSERT INTO `p_user_role` VALUES ('108', '1');
INSERT INTO `p_user_role` VALUES ('109', '1');
INSERT INTO `p_user_role` VALUES ('110', '1');
INSERT INTO `p_user_role` VALUES ('111', '1');
INSERT INTO `p_user_role` VALUES ('112', '1');
INSERT INTO `p_user_role` VALUES ('113', '1');
INSERT INTO `p_user_role` VALUES ('114', '1');
INSERT INTO `p_user_role` VALUES ('115', '1');
INSERT INTO `p_user_role` VALUES ('116', '1');
INSERT INTO `p_user_role` VALUES ('117', '1');
INSERT INTO `p_user_role` VALUES ('118', '1');
INSERT INTO `p_user_role` VALUES ('119', '1');
INSERT INTO `p_user_role` VALUES ('120', '1');
INSERT INTO `p_user_role` VALUES ('121', '1');
INSERT INTO `p_user_role` VALUES ('122', '1');
INSERT INTO `p_user_role` VALUES ('123', '1');
INSERT INTO `p_user_role` VALUES ('124', '1');
INSERT INTO `p_user_role` VALUES ('125', '1');
INSERT INTO `p_user_role` VALUES ('126', '1');
INSERT INTO `p_user_role` VALUES ('127', '1');
INSERT INTO `p_user_role` VALUES ('128', '1');
INSERT INTO `p_user_role` VALUES ('129', '1');
INSERT INTO `p_user_role` VALUES ('130', '1');
INSERT INTO `p_user_role` VALUES ('131', '1');
INSERT INTO `p_user_role` VALUES ('132', '1');
INSERT INTO `p_user_role` VALUES ('133', '1');
INSERT INTO `p_user_role` VALUES ('134', '1');
INSERT INTO `p_user_role` VALUES ('135', '1');
INSERT INTO `p_user_role` VALUES ('136', '1');
INSERT INTO `p_user_role` VALUES ('137', '1');
INSERT INTO `p_user_role` VALUES ('138', '1');
INSERT INTO `p_user_role` VALUES ('139', '1');
INSERT INTO `p_user_role` VALUES ('140', '1');
INSERT INTO `p_user_role` VALUES ('141', '1');
INSERT INTO `p_user_role` VALUES ('142', '1');
INSERT INTO `p_user_role` VALUES ('143', '1');
INSERT INTO `p_user_role` VALUES ('144', '1');
INSERT INTO `p_user_role` VALUES ('145', '1');
INSERT INTO `p_user_role` VALUES ('146', '1');
INSERT INTO `p_user_role` VALUES ('147', '1');
INSERT INTO `p_user_role` VALUES ('148', '1');
INSERT INTO `p_user_role` VALUES ('149', '1');
INSERT INTO `p_user_role` VALUES ('150', '1');
INSERT INTO `p_user_role` VALUES ('151', '1');
INSERT INTO `p_user_role` VALUES ('152', '1');
INSERT INTO `p_user_role` VALUES ('153', '1');
INSERT INTO `p_user_role` VALUES ('154', '1');
INSERT INTO `p_user_role` VALUES ('155', '1');
INSERT INTO `p_user_role` VALUES ('156', '1');
INSERT INTO `p_user_role` VALUES ('157', '1');
INSERT INTO `p_user_role` VALUES ('158', '1');
INSERT INTO `p_user_role` VALUES ('159', '1');
INSERT INTO `p_user_role` VALUES ('160', '1');
INSERT INTO `p_user_role` VALUES ('161', '1');
INSERT INTO `p_user_role` VALUES ('162', '1');
INSERT INTO `p_user_role` VALUES ('163', '1');
INSERT INTO `p_user_role` VALUES ('164', '1');
INSERT INTO `p_user_role` VALUES ('165', '1');
INSERT INTO `p_user_role` VALUES ('166', '1');
INSERT INTO `p_user_role` VALUES ('167', '1');
INSERT INTO `p_user_role` VALUES ('168', '1');
INSERT INTO `p_user_role` VALUES ('169', '1');
INSERT INTO `p_user_role` VALUES ('170', '1');
INSERT INTO `p_user_role` VALUES ('171', '1');
INSERT INTO `p_user_role` VALUES ('172', '1');
INSERT INTO `p_user_role` VALUES ('173', '1');
INSERT INTO `p_user_role` VALUES ('174', '1');
INSERT INTO `p_user_role` VALUES ('175', '1');
INSERT INTO `p_user_role` VALUES ('176', '1');
INSERT INTO `p_user_role` VALUES ('177', '1');
INSERT INTO `p_user_role` VALUES ('178', '1');
INSERT INTO `p_user_role` VALUES ('179', '1');
INSERT INTO `p_user_role` VALUES ('180', '1');
INSERT INTO `p_user_role` VALUES ('181', '1');
INSERT INTO `p_user_role` VALUES ('182', '1');
INSERT INTO `p_user_role` VALUES ('183', '1');
INSERT INTO `p_user_role` VALUES ('184', '1');
INSERT INTO `p_user_role` VALUES ('185', '1');
INSERT INTO `p_user_role` VALUES ('186', '1');
INSERT INTO `p_user_role` VALUES ('187', '1');
INSERT INTO `p_user_role` VALUES ('188', '1');
INSERT INTO `p_user_role` VALUES ('189', '1');
INSERT INTO `p_user_role` VALUES ('190', '1');
INSERT INTO `p_user_role` VALUES ('191', '1');
INSERT INTO `p_user_role` VALUES ('192', '1');
INSERT INTO `p_user_role` VALUES ('193', '1');
INSERT INTO `p_user_role` VALUES ('194', '1');
INSERT INTO `p_user_role` VALUES ('195', '1');
INSERT INTO `p_user_role` VALUES ('196', '1');
INSERT INTO `p_user_role` VALUES ('197', '1');
INSERT INTO `p_user_role` VALUES ('198', '1');
INSERT INTO `p_user_role` VALUES ('199', '1');
INSERT INTO `p_user_role` VALUES ('200', '1');
INSERT INTO `p_user_role` VALUES ('201', '1');
INSERT INTO `p_user_role` VALUES ('202', '1');
INSERT INTO `p_user_role` VALUES ('203', '1');
INSERT INTO `p_user_role` VALUES ('204', '1');
INSERT INTO `p_user_role` VALUES ('205', '1');
INSERT INTO `p_user_role` VALUES ('206', '1');
INSERT INTO `p_user_role` VALUES ('207', '1');
INSERT INTO `p_user_role` VALUES ('208', '1');
INSERT INTO `p_user_role` VALUES ('209', '1');
INSERT INTO `p_user_role` VALUES ('210', '1');
INSERT INTO `p_user_role` VALUES ('211', '1');
INSERT INTO `p_user_role` VALUES ('212', '1');
INSERT INTO `p_user_role` VALUES ('213', '1');
INSERT INTO `p_user_role` VALUES ('214', '1');
INSERT INTO `p_user_role` VALUES ('215', '1');
INSERT INTO `p_user_role` VALUES ('216', '1');
INSERT INTO `p_user_role` VALUES ('217', '1');
INSERT INTO `p_user_role` VALUES ('218', '1');
INSERT INTO `p_user_role` VALUES ('219', '1');
INSERT INTO `p_user_role` VALUES ('220', '1');
INSERT INTO `p_user_role` VALUES ('221', '1');
INSERT INTO `p_user_role` VALUES ('222', '1');
INSERT INTO `p_user_role` VALUES ('223', '1');
INSERT INTO `p_user_role` VALUES ('224', '1');
INSERT INTO `p_user_role` VALUES ('225', '1');
INSERT INTO `p_user_role` VALUES ('226', '1');
INSERT INTO `p_user_role` VALUES ('227', '1');
INSERT INTO `p_user_role` VALUES ('228', '1');
INSERT INTO `p_user_role` VALUES ('229', '1');
INSERT INTO `p_user_role` VALUES ('230', '1');
INSERT INTO `p_user_role` VALUES ('231', '1');
INSERT INTO `p_user_role` VALUES ('232', '1');
INSERT INTO `p_user_role` VALUES ('233', '1');
INSERT INTO `p_user_role` VALUES ('234', '1');
INSERT INTO `p_user_role` VALUES ('235', '1');
INSERT INTO `p_user_role` VALUES ('236', '1');
INSERT INTO `p_user_role` VALUES ('237', '1');
INSERT INTO `p_user_role` VALUES ('238', '1');
INSERT INTO `p_user_role` VALUES ('239', '1');
INSERT INTO `p_user_role` VALUES ('240', '1');
INSERT INTO `p_user_role` VALUES ('241', '1');
INSERT INTO `p_user_role` VALUES ('242', '1');
INSERT INTO `p_user_role` VALUES ('243', '1');
INSERT INTO `p_user_role` VALUES ('244', '1');
INSERT INTO `p_user_role` VALUES ('245', '1');
INSERT INTO `p_user_role` VALUES ('246', '1');
INSERT INTO `p_user_role` VALUES ('247', '1');
INSERT INTO `p_user_role` VALUES ('248', '1');
INSERT INTO `p_user_role` VALUES ('249', '1');
INSERT INTO `p_user_role` VALUES ('250', '1');
INSERT INTO `p_user_role` VALUES ('251', '1');
INSERT INTO `p_user_role` VALUES ('252', '1');
INSERT INTO `p_user_role` VALUES ('253', '1');
INSERT INTO `p_user_role` VALUES ('254', '1');
INSERT INTO `p_user_role` VALUES ('255', '1');
INSERT INTO `p_user_role` VALUES ('256', '1');
INSERT INTO `p_user_role` VALUES ('257', '1');
INSERT INTO `p_user_role` VALUES ('258', '1');
INSERT INTO `p_user_role` VALUES ('259', '1');
INSERT INTO `p_user_role` VALUES ('260', '1');
INSERT INTO `p_user_role` VALUES ('261', '1');
INSERT INTO `p_user_role` VALUES ('262', '1');
INSERT INTO `p_user_role` VALUES ('263', '1');
INSERT INTO `p_user_role` VALUES ('264', '1');
INSERT INTO `p_user_role` VALUES ('265', '1');
INSERT INTO `p_user_role` VALUES ('266', '1');
INSERT INTO `p_user_role` VALUES ('267', '1');
INSERT INTO `p_user_role` VALUES ('268', '1');
INSERT INTO `p_user_role` VALUES ('269', '1');
INSERT INTO `p_user_role` VALUES ('270', '1');
INSERT INTO `p_user_role` VALUES ('271', '1');
INSERT INTO `p_user_role` VALUES ('272', '1');
INSERT INTO `p_user_role` VALUES ('273', '1');
INSERT INTO `p_user_role` VALUES ('274', '1');
INSERT INTO `p_user_role` VALUES ('275', '1');
INSERT INTO `p_user_role` VALUES ('276', '1');
INSERT INTO `p_user_role` VALUES ('277', '1');
INSERT INTO `p_user_role` VALUES ('278', '1');
INSERT INTO `p_user_role` VALUES ('279', '1');
INSERT INTO `p_user_role` VALUES ('280', '1');
INSERT INTO `p_user_role` VALUES ('281', '1');
INSERT INTO `p_user_role` VALUES ('282', '1');
INSERT INTO `p_user_role` VALUES ('283', '1');
INSERT INTO `p_user_role` VALUES ('284', '1');
INSERT INTO `p_user_role` VALUES ('285', '1');
INSERT INTO `p_user_role` VALUES ('286', '1');
INSERT INTO `p_user_role` VALUES ('287', '1');
INSERT INTO `p_user_role` VALUES ('288', '1');
INSERT INTO `p_user_role` VALUES ('289', '1');
INSERT INTO `p_user_role` VALUES ('290', '1');
INSERT INTO `p_user_role` VALUES ('291', '1');
INSERT INTO `p_user_role` VALUES ('292', '1');
INSERT INTO `p_user_role` VALUES ('293', '1');
INSERT INTO `p_user_role` VALUES ('294', '1');
INSERT INTO `p_user_role` VALUES ('295', '1');
INSERT INTO `p_user_role` VALUES ('296', '1');
INSERT INTO `p_user_role` VALUES ('297', '1');
INSERT INTO `p_user_role` VALUES ('298', '1');
INSERT INTO `p_user_role` VALUES ('299', '1');
INSERT INTO `p_user_role` VALUES ('300', '1');
INSERT INTO `p_user_role` VALUES ('301', '1');
INSERT INTO `p_user_role` VALUES ('302', '1');
INSERT INTO `p_user_role` VALUES ('303', '1');
INSERT INTO `p_user_role` VALUES ('304', '1');
INSERT INTO `p_user_role` VALUES ('305', '1');
INSERT INTO `p_user_role` VALUES ('306', '1');
INSERT INTO `p_user_role` VALUES ('307', '1');
INSERT INTO `p_user_role` VALUES ('308', '1');
INSERT INTO `p_user_role` VALUES ('309', '1');
INSERT INTO `p_user_role` VALUES ('310', '1');
INSERT INTO `p_user_role` VALUES ('311', '1');
INSERT INTO `p_user_role` VALUES ('312', '1');
INSERT INTO `p_user_role` VALUES ('313', '1');
INSERT INTO `p_user_role` VALUES ('314', '1');
INSERT INTO `p_user_role` VALUES ('315', '1');
INSERT INTO `p_user_role` VALUES ('316', '1');
INSERT INTO `p_user_role` VALUES ('317', '1');
INSERT INTO `p_user_role` VALUES ('318', '1');
INSERT INTO `p_user_role` VALUES ('319', '1');
INSERT INTO `p_user_role` VALUES ('320', '1');
INSERT INTO `p_user_role` VALUES ('321', '1');
INSERT INTO `p_user_role` VALUES ('322', '1');
INSERT INTO `p_user_role` VALUES ('323', '1');
INSERT INTO `p_user_role` VALUES ('324', '1');
INSERT INTO `p_user_role` VALUES ('325', '1');
INSERT INTO `p_user_role` VALUES ('326', '1');
INSERT INTO `p_user_role` VALUES ('327', '1');
INSERT INTO `p_user_role` VALUES ('328', '1');
INSERT INTO `p_user_role` VALUES ('329', '1');
INSERT INTO `p_user_role` VALUES ('330', '1');
INSERT INTO `p_user_role` VALUES ('331', '1');
INSERT INTO `p_user_role` VALUES ('332', '1');
INSERT INTO `p_user_role` VALUES ('333', '1');
INSERT INTO `p_user_role` VALUES ('334', '1');
INSERT INTO `p_user_role` VALUES ('335', '1');
INSERT INTO `p_user_role` VALUES ('336', '1');
INSERT INTO `p_user_role` VALUES ('337', '1');
INSERT INTO `p_user_role` VALUES ('338', '1');
INSERT INTO `p_user_role` VALUES ('339', '1');
INSERT INTO `p_user_role` VALUES ('340', '1');
INSERT INTO `p_user_role` VALUES ('341', '1');
INSERT INTO `p_user_role` VALUES ('342', '1');
INSERT INTO `p_user_role` VALUES ('343', '1');
INSERT INTO `p_user_role` VALUES ('344', '1');
INSERT INTO `p_user_role` VALUES ('345', '1');
INSERT INTO `p_user_role` VALUES ('346', '1');
INSERT INTO `p_user_role` VALUES ('347', '1');
INSERT INTO `p_user_role` VALUES ('348', '1');
INSERT INTO `p_user_role` VALUES ('349', '1');
INSERT INTO `p_user_role` VALUES ('350', '1');
INSERT INTO `p_user_role` VALUES ('351', '1');
INSERT INTO `p_user_role` VALUES ('352', '1');
INSERT INTO `p_user_role` VALUES ('353', '1');
INSERT INTO `p_user_role` VALUES ('354', '1');
INSERT INTO `p_user_role` VALUES ('355', '1');
INSERT INTO `p_user_role` VALUES ('356', '1');
INSERT INTO `p_user_role` VALUES ('357', '1');
INSERT INTO `p_user_role` VALUES ('358', '1');
INSERT INTO `p_user_role` VALUES ('359', '1');
INSERT INTO `p_user_role` VALUES ('360', '1');
INSERT INTO `p_user_role` VALUES ('361', '1');
INSERT INTO `p_user_role` VALUES ('362', '1');
INSERT INTO `p_user_role` VALUES ('363', '1');
INSERT INTO `p_user_role` VALUES ('364', '1');
INSERT INTO `p_user_role` VALUES ('365', '1');
INSERT INTO `p_user_role` VALUES ('366', '1');
INSERT INTO `p_user_role` VALUES ('367', '1');
INSERT INTO `p_user_role` VALUES ('368', '1');
INSERT INTO `p_user_role` VALUES ('369', '1');
INSERT INTO `p_user_role` VALUES ('370', '1');
INSERT INTO `p_user_role` VALUES ('371', '1');
INSERT INTO `p_user_role` VALUES ('372', '1');
INSERT INTO `p_user_role` VALUES ('373', '1');
INSERT INTO `p_user_role` VALUES ('374', '1');
INSERT INTO `p_user_role` VALUES ('375', '1');
INSERT INTO `p_user_role` VALUES ('376', '1');
INSERT INTO `p_user_role` VALUES ('377', '1');
INSERT INTO `p_user_role` VALUES ('378', '1');
INSERT INTO `p_user_role` VALUES ('379', '1');
INSERT INTO `p_user_role` VALUES ('380', '1');
INSERT INTO `p_user_role` VALUES ('381', '1');
INSERT INTO `p_user_role` VALUES ('382', '1');
INSERT INTO `p_user_role` VALUES ('383', '1');
INSERT INTO `p_user_role` VALUES ('384', '1');
INSERT INTO `p_user_role` VALUES ('385', '1');
INSERT INTO `p_user_role` VALUES ('386', '1');
INSERT INTO `p_user_role` VALUES ('387', '1');
INSERT INTO `p_user_role` VALUES ('388', '1');
INSERT INTO `p_user_role` VALUES ('389', '1');
INSERT INTO `p_user_role` VALUES ('390', '1');
INSERT INTO `p_user_role` VALUES ('391', '1');
INSERT INTO `p_user_role` VALUES ('392', '1');
INSERT INTO `p_user_role` VALUES ('393', '1');
INSERT INTO `p_user_role` VALUES ('394', '1');
INSERT INTO `p_user_role` VALUES ('395', '1');
INSERT INTO `p_user_role` VALUES ('396', '1');
INSERT INTO `p_user_role` VALUES ('397', '1');
INSERT INTO `p_user_role` VALUES ('398', '1');
INSERT INTO `p_user_role` VALUES ('399', '1');
INSERT INTO `p_user_role` VALUES ('400', '1');
INSERT INTO `p_user_role` VALUES ('401', '1');
INSERT INTO `p_user_role` VALUES ('402', '1');
INSERT INTO `p_user_role` VALUES ('403', '1');
INSERT INTO `p_user_role` VALUES ('404', '1');
INSERT INTO `p_user_role` VALUES ('405', '1');
INSERT INTO `p_user_role` VALUES ('406', '1');
INSERT INTO `p_user_role` VALUES ('407', '1');
INSERT INTO `p_user_role` VALUES ('408', '1');
INSERT INTO `p_user_role` VALUES ('409', '1');
INSERT INTO `p_user_role` VALUES ('410', '1');
INSERT INTO `p_user_role` VALUES ('411', '1');
INSERT INTO `p_user_role` VALUES ('412', '1');
INSERT INTO `p_user_role` VALUES ('413', '1');
INSERT INTO `p_user_role` VALUES ('414', '1');
INSERT INTO `p_user_role` VALUES ('415', '1');
INSERT INTO `p_user_role` VALUES ('416', '1');
INSERT INTO `p_user_role` VALUES ('417', '1');
INSERT INTO `p_user_role` VALUES ('418', '1');
INSERT INTO `p_user_role` VALUES ('419', '1');
INSERT INTO `p_user_role` VALUES ('420', '1');
INSERT INTO `p_user_role` VALUES ('421', '1');
INSERT INTO `p_user_role` VALUES ('422', '1');
INSERT INTO `p_user_role` VALUES ('423', '1');
INSERT INTO `p_user_role` VALUES ('424', '1');
INSERT INTO `p_user_role` VALUES ('425', '1');
INSERT INTO `p_user_role` VALUES ('426', '1');
INSERT INTO `p_user_role` VALUES ('427', '1');
INSERT INTO `p_user_role` VALUES ('428', '1');
INSERT INTO `p_user_role` VALUES ('429', '1');
INSERT INTO `p_user_role` VALUES ('430', '1');
INSERT INTO `p_user_role` VALUES ('431', '1');
INSERT INTO `p_user_role` VALUES ('432', '1');
INSERT INTO `p_user_role` VALUES ('433', '1');
INSERT INTO `p_user_role` VALUES ('434', '1');
INSERT INTO `p_user_role` VALUES ('435', '1');
INSERT INTO `p_user_role` VALUES ('436', '1');
INSERT INTO `p_user_role` VALUES ('437', '1');
INSERT INTO `p_user_role` VALUES ('438', '1');
INSERT INTO `p_user_role` VALUES ('439', '1');
INSERT INTO `p_user_role` VALUES ('440', '1');
INSERT INTO `p_user_role` VALUES ('441', '1');
INSERT INTO `p_user_role` VALUES ('442', '1');
INSERT INTO `p_user_role` VALUES ('443', '1');
INSERT INTO `p_user_role` VALUES ('444', '1');
INSERT INTO `p_user_role` VALUES ('445', '1');
INSERT INTO `p_user_role` VALUES ('446', '1');
INSERT INTO `p_user_role` VALUES ('447', '1');
INSERT INTO `p_user_role` VALUES ('448', '1');
INSERT INTO `p_user_role` VALUES ('449', '1');
INSERT INTO `p_user_role` VALUES ('450', '1');
INSERT INTO `p_user_role` VALUES ('451', '1');
INSERT INTO `p_user_role` VALUES ('452', '1');
INSERT INTO `p_user_role` VALUES ('453', '1');
INSERT INTO `p_user_role` VALUES ('454', '1');
INSERT INTO `p_user_role` VALUES ('455', '1');
INSERT INTO `p_user_role` VALUES ('456', '1');
INSERT INTO `p_user_role` VALUES ('457', '1');
INSERT INTO `p_user_role` VALUES ('458', '1');
INSERT INTO `p_user_role` VALUES ('459', '1');
INSERT INTO `p_user_role` VALUES ('460', '1');
INSERT INTO `p_user_role` VALUES ('461', '1');
INSERT INTO `p_user_role` VALUES ('462', '1');
INSERT INTO `p_user_role` VALUES ('463', '1');
INSERT INTO `p_user_role` VALUES ('464', '1');
INSERT INTO `p_user_role` VALUES ('465', '1');
INSERT INTO `p_user_role` VALUES ('466', '1');
INSERT INTO `p_user_role` VALUES ('467', '1');
INSERT INTO `p_user_role` VALUES ('468', '1');
INSERT INTO `p_user_role` VALUES ('469', '1');
INSERT INTO `p_user_role` VALUES ('470', '1');
INSERT INTO `p_user_role` VALUES ('471', '1');
INSERT INTO `p_user_role` VALUES ('472', '1');
INSERT INTO `p_user_role` VALUES ('473', '1');
INSERT INTO `p_user_role` VALUES ('474', '1');
INSERT INTO `p_user_role` VALUES ('475', '1');
INSERT INTO `p_user_role` VALUES ('476', '1');
INSERT INTO `p_user_role` VALUES ('477', '1');
INSERT INTO `p_user_role` VALUES ('478', '1');
INSERT INTO `p_user_role` VALUES ('479', '1');
INSERT INTO `p_user_role` VALUES ('480', '1');
INSERT INTO `p_user_role` VALUES ('481', '1');
INSERT INTO `p_user_role` VALUES ('482', '1');
INSERT INTO `p_user_role` VALUES ('483', '1');
INSERT INTO `p_user_role` VALUES ('484', '1');
INSERT INTO `p_user_role` VALUES ('485', '1');
INSERT INTO `p_user_role` VALUES ('486', '1');
INSERT INTO `p_user_role` VALUES ('487', '1');
INSERT INTO `p_user_role` VALUES ('488', '1');
INSERT INTO `p_user_role` VALUES ('489', '1');
INSERT INTO `p_user_role` VALUES ('490', '1');
INSERT INTO `p_user_role` VALUES ('491', '1');
INSERT INTO `p_user_role` VALUES ('492', '1');
INSERT INTO `p_user_role` VALUES ('493', '1');
INSERT INTO `p_user_role` VALUES ('494', '1');
INSERT INTO `p_user_role` VALUES ('495', '1');
INSERT INTO `p_user_role` VALUES ('496', '1');
INSERT INTO `p_user_role` VALUES ('497', '1');
INSERT INTO `p_user_role` VALUES ('498', '1');
INSERT INTO `p_user_role` VALUES ('499', '1');
INSERT INTO `p_user_role` VALUES ('500', '1');
INSERT INTO `p_user_role` VALUES ('501', '1');
INSERT INTO `p_user_role` VALUES ('502', '1');
INSERT INTO `p_user_role` VALUES ('503', '1');
INSERT INTO `p_user_role` VALUES ('504', '1');
INSERT INTO `p_user_role` VALUES ('505', '1');
INSERT INTO `p_user_role` VALUES ('506', '1');
INSERT INTO `p_user_role` VALUES ('507', '1');
INSERT INTO `p_user_role` VALUES ('508', '1');
INSERT INTO `p_user_role` VALUES ('509', '1');
INSERT INTO `p_user_role` VALUES ('510', '1');
INSERT INTO `p_user_role` VALUES ('511', '1');
INSERT INTO `p_user_role` VALUES ('512', '1');
INSERT INTO `p_user_role` VALUES ('513', '1');
INSERT INTO `p_user_role` VALUES ('514', '1');
INSERT INTO `p_user_role` VALUES ('515', '1');
INSERT INTO `p_user_role` VALUES ('516', '1');
INSERT INTO `p_user_role` VALUES ('517', '1');
INSERT INTO `p_user_role` VALUES ('518', '1');
INSERT INTO `p_user_role` VALUES ('519', '1');
INSERT INTO `p_user_role` VALUES ('520', '1');
INSERT INTO `p_user_role` VALUES ('521', '1');
INSERT INTO `p_user_role` VALUES ('522', '1');
INSERT INTO `p_user_role` VALUES ('523', '1');
INSERT INTO `p_user_role` VALUES ('524', '1');
INSERT INTO `p_user_role` VALUES ('525', '1');
INSERT INTO `p_user_role` VALUES ('526', '1');
INSERT INTO `p_user_role` VALUES ('527', '1');
INSERT INTO `p_user_role` VALUES ('528', '1');
INSERT INTO `p_user_role` VALUES ('529', '1');
INSERT INTO `p_user_role` VALUES ('530', '1');
INSERT INTO `p_user_role` VALUES ('531', '1');
INSERT INTO `p_user_role` VALUES ('532', '1');
INSERT INTO `p_user_role` VALUES ('533', '1');
INSERT INTO `p_user_role` VALUES ('534', '1');
INSERT INTO `p_user_role` VALUES ('535', '1');
INSERT INTO `p_user_role` VALUES ('536', '1');
INSERT INTO `p_user_role` VALUES ('537', '1');
INSERT INTO `p_user_role` VALUES ('538', '1');
INSERT INTO `p_user_role` VALUES ('539', '1');
INSERT INTO `p_user_role` VALUES ('540', '1');
INSERT INTO `p_user_role` VALUES ('541', '1');
INSERT INTO `p_user_role` VALUES ('542', '1');
INSERT INTO `p_user_role` VALUES ('543', '1');
INSERT INTO `p_user_role` VALUES ('544', '1');
INSERT INTO `p_user_role` VALUES ('545', '1');
INSERT INTO `p_user_role` VALUES ('546', '1');
INSERT INTO `p_user_role` VALUES ('547', '1');
INSERT INTO `p_user_role` VALUES ('548', '1');
INSERT INTO `p_user_role` VALUES ('549', '1');
INSERT INTO `p_user_role` VALUES ('550', '1');
INSERT INTO `p_user_role` VALUES ('551', '1');
INSERT INTO `p_user_role` VALUES ('552', '1');
INSERT INTO `p_user_role` VALUES ('553', '1');
INSERT INTO `p_user_role` VALUES ('554', '1');
INSERT INTO `p_user_role` VALUES ('555', '1');
INSERT INTO `p_user_role` VALUES ('556', '1');
INSERT INTO `p_user_role` VALUES ('557', '1');
INSERT INTO `p_user_role` VALUES ('558', '1');
INSERT INTO `p_user_role` VALUES ('559', '1');
INSERT INTO `p_user_role` VALUES ('560', '1');
INSERT INTO `p_user_role` VALUES ('561', '1');
INSERT INTO `p_user_role` VALUES ('562', '1');
INSERT INTO `p_user_role` VALUES ('563', '1');
INSERT INTO `p_user_role` VALUES ('564', '1');
INSERT INTO `p_user_role` VALUES ('565', '1');
INSERT INTO `p_user_role` VALUES ('566', '1');
INSERT INTO `p_user_role` VALUES ('567', '1');
INSERT INTO `p_user_role` VALUES ('568', '1');
INSERT INTO `p_user_role` VALUES ('569', '1');
INSERT INTO `p_user_role` VALUES ('570', '1');
INSERT INTO `p_user_role` VALUES ('571', '1');
INSERT INTO `p_user_role` VALUES ('572', '1');
INSERT INTO `p_user_role` VALUES ('573', '1');
INSERT INTO `p_user_role` VALUES ('574', '1');
INSERT INTO `p_user_role` VALUES ('575', '1');
INSERT INTO `p_user_role` VALUES ('576', '1');
INSERT INTO `p_user_role` VALUES ('577', '1');
INSERT INTO `p_user_role` VALUES ('578', '1');
INSERT INTO `p_user_role` VALUES ('579', '1');
INSERT INTO `p_user_role` VALUES ('580', '1');
INSERT INTO `p_user_role` VALUES ('581', '1');
INSERT INTO `p_user_role` VALUES ('582', '1');
INSERT INTO `p_user_role` VALUES ('583', '1');
INSERT INTO `p_user_role` VALUES ('584', '1');
INSERT INTO `p_user_role` VALUES ('585', '1');
INSERT INTO `p_user_role` VALUES ('586', '1');
INSERT INTO `p_user_role` VALUES ('587', '1');
INSERT INTO `p_user_role` VALUES ('588', '1');
INSERT INTO `p_user_role` VALUES ('589', '1');
INSERT INTO `p_user_role` VALUES ('590', '1');
INSERT INTO `p_user_role` VALUES ('591', '1');
INSERT INTO `p_user_role` VALUES ('592', '1');
INSERT INTO `p_user_role` VALUES ('593', '1');
INSERT INTO `p_user_role` VALUES ('594', '1');
INSERT INTO `p_user_role` VALUES ('595', '1');
INSERT INTO `p_user_role` VALUES ('596', '1');
INSERT INTO `p_user_role` VALUES ('597', '1');
INSERT INTO `p_user_role` VALUES ('598', '1');
INSERT INTO `p_user_role` VALUES ('599', '1');
INSERT INTO `p_user_role` VALUES ('600', '1');
INSERT INTO `p_user_role` VALUES ('601', '1');
INSERT INTO `p_user_role` VALUES ('602', '1');
INSERT INTO `p_user_role` VALUES ('603', '1');
INSERT INTO `p_user_role` VALUES ('604', '1');
INSERT INTO `p_user_role` VALUES ('605', '1');
INSERT INTO `p_user_role` VALUES ('606', '1');
INSERT INTO `p_user_role` VALUES ('607', '1');
INSERT INTO `p_user_role` VALUES ('608', '1');
INSERT INTO `p_user_role` VALUES ('609', '1');
INSERT INTO `p_user_role` VALUES ('610', '1');
INSERT INTO `p_user_role` VALUES ('611', '1');
INSERT INTO `p_user_role` VALUES ('612', '1');
INSERT INTO `p_user_role` VALUES ('613', '1');
INSERT INTO `p_user_role` VALUES ('614', '1');
INSERT INTO `p_user_role` VALUES ('615', '1');
INSERT INTO `p_user_role` VALUES ('616', '1');
INSERT INTO `p_user_role` VALUES ('617', '1');
INSERT INTO `p_user_role` VALUES ('618', '1');
INSERT INTO `p_user_role` VALUES ('619', '1');
INSERT INTO `p_user_role` VALUES ('620', '1');
INSERT INTO `p_user_role` VALUES ('621', '1');
INSERT INTO `p_user_role` VALUES ('622', '1');
INSERT INTO `p_user_role` VALUES ('623', '1');
INSERT INTO `p_user_role` VALUES ('624', '1');
INSERT INTO `p_user_role` VALUES ('625', '1');
INSERT INTO `p_user_role` VALUES ('626', '1');
INSERT INTO `p_user_role` VALUES ('627', '1');
INSERT INTO `p_user_role` VALUES ('628', '1');
INSERT INTO `p_user_role` VALUES ('629', '1');
INSERT INTO `p_user_role` VALUES ('630', '1');
INSERT INTO `p_user_role` VALUES ('631', '1');
INSERT INTO `p_user_role` VALUES ('632', '1');
INSERT INTO `p_user_role` VALUES ('633', '1');
INSERT INTO `p_user_role` VALUES ('634', '1');
INSERT INTO `p_user_role` VALUES ('635', '1');
INSERT INTO `p_user_role` VALUES ('636', '1');
INSERT INTO `p_user_role` VALUES ('637', '1');
INSERT INTO `p_user_role` VALUES ('638', '1');
INSERT INTO `p_user_role` VALUES ('639', '1');
INSERT INTO `p_user_role` VALUES ('640', '1');
INSERT INTO `p_user_role` VALUES ('641', '1');
INSERT INTO `p_user_role` VALUES ('642', '1');
INSERT INTO `p_user_role` VALUES ('643', '1');
INSERT INTO `p_user_role` VALUES ('644', '1');
INSERT INTO `p_user_role` VALUES ('645', '1');
INSERT INTO `p_user_role` VALUES ('646', '1');
INSERT INTO `p_user_role` VALUES ('647', '1');
INSERT INTO `p_user_role` VALUES ('648', '1');
INSERT INTO `p_user_role` VALUES ('649', '1');
INSERT INTO `p_user_role` VALUES ('650', '1');
INSERT INTO `p_user_role` VALUES ('651', '1');
INSERT INTO `p_user_role` VALUES ('652', '1');
INSERT INTO `p_user_role` VALUES ('653', '1');
INSERT INTO `p_user_role` VALUES ('654', '1');
INSERT INTO `p_user_role` VALUES ('655', '1');
INSERT INTO `p_user_role` VALUES ('656', '1');
INSERT INTO `p_user_role` VALUES ('657', '1');
INSERT INTO `p_user_role` VALUES ('658', '1');
INSERT INTO `p_user_role` VALUES ('659', '1');
INSERT INTO `p_user_role` VALUES ('660', '1');
INSERT INTO `p_user_role` VALUES ('661', '1');
INSERT INTO `p_user_role` VALUES ('662', '1');
INSERT INTO `p_user_role` VALUES ('663', '1');
INSERT INTO `p_user_role` VALUES ('664', '1');
INSERT INTO `p_user_role` VALUES ('665', '1');
INSERT INTO `p_user_role` VALUES ('666', '1');
INSERT INTO `p_user_role` VALUES ('667', '1');
INSERT INTO `p_user_role` VALUES ('668', '1');
INSERT INTO `p_user_role` VALUES ('669', '1');
INSERT INTO `p_user_role` VALUES ('670', '1');
INSERT INTO `p_user_role` VALUES ('671', '1');
INSERT INTO `p_user_role` VALUES ('672', '1');
INSERT INTO `p_user_role` VALUES ('673', '1');
INSERT INTO `p_user_role` VALUES ('674', '1');
INSERT INTO `p_user_role` VALUES ('675', '1');
INSERT INTO `p_user_role` VALUES ('676', '1');
INSERT INTO `p_user_role` VALUES ('677', '1');
INSERT INTO `p_user_role` VALUES ('678', '1');
INSERT INTO `p_user_role` VALUES ('679', '1');
INSERT INTO `p_user_role` VALUES ('680', '1');
INSERT INTO `p_user_role` VALUES ('681', '1');
INSERT INTO `p_user_role` VALUES ('682', '1');
INSERT INTO `p_user_role` VALUES ('683', '1');
INSERT INTO `p_user_role` VALUES ('684', '1');
INSERT INTO `p_user_role` VALUES ('685', '1');
INSERT INTO `p_user_role` VALUES ('686', '1');
INSERT INTO `p_user_role` VALUES ('687', '1');
INSERT INTO `p_user_role` VALUES ('688', '1');
INSERT INTO `p_user_role` VALUES ('689', '1');
INSERT INTO `p_user_role` VALUES ('690', '1');
INSERT INTO `p_user_role` VALUES ('691', '1');
INSERT INTO `p_user_role` VALUES ('692', '1');
INSERT INTO `p_user_role` VALUES ('693', '1');
INSERT INTO `p_user_role` VALUES ('694', '1');
INSERT INTO `p_user_role` VALUES ('695', '1');
INSERT INTO `p_user_role` VALUES ('696', '1');
INSERT INTO `p_user_role` VALUES ('697', '1');
INSERT INTO `p_user_role` VALUES ('698', '1');
INSERT INTO `p_user_role` VALUES ('699', '1');
INSERT INTO `p_user_role` VALUES ('700', '1');
INSERT INTO `p_user_role` VALUES ('701', '1');
INSERT INTO `p_user_role` VALUES ('702', '1');
INSERT INTO `p_user_role` VALUES ('703', '1');
INSERT INTO `p_user_role` VALUES ('704', '1');
INSERT INTO `p_user_role` VALUES ('705', '1');
INSERT INTO `p_user_role` VALUES ('706', '1');
INSERT INTO `p_user_role` VALUES ('707', '1');
INSERT INTO `p_user_role` VALUES ('708', '1');
INSERT INTO `p_user_role` VALUES ('709', '1');
INSERT INTO `p_user_role` VALUES ('710', '1');
INSERT INTO `p_user_role` VALUES ('711', '1');
INSERT INTO `p_user_role` VALUES ('712', '1');
INSERT INTO `p_user_role` VALUES ('713', '1');
INSERT INTO `p_user_role` VALUES ('714', '1');
INSERT INTO `p_user_role` VALUES ('715', '1');
INSERT INTO `p_user_role` VALUES ('716', '1');
INSERT INTO `p_user_role` VALUES ('717', '1');
INSERT INTO `p_user_role` VALUES ('718', '1');
INSERT INTO `p_user_role` VALUES ('719', '1');
INSERT INTO `p_user_role` VALUES ('720', '1');
INSERT INTO `p_user_role` VALUES ('721', '1');
INSERT INTO `p_user_role` VALUES ('722', '1');
INSERT INTO `p_user_role` VALUES ('723', '1');
INSERT INTO `p_user_role` VALUES ('724', '1');
INSERT INTO `p_user_role` VALUES ('725', '1');
INSERT INTO `p_user_role` VALUES ('726', '1');
INSERT INTO `p_user_role` VALUES ('727', '1');
INSERT INTO `p_user_role` VALUES ('728', '1');
INSERT INTO `p_user_role` VALUES ('729', '1');
INSERT INTO `p_user_role` VALUES ('730', '1');
INSERT INTO `p_user_role` VALUES ('731', '1');
INSERT INTO `p_user_role` VALUES ('732', '1');
INSERT INTO `p_user_role` VALUES ('733', '1');
INSERT INTO `p_user_role` VALUES ('734', '1');
INSERT INTO `p_user_role` VALUES ('735', '1');
INSERT INTO `p_user_role` VALUES ('736', '1');
INSERT INTO `p_user_role` VALUES ('737', '1');
INSERT INTO `p_user_role` VALUES ('738', '1');
INSERT INTO `p_user_role` VALUES ('739', '1');
INSERT INTO `p_user_role` VALUES ('740', '1');
INSERT INTO `p_user_role` VALUES ('741', '1');
INSERT INTO `p_user_role` VALUES ('742', '1');
INSERT INTO `p_user_role` VALUES ('743', '1');
INSERT INTO `p_user_role` VALUES ('744', '1');
INSERT INTO `p_user_role` VALUES ('745', '1');
INSERT INTO `p_user_role` VALUES ('746', '1');
INSERT INTO `p_user_role` VALUES ('747', '1');
INSERT INTO `p_user_role` VALUES ('748', '1');
INSERT INTO `p_user_role` VALUES ('749', '1');
INSERT INTO `p_user_role` VALUES ('750', '1');
INSERT INTO `p_user_role` VALUES ('751', '1');
INSERT INTO `p_user_role` VALUES ('752', '1');
INSERT INTO `p_user_role` VALUES ('753', '1');
INSERT INTO `p_user_role` VALUES ('754', '1');
INSERT INTO `p_user_role` VALUES ('755', '1');
INSERT INTO `p_user_role` VALUES ('756', '1');
INSERT INTO `p_user_role` VALUES ('757', '1');
INSERT INTO `p_user_role` VALUES ('758', '1');
INSERT INTO `p_user_role` VALUES ('759', '1');
INSERT INTO `p_user_role` VALUES ('760', '1');
INSERT INTO `p_user_role` VALUES ('761', '1');
INSERT INTO `p_user_role` VALUES ('762', '1');
INSERT INTO `p_user_role` VALUES ('763', '1');
INSERT INTO `p_user_role` VALUES ('764', '1');
INSERT INTO `p_user_role` VALUES ('765', '1');
INSERT INTO `p_user_role` VALUES ('766', '1');
INSERT INTO `p_user_role` VALUES ('767', '1');
INSERT INTO `p_user_role` VALUES ('768', '1');
INSERT INTO `p_user_role` VALUES ('769', '1');
INSERT INTO `p_user_role` VALUES ('770', '1');
INSERT INTO `p_user_role` VALUES ('771', '1');
INSERT INTO `p_user_role` VALUES ('772', '1');
INSERT INTO `p_user_role` VALUES ('773', '1');
INSERT INTO `p_user_role` VALUES ('774', '1');
INSERT INTO `p_user_role` VALUES ('775', '1');
INSERT INTO `p_user_role` VALUES ('776', '1');
INSERT INTO `p_user_role` VALUES ('777', '1');
INSERT INTO `p_user_role` VALUES ('778', '1');
INSERT INTO `p_user_role` VALUES ('779', '1');
INSERT INTO `p_user_role` VALUES ('780', '1');
INSERT INTO `p_user_role` VALUES ('781', '1');
INSERT INTO `p_user_role` VALUES ('782', '1');
INSERT INTO `p_user_role` VALUES ('783', '1');
INSERT INTO `p_user_role` VALUES ('784', '1');
INSERT INTO `p_user_role` VALUES ('785', '1');
INSERT INTO `p_user_role` VALUES ('786', '1');
INSERT INTO `p_user_role` VALUES ('787', '1');
INSERT INTO `p_user_role` VALUES ('788', '1');
INSERT INTO `p_user_role` VALUES ('789', '1');
INSERT INTO `p_user_role` VALUES ('790', '1');
INSERT INTO `p_user_role` VALUES ('791', '1');
INSERT INTO `p_user_role` VALUES ('792', '1');
INSERT INTO `p_user_role` VALUES ('793', '1');
INSERT INTO `p_user_role` VALUES ('794', '1');
INSERT INTO `p_user_role` VALUES ('795', '1');
INSERT INTO `p_user_role` VALUES ('796', '1');
INSERT INTO `p_user_role` VALUES ('797', '1');
INSERT INTO `p_user_role` VALUES ('798', '1');
INSERT INTO `p_user_role` VALUES ('799', '1');
INSERT INTO `p_user_role` VALUES ('800', '1');
INSERT INTO `p_user_role` VALUES ('801', '1');
INSERT INTO `p_user_role` VALUES ('802', '1');
INSERT INTO `p_user_role` VALUES ('803', '1');
INSERT INTO `p_user_role` VALUES ('804', '1');
INSERT INTO `p_user_role` VALUES ('805', '1');
INSERT INTO `p_user_role` VALUES ('806', '1');
INSERT INTO `p_user_role` VALUES ('807', '1');
INSERT INTO `p_user_role` VALUES ('808', '1');
INSERT INTO `p_user_role` VALUES ('809', '1');
INSERT INTO `p_user_role` VALUES ('810', '1');
INSERT INTO `p_user_role` VALUES ('811', '1');
INSERT INTO `p_user_role` VALUES ('812', '1');
INSERT INTO `p_user_role` VALUES ('813', '1');
INSERT INTO `p_user_role` VALUES ('814', '1');
INSERT INTO `p_user_role` VALUES ('815', '1');
INSERT INTO `p_user_role` VALUES ('816', '1');
INSERT INTO `p_user_role` VALUES ('817', '1');
INSERT INTO `p_user_role` VALUES ('818', '1');
INSERT INTO `p_user_role` VALUES ('819', '1');
INSERT INTO `p_user_role` VALUES ('820', '1');
INSERT INTO `p_user_role` VALUES ('821', '1');
INSERT INTO `p_user_role` VALUES ('822', '1');
INSERT INTO `p_user_role` VALUES ('823', '1');
INSERT INTO `p_user_role` VALUES ('824', '1');
INSERT INTO `p_user_role` VALUES ('825', '1');
INSERT INTO `p_user_role` VALUES ('826', '1');
INSERT INTO `p_user_role` VALUES ('827', '1');
INSERT INTO `p_user_role` VALUES ('828', '1');
INSERT INTO `p_user_role` VALUES ('829', '1');
INSERT INTO `p_user_role` VALUES ('830', '1');
INSERT INTO `p_user_role` VALUES ('831', '1');
INSERT INTO `p_user_role` VALUES ('832', '1');
INSERT INTO `p_user_role` VALUES ('833', '1');
INSERT INTO `p_user_role` VALUES ('834', '1');
INSERT INTO `p_user_role` VALUES ('835', '1');
INSERT INTO `p_user_role` VALUES ('836', '1');
INSERT INTO `p_user_role` VALUES ('837', '1');
INSERT INTO `p_user_role` VALUES ('838', '1');
INSERT INTO `p_user_role` VALUES ('839', '1');
INSERT INTO `p_user_role` VALUES ('840', '1');
INSERT INTO `p_user_role` VALUES ('841', '1');
INSERT INTO `p_user_role` VALUES ('842', '1');
INSERT INTO `p_user_role` VALUES ('843', '1');
INSERT INTO `p_user_role` VALUES ('844', '1');
INSERT INTO `p_user_role` VALUES ('845', '1');
INSERT INTO `p_user_role` VALUES ('846', '1');
INSERT INTO `p_user_role` VALUES ('847', '1');
INSERT INTO `p_user_role` VALUES ('848', '1');
INSERT INTO `p_user_role` VALUES ('849', '1');
INSERT INTO `p_user_role` VALUES ('850', '1');
INSERT INTO `p_user_role` VALUES ('851', '1');
INSERT INTO `p_user_role` VALUES ('852', '1');
INSERT INTO `p_user_role` VALUES ('853', '1');
INSERT INTO `p_user_role` VALUES ('854', '1');
INSERT INTO `p_user_role` VALUES ('855', '1');
INSERT INTO `p_user_role` VALUES ('856', '1');
INSERT INTO `p_user_role` VALUES ('857', '1');
INSERT INTO `p_user_role` VALUES ('858', '1');
INSERT INTO `p_user_role` VALUES ('859', '1');
INSERT INTO `p_user_role` VALUES ('860', '1');
INSERT INTO `p_user_role` VALUES ('861', '1');
INSERT INTO `p_user_role` VALUES ('862', '1');
INSERT INTO `p_user_role` VALUES ('863', '1');
INSERT INTO `p_user_role` VALUES ('864', '1');
INSERT INTO `p_user_role` VALUES ('865', '1');
INSERT INTO `p_user_role` VALUES ('866', '1');
INSERT INTO `p_user_role` VALUES ('867', '1');
INSERT INTO `p_user_role` VALUES ('868', '1');
INSERT INTO `p_user_role` VALUES ('869', '1');
INSERT INTO `p_user_role` VALUES ('870', '1');
INSERT INTO `p_user_role` VALUES ('871', '1');
INSERT INTO `p_user_role` VALUES ('872', '1');
INSERT INTO `p_user_role` VALUES ('873', '1');
INSERT INTO `p_user_role` VALUES ('874', '1');
INSERT INTO `p_user_role` VALUES ('875', '1');
INSERT INTO `p_user_role` VALUES ('876', '1');
INSERT INTO `p_user_role` VALUES ('877', '1');
INSERT INTO `p_user_role` VALUES ('878', '1');
INSERT INTO `p_user_role` VALUES ('879', '1');
INSERT INTO `p_user_role` VALUES ('880', '1');
INSERT INTO `p_user_role` VALUES ('881', '1');
INSERT INTO `p_user_role` VALUES ('882', '1');
INSERT INTO `p_user_role` VALUES ('883', '1');
INSERT INTO `p_user_role` VALUES ('884', '1');
INSERT INTO `p_user_role` VALUES ('885', '1');
INSERT INTO `p_user_role` VALUES ('886', '1');
INSERT INTO `p_user_role` VALUES ('887', '1');
INSERT INTO `p_user_role` VALUES ('888', '1');
INSERT INTO `p_user_role` VALUES ('889', '1');
INSERT INTO `p_user_role` VALUES ('890', '1');
INSERT INTO `p_user_role` VALUES ('891', '1');
INSERT INTO `p_user_role` VALUES ('892', '1');
INSERT INTO `p_user_role` VALUES ('893', '1');
INSERT INTO `p_user_role` VALUES ('894', '1');
INSERT INTO `p_user_role` VALUES ('895', '1');
INSERT INTO `p_user_role` VALUES ('896', '1');
INSERT INTO `p_user_role` VALUES ('897', '1');
INSERT INTO `p_user_role` VALUES ('898', '1');
INSERT INTO `p_user_role` VALUES ('899', '1');
INSERT INTO `p_user_role` VALUES ('900', '1');
INSERT INTO `p_user_role` VALUES ('901', '1');
INSERT INTO `p_user_role` VALUES ('902', '1');
INSERT INTO `p_user_role` VALUES ('903', '1');
INSERT INTO `p_user_role` VALUES ('904', '1');
INSERT INTO `p_user_role` VALUES ('905', '1');
INSERT INTO `p_user_role` VALUES ('906', '1');
INSERT INTO `p_user_role` VALUES ('907', '1');
INSERT INTO `p_user_role` VALUES ('908', '1');
INSERT INTO `p_user_role` VALUES ('909', '1');
INSERT INTO `p_user_role` VALUES ('910', '1');
INSERT INTO `p_user_role` VALUES ('911', '1');
INSERT INTO `p_user_role` VALUES ('912', '1');
INSERT INTO `p_user_role` VALUES ('913', '1');
INSERT INTO `p_user_role` VALUES ('914', '1');
INSERT INTO `p_user_role` VALUES ('915', '1');
INSERT INTO `p_user_role` VALUES ('916', '1');
INSERT INTO `p_user_role` VALUES ('917', '1');
INSERT INTO `p_user_role` VALUES ('918', '1');
INSERT INTO `p_user_role` VALUES ('919', '1');
INSERT INTO `p_user_role` VALUES ('920', '1');
INSERT INTO `p_user_role` VALUES ('921', '1');
INSERT INTO `p_user_role` VALUES ('922', '1');
INSERT INTO `p_user_role` VALUES ('923', '1');
INSERT INTO `p_user_role` VALUES ('924', '1');
INSERT INTO `p_user_role` VALUES ('925', '1');
INSERT INTO `p_user_role` VALUES ('926', '1');
INSERT INTO `p_user_role` VALUES ('927', '1');
INSERT INTO `p_user_role` VALUES ('928', '1');
INSERT INTO `p_user_role` VALUES ('929', '1');
INSERT INTO `p_user_role` VALUES ('930', '1');
INSERT INTO `p_user_role` VALUES ('931', '1');
INSERT INTO `p_user_role` VALUES ('932', '1');
INSERT INTO `p_user_role` VALUES ('933', '1');
INSERT INTO `p_user_role` VALUES ('934', '1');
INSERT INTO `p_user_role` VALUES ('935', '1');
INSERT INTO `p_user_role` VALUES ('936', '1');
INSERT INTO `p_user_role` VALUES ('937', '1');
INSERT INTO `p_user_role` VALUES ('938', '1');
INSERT INTO `p_user_role` VALUES ('939', '1');
INSERT INTO `p_user_role` VALUES ('940', '1');
INSERT INTO `p_user_role` VALUES ('941', '1');
INSERT INTO `p_user_role` VALUES ('942', '1');
INSERT INTO `p_user_role` VALUES ('943', '1');
INSERT INTO `p_user_role` VALUES ('944', '1');
INSERT INTO `p_user_role` VALUES ('945', '1');
INSERT INTO `p_user_role` VALUES ('946', '1');
INSERT INTO `p_user_role` VALUES ('947', '1');
INSERT INTO `p_user_role` VALUES ('948', '1');
INSERT INTO `p_user_role` VALUES ('949', '1');
INSERT INTO `p_user_role` VALUES ('950', '1');
INSERT INTO `p_user_role` VALUES ('951', '1');
INSERT INTO `p_user_role` VALUES ('952', '1');
INSERT INTO `p_user_role` VALUES ('953', '1');
INSERT INTO `p_user_role` VALUES ('954', '1');
INSERT INTO `p_user_role` VALUES ('955', '1');
INSERT INTO `p_user_role` VALUES ('956', '1');
INSERT INTO `p_user_role` VALUES ('957', '1');
INSERT INTO `p_user_role` VALUES ('958', '1');
INSERT INTO `p_user_role` VALUES ('959', '1');
INSERT INTO `p_user_role` VALUES ('960', '1');
INSERT INTO `p_user_role` VALUES ('961', '1');
INSERT INTO `p_user_role` VALUES ('962', '1');
INSERT INTO `p_user_role` VALUES ('963', '1');
INSERT INTO `p_user_role` VALUES ('964', '1');
INSERT INTO `p_user_role` VALUES ('965', '1');
INSERT INTO `p_user_role` VALUES ('966', '1');
INSERT INTO `p_user_role` VALUES ('967', '1');
INSERT INTO `p_user_role` VALUES ('968', '1');
INSERT INTO `p_user_role` VALUES ('969', '1');
INSERT INTO `p_user_role` VALUES ('970', '1');
INSERT INTO `p_user_role` VALUES ('971', '1');
INSERT INTO `p_user_role` VALUES ('972', '1');
INSERT INTO `p_user_role` VALUES ('973', '1');
INSERT INTO `p_user_role` VALUES ('974', '1');
INSERT INTO `p_user_role` VALUES ('975', '1');
INSERT INTO `p_user_role` VALUES ('976', '1');
INSERT INTO `p_user_role` VALUES ('977', '1');
INSERT INTO `p_user_role` VALUES ('978', '1');
INSERT INTO `p_user_role` VALUES ('979', '1');
INSERT INTO `p_user_role` VALUES ('980', '1');
INSERT INTO `p_user_role` VALUES ('981', '1');
INSERT INTO `p_user_role` VALUES ('982', '1');
INSERT INTO `p_user_role` VALUES ('983', '1');
INSERT INTO `p_user_role` VALUES ('984', '1');
INSERT INTO `p_user_role` VALUES ('985', '1');
INSERT INTO `p_user_role` VALUES ('986', '1');
INSERT INTO `p_user_role` VALUES ('987', '1');
INSERT INTO `p_user_role` VALUES ('988', '1');
INSERT INTO `p_user_role` VALUES ('989', '1');
INSERT INTO `p_user_role` VALUES ('990', '1');
INSERT INTO `p_user_role` VALUES ('991', '1');
INSERT INTO `p_user_role` VALUES ('992', '1');
INSERT INTO `p_user_role` VALUES ('993', '1');
INSERT INTO `p_user_role` VALUES ('994', '1');
INSERT INTO `p_user_role` VALUES ('995', '1');
INSERT INTO `p_user_role` VALUES ('996', '1');
INSERT INTO `p_user_role` VALUES ('997', '1');
INSERT INTO `p_user_role` VALUES ('998', '1');
INSERT INTO `p_user_role` VALUES ('999', '1');
INSERT INTO `p_user_role` VALUES ('1000', '1');
INSERT INTO `p_user_role` VALUES ('1001', '1');
INSERT INTO `p_user_role` VALUES ('1002', '1');
INSERT INTO `p_user_role` VALUES ('1003', '1');
INSERT INTO `p_user_role` VALUES ('1004', '1');
INSERT INTO `p_user_role` VALUES ('1005', '1');
INSERT INTO `p_user_role` VALUES ('1006', '1');
INSERT INTO `p_user_role` VALUES ('1007', '1');
INSERT INTO `p_user_role` VALUES ('1008', '1');
INSERT INTO `p_user_role` VALUES ('1009', '1');
INSERT INTO `p_user_role` VALUES ('1010', '1');
INSERT INTO `p_user_role` VALUES ('1011', '1');
INSERT INTO `p_user_role` VALUES ('1012', '1');
INSERT INTO `p_user_role` VALUES ('1013', '1');
INSERT INTO `p_user_role` VALUES ('1014', '1');
INSERT INTO `p_user_role` VALUES ('1015', '1');
INSERT INTO `p_user_role` VALUES ('1016', '1');
INSERT INTO `p_user_role` VALUES ('1017', '1');
INSERT INTO `p_user_role` VALUES ('1018', '1');
INSERT INTO `p_user_role` VALUES ('1019', '1');
INSERT INTO `p_user_role` VALUES ('1020', '1');
INSERT INTO `p_user_role` VALUES ('1021', '1');
INSERT INTO `p_user_role` VALUES ('1022', '1');
INSERT INTO `p_user_role` VALUES ('1023', '1');
INSERT INTO `p_user_role` VALUES ('1024', '1');
INSERT INTO `p_user_role` VALUES ('1025', '1');
INSERT INTO `p_user_role` VALUES ('1026', '1');
INSERT INTO `p_user_role` VALUES ('1027', '1');
INSERT INTO `p_user_role` VALUES ('1028', '1');
INSERT INTO `p_user_role` VALUES ('1029', '1');
INSERT INTO `p_user_role` VALUES ('1030', '1');
INSERT INTO `p_user_role` VALUES ('1031', '1');
INSERT INTO `p_user_role` VALUES ('1032', '1');
INSERT INTO `p_user_role` VALUES ('1033', '1');
INSERT INTO `p_user_role` VALUES ('1034', '1');
INSERT INTO `p_user_role` VALUES ('1035', '1');
INSERT INTO `p_user_role` VALUES ('1036', '1');
INSERT INTO `p_user_role` VALUES ('1037', '1');
INSERT INTO `p_user_role` VALUES ('1038', '1');
INSERT INTO `p_user_role` VALUES ('1039', '1');
INSERT INTO `p_user_role` VALUES ('1040', '1');
INSERT INTO `p_user_role` VALUES ('1041', '1');
INSERT INTO `p_user_role` VALUES ('1042', '1');
INSERT INTO `p_user_role` VALUES ('1043', '1');
INSERT INTO `p_user_role` VALUES ('1044', '1');
INSERT INTO `p_user_role` VALUES ('1045', '1');
INSERT INTO `p_user_role` VALUES ('1046', '1');
INSERT INTO `p_user_role` VALUES ('1047', '1');
INSERT INTO `p_user_role` VALUES ('1048', '1');
INSERT INTO `p_user_role` VALUES ('1049', '1');
INSERT INTO `p_user_role` VALUES ('1050', '1');
INSERT INTO `p_user_role` VALUES ('1051', '1');
INSERT INTO `p_user_role` VALUES ('1052', '1');
INSERT INTO `p_user_role` VALUES ('1053', '1');
INSERT INTO `p_user_role` VALUES ('1054', '1');
INSERT INTO `p_user_role` VALUES ('1055', '1');
INSERT INTO `p_user_role` VALUES ('1056', '1');
INSERT INTO `p_user_role` VALUES ('1057', '1');
INSERT INTO `p_user_role` VALUES ('1058', '1');
INSERT INTO `p_user_role` VALUES ('1059', '1');
INSERT INTO `p_user_role` VALUES ('1060', '1');
INSERT INTO `p_user_role` VALUES ('1061', '1');
INSERT INTO `p_user_role` VALUES ('1062', '1');
INSERT INTO `p_user_role` VALUES ('1063', '1');
INSERT INTO `p_user_role` VALUES ('1064', '1');
INSERT INTO `p_user_role` VALUES ('1065', '1');
INSERT INTO `p_user_role` VALUES ('1066', '1');
INSERT INTO `p_user_role` VALUES ('1067', '1');
INSERT INTO `p_user_role` VALUES ('1068', '1');
INSERT INTO `p_user_role` VALUES ('1069', '1');
INSERT INTO `p_user_role` VALUES ('1070', '1');
INSERT INTO `p_user_role` VALUES ('1071', '1');
INSERT INTO `p_user_role` VALUES ('1072', '1');
INSERT INTO `p_user_role` VALUES ('1073', '1');
INSERT INTO `p_user_role` VALUES ('1074', '1');
INSERT INTO `p_user_role` VALUES ('1075', '1');
INSERT INTO `p_user_role` VALUES ('1076', '1');
INSERT INTO `p_user_role` VALUES ('1077', '1');
INSERT INTO `p_user_role` VALUES ('1078', '1');
INSERT INTO `p_user_role` VALUES ('1079', '1');
INSERT INTO `p_user_role` VALUES ('1080', '1');
INSERT INTO `p_user_role` VALUES ('1081', '1');
INSERT INTO `p_user_role` VALUES ('1082', '1');
INSERT INTO `p_user_role` VALUES ('1083', '1');
INSERT INTO `p_user_role` VALUES ('1084', '1');
INSERT INTO `p_user_role` VALUES ('1085', '1');
INSERT INTO `p_user_role` VALUES ('1086', '1');
INSERT INTO `p_user_role` VALUES ('1087', '1');
INSERT INTO `p_user_role` VALUES ('1088', '1');
INSERT INTO `p_user_role` VALUES ('1089', '1');
INSERT INTO `p_user_role` VALUES ('1090', '1');
INSERT INTO `p_user_role` VALUES ('1091', '1');
INSERT INTO `p_user_role` VALUES ('1092', '1');
INSERT INTO `p_user_role` VALUES ('1093', '1');
INSERT INTO `p_user_role` VALUES ('1094', '1');
INSERT INTO `p_user_role` VALUES ('1095', '1');
INSERT INTO `p_user_role` VALUES ('1096', '1');
INSERT INTO `p_user_role` VALUES ('1097', '1');
INSERT INTO `p_user_role` VALUES ('1098', '1');
INSERT INTO `p_user_role` VALUES ('1099', '1');
INSERT INTO `p_user_role` VALUES ('1100', '1');
INSERT INTO `p_user_role` VALUES ('1101', '1');
INSERT INTO `p_user_role` VALUES ('1102', '1');
INSERT INTO `p_user_role` VALUES ('1103', '1');
INSERT INTO `p_user_role` VALUES ('1104', '1');
INSERT INTO `p_user_role` VALUES ('1105', '1');
INSERT INTO `p_user_role` VALUES ('1106', '1');
INSERT INTO `p_user_role` VALUES ('1107', '1');
INSERT INTO `p_user_role` VALUES ('1108', '1');
INSERT INTO `p_user_role` VALUES ('1109', '1');
INSERT INTO `p_user_role` VALUES ('1110', '1');
INSERT INTO `p_user_role` VALUES ('1111', '1');
INSERT INTO `p_user_role` VALUES ('1112', '1');
INSERT INTO `p_user_role` VALUES ('1113', '1');
INSERT INTO `p_user_role` VALUES ('1114', '1');
INSERT INTO `p_user_role` VALUES ('1115', '1');
INSERT INTO `p_user_role` VALUES ('1116', '1');
INSERT INTO `p_user_role` VALUES ('1117', '1');
INSERT INTO `p_user_role` VALUES ('1118', '1');
INSERT INTO `p_user_role` VALUES ('1119', '1');
INSERT INTO `p_user_role` VALUES ('1120', '1');
INSERT INTO `p_user_role` VALUES ('1121', '1');
INSERT INTO `p_user_role` VALUES ('1122', '1');
INSERT INTO `p_user_role` VALUES ('1123', '1');
INSERT INTO `p_user_role` VALUES ('1124', '1');
INSERT INTO `p_user_role` VALUES ('1125', '1');
INSERT INTO `p_user_role` VALUES ('1126', '1');
INSERT INTO `p_user_role` VALUES ('1127', '1');
INSERT INTO `p_user_role` VALUES ('1128', '1');
INSERT INTO `p_user_role` VALUES ('1129', '1');
INSERT INTO `p_user_role` VALUES ('1130', '1');
INSERT INTO `p_user_role` VALUES ('1131', '1');
INSERT INTO `p_user_role` VALUES ('1132', '1');
INSERT INTO `p_user_role` VALUES ('1133', '1');
INSERT INTO `p_user_role` VALUES ('1134', '1');
INSERT INTO `p_user_role` VALUES ('1135', '1');
INSERT INTO `p_user_role` VALUES ('1136', '1');
INSERT INTO `p_user_role` VALUES ('1137', '1');
INSERT INTO `p_user_role` VALUES ('1138', '1');
INSERT INTO `p_user_role` VALUES ('1139', '1');
INSERT INTO `p_user_role` VALUES ('1140', '1');
INSERT INTO `p_user_role` VALUES ('1141', '1');
INSERT INTO `p_user_role` VALUES ('1142', '1');
INSERT INTO `p_user_role` VALUES ('1143', '1');
INSERT INTO `p_user_role` VALUES ('1144', '1');
INSERT INTO `p_user_role` VALUES ('1145', '1');
INSERT INTO `p_user_role` VALUES ('1146', '1');
INSERT INTO `p_user_role` VALUES ('1147', '1');
INSERT INTO `p_user_role` VALUES ('1148', '1');
INSERT INTO `p_user_role` VALUES ('1149', '1');
INSERT INTO `p_user_role` VALUES ('1150', '1');
INSERT INTO `p_user_role` VALUES ('1151', '1');
INSERT INTO `p_user_role` VALUES ('1152', '1');
INSERT INTO `p_user_role` VALUES ('1153', '1');
INSERT INTO `p_user_role` VALUES ('1154', '1');
INSERT INTO `p_user_role` VALUES ('1155', '1');
INSERT INTO `p_user_role` VALUES ('1156', '1');
INSERT INTO `p_user_role` VALUES ('1157', '1');
INSERT INTO `p_user_role` VALUES ('1158', '1');
INSERT INTO `p_user_role` VALUES ('1159', '1');
INSERT INTO `p_user_role` VALUES ('1160', '1');
INSERT INTO `p_user_role` VALUES ('1161', '1');
INSERT INTO `p_user_role` VALUES ('1162', '1');
INSERT INTO `p_user_role` VALUES ('1163', '1');
INSERT INTO `p_user_role` VALUES ('1164', '1');
INSERT INTO `p_user_role` VALUES ('1165', '1');
INSERT INTO `p_user_role` VALUES ('1166', '1');
INSERT INTO `p_user_role` VALUES ('1167', '1');
INSERT INTO `p_user_role` VALUES ('1168', '1');
INSERT INTO `p_user_role` VALUES ('1169', '1');
INSERT INTO `p_user_role` VALUES ('1170', '1');
INSERT INTO `p_user_role` VALUES ('1171', '1');
INSERT INTO `p_user_role` VALUES ('1172', '1');
INSERT INTO `p_user_role` VALUES ('1173', '1');
INSERT INTO `p_user_role` VALUES ('1174', '1');
INSERT INTO `p_user_role` VALUES ('1175', '1');
INSERT INTO `p_user_role` VALUES ('1176', '1');
INSERT INTO `p_user_role` VALUES ('1177', '1');
INSERT INTO `p_user_role` VALUES ('1178', '1');
INSERT INTO `p_user_role` VALUES ('1179', '1');
INSERT INTO `p_user_role` VALUES ('1180', '1');
INSERT INTO `p_user_role` VALUES ('1181', '1');
INSERT INTO `p_user_role` VALUES ('1182', '1');
INSERT INTO `p_user_role` VALUES ('1183', '1');
INSERT INTO `p_user_role` VALUES ('1184', '1');
INSERT INTO `p_user_role` VALUES ('1185', '1');
INSERT INTO `p_user_role` VALUES ('1186', '1');
INSERT INTO `p_user_role` VALUES ('1187', '1');
INSERT INTO `p_user_role` VALUES ('1188', '1');
INSERT INTO `p_user_role` VALUES ('1189', '1');
INSERT INTO `p_user_role` VALUES ('1190', '1');
INSERT INTO `p_user_role` VALUES ('1191', '1');
INSERT INTO `p_user_role` VALUES ('1192', '1');
INSERT INTO `p_user_role` VALUES ('1193', '1');
INSERT INTO `p_user_role` VALUES ('1194', '1');
INSERT INTO `p_user_role` VALUES ('1195', '1');
INSERT INTO `p_user_role` VALUES ('1196', '1');
INSERT INTO `p_user_role` VALUES ('1197', '1');
INSERT INTO `p_user_role` VALUES ('1198', '1');
INSERT INTO `p_user_role` VALUES ('1199', '1');
INSERT INTO `p_user_role` VALUES ('1200', '1');
INSERT INTO `p_user_role` VALUES ('1201', '1');
INSERT INTO `p_user_role` VALUES ('1202', '1');
INSERT INTO `p_user_role` VALUES ('1203', '1');
INSERT INTO `p_user_role` VALUES ('1204', '1');
INSERT INTO `p_user_role` VALUES ('1205', '1');
INSERT INTO `p_user_role` VALUES ('1206', '1');
INSERT INTO `p_user_role` VALUES ('1207', '1');
INSERT INTO `p_user_role` VALUES ('1208', '1');
INSERT INTO `p_user_role` VALUES ('1209', '1');
INSERT INTO `p_user_role` VALUES ('1210', '1');
INSERT INTO `p_user_role` VALUES ('1211', '1');
INSERT INTO `p_user_role` VALUES ('1212', '1');
INSERT INTO `p_user_role` VALUES ('1213', '1');
INSERT INTO `p_user_role` VALUES ('1214', '1');
INSERT INTO `p_user_role` VALUES ('1215', '1');
INSERT INTO `p_user_role` VALUES ('1216', '1');
INSERT INTO `p_user_role` VALUES ('1217', '1');
INSERT INTO `p_user_role` VALUES ('1218', '1');
INSERT INTO `p_user_role` VALUES ('1219', '1');
INSERT INTO `p_user_role` VALUES ('1220', '1');
INSERT INTO `p_user_role` VALUES ('1221', '1');
INSERT INTO `p_user_role` VALUES ('1222', '1');
INSERT INTO `p_user_role` VALUES ('1223', '1');
INSERT INTO `p_user_role` VALUES ('1224', '1');
INSERT INTO `p_user_role` VALUES ('1225', '1');
INSERT INTO `p_user_role` VALUES ('1226', '1');
INSERT INTO `p_user_role` VALUES ('1227', '1');
INSERT INTO `p_user_role` VALUES ('1228', '1');
INSERT INTO `p_user_role` VALUES ('1229', '1');
INSERT INTO `p_user_role` VALUES ('1230', '1');
INSERT INTO `p_user_role` VALUES ('1231', '1');
INSERT INTO `p_user_role` VALUES ('1232', '1');
INSERT INTO `p_user_role` VALUES ('1233', '1');
INSERT INTO `p_user_role` VALUES ('1234', '1');
INSERT INTO `p_user_role` VALUES ('1235', '1');
INSERT INTO `p_user_role` VALUES ('1236', '1');
INSERT INTO `p_user_role` VALUES ('1237', '1');
INSERT INTO `p_user_role` VALUES ('1238', '1');
INSERT INTO `p_user_role` VALUES ('1239', '1');
INSERT INTO `p_user_role` VALUES ('1240', '1');
INSERT INTO `p_user_role` VALUES ('1241', '1');
INSERT INTO `p_user_role` VALUES ('1242', '1');
INSERT INTO `p_user_role` VALUES ('1243', '1');
INSERT INTO `p_user_role` VALUES ('1244', '1');
INSERT INTO `p_user_role` VALUES ('1245', '1');
INSERT INTO `p_user_role` VALUES ('1246', '1');
INSERT INTO `p_user_role` VALUES ('1247', '1');
INSERT INTO `p_user_role` VALUES ('1248', '1');
INSERT INTO `p_user_role` VALUES ('1249', '1');
INSERT INTO `p_user_role` VALUES ('1250', '1');
INSERT INTO `p_user_role` VALUES ('1251', '1');
INSERT INTO `p_user_role` VALUES ('1252', '1');
INSERT INTO `p_user_role` VALUES ('1253', '1');
INSERT INTO `p_user_role` VALUES ('1254', '1');
INSERT INTO `p_user_role` VALUES ('1255', '1');
INSERT INTO `p_user_role` VALUES ('1256', '1');
INSERT INTO `p_user_role` VALUES ('1257', '1');
INSERT INTO `p_user_role` VALUES ('1258', '1');
INSERT INTO `p_user_role` VALUES ('1259', '1');
INSERT INTO `p_user_role` VALUES ('1260', '1');
INSERT INTO `p_user_role` VALUES ('1261', '1');
INSERT INTO `p_user_role` VALUES ('1262', '1');
INSERT INTO `p_user_role` VALUES ('1263', '1');
INSERT INTO `p_user_role` VALUES ('1264', '1');
INSERT INTO `p_user_role` VALUES ('1265', '1');
INSERT INTO `p_user_role` VALUES ('1266', '1');
INSERT INTO `p_user_role` VALUES ('1267', '1');
INSERT INTO `p_user_role` VALUES ('1268', '1');
INSERT INTO `p_user_role` VALUES ('1269', '1');
INSERT INTO `p_user_role` VALUES ('1270', '1');
INSERT INTO `p_user_role` VALUES ('1271', '1');
INSERT INTO `p_user_role` VALUES ('1272', '1');
INSERT INTO `p_user_role` VALUES ('1273', '1');
INSERT INTO `p_user_role` VALUES ('1274', '1');
INSERT INTO `p_user_role` VALUES ('1275', '1');
INSERT INTO `p_user_role` VALUES ('1276', '1');
INSERT INTO `p_user_role` VALUES ('1277', '1');
INSERT INTO `p_user_role` VALUES ('1278', '1');
INSERT INTO `p_user_role` VALUES ('1279', '1');
INSERT INTO `p_user_role` VALUES ('1280', '1');
INSERT INTO `p_user_role` VALUES ('1281', '1');
INSERT INTO `p_user_role` VALUES ('1282', '1');
INSERT INTO `p_user_role` VALUES ('1283', '1');
INSERT INTO `p_user_role` VALUES ('1284', '1');
INSERT INTO `p_user_role` VALUES ('1285', '1');
INSERT INTO `p_user_role` VALUES ('1286', '1');
INSERT INTO `p_user_role` VALUES ('1287', '1');
INSERT INTO `p_user_role` VALUES ('1288', '1');
INSERT INTO `p_user_role` VALUES ('1289', '1');
INSERT INTO `p_user_role` VALUES ('1290', '1');
INSERT INTO `p_user_role` VALUES ('1291', '1');
INSERT INTO `p_user_role` VALUES ('1292', '1');
INSERT INTO `p_user_role` VALUES ('1293', '1');
INSERT INTO `p_user_role` VALUES ('1294', '1');
INSERT INTO `p_user_role` VALUES ('1295', '1');
INSERT INTO `p_user_role` VALUES ('1296', '1');
INSERT INTO `p_user_role` VALUES ('1297', '1');
INSERT INTO `p_user_role` VALUES ('1298', '1');
INSERT INTO `p_user_role` VALUES ('1299', '1');
INSERT INTO `p_user_role` VALUES ('1300', '1');
INSERT INTO `p_user_role` VALUES ('1301', '1');
INSERT INTO `p_user_role` VALUES ('1302', '1');
INSERT INTO `p_user_role` VALUES ('1303', '1');
INSERT INTO `p_user_role` VALUES ('1304', '1');
INSERT INTO `p_user_role` VALUES ('1305', '1');
INSERT INTO `p_user_role` VALUES ('1306', '1');
INSERT INTO `p_user_role` VALUES ('1307', '1');
INSERT INTO `p_user_role` VALUES ('1308', '1');
INSERT INTO `p_user_role` VALUES ('1309', '1');
INSERT INTO `p_user_role` VALUES ('1310', '1');
INSERT INTO `p_user_role` VALUES ('1311', '1');
INSERT INTO `p_user_role` VALUES ('1312', '1');
INSERT INTO `p_user_role` VALUES ('1313', '1');
INSERT INTO `p_user_role` VALUES ('1314', '1');
INSERT INTO `p_user_role` VALUES ('1315', '1');
INSERT INTO `p_user_role` VALUES ('1316', '1');
INSERT INTO `p_user_role` VALUES ('1317', '1');
INSERT INTO `p_user_role` VALUES ('1318', '1');
INSERT INTO `p_user_role` VALUES ('1319', '1');
INSERT INTO `p_user_role` VALUES ('1320', '1');
INSERT INTO `p_user_role` VALUES ('1321', '1');
INSERT INTO `p_user_role` VALUES ('1322', '1');
INSERT INTO `p_user_role` VALUES ('1323', '1');
INSERT INTO `p_user_role` VALUES ('1324', '1');
INSERT INTO `p_user_role` VALUES ('1325', '1');
INSERT INTO `p_user_role` VALUES ('1326', '1');
INSERT INTO `p_user_role` VALUES ('1327', '1');
INSERT INTO `p_user_role` VALUES ('1328', '1');
INSERT INTO `p_user_role` VALUES ('1329', '1');
INSERT INTO `p_user_role` VALUES ('1330', '1');
INSERT INTO `p_user_role` VALUES ('1331', '1');
INSERT INTO `p_user_role` VALUES ('1332', '1');
INSERT INTO `p_user_role` VALUES ('1333', '1');
INSERT INTO `p_user_role` VALUES ('1334', '1');
INSERT INTO `p_user_role` VALUES ('1335', '1');
INSERT INTO `p_user_role` VALUES ('1336', '1');
INSERT INTO `p_user_role` VALUES ('1337', '1');
INSERT INTO `p_user_role` VALUES ('1338', '1');
INSERT INTO `p_user_role` VALUES ('1339', '1');
INSERT INTO `p_user_role` VALUES ('1340', '1');
INSERT INTO `p_user_role` VALUES ('1341', '1');
INSERT INTO `p_user_role` VALUES ('1342', '1');
INSERT INTO `p_user_role` VALUES ('1343', '1');
INSERT INTO `p_user_role` VALUES ('1344', '1');
INSERT INTO `p_user_role` VALUES ('1345', '1');
INSERT INTO `p_user_role` VALUES ('1346', '1');
INSERT INTO `p_user_role` VALUES ('1347', '1');
INSERT INTO `p_user_role` VALUES ('1348', '1');
INSERT INTO `p_user_role` VALUES ('1349', '1');
INSERT INTO `p_user_role` VALUES ('1350', '1');
INSERT INTO `p_user_role` VALUES ('1351', '1');
INSERT INTO `p_user_role` VALUES ('1352', '1');
INSERT INTO `p_user_role` VALUES ('1353', '1');
INSERT INTO `p_user_role` VALUES ('1354', '1');
INSERT INTO `p_user_role` VALUES ('1355', '1');
INSERT INTO `p_user_role` VALUES ('1356', '1');
INSERT INTO `p_user_role` VALUES ('1357', '1');
INSERT INTO `p_user_role` VALUES ('1358', '1');
INSERT INTO `p_user_role` VALUES ('1359', '1');
INSERT INTO `p_user_role` VALUES ('1360', '1');
INSERT INTO `p_user_role` VALUES ('1361', '1');
INSERT INTO `p_user_role` VALUES ('1362', '1');
INSERT INTO `p_user_role` VALUES ('1363', '1');
INSERT INTO `p_user_role` VALUES ('1364', '1');
INSERT INTO `p_user_role` VALUES ('1365', '1');
INSERT INTO `p_user_role` VALUES ('1366', '1');
INSERT INTO `p_user_role` VALUES ('1367', '1');
INSERT INTO `p_user_role` VALUES ('1368', '1');
INSERT INTO `p_user_role` VALUES ('1369', '1');
INSERT INTO `p_user_role` VALUES ('1370', '1');
INSERT INTO `p_user_role` VALUES ('1371', '1');
INSERT INTO `p_user_role` VALUES ('1372', '1');
INSERT INTO `p_user_role` VALUES ('1373', '1');
INSERT INTO `p_user_role` VALUES ('1374', '1');
INSERT INTO `p_user_role` VALUES ('1375', '1');
INSERT INTO `p_user_role` VALUES ('1376', '1');
INSERT INTO `p_user_role` VALUES ('1377', '1');
INSERT INTO `p_user_role` VALUES ('1378', '1');
INSERT INTO `p_user_role` VALUES ('1379', '1');
INSERT INTO `p_user_role` VALUES ('1380', '1');
INSERT INTO `p_user_role` VALUES ('1381', '1');
INSERT INTO `p_user_role` VALUES ('1382', '1');
INSERT INTO `p_user_role` VALUES ('1383', '1');
INSERT INTO `p_user_role` VALUES ('1384', '1');
INSERT INTO `p_user_role` VALUES ('1385', '1');
INSERT INTO `p_user_role` VALUES ('1386', '1');
INSERT INTO `p_user_role` VALUES ('1387', '1');
INSERT INTO `p_user_role` VALUES ('1388', '1');
INSERT INTO `p_user_role` VALUES ('1389', '1');
INSERT INTO `p_user_role` VALUES ('1390', '1');
INSERT INTO `p_user_role` VALUES ('1391', '1');
INSERT INTO `p_user_role` VALUES ('1392', '1');
INSERT INTO `p_user_role` VALUES ('1393', '1');
INSERT INTO `p_user_role` VALUES ('1394', '1');
INSERT INTO `p_user_role` VALUES ('1395', '1');
INSERT INTO `p_user_role` VALUES ('1396', '1');
INSERT INTO `p_user_role` VALUES ('1397', '1');
INSERT INTO `p_user_role` VALUES ('1398', '1');
INSERT INTO `p_user_role` VALUES ('1399', '1');
INSERT INTO `p_user_role` VALUES ('1400', '1');
INSERT INTO `p_user_role` VALUES ('1401', '1');
INSERT INTO `p_user_role` VALUES ('1402', '1');
INSERT INTO `p_user_role` VALUES ('1403', '1');
INSERT INTO `p_user_role` VALUES ('1733', '1');
INSERT INTO `p_user_role` VALUES ('1734', '1');
INSERT INTO `p_user_role` VALUES ('1735', '1');
INSERT INTO `p_user_role` VALUES ('1736', '1');
INSERT INTO `p_user_role` VALUES ('1737', '1');
INSERT INTO `p_user_role` VALUES ('1738', '1');
INSERT INTO `p_user_role` VALUES ('1739', '1');
INSERT INTO `p_user_role` VALUES ('1740', '1');
INSERT INTO `p_user_role` VALUES ('1741', '1');
INSERT INTO `p_user_role` VALUES ('1742', '1');
INSERT INTO `p_user_role` VALUES ('1743', '1');
INSERT INTO `p_user_role` VALUES ('1744', '1');
INSERT INTO `p_user_role` VALUES ('1745', '1');
INSERT INTO `p_user_role` VALUES ('1746', '1');
INSERT INTO `p_user_role` VALUES ('1747', '1');
INSERT INTO `p_user_role` VALUES ('1748', '1');
INSERT INTO `p_user_role` VALUES ('1749', '1');
INSERT INTO `p_user_role` VALUES ('1750', '1');
INSERT INTO `p_user_role` VALUES ('1751', '1');
INSERT INTO `p_user_role` VALUES ('1752', '1');
INSERT INTO `p_user_role` VALUES ('1753', '1');
INSERT INTO `p_user_role` VALUES ('1754', '1');
INSERT INTO `p_user_role` VALUES ('1755', '1');
INSERT INTO `p_user_role` VALUES ('1756', '1');
INSERT INTO `p_user_role` VALUES ('1757', '1');
INSERT INTO `p_user_role` VALUES ('1758', '1');
INSERT INTO `p_user_role` VALUES ('1759', '1');
INSERT INTO `p_user_role` VALUES ('1760', '1');
INSERT INTO `p_user_role` VALUES ('1761', '1');
INSERT INTO `p_user_role` VALUES ('1762', '1');
INSERT INTO `p_user_role` VALUES ('1763', '1');
INSERT INTO `p_user_role` VALUES ('1764', '1');
INSERT INTO `p_user_role` VALUES ('1765', '1');
INSERT INTO `p_user_role` VALUES ('1766', '1');
INSERT INTO `p_user_role` VALUES ('1767', '1');
INSERT INTO `p_user_role` VALUES ('1768', '1');
INSERT INTO `p_user_role` VALUES ('1769', '1');
INSERT INTO `p_user_role` VALUES ('1770', '1');
INSERT INTO `p_user_role` VALUES ('1771', '1');
INSERT INTO `p_user_role` VALUES ('1772', '1');
INSERT INTO `p_user_role` VALUES ('1773', '1');
INSERT INTO `p_user_role` VALUES ('1774', '1');
INSERT INTO `p_user_role` VALUES ('1775', '1');
INSERT INTO `p_user_role` VALUES ('1776', '1');
INSERT INTO `p_user_role` VALUES ('1777', '1');
INSERT INTO `p_user_role` VALUES ('1778', '1');
INSERT INTO `p_user_role` VALUES ('1779', '1');
INSERT INTO `p_user_role` VALUES ('1780', '1');
INSERT INTO `p_user_role` VALUES ('1781', '1');
INSERT INTO `p_user_role` VALUES ('1782', '1');
INSERT INTO `p_user_role` VALUES ('1783', '1');
INSERT INTO `p_user_role` VALUES ('1784', '1');
INSERT INTO `p_user_role` VALUES ('1785', '1');
INSERT INTO `p_user_role` VALUES ('1786', '1');
INSERT INTO `p_user_role` VALUES ('1787', '1');
INSERT INTO `p_user_role` VALUES ('1788', '1');
INSERT INTO `p_user_role` VALUES ('1789', '1');
INSERT INTO `p_user_role` VALUES ('1790', '1');
INSERT INTO `p_user_role` VALUES ('1791', '1');
INSERT INTO `p_user_role` VALUES ('1792', '1');
INSERT INTO `p_user_role` VALUES ('1793', '1');
INSERT INTO `p_user_role` VALUES ('1794', '1');
INSERT INTO `p_user_role` VALUES ('1795', '1');
INSERT INTO `p_user_role` VALUES ('1796', '1');
INSERT INTO `p_user_role` VALUES ('1797', '1');
INSERT INTO `p_user_role` VALUES ('1798', '1');
INSERT INTO `p_user_role` VALUES ('1799', '1');
INSERT INTO `p_user_role` VALUES ('1800', '1');
INSERT INTO `p_user_role` VALUES ('1801', '1');
INSERT INTO `p_user_role` VALUES ('1802', '1');
INSERT INTO `p_user_role` VALUES ('1803', '1');
INSERT INTO `p_user_role` VALUES ('1804', '1');
INSERT INTO `p_user_role` VALUES ('1805', '1');
INSERT INTO `p_user_role` VALUES ('1806', '1');
INSERT INTO `p_user_role` VALUES ('1807', '1');
INSERT INTO `p_user_role` VALUES ('1808', '1');
INSERT INTO `p_user_role` VALUES ('1809', '1');
INSERT INTO `p_user_role` VALUES ('1810', '1');
INSERT INTO `p_user_role` VALUES ('1811', '1');
INSERT INTO `p_user_role` VALUES ('1812', '1');
INSERT INTO `p_user_role` VALUES ('1813', '1');
INSERT INTO `p_user_role` VALUES ('1814', '1');
INSERT INTO `p_user_role` VALUES ('1815', '1');
INSERT INTO `p_user_role` VALUES ('1816', '1');
INSERT INTO `p_user_role` VALUES ('1817', '1');
INSERT INTO `p_user_role` VALUES ('1818', '1');
INSERT INTO `p_user_role` VALUES ('1819', '1');
INSERT INTO `p_user_role` VALUES ('1820', '1');
INSERT INTO `p_user_role` VALUES ('1821', '1');
INSERT INTO `p_user_role` VALUES ('1822', '1');
INSERT INTO `p_user_role` VALUES ('1823', '1');
INSERT INTO `p_user_role` VALUES ('1824', '1');
INSERT INTO `p_user_role` VALUES ('1825', '1');
INSERT INTO `p_user_role` VALUES ('1826', '1');
INSERT INTO `p_user_role` VALUES ('1827', '1');
INSERT INTO `p_user_role` VALUES ('1828', '1');
INSERT INTO `p_user_role` VALUES ('1829', '1');
INSERT INTO `p_user_role` VALUES ('1830', '1');
INSERT INTO `p_user_role` VALUES ('1831', '1');
INSERT INTO `p_user_role` VALUES ('1832', '1');
INSERT INTO `p_user_role` VALUES ('1833', '1');
INSERT INTO `p_user_role` VALUES ('1834', '1');
INSERT INTO `p_user_role` VALUES ('1835', '1');
INSERT INTO `p_user_role` VALUES ('1836', '1');
INSERT INTO `p_user_role` VALUES ('1837', '1');
INSERT INTO `p_user_role` VALUES ('1838', '1');
INSERT INTO `p_user_role` VALUES ('1839', '1');
INSERT INTO `p_user_role` VALUES ('1840', '1');
INSERT INTO `p_user_role` VALUES ('1841', '1');
INSERT INTO `p_user_role` VALUES ('1842', '1');
INSERT INTO `p_user_role` VALUES ('1843', '1');
INSERT INTO `p_user_role` VALUES ('1844', '1');
INSERT INTO `p_user_role` VALUES ('1845', '1');
INSERT INTO `p_user_role` VALUES ('1846', '1');
INSERT INTO `p_user_role` VALUES ('1847', '1');
INSERT INTO `p_user_role` VALUES ('1848', '1');
INSERT INTO `p_user_role` VALUES ('1849', '1');
INSERT INTO `p_user_role` VALUES ('1850', '1');
INSERT INTO `p_user_role` VALUES ('1851', '1');
INSERT INTO `p_user_role` VALUES ('1852', '1');
INSERT INTO `p_user_role` VALUES ('1853', '1');
INSERT INTO `p_user_role` VALUES ('1854', '1');
INSERT INTO `p_user_role` VALUES ('1855', '1');
INSERT INTO `p_user_role` VALUES ('1856', '1');
INSERT INTO `p_user_role` VALUES ('1857', '1');
INSERT INTO `p_user_role` VALUES ('1858', '1');
INSERT INTO `p_user_role` VALUES ('1859', '1');
INSERT INTO `p_user_role` VALUES ('1860', '1');
INSERT INTO `p_user_role` VALUES ('1861', '1');
INSERT INTO `p_user_role` VALUES ('1862', '1');
INSERT INTO `p_user_role` VALUES ('1863', '1');
INSERT INTO `p_user_role` VALUES ('1864', '1');
INSERT INTO `p_user_role` VALUES ('1865', '1');
INSERT INTO `p_user_role` VALUES ('1866', '1');
INSERT INTO `p_user_role` VALUES ('1867', '1');
INSERT INTO `p_user_role` VALUES ('1868', '1');
INSERT INTO `p_user_role` VALUES ('1869', '1');
INSERT INTO `p_user_role` VALUES ('1870', '1');
INSERT INTO `p_user_role` VALUES ('1871', '1');
INSERT INTO `p_user_role` VALUES ('1872', '1');
INSERT INTO `p_user_role` VALUES ('1873', '1');
INSERT INTO `p_user_role` VALUES ('1874', '1');
INSERT INTO `p_user_role` VALUES ('1875', '1');
INSERT INTO `p_user_role` VALUES ('1876', '1');
INSERT INTO `p_user_role` VALUES ('1877', '1');
INSERT INTO `p_user_role` VALUES ('1878', '1');
INSERT INTO `p_user_role` VALUES ('1879', '1');
INSERT INTO `p_user_role` VALUES ('1880', '1');
INSERT INTO `p_user_role` VALUES ('1881', '1');
INSERT INTO `p_user_role` VALUES ('1882', '1');
INSERT INTO `p_user_role` VALUES ('1883', '1');
INSERT INTO `p_user_role` VALUES ('1884', '1');
INSERT INTO `p_user_role` VALUES ('1885', '1');
INSERT INTO `p_user_role` VALUES ('1886', '1');
INSERT INTO `p_user_role` VALUES ('1887', '1');
INSERT INTO `p_user_role` VALUES ('1888', '1');
INSERT INTO `p_user_role` VALUES ('1889', '1');
INSERT INTO `p_user_role` VALUES ('1890', '1');
INSERT INTO `p_user_role` VALUES ('1891', '1');
INSERT INTO `p_user_role` VALUES ('1892', '1');
INSERT INTO `p_user_role` VALUES ('1893', '1');
INSERT INTO `p_user_role` VALUES ('1894', '1');
INSERT INTO `p_user_role` VALUES ('1895', '1');
INSERT INTO `p_user_role` VALUES ('1896', '1');
INSERT INTO `p_user_role` VALUES ('1897', '1');
INSERT INTO `p_user_role` VALUES ('1898', '1');
INSERT INTO `p_user_role` VALUES ('1899', '1');
INSERT INTO `p_user_role` VALUES ('1900', '1');
INSERT INTO `p_user_role` VALUES ('1901', '1');
INSERT INTO `p_user_role` VALUES ('1902', '1');
INSERT INTO `p_user_role` VALUES ('1903', '1');
INSERT INTO `p_user_role` VALUES ('1904', '1');
INSERT INTO `p_user_role` VALUES ('1905', '1');
INSERT INTO `p_user_role` VALUES ('1906', '1');
INSERT INTO `p_user_role` VALUES ('1907', '1');
INSERT INTO `p_user_role` VALUES ('1908', '1');
INSERT INTO `p_user_role` VALUES ('1909', '1');
INSERT INTO `p_user_role` VALUES ('1910', '1');
INSERT INTO `p_user_role` VALUES ('1911', '1');
INSERT INTO `p_user_role` VALUES ('1912', '1');
INSERT INTO `p_user_role` VALUES ('1913', '1');
INSERT INTO `p_user_role` VALUES ('1914', '1');
INSERT INTO `p_user_role` VALUES ('1915', '1');
INSERT INTO `p_user_role` VALUES ('1916', '1');
INSERT INTO `p_user_role` VALUES ('1917', '1');
INSERT INTO `p_user_role` VALUES ('1918', '1');
INSERT INTO `p_user_role` VALUES ('1919', '1');
INSERT INTO `p_user_role` VALUES ('1920', '1');
INSERT INTO `p_user_role` VALUES ('1921', '1');
INSERT INTO `p_user_role` VALUES ('1922', '1');
INSERT INTO `p_user_role` VALUES ('1923', '1');
INSERT INTO `p_user_role` VALUES ('1924', '1');
INSERT INTO `p_user_role` VALUES ('1925', '1');
INSERT INTO `p_user_role` VALUES ('1926', '1');
INSERT INTO `p_user_role` VALUES ('1927', '1');
INSERT INTO `p_user_role` VALUES ('1928', '1');
INSERT INTO `p_user_role` VALUES ('1929', '1');
INSERT INTO `p_user_role` VALUES ('1930', '1');
INSERT INTO `p_user_role` VALUES ('1931', '1');
INSERT INTO `p_user_role` VALUES ('1932', '1');
INSERT INTO `p_user_role` VALUES ('1933', '1');
INSERT INTO `p_user_role` VALUES ('1934', '1');
INSERT INTO `p_user_role` VALUES ('1935', '1');
INSERT INTO `p_user_role` VALUES ('1936', '1');
INSERT INTO `p_user_role` VALUES ('1937', '1');
INSERT INTO `p_user_role` VALUES ('1938', '1');
INSERT INTO `p_user_role` VALUES ('1939', '1');
INSERT INTO `p_user_role` VALUES ('1940', '1');
INSERT INTO `p_user_role` VALUES ('1941', '1');
INSERT INTO `p_user_role` VALUES ('1942', '1');
INSERT INTO `p_user_role` VALUES ('1943', '1');
INSERT INTO `p_user_role` VALUES ('1944', '1');
INSERT INTO `p_user_role` VALUES ('1945', '1');
INSERT INTO `p_user_role` VALUES ('1946', '1');
INSERT INTO `p_user_role` VALUES ('1947', '1');
INSERT INTO `p_user_role` VALUES ('1948', '1');
INSERT INTO `p_user_role` VALUES ('1949', '1');
INSERT INTO `p_user_role` VALUES ('1950', '1');
INSERT INTO `p_user_role` VALUES ('1951', '1');
INSERT INTO `p_user_role` VALUES ('1952', '1');
INSERT INTO `p_user_role` VALUES ('1953', '1');
INSERT INTO `p_user_role` VALUES ('1954', '1');
INSERT INTO `p_user_role` VALUES ('1955', '1');
INSERT INTO `p_user_role` VALUES ('1956', '1');
INSERT INTO `p_user_role` VALUES ('1957', '1');
INSERT INTO `p_user_role` VALUES ('1958', '1');
INSERT INTO `p_user_role` VALUES ('1959', '1');
INSERT INTO `p_user_role` VALUES ('1960', '1');
INSERT INTO `p_user_role` VALUES ('1961', '1');
INSERT INTO `p_user_role` VALUES ('1962', '1');
INSERT INTO `p_user_role` VALUES ('1963', '1');
INSERT INTO `p_user_role` VALUES ('1964', '1');
INSERT INTO `p_user_role` VALUES ('1965', '1');
INSERT INTO `p_user_role` VALUES ('1966', '1');
INSERT INTO `p_user_role` VALUES ('1967', '1');
INSERT INTO `p_user_role` VALUES ('1968', '1');
INSERT INTO `p_user_role` VALUES ('1969', '1');
INSERT INTO `p_user_role` VALUES ('1970', '1');
INSERT INTO `p_user_role` VALUES ('1971', '1');
INSERT INTO `p_user_role` VALUES ('1972', '1');
INSERT INTO `p_user_role` VALUES ('1973', '1');
INSERT INTO `p_user_role` VALUES ('1974', '1');
INSERT INTO `p_user_role` VALUES ('1975', '1');
INSERT INTO `p_user_role` VALUES ('1976', '1');
INSERT INTO `p_user_role` VALUES ('1977', '1');
INSERT INTO `p_user_role` VALUES ('1978', '1');
INSERT INTO `p_user_role` VALUES ('1979', '1');
INSERT INTO `p_user_role` VALUES ('1980', '1');
INSERT INTO `p_user_role` VALUES ('1981', '1');
INSERT INTO `p_user_role` VALUES ('1982', '1');
INSERT INTO `p_user_role` VALUES ('1983', '1');
INSERT INTO `p_user_role` VALUES ('1984', '1');
INSERT INTO `p_user_role` VALUES ('1985', '1');
INSERT INTO `p_user_role` VALUES ('1986', '1');
INSERT INTO `p_user_role` VALUES ('1987', '1');
INSERT INTO `p_user_role` VALUES ('1988', '1');
INSERT INTO `p_user_role` VALUES ('1989', '1');
INSERT INTO `p_user_role` VALUES ('1990', '1');
INSERT INTO `p_user_role` VALUES ('1991', '1');
INSERT INTO `p_user_role` VALUES ('1992', '1');
INSERT INTO `p_user_role` VALUES ('1993', '1');
INSERT INTO `p_user_role` VALUES ('1994', '1');
INSERT INTO `p_user_role` VALUES ('1995', '1');
INSERT INTO `p_user_role` VALUES ('1996', '1');
INSERT INTO `p_user_role` VALUES ('1997', '1');
INSERT INTO `p_user_role` VALUES ('1998', '1');
INSERT INTO `p_user_role` VALUES ('1999', '1');
INSERT INTO `p_user_role` VALUES ('2000', '1');
INSERT INTO `p_user_role` VALUES ('2001', '1');
INSERT INTO `p_user_role` VALUES ('2002', '1');
INSERT INTO `p_user_role` VALUES ('2003', '1');
INSERT INTO `p_user_role` VALUES ('2004', '1');
INSERT INTO `p_user_role` VALUES ('2005', '1');
INSERT INTO `p_user_role` VALUES ('2006', '1');
INSERT INTO `p_user_role` VALUES ('2007', '1');
INSERT INTO `p_user_role` VALUES ('2008', '1');
INSERT INTO `p_user_role` VALUES ('2009', '1');
INSERT INTO `p_user_role` VALUES ('2010', '1');
INSERT INTO `p_user_role` VALUES ('2011', '1');
INSERT INTO `p_user_role` VALUES ('2012', '1');
INSERT INTO `p_user_role` VALUES ('2013', '1');
INSERT INTO `p_user_role` VALUES ('2014', '1');
INSERT INTO `p_user_role` VALUES ('2015', '1');
INSERT INTO `p_user_role` VALUES ('2016', '1');
INSERT INTO `p_user_role` VALUES ('2017', '1');
INSERT INTO `p_user_role` VALUES ('2018', '1');
INSERT INTO `p_user_role` VALUES ('2019', '1');
INSERT INTO `p_user_role` VALUES ('2020', '1');
INSERT INTO `p_user_role` VALUES ('2021', '1');
INSERT INTO `p_user_role` VALUES ('2022', '1');
INSERT INTO `p_user_role` VALUES ('2023', '1');
INSERT INTO `p_user_role` VALUES ('2024', '1');
INSERT INTO `p_user_role` VALUES ('2025', '1');
INSERT INTO `p_user_role` VALUES ('2026', '1');
INSERT INTO `p_user_role` VALUES ('2027', '1');
INSERT INTO `p_user_role` VALUES ('2028', '1');
INSERT INTO `p_user_role` VALUES ('2029', '1');
INSERT INTO `p_user_role` VALUES ('2030', '1');
INSERT INTO `p_user_role` VALUES ('2031', '1');
INSERT INTO `p_user_role` VALUES ('2032', '1');
INSERT INTO `p_user_role` VALUES ('2033', '1');
INSERT INTO `p_user_role` VALUES ('2034', '1');
INSERT INTO `p_user_role` VALUES ('2035', '1');
INSERT INTO `p_user_role` VALUES ('2036', '1');
INSERT INTO `p_user_role` VALUES ('2037', '1');
INSERT INTO `p_user_role` VALUES ('2038', '1');
INSERT INTO `p_user_role` VALUES ('2039', '1');
INSERT INTO `p_user_role` VALUES ('2040', '1');
INSERT INTO `p_user_role` VALUES ('2041', '1');
INSERT INTO `p_user_role` VALUES ('2042', '1');
INSERT INTO `p_user_role` VALUES ('2043', '1');
INSERT INTO `p_user_role` VALUES ('2044', '1');
INSERT INTO `p_user_role` VALUES ('2045', '1');
INSERT INTO `p_user_role` VALUES ('2046', '1');
INSERT INTO `p_user_role` VALUES ('2047', '1');
INSERT INTO `p_user_role` VALUES ('2048', '1');
INSERT INTO `p_user_role` VALUES ('2049', '1');
INSERT INTO `p_user_role` VALUES ('2050', '1');
INSERT INTO `p_user_role` VALUES ('2051', '1');
INSERT INTO `p_user_role` VALUES ('2052', '1');
INSERT INTO `p_user_role` VALUES ('2053', '1');
INSERT INTO `p_user_role` VALUES ('2054', '1');
INSERT INTO `p_user_role` VALUES ('2055', '1');
INSERT INTO `p_user_role` VALUES ('2056', '1');
INSERT INTO `p_user_role` VALUES ('2057', '1');
INSERT INTO `p_user_role` VALUES ('2058', '1');
INSERT INTO `p_user_role` VALUES ('2059', '1');
INSERT INTO `p_user_role` VALUES ('2060', '1');
INSERT INTO `p_user_role` VALUES ('2061', '1');
INSERT INTO `p_user_role` VALUES ('2062', '1');
INSERT INTO `p_user_role` VALUES ('2063', '1');
INSERT INTO `p_user_role` VALUES ('2064', '1');
INSERT INTO `p_user_role` VALUES ('2065', '1');
INSERT INTO `p_user_role` VALUES ('2066', '1');
INSERT INTO `p_user_role` VALUES ('2067', '1');
INSERT INTO `p_user_role` VALUES ('2068', '1');
INSERT INTO `p_user_role` VALUES ('2069', '1');
INSERT INTO `p_user_role` VALUES ('2070', '1');
INSERT INTO `p_user_role` VALUES ('2071', '1');
INSERT INTO `p_user_role` VALUES ('2072', '1');
INSERT INTO `p_user_role` VALUES ('2073', '1');
INSERT INTO `p_user_role` VALUES ('2074', '1');
INSERT INTO `p_user_role` VALUES ('2075', '1');
INSERT INTO `p_user_role` VALUES ('2076', '1');
INSERT INTO `p_user_role` VALUES ('2077', '1');
INSERT INTO `p_user_role` VALUES ('2078', '1');
INSERT INTO `p_user_role` VALUES ('2079', '1');
INSERT INTO `p_user_role` VALUES ('2080', '1');
INSERT INTO `p_user_role` VALUES ('2081', '1');
INSERT INTO `p_user_role` VALUES ('2082', '1');
INSERT INTO `p_user_role` VALUES ('2083', '1');
INSERT INTO `p_user_role` VALUES ('2084', '1');
INSERT INTO `p_user_role` VALUES ('2085', '1');
INSERT INTO `p_user_role` VALUES ('2086', '1');
INSERT INTO `p_user_role` VALUES ('2087', '1');
INSERT INTO `p_user_role` VALUES ('2088', '1');
INSERT INTO `p_user_role` VALUES ('2089', '1');
INSERT INTO `p_user_role` VALUES ('2090', '1');
INSERT INTO `p_user_role` VALUES ('2091', '1');
INSERT INTO `p_user_role` VALUES ('2092', '1');
INSERT INTO `p_user_role` VALUES ('2093', '1');
INSERT INTO `p_user_role` VALUES ('2094', '1');
INSERT INTO `p_user_role` VALUES ('2095', '1');
INSERT INTO `p_user_role` VALUES ('2096', '1');
INSERT INTO `p_user_role` VALUES ('2097', '1');
INSERT INTO `p_user_role` VALUES ('2098', '1');
INSERT INTO `p_user_role` VALUES ('2099', '1');
INSERT INTO `p_user_role` VALUES ('2100', '1');
INSERT INTO `p_user_role` VALUES ('2101', '1');
INSERT INTO `p_user_role` VALUES ('2102', '1');
INSERT INTO `p_user_role` VALUES ('2103', '1');
INSERT INTO `p_user_role` VALUES ('2104', '1');
INSERT INTO `p_user_role` VALUES ('2105', '1');
INSERT INTO `p_user_role` VALUES ('2106', '1');
INSERT INTO `p_user_role` VALUES ('2107', '1');
INSERT INTO `p_user_role` VALUES ('2108', '1');
INSERT INTO `p_user_role` VALUES ('2109', '1');
INSERT INTO `p_user_role` VALUES ('2110', '1');
INSERT INTO `p_user_role` VALUES ('2111', '1');
INSERT INTO `p_user_role` VALUES ('2112', '1');
INSERT INTO `p_user_role` VALUES ('2113', '1');
INSERT INTO `p_user_role` VALUES ('2114', '1');
INSERT INTO `p_user_role` VALUES ('2115', '1');
INSERT INTO `p_user_role` VALUES ('2116', '1');
INSERT INTO `p_user_role` VALUES ('2117', '1');
INSERT INTO `p_user_role` VALUES ('2118', '1');
INSERT INTO `p_user_role` VALUES ('2119', '1');
INSERT INTO `p_user_role` VALUES ('2120', '1');
INSERT INTO `p_user_role` VALUES ('2121', '1');
INSERT INTO `p_user_role` VALUES ('2122', '1');
INSERT INTO `p_user_role` VALUES ('2123', '1');
INSERT INTO `p_user_role` VALUES ('2124', '1');
INSERT INTO `p_user_role` VALUES ('2125', '1');
INSERT INTO `p_user_role` VALUES ('2126', '1');
INSERT INTO `p_user_role` VALUES ('2127', '1');
INSERT INTO `p_user_role` VALUES ('2128', '1');
INSERT INTO `p_user_role` VALUES ('2129', '1');
INSERT INTO `p_user_role` VALUES ('2130', '1');
INSERT INTO `p_user_role` VALUES ('2131', '1');
INSERT INTO `p_user_role` VALUES ('2132', '1');
INSERT INTO `p_user_role` VALUES ('2133', '1');
INSERT INTO `p_user_role` VALUES ('2134', '1');
INSERT INTO `p_user_role` VALUES ('2135', '1');
INSERT INTO `p_user_role` VALUES ('2136', '1');
INSERT INTO `p_user_role` VALUES ('2137', '1');
INSERT INTO `p_user_role` VALUES ('2138', '1');
INSERT INTO `p_user_role` VALUES ('2139', '1');
INSERT INTO `p_user_role` VALUES ('2140', '1');
INSERT INTO `p_user_role` VALUES ('2141', '1');
INSERT INTO `p_user_role` VALUES ('2142', '1');
INSERT INTO `p_user_role` VALUES ('2143', '1');
INSERT INTO `p_user_role` VALUES ('2144', '1');
INSERT INTO `p_user_role` VALUES ('2145', '1');
INSERT INTO `p_user_role` VALUES ('2146', '1');
INSERT INTO `p_user_role` VALUES ('2147', '1');
INSERT INTO `p_user_role` VALUES ('2148', '1');
INSERT INTO `p_user_role` VALUES ('2149', '1');
INSERT INTO `p_user_role` VALUES ('2150', '1');
INSERT INTO `p_user_role` VALUES ('2151', '1');
INSERT INTO `p_user_role` VALUES ('2152', '1');
INSERT INTO `p_user_role` VALUES ('2153', '1');
INSERT INTO `p_user_role` VALUES ('2154', '1');
INSERT INTO `p_user_role` VALUES ('2155', '1');
INSERT INTO `p_user_role` VALUES ('2156', '1');
INSERT INTO `p_user_role` VALUES ('2157', '1');
INSERT INTO `p_user_role` VALUES ('2158', '1');
INSERT INTO `p_user_role` VALUES ('2159', '1');
INSERT INTO `p_user_role` VALUES ('2160', '1');
INSERT INTO `p_user_role` VALUES ('2161', '1');
INSERT INTO `p_user_role` VALUES ('2162', '1');
INSERT INTO `p_user_role` VALUES ('2163', '1');
INSERT INTO `p_user_role` VALUES ('2164', '1');
INSERT INTO `p_user_role` VALUES ('2165', '1');
INSERT INTO `p_user_role` VALUES ('2166', '1');
INSERT INTO `p_user_role` VALUES ('2167', '1');
INSERT INTO `p_user_role` VALUES ('2168', '1');
INSERT INTO `p_user_role` VALUES ('2169', '1');
INSERT INTO `p_user_role` VALUES ('2170', '1');
INSERT INTO `p_user_role` VALUES ('2171', '1');
INSERT INTO `p_user_role` VALUES ('2172', '1');
INSERT INTO `p_user_role` VALUES ('2173', '1');
INSERT INTO `p_user_role` VALUES ('2174', '1');
INSERT INTO `p_user_role` VALUES ('2175', '1');
INSERT INTO `p_user_role` VALUES ('2176', '1');
INSERT INTO `p_user_role` VALUES ('2177', '1');
INSERT INTO `p_user_role` VALUES ('2178', '1');
INSERT INTO `p_user_role` VALUES ('2179', '1');
INSERT INTO `p_user_role` VALUES ('2180', '1');
INSERT INTO `p_user_role` VALUES ('2181', '1');
INSERT INTO `p_user_role` VALUES ('2182', '1');
INSERT INTO `p_user_role` VALUES ('2183', '1');
INSERT INTO `p_user_role` VALUES ('2184', '1');
INSERT INTO `p_user_role` VALUES ('2185', '1');
INSERT INTO `p_user_role` VALUES ('2186', '1');
INSERT INTO `p_user_role` VALUES ('2187', '1');
INSERT INTO `p_user_role` VALUES ('2188', '1');
INSERT INTO `p_user_role` VALUES ('2189', '1');
INSERT INTO `p_user_role` VALUES ('2190', '1');
INSERT INTO `p_user_role` VALUES ('2191', '1');
INSERT INTO `p_user_role` VALUES ('2192', '1');
INSERT INTO `p_user_role` VALUES ('2193', '1');
INSERT INTO `p_user_role` VALUES ('2194', '1');
INSERT INTO `p_user_role` VALUES ('2195', '1');
INSERT INTO `p_user_role` VALUES ('2196', '1');
INSERT INTO `p_user_role` VALUES ('2197', '1');
INSERT INTO `p_user_role` VALUES ('2198', '1');
INSERT INTO `p_user_role` VALUES ('2199', '1');
INSERT INTO `p_user_role` VALUES ('2200', '1');
INSERT INTO `p_user_role` VALUES ('2201', '1');
INSERT INTO `p_user_role` VALUES ('2202', '1');
INSERT INTO `p_user_role` VALUES ('2203', '1');
INSERT INTO `p_user_role` VALUES ('2204', '1');
INSERT INTO `p_user_role` VALUES ('2205', '1');
INSERT INTO `p_user_role` VALUES ('2206', '1');
INSERT INTO `p_user_role` VALUES ('2207', '1');
INSERT INTO `p_user_role` VALUES ('2208', '1');
INSERT INTO `p_user_role` VALUES ('2209', '1');
INSERT INTO `p_user_role` VALUES ('2210', '1');
INSERT INTO `p_user_role` VALUES ('2211', '1');
INSERT INTO `p_user_role` VALUES ('2212', '1');
INSERT INTO `p_user_role` VALUES ('2213', '1');
INSERT INTO `p_user_role` VALUES ('2214', '1');
INSERT INTO `p_user_role` VALUES ('2215', '1');
INSERT INTO `p_user_role` VALUES ('2216', '1');
INSERT INTO `p_user_role` VALUES ('2217', '1');
INSERT INTO `p_user_role` VALUES ('2218', '1');
INSERT INTO `p_user_role` VALUES ('2219', '1');
INSERT INTO `p_user_role` VALUES ('2220', '1');
INSERT INTO `p_user_role` VALUES ('2221', '1');
INSERT INTO `p_user_role` VALUES ('2222', '1');
INSERT INTO `p_user_role` VALUES ('2223', '1');
INSERT INTO `p_user_role` VALUES ('2224', '1');
INSERT INTO `p_user_role` VALUES ('2225', '1');
INSERT INTO `p_user_role` VALUES ('2226', '1');
INSERT INTO `p_user_role` VALUES ('2227', '1');
INSERT INTO `p_user_role` VALUES ('2228', '1');
INSERT INTO `p_user_role` VALUES ('2229', '1');
INSERT INTO `p_user_role` VALUES ('2230', '1');
INSERT INTO `p_user_role` VALUES ('2231', '1');
INSERT INTO `p_user_role` VALUES ('2232', '1');
INSERT INTO `p_user_role` VALUES ('2233', '1');
INSERT INTO `p_user_role` VALUES ('2234', '1');
INSERT INTO `p_user_role` VALUES ('2235', '1');
INSERT INTO `p_user_role` VALUES ('2236', '1');
INSERT INTO `p_user_role` VALUES ('2237', '1');
INSERT INTO `p_user_role` VALUES ('2238', '1');
INSERT INTO `p_user_role` VALUES ('2239', '1');
INSERT INTO `p_user_role` VALUES ('2240', '1');
INSERT INTO `p_user_role` VALUES ('2241', '1');
INSERT INTO `p_user_role` VALUES ('2242', '1');
INSERT INTO `p_user_role` VALUES ('2243', '1');
INSERT INTO `p_user_role` VALUES ('2244', '1');
INSERT INTO `p_user_role` VALUES ('2245', '1');
INSERT INTO `p_user_role` VALUES ('2246', '1');
INSERT INTO `p_user_role` VALUES ('2247', '1');
INSERT INTO `p_user_role` VALUES ('2248', '1');
INSERT INTO `p_user_role` VALUES ('2249', '1');
INSERT INTO `p_user_role` VALUES ('2250', '1');
INSERT INTO `p_user_role` VALUES ('2251', '1');
INSERT INTO `p_user_role` VALUES ('2252', '1');
INSERT INTO `p_user_role` VALUES ('2253', '1');
INSERT INTO `p_user_role` VALUES ('2254', '1');
INSERT INTO `p_user_role` VALUES ('2255', '1');
INSERT INTO `p_user_role` VALUES ('2256', '1');
INSERT INTO `p_user_role` VALUES ('2257', '1');
INSERT INTO `p_user_role` VALUES ('2258', '1');
INSERT INTO `p_user_role` VALUES ('2259', '1');
INSERT INTO `p_user_role` VALUES ('2260', '1');
INSERT INTO `p_user_role` VALUES ('2261', '1');
INSERT INTO `p_user_role` VALUES ('2262', '1');
INSERT INTO `p_user_role` VALUES ('2263', '1');
INSERT INTO `p_user_role` VALUES ('2264', '1');
INSERT INTO `p_user_role` VALUES ('2265', '1');
INSERT INTO `p_user_role` VALUES ('2266', '1');
INSERT INTO `p_user_role` VALUES ('2267', '1');
INSERT INTO `p_user_role` VALUES ('2268', '1');
INSERT INTO `p_user_role` VALUES ('2269', '1');
INSERT INTO `p_user_role` VALUES ('2270', '1');
INSERT INTO `p_user_role` VALUES ('2271', '1');
INSERT INTO `p_user_role` VALUES ('2272', '1');
INSERT INTO `p_user_role` VALUES ('2273', '1');
INSERT INTO `p_user_role` VALUES ('2274', '1');
INSERT INTO `p_user_role` VALUES ('2275', '1');
INSERT INTO `p_user_role` VALUES ('2276', '1');
INSERT INTO `p_user_role` VALUES ('2277', '1');
INSERT INTO `p_user_role` VALUES ('2278', '1');
INSERT INTO `p_user_role` VALUES ('2279', '1');
INSERT INTO `p_user_role` VALUES ('2280', '1');
INSERT INTO `p_user_role` VALUES ('2281', '1');
INSERT INTO `p_user_role` VALUES ('2282', '1');
INSERT INTO `p_user_role` VALUES ('2283', '1');
INSERT INTO `p_user_role` VALUES ('2284', '1');
INSERT INTO `p_user_role` VALUES ('2285', '1');
INSERT INTO `p_user_role` VALUES ('2286', '1');
INSERT INTO `p_user_role` VALUES ('2287', '1');
INSERT INTO `p_user_role` VALUES ('2288', '1');
INSERT INTO `p_user_role` VALUES ('2289', '1');
INSERT INTO `p_user_role` VALUES ('2290', '1');
INSERT INTO `p_user_role` VALUES ('2291', '1');
INSERT INTO `p_user_role` VALUES ('2292', '1');
INSERT INTO `p_user_role` VALUES ('2293', '1');
INSERT INTO `p_user_role` VALUES ('2294', '1');
INSERT INTO `p_user_role` VALUES ('2295', '1');
INSERT INTO `p_user_role` VALUES ('2296', '1');
INSERT INTO `p_user_role` VALUES ('2297', '1');
INSERT INTO `p_user_role` VALUES ('2298', '1');
INSERT INTO `p_user_role` VALUES ('2299', '1');
INSERT INTO `p_user_role` VALUES ('2300', '1');
INSERT INTO `p_user_role` VALUES ('2301', '1');
INSERT INTO `p_user_role` VALUES ('2302', '1');
INSERT INTO `p_user_role` VALUES ('2303', '1');
INSERT INTO `p_user_role` VALUES ('2304', '1');
INSERT INTO `p_user_role` VALUES ('2305', '1');
INSERT INTO `p_user_role` VALUES ('2306', '1');
INSERT INTO `p_user_role` VALUES ('2307', '1');
INSERT INTO `p_user_role` VALUES ('2308', '1');
INSERT INTO `p_user_role` VALUES ('2309', '1');
INSERT INTO `p_user_role` VALUES ('2310', '1');
INSERT INTO `p_user_role` VALUES ('2311', '1');
INSERT INTO `p_user_role` VALUES ('2312', '1');
INSERT INTO `p_user_role` VALUES ('2313', '1');
INSERT INTO `p_user_role` VALUES ('2314', '1');
INSERT INTO `p_user_role` VALUES ('2315', '1');
INSERT INTO `p_user_role` VALUES ('2316', '1');
INSERT INTO `p_user_role` VALUES ('2317', '1');
INSERT INTO `p_user_role` VALUES ('2318', '1');
INSERT INTO `p_user_role` VALUES ('2319', '1');
INSERT INTO `p_user_role` VALUES ('2320', '1');
INSERT INTO `p_user_role` VALUES ('2321', '1');
INSERT INTO `p_user_role` VALUES ('2322', '1');
INSERT INTO `p_user_role` VALUES ('2323', '1');
INSERT INTO `p_user_role` VALUES ('2324', '1');
INSERT INTO `p_user_role` VALUES ('2325', '1');
INSERT INTO `p_user_role` VALUES ('2326', '1');
INSERT INTO `p_user_role` VALUES ('2327', '1');
INSERT INTO `p_user_role` VALUES ('2328', '1');
INSERT INTO `p_user_role` VALUES ('2329', '1');
INSERT INTO `p_user_role` VALUES ('2330', '1');
INSERT INTO `p_user_role` VALUES ('2331', '1');
INSERT INTO `p_user_role` VALUES ('2332', '1');
INSERT INTO `p_user_role` VALUES ('2333', '1');
INSERT INTO `p_user_role` VALUES ('2334', '1');
INSERT INTO `p_user_role` VALUES ('2335', '1');
INSERT INTO `p_user_role` VALUES ('2336', '1');
INSERT INTO `p_user_role` VALUES ('2337', '1');
INSERT INTO `p_user_role` VALUES ('2338', '1');
INSERT INTO `p_user_role` VALUES ('2339', '1');
INSERT INTO `p_user_role` VALUES ('2340', '1');
INSERT INTO `p_user_role` VALUES ('2341', '1');
INSERT INTO `p_user_role` VALUES ('2342', '1');
INSERT INTO `p_user_role` VALUES ('2343', '1');
INSERT INTO `p_user_role` VALUES ('2344', '1');
INSERT INTO `p_user_role` VALUES ('2345', '1');
INSERT INTO `p_user_role` VALUES ('2346', '1');
INSERT INTO `p_user_role` VALUES ('2347', '1');
INSERT INTO `p_user_role` VALUES ('2348', '1');
INSERT INTO `p_user_role` VALUES ('2349', '1');
INSERT INTO `p_user_role` VALUES ('2350', '1');
INSERT INTO `p_user_role` VALUES ('2351', '1');
INSERT INTO `p_user_role` VALUES ('2352', '1');
INSERT INTO `p_user_role` VALUES ('2353', '1');
INSERT INTO `p_user_role` VALUES ('2354', '1');
INSERT INTO `p_user_role` VALUES ('2355', '1');
INSERT INTO `p_user_role` VALUES ('2356', '1');
INSERT INTO `p_user_role` VALUES ('2357', '1');
INSERT INTO `p_user_role` VALUES ('2358', '1');
INSERT INTO `p_user_role` VALUES ('2359', '1');
INSERT INTO `p_user_role` VALUES ('2360', '1');
INSERT INTO `p_user_role` VALUES ('2361', '1');
INSERT INTO `p_user_role` VALUES ('2362', '1');
INSERT INTO `p_user_role` VALUES ('2363', '1');
INSERT INTO `p_user_role` VALUES ('2364', '1');
INSERT INTO `p_user_role` VALUES ('2365', '1');
INSERT INTO `p_user_role` VALUES ('2366', '1');
INSERT INTO `p_user_role` VALUES ('2367', '1');
INSERT INTO `p_user_role` VALUES ('2368', '1');
INSERT INTO `p_user_role` VALUES ('2369', '1');
INSERT INTO `p_user_role` VALUES ('2370', '1');
INSERT INTO `p_user_role` VALUES ('2371', '1');
INSERT INTO `p_user_role` VALUES ('2372', '1');
INSERT INTO `p_user_role` VALUES ('2373', '1');
INSERT INTO `p_user_role` VALUES ('2374', '1');
INSERT INTO `p_user_role` VALUES ('2375', '1');
INSERT INTO `p_user_role` VALUES ('2376', '1');
INSERT INTO `p_user_role` VALUES ('2377', '1');
INSERT INTO `p_user_role` VALUES ('2378', '1');
INSERT INTO `p_user_role` VALUES ('2379', '1');
INSERT INTO `p_user_role` VALUES ('2380', '1');
INSERT INTO `p_user_role` VALUES ('2381', '1');
INSERT INTO `p_user_role` VALUES ('2382', '1');
INSERT INTO `p_user_role` VALUES ('2383', '1');
INSERT INTO `p_user_role` VALUES ('2384', '1');
INSERT INTO `p_user_role` VALUES ('2385', '1');
INSERT INTO `p_user_role` VALUES ('2386', '1');
INSERT INTO `p_user_role` VALUES ('2387', '1');
INSERT INTO `p_user_role` VALUES ('2388', '1');
INSERT INTO `p_user_role` VALUES ('2389', '1');
INSERT INTO `p_user_role` VALUES ('2390', '1');
INSERT INTO `p_user_role` VALUES ('2391', '1');
INSERT INTO `p_user_role` VALUES ('2392', '1');
INSERT INTO `p_user_role` VALUES ('2393', '1');
INSERT INTO `p_user_role` VALUES ('2394', '1');
INSERT INTO `p_user_role` VALUES ('2395', '1');
INSERT INTO `p_user_role` VALUES ('2396', '1');
INSERT INTO `p_user_role` VALUES ('2397', '1');
INSERT INTO `p_user_role` VALUES ('2398', '1');
INSERT INTO `p_user_role` VALUES ('2399', '1');
INSERT INTO `p_user_role` VALUES ('2400', '1');
INSERT INTO `p_user_role` VALUES ('2401', '1');
INSERT INTO `p_user_role` VALUES ('2402', '1');
INSERT INTO `p_user_role` VALUES ('2403', '1');
INSERT INTO `p_user_role` VALUES ('2404', '1');
INSERT INTO `p_user_role` VALUES ('2405', '1');
INSERT INTO `p_user_role` VALUES ('2406', '1');
INSERT INTO `p_user_role` VALUES ('2407', '1');
INSERT INTO `p_user_role` VALUES ('2408', '1');
INSERT INTO `p_user_role` VALUES ('2409', '1');
INSERT INTO `p_user_role` VALUES ('2410', '1');
INSERT INTO `p_user_role` VALUES ('2411', '1');
INSERT INTO `p_user_role` VALUES ('2412', '1');
INSERT INTO `p_user_role` VALUES ('2413', '1');
INSERT INTO `p_user_role` VALUES ('2414', '1');
INSERT INTO `p_user_role` VALUES ('2415', '1');
INSERT INTO `p_user_role` VALUES ('2416', '1');
INSERT INTO `p_user_role` VALUES ('2417', '1');
INSERT INTO `p_user_role` VALUES ('2418', '1');
INSERT INTO `p_user_role` VALUES ('2419', '1');
INSERT INTO `p_user_role` VALUES ('2420', '1');
INSERT INTO `p_user_role` VALUES ('2421', '1');
INSERT INTO `p_user_role` VALUES ('2422', '1');
INSERT INTO `p_user_role` VALUES ('2423', '1');
INSERT INTO `p_user_role` VALUES ('2424', '1');
INSERT INTO `p_user_role` VALUES ('2425', '1');
INSERT INTO `p_user_role` VALUES ('2426', '1');
INSERT INTO `p_user_role` VALUES ('2427', '1');
INSERT INTO `p_user_role` VALUES ('2428', '1');
INSERT INTO `p_user_role` VALUES ('2429', '1');
INSERT INTO `p_user_role` VALUES ('2430', '1');
INSERT INTO `p_user_role` VALUES ('2431', '1');
INSERT INTO `p_user_role` VALUES ('2432', '1');
INSERT INTO `p_user_role` VALUES ('2433', '1');
INSERT INTO `p_user_role` VALUES ('2434', '1');
INSERT INTO `p_user_role` VALUES ('2435', '1');
INSERT INTO `p_user_role` VALUES ('2436', '1');
INSERT INTO `p_user_role` VALUES ('2437', '1');
INSERT INTO `p_user_role` VALUES ('2438', '1');
INSERT INTO `p_user_role` VALUES ('2439', '1');
INSERT INTO `p_user_role` VALUES ('2440', '1');
INSERT INTO `p_user_role` VALUES ('2441', '1');
INSERT INTO `p_user_role` VALUES ('2442', '1');
INSERT INTO `p_user_role` VALUES ('2443', '1');
INSERT INTO `p_user_role` VALUES ('2444', '1');
INSERT INTO `p_user_role` VALUES ('2445', '1');
INSERT INTO `p_user_role` VALUES ('2446', '1');
INSERT INTO `p_user_role` VALUES ('2447', '1');
INSERT INTO `p_user_role` VALUES ('2448', '1');
INSERT INTO `p_user_role` VALUES ('2449', '1');
INSERT INTO `p_user_role` VALUES ('2450', '1');
INSERT INTO `p_user_role` VALUES ('2451', '1');
INSERT INTO `p_user_role` VALUES ('2452', '1');
INSERT INTO `p_user_role` VALUES ('2453', '1');
INSERT INTO `p_user_role` VALUES ('2454', '1');
INSERT INTO `p_user_role` VALUES ('2455', '1');
INSERT INTO `p_user_role` VALUES ('2456', '1');
INSERT INTO `p_user_role` VALUES ('2457', '1');
INSERT INTO `p_user_role` VALUES ('2458', '1');
INSERT INTO `p_user_role` VALUES ('2459', '1');
INSERT INTO `p_user_role` VALUES ('2460', '1');
INSERT INTO `p_user_role` VALUES ('2461', '1');
INSERT INTO `p_user_role` VALUES ('2462', '1');
INSERT INTO `p_user_role` VALUES ('2463', '1');
INSERT INTO `p_user_role` VALUES ('2464', '1');
INSERT INTO `p_user_role` VALUES ('2465', '1');
INSERT INTO `p_user_role` VALUES ('2466', '1');
INSERT INTO `p_user_role` VALUES ('2467', '1');
INSERT INTO `p_user_role` VALUES ('2468', '1');
INSERT INTO `p_user_role` VALUES ('2469', '1');
INSERT INTO `p_user_role` VALUES ('2470', '1');
INSERT INTO `p_user_role` VALUES ('2471', '1');
INSERT INTO `p_user_role` VALUES ('2472', '1');
INSERT INTO `p_user_role` VALUES ('2473', '1');
INSERT INTO `p_user_role` VALUES ('2474', '1');
INSERT INTO `p_user_role` VALUES ('2475', '1');
INSERT INTO `p_user_role` VALUES ('2476', '1');
INSERT INTO `p_user_role` VALUES ('2477', '1');
INSERT INTO `p_user_role` VALUES ('2478', '1');
INSERT INTO `p_user_role` VALUES ('2479', '1');
INSERT INTO `p_user_role` VALUES ('2480', '1');
INSERT INTO `p_user_role` VALUES ('2481', '1');
INSERT INTO `p_user_role` VALUES ('2482', '1');
INSERT INTO `p_user_role` VALUES ('2483', '1');
INSERT INTO `p_user_role` VALUES ('2484', '1');
INSERT INTO `p_user_role` VALUES ('2485', '1');
INSERT INTO `p_user_role` VALUES ('2486', '1');
INSERT INTO `p_user_role` VALUES ('2487', '1');
INSERT INTO `p_user_role` VALUES ('2488', '1');
INSERT INTO `p_user_role` VALUES ('2489', '1');
INSERT INTO `p_user_role` VALUES ('2490', '1');
INSERT INTO `p_user_role` VALUES ('2491', '1');
INSERT INTO `p_user_role` VALUES ('2492', '1');
INSERT INTO `p_user_role` VALUES ('2493', '1');
INSERT INTO `p_user_role` VALUES ('2494', '1');
INSERT INTO `p_user_role` VALUES ('2495', '1');
INSERT INTO `p_user_role` VALUES ('2496', '1');
INSERT INTO `p_user_role` VALUES ('2497', '1');
INSERT INTO `p_user_role` VALUES ('2498', '1');
INSERT INTO `p_user_role` VALUES ('2499', '1');
INSERT INTO `p_user_role` VALUES ('2500', '1');
INSERT INTO `p_user_role` VALUES ('2501', '1');
INSERT INTO `p_user_role` VALUES ('2502', '1');
INSERT INTO `p_user_role` VALUES ('2503', '1');
INSERT INTO `p_user_role` VALUES ('2504', '1');
INSERT INTO `p_user_role` VALUES ('2505', '1');
INSERT INTO `p_user_role` VALUES ('2506', '1');
INSERT INTO `p_user_role` VALUES ('2507', '1');
INSERT INTO `p_user_role` VALUES ('2508', '1');
INSERT INTO `p_user_role` VALUES ('2509', '1');
INSERT INTO `p_user_role` VALUES ('2510', '1');
INSERT INTO `p_user_role` VALUES ('2511', '1');
INSERT INTO `p_user_role` VALUES ('2512', '1');
INSERT INTO `p_user_role` VALUES ('2513', '1');
INSERT INTO `p_user_role` VALUES ('2514', '1');
INSERT INTO `p_user_role` VALUES ('2515', '1');
INSERT INTO `p_user_role` VALUES ('2516', '1');
INSERT INTO `p_user_role` VALUES ('2517', '1');
INSERT INTO `p_user_role` VALUES ('2518', '1');
INSERT INTO `p_user_role` VALUES ('2519', '1');
INSERT INTO `p_user_role` VALUES ('2520', '1');
INSERT INTO `p_user_role` VALUES ('2521', '1');
INSERT INTO `p_user_role` VALUES ('2522', '1');
INSERT INTO `p_user_role` VALUES ('2523', '1');
INSERT INTO `p_user_role` VALUES ('2524', '1');
INSERT INTO `p_user_role` VALUES ('2525', '1');
INSERT INTO `p_user_role` VALUES ('2526', '1');
INSERT INTO `p_user_role` VALUES ('2527', '1');
INSERT INTO `p_user_role` VALUES ('2528', '1');
INSERT INTO `p_user_role` VALUES ('2529', '1');
INSERT INTO `p_user_role` VALUES ('2530', '1');
INSERT INTO `p_user_role` VALUES ('2531', '1');
INSERT INTO `p_user_role` VALUES ('2532', '1');
INSERT INTO `p_user_role` VALUES ('2533', '1');
INSERT INTO `p_user_role` VALUES ('2534', '1');
INSERT INTO `p_user_role` VALUES ('2535', '1');
INSERT INTO `p_user_role` VALUES ('2536', '1');
INSERT INTO `p_user_role` VALUES ('2537', '1');
INSERT INTO `p_user_role` VALUES ('2538', '1');
INSERT INTO `p_user_role` VALUES ('2539', '1');
INSERT INTO `p_user_role` VALUES ('2540', '1');
INSERT INTO `p_user_role` VALUES ('2541', '1');
INSERT INTO `p_user_role` VALUES ('2542', '1');
INSERT INTO `p_user_role` VALUES ('2543', '1');
INSERT INTO `p_user_role` VALUES ('2544', '1');
INSERT INTO `p_user_role` VALUES ('2545', '1');
INSERT INTO `p_user_role` VALUES ('2546', '1');
INSERT INTO `p_user_role` VALUES ('2547', '1');
INSERT INTO `p_user_role` VALUES ('2548', '1');
INSERT INTO `p_user_role` VALUES ('2549', '1');
INSERT INTO `p_user_role` VALUES ('2550', '1');
INSERT INTO `p_user_role` VALUES ('2551', '1');
INSERT INTO `p_user_role` VALUES ('2552', '1');
INSERT INTO `p_user_role` VALUES ('2553', '1');
INSERT INTO `p_user_role` VALUES ('2554', '1');
INSERT INTO `p_user_role` VALUES ('2555', '1');
INSERT INTO `p_user_role` VALUES ('2556', '1');
INSERT INTO `p_user_role` VALUES ('2557', '1');
INSERT INTO `p_user_role` VALUES ('2558', '1');
INSERT INTO `p_user_role` VALUES ('2559', '1');
INSERT INTO `p_user_role` VALUES ('2560', '1');
INSERT INTO `p_user_role` VALUES ('2561', '1');
INSERT INTO `p_user_role` VALUES ('2562', '1');
INSERT INTO `p_user_role` VALUES ('2563', '1');
INSERT INTO `p_user_role` VALUES ('2564', '1');
INSERT INTO `p_user_role` VALUES ('2565', '1');
INSERT INTO `p_user_role` VALUES ('2566', '1');
INSERT INTO `p_user_role` VALUES ('2567', '1');
INSERT INTO `p_user_role` VALUES ('2568', '1');
INSERT INTO `p_user_role` VALUES ('2569', '1');
INSERT INTO `p_user_role` VALUES ('2570', '1');
INSERT INTO `p_user_role` VALUES ('2571', '1');
INSERT INTO `p_user_role` VALUES ('2572', '1');
INSERT INTO `p_user_role` VALUES ('2573', '1');
INSERT INTO `p_user_role` VALUES ('2574', '1');
INSERT INTO `p_user_role` VALUES ('2575', '1');
INSERT INTO `p_user_role` VALUES ('2576', '1');
INSERT INTO `p_user_role` VALUES ('2577', '1');
INSERT INTO `p_user_role` VALUES ('2578', '1');
INSERT INTO `p_user_role` VALUES ('2579', '1');
INSERT INTO `p_user_role` VALUES ('2580', '1');
INSERT INTO `p_user_role` VALUES ('2581', '1');
INSERT INTO `p_user_role` VALUES ('2582', '1');
INSERT INTO `p_user_role` VALUES ('2583', '1');
INSERT INTO `p_user_role` VALUES ('2584', '1');
INSERT INTO `p_user_role` VALUES ('2585', '1');
INSERT INTO `p_user_role` VALUES ('2586', '1');
INSERT INTO `p_user_role` VALUES ('2587', '1');
INSERT INTO `p_user_role` VALUES ('2588', '1');
INSERT INTO `p_user_role` VALUES ('2589', '1');
INSERT INTO `p_user_role` VALUES ('2590', '1');
INSERT INTO `p_user_role` VALUES ('2591', '1');
INSERT INTO `p_user_role` VALUES ('2592', '1');
INSERT INTO `p_user_role` VALUES ('2593', '1');
INSERT INTO `p_user_role` VALUES ('2594', '1');
INSERT INTO `p_user_role` VALUES ('2595', '1');
INSERT INTO `p_user_role` VALUES ('2596', '1');
INSERT INTO `p_user_role` VALUES ('2597', '1');
INSERT INTO `p_user_role` VALUES ('2598', '1');
INSERT INTO `p_user_role` VALUES ('2599', '1');
INSERT INTO `p_user_role` VALUES ('2600', '1');
INSERT INTO `p_user_role` VALUES ('2601', '1');
INSERT INTO `p_user_role` VALUES ('2602', '1');
INSERT INTO `p_user_role` VALUES ('2603', '1');
INSERT INTO `p_user_role` VALUES ('2604', '1');
INSERT INTO `p_user_role` VALUES ('2605', '1');
INSERT INTO `p_user_role` VALUES ('2606', '1');
INSERT INTO `p_user_role` VALUES ('2607', '1');
INSERT INTO `p_user_role` VALUES ('2608', '1');
INSERT INTO `p_user_role` VALUES ('2609', '1');
INSERT INTO `p_user_role` VALUES ('2610', '1');
INSERT INTO `p_user_role` VALUES ('2611', '1');
INSERT INTO `p_user_role` VALUES ('2612', '1');
INSERT INTO `p_user_role` VALUES ('2613', '1');
INSERT INTO `p_user_role` VALUES ('2614', '1');
INSERT INTO `p_user_role` VALUES ('2615', '1');
INSERT INTO `p_user_role` VALUES ('2616', '1');
INSERT INTO `p_user_role` VALUES ('2617', '1');
INSERT INTO `p_user_role` VALUES ('2618', '1');
INSERT INTO `p_user_role` VALUES ('2619', '1');
INSERT INTO `p_user_role` VALUES ('2620', '1');
INSERT INTO `p_user_role` VALUES ('2621', '1');
INSERT INTO `p_user_role` VALUES ('2622', '1');
INSERT INTO `p_user_role` VALUES ('2623', '1');
INSERT INTO `p_user_role` VALUES ('2624', '1');
INSERT INTO `p_user_role` VALUES ('2625', '1');
INSERT INTO `p_user_role` VALUES ('2626', '1');
INSERT INTO `p_user_role` VALUES ('2627', '1');
INSERT INTO `p_user_role` VALUES ('2628', '1');
INSERT INTO `p_user_role` VALUES ('2629', '1');
INSERT INTO `p_user_role` VALUES ('2630', '1');
INSERT INTO `p_user_role` VALUES ('2631', '1');
INSERT INTO `p_user_role` VALUES ('2632', '1');
INSERT INTO `p_user_role` VALUES ('2633', '1');
INSERT INTO `p_user_role` VALUES ('2634', '1');
INSERT INTO `p_user_role` VALUES ('2635', '1');
INSERT INTO `p_user_role` VALUES ('2636', '1');
INSERT INTO `p_user_role` VALUES ('2637', '1');
INSERT INTO `p_user_role` VALUES ('2638', '1');
INSERT INTO `p_user_role` VALUES ('2639', '1');
INSERT INTO `p_user_role` VALUES ('2640', '1');
INSERT INTO `p_user_role` VALUES ('2641', '1');
INSERT INTO `p_user_role` VALUES ('2642', '1');
INSERT INTO `p_user_role` VALUES ('2643', '1');
INSERT INTO `p_user_role` VALUES ('2644', '1');
INSERT INTO `p_user_role` VALUES ('2645', '1');
INSERT INTO `p_user_role` VALUES ('2646', '1');
INSERT INTO `p_user_role` VALUES ('2647', '1');
INSERT INTO `p_user_role` VALUES ('2648', '1');
INSERT INTO `p_user_role` VALUES ('2649', '1');
INSERT INTO `p_user_role` VALUES ('2650', '1');
INSERT INTO `p_user_role` VALUES ('2651', '1');
INSERT INTO `p_user_role` VALUES ('2652', '1');
INSERT INTO `p_user_role` VALUES ('2653', '1');
INSERT INTO `p_user_role` VALUES ('2654', '1');
INSERT INTO `p_user_role` VALUES ('2655', '1');
INSERT INTO `p_user_role` VALUES ('2656', '1');
INSERT INTO `p_user_role` VALUES ('2657', '1');
INSERT INTO `p_user_role` VALUES ('2658', '1');
INSERT INTO `p_user_role` VALUES ('2659', '1');
INSERT INTO `p_user_role` VALUES ('2660', '1');
INSERT INTO `p_user_role` VALUES ('2661', '1');
INSERT INTO `p_user_role` VALUES ('2662', '1');
INSERT INTO `p_user_role` VALUES ('2663', '1');
INSERT INTO `p_user_role` VALUES ('2664', '1');
INSERT INTO `p_user_role` VALUES ('2665', '1');
INSERT INTO `p_user_role` VALUES ('2666', '1');
INSERT INTO `p_user_role` VALUES ('2667', '1');
INSERT INTO `p_user_role` VALUES ('2668', '1');
INSERT INTO `p_user_role` VALUES ('2669', '1');
INSERT INTO `p_user_role` VALUES ('2670', '1');
INSERT INTO `p_user_role` VALUES ('2671', '1');
INSERT INTO `p_user_role` VALUES ('2672', '1');
INSERT INTO `p_user_role` VALUES ('2673', '1');
INSERT INTO `p_user_role` VALUES ('2674', '1');
INSERT INTO `p_user_role` VALUES ('2675', '1');
INSERT INTO `p_user_role` VALUES ('2676', '1');
INSERT INTO `p_user_role` VALUES ('2677', '1');
INSERT INTO `p_user_role` VALUES ('2678', '1');
INSERT INTO `p_user_role` VALUES ('2679', '1');
INSERT INTO `p_user_role` VALUES ('2680', '1');
INSERT INTO `p_user_role` VALUES ('2681', '1');
INSERT INTO `p_user_role` VALUES ('2682', '1');
INSERT INTO `p_user_role` VALUES ('2683', '1');
INSERT INTO `p_user_role` VALUES ('2684', '1');
INSERT INTO `p_user_role` VALUES ('2685', '1');
INSERT INTO `p_user_role` VALUES ('2686', '1');
INSERT INTO `p_user_role` VALUES ('2687', '1');
INSERT INTO `p_user_role` VALUES ('2688', '1');
INSERT INTO `p_user_role` VALUES ('2689', '1');
INSERT INTO `p_user_role` VALUES ('2690', '1');
INSERT INTO `p_user_role` VALUES ('2691', '1');
INSERT INTO `p_user_role` VALUES ('2692', '1');
INSERT INTO `p_user_role` VALUES ('2693', '1');
INSERT INTO `p_user_role` VALUES ('2694', '1');
INSERT INTO `p_user_role` VALUES ('2695', '1');
INSERT INTO `p_user_role` VALUES ('2696', '1');
INSERT INTO `p_user_role` VALUES ('2697', '1');
INSERT INTO `p_user_role` VALUES ('2698', '1');
INSERT INTO `p_user_role` VALUES ('2699', '1');
INSERT INTO `p_user_role` VALUES ('2700', '1');
INSERT INTO `p_user_role` VALUES ('2701', '1');
INSERT INTO `p_user_role` VALUES ('2702', '1');
INSERT INTO `p_user_role` VALUES ('2703', '1');
INSERT INTO `p_user_role` VALUES ('2704', '1');
INSERT INTO `p_user_role` VALUES ('2705', '1');
INSERT INTO `p_user_role` VALUES ('2706', '1');
INSERT INTO `p_user_role` VALUES ('2707', '1');
INSERT INTO `p_user_role` VALUES ('2708', '1');
INSERT INTO `p_user_role` VALUES ('2709', '1');
INSERT INTO `p_user_role` VALUES ('2710', '1');
INSERT INTO `p_user_role` VALUES ('2711', '1');
INSERT INTO `p_user_role` VALUES ('2712', '1');
INSERT INTO `p_user_role` VALUES ('2713', '1');
INSERT INTO `p_user_role` VALUES ('2714', '1');
INSERT INTO `p_user_role` VALUES ('2715', '1');
INSERT INTO `p_user_role` VALUES ('2716', '1');
INSERT INTO `p_user_role` VALUES ('2717', '1');
INSERT INTO `p_user_role` VALUES ('2718', '1');
INSERT INTO `p_user_role` VALUES ('2719', '1');
INSERT INTO `p_user_role` VALUES ('2720', '1');
INSERT INTO `p_user_role` VALUES ('2721', '1');
INSERT INTO `p_user_role` VALUES ('2722', '1');
INSERT INTO `p_user_role` VALUES ('2723', '1');
INSERT INTO `p_user_role` VALUES ('2724', '1');
INSERT INTO `p_user_role` VALUES ('2725', '1');
INSERT INTO `p_user_role` VALUES ('2726', '1');
INSERT INTO `p_user_role` VALUES ('2727', '1');
INSERT INTO `p_user_role` VALUES ('2728', '1');
INSERT INTO `p_user_role` VALUES ('2729', '1');
INSERT INTO `p_user_role` VALUES ('2730', '1');
INSERT INTO `p_user_role` VALUES ('2731', '1');
INSERT INTO `p_user_role` VALUES ('2732', '1');
INSERT INTO `p_user_role` VALUES ('2733', '1');
INSERT INTO `p_user_role` VALUES ('2734', '1');
INSERT INTO `p_user_role` VALUES ('2735', '1');
INSERT INTO `p_user_role` VALUES ('2736', '1');
INSERT INTO `p_user_role` VALUES ('2737', '1');
INSERT INTO `p_user_role` VALUES ('2738', '1');
INSERT INTO `p_user_role` VALUES ('2739', '1');
INSERT INTO `p_user_role` VALUES ('2740', '1');
INSERT INTO `p_user_role` VALUES ('2741', '1');
INSERT INTO `p_user_role` VALUES ('2742', '1');
INSERT INTO `p_user_role` VALUES ('2743', '1');
INSERT INTO `p_user_role` VALUES ('2744', '1');
INSERT INTO `p_user_role` VALUES ('2745', '1');
INSERT INTO `p_user_role` VALUES ('2746', '1');
INSERT INTO `p_user_role` VALUES ('2747', '1');
INSERT INTO `p_user_role` VALUES ('2748', '1');
INSERT INTO `p_user_role` VALUES ('2749', '1');
INSERT INTO `p_user_role` VALUES ('2750', '1');
INSERT INTO `p_user_role` VALUES ('2751', '1');
INSERT INTO `p_user_role` VALUES ('2752', '1');
INSERT INTO `p_user_role` VALUES ('2753', '1');
INSERT INTO `p_user_role` VALUES ('2754', '1');
INSERT INTO `p_user_role` VALUES ('2755', '1');
INSERT INTO `p_user_role` VALUES ('2756', '1');
INSERT INTO `p_user_role` VALUES ('2757', '1');
INSERT INTO `p_user_role` VALUES ('2758', '1');
INSERT INTO `p_user_role` VALUES ('2759', '1');
INSERT INTO `p_user_role` VALUES ('2760', '1');
INSERT INTO `p_user_role` VALUES ('2761', '1');
INSERT INTO `p_user_role` VALUES ('2762', '1');
INSERT INTO `p_user_role` VALUES ('2763', '1');
INSERT INTO `p_user_role` VALUES ('2764', '1');
INSERT INTO `p_user_role` VALUES ('2765', '1');
INSERT INTO `p_user_role` VALUES ('2766', '1');
INSERT INTO `p_user_role` VALUES ('2767', '1');
INSERT INTO `p_user_role` VALUES ('2768', '1');
INSERT INTO `p_user_role` VALUES ('2769', '1');
INSERT INTO `p_user_role` VALUES ('2770', '1');
INSERT INTO `p_user_role` VALUES ('2771', '1');
INSERT INTO `p_user_role` VALUES ('2772', '1');
INSERT INTO `p_user_role` VALUES ('2773', '1');
INSERT INTO `p_user_role` VALUES ('2774', '1');
INSERT INTO `p_user_role` VALUES ('2775', '1');
INSERT INTO `p_user_role` VALUES ('2776', '1');
INSERT INTO `p_user_role` VALUES ('2777', '1');
INSERT INTO `p_user_role` VALUES ('2778', '1');
INSERT INTO `p_user_role` VALUES ('2779', '1');
INSERT INTO `p_user_role` VALUES ('2780', '1');
INSERT INTO `p_user_role` VALUES ('2781', '1');
INSERT INTO `p_user_role` VALUES ('2782', '1');
INSERT INTO `p_user_role` VALUES ('2783', '1');
INSERT INTO `p_user_role` VALUES ('2784', '1');
INSERT INTO `p_user_role` VALUES ('2785', '1');
INSERT INTO `p_user_role` VALUES ('2786', '1');
INSERT INTO `p_user_role` VALUES ('2787', '1');
INSERT INTO `p_user_role` VALUES ('2788', '1');
INSERT INTO `p_user_role` VALUES ('2789', '1');
INSERT INTO `p_user_role` VALUES ('2790', '1');
INSERT INTO `p_user_role` VALUES ('2791', '1');
INSERT INTO `p_user_role` VALUES ('2792', '1');
INSERT INTO `p_user_role` VALUES ('2793', '1');
INSERT INTO `p_user_role` VALUES ('2794', '1');
INSERT INTO `p_user_role` VALUES ('2795', '1');
INSERT INTO `p_user_role` VALUES ('2796', '1');
INSERT INTO `p_user_role` VALUES ('2797', '1');
INSERT INTO `p_user_role` VALUES ('2798', '1');
INSERT INTO `p_user_role` VALUES ('2799', '1');
INSERT INTO `p_user_role` VALUES ('2800', '1');
INSERT INTO `p_user_role` VALUES ('2801', '1');
INSERT INTO `p_user_role` VALUES ('2802', '1');
INSERT INTO `p_user_role` VALUES ('2803', '1');
INSERT INTO `p_user_role` VALUES ('2804', '1');
INSERT INTO `p_user_role` VALUES ('2805', '1');
INSERT INTO `p_user_role` VALUES ('2806', '1');
INSERT INTO `p_user_role` VALUES ('2807', '1');
INSERT INTO `p_user_role` VALUES ('2808', '1');
INSERT INTO `p_user_role` VALUES ('2809', '1');
INSERT INTO `p_user_role` VALUES ('2810', '1');
INSERT INTO `p_user_role` VALUES ('2811', '1');
INSERT INTO `p_user_role` VALUES ('2812', '1');
INSERT INTO `p_user_role` VALUES ('2813', '1');
INSERT INTO `p_user_role` VALUES ('2814', '1');
INSERT INTO `p_user_role` VALUES ('2815', '1');
INSERT INTO `p_user_role` VALUES ('2816', '1');
INSERT INTO `p_user_role` VALUES ('2817', '1');
INSERT INTO `p_user_role` VALUES ('2818', '1');
INSERT INTO `p_user_role` VALUES ('2819', '1');
INSERT INTO `p_user_role` VALUES ('2820', '1');
INSERT INTO `p_user_role` VALUES ('2821', '1');
INSERT INTO `p_user_role` VALUES ('2822', '1');
INSERT INTO `p_user_role` VALUES ('2823', '1');
INSERT INTO `p_user_role` VALUES ('2824', '1');
INSERT INTO `p_user_role` VALUES ('2825', '1');
INSERT INTO `p_user_role` VALUES ('2826', '1');
INSERT INTO `p_user_role` VALUES ('2827', '1');
INSERT INTO `p_user_role` VALUES ('2828', '1');
INSERT INTO `p_user_role` VALUES ('2829', '1');
INSERT INTO `p_user_role` VALUES ('2830', '1');
INSERT INTO `p_user_role` VALUES ('2831', '1');
INSERT INTO `p_user_role` VALUES ('2832', '1');
INSERT INTO `p_user_role` VALUES ('2833', '1');
INSERT INTO `p_user_role` VALUES ('2834', '1');
INSERT INTO `p_user_role` VALUES ('2835', '1');
INSERT INTO `p_user_role` VALUES ('2836', '1');
INSERT INTO `p_user_role` VALUES ('2837', '1');
INSERT INTO `p_user_role` VALUES ('2838', '1');
INSERT INTO `p_user_role` VALUES ('2839', '1');
INSERT INTO `p_user_role` VALUES ('2840', '1');
INSERT INTO `p_user_role` VALUES ('2841', '1');
INSERT INTO `p_user_role` VALUES ('2842', '1');
INSERT INTO `p_user_role` VALUES ('2843', '1');
INSERT INTO `p_user_role` VALUES ('2844', '1');
INSERT INTO `p_user_role` VALUES ('2845', '1');
INSERT INTO `p_user_role` VALUES ('2846', '1');
INSERT INTO `p_user_role` VALUES ('2847', '1');
INSERT INTO `p_user_role` VALUES ('2848', '1');
INSERT INTO `p_user_role` VALUES ('2849', '1');
INSERT INTO `p_user_role` VALUES ('2850', '1');
INSERT INTO `p_user_role` VALUES ('2851', '1');
INSERT INTO `p_user_role` VALUES ('2852', '1');
INSERT INTO `p_user_role` VALUES ('2853', '1');
INSERT INTO `p_user_role` VALUES ('2854', '1');
INSERT INTO `p_user_role` VALUES ('2855', '1');
INSERT INTO `p_user_role` VALUES ('2856', '1');
INSERT INTO `p_user_role` VALUES ('2857', '1');
INSERT INTO `p_user_role` VALUES ('2858', '1');
INSERT INTO `p_user_role` VALUES ('2859', '1');
INSERT INTO `p_user_role` VALUES ('2860', '1');
INSERT INTO `p_user_role` VALUES ('2861', '1');
INSERT INTO `p_user_role` VALUES ('2862', '1');
INSERT INTO `p_user_role` VALUES ('2863', '1');
INSERT INTO `p_user_role` VALUES ('2864', '1');
INSERT INTO `p_user_role` VALUES ('2865', '1');
INSERT INTO `p_user_role` VALUES ('2866', '1');
INSERT INTO `p_user_role` VALUES ('2867', '1');
INSERT INTO `p_user_role` VALUES ('2868', '1');
INSERT INTO `p_user_role` VALUES ('2869', '1');
INSERT INTO `p_user_role` VALUES ('2870', '1');
INSERT INTO `p_user_role` VALUES ('2871', '1');
INSERT INTO `p_user_role` VALUES ('2872', '1');
INSERT INTO `p_user_role` VALUES ('2873', '1');
INSERT INTO `p_user_role` VALUES ('2874', '1');
INSERT INTO `p_user_role` VALUES ('2875', '1');
INSERT INTO `p_user_role` VALUES ('2876', '1');
INSERT INTO `p_user_role` VALUES ('2877', '1');
INSERT INTO `p_user_role` VALUES ('2878', '1');
INSERT INTO `p_user_role` VALUES ('2879', '1');
INSERT INTO `p_user_role` VALUES ('2880', '1');
INSERT INTO `p_user_role` VALUES ('2881', '1');
INSERT INTO `p_user_role` VALUES ('2882', '1');
INSERT INTO `p_user_role` VALUES ('2883', '1');
INSERT INTO `p_user_role` VALUES ('2884', '1');
INSERT INTO `p_user_role` VALUES ('2885', '1');
INSERT INTO `p_user_role` VALUES ('2886', '1');
INSERT INTO `p_user_role` VALUES ('2887', '1');
INSERT INTO `p_user_role` VALUES ('2888', '1');
INSERT INTO `p_user_role` VALUES ('2889', '1');
INSERT INTO `p_user_role` VALUES ('2890', '1');
INSERT INTO `p_user_role` VALUES ('2891', '1');
INSERT INTO `p_user_role` VALUES ('2892', '1');
INSERT INTO `p_user_role` VALUES ('2893', '1');
INSERT INTO `p_user_role` VALUES ('2894', '1');
INSERT INTO `p_user_role` VALUES ('2895', '1');
INSERT INTO `p_user_role` VALUES ('2896', '1');
INSERT INTO `p_user_role` VALUES ('2897', '1');
INSERT INTO `p_user_role` VALUES ('2898', '1');
INSERT INTO `p_user_role` VALUES ('2899', '1');
INSERT INTO `p_user_role` VALUES ('2900', '1');
INSERT INTO `p_user_role` VALUES ('2901', '1');
INSERT INTO `p_user_role` VALUES ('2902', '1');
INSERT INTO `p_user_role` VALUES ('2903', '1');
INSERT INTO `p_user_role` VALUES ('2904', '1');
INSERT INTO `p_user_role` VALUES ('2905', '1');
INSERT INTO `p_user_role` VALUES ('2906', '1');
INSERT INTO `p_user_role` VALUES ('2907', '1');
INSERT INTO `p_user_role` VALUES ('2908', '1');
INSERT INTO `p_user_role` VALUES ('2909', '1');
INSERT INTO `p_user_role` VALUES ('2910', '1');
INSERT INTO `p_user_role` VALUES ('2911', '1');
INSERT INTO `p_user_role` VALUES ('2912', '1');
INSERT INTO `p_user_role` VALUES ('2913', '1');
INSERT INTO `p_user_role` VALUES ('2914', '1');
INSERT INTO `p_user_role` VALUES ('2915', '1');
INSERT INTO `p_user_role` VALUES ('2916', '1');
INSERT INTO `p_user_role` VALUES ('2917', '1');
INSERT INTO `p_user_role` VALUES ('2918', '1');
INSERT INTO `p_user_role` VALUES ('2919', '1');
INSERT INTO `p_user_role` VALUES ('2920', '1');
INSERT INTO `p_user_role` VALUES ('2921', '1');
INSERT INTO `p_user_role` VALUES ('2922', '1');
INSERT INTO `p_user_role` VALUES ('2923', '1');
INSERT INTO `p_user_role` VALUES ('2924', '1');
INSERT INTO `p_user_role` VALUES ('2925', '1');
INSERT INTO `p_user_role` VALUES ('2926', '1');
INSERT INTO `p_user_role` VALUES ('2927', '1');
INSERT INTO `p_user_role` VALUES ('2928', '1');
INSERT INTO `p_user_role` VALUES ('2929', '1');
INSERT INTO `p_user_role` VALUES ('2930', '1');
INSERT INTO `p_user_role` VALUES ('2931', '1');
INSERT INTO `p_user_role` VALUES ('2932', '1');
INSERT INTO `p_user_role` VALUES ('2933', '1');
INSERT INTO `p_user_role` VALUES ('2934', '1');
INSERT INTO `p_user_role` VALUES ('2935', '1');
INSERT INTO `p_user_role` VALUES ('2936', '1');
INSERT INTO `p_user_role` VALUES ('2937', '1');
INSERT INTO `p_user_role` VALUES ('2938', '1');
INSERT INTO `p_user_role` VALUES ('2939', '1');
INSERT INTO `p_user_role` VALUES ('2940', '1');
INSERT INTO `p_user_role` VALUES ('2941', '1');
INSERT INTO `p_user_role` VALUES ('2942', '1');
INSERT INTO `p_user_role` VALUES ('2943', '1');
INSERT INTO `p_user_role` VALUES ('2944', '1');
INSERT INTO `p_user_role` VALUES ('2945', '1');
INSERT INTO `p_user_role` VALUES ('2946', '1');
INSERT INTO `p_user_role` VALUES ('2947', '1');
INSERT INTO `p_user_role` VALUES ('2948', '1');
INSERT INTO `p_user_role` VALUES ('2949', '1');
INSERT INTO `p_user_role` VALUES ('2950', '1');
INSERT INTO `p_user_role` VALUES ('2951', '1');
INSERT INTO `p_user_role` VALUES ('2952', '1');
INSERT INTO `p_user_role` VALUES ('2953', '1');
INSERT INTO `p_user_role` VALUES ('2954', '1');
INSERT INTO `p_user_role` VALUES ('2955', '1');
INSERT INTO `p_user_role` VALUES ('2956', '1');
INSERT INTO `p_user_role` VALUES ('2957', '1');
INSERT INTO `p_user_role` VALUES ('2958', '1');
INSERT INTO `p_user_role` VALUES ('2959', '1');
INSERT INTO `p_user_role` VALUES ('2960', '1');
INSERT INTO `p_user_role` VALUES ('2961', '1');
INSERT INTO `p_user_role` VALUES ('2962', '1');
INSERT INTO `p_user_role` VALUES ('2963', '1');
INSERT INTO `p_user_role` VALUES ('2964', '1');
INSERT INTO `p_user_role` VALUES ('2965', '1');
INSERT INTO `p_user_role` VALUES ('2966', '1');
INSERT INTO `p_user_role` VALUES ('2967', '1');
INSERT INTO `p_user_role` VALUES ('2968', '1');
INSERT INTO `p_user_role` VALUES ('2969', '1');
INSERT INTO `p_user_role` VALUES ('2970', '1');
INSERT INTO `p_user_role` VALUES ('2971', '1');
INSERT INTO `p_user_role` VALUES ('2972', '1');
INSERT INTO `p_user_role` VALUES ('2973', '1');
INSERT INTO `p_user_role` VALUES ('2974', '1');
INSERT INTO `p_user_role` VALUES ('2975', '1');
INSERT INTO `p_user_role` VALUES ('2976', '1');
INSERT INTO `p_user_role` VALUES ('2977', '1');
INSERT INTO `p_user_role` VALUES ('2978', '1');
INSERT INTO `p_user_role` VALUES ('2979', '1');
INSERT INTO `p_user_role` VALUES ('2980', '1');
INSERT INTO `p_user_role` VALUES ('2981', '1');
INSERT INTO `p_user_role` VALUES ('2982', '1');
INSERT INTO `p_user_role` VALUES ('2983', '1');
INSERT INTO `p_user_role` VALUES ('2984', '1');
INSERT INTO `p_user_role` VALUES ('2985', '1');
INSERT INTO `p_user_role` VALUES ('2986', '1');
INSERT INTO `p_user_role` VALUES ('2987', '1');
INSERT INTO `p_user_role` VALUES ('2988', '1');
INSERT INTO `p_user_role` VALUES ('2989', '1');
INSERT INTO `p_user_role` VALUES ('2990', '1');
INSERT INTO `p_user_role` VALUES ('2991', '1');
INSERT INTO `p_user_role` VALUES ('2992', '1');
INSERT INTO `p_user_role` VALUES ('2993', '1');
INSERT INTO `p_user_role` VALUES ('2994', '1');
INSERT INTO `p_user_role` VALUES ('2995', '1');
INSERT INTO `p_user_role` VALUES ('2996', '1');
INSERT INTO `p_user_role` VALUES ('2997', '1');
INSERT INTO `p_user_role` VALUES ('2998', '1');
INSERT INTO `p_user_role` VALUES ('2999', '1');
INSERT INTO `p_user_role` VALUES ('3000', '1');
INSERT INTO `p_user_role` VALUES ('3001', '1');
INSERT INTO `p_user_role` VALUES ('3002', '1');
INSERT INTO `p_user_role` VALUES ('3003', '1');
INSERT INTO `p_user_role` VALUES ('3004', '1');
INSERT INTO `p_user_role` VALUES ('3005', '1');
INSERT INTO `p_user_role` VALUES ('3006', '1');
INSERT INTO `p_user_role` VALUES ('3007', '1');
INSERT INTO `p_user_role` VALUES ('3008', '1');
INSERT INTO `p_user_role` VALUES ('3009', '1');
INSERT INTO `p_user_role` VALUES ('3010', '1');
INSERT INTO `p_user_role` VALUES ('3011', '1');
INSERT INTO `p_user_role` VALUES ('3012', '1');
INSERT INTO `p_user_role` VALUES ('3013', '1');
INSERT INTO `p_user_role` VALUES ('3014', '1');
INSERT INTO `p_user_role` VALUES ('3015', '1');
INSERT INTO `p_user_role` VALUES ('3016', '1');
INSERT INTO `p_user_role` VALUES ('3017', '1');
INSERT INTO `p_user_role` VALUES ('3018', '1');
INSERT INTO `p_user_role` VALUES ('3019', '1');
INSERT INTO `p_user_role` VALUES ('3020', '1');
INSERT INTO `p_user_role` VALUES ('3021', '1');
INSERT INTO `p_user_role` VALUES ('3022', '1');
INSERT INTO `p_user_role` VALUES ('3023', '1');
INSERT INTO `p_user_role` VALUES ('3024', '1');
INSERT INTO `p_user_role` VALUES ('3025', '1');
INSERT INTO `p_user_role` VALUES ('3026', '1');
INSERT INTO `p_user_role` VALUES ('3027', '1');
INSERT INTO `p_user_role` VALUES ('3028', '1');
INSERT INTO `p_user_role` VALUES ('3029', '1');
INSERT INTO `p_user_role` VALUES ('3030', '1');
INSERT INTO `p_user_role` VALUES ('3031', '1');
INSERT INTO `p_user_role` VALUES ('3032', '1');
INSERT INTO `p_user_role` VALUES ('3033', '1');
INSERT INTO `p_user_role` VALUES ('3034', '1');
INSERT INTO `p_user_role` VALUES ('3035', '1');
INSERT INTO `p_user_role` VALUES ('3036', '1');
INSERT INTO `p_user_role` VALUES ('3037', '1');
INSERT INTO `p_user_role` VALUES ('3038', '1');
INSERT INTO `p_user_role` VALUES ('3039', '1');
INSERT INTO `p_user_role` VALUES ('3040', '1');
INSERT INTO `p_user_role` VALUES ('3041', '1');
INSERT INTO `p_user_role` VALUES ('3042', '1');
INSERT INTO `p_user_role` VALUES ('3043', '1');
INSERT INTO `p_user_role` VALUES ('3044', '1');
INSERT INTO `p_user_role` VALUES ('3045', '1');
INSERT INTO `p_user_role` VALUES ('3046', '1');
INSERT INTO `p_user_role` VALUES ('3047', '1');
INSERT INTO `p_user_role` VALUES ('3048', '1');
INSERT INTO `p_user_role` VALUES ('3049', '1');
INSERT INTO `p_user_role` VALUES ('3050', '1');
INSERT INTO `p_user_role` VALUES ('3051', '1');
INSERT INTO `p_user_role` VALUES ('3052', '1');
INSERT INTO `p_user_role` VALUES ('3053', '1');
INSERT INTO `p_user_role` VALUES ('3054', '1');
INSERT INTO `p_user_role` VALUES ('3055', '1');
INSERT INTO `p_user_role` VALUES ('3056', '1');
INSERT INTO `p_user_role` VALUES ('3057', '1');
INSERT INTO `p_user_role` VALUES ('3058', '1');
INSERT INTO `p_user_role` VALUES ('3059', '1');
INSERT INTO `p_user_role` VALUES ('3060', '1');
INSERT INTO `p_user_role` VALUES ('3061', '1');
INSERT INTO `p_user_role` VALUES ('3062', '1');
INSERT INTO `p_user_role` VALUES ('3063', '1');
INSERT INTO `p_user_role` VALUES ('3064', '1');
INSERT INTO `p_user_role` VALUES ('3065', '1');
INSERT INTO `p_user_role` VALUES ('3066', '1');
INSERT INTO `p_user_role` VALUES ('3067', '1');
INSERT INTO `p_user_role` VALUES ('3068', '1');
INSERT INTO `p_user_role` VALUES ('3069', '1');
INSERT INTO `p_user_role` VALUES ('3070', '1');
INSERT INTO `p_user_role` VALUES ('3071', '1');
INSERT INTO `p_user_role` VALUES ('3072', '1');
INSERT INTO `p_user_role` VALUES ('3073', '1');
INSERT INTO `p_user_role` VALUES ('3074', '1');
INSERT INTO `p_user_role` VALUES ('3075', '1');
INSERT INTO `p_user_role` VALUES ('3076', '1');
INSERT INTO `p_user_role` VALUES ('3077', '1');
INSERT INTO `p_user_role` VALUES ('3078', '1');
INSERT INTO `p_user_role` VALUES ('3079', '1');
INSERT INTO `p_user_role` VALUES ('3080', '1');
INSERT INTO `p_user_role` VALUES ('3081', '1');
INSERT INTO `p_user_role` VALUES ('3082', '1');
INSERT INTO `p_user_role` VALUES ('3083', '1');
INSERT INTO `p_user_role` VALUES ('3084', '1');
INSERT INTO `p_user_role` VALUES ('3085', '1');
INSERT INTO `p_user_role` VALUES ('3086', '1');
INSERT INTO `p_user_role` VALUES ('3087', '1');
INSERT INTO `p_user_role` VALUES ('3088', '1');
INSERT INTO `p_user_role` VALUES ('3089', '1');
INSERT INTO `p_user_role` VALUES ('3090', '1');
INSERT INTO `p_user_role` VALUES ('3091', '1');
INSERT INTO `p_user_role` VALUES ('3092', '1');
INSERT INTO `p_user_role` VALUES ('3093', '1');
INSERT INTO `p_user_role` VALUES ('3094', '1');
INSERT INTO `p_user_role` VALUES ('3095', '1');
INSERT INTO `p_user_role` VALUES ('3096', '1');
INSERT INTO `p_user_role` VALUES ('3097', '1');
INSERT INTO `p_user_role` VALUES ('3098', '1');
INSERT INTO `p_user_role` VALUES ('3099', '1');
INSERT INTO `p_user_role` VALUES ('3100', '1');
INSERT INTO `p_user_role` VALUES ('3101', '1');
INSERT INTO `p_user_role` VALUES ('3102', '1');
INSERT INTO `p_user_role` VALUES ('3103', '1');
INSERT INTO `p_user_role` VALUES ('3104', '1');
INSERT INTO `p_user_role` VALUES ('3105', '1');
INSERT INTO `p_user_role` VALUES ('3106', '1');
INSERT INTO `p_user_role` VALUES ('3107', '1');
INSERT INTO `p_user_role` VALUES ('3108', '1');
INSERT INTO `p_user_role` VALUES ('3109', '1');
INSERT INTO `p_user_role` VALUES ('3110', '1');
INSERT INTO `p_user_role` VALUES ('3111', '1');
INSERT INTO `p_user_role` VALUES ('3112', '1');
INSERT INTO `p_user_role` VALUES ('3113', '1');
INSERT INTO `p_user_role` VALUES ('3114', '1');
INSERT INTO `p_user_role` VALUES ('3115', '1');
INSERT INTO `p_user_role` VALUES ('3116', '1');
INSERT INTO `p_user_role` VALUES ('3117', '1');
INSERT INTO `p_user_role` VALUES ('3118', '1');
INSERT INTO `p_user_role` VALUES ('3119', '1');
INSERT INTO `p_user_role` VALUES ('3120', '1');
INSERT INTO `p_user_role` VALUES ('3121', '1');
INSERT INTO `p_user_role` VALUES ('3122', '1');
INSERT INTO `p_user_role` VALUES ('3123', '1');
INSERT INTO `p_user_role` VALUES ('3124', '1');
INSERT INTO `p_user_role` VALUES ('3125', '1');
INSERT INTO `p_user_role` VALUES ('3126', '1');
INSERT INTO `p_user_role` VALUES ('3127', '1');
INSERT INTO `p_user_role` VALUES ('3128', '1');
INSERT INTO `p_user_role` VALUES ('3129', '1');
INSERT INTO `p_user_role` VALUES ('3130', '1');
INSERT INTO `p_user_role` VALUES ('3131', '1');
INSERT INTO `p_user_role` VALUES ('3132', '1');
INSERT INTO `p_user_role` VALUES ('3133', '1');
INSERT INTO `p_user_role` VALUES ('3134', '1');

-- ----------------------------
-- View structure for v_class_exam
-- ----------------------------
DROP VIEW IF EXISTS `v_class_exam`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER  VIEW `v_class_exam` AS select `e`.`ExamID` AS `ExamID`,`e`.`ExamName` AS `ExamName`,`e`.`ExamTime` AS `ExamTime`,`e`.`SchoolID` AS `SchoolID`,`e`.`GradeID` AS `GradeID`,`e`.`ClassID` AS `ClassID`,`e`.`Type` AS `Type`,`e`.`Scope` AS `Scope`,`e`.`Rank1` AS `Rank1`,`e`.`Rank2` AS `Rank2`,`e`.`Rank3` AS `Rank3`,`e`.`CreatorID` AS `CreatorID`,`e`.`CreateTime` AS `CreateTime`,`e`.`State` AS `State`,`c`.`ClassID` AS `ClassIDq` from (`info_class` `c` join `info_exam` `e`) where ((`c`.`GradeID` = `e`.`GradeID`) and (`c`.`Type` = `e`.`Type`)) ;

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
																				AND es.Score >= SUBSTRING(ScoreTemp,1,pos-1) AND es.Score <= SUBSTRING(ScoreTemp,pos+1,LENGTH(ScoreTemp)-pos));
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
			SET UID = (SELECT m.UID FROM info_class_manage m WHERE m.ClassID = ClassID AND m.State = 1);
		ELSE 
			SET UID = (SELECT m.UID FROM info_teachrelation m WHERE m.ClassID = ClassID AND m.SubjectID = SubjectID AND m.State = 1);
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
																				AND es.Score >= SUBSTRING(ScoreTemp,1,pos-1) AND es.Score <= SUBSTRING(ScoreTemp,pos+1,LENGTH(ScoreTemp)-pos));
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
		HAVING COUNT(es.Score) = 1+(LENGTH(ReferSubjectID) - LENGTH(REPLACE(ReferSubjectID,',','')))
		) AS t
		SET e.Score = t.Score
		WHERE e.ExamID = t.ExamID AND e.UID = t.UID AND e.SubjectID = t.SubjectID;
		
		INSERT INTO info_exam_score(ExamID,UID,GradeID,ClassID,SubjectID,Score)
		SELECT es.ExamID,es.UID,es.GradeID,es.ClassID,SubjectID,SUM(es.Score) FROM info_exam_score es WHERE es.ExamID = ExamID AND es.SubjectID REGEXP ReferSubjectID 
		AND NOT EXISTS (SELECT s.SeqID FROM info_exam_score s WHERE s.ExamID = ExamID AND s.UID = es.UID AND s.SubjectID = SubjectID)
		GROUP BY es.ExamID,es.UID,es.GradeID,es.ClassID
		HAVING COUNT(es.Score) = 1+(LENGTH(ReferSubjectID) - LENGTH(REPLACE(ReferSubjectID,',','')));

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

		IF EXISTS(SELECT * FROM info_subject s WHERE s.SubjectID = SubjectID AND s.State = 1 AND s.ReferSubjectID <> '') THEN
			SET UID = (SELECT m.UID FROM info_class_manage m WHERE m.ClassID = ClassID AND m.State = 1);
		ELSE 
			SET UID = (SELECT m.UID FROM info_teachrelation m WHERE m.ClassID = ClassID AND m.SubjectID = SubjectID AND m.State = 1);
		END IF;

		IF EXISTS(SELECT c.ExamID FROM info_exam_class_yscore c WHERE c.ExamID = ExamID AND c.GradeID = GradeID AND c.ClassID = ClassID AND c.SubjectID = SubjectID) THEN
			UPDATE info_exam_class_yscore y 
			SET y.AvgYScore = AvgYScore,y.MaxYScore =  MaxYScore,y.MinYScore = MinYScore ,
					y.AvgCYScore = AvgCYScore,y.MaxCYScore =  MaxCYScore,y.MinCYScore = MinCYScore ,
					y.AvgSta = AvgSta,y.MaxSta =  MaxSta,y.MinSta = MinSta ,
					y.AvgImp = AvgImp,y.MaxImp =  MaxImp,y.MinImp = MinImp 
			WHERE y.ExamID = ExamID AND y.SubjectID = SubjectID AND y.ClassID = ClassID;
		ELSE 
			INSERT INTO info_exam_class_yscore(ExamID,GradeID,ClassID,SubjectID,UID,AvgYScore,MaxYScore,MinYScore,AvgCYScore,MaxCYScore,MinCYScore,AvgSta,MaxSta,MinSta,AvgImp,MaxImp,MinImp) 
			VALUES(ExamID,GradeID,ClassID,SubjectID,UID,AvgYScore,MaxYScore,MinYScore,AvgCYScore,MaxCYScore,MinCYScore,AvgSta,MaxSta,MinSta,AvgImp,MaxImp,MinImp);
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
		SET CurIndex = (SELECT COUNT(ExamID) FROM info_exam_yscore r WHERE r.UID = UID  AND r.SubjectID = SubjectID AND r.ExamID <= ExamID);
		IF (CurIndex > 4) THEN
			SET CurIndex = 4;
		END IF;
		IF (CurIndex > 1) THEN
		BEGIN
			SET YScoreAvg = (SELECT AVG(r.YScore) FROM info_exam_yscore r WHERE r.UID = UID  AND r.SubjectID = SubjectID AND r.ExamID <= ExamID ORDER BY ExamID DESC Limit 4);
			SET Stability = (SELECT SQRT(SUM(POWER((r.YScore-YScoreAvg),2))/CurIndex)
												FROM info_exam_yscore r WHERE r.UID = UID  AND r.SubjectID = SubjectID  AND r.ExamID <= ExamID ORDER BY ExamID DESC Limit 4);
		END;
		END IF;

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
		#计算加权能力值
		IF (CurIndex > 1) THEN
			BEGIN
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
-- Procedure structure for sp_util_split
-- ----------------------------
DROP PROCEDURE IF EXISTS `sp_util_split`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_util_split`(
    inputstring VARCHAR(1000),
    delim CHAR(1)
)
BEGIN
    DECLARE strlen INT;
    DECLARE last_index INT;
    DECLARE cur_index INT;
    DECLARE cur_char VARCHAR(200);
    DECLARE len INT;
    SET cur_index=1;
    SET last_index=0;
    SET strlen=LENGTH(inputstring);  
    DROP TABLE IF EXISTS splittable;
    CREATE TEMPORARY TABLE splittable(
        id INT AUTO_INCREMENT,
        VALUE VARCHAR(20),
        PRIMARY KEY (`ID`),
        UNIQUE KEY `ID` (`ID`)
    ) ;
    WHILE(cur_index<=strlen) DO    
    BEGIN
        IF SUBSTRING(inputstring FROM cur_index FOR 1)=delim OR cur_index=strlen THEN
            SET len=cur_index-last_index-1;
            IF cur_index=strlen THEN
               SET len=len+1;
            END IF;
            INSERT INTO splittable(`value`)VALUES(SUBSTRING(inputstring FROM (last_index+1) FOR len));
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
-- Event structure for task_updateexam
-- ----------------------------
DROP EVENT IF EXISTS `task_updateexam`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `task_updateexam` ON SCHEDULE EVERY 1 DAY STARTS '2014-04-12 00:01:00' ON COMPLETION PRESERVE ENABLE DO BEGIN
	DECLARE ExamIDTemp INT;
	DECLARE UniIDTemp INT;
	DECLARE done INT DEFAULT 0;  

	DECLARE curexmaid CURSOR FOR SELECT ExmaID,UniID FROM info_examupdatetime WHERE IsDeal = 0;  
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

	## 8.更新处理记录
	UPDATE info_examupdatetime SET IsDeal = 1,DealTime = NOW() WHERE UniID = UniIDTemp;
	END LOOP emp_loop;  
	CLOSE curexmaid;  

END
;;
DELIMITER ;
