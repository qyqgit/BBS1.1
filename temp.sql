/*
Navicat MySQL Data Transfer

Source Server         : test1
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : temp

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-08-24 13:57:25
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------

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
  KEY `userId` (`userId`),
  CONSTRAINT `log_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('8', null, '2018-07-10 13:31:53', '1078', '十分士大夫', '1128', '1', '0', '0');
INSERT INTO `message` VALUES ('9', '8', '2018-07-18 12:47:43', '1078', '<a href=\'MyPageSvl?id=1128&pageNumber=1&pageLength=30#1\' >Reply</a> 1:\r<br>是否', '1128', '2', '1', '0');
INSERT INTO `message` VALUES ('10', null, '2018-07-10 16:00:24', '1078', '楼的看法', '1128', '3', '0', '0');
INSERT INTO `message` VALUES ('11', null, '2018-07-10 16:00:38', '1078', '的发射点', '1127', '5', '0', '0');
INSERT INTO `message` VALUES ('12', null, '2018-07-10 16:00:51', '1078', '士大夫', '1123', '16', '0', '0');
INSERT INTO `message` VALUES ('13', null, '2018-07-10 16:00:54', '1078', '士大夫', '1123', '17', '0', '0');
INSERT INTO `message` VALUES ('14', '13', '2018-07-18 12:47:43', '1078', '<a href=\'MyPageSvl?id=1123&pageNumber=1&pageLength=30#17\' >Reply</a> 17:\r<br>士大夫+1', '1123', '18', '1', '0');
INSERT INTO `message` VALUES ('15', null, '2018-07-10 16:04:44', '1078', '是否', '1042', '62', '0', '0');
INSERT INTO `message` VALUES ('16', '15', '2018-07-18 12:47:43', '1078', '<a href=\'MyPageSvl?id=1042&pageNumber=3&pageLength=30#62\' >Reply</a> 62:\r<br>是否+1', '1042', '63', '1', '0');
INSERT INTO `message` VALUES ('17', null, '2018-07-18 12:47:43', '1082', '的身份', '1126', '1', '1', '0');
INSERT INTO `message` VALUES ('18', null, '2018-07-18 12:47:43', '1082', '客亦知夫水与月乎？', '1116', '1', '1', '0');
INSERT INTO `message` VALUES ('19', '18', '2018-07-18 12:47:43', '1082', '<a href=\'MyPageSvl?id=1116&pageNumber=1&pageLength=30#1\' >Reply</a> 1:\r<br>是否', '1116', '2', '1', '0');
INSERT INTO `message` VALUES ('20', null, '2018-07-10 16:51:57', '1078', '收到', '1116', '3', '0', '0');
INSERT INTO `message` VALUES ('21', '19', '2018-07-10 16:52:14', '1078', '<a href=\'MyPageSvl?id=1116&pageNumber=1&pageLength=30#2\' >Reply</a> 2:\r<br>发生的', '1116', '4', '0', '0');
INSERT INTO `message` VALUES ('22', '19', '2018-07-10 16:54:44', '1078', '<a href=\'MyPageSvl?id=1116&pageNumber=1&pageLength=30#2\' >Reply</a> 2:\r<br>反倒是', '1116', '5', '0', '0');
INSERT INTO `message` VALUES ('23', '18', '2018-07-10 16:57:03', '1078', '<a href=\'MyPageSvl?id=1116&pageNumber=1&pageLength=30#1\' >Reply</a> 1:\r<br>发生的', '1116', '6', '0', '0');
INSERT INTO `message` VALUES ('24', '18', '2018-07-10 17:17:19', '1078', '<a href=\'MyPageSvl?id=1116&pageNumber=1&pageLength=30#1\' >Reply</a> 1:\r<br>不织布之', '1116', '7', '0', '0');
INSERT INTO `message` VALUES ('25', '19', '2018-07-10 17:19:14', '1078', '<a href=\'MyPageSvl?id=1116&pageNumber=1&pageLength=30#2\' >Reply</a> 2:\r<br>否是', '1116', '8', '0', '0');
INSERT INTO `message` VALUES ('26', '17', '2018-07-10 17:19:45', '1078', '<a href=\'MyPageSvl?id=1126&pageNumber=1&pageLength=30#1\' >Reply</a> 1:\r<br>发', '1126', '2', '0', '0');
INSERT INTO `message` VALUES ('29', '21', '2018-07-18 12:47:43', '1082', '<a href=\'MyPageSvl?id=1116&pageNumber=1&pageLength=30#4\' >Reply</a> 4:\r<br>是否是', '1116', '9', '1', '0');
INSERT INTO `message` VALUES ('30', '16', '2018-07-18 12:47:43', '1082', '<a href=\'MyPageSvl?id=1042&pageNumber=3&pageLength=30#63\' >Reply</a> 63:\r<br>豆腐干大概豆腐干', '1042', '64', '1', '0');
INSERT INTO `message` VALUES ('31', null, '2018-07-18 12:47:43', '1082', '地方', '1128', '4', '1', '0');
INSERT INTO `message` VALUES ('32', '10', '2018-07-18 12:47:43', '1082', '<a href=\'MyPageSvl?id=1128&pageNumber=1&pageLength=30#3\' >Reply</a> 3:\r<br>ALL', '1128', '5', '1', '0');
INSERT INTO `message` VALUES ('33', null, '2018-07-11 18:25:01', '1078', '的身份1', '1128', '6', '0', '0');
INSERT INTO `message` VALUES ('34', null, '2018-07-11 18:35:06', '1078', '士大夫111', '1128', '7', '0', '0');
INSERT INTO `message` VALUES ('35', '34', '2018-07-18 12:47:43', '1078', '<a href=\'MyPageSvl?id=1128&pageNumber=1&pageLength=30#7\' >Reply</a> 7:\r<br>AAA', '1128', '8', '1', '0');
INSERT INTO `message` VALUES ('36', null, '2018-07-18 12:47:43', '1082', 'BBB', '1128', '9', '1', '0');
INSERT INTO `message` VALUES ('37', '35', '2018-07-18 12:47:43', '1082', '<a href=\'MyPageSvl?id=1128&pageNumber=1&pageLength=30#8\' >Reply</a> 8:\r<br>CCC', '1128', '10', '1', '0');
INSERT INTO `message` VALUES ('38', '35', '2018-07-18 12:47:43', '1082', '<a href=\'MyPageSvl?id=1128&pageNumber=1&pageLength=30#8\' >Reply</a> 8:\r<br>DDD', '1128', '11', '1', '0');
INSERT INTO `message` VALUES ('39', null, '2018-07-11 19:35:01', '1078', 'XXX', '1128', '12', '0', '0');
INSERT INTO `message` VALUES ('40', '39', '2018-07-18 12:47:43', '1078', '<a href=\'MyPageSvl?id=1128&pageNumber=1&pageLength=30#12\' >Reply</a> 12:\r<br>YYY', '1128', '13', '1', '0');
INSERT INTO `message` VALUES ('41', null, '2018-07-18 12:47:43', '1082', 'ZZZ', '1128', '14', '1', '0');
INSERT INTO `message` VALUES ('42', '40', '2018-07-18 12:47:43', '1082', '<a href=\'MyPageSvl?id=1128&pageNumber=1&pageLength=30#13\' >Reply</a> 13:\r<br>MMM', '1128', '15', '1', '0');
INSERT INTO `message` VALUES ('43', '42', '2018-07-18 12:47:43', '1082', '<a href=\'MyPageSvl?id=1128&pageNumber=1&pageLength=30#15\' >Reply</a> 15:\r<br>SSS', '1128', '16', '1', '0');
INSERT INTO `message` VALUES ('44', null, '2018-07-12 14:16:35', '1078', '电风扇士大夫', '1128', '17', '0', '0');
INSERT INTO `message` VALUES ('45', null, '2018-07-12 15:04:07', '1078', '但是', '1130', '1', '0', '0');
INSERT INTO `message` VALUES ('46', '45', '2018-07-18 12:47:43', '1078', '<a href=\'MyPageSvl?id=1130&pageNumber=1&pageLength=30#1\' >Reply</a> 1:\r<br>士大夫', '1130', '2', '1', '0');
INSERT INTO `message` VALUES ('47', '46', '2018-07-18 13:22:26', '1078', '<a href=\'MyPageSvl?id=1130&pageNumber=1&pageLength=30#2\' >Reply</a> 2:大师傅似的\r<br>', '1130', '3', '1', '0');
INSERT INTO `message` VALUES ('48', '40', '2018-07-18 13:22:26', '1078', '<a href=\'MyPageSvl?id=1128&pageNumber=1&pageLength=30#13\' >Reply</a> 13:双方的\r<br>', '1128', '18', '1', '0');
INSERT INTO `message` VALUES ('49', null, '2018-07-18 13:22:34', '1078', '反倒是', '1128', '19', '0', '0');
INSERT INTO `message` VALUES ('50', '44', '2018-07-18 13:25:30', '1078', '<a href=\'MyPageSvl?id=1128&pageNumber=1&pageLength=30#17\' >Reply</a> 17:\r<br>的身份', '1128', '20', '1', '0');
INSERT INTO `message` VALUES ('51', '11', '2018-07-18 13:26:00', '1078', '<a href=\'MyPageSvl?id=1127&pageNumber=1&pageLength=30#5\' >Reply</a> 5:\r<br>的身份\r<br>', '1127', '6', '1', '0');
INSERT INTO `message` VALUES ('52', null, '2018-07-26 13:35:14', '1078', '<a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1127', '7', '0', '0');
INSERT INTO `message` VALUES ('53', null, '2018-07-26 13:35:14', '1078', '<a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1127', '8', '0', '0');
INSERT INTO `message` VALUES ('54', null, '2018-07-26 13:35:25', '1078', '<a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1127', '9', '0', '0');
INSERT INTO `message` VALUES ('55', null, '2018-07-26 13:35:35', '1078', '<a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1127', '10', '0', '0');
INSERT INTO `message` VALUES ('56', null, '2018-07-26 13:59:05', '1078', '<audio src=\"1\" controls=\"controls\" loop=\"loop\"></audio><audio src=\"1\" controls=\"controls\" loop=\"loop\"></audio>', '1132', '1', '0', '0');
INSERT INTO `message` VALUES ('57', null, '2018-07-26 14:05:28', '1078', '<a href=\"http://localhost:8080/Test1/upload/user/1078/e4685ed2-23cc-4396-86eb-96e84a3c3b49_9ff6991a5839a413b1ac40a532ab42c1_r.jpg\"><img src=\"http://localhost:8080/Test1/upload/user/1078/e4685ed2-23cc-4396-86eb-96e84a3c3b49_9ff6991a5839a413b1ac40a532ab42c1_r.jpg\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"http://localhost:8080/Test1/upload/user/1078/e4685ed2-23cc-4396-86eb-96e84a3c3b49_9ff6991a5839a413b1ac40a532ab42c1_r.jpg\"><img src=\"http://localhost:8080/Test1/upload/user/1078/e4685ed2-23cc-4396-86eb-96e84a3c3b49_9ff6991a5839a413b1ac40a532ab42c1_r.jpg\" style=\"max-width:1024px;max-height:576px\"/></a>', '1134', '1', '0', '0');
INSERT INTO `message` VALUES ('58', null, '2018-07-26 14:14:44', '1078', '<a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a>', '1134', '2', '0', '0');
INSERT INTO `message` VALUES ('59', null, '2018-07-26 14:16:06', '1078', '<a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a>', '1134', '3', '0', '0');
INSERT INTO `message` VALUES ('60', null, '2018-07-26 14:20:47', '1078', '<a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a>2<a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a>', '1134', '4', '0', '0');
INSERT INTO `message` VALUES ('61', null, '2018-07-26 14:20:47', '1078', '<a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a>2<a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a>', '1134', '5', '0', '0');
INSERT INTO `message` VALUES ('62', null, '2018-07-26 14:25:23', '1078', '<a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a>', '1134', '6', '0', '0');
INSERT INTO `message` VALUES ('63', null, '2018-07-26 14:27:05', '1078', '<a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a>', '1134', '7', '0', '0');
INSERT INTO `message` VALUES ('64', null, '2018-07-26 14:35:18', '1078', '123<a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"1\"><img src=\"1\" style=\"max-width:1024px;max-height:576px\"/></a>', '1134', '8', '0', '0');
INSERT INTO `message` VALUES ('65', null, '2018-07-26 14:44:53', '1078', '<audio src=\"1\" controls=\"controls\" loop=\"loop\"></audio><audio src=\"2\" controls=\"controls\" loop=\"loop\"></audio>', '1135', '1', '0', '0');
INSERT INTO `message` VALUES ('66', null, '2018-07-26 14:44:53', '1078', '<audio src=\"1\" controls=\"controls\" loop=\"loop\"></audio><audio src=\"2\" controls=\"controls\" loop=\"loop\"></audio>', '1135', '2', '0', '0');
INSERT INTO `message` VALUES ('67', null, '2018-07-26 14:48:46', '1078', '<video src=\"1\" controls=\"controls\" style=\"max-width:1024px;max-height:576px\"></video><video src=\"2\" controls=\"controls\" style=\"max-width:1024px;max-height:576px\"></video>', '1135', '3', '0', '0');
INSERT INTO `message` VALUES ('68', null, '2018-07-26 15:05:06', '1078', '<a href=\"sys/pic/emoji/i_f/i_f02.png\"><img src=\"sys/pic/emoji/i_f/i_f02.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1136', '1', '0', '0');
INSERT INTO `message` VALUES ('69', null, '2018-07-26 15:05:09', '1078', '<a href=\"sys/pic/emoji/i_f/i_f03.png\"><img src=\"sys/pic/emoji/i_f/i_f03.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1136', '2', '0', '0');
INSERT INTO `message` VALUES ('70', null, '2018-07-26 15:05:21', '1078', '<a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f02.png\"><img src=\"sys/pic/emoji/i_f/i_f02.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f03.png\"><img src=\"sys/pic/emoji/i_f/i_f03.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f04.png\"><img src=\"sys/pic/emoji/i_f/i_f04.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1136', '3', '0', '0');
INSERT INTO `message` VALUES ('71', null, '2018-07-26 15:05:35', '1078', '<a href=\"sys/pic/emoji/i_f/i_f08.png\"><img src=\"sys/pic/emoji/i_f/i_f08.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f06.png\"><img src=\"sys/pic/emoji/i_f/i_f06.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f03.png\"><img src=\"sys/pic/emoji/i_f/i_f03.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f02.png\"><img src=\"sys/pic/emoji/i_f/i_f02.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1136', '4', '0', '0');
INSERT INTO `message` VALUES ('72', null, '2018-07-26 15:06:06', '1078', '<a href=\"sys/pic/emoji/i_f/i_f03.png\"><img src=\"sys/pic/emoji/i_f/i_f03.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1136', '5', '0', '0');
INSERT INTO `message` VALUES ('73', null, '2018-07-26 15:06:12', '1078', '<a href=\"sys/pic/emoji/i_f/i_f05.png\"><img src=\"sys/pic/emoji/i_f/i_f05.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f06.png\"><img src=\"sys/pic/emoji/i_f/i_f06.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1136', '6', '0', '0');
INSERT INTO `message` VALUES ('74', '73', '2018-07-26 15:33:19', '1078', '<a href=\'MyPageSvl?id=1136&pageNumber=1&pageLength=30#6\' >Reply</a> 音乐播放器(#6):\r<br><a href=\"sys/pic/emoji/i_f/i_f02.png\"><img src=\"sys/pic/emoji/i_f/i_f02.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1136', '7', '1', '0');
INSERT INTO `message` VALUES ('75', null, '2018-07-27 17:28:11', '1078', '<a href=\"sys/pic/emoji/i_f/i_f25.png\"><img src=\"sys/pic/emoji/i_f/i_f25.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f10.png\"><img src=\"sys/pic/emoji/i_f/i_f10.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f41.png\"><img src=\"sys/pic/emoji/i_f/i_f41.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f50.png\"><img src=\"sys/pic/emoji/i_f/i_f50.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1140', '1', '0', '0');
INSERT INTO `message` VALUES ('76', null, '2018-08-01 10:35:47', '1078', '<a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1166', '1', '0', '0');
INSERT INTO `message` VALUES ('77', null, '2018-08-01 10:36:21', '1078', '<a href=\"sys/pic/emoji/i_f/i_f24.png\"><img src=\"sys/pic/emoji/i_f/i_f24.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1166', '2', '0', '0');
INSERT INTO `message` VALUES ('78', null, '2018-08-01 10:53:30', '1078', '＜img&nbspsrc=＂sys/pic/emoji/i_f/i_f01.png＂＞', '1168', '1', '0', '0');
INSERT INTO `message` VALUES ('79', null, '2018-08-01 10:53:46', '1078', '＜div＞是否＜/div＞＜div＞的身份＜/div＞＜div＞士大夫＜/div＞＜div＞是否＜/div＞', '1167', '1', '0', '0');
INSERT INTO `message` VALUES ('80', null, '2018-08-01 13:26:13', '1078', '＜a href=\"\">123＜/a>', '1193', '1', '0', '0');
INSERT INTO `message` VALUES ('81', null, '2018-08-01 14:16:59', '1078', 'sss', '1197', '1', '0', '0');
INSERT INTO `message` VALUES ('82', null, '2018-08-01 14:29:45', '1078', 'hhh', '1198', '1', '0', '0');
INSERT INTO `message` VALUES ('83', null, '2018-08-01 14:29:47', '1078', 'hhh', '1198', '2', '0', '0');
INSERT INTO `message` VALUES ('84', null, '2018-08-01 14:29:47', '1078', 'hhh', '1198', '3', '0', '0');
INSERT INTO `message` VALUES ('85', null, '2018-08-01 14:29:56', '1078', '\r<br>			<img src=\"sys/pic/emoji/i_f/i_f02.png\">', '1198', '4', '0', '0');
INSERT INTO `message` VALUES ('86', null, '2018-08-01 14:30:27', '1078', '\r<br>			<img src=\"sys/pic/emoji/i_f/i_f02.png\"><br>&nbsp;<audio src=\"i\" loop=\"loop\" controls=\"controls\"></audio>&nbsp;<br>&nbsp;<audio src=\"p\" loop=\"loop\" controls=\"controls\"></audio>&nbsp;<br>&nbsp;<video style=\"max-width:1024px;max-height:576px\" src=\";\" controls=\"controls\"></video>&nbsp;<br><br>', '1198', '5', '0', '0');
INSERT INTO `message` VALUES ('87', null, '2018-08-01 14:30:51', '1078', '\r<br>			&nbsp;<video style=\"max-width:1024px;max-height:576px\" src=\"1\" controls=\"controls\"></video>&nbsp;', '1198', '6', '0', '0');
INSERT INTO `message` VALUES ('88', null, '2018-08-01 14:30:51', '1078', '\r<br>			&nbsp;<video style=\"max-width:1024px;max-height:576px\" src=\"1\" controls=\"controls\"></video>&nbsp;', '1198', '7', '0', '0');
INSERT INTO `message` VALUES ('89', null, '2018-08-01 14:30:58', '1078', '\r<br>			&nbsp;<audio src=\"1\" loop=\"loop\" controls=\"controls\"></audio>&nbsp;', '1198', '8', '0', '0');
INSERT INTO `message` VALUES ('90', null, '2018-08-01 14:31:02', '1078', '\r<br>			&nbsp;<video style=\"max-width:1024px;max-height:576px\" src=\"1\" controls=\"controls\"></video>&nbsp;', '1198', '9', '0', '0');
INSERT INTO `message` VALUES ('91', null, '2018-08-01 14:31:02', '1078', '\r<br>			&nbsp;<video style=\"max-width:1024px;max-height:576px\" src=\"1\" controls=\"controls\"></video>&nbsp;', '1198', '10', '0', '0');
INSERT INTO `message` VALUES ('92', null, '2018-08-01 14:31:12', '1078', '\r<br>			<img src=\"sys/pic/emoji/i_f/i_f03.png\">', '1198', '11', '0', '0');
INSERT INTO `message` VALUES ('93', null, '2018-08-01 14:31:12', '1078', '\r<br>			<img src=\"sys/pic/emoji/i_f/i_f03.png\">', '1198', '12', '0', '0');
INSERT INTO `message` VALUES ('94', null, '2018-08-01 14:31:20', '1078', '\r<br>			<img src=\"sys/pic/emoji/i_f/i_f03.png\">', '1198', '13', '0', '0');
INSERT INTO `message` VALUES ('95', null, '2018-08-01 14:31:20', '1078', '\r<br>			<img src=\"sys/pic/emoji/i_f/i_f03.png\">', '1198', '14', '0', '0');
INSERT INTO `message` VALUES ('96', null, '2018-08-01 14:31:32', '1078', '\r<br>			<img src=\"sys/pic/emoji/i_f/i_f15.png\">', '1198', '15', '0', '0');
INSERT INTO `message` VALUES ('97', null, '2018-08-01 14:32:05', '1078', '\r<br>			&nbsp;<audio src=\"111\" loop=\"loop\" controls=\"controls\"></audio>&nbsp;<video style=\"max-width:1024px;max-height:576px\" src=\"tt\" controls=\"controls\"></video>&nbsp;&nbsp;', '1198', '16', '0', '0');
INSERT INTO `message` VALUES ('98', null, '2018-08-01 14:32:26', '1078', '\r<br>			<img src=\"sys/pic/emoji/i_f/i_f25.png\">', '1197', '2', '0', '0');
INSERT INTO `message` VALUES ('99', null, '2018-08-01 14:32:34', '1078', '\r<br>			<img src=\"sys/pic/emoji/i_f/i_f28.png\">', '1197', '3', '0', '0');
INSERT INTO `message` VALUES ('100', null, '2018-08-01 14:32:49', '1078', '\r<br>			<img src=\"sys/pic/emoji/i_f/i_f09.png\">', '1197', '4', '0', '0');
INSERT INTO `message` VALUES ('101', null, '2018-08-01 14:32:58', '1078', '\r<br>			&nbsp;<audio src=\"u\" loop=\"loop\" controls=\"controls\"></audio>&nbsp;', '1197', '5', '0', '0');
INSERT INTO `message` VALUES ('102', null, '2018-08-01 14:32:58', '1078', '\r<br>			&nbsp;<audio src=\"u\" loop=\"loop\" controls=\"controls\"></audio>&nbsp;', '1197', '6', '0', '0');
INSERT INTO `message` VALUES ('103', null, '2018-08-01 14:33:08', '1078', '\r<br>			&nbsp;<video style=\"max-width:1024px;max-height:576px\" src=\"j\" controls=\"controls\"></video>&nbsp;', '1197', '7', '0', '0');
INSERT INTO `message` VALUES ('104', null, '2018-08-01 14:33:08', '1078', '\r<br>			&nbsp;<video style=\"max-width:1024px;max-height:576px\" src=\"j\" controls=\"controls\"></video>&nbsp;', '1197', '8', '0', '0');
INSERT INTO `message` VALUES ('105', null, '2018-08-01 14:34:55', '1078', '<br>', '1197', '9', '0', '0');
INSERT INTO `message` VALUES ('106', null, '2018-08-01 14:36:55', '1078', '的分类数据分类<img src=\"sys/pic/emoji/i_f/i_f33.png\"><br>&nbsp;<audio src=\"给\" controls=\"controls\" loop=\"loop\"></audio>&nbsp;<br>&nbsp;<video src=\"哈哈\" controls=\"controls\" style=\"max-width:1024px;max-height:576px\"></video>&nbsp;<br><img src=\"看看\"><br>', '1196', '1', '0', '0');
INSERT INTO `message` VALUES ('107', null, '2018-08-01 14:36:55', '1078', '的分类数据分类<img src=\"sys/pic/emoji/i_f/i_f33.png\"><br>&nbsp;<audio src=\"给\" controls=\"controls\" loop=\"loop\"></audio>&nbsp;<br>&nbsp;<video src=\"哈哈\" controls=\"controls\" style=\"max-width:1024px;max-height:576px\"></video>&nbsp;<br><img src=\"看看\"><br>', '1196', '2', '0', '0');
INSERT INTO `message` VALUES ('108', null, '2018-08-01 14:37:36', '1078', '的观点广泛的<br><img src=\"sys/pic/emoji/i_f/i_f24.png\"><br>&nbsp;<audio src=\"和\" loop=\"loop\" controls=\"controls\"></audio>&nbsp;<br>&nbsp;<video style=\"max-width:1024px;max-height:576px\" src=\"就\" controls=\"controls\"></video>&nbsp;<br><br>', '1197', '10', '0', '0');
INSERT INTO `message` VALUES ('109', null, '2018-08-01 14:37:36', '1078', '的观点广泛的<br><img src=\"sys/pic/emoji/i_f/i_f24.png\"><br>&nbsp;<audio src=\"和\" loop=\"loop\" controls=\"controls\"></audio>&nbsp;<br>&nbsp;<video style=\"max-width:1024px;max-height:576px\" src=\"就\" controls=\"controls\"></video>&nbsp;<br><br>', '1197', '11', '0', '0');
INSERT INTO `message` VALUES ('110', '108', '2018-08-01 16:37:40', '1078', '<a href=\'MyPageSvl?id=1197&pageNumber=1&pageLength=30#10\' >Reply</a> 音乐播放器(#10):<br>', '1197', '12', '1', '0');
INSERT INTO `message` VALUES ('111', '110', '2018-08-01 16:37:40', '1078', '<a href=\'MyPageSvl?id=1197&pageNumber=1&pageLength=30#12\' >Reply</a> 音乐播放器(#12):<img src=\"sys/pic/emoji/i_f/i_f21.png\"><br>', '1197', '13', '1', '0');
INSERT INTO `message` VALUES ('112', '111', '2018-08-01 16:37:40', '1078', '<img src=\"sys/pic/emoji/i_f/i_f03.png\"><a href=\'MyPageSvl?id=1197&pageNumber=1&pageLength=30#13\' >Reply</a> 音乐播放器(#13):<br>', '1197', '14', '1', '0');
INSERT INTO `message` VALUES ('113', null, '2018-08-01 18:08:06', '1078', '＜a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;pageNumber=1&amp;pageLength=30#14\">Reply＜/a> 音乐播放器(#14):<img src=\"sys/pic/emoji/i_f/i_f25.png\">', '1197', '15', '0', '0');
INSERT INTO `message` VALUES ('114', null, '2018-08-01 18:09:09', '1078', '＜a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;pageNumber=1&amp;pageLength=30#15\">Reply＜/a> 音乐播放器(#15):<img src=\"sys/pic/emoji/i_f/i_f28.png\">', '1197', '16', '0', '0');
INSERT INTO `message` VALUES ('115', null, '2018-08-01 18:16:48', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;pageNumber=1&amp;pageLength=30#16\">Reply</a> 音乐播放器(#16):<img src=\"sys/pic/emoji/i_f/i_f03.png\">', '1197', '17', '0', '0');
INSERT INTO `message` VALUES ('116', null, '2018-08-01 18:17:04', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;pageNumber=1&amp;pageLength=30#1\">Reply</a> 音乐播放器(#1):<img src=\"sys/pic/emoji/i_f/i_f25.png\">', '1197', '18', '0', '0');
INSERT INTO `message` VALUES ('117', null, '2018-08-01 18:17:20', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;pageNumber=1&amp;pageLength=30#2\">Reply</a> 音乐播放器(#2):<img src=\"sys/pic/emoji/i_f/i_f28.png\">', '1197', '19', '0', '0');
INSERT INTO `message` VALUES ('119', null, '2018-08-01 18:18:09', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;pageNumber=1&amp;pageLength=30#2\">Reply</a> 音乐播放器(#2):<img src=\"sys/pic/emoji/i_f/i_f25.png\">', '1197', '21', '0', '0');
INSERT INTO `message` VALUES ('120', null, '2018-08-01 18:44:02', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;replyId=102&amp;pageNumber=1&amp;pageLength=30#6\">Reply</a> 音乐播放器(#6):<img src=\"sys/pic/emoji/i_f/i_f25.png\">', '1197', '22', '0', '0');
INSERT INTO `message` VALUES ('123', null, '2018-08-01 18:56:12', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;replyId=98&amp;pageNumber=1&amp;pageLength=30#2\">Reply</a> 音乐播放器(#2):<img src=\"sys/pic/emoji/i_f/i_f25.png\">', '1197', '25', '0', '0');
INSERT INTO `message` VALUES ('125', null, '2018-08-01 18:58:24', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;replyId=124&amp;pageNumber=1&amp;pageLength=30#26\">Reply</a> 音乐播放器(#26):但是', '1197', '27', '0', '0');
INSERT INTO `message` VALUES ('126', null, '2018-08-01 19:02:03', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;replyId=105&amp;pageNumber=1&amp;pageLength=30#9\">Reply</a> 音乐播放器(#9):上的', '1197', '28', '0', '0');
INSERT INTO `message` VALUES ('127', null, '2018-08-01 19:08:08', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;replyId=98&amp;pageNumber=1&amp;pageLength=30#2\">Reply</a> 音乐播放器(#2):<img src=\"sys/pic/emoji/i_f/i_f33.png\">', '1197', '29', '0', '0');
INSERT INTO `message` VALUES ('128', '81', '2018-08-01 19:18:24', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;replyId=81&amp;pageNumber=1&amp;pageLength=30#1\">Reply</a> 音乐播放器(#1):<img src=\"sys/pic/emoji/i_f/i_f32.png\">', '1197', '30', '1', '0');
INSERT INTO `message` VALUES ('129', '81', '2018-08-01 19:18:24', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;replyId=81&amp;pageNumber=1&amp;pageLength=30#1\">Reply</a> 音乐播放器(#1):<img src=\"sys/pic/emoji/i_f/i_f32.png\">', '1197', '31', '1', '0');
INSERT INTO `message` VALUES ('130', '99', '2018-08-01 19:21:09', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;replyId=99&amp;pageNumber=1&amp;pageLength=30#3\">Reply</a> 音乐播放器(#3):<img src=\"sys/pic/emoji/i_f/i_f28.png\">', '1197', '32', '1', '0');
INSERT INTO `message` VALUES ('131', '100', '2018-08-01 19:21:09', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;replyId=100&amp;pageNumber=1&amp;pageLength=30#4\">Reply</a> 音乐播放器(#4):<img src=\"sys/pic/emoji/i_f/i_f09.png\">', '1197', '33', '1', '0');
INSERT INTO `message` VALUES ('132', '128', '2018-08-01 19:21:09', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;replyId=128&amp;pageNumber=1&amp;pageLength=30#30\">Reply</a> 音乐播放器(#30):<img src=\"sys/pic/emoji/i_f/i_f32.png\">', '1197', '34', '1', '0');
INSERT INTO `message` VALUES ('133', '100', '2018-08-01 19:21:30', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;replyId=100&amp;pageNumber=1&amp;pageLength=30#4\">Reply</a> 音乐播放器(#4):<img src=\"sys/pic/emoji/i_f/i_f28.png\">', '1197', '35', '1', '0');
INSERT INTO `message` VALUES ('134', '106', '2018-08-01 19:27:14', '1078', '<a href=\"MyPageSvl?id=1196&amp;replyId=106&amp;pageNumber=1&amp;pageLength=30#1\">Reply</a> 音乐播放器(#1):<img src=\"sys/pic/emoji/i_f/i_f28.png\">', '1196', '3', '1', '0');
INSERT INTO `message` VALUES ('139', '99', '2018-08-07 14:28:01', '1078', '<a href=\"MyPageSvl?id=1197&amp;replyId=99&amp;pageNumber=1&amp;pageLength=30#3\">Reply</a> 音乐播放器(#3):<img src=\"sys/pic/emoji/i_f/i_f28.png\">11', '1197', '38', '1', '0');
INSERT INTO `message` VALUES ('143', '108', '2018-08-20 11:28:53', '1078', '<a href=\"是否 的\">是否</a><br><a href=\"MyPageSvl?id=1197&amp;replyId=108&amp;pageNumber=1&amp;pageLength=30#10\">Reply</a> 音乐(#10):', '1197', '42', '1', '0');
INSERT INTO `message` VALUES ('144', '128', '2018-08-20 16:08:51', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;replyId=128&amp;pageNumber=1&amp;pageLength=30#30\">Reply</a> 音乐(#30):大师傅似的<br>', '1197', '43', '1', '0');
INSERT INTO `message` VALUES ('145', '128', '2018-08-20 16:08:51', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1197&amp;replyId=128&amp;pageNumber=1&amp;pageLength=30#30\">Reply</a> 音乐(#30):111', '1197', '44', '1', '0');
INSERT INTO `message` VALUES ('148', '128', '2018-08-24 10:07:53', '1078', '<a href=\"MyPageSvl?id=1197&amp;replyId=128&amp;pageNumber=1&amp;pageLength=30#30\">Reply</a> 音乐(#30):<img src=\"sys/pic/emoji/i_f/i_f42.png\">', '1197', '45', '1', '0');
INSERT INTO `message` VALUES ('149', null, '2018-08-24 10:07:51', '1078', '<img src=\"sys/pic/emoji/i_f/i_f45.png\">\r<br>	', '1197', '46', '0', '0');
INSERT INTO `message` VALUES ('157', null, '2018-08-24 13:24:40', '1078', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1202&amp;replyId=156&amp;pageNumber=1&amp;pageLength=30#3\">Reply</a> 音乐(#3):手动阀手动阀', '1202', '4', '0', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=1203 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mypage
-- ----------------------------
INSERT INTO `mypage` VALUES ('1042', '这是第一条帖子', '2018-05-24 17:44:43', '这是第一条帖子的第一楼', '1000', '2018-07-10 17:23:36', '64', '0');
INSERT INTO `mypage` VALUES ('1043', '这是第二条帖子', '2018-05-24 17:44:43', '这是第零楼', '1000', '2018-05-21 20:54:14', '3', '0');
INSERT INTO `mypage` VALUES ('1046', '发个大概豆腐干地方', '2018-05-24 17:44:43', '发嘀咕嘀咕的风格的', '1000', '2018-05-21 21:02:34', '0', '0');
INSERT INTO `mypage` VALUES ('1047', '梵蒂冈梵蒂冈地方官', '2018-05-24 17:44:43', '广泛大概豆腐干豆腐干', '1000', '2018-05-21 21:02:04', '0', '0');
INSERT INTO `mypage` VALUES ('1048', '感豆腐干豆腐干', '2018-05-24 17:44:43', '敢反对鬼地方', '1000', '2018-05-21 21:03:49', '1', '0');
INSERT INTO `mypage` VALUES ('1050', '感豆腐干大概豆腐干豆腐干', '2018-05-24 17:44:43', '高浮雕', '1000', '2018-05-21 21:40:04', '4', '0');
INSERT INTO `mypage` VALUES ('1051', '要睡觉了', '2018-05-24 17:44:43', '你呢', '1000', '2018-05-21 21:39:39', '5', '0');
INSERT INTO `mypage` VALUES ('1052', '明天有人一起去爬山吗？', '2018-05-24 17:44:43', '自行车去', '1037', '2018-05-21 21:52:38', '2', '0');
INSERT INTO `mypage` VALUES ('1053', '这是第三条帖子', '2018-05-24 17:44:43', '哈哈哈哈哈', '1000', '2018-05-25 14:13:08', '4', '0');
INSERT INTO `mypage` VALUES ('1054', '招租啦招租啦', '2018-05-24 17:44:43', '有人租房子吗', '1000', '2018-05-21 22:07:36', '3', '0');
INSERT INTO `mypage` VALUES ('1055', '地方烦烦烦烦烦烦烦烦烦', '2018-05-24 17:44:43', '的烦烦烦烦烦烦烦烦烦v', '1000', '2018-05-21 22:31:50', '0', '0');
INSERT INTO `mypage` VALUES ('1058', '对方身份的', '2018-05-24 17:44:43', '电风扇电风扇', '1000', '2018-05-22 18:09:00', '2', '0');
INSERT INTO `mypage` VALUES ('1059', '发生范德萨', '2018-05-24 17:44:43', '十分士大夫', '1000', '2018-05-25 14:21:53', '5', '0');
INSERT INTO `mypage` VALUES ('1060', '胜多负少', '2018-05-24 17:44:43', '房贷首付', '1000', '2018-05-22 18:29:54', '1', '0');
INSERT INTO `mypage` VALUES ('1061', '断指积极', '2018-05-24 17:44:43', '的方式', '1000', '2018-05-23 14:25:56', '5', '0');
INSERT INTO `mypage` VALUES ('1062', '房贷首付', '2018-05-24 17:44:43', '发士大夫', '1000', '2018-05-24 14:38:44', '5', '0');
INSERT INTO `mypage` VALUES ('1063', '地方', '2018-05-24 17:44:43', '的说法是1234433', '1000', '2018-05-24 17:39:43', '1', '0');
INSERT INTO `mypage` VALUES ('1064', '反倒是', '2018-05-24 17:46:39', '的说法的方式', '1000', '2018-05-24 18:02:32', '1', '0');
INSERT INTO `mypage` VALUES ('1065', '的说法大师傅似的', '2018-05-24 18:04:18', '反倒是', '1000', '2018-05-24 18:20:42', '5', '0');
INSERT INTO `mypage` VALUES ('1066', '士大夫十分', '2018-05-24 18:18:41', '大师傅似的', '1000', '2018-05-29 15:44:58', '3', '0');
INSERT INTO `mypage` VALUES ('1067', '1', '2018-05-25 14:10:49', '1', '1066', '2018-05-28 17:46:29', '3', '0');
INSERT INTO `mypage` VALUES ('1068', 'SMBUS的介绍与访问', '2018-05-25 14:22:52', '对方身上的', '1000', '2018-05-25 14:23:20', '1', '0');
INSERT INTO `mypage` VALUES ('1069', 'BIOS/UEFI基础——Device Path', '2018-05-25 14:23:10', '发士大夫', '1000', '2018-05-25 14:23:10', '0', '0');
INSERT INTO `mypage` VALUES ('1070', '在eclipse中为编译器指定自己特殊的编译方式', '2018-05-25 14:23:54', '第三方的', '1000', '2018-05-29 15:27:10', '4', '0');
INSERT INTO `mypage` VALUES ('1071', '士大夫十分发达是否', '2018-05-28 17:39:24', '大师傅大师傅', '1000', '2018-05-28 17:39:30', '1', '0');
INSERT INTO `mypage` VALUES ('1072', '法大师傅士大夫', '2018-05-28 17:47:21', '法大师傅大师傅', '1057', '2018-06-05 10:22:22', '21', '0');
INSERT INTO `mypage` VALUES ('1073', '今天星期几？', '2018-05-29 11:29:33', '今天星期2', '1070', '2018-05-29 14:06:30', '4', '0');
INSERT INTO `mypage` VALUES ('1074', '符合规范规划', '2018-05-29 11:32:25', '梵蒂冈地方官', '1070', '2018-05-29 11:32:33', '1', '0');
INSERT INTO `mypage` VALUES ('1075', '大师傅士大夫', '2018-05-29 11:33:09', '的说法是', '1070', '2018-05-29 14:07:28', '3', '0');
INSERT INTO `mypage` VALUES ('1076', '用好你的内存之SPD', '2018-05-29 14:57:11', '客户如果客家话', '1070', '2018-05-29 15:27:11', '3', '0');
INSERT INTO `mypage` VALUES ('1077', '明天有人去钓鱼吗？', '2018-05-29 15:56:01', '地点在这里', '1070', '2018-05-29 16:01:09', '6', '0');
INSERT INTO `mypage` VALUES ('1078', '落款时间分厘卡的骄傲垃圾垃圾觉得分开了', '2018-05-29 16:04:45', '但是没有是灯笼裤飞机啊是垃圾flask解放拉萨啊垃圾垃圾发觉', '1000', '2018-05-29 16:13:25', '4', '0');
INSERT INTO `mypage` VALUES ('1080', '很快客家话艰苦', '2018-05-29 16:15:19', '<a href=\"Home?id=1000\">亚祺</a>', '1000', '2018-05-29 16:15:19', '0', '0');
INSERT INTO `mypage` VALUES ('1081', '<a href=\"Home?id=1000\">秦亚祺</a>', '2018-05-29 16:17:07', '<a href=\"Home?id=1000\">秦亚祺</a>', '1000', '2018-05-29 16:18:46', '3', '0');
INSERT INTO `mypage` VALUES ('1082', '    ', '2018-05-29 16:19:01', '    \r\n<a href=\"Home?id=1000\">秦亚祺</a> \r\n', '1000', '2018-05-29 16:19:01', '0', '0');
INSERT INTO `mypage` VALUES ('1083', ' ', '2018-05-29 16:19:12', ' ', '1000', '2018-05-29 16:19:12', '0', '0');
INSERT INTO `mypage` VALUES ('1084', '<a href=\"Home?id=1000\">秦亚祺</a> ', '2018-05-29 16:19:45', '<a href=\"Home?id=1000\">秦亚祺</a> \r\n', '1000', '2018-05-29 16:19:50', '1', '0');
INSERT INTO `mypage` VALUES ('1085', '发射点发射点', '2018-05-29 16:27:06', '<%out.println(\"ddddd\");%>', '1070', '2018-05-29 16:27:37', '1', '0');
INSERT INTO `mypage` VALUES ('1086', '123', '2018-05-29 16:28:19', '<%out.print(\"<td>\"+ \"--------\" + \"</td>\");%>', '1070', '2018-06-21 14:28:02', '0', '0');
INSERT INTO `mypage` VALUES ('1087', '的撒旦发', '2018-05-29 16:29:12', '<%out.print(\"--------\");%>', '1070', '2018-05-29 16:34:00', '1', '0');
INSERT INTO `mypage` VALUES ('1089', '豆腐干豆腐干', '2018-05-29 16:40:33', '<script type=\"text/javascript\">\r\n\r\n	  window.location.href=\"index\";\r\n\r\n</script>', '1000', '2018-05-29 16:40:33', '0', '0');
INSERT INTO `mypage` VALUES ('1090', '百度', '2018-05-29 16:42:24', '<script type=\"text/javascript\">\r\n  window.location.href=\"www.baidu.com\";\r\n</script>', '1000', '2018-05-29 16:42:24', '0', '0');
INSERT INTO `mypage` VALUES ('1091', '百度', '2018-05-29 16:43:31', '<script type=\"text/javascript\">\r\n  window.location.href=\"http://www.baidu.com\";\r\n</script>', '1000', '2018-05-29 16:43:31', '0', '0');
INSERT INTO `mypage` VALUES ('1092', 'win32下 如何定位内存泄漏', '2018-05-29 17:03:47', '广东', '1070', '2018-05-29 17:03:47', '0', '0');
INSERT INTO `mypage` VALUES ('1093', 'win32下 如何定位内存泄漏', '2018-05-29 17:04:10', '<% \r\n\r\n		out.println(\"</table>\");\r\n		out.println(\"<br>\");\r\n		%>', '1070', '2018-05-29 17:04:10', '0', '0');
INSERT INTO `mypage` VALUES ('1094', 'win32下 如何定位内存泄漏', '2018-05-29 17:04:24', '  给v不错v吧', '1070', '2018-06-04 14:42:44', '2', '0');
INSERT INTO `mypage` VALUES ('1095', 'win32下 如何定位内存泄漏', '2018-05-29 17:04:41', '\r\n会更加', '1070', '2018-05-29 17:04:41', '0', '0');
INSERT INTO `mypage` VALUES ('1096', '  好几个 ', '2018-05-29 17:04:56', '会更加', '1070', '2018-05-29 17:04:56', '0', '0');
INSERT INTO `mypage` VALUES ('1097', '风格豆腐干', '2018-05-29 17:36:03', '广泛大概豆腐干', '1000', '2018-05-29 17:36:10', '1', '0');
INSERT INTO `mypage` VALUES ('1098', '顶楼上看风景圣诞快乐房价失控的来访接', '2018-05-29 17:51:51', '的方式方式方法烦烦烦烦烦烦烦烦烦烦烦烦', '1000', '2018-05-29 17:51:51', '0', '0');
INSERT INTO `mypage` VALUES ('1099', '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018-05-29 17:54:06', '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '1000', '2018-06-04 14:42:36', '2', '0');
INSERT INTO `mypage` VALUES ('1100', '**', '2018-05-30 10:16:06', '**', '1000', '2018-05-30 10:16:42', '1', '0');
INSERT INTO `mypage` VALUES ('1101', '<>', '2018-05-30 10:17:48', '<>', '1000', '2018-05-30 10:21:03', '3', '0');
INSERT INTO `mypage` VALUES ('1102', '百度', '2018-05-30 10:18:58', '<script type=\"text/javascript\">\r\nwindow.location.href=\"http://www.baidu.com\";\r\n</script>', '1000', '2018-05-30 10:18:58', '0', '0');
INSERT INTO `mypage` VALUES ('1103', '百度', '2018-05-30 10:21:19', '**script type=\"text/javascript\">\r\n  window.location.href=\"http://www.baidu.com\";\r\n**/script>', '1000', '2018-05-31 15:35:44', '3', '0');
INSERT INTO `mypage` VALUES ('1104', '百度', '2018-05-30 10:39:12', '＜script type=\"text/javascript\">\r\n  window.location.href=\"http://www.baidu.com\";\r\n＜/script>', '1000', '2018-05-30 10:52:03', '4', '0');
INSERT INTO `mypage` VALUES ('1105', '发射点发射点', '2018-06-04 12:46:04', '的发射点发射点', '1000', '2018-06-04 12:46:04', '0', '0');
INSERT INTO `mypage` VALUES ('1106', '的方式发送到', '2018-06-04 12:46:12', '大师傅大师傅', '1000', '2018-06-05 14:19:15', '11', '0');
INSERT INTO `mypage` VALUES ('1107', '撒旦范德萨范德萨发', '2018-06-04 12:46:24', '大师傅大师傅但是', '1000', '2018-06-04 12:46:24', '0', '0');
INSERT INTO `mypage` VALUES ('1108', '色发射点发射点犯得上', '2018-06-04 14:37:39', '但是发射点发射点发射点发射点', '1000', '2018-06-04 14:37:43', '1', '0');
INSERT INTO `mypage` VALUES ('1110', '[32位移植到64]_[C/C++代码嵌入汇编代码移植篇]', '2018-06-05 10:23:07', '大商股份赶得上赶得上告诉对方', '1070', '2018-06-05 10:23:07', '0', '0');
INSERT INTO `mypage` VALUES ('1111', '六点开饭时间了迪斯科解放了', '2018-06-16 18:04:32', '壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。\r\n于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。\r\n', '1076', '2018-06-16 18:05:45', '5', '0');
INSERT INTO `mypage` VALUES ('1112', '发射点发射点', '2018-06-16 18:06:19', '大师傅士大夫', '1076', '2018-06-18 22:47:48', '26', '0');
INSERT INTO `mypage` VALUES ('1113', '的旅客谨防垃圾分类大家分厘卡机手法来似的', '2018-06-16 18:24:50', '接口逻辑啊蓝山咖啡奖励开始放假了肯德基', '1076', '2018-06-16 18:25:15', '1', '0');
INSERT INTO `mypage` VALUES ('1114', '两点开始减肥来看大家分厘卡电视机分厘卡分', '2018-06-16 19:48:57', '壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。 于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。离开戒毒所分厘卡时间电风扇', '1077', '2018-07-09 14:30:05', '5', '0');
INSERT INTO `mypage` VALUES ('1115', '是先嗯哼', '2018-06-16 21:02:13', '岜那那睡女女', '1080', '2018-06-18 13:08:42', '22', '0');
INSERT INTO `mypage` VALUES ('1116', '&nbsp壬戌之秋，游于赤', '2018-06-18 18:04:39', '\r<br>壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。&nbsp\r<br>＜br＞&nbsp\r<br>＜br＞于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。&nbsp\r<br>＜br＞&nbsp\r<br>＜br＞苏子愀然，正襟危坐而问客曰：“何为其然也？”客曰：“月明星稀，乌鹊南飞，此非曹孟德之诗乎？西望夏口，东望武昌，山川相缪，郁乎苍苍，此非孟德之困于周郎者乎？方其破荆州，下江陵，顺流而东也，舳舻千里，旌旗蔽空，酾酒临江，横槊赋诗，固一世之雄也，而今安在哉？况吾与子渔樵于江渚之上，侣鱼虾而友麋鹿，驾一叶之扁舟，举匏樽以相属。寄蜉蝣于天地，渺沧海之一粟。哀吾生之须臾，羡长江之无穷。挟飞仙以遨游，抱明月而长终。知不可乎骤得，托遗响于悲风。”&nbsp\r<br>＜br＞&nbsp\r<br>＜br＞苏子曰：“客亦知夫水与月乎？逝者如斯，而未尝往也；盈虚者莫消长。盖将', '1078', '2018-07-10 17:22:50', '9', '0');
INSERT INTO `mypage` VALUES ('1117', '&nbsp&nbsp&nbsp', '2018-06-18 18:04:53', '&nbsp&nbsp&nbsp', '1078', '2018-06-18 18:04:53', '0', '0');
INSERT INTO `mypage` VALUES ('1118', '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp1', '2018-06-18 18:08:09', '都是防辐射地方escapeXml=＂false＂', '1078', '2018-06-18 18:09:21', '1', '0');
INSERT INTO `mypage` VALUES ('1119', '＜a&nbsphref=＂Home?id=100', '2018-06-18 18:09:31', '＜a&nbsphref=＂Home?id=1000＂＞秦亚祺＜/a＞', '1078', '2018-06-18 18:09:31', '0', '0');
INSERT INTO `mypage` VALUES ('1121', 'what\'s&nbspyou&nbspname?', '2018-06-18 18:13:00', '1', '1078', '2018-06-19 16:45:26', '4', '0');
INSERT INTO `mypage` VALUES ('1122', 'what\'s&nbspyou&nbspname?', '2018-06-18 18:13:22', 'sdf', '1078', '2018-06-18 18:35:25', '3', '0');
INSERT INTO `mypage` VALUES ('1123', 'what\'s&nbspyou&nbspname?', '2018-06-18 23:33:17', '/upload/picture/user/1078/8ccc5b06-e988-45fa-9678-95a839cdcdbf_吉田洁&nbsp日本人的遥远旅途&nbsp旅程的终结.mp3<audio src=\"/upload/picture/user/1078/8ccc5b06-e988-45fa-9678-95a839cdcdbf_吉田洁&nbsp日本人的遥远旅途&nbsp旅程的终结.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1078', '2018-07-10 16:03:17', '18', '0');
INSERT INTO `mypage` VALUES ('1124', 'win32下&nbsp如何定位内存泄漏', '2018-06-19 16:48:48', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1121＆pageNumber=1＆pageLength=30\"><img src=\"http://localhost:8080/Test1/MyPageSvl?id=1121＆pageNumber=1＆pageLength=30\" style=\"max-width:800px\"/></a>', '1078', '2018-07-05 14:21:23', '1', '0');
INSERT INTO `mypage` VALUES ('1125', 'win32下&nbsp如何定位内存泄漏', '2018-06-19 16:49:54', '<a href=\"http://localhost:8080/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg\"><img src=\"http://localhost:8080/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg\" style=\"max-width:800px\"/></a>', '1078', '2018-06-21 11:16:50', '8', '0');
INSERT INTO `mypage` VALUES ('1126', '＜%out.print(＂＜td＞＂+&nbsp', '2018-06-21 14:27:39', '＜%out.print(＂＜td＞＂+&nbsp＂--------＂&nbsp+&nbsp＂＜/td＞＂);%＞', '1078', '2018-07-10 17:19:45', '2', '0');
INSERT INTO `mypage` VALUES ('1127', 'win32下&nbsp如何定位内存泄漏', '2018-07-10 11:47:14', '的方式', '1078', '2018-07-26 13:35:35', '10', '0');
INSERT INTO `mypage` VALUES ('1128', '胜多负少打发士大夫的打法', '2018-07-10 13:31:48', '撒旦发射点发射点', '1078', '2018-07-18 13:22:43', '20', '0');
INSERT INTO `mypage` VALUES ('1130', '的撒反对犯得上犯得上犯得上发大师傅但是士', '2018-07-12 15:03:59', '大师傅似的', '1078', '2018-07-18 13:21:36', '3', '0');
INSERT INTO `mypage` VALUES ('1131', '大师傅似的大师傅士大夫士大夫士大夫大师傅大师傅手动阀手动阀手', '2018-07-26 13:53:31', '<a href=\"sys/pic/emoji/i_f/i_f03.png\"><img src=\"sys/pic/emoji/i_f/i_f03.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f03.png\"><img src=\"sys/pic/emoji/i_f/i_f03.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f03.png\"><img src=\"sys/pic/emoji/i_f/i_f03.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f03.png\"><img src=\"sys/pic/emoji/i_f/i_f03.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1078', '2018-07-26 13:53:31', '0', '0');
INSERT INTO `mypage` VALUES ('1132', '大师傅似的大师傅士大夫士大夫士大夫大师傅大师傅手动阀手动阀手', '2018-07-26 13:54:03', '<a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1078', '2018-07-26 13:59:05', '1', '0');
INSERT INTO `mypage` VALUES ('1133', '大师傅似的大师傅士大夫士大夫士大夫大师傅大师傅手动阀手动阀手', '2018-07-26 13:54:04', '<a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1078', '2018-07-26 13:54:04', '0', '0');
INSERT INTO `mypage` VALUES ('1134', '大师傅似的大师傅士大夫士大夫士大夫大师傅大师傅手动阀手动阀手', '2018-07-26 13:54:58', '<a href=\"sys/pic/emoji/i_f/i_f02.png\"><img src=\"sys/pic/emoji/i_f/i_f02.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f02.png\"><img src=\"sys/pic/emoji/i_f/i_f02.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1078', '2018-07-26 14:35:18', '8', '0');
INSERT INTO `mypage` VALUES ('1135', '大师傅似的大师傅士大夫士大夫士大夫大师傅大师傅手动阀手动阀手', '2018-07-26 14:40:48', '<a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f02.png\"><img src=\"sys/pic/emoji/i_f/i_f02.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f03.png\"><img src=\"sys/pic/emoji/i_f/i_f03.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f04.png\"><img src=\"sys/pic/emoji/i_f/i_f04.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f05.png\"><img src=\"sys/pic/emoji/i_f/i_f05.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1078', '2018-07-26 14:48:46', '3', '0');
INSERT INTO `mypage` VALUES ('1136', '大师傅似的大师傅士大夫士大夫士大夫大师傅大师傅手动阀手动阀手', '2018-07-26 14:49:21', '<a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f05.png\"><img src=\"sys/pic/emoji/i_f/i_f05.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f10.png\"><img src=\"sys/pic/emoji/i_f/i_f10.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1078', '2018-07-26 15:33:17', '7', '0');
INSERT INTO `mypage` VALUES ('1139', '大师傅似的大师傅士大夫士大夫士大夫大师傅大师傅手动阀手动阀手', '2018-07-27 17:06:36', '<a href=\"sys\\pic\\emoji\\i_f\\i_f01.png\"><img src=\"sys\\pic\\emoji\\i_f\\i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys\\pic\\emoji\\i_f\\i_f10.png\"><img src=\"sys\\pic\\emoji\\i_f\\i_f10.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys\\pic\\emoji\\i_f\\i_f11.png\"><img src=\"sys\\pic\\emoji\\i_f\\i_f11.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys\\pic\\emoji\\i_f\\i_f20.png\"><img src=\"sys\\pic\\emoji\\i_f\\i_f20.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1078', '2018-07-27 17:06:36', '0', '0');
INSERT INTO `mypage` VALUES ('1140', '大师傅似的大师傅士大夫士大夫士大夫大师傅大师傅手动阀手动阀手', '2018-07-27 17:27:51', '<a href=\"sys/pic/emoji/i_f/i_f01.png\"><img src=\"sys/pic/emoji/i_f/i_f01.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f10.png\"><img src=\"sys/pic/emoji/i_f/i_f10.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f41.png\"><img src=\"sys/pic/emoji/i_f/i_f41.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f50.png\"><img src=\"sys/pic/emoji/i_f/i_f50.png\" style=\"max-width:1024px;max-height:576px\"/></a><a href=\"sys/pic/emoji/i_f/i_f25.png\"><img src=\"sys/pic/emoji/i_f/i_f25.png\" style=\"max-width:1024px;max-height:576px\"/></a>', '1078', '2018-07-27 17:28:11', '1', '0');
INSERT INTO `mypage` VALUES ('1141', '发射点发射点', '2018-07-31 17:23:39', '方式', '1078', '2018-07-31 17:23:39', '0', '0');
INSERT INTO `mypage` VALUES ('1142', '发射点发射点', '2018-07-31 17:23:53', '\r<br>			＜img&nbspsrc=＂https://www.baidu.com/img/baidu_jgylogo3.gif＂＞', '1078', '2018-07-31 17:23:53', '0', '0');
INSERT INTO `mypage` VALUES ('1143', '发射点发射点', '2018-07-31 17:27:50', '\r<br>			＜img&nbspsrc=＂https://www.baidu.com/img/baidu_jgylogo3.gif＂＞＜img&nbspsrc=＂https://www.baidu.com/img/baidu_jgylogo3.gif＂＞＜img&nbspsrc=＂https://www.baidu.com/img/baidu_jgylogo3.gif＂＞＜img&nbspsrc=＂https://www.baidu.com/img/baidu_jgylogo3.gif＂＞', '1078', '2018-07-31 17:27:50', '0', '0');
INSERT INTO `mypage` VALUES ('1144', '发射点发射点', '2018-07-31 18:42:27', '\r<br>			＜img&nbspsrc=＂sys/pic/emoji/i_f/i_f02.png＂＞', '1078', '2018-07-31 18:42:27', '0', '0');
INSERT INTO `mypage` VALUES ('1145', '发射点发射点', '2018-07-31 18:42:37', '\r<br>			＜br＞', '1078', '2018-07-31 18:42:37', '0', '0');
INSERT INTO `mypage` VALUES ('1146', '发射点发射点', '2018-07-31 18:42:54', '\r<br>			＜br＞', '1078', '2018-07-31 18:42:54', '0', '0');
INSERT INTO `mypage` VALUES ('1147', '发射点发射点', '2018-07-31 18:47:04', '啊', '1078', '2018-07-31 18:47:04', '0', '0');
INSERT INTO `mypage` VALUES ('1148', '发射点发射点', '2018-07-31 18:48:48', '\r<br>			＜br＞', '1078', '2018-07-31 18:48:48', '0', '0');
INSERT INTO `mypage` VALUES ('1149', '发射点发射点', '2018-07-31 18:52:39', '是否', '1078', '2018-07-31 18:52:39', '0', '0');
INSERT INTO `mypage` VALUES ('1150', '反倒是', '2018-07-31 18:53:22', '的身份', '1078', '2018-07-31 18:53:22', '0', '0');
INSERT INTO `mypage` VALUES ('1151', '发射点发射点', '2018-07-31 18:54:31', '地方', '1078', '2018-07-31 18:54:31', '0', '0');
INSERT INTO `mypage` VALUES ('1152', '地方', '2018-07-31 18:54:57', '反对', '1078', '2018-07-31 18:54:57', '0', '0');
INSERT INTO `mypage` VALUES ('1153', '发射点发射点', '2018-07-31 18:56:27', '上的', '1078', '2018-07-31 18:56:27', '0', '0');
INSERT INTO `mypage` VALUES ('1154', '发射点发射点', '2018-07-31 18:56:46', '\r<br>			＜br＞', '1078', '2018-07-31 18:56:46', '0', '0');
INSERT INTO `mypage` VALUES ('1155', '发射点发射点', '2018-07-31 18:58:40', '\r<br>			＜br＞', '1078', '2018-07-31 18:58:40', '0', '0');
INSERT INTO `mypage` VALUES ('1156', '发射点发射点', '2018-07-31 19:02:14', '\r<br>			＜img&nbspsrc=＂sys/pic/emoji/i_f/i_f01.png＂＞＜img&nbspsrc=＂sys/pic/emoji/i_f/i_f02.png＂＞', '1078', '2018-07-31 19:02:14', '0', '0');
INSERT INTO `mypage` VALUES ('1157', '大师傅士大夫', '2018-07-31 19:03:01', '\r<br>			＜img&nbspsrc=＂sys/pic/emoji/i_f/i_f02.png＂＞＆nbsp;＜audio&nbspsrc=＂1＂&nbsploop=＂loop＂&nbspcontrols=＂controls＂＞＜/audio＞＆nbsp;＜video&nbspstyle=＂max-width:1024px;max-height:576px＂&nbspsrc=＂2＂&nbspcontrols=＂controls＂＞＜/video＞＜img&nbspsrc=＂3＂＞', '1078', '2018-07-31 19:03:01', '0', '0');
INSERT INTO `mypage` VALUES ('1158', '发射点发射点', '2018-07-31 19:03:27', '\r<br>			＜br＞', '1078', '2018-07-31 19:03:27', '0', '0');
INSERT INTO `mypage` VALUES ('1159', '发射点发射点', '2018-07-31 19:11:38', '＜br＞', '1078', '2018-07-31 19:11:38', '0', '0');
INSERT INTO `mypage` VALUES ('1160', '大师傅似的大师傅士大夫士大夫士大夫大师傅大师傅手动阀手动阀手', '2018-08-01 09:44:56', '反倒是＜div＞士大夫＜/div＞＜div＞的风格＜/div＞', '1078', '2018-08-01 09:44:56', '0', '0');
INSERT INTO `mypage` VALUES ('1161', '发射点发射点', '2018-08-01 09:48:43', '＜div＞士大夫＜/div＞＜div＞反倒是＜/div＞＜div＞阿道夫＜/div＞', '1078', '2018-08-01 09:48:43', '0', '0');
INSERT INTO `mypage` VALUES ('1162', '的撒旦发', '2018-08-01 10:02:58', '＜div＞的方式＜/div＞＜div＞是士大夫＜/div＞＜div＞发士大夫＜/div＞', '1078', '2018-08-01 10:02:58', '0', '0');
INSERT INTO `mypage` VALUES ('1163', '撒旦范德萨范德萨发', '2018-08-01 10:06:39', '＜div＞**＜/div＞＜div＞的身份＜/div＞＜div＞的身份＜/div＞＜div＞**＜/div＞', '1078', '2018-08-01 10:06:39', '0', '0');
INSERT INTO `mypage` VALUES ('1164', '发射点发射点', '2018-08-01 10:18:29', '＜div＞方式＜/div＞＜div＞但是＜/div＞＜div＞的方式＜/div＞', '1078', '2018-08-01 10:18:29', '0', '0');
INSERT INTO `mypage` VALUES ('1165', '的撒旦发', '2018-08-01 10:22:24', '＜div＞撒旦＜/div＞＜div＞sad＜/div＞＜div＞撒旦＜/div＞', '1078', '2018-08-01 10:22:24', '0', '0');
INSERT INTO `mypage` VALUES ('1166', '发射点发射点', '2018-08-01 10:30:44', '＜div＞方式＜/div＞＜div＞但是＜/div＞＜div＞的身份＜/div＞', '1078', '2018-08-01 10:36:21', '2', '0');
INSERT INTO `mypage` VALUES ('1167', '色发射点发射点犯得上', '2018-08-01 10:52:40', '＜div＞是否＜/div＞＜div＞的身份＜/div＞＜div＞士大夫＜/div＞＜div＞是否＜/div＞', '1078', '2018-08-01 10:53:46', '1', '0');
INSERT INTO `mypage` VALUES ('1168', '发射点发射点', '2018-08-01 10:53:11', '\r<br>			＜img&nbspsrc=＂sys/pic/emoji/i_f/i_f01.png＂＞', '1078', '2018-08-01 10:53:30', '1', '0');
INSERT INTO `mypage` VALUES ('1169', '发射点发射点', '2018-08-01 10:56:31', '的身份<br>的身份<br>是否<br>', '1078', '2018-08-01 10:56:31', '0', '0');
INSERT INTO `mypage` VALUES ('1170', '发射点发射点', '2018-08-01 10:57:07', '随风倒随风倒<br>＜img&nbspsrc=＂sys/pic/emoji/i_f/i_f01.png＂＞<br>＜img&nbspsrc=＂sys/pic/emoji/i_f/i_f02.png＂＞<br>＜img&nbspsrc=＂sys/pic/emoji/i_f/i_f04.png＂＞＜br＞<br>', '1078', '2018-08-01 10:57:07', '0', '0');
INSERT INTO `mypage` VALUES ('1171', '发射点发射点', '2018-08-01 10:57:18', '\r<br>			＜br＞', '1078', '2018-08-01 10:57:18', '0', '0');
INSERT INTO `mypage` VALUES ('1172', '的撒旦发', '2018-08-01 11:04:12', '\r<br>			<br>', '1078', '2018-08-01 11:04:12', '0', '0');
INSERT INTO `mypage` VALUES ('1173', '发射点发射点', '2018-08-01 11:04:37', '阿瑟东<br>的身份<br>＜img&nbspsrc=＂sys/pic/emoji/i_f/i_f02.png＂＞<br><br>', '1078', '2018-08-01 11:04:37', '0', '0');
INSERT INTO `mypage` VALUES ('1174', '色发射点发射点犯得上', '2018-08-01 11:06:25', '\r<br>			＜img&nbspsrc=＂sys/pic/emoji/i_f/i_f01.png＂＞<br>＆nbsp;＜audio&nbspsrc=＂1＂&nbsploop=＂loop＂&nbspcontrols=＂controls＂＞＜/audio＞<br>＆nbsp;＜video&nbspstyle=＂max-width:1024px;max-height:576px＂&nbspsrc=＂1＂&nbspcontrols=＂controls＂＞＜/video＞＜b＞＜/b＞＜i＞＜/i＞＜u＞＜/u＞＜sub＞＜/sub＞＜sup＞＜/sup＞＜strike＞＜/strike＞<br><br>', '1078', '2018-08-01 11:06:25', '0', '0');
INSERT INTO `mypage` VALUES ('1175', '色发射点发射点犯得上', '2018-08-01 11:13:15', '\r<br>			＆nbsp;＜video&nbsp;style=＂max-width:1024px;max-height:576px＂&nbsp;src=＂1＂&nbsp;controls=＂controls＂＞＜/video＞＆nbsp;', '1078', '2018-08-01 11:13:15', '0', '0');
INSERT INTO `mypage` VALUES ('1176', '发射点发射点', '2018-08-01 11:13:49', '\r<br>			＜img&nbsp;src=＂sys/pic/emoji/i_f/i_f02.png＂＞<br>＆nbsp;＜audio&nbsp;src=＂1＂&nbsp;loop=＂loop＂&nbsp;controls=＂controls＂＞＜/audio＞＆nbsp;<br>＆nbsp;＜video&nbsp;style=＂max-width:1024px;max-height:576px＂&nbsp;src=＂3＂&nbsp;controls=＂controls＂＞＜/video＞＆nbsp;<br>＆nbsp;＜audio&nbsp;src=＂3＂&nbsp;loop=＂loop＂&nbsp;controls=＂controls＂＞＜/audio＞＆nbsp;＜b＞＜/b＞＜i＞＜/i＞＜u＞＜/u＞＜sub＞＜/sub＞＜sup＞＜/sup＞＜strike＞＜/strike＞<br><br>', '1078', '2018-08-01 11:13:49', '0', '0');
INSERT INTO `mypage` VALUES ('1177', '的方式发送到', '2018-08-01 11:47:38', '\r<br>			＜img&nbsp;src=＂sys/pic/emoji/i_f/i_f02.png＂＞<br>＆nbsp;＜audio&nbsp;src=＂2＂&nbsp;loop=＂loop＂&nbsp;controls=＂controls＂＞＜/audio＞＆nbsp;<br>＆nbsp;＜video&nbsp;style=＂max-width:1024px;max-height:576px＂&nbsp;src=＂6＂&nbsp;controls=＂controls＂＞＜/video＞＆nbsp;<br><br>', '1078', '2018-08-01 11:47:38', '0', '0');
INSERT INTO `mypage` VALUES ('1178', '发射点发射点', '2018-08-01 11:54:59', '\r<br>			＜img&nbsp;src=＂sys/pic/emoji/i_f/i_f02.png＂＞<br>&nbsp;＜audio&nbsp;src=＂0＂&nbsp;loop=＂loop＂&nbsp;controls=＂controls＂＞＜/audio＞&nbsp;<br>&nbsp;＜video&nbsp;style=＂max-width:1024px;max-height:576px＂&nbsp;src=＂0＂&nbsp;controls=＂controls＂＞＜/video＞&nbsp;<br><br>', '1078', '2018-08-01 11:54:59', '0', '0');
INSERT INTO `mypage` VALUES ('1179', '撒旦范德萨范德萨发', '2018-08-01 12:33:11', '\r<br>			<img&nbsp;src=＂sys/pic/emoji/i_f/i_f02.png＂><br><img&nbsp;src=＂sys/pic/emoji/i_f/i_f03.png＂><br>&nbsp;<audio&nbsp;src=＂1＂&nbsp;loop=＂loop＂&nbsp;controls=＂controls＂></audio>&nbsp;<br>&nbsp;<video&nbsp;style=＂max-width:1024px;max-height:576px＂&nbsp;src=＂0＂&nbsp;controls=＂controls＂></video>&nbsp;<br><br>', '1078', '2018-08-22 15:56:47', '0', '0');
INSERT INTO `mypage` VALUES ('1180', '发射点发射点', '2018-08-01 12:37:22', '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br><br><br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;5&nbsp;555&nbsp;55&nbsp;555&nbsp;5555&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;5&nbsp;&nbsp;&nbsp;&nbsp;5<br>', '1078', '2018-08-01 12:37:22', '0', '0');
INSERT INTO `mypage` VALUES ('1181', '发射点发射点', '2018-08-01 12:39:25', '\r<br>			<img**src=＂sys/pic/emoji/i_f/i_f02.png＂><br>&nbsp;<audio**src=＂0＂**loop=＂loop＂**controls=＂controls＂></audio>&nbsp;<br>&nbsp;<video**style=＂max-width:1024px;max-height:576px＂**src=＂0＂**controls=＂controls＂></video>&nbsp;<br><br>', '1078', '2018-08-01 12:39:25', '0', '0');
INSERT INTO `mypage` VALUES ('1182', '发射点发射点', '2018-08-01 12:41:46', '\r<br>			<img src=\"sys/pic/emoji/i_f/i_f02.png\"><br>&nbsp;<audio src=\"0\" loop=\"loop\" controls=\"controls\"></audio>&nbsp;<br>&nbsp;<video style=\"max-width:1024px;max-height:576px\" src=\"0\" controls=\"controls\"></video>&nbsp;<br><br>', '1078', '2018-08-01 12:41:46', '0', '0');
INSERT INTO `mypage` VALUES ('1183', '的撒旦发', '2018-08-01 12:47:56', '&nbsp;<audio src=\"http://47.52.95.224/upload/user/1078/4689f8c1-3a96-42bc-8dd2-e84d5181eb9f_%E4%BD%90%E8%97%A4%E7%9B%B4%E7%BA%AA%20(%E3%81%95%E3%81%A8%E3%81%86%20%E3%81%AA%E3%81%8A%E3%81%8D)%20-%20Ryomaden%20%5Bmqms%5D.mp3\" loop=\"loop\" controls=\"controls\"></audio>&nbsp;&nbsp;', '1078', '2018-08-01 12:47:56', '0', '0');
INSERT INTO `mypage` VALUES ('1184', '发射点发射点', '2018-08-01 12:49:37', '\r<br>			&nbsp;<audio src=\"https://47.52.95.224/upload/user/1078/4689f8c1-3a96-42bc-8dd2-e84d5181eb9f_%E4%BD%90%E8%97%A4%E7%9B%B4%E7%BA%AA%20(%E3%81%95%E3%81%A8%E3%81%86%20%E3%81%AA%E3%81%8A%E3%81%8D)%20-%20Ryomaden%20%5Bmqms%5D.mp3\" loop=\"loop\" controls=\"controls\"></audio>&nbsp;', '1078', '2018-08-01 12:49:37', '0', '0');
INSERT INTO `mypage` VALUES ('1185', '大师傅似的大师傅士大夫士大夫士大夫大师傅大师傅手动阀手动阀手', '2018-08-01 13:12:18', '&nbsp;<audio src=\"http://www.fishcc.org/upload/user/1078/4689f8c1-3a96-42bc-8dd2-e84d5181eb9f_%E4%BD%90%E8%97%A4%E7%9B%B4%E7%BA%AA%20(%E3%81%95%E3%81%A8%E3%81%86%20%E3%81%AA%E3%81%8A%E3%81%8D)%20-%20Ryomaden%20%5Bmqms%5D.mp3\" controls=\"controls\" loop=\"loop\"></audio>&nbsp;\r<br>			', '1078', '2018-08-01 13:12:18', '0', '0');
INSERT INTO `mypage` VALUES ('1193', '发射点发射点', '2018-08-01 13:25:21', '&lt;a href=\"\"&gt;123&lt;/a&gt;', '1078', '2018-08-22 14:25:03', '1', '0');
INSERT INTO `mypage` VALUES ('1196', '发射点发射点', '2018-08-01 13:44:10', '<br>', '1078', '2018-08-22 15:56:53', '4', '0');
INSERT INTO `mypage` VALUES ('1197', '发射点发射点', '2018-08-01 14:06:18', 'g', '1078', '2018-08-24 13:41:30', '46', '0');
INSERT INTO `mypage` VALUES ('1198', '发射点发射点', '2018-08-01 14:21:54', 'fff', '1078', '2018-08-23 18:46:06', '16', '0');
INSERT INTO `mypage` VALUES ('1200', '的说法是', '2018-08-02 12:27:53', '\r<br>			<audio src=\"sys/pic/emoji/i_f/i_f02.png\" loop=\"loop\" controls=\"controls\"></audio>', '1078', '2018-08-22 15:56:55', '1', '0');
INSERT INTO `mypage` VALUES ('1202', '＜%out.print(\"＜td>\"+ \"--------\" + \"＜/td>\");%>', '2018-08-24 13:22:30', '地方撒', '1078', '2018-08-24 13:24:40', '4', '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(1) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  `sex` int(1) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `invalid` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1085 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1000', '', '1234', '2018-02-22', '1', '2018-05-21 20:50:07', '0');
INSERT INTO `user` VALUES ('1037', '的', 'hong123', '1992-11-26', '0', '2018-05-21 21:39:16', '0');
INSERT INTO `user` VALUES ('1039', '时代的', '1234', '0000-00-00', null, '2018-05-22 15:39:53', '0');
INSERT INTO `user` VALUES ('1040', '时代的', '1234', '0000-00-00', null, '2018-05-24 17:36:14', '0');
INSERT INTO `user` VALUES ('1041', '张航', '1234', '0000-00-00', null, '2018-05-22 15:43:37', '0');
INSERT INTO `user` VALUES ('1042', '李李', 'li123', '0000-00-00', null, '2018-05-22 16:08:52', '0');
INSERT INTO `user` VALUES ('1043', '的方式', '123', '0000-00-00', null, '2018-05-22 16:18:34', '0');
INSERT INTO `user` VALUES ('1045', '是否', 'sdf', null, null, '2018-05-22 16:27:42', '0');
INSERT INTO `user` VALUES ('1046', '的说法', '123', '0000-00-00', '1', '2018-05-22 17:21:17', '0');
INSERT INTO `user` VALUES ('1047', 'fdsf', 'dfsf', '0000-00-00', null, '2018-05-22 17:27:02', '0');
INSERT INTO `user` VALUES ('1048', 'sdf', 'dsfs', null, null, '2018-05-22 17:27:36', '0');
INSERT INTO `user` VALUES ('1049', 'dsf', 'fds', null, null, '2018-05-22 17:29:09', '0');
INSERT INTO `user` VALUES ('1050', 'f', 'f', null, null, '2018-05-22 17:31:16', '0');
INSERT INTO `user` VALUES ('1051', 'sd', 'sda', null, '2', '2018-05-22 17:34:13', '0');
INSERT INTO `user` VALUES ('1052', 'sd', 'sfs', null, '0', '2018-05-22 17:34:54', '0');
INSERT INTO `user` VALUES ('1053', '是否', '123', null, '2', '2018-05-24 09:40:32', '0');
INSERT INTO `user` VALUES ('1054', '是否', '123', null, '2', '2018-05-24 09:41:10', '0');
INSERT INTO `user` VALUES ('1055', '11111', '11111', null, '1', '2018-05-24 09:43:11', '0');
INSERT INTO `user` VALUES ('1056', '1', '1', null, '2', '2018-05-24 10:43:42', '0');
INSERT INTO `user` VALUES ('1057', '士大夫', '123', null, '2', '2018-05-24 14:38:24', '0');
INSERT INTO `user` VALUES ('1058', '233', '233', null, '2', '2018-05-24 16:58:55', '0');
INSERT INTO `user` VALUES ('1059', 'qqq', 'qqq', null, '2', '2018-05-25 10:26:04', '0');
INSERT INTO `user` VALUES ('1060', 'q', 'q', '1111-11-11', '2', '2018-05-25 10:46:30', '0');
INSERT INTO `user` VALUES ('1061', '1', '1', '1111-11-11', '2', '2018-05-25 10:49:44', '0');
INSERT INTO `user` VALUES ('1062', '1', '1', '1111-11-11', '2', '2018-05-25 10:50:39', '0');
INSERT INTO `user` VALUES ('1063', '1', '1', '2018-08-23', '2', '2018-05-25 11:40:39', '0');
INSERT INTO `user` VALUES ('1064', '1', '1', null, '2', '2018-05-25 11:51:29', '0');
INSERT INTO `user` VALUES ('1065', '1', '1', '1111-11-11', '2', '2018-05-25 14:10:10', '0');
INSERT INTO `user` VALUES ('1066', '1', '1', null, '2', '2018-05-25 14:10:38', '0');
INSERT INTO `user` VALUES ('1067', '2', '2', '2222-11-11', '1', '2018-05-25 14:21:41', '0');
INSERT INTO `user` VALUES ('1068', '的方法是', '123', '1992-12-31', '1', '2018-05-28 15:44:54', '0');
INSERT INTO `user` VALUES ('1069', '双方的', '123', null, '2', '2018-05-28 17:39:51', '0');
INSERT INTO `user` VALUES ('1070', '士大夫', '123', '1992-11-26', '2', '2018-05-29 11:27:26', '0');
INSERT INTO `user` VALUES ('1071', '2', '2', null, '2', '2018-05-29 14:43:02', '0');
INSERT INTO `user` VALUES ('1072', 'qyq', '123', null, '2', '2018-06-05 12:12:37', '0');
INSERT INTO `user` VALUES ('1073', 'qyq', '123', null, '1', '2018-06-05 12:50:42', '0');
INSERT INTO `user` VALUES ('1074', 'qyq', '123', null, '2', '2018-06-05 13:08:47', '0');
INSERT INTO `user` VALUES ('1075', 'qyq', '123', null, '2', '2018-06-06 17:24:03', '0');
INSERT INTO `user` VALUES ('1076', '电话卡', '202cb962ac59075b964b07152d234b70', '2018-08-08', '0', '2018-06-16 17:13:37', '0');
INSERT INTO `user` VALUES ('1077', '哈哈', '202cb962ac59075b964b07152d234b70', null, '2', '2018-06-16 19:48:33', '0');
INSERT INTO `user` VALUES ('1078', '音乐', '202cb962ac59075b964b07152d234b70', '2008-11-22', '2', '2018-06-16 20:59:04', '0');
INSERT INTO `user` VALUES ('1079', '4566', '202cb962ac59075b964b07152d234b70', null, '2', '2018-06-16 21:00:48', '0');
INSERT INTO `user` VALUES ('1080', '音乐播', '202cb962ac59075b964b07152d234b70', null, '2', '2018-06-16 21:01:27', '0');
INSERT INTO `user` VALUES ('1081', '都是间', 'd9b1d7db4cd6e70935368a1efb10e377', null, '2', '2018-06-17 00:59:30', '0');
INSERT INTO `user` VALUES ('1082', '十分', '202cb962ac59075b964b07152d234b70', null, '2', '2018-07-10 14:59:24', '0');
INSERT INTO `user` VALUES ('1083', '音乐播放器', '202cb962ac59075b964b07152d234b70', null, '2', '2018-08-22 17:00:38', '0');
INSERT INTO `user` VALUES ('1084', '音乐播放器', '202cb962ac59075b964b07152d234b70', null, '2', '2018-08-22 17:00:56', '0');
