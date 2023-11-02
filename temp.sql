/*
Navicat MySQL Data Transfer

Source Server         : test1
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : temp

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2023-11-01 08:45:31
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(1) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `invalid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'Admin', '202cb962ac59075b964b07152d234b70', '2018-08-28 16:40:39', '0');

-- ----------------------------
-- Table structure for `log`
-- ----------------------------
DROP TABLE IF EXISTS `log`;
CREATE TABLE `log` (
  `id` int(11) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `userId` int(11) unsigned zerofill DEFAULT NULL,
  `url` varchar(511) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('00000000001', '2018-08-14 15:48:27', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000002', '2018-08-14 15:49:16', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000003', '2018-08-20 09:58:01', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000004', '2018-08-20 10:24:05', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000005', '2018-08-20 11:27:48', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000006', '2018-08-20 11:50:10', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000007', '2018-08-20 11:52:07', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000008', '2018-08-20 13:22:39', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000009', '2018-08-20 16:08:46', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000010', '2018-08-20 16:36:17', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000011', '2018-08-20 17:23:27', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000012', '2018-08-20 17:26:08', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000013', '2018-08-21 18:08:45', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000014', '2018-08-22 12:24:06', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000015', '2018-08-22 16:53:26', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000016', '2018-08-22 17:01:04', '0:0:0:0:0:0:0:1', '00000001084', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000017', '2018-08-22 17:02:43', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000018', '2018-08-22 17:03:39', '0:0:0:0:0:0:0:1', '00000001083', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000019', '2018-08-22 17:07:41', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000020', '2018-08-22 17:20:36', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000021', '2018-08-22 17:36:00', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000022', '2018-08-22 17:53:19', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000023', '2018-08-22 17:54:26', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000024', '2018-08-24 13:22:17', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000025', '2018-08-24 16:53:50', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000026', '2018-08-24 17:52:33', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000027', '2018-08-24 17:56:01', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000028', '2018-08-27 13:42:03', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000029', '2018-08-27 15:53:55', '0:0:0:0:0:0:0:1', '00000001085', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000030', '2018-08-28 10:16:31', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000031', '2018-08-28 10:52:30', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000035', '2018-08-28 17:01:30', '0:0:0:0:0:0:0:1', '00000000001', '/Test1/adminLogin?null');
INSERT INTO `log` VALUES ('00000000036', '2018-08-28 17:02:42', '0:0:0:0:0:0:0:1', '00000000001', '/Test1/adminLogin?null');
INSERT INTO `log` VALUES ('00000000037', '2018-08-28 17:04:44', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');
INSERT INTO `log` VALUES ('00000000038', '2018-08-28 17:05:21', '0:0:0:0:0:0:0:1', '00000000001', '/Test1/adminLogin?null');
INSERT INTO `log` VALUES ('00000000039', '2018-08-28 17:30:46', '0:0:0:0:0:0:0:1', '00000000001', '/Test1/adminLogin?null');
INSERT INTO `log` VALUES ('00000000040', '2018-08-28 17:32:04', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/login?null');

-- ----------------------------
-- Table structure for `media`
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` int(1) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `userId` int(1) unsigned zerofill NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` tinyint(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `invalid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media
-- ----------------------------

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(1) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `replyId` int(1) unsigned zerofill DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userId` int(1) unsigned zerofill NOT NULL,
  `text` varchar(1536) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pageId` int(1) unsigned zerofill NOT NULL,
  `floorNumber` int(1) NOT NULL,
  `haveRead` tinyint(1) NOT NULL,
  `invalid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  KEY `pageId` (`pageId`) USING BTREE,
  KEY `message_ibfk_3` (`replyId`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`pageId`) REFERENCES `mypage` (`id`) ON DELETE CASCADE,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `message_ibfk_3` FOREIGN KEY (`replyId`) REFERENCES `message` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `mypage`
-- ----------------------------
DROP TABLE IF EXISTS `mypage`;
CREATE TABLE `mypage` (
  `id` int(1) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `createDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `text` varchar(767) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `userId` int(1) unsigned zerofill NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `messageNumber` int(1) unsigned NOT NULL,
  `invalid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  CONSTRAINT `mypage_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1182 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mypage
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(1) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `invalid` tinyint(1) DEFAULT '0',
  `token` char(32) DEFAULT NULL,
  `ipAddress` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1086 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

