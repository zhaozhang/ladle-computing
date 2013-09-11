/*
Navicat MySQL Data Transfer

Source Server         : spanker
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : hsoa

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2013-09-11 22:10:18
*/

SET FOREIGN_KEY_CHECKS=0;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of p_menu
-- ----------------------------
INSERT INTO `p_menu` VALUES ('1', '0', 'plugin', '1', '首页', 'school/welcome/index', '1');
INSERT INTO `p_menu` VALUES ('2', '0', null, '0', '系统管理', '', '2');
INSERT INTO `p_menu` VALUES ('3', '0', null, '0', '成绩统计', '', '3');
INSERT INTO `p_menu` VALUES ('4', '0', null, '0', '成绩分析', '', '4');
INSERT INTO `p_menu` VALUES ('5', '2', null, '1', '班级管理', 'school/manClass/index', '1');
INSERT INTO `p_menu` VALUES ('6', '2', '', '1', '教师管理', 'school/manTeacher/index', '2');
INSERT INTO `p_menu` VALUES ('7', '2', null, '1', '科目管理', 'school/manSubject/index', '3');
INSERT INTO `p_menu` VALUES ('8', '2', null, '1', '学生管理', 'school/manStudent/index', '4');
INSERT INTO `p_menu` VALUES ('9', '2', null, '1', '考试管理', 'school/manExam/index', '5');
INSERT INTO `p_menu` VALUES ('10', '2', null, '1', '成绩管理', 'school/manScore/index', '6');
INSERT INTO `p_menu` VALUES ('11', '3', null, '1', '学生成绩', 'school/statStudent/index', '1');
INSERT INTO `p_menu` VALUES ('12', '3', null, '1', '学生排名', 'school/statSturank/index', '2');
INSERT INTO `p_menu` VALUES ('13', '3', null, '1', '班级成绩', 'school/statClass/index', '3');
INSERT INTO `p_menu` VALUES ('14', '4', null, '1', '学生分析', 'school/anaStudent/index', '1');
INSERT INTO `p_menu` VALUES ('15', '4', null, '1', '班级分析', 'school/anaClass/index', '2');


/*
Navicat MySQL Data Transfer

Source Server         : spanker
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : hsoa

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2013-09-11 22:12:07
*/

SET FOREIGN_KEY_CHECKS=0;
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



/*
Navicat MySQL Data Transfer

Source Server         : spanker
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : hsoa

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2013-09-11 22:16:51
*/

SET FOREIGN_KEY_CHECKS=0;
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
INSERT INTO `p_role_menu` VALUES ('1', '14');
INSERT INTO `p_role_menu` VALUES ('1', '15');
INSERT INTO `p_role_menu` VALUES ('2', '1');
INSERT INTO `p_role_menu` VALUES ('2', '2');
INSERT INTO `p_role_menu` VALUES ('2', '3');
INSERT INTO `p_role_menu` VALUES ('2', '4');
INSERT INTO `p_role_menu` VALUES ('2', '10');
INSERT INTO `p_role_menu` VALUES ('2', '11');
INSERT INTO `p_role_menu` VALUES ('2', '12');
INSERT INTO `p_role_menu` VALUES ('2', '13');
INSERT INTO `p_role_menu` VALUES ('2', '14');
INSERT INTO `p_role_menu` VALUES ('2', '15');
INSERT INTO `p_role_menu` VALUES ('3', '1');
INSERT INTO `p_role_menu` VALUES ('3', '2');
INSERT INTO `p_role_menu` VALUES ('3', '3');
INSERT INTO `p_role_menu` VALUES ('3', '4');
INSERT INTO `p_role_menu` VALUES ('3', '10');
INSERT INTO `p_role_menu` VALUES ('3', '11');
INSERT INTO `p_role_menu` VALUES ('3', '12');
INSERT INTO `p_role_menu` VALUES ('3', '13');
INSERT INTO `p_role_menu` VALUES ('3', '14');
INSERT INTO `p_role_menu` VALUES ('3', '15');
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
INSERT INTO `p_role_menu` VALUES ('4', '14');
INSERT INTO `p_role_menu` VALUES ('4', '15');
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
INSERT INTO `p_role_menu` VALUES ('5', '14');
INSERT INTO `p_role_menu` VALUES ('5', '15');

