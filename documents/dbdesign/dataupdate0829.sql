/*
Navicat MySQL Data Transfer

Source Server         : spanker
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : hsoa

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2013-08-29 19:41:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `info_exam_class_stat`
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
  PRIMARY KEY (`ExamID`,`GradeID`,`SubjectID`,`ClassID`),
  KEY `Index_UID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试班级统计信息表';

-- ----------------------------
-- Records of info_exam_class_stat
-- ----------------------------

-- ----------------------------
-- Table structure for `info_exam_class_yscore`
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
  KEY `Index_UID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试班级毅瓢指数信息表';

-- ----------------------------
-- Records of info_exam_class_yscore
-- ----------------------------

-- ----------------------------
-- Table structure for `info_exam_yscore`
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
  PRIMARY KEY (`ExamID`,`SubjectID`,`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试毅瓢指数信息表';

-- ----------------------------
-- Records of info_exam_yscore
-- ----------------------------
