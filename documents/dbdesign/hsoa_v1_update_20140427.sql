/*
Navicat MySQL Data Transfer

Source Server         : spanker
Source Server Version : 50520
Source Host           : 127.0.0.1:3306
Source Database       : hsoa_v1

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2014-04-27 14:11:51
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `p_role_menu` VALUES ('6', '16');
INSERT INTO `p_role_menu` VALUES ('6', '17');
INSERT INTO `p_role_menu` VALUES ('6', '18');
INSERT INTO `p_role_menu` VALUES ('6', '19');
INSERT INTO `p_role_menu` VALUES ('6', '20');
