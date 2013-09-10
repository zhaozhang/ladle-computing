/*
Navicat MySQL Data Transfer

Source Server         : spanker
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : hsoa

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2013-07-12 23:07:44
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `info_class`
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
  KEY `Index_SG` (`SchoolID`,`GradeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级信息表';

-- ----------------------------
-- Records of info_class
-- ----------------------------

-- ----------------------------
-- Table structure for `info_class_manage`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='班级管理人员表';

-- ----------------------------
-- Records of info_class_manage
-- ----------------------------

-- ----------------------------
-- Table structure for `info_exam`
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
  KEY `Index_GC` (`GradeID`,`ClassID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试信息表';

-- ----------------------------
-- Records of info_exam
-- ----------------------------

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
  `Max` decimal(8,2) DEFAULT NULL COMMENT '最高分',
  `Min` decimal(8,2) DEFAULT NULL COMMENT '最低分',
  `PassCount` smallint(6) DEFAULT NULL COMMENT '及格人数',
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
  `AvgSta` decimal(8,2) DEFAULT NULL COMMENT '平均稳定性',
  `MaxSta` decimal(8,2) DEFAULT NULL COMMENT '最高稳定性',
  `MinSta` decimal(8,2) DEFAULT NULL COMMENT '最低稳定性',
  `AvgYScoreC` decimal(8,2) DEFAULT NULL COMMENT '加权平均Y分数',
  `MaxYScoreC` decimal(8,2) DEFAULT NULL COMMENT '加权最高Y分数',
  `MinYScoreC` decimal(8,2) DEFAULT NULL COMMENT '加权最低Y分数',
  PRIMARY KEY (`ExamID`,`GradeID`,`ClassID`,`SubjectID`),
  KEY `Index_UID` (`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试班级毅瓢指数信息表';

-- ----------------------------
-- Records of info_exam_class_yscore
-- ----------------------------

-- ----------------------------
-- Table structure for `info_exam_grade_stat`
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
  PRIMARY KEY (`ExamID`,`GradeID`,`SubjectID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试年级统计信息表';

-- ----------------------------
-- Records of info_exam_grade_stat
-- ----------------------------

-- ----------------------------
-- Table structure for `info_exam_recently`
-- ----------------------------
DROP TABLE IF EXISTS `info_exam_recently`;
CREATE TABLE `info_exam_recently` (
  `SubjectID` int(11) NOT NULL COMMENT '科目ID',
  `UID` int(11) NOT NULL COMMENT '用户ID',
  `EarlistIndex` tinyint(4) DEFAULT NULL COMMENT '最早索引',
  `YScore1` decimal(8,2) DEFAULT NULL COMMENT 'Y分数1',
  `FScore1` decimal(8,2) DEFAULT NULL COMMENT 'F分数1，参展Y-该生Y',
  `YScore2` decimal(8,2) DEFAULT NULL COMMENT 'Y分数2',
  `FScore2` decimal(8,2) DEFAULT NULL COMMENT 'F分数2，参照Y-该生Y',
  `YScore3` decimal(8,2) DEFAULT NULL COMMENT 'Y分数3',
  `FScore3` decimal(8,2) DEFAULT NULL COMMENT 'F分数3，参照Y-该生Y',
  `YScore4` decimal(8,2) DEFAULT NULL COMMENT 'Y分数4',
  `FScore4` decimal(8,2) DEFAULT NULL COMMENT 'F分数4，参照Y-该生Y',
  PRIMARY KEY (`SubjectID`,`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='最近四次考试信息表';

-- ----------------------------
-- Records of info_exam_recently
-- ----------------------------

-- ----------------------------
-- Table structure for `info_exam_score`
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
  KEY `Index_ESU` (`ExamID`,`SubjectID`,`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试得分信息表';

-- ----------------------------
-- Records of info_exam_score
-- ----------------------------

-- ----------------------------
-- Table structure for `info_exam_subject`
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
  `Stability` decimal(8,2) DEFAULT '0.00' COMMENT '当前稳定性',
  `CYScore` decimal(8,2) DEFAULT NULL COMMENT '加权Y分数',
  `StaClaRank` int(11) DEFAULT NULL COMMENT '稳定性班级排名',
  `StaGraRank` int(11) DEFAULT NULL COMMENT '稳定性年级排名',
  `YClaRanke` int(11) DEFAULT NULL COMMENT '加权Y分数班级排名',
  `YGraRank` int(11) DEFAULT NULL COMMENT '加权Y分数年级排名',
  PRIMARY KEY (`ExamID`,`SubjectID`,`UID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试毅瓢指数信息表';

-- ----------------------------
-- Records of info_exam_yscore
-- ----------------------------

-- ----------------------------
-- Table structure for `info_examupdatetime`
-- ----------------------------
DROP TABLE IF EXISTS `info_examupdatetime`;
CREATE TABLE `info_examupdatetime` (
  `UniID` int(11) NOT NULL AUTO_INCREMENT,
  `ExamID` int(11) DEFAULT NULL COMMENT '考试ID',
  `LastUpdateTime` datetime DEFAULT NULL COMMENT '最近更新时间',
  `IsDeal` tinyint(4) DEFAULT NULL COMMENT '是否处理',
  `DealTime` datetime DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`UniID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考试得分最近更新表,用于批量生成数据时用';

-- ----------------------------
-- Records of info_examupdatetime
-- ----------------------------

-- ----------------------------
-- Table structure for `info_grade`
-- ----------------------------
DROP TABLE IF EXISTS `info_grade`;
CREATE TABLE `info_grade` (
  `GradeID` int(11) NOT NULL AUTO_INCREMENT COMMENT '年级ID',
  `SchoolID` int(11) NOT NULL COMMENT '学校ID',
  `GradeName` varchar(32) NOT NULL COMMENT '年级名称',
  `CreatorID` int(11) NOT NULL COMMENT '创建人',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `State` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0.无效 1.有效',
  PRIMARY KEY (`GradeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='年级信息表';

-- ----------------------------
-- Records of info_grade
-- ----------------------------

-- ----------------------------
-- Table structure for `info_grade_manage`
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
-- Table structure for `info_school`
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
-- Table structure for `info_student`
-- ----------------------------
DROP TABLE IF EXISTS `info_student`;
CREATE TABLE `info_student` (
  `UID` int(11) NOT NULL COMMENT '用户ID',
  `SchoolID` int(11) NOT NULL COMMENT '学校ID',
  `GradeID` int(11) NOT NULL COMMENT '年级ID',
  `ClassID` int(11) NOT NULL COMMENT '班级ID',
  `Name` varchar(32) NOT NULL COMMENT '姓名',
  `Sex` tinyint(4) NOT NULL COMMENT '0.女 1.男',
  `StudyNo` varchar(32) DEFAULT NULL COMMENT '学号',
  `Type` tinyint(4) DEFAULT NULL COMMENT '0.应届 1.往届',
  `IsLocal` tinyint(4) DEFAULT NULL COMMENT '1.是 0.否',
  `GraSchool` varchar(32) DEFAULT NULL COMMENT '毕业学校',
  `EntryTime` datetime DEFAULT NULL COMMENT '入学时间',
  `CreatorID` int(11) NOT NULL COMMENT '创建人',
  `CreateTime` datetime NOT NULL COMMENT '创建时间',
  `State` tinyint(4) NOT NULL DEFAULT '1' COMMENT '0.注销 1.注册',
  PRIMARY KEY (`UID`),
  KEY `Index_SS` (`SchoolID`,`StudyNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生信息表';

-- ----------------------------
-- Records of info_student
-- ----------------------------

-- ----------------------------
-- Table structure for `info_subject`
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='科目信息表';

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
INSERT INTO `info_subject` VALUES ('12', '总分', '0', '1,2,3,4,5,6', '0', '750.00', '450.00', '2013-07-06 00:13:16', '0', '1');

-- ----------------------------
-- Table structure for `info_teacher`
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

-- ----------------------------
-- Table structure for `info_teachrelation`
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='教师授课关系表';

-- ----------------------------
-- Records of info_teachrelation
-- ----------------------------

-- ----------------------------
-- Table structure for `info_user`
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
  UNIQUE KEY `Index_UserName` (`UserName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of info_user
-- ----------------------------

-- ----------------------------
-- Table structure for `p_menu`
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of p_menu
-- ----------------------------
INSERT INTO `p_menu` VALUES ('1', '0', 'plugin', '1', '首页', 'common/index', '1');
INSERT INTO `p_menu` VALUES ('2', '0', null, '0', '系统管理', '', '2');
INSERT INTO `p_menu` VALUES ('3', '0', null, '0', '成绩查询', '', '3');
INSERT INTO `p_menu` VALUES ('4', '0', null, '0', '成绩分析', '', '4');
INSERT INTO `p_menu` VALUES ('5', '2', null, '1', '班级管理', 'school/manClass/index', '1');
INSERT INTO `p_menu` VALUES ('6', '2', '', '1', '教师管理', 'school/manTeacher/index', '2');
INSERT INTO `p_menu` VALUES ('7', '2', null, '1', '科目管理', 'common/index', '3');
INSERT INTO `p_menu` VALUES ('8', '2', null, '1', '学生管理', 'common/index', '4');
INSERT INTO `p_menu` VALUES ('9', '2', null, '1', '考试管理', 'common/index', '5');
INSERT INTO `p_menu` VALUES ('10', '2', null, '1', '成绩管理', 'common/index', '6');
INSERT INTO `p_menu` VALUES ('11', '3', null, '1', '学生统计', 'common/index', '1');
INSERT INTO `p_menu` VALUES ('12', '3', null, '1', '班级统计', 'common/index', '2');
INSERT INTO `p_menu` VALUES ('13', '3', null, '1', '年级统计', 'common/index', '3');

-- ----------------------------
-- Table structure for `p_resource`
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
-- Table structure for `p_role`
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
-- Table structure for `p_role_menu`
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
INSERT INTO `p_role_menu` VALUES ('1', '1');
INSERT INTO `p_role_menu` VALUES ('1', '3');
INSERT INTO `p_role_menu` VALUES ('1', '4');
INSERT INTO `p_role_menu` VALUES ('1', '11');
INSERT INTO `p_role_menu` VALUES ('1', '12');
INSERT INTO `p_role_menu` VALUES ('1', '13');
INSERT INTO `p_role_menu` VALUES ('2', '1');
INSERT INTO `p_role_menu` VALUES ('2', '2');
INSERT INTO `p_role_menu` VALUES ('2', '3');
INSERT INTO `p_role_menu` VALUES ('2', '4');
INSERT INTO `p_role_menu` VALUES ('2', '10');
INSERT INTO `p_role_menu` VALUES ('2', '11');
INSERT INTO `p_role_menu` VALUES ('2', '12');
INSERT INTO `p_role_menu` VALUES ('2', '13');
INSERT INTO `p_role_menu` VALUES ('3', '1');
INSERT INTO `p_role_menu` VALUES ('3', '2');
INSERT INTO `p_role_menu` VALUES ('3', '3');
INSERT INTO `p_role_menu` VALUES ('3', '4');
INSERT INTO `p_role_menu` VALUES ('3', '10');
INSERT INTO `p_role_menu` VALUES ('3', '11');
INSERT INTO `p_role_menu` VALUES ('3', '12');
INSERT INTO `p_role_menu` VALUES ('3', '13');
INSERT INTO `p_role_menu` VALUES ('4', '0');
INSERT INTO `p_role_menu` VALUES ('4', '1');
INSERT INTO `p_role_menu` VALUES ('4', '2');
INSERT INTO `p_role_menu` VALUES ('4', '3');
INSERT INTO `p_role_menu` VALUES ('4', '4');
INSERT INTO `p_role_menu` VALUES ('4', '6');
INSERT INTO `p_role_menu` VALUES ('4', '8');
INSERT INTO `p_role_menu` VALUES ('4', '9');
INSERT INTO `p_role_menu` VALUES ('4', '10');
INSERT INTO `p_role_menu` VALUES ('4', '11');
INSERT INTO `p_role_menu` VALUES ('4', '12');
INSERT INTO `p_role_menu` VALUES ('4', '13');
INSERT INTO `p_role_menu` VALUES ('5', '0');
INSERT INTO `p_role_menu` VALUES ('5', '1');
INSERT INTO `p_role_menu` VALUES ('5', '2');
INSERT INTO `p_role_menu` VALUES ('5', '3');
INSERT INTO `p_role_menu` VALUES ('5', '4');
INSERT INTO `p_role_menu` VALUES ('5', '5');
INSERT INTO `p_role_menu` VALUES ('5', '6');
INSERT INTO `p_role_menu` VALUES ('5', '7');
INSERT INTO `p_role_menu` VALUES ('5', '8');
INSERT INTO `p_role_menu` VALUES ('5', '9');
INSERT INTO `p_role_menu` VALUES ('5', '10');
INSERT INTO `p_role_menu` VALUES ('5', '11');
INSERT INTO `p_role_menu` VALUES ('5', '12');
INSERT INTO `p_role_menu` VALUES ('5', '13');

-- ----------------------------
-- Table structure for `p_role_resource`
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
-- Table structure for `p_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `p_user_role`;
CREATE TABLE `p_user_role` (
  `UID` int(11) NOT NULL COMMENT '用户ID',
  `RoleID` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`UID`,`RoleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of p_user_role
-- ----------------------------
