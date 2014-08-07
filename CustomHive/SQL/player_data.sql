/*
Navicat MySQL Data Transfer

Source Server         : LocalHost
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : dayz_overpoch

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-08-07 01:59:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for player_data
-- ----------------------------
DROP TABLE IF EXISTS `player_data`;
CREATE TABLE `player_data` (
  `PlayerUID` varchar(20) NOT NULL DEFAULT '0',
  `PlayerName` varchar(128) CHARACTER SET utf8 NOT NULL DEFAULT 'Null',
  `PlayerMorality` int(11) NOT NULL DEFAULT '0',
  `PlayerSex` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `DebugSetting` varchar(32) NOT NULL DEFAULT '[0,0,1,0.2,2]',
  `GUID` int(64) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PlayerUID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of player_data
-- ----------------------------
INSERT INTO `player_data` VALUES ('76561197994454413', 'p2_OWtest', '0', '0', '[1,1,1,0.2,2]', '0');
