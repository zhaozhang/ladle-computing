/*
Navicat MySQL Data Transfer

Source Server         : spanker
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : hsoa

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2013-10-22 20:07:12
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of p_menu
-- ----------------------------
INSERT INTO `p_menu` VALUES ('1', '0', 'plugin', '1', '首页', '/school/welcome/index', '1');
INSERT INTO `p_menu` VALUES ('2', '0', null, '0', '系统管理', '', '2');
INSERT INTO `p_menu` VALUES ('3', '0', null, '0', '成绩统计', '', '3');
INSERT INTO `p_menu` VALUES ('4', '0', null, '0', '成绩分析', '', '4');
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
INSERT INTO `p_role_menu` VALUES ('1', '13');
INSERT INTO `p_role_menu` VALUES ('1', '16');
INSERT INTO `p_role_menu` VALUES ('1', '17');
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
