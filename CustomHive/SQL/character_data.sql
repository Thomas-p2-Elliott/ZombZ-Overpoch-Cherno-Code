/*
Navicat MySQL Data Transfer

Source Server         : LocalHost
Source Server Version : 50616
Source Host           : localhost:3306
Source Database       : dayz_overpoch

Target Server Type    : MYSQL
Target Server Version : 50616
File Encoding         : 65001

Date: 2014-08-12 11:00:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for character_data
-- ----------------------------
DROP TABLE IF EXISTS `character_data`;
CREATE TABLE `character_data` (
  `CharacterID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `PlayerUID` varchar(20) NOT NULL DEFAULT '0',
  `InstanceID` int(11) NOT NULL DEFAULT '0',
  `Datestamp` datetime DEFAULT NULL,
  `LastLogin` datetime NOT NULL,
  `Inventory` longtext,
  `Backpack` longtext,
  `Worldspace` varchar(128) NOT NULL DEFAULT '[]',
  `Medical` varchar(300) NOT NULL DEFAULT '[]',
  `Alive` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `Generation` int(11) unsigned NOT NULL DEFAULT '1',
  `LastAte` datetime NOT NULL,
  `LastDrank` datetime NOT NULL,
  `KillsZ` int(11) unsigned NOT NULL DEFAULT '0',
  `HeadshotsZ` int(11) unsigned NOT NULL DEFAULT '0',
  `DistanceFoot` int(11) NOT NULL DEFAULT '0',
  `Duration` int(11) NOT NULL DEFAULT '0',
  `CurrentState` varchar(200) NOT NULL DEFAULT '[]',
  `KillsH` int(11) unsigned NOT NULL DEFAULT '0',
  `Model` varchar(50) NOT NULL DEFAULT '"Survivor2_DZ"',
  `KillsB` int(11) unsigned NOT NULL DEFAULT '0',
  `Humanity` int(11) NOT NULL DEFAULT '2500',
  `Infected` tinyint(3) DEFAULT '0',
  `Gold` varchar(20) NOT NULL DEFAULT '[0,0]',
  PRIMARY KEY (`CharacterID`),
  KEY `PlayerUID` (`PlayerUID`) USING BTREE,
  KEY `Alive` (`Alive`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
