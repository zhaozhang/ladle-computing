/*
Navicat MySQL Data Transfer

Source Server         : spanker
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : hsoa

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2014-01-22 11:24:41
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `config_estimate`
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
INSERT INTO `config_estimate` VALUES ('1', 'ability', '65.00', '75.00', '★★★', '', null);
INSERT INTO `config_estimate` VALUES ('2', 'ability', '75.00', '85.00', '★★★☆', '', null);
INSERT INTO `config_estimate` VALUES ('3', 'ability', '85.00', '95.00', '★★★★', '', null);
INSERT INTO `config_estimate` VALUES ('4', 'ability', '95.00', '105.00', '★★★★☆', null, null);
INSERT INTO `config_estimate` VALUES ('5', 'ability', '105.00', '999.00', '★★★★★', '', null);
INSERT INTO `config_estimate` VALUES ('6', 'ability', '55.00', '65.00', '★★☆', '', null);
INSERT INTO `config_estimate` VALUES ('7', 'ability', '45.00', '55.00', '★★', null, null);
INSERT INTO `config_estimate` VALUES ('8', 'ability', '35.00', '45.00', '★☆', null, null);
INSERT INTO `config_estimate` VALUES ('9', 'ability', '-999.00', '25.00', '★', null, null);
INSERT INTO `config_estimate` VALUES ('10', 'stability', '0.00', '2.00', '', null, null);
INSERT INTO `config_estimate` VALUES ('11', 'stability', '2.00', '5.00', '', null, null);
INSERT INTO `config_estimate` VALUES ('12', 'stability', '5.00', '10.00', '', null, null);
INSERT INTO `config_estimate` VALUES ('13', 'stability', '10.00', '15.00', '', null, null);
INSERT INTO `config_estimate` VALUES ('14', 'stability', '15.00', '20.00', '', null, null);
INSERT INTO `config_estimate` VALUES ('15', 'stability', '20.00', '999.00', '', null, null);
INSERT INTO `config_estimate` VALUES ('16', 'improve', '-999.00', '-30.00', '', null, null);
INSERT INTO `config_estimate` VALUES ('17', 'improve', '-30.00', '-20.00', null, null, null);
INSERT INTO `config_estimate` VALUES ('18', 'improve', '-20.00', '-10.00', null, null, null);
INSERT INTO `config_estimate` VALUES ('19', 'improve', '-10.00', '0.00', '', null, null);
INSERT INTO `config_estimate` VALUES ('20', 'improve', '0.00', '10.00', '', null, null);
INSERT INTO `config_estimate` VALUES ('21', 'improve', '10.00', '20.00', null, null, null);
INSERT INTO `config_estimate` VALUES ('22', 'improve', '20.00', '30.00', '', null, null);
INSERT INTO `config_estimate` VALUES ('23', 'improve', '30.00', '40.00', '', null, null);

-- ----------------------------
-- Table structure for `info_suggest`
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
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Table structure for `info_sys_notice`
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
