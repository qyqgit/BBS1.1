/*
Navicat MySQL Data Transfer

Source Server         : test1
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : temp

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-07-10 13:40:26
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=2523 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------

-- ----------------------------
-- Table structure for `media`
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media` (
  `id` int(1) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `userId` int(1) unsigned zerofill NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `type` int(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `userId` (`userId`),
  CONSTRAINT `media_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1077 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES ('1048', '1078', '9ff6991a5839a413b1ac40a532ab42c1_r.jpg', 'http://localhost:8080/Test1/upload/user/1078/e4685ed2-23cc-4396-86eb-96e84a3c3b49_9ff6991a5839a413b1ac40a532ab42c1_r.jpg', '0', '2018-06-20 12:04:48');
INSERT INTO `media` VALUES ('1053', '1078', '9ff6991a5839a413b1ac40a532ab42c1_r.jpg', 'http://localhost:8080/Test1/upload/user/1078/f6601eda-c235-4d9c-a396-aa15b5f08def_9ff6991a5839a413b1ac40a532ab42c1_r.jpg', '0', '2018-06-20 12:07:30');
INSERT INTO `media` VALUES ('1061', '1078', '272775451.jpg', 'http://localhost:8080/Test1/upload/user/1078/328dd806-8593-428a-a622-f158ce6ba618_272775451.jpg', '0', '2018-06-20 12:19:13');
INSERT INTO `media` VALUES ('1062', '1078', '9ff6991a5839a413b1ac40a532ab42c1_r.jpg', 'http://localhost:8080/Test1/upload/user/1078/5b5d5e7f-eb35-4b81-82e0-4eb5a7023234_9ff6991a5839a413b1ac40a532ab42c1_r.jpg', '0', '2018-06-20 13:23:50');
INSERT INTO `media` VALUES ('1063', '1078', '272775451.jpg', 'http://localhost:8080/Test1/upload/user/1078/43a6cb14-2858-4d8f-97d0-323c43837c2c_272775451.jpg', '0', '2018-06-20 13:25:42');
INSERT INTO `media` VALUES ('1064', '1078', '02ab4db185c92cc40a4f37b85a86af37_b.jpg', 'http://localhost:8080/Test1/upload/user/1078/8c0fefaa-85c1-4f8e-8d27-4cb6a05beafd_02ab4db185c92cc40a4f37b85a86af37_b.jpg', '0', '2018-06-20 13:26:28');
INSERT INTO `media` VALUES ('1065', '1078', '02ab4db185c92cc40a4f37b85a86af37_b.jpg', 'http://localhost:8080/Test1/upload/user/1078/b76ac5ac-2f77-4996-bb6b-74870e94b6bf_02ab4db185c92cc40a4f37b85a86af37_b.jpg', '0', '2018-06-21 10:54:54');
INSERT INTO `media` VALUES ('1070', '1078', 'RedEaredSlider05.jpg', 'http://localhost:8080/Test1/upload/user/1078/41a14402-0ae2-4a31-92af-106ed66b6503_RedEaredSlider05.jpg', '0', '2018-06-21 11:10:04');
INSERT INTO `media` VALUES ('1071', '1078', '695848da-aea6-41f0-92e5-a1a2592f8575_E52BDAD8-7637-43C1-88EE-D8FE0E6A0227.MOV', 'http://119.3.31.209:8080/BBS1.1/upload/user/1078/2f59dca2-aff8-4ca2-b952-0086b62fb60c_695848da-aea6-41f0-92e5-a1a2592f8575_E52BDAD8-7637-43C1-88EE-D8FE0E6A0227.MOV', '0', '2018-07-04 14:35:49');
INSERT INTO `media` VALUES ('1072', '1078', 'cm', 'http://119.3.31.209:8080/BBS1.1/upload/user/1078/065b664d-3e48-43a6-a78e-12d2411b6951_cm', '0', '2018-07-04 19:04:55');
INSERT INTO `media` VALUES ('1073', '1078', 'cm', 'http://119.3.31.209:8080/BBS1.1/upload/user/1078/3f8344e8-dbe6-41f6-a991-a3cda8f5f82d_cm', '0', '2018-07-04 19:08:13');
INSERT INTO `media` VALUES ('1074', '1078', 'cm', 'http://119.3.31.209:8080/BBS1.1/upload/user/1078/9eda4454-80c4-4815-9353-f468dfa5068c_cm', '0', '2018-07-04 19:08:45');
INSERT INTO `media` VALUES ('1075', '1078', 'cm', 'http://119.3.31.209:8080/BBS1.1/upload/user/1078/9835670c-f5e7-467e-b8de-d229231d2786_cm', '0', '2018-07-04 19:12:07');
INSERT INTO `media` VALUES ('1076', '1078', 'cm', 'http://119.3.31.209/upload/user/1078/4db925b7-d873-4eee-9559-f03e69c40190_cm', '0', '2018-07-04 19:16:58');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(1) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `replyId` int(1) unsigned zerofill DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userId` int(1) unsigned zerofill NOT NULL,
  `text` varchar(767) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pageId` int(1) unsigned zerofill NOT NULL,
  `floorNumber` int(1) NOT NULL,
  `haveRead` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  KEY `pageId` (`pageId`) USING BTREE,
  KEY `replyId` (`replyId`),
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`pageId`) REFERENCES `mypage` (`id`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`),
  CONSTRAINT `message_ibfk_3` FOREIGN KEY (`replyId`) REFERENCES `message` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('8', null, '2018-07-10 13:31:53', '1078', '十分士大夫', '1128', '1', '0');
INSERT INTO `message` VALUES ('9', '8', '2018-07-10 13:32:34', '1078', '<a href=\'MyPageSvl?id=1128&pageNumber=1&pageLength=30#1\' >Reply</a> 1:\r<br>是否', '1128', '2', '0');

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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  CONSTRAINT `mypage_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1129 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mypage
-- ----------------------------
INSERT INTO `mypage` VALUES ('1042', '这是第一条帖子', '2018-05-24 17:44:43', '这是第一条帖子的第一楼', '1000', '2018-07-09 14:37:02', '61');
INSERT INTO `mypage` VALUES ('1043', '这是第二条帖子', '2018-05-24 17:44:43', '这是第零楼', '1000', '2018-05-21 20:54:14', '3');
INSERT INTO `mypage` VALUES ('1046', '发个大概豆腐干地方', '2018-05-24 17:44:43', '发嘀咕嘀咕的风格的', '1000', '2018-05-21 21:02:34', '0');
INSERT INTO `mypage` VALUES ('1047', '梵蒂冈梵蒂冈地方官', '2018-05-24 17:44:43', '广泛大概豆腐干豆腐干', '1000', '2018-05-21 21:02:04', '0');
INSERT INTO `mypage` VALUES ('1048', '感豆腐干豆腐干', '2018-05-24 17:44:43', '敢反对鬼地方', '1000', '2018-05-21 21:03:49', '1');
INSERT INTO `mypage` VALUES ('1050', '感豆腐干大概豆腐干豆腐干', '2018-05-24 17:44:43', '高浮雕', '1000', '2018-05-21 21:40:04', '4');
INSERT INTO `mypage` VALUES ('1051', '要睡觉了', '2018-05-24 17:44:43', '你呢', '1000', '2018-05-21 21:39:39', '5');
INSERT INTO `mypage` VALUES ('1052', '明天有人一起去爬山吗？', '2018-05-24 17:44:43', '自行车去', '1037', '2018-05-21 21:52:38', '2');
INSERT INTO `mypage` VALUES ('1053', '这是第三条帖子', '2018-05-24 17:44:43', '哈哈哈哈哈', '1000', '2018-05-25 14:13:08', '4');
INSERT INTO `mypage` VALUES ('1054', '招租啦招租啦', '2018-05-24 17:44:43', '有人租房子吗', '1000', '2018-05-21 22:07:36', '3');
INSERT INTO `mypage` VALUES ('1055', '地方烦烦烦烦烦烦烦烦烦', '2018-05-24 17:44:43', '的烦烦烦烦烦烦烦烦烦v', '1000', '2018-05-21 22:31:50', '0');
INSERT INTO `mypage` VALUES ('1058', '对方身份的', '2018-05-24 17:44:43', '电风扇电风扇', '1000', '2018-05-22 18:09:00', '2');
INSERT INTO `mypage` VALUES ('1059', '发生范德萨', '2018-05-24 17:44:43', '十分士大夫', '1000', '2018-05-25 14:21:53', '5');
INSERT INTO `mypage` VALUES ('1060', '胜多负少', '2018-05-24 17:44:43', '房贷首付', '1000', '2018-05-22 18:29:54', '1');
INSERT INTO `mypage` VALUES ('1061', '断指积极', '2018-05-24 17:44:43', '的方式', '1000', '2018-05-23 14:25:56', '5');
INSERT INTO `mypage` VALUES ('1062', '房贷首付', '2018-05-24 17:44:43', '发士大夫', '1000', '2018-05-24 14:38:44', '5');
INSERT INTO `mypage` VALUES ('1063', '地方', '2018-05-24 17:44:43', '的说法是1234433', '1000', '2018-05-24 17:39:43', '1');
INSERT INTO `mypage` VALUES ('1064', '反倒是', '2018-05-24 17:46:39', '的说法的方式', '1000', '2018-05-24 18:02:32', '1');
INSERT INTO `mypage` VALUES ('1065', '的说法大师傅似的', '2018-05-24 18:04:18', '反倒是', '1000', '2018-05-24 18:20:42', '5');
INSERT INTO `mypage` VALUES ('1066', '士大夫十分', '2018-05-24 18:18:41', '大师傅似的', '1000', '2018-05-29 15:44:58', '3');
INSERT INTO `mypage` VALUES ('1067', '1', '2018-05-25 14:10:49', '1', '1066', '2018-05-28 17:46:29', '3');
INSERT INTO `mypage` VALUES ('1068', 'SMBUS的介绍与访问', '2018-05-25 14:22:52', '对方身上的', '1000', '2018-05-25 14:23:20', '1');
INSERT INTO `mypage` VALUES ('1069', 'BIOS/UEFI基础——Device Path', '2018-05-25 14:23:10', '发士大夫', '1000', '2018-05-25 14:23:10', '0');
INSERT INTO `mypage` VALUES ('1070', '在eclipse中为编译器指定自己特殊的编译方式', '2018-05-25 14:23:54', '第三方的', '1000', '2018-05-29 15:27:10', '4');
INSERT INTO `mypage` VALUES ('1071', '士大夫十分发达是否', '2018-05-28 17:39:24', '大师傅大师傅', '1000', '2018-05-28 17:39:30', '1');
INSERT INTO `mypage` VALUES ('1072', '法大师傅士大夫', '2018-05-28 17:47:21', '法大师傅大师傅', '1057', '2018-06-05 10:22:22', '21');
INSERT INTO `mypage` VALUES ('1073', '今天星期几？', '2018-05-29 11:29:33', '今天星期2', '1070', '2018-05-29 14:06:30', '4');
INSERT INTO `mypage` VALUES ('1074', '符合规范规划', '2018-05-29 11:32:25', '梵蒂冈地方官', '1070', '2018-05-29 11:32:33', '1');
INSERT INTO `mypage` VALUES ('1075', '大师傅士大夫', '2018-05-29 11:33:09', '的说法是', '1070', '2018-05-29 14:07:28', '3');
INSERT INTO `mypage` VALUES ('1076', '用好你的内存之SPD', '2018-05-29 14:57:11', '客户如果客家话', '1070', '2018-05-29 15:27:11', '3');
INSERT INTO `mypage` VALUES ('1077', '明天有人去钓鱼吗？', '2018-05-29 15:56:01', '地点在这里', '1070', '2018-05-29 16:01:09', '6');
INSERT INTO `mypage` VALUES ('1078', '落款时间分厘卡的骄傲垃圾垃圾觉得分开了', '2018-05-29 16:04:45', '但是没有是灯笼裤飞机啊是垃圾flask解放拉萨啊垃圾垃圾发觉', '1000', '2018-05-29 16:13:25', '4');
INSERT INTO `mypage` VALUES ('1079', '<a href=\"Home?id=1000\">秦亚祺</a>', '2018-05-29 16:14:42', '<a href=\"Home?id=1000\">秦亚祺</a>', '1000', '2018-05-29 16:16:42', '2');
INSERT INTO `mypage` VALUES ('1080', '很快客家话艰苦', '2018-05-29 16:15:19', '<a href=\"Home?id=1000\">亚祺</a>', '1000', '2018-05-29 16:15:19', '0');
INSERT INTO `mypage` VALUES ('1081', '<a href=\"Home?id=1000\">秦亚祺</a>', '2018-05-29 16:17:07', '<a href=\"Home?id=1000\">秦亚祺</a>', '1000', '2018-05-29 16:18:46', '3');
INSERT INTO `mypage` VALUES ('1082', '    ', '2018-05-29 16:19:01', '    \r\n<a href=\"Home?id=1000\">秦亚祺</a> \r\n', '1000', '2018-05-29 16:19:01', '0');
INSERT INTO `mypage` VALUES ('1083', ' ', '2018-05-29 16:19:12', ' ', '1000', '2018-05-29 16:19:12', '0');
INSERT INTO `mypage` VALUES ('1084', '<a href=\"Home?id=1000\">秦亚祺</a> ', '2018-05-29 16:19:45', '<a href=\"Home?id=1000\">秦亚祺</a> \r\n', '1000', '2018-05-29 16:19:50', '1');
INSERT INTO `mypage` VALUES ('1085', '发射点发射点', '2018-05-29 16:27:06', '<%out.println(\"ddddd\");%>', '1070', '2018-05-29 16:27:37', '1');
INSERT INTO `mypage` VALUES ('1086', '123', '2018-05-29 16:28:19', '<%out.print(\"<td>\"+ \"--------\" + \"</td>\");%>', '1070', '2018-06-21 14:28:02', '0');
INSERT INTO `mypage` VALUES ('1087', '的撒旦发', '2018-05-29 16:29:12', '<%out.print(\"--------\");%>', '1070', '2018-05-29 16:34:00', '1');
INSERT INTO `mypage` VALUES ('1088', '<a href=\"Home?id=1000\">123</a>', '2018-05-29 16:34:19', '<a href=\"Home?id=1000\">123</a>', '1000', '2018-06-16 20:30:12', '6');
INSERT INTO `mypage` VALUES ('1089', '豆腐干豆腐干', '2018-05-29 16:40:33', '<script type=\"text/javascript\">\r\n\r\n	  window.location.href=\"index\";\r\n\r\n</script>', '1000', '2018-05-29 16:40:33', '0');
INSERT INTO `mypage` VALUES ('1090', '百度', '2018-05-29 16:42:24', '<script type=\"text/javascript\">\r\n  window.location.href=\"www.baidu.com\";\r\n</script>', '1000', '2018-05-29 16:42:24', '0');
INSERT INTO `mypage` VALUES ('1091', '百度', '2018-05-29 16:43:31', '<script type=\"text/javascript\">\r\n  window.location.href=\"http://www.baidu.com\";\r\n</script>', '1000', '2018-05-29 16:43:31', '0');
INSERT INTO `mypage` VALUES ('1092', 'win32下 如何定位内存泄漏', '2018-05-29 17:03:47', '广东', '1070', '2018-05-29 17:03:47', '0');
INSERT INTO `mypage` VALUES ('1093', 'win32下 如何定位内存泄漏', '2018-05-29 17:04:10', '<% \r\n\r\n		out.println(\"</table>\");\r\n		out.println(\"<br>\");\r\n		%>', '1070', '2018-05-29 17:04:10', '0');
INSERT INTO `mypage` VALUES ('1094', 'win32下 如何定位内存泄漏', '2018-05-29 17:04:24', '  给v不错v吧', '1070', '2018-06-04 14:42:44', '2');
INSERT INTO `mypage` VALUES ('1095', 'win32下 如何定位内存泄漏', '2018-05-29 17:04:41', '\r\n会更加', '1070', '2018-05-29 17:04:41', '0');
INSERT INTO `mypage` VALUES ('1096', '  好几个 ', '2018-05-29 17:04:56', '会更加', '1070', '2018-05-29 17:04:56', '0');
INSERT INTO `mypage` VALUES ('1097', '风格豆腐干', '2018-05-29 17:36:03', '广泛大概豆腐干', '1000', '2018-05-29 17:36:10', '1');
INSERT INTO `mypage` VALUES ('1098', '顶楼上看风景圣诞快乐房价失控的来访接', '2018-05-29 17:51:51', '的方式方式方法烦烦烦烦烦烦烦烦烦烦烦烦', '1000', '2018-05-29 17:51:51', '0');
INSERT INTO `mypage` VALUES ('1099', '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '2018-05-29 17:54:06', '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '1000', '2018-06-04 14:42:36', '2');
INSERT INTO `mypage` VALUES ('1100', '**', '2018-05-30 10:16:06', '**', '1000', '2018-05-30 10:16:42', '1');
INSERT INTO `mypage` VALUES ('1101', '<>', '2018-05-30 10:17:48', '<>', '1000', '2018-05-30 10:21:03', '3');
INSERT INTO `mypage` VALUES ('1102', '百度', '2018-05-30 10:18:58', '<script type=\"text/javascript\">\r\nwindow.location.href=\"http://www.baidu.com\";\r\n</script>', '1000', '2018-05-30 10:18:58', '0');
INSERT INTO `mypage` VALUES ('1103', '百度', '2018-05-30 10:21:19', '**script type=\"text/javascript\">\r\n  window.location.href=\"http://www.baidu.com\";\r\n**/script>', '1000', '2018-05-31 15:35:44', '3');
INSERT INTO `mypage` VALUES ('1104', '百度', '2018-05-30 10:39:12', '＜script type=\"text/javascript\">\r\n  window.location.href=\"http://www.baidu.com\";\r\n＜/script>', '1000', '2018-05-30 10:52:03', '4');
INSERT INTO `mypage` VALUES ('1105', '发射点发射点', '2018-06-04 12:46:04', '的发射点发射点', '1000', '2018-06-04 12:46:04', '0');
INSERT INTO `mypage` VALUES ('1106', '的方式发送到', '2018-06-04 12:46:12', '大师傅大师傅', '1000', '2018-06-05 14:19:15', '11');
INSERT INTO `mypage` VALUES ('1107', '撒旦范德萨范德萨发', '2018-06-04 12:46:24', '大师傅大师傅但是', '1000', '2018-06-04 12:46:24', '0');
INSERT INTO `mypage` VALUES ('1108', '色发射点发射点犯得上', '2018-06-04 14:37:39', '但是发射点发射点发射点发射点', '1000', '2018-06-04 14:37:43', '1');
INSERT INTO `mypage` VALUES ('1109', '＜a href=＂Home?id=1000＂＞秦亚祺＜/a＞', '2018-06-04 14:45:37', '＜a href=＂Home?id=1000＂＞秦亚祺＜/a＞', '1000', '2018-06-18 18:08:34', '2');
INSERT INTO `mypage` VALUES ('1110', '[32位移植到64]_[C/C++代码嵌入汇编代码移植篇]', '2018-06-05 10:23:07', '大商股份赶得上赶得上告诉对方', '1070', '2018-06-05 10:23:07', '0');
INSERT INTO `mypage` VALUES ('1111', '六点开饭时间了迪斯科解放了', '2018-06-16 18:04:32', '壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。\r\n于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。\r\n', '1076', '2018-06-16 18:05:45', '5');
INSERT INTO `mypage` VALUES ('1112', '发射点发射点', '2018-06-16 18:06:19', '大师傅士大夫', '1076', '2018-06-18 22:47:48', '26');
INSERT INTO `mypage` VALUES ('1113', '的旅客谨防垃圾分类大家分厘卡机手法来似的', '2018-06-16 18:24:50', '接口逻辑啊蓝山咖啡奖励开始放假了肯德基', '1076', '2018-06-16 18:25:15', '1');
INSERT INTO `mypage` VALUES ('1114', '两点开始减肥来看大家分厘卡电视机分厘卡分', '2018-06-16 19:48:57', '壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。 于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。离开戒毒所分厘卡时间电风扇', '1077', '2018-07-09 14:30:05', '5');
INSERT INTO `mypage` VALUES ('1115', '是先嗯哼', '2018-06-16 21:02:13', '岜那那睡女女', '1080', '2018-06-18 13:08:42', '22');
INSERT INTO `mypage` VALUES ('1116', '&nbsp壬戌之秋，游于赤', '2018-06-18 18:04:39', '\r<br>壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。&nbsp\r<br>＜br＞&nbsp\r<br>＜br＞于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。&nbsp\r<br>＜br＞&nbsp\r<br>＜br＞苏子愀然，正襟危坐而问客曰：“何为其然也？”客曰：“月明星稀，乌鹊南飞，此非曹孟德之诗乎？西望夏口，东望武昌，山川相缪，郁乎苍苍，此非孟德之困于周郎者乎？方其破荆州，下江陵，顺流而东也，舳舻千里，旌旗蔽空，酾酒临江，横槊赋诗，固一世之雄也，而今安在哉？况吾与子渔樵于江渚之上，侣鱼虾而友麋鹿，驾一叶之扁舟，举匏樽以相属。寄蜉蝣于天地，渺沧海之一粟。哀吾生之须臾，羡长江之无穷。挟飞仙以遨游，抱明月而长终。知不可乎骤得，托遗响于悲风。”&nbsp\r<br>＜br＞&nbsp\r<br>＜br＞苏子曰：“客亦知夫水与月乎？逝者如斯，而未尝往也；盈虚者莫消长。盖将', '1078', '2018-06-18 18:04:39', '0');
INSERT INTO `mypage` VALUES ('1117', '&nbsp&nbsp&nbsp', '2018-06-18 18:04:53', '&nbsp&nbsp&nbsp', '1078', '2018-06-18 18:04:53', '0');
INSERT INTO `mypage` VALUES ('1118', '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp1', '2018-06-18 18:08:09', '都是防辐射地方escapeXml=＂false＂', '1078', '2018-06-18 18:09:21', '1');
INSERT INTO `mypage` VALUES ('1119', '＜a&nbsphref=＂Home?id=100', '2018-06-18 18:09:31', '＜a&nbsphref=＂Home?id=1000＂＞秦亚祺＜/a＞', '1078', '2018-06-18 18:09:31', '0');
INSERT INTO `mypage` VALUES ('1120', '＜a&nbsphref=＂Home?id=1000＂＞秦亚祺＜/a＞', '2018-06-18 18:11:42', '＜a&nbsphref=＂Home?id=1000＂＞秦亚祺＜/a＞', '1078', '2018-06-18 18:11:42', '0');
INSERT INTO `mypage` VALUES ('1121', 'what\'s&nbspyou&nbspname?', '2018-06-18 18:13:00', '1', '1078', '2018-06-19 16:45:26', '4');
INSERT INTO `mypage` VALUES ('1122', 'what\'s&nbspyou&nbspname?', '2018-06-18 18:13:22', 'sdf', '1078', '2018-06-18 18:35:25', '3');
INSERT INTO `mypage` VALUES ('1123', 'what\'s&nbspyou&nbspname?', '2018-06-18 23:33:17', '/upload/picture/user/1078/8ccc5b06-e988-45fa-9678-95a839cdcdbf_吉田洁&nbsp日本人的遥远旅途&nbsp旅程的终结.mp3<audio src=\"/upload/picture/user/1078/8ccc5b06-e988-45fa-9678-95a839cdcdbf_吉田洁&nbsp日本人的遥远旅途&nbsp旅程的终结.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1078', '2018-06-19 14:35:44', '15');
INSERT INTO `mypage` VALUES ('1124', 'win32下&nbsp如何定位内存泄漏', '2018-06-19 16:48:48', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1121＆pageNumber=1＆pageLength=30\"><img src=\"http://localhost:8080/Test1/MyPageSvl?id=1121＆pageNumber=1＆pageLength=30\" style=\"max-width:800px\"/></a>', '1078', '2018-07-05 14:21:23', '1');
INSERT INTO `mypage` VALUES ('1125', 'win32下&nbsp如何定位内存泄漏', '2018-06-19 16:49:54', '<a href=\"http://localhost:8080/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg\"><img src=\"http://localhost:8080/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg\" style=\"max-width:800px\"/></a>', '1078', '2018-06-21 11:16:50', '8');
INSERT INTO `mypage` VALUES ('1126', '＜%out.print(＂＜td＞＂+&nbsp', '2018-06-21 14:27:39', '＜%out.print(＂＜td＞＂+&nbsp＂--------＂&nbsp+&nbsp＂＜/td＞＂);%＞', '1078', '2018-06-21 14:27:39', '0');
INSERT INTO `mypage` VALUES ('1127', 'win32下&nbsp如何定位内存泄漏', '2018-07-10 11:47:14', '的方式', '1078', '2018-07-10 13:30:04', '4');
INSERT INTO `mypage` VALUES ('1128', '胜多负少打发士大夫的打法', '2018-07-10 13:31:48', '撒旦发射点发射点', '1078', '2018-07-10 13:32:34', '2');

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
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1082 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1000', '秦亚祺', '1234', '2018-02-22', '1', '2018-05-21 20:50:07');
INSERT INTO `user` VALUES ('1037', '小红', 'hong123', '1992-11-26', '0', '2018-05-21 21:39:16');
INSERT INTO `user` VALUES ('1039', '时代的', '1234', '0000-00-00', null, '2018-05-22 15:39:53');
INSERT INTO `user` VALUES ('1040', '时代的', '1234', '0000-00-00', null, '2018-05-24 17:36:14');
INSERT INTO `user` VALUES ('1041', '张航', '1234', '0000-00-00', null, '2018-05-22 15:43:37');
INSERT INTO `user` VALUES ('1042', '李李', 'li123', '0000-00-00', null, '2018-05-22 16:08:52');
INSERT INTO `user` VALUES ('1043', '的方式', '123', '0000-00-00', null, '2018-05-22 16:18:34');
INSERT INTO `user` VALUES ('1045', '是否', 'sdf', null, null, '2018-05-22 16:27:42');
INSERT INTO `user` VALUES ('1046', '的说法', '123', '0000-00-00', '1', '2018-05-22 17:21:17');
INSERT INTO `user` VALUES ('1047', 'fdsf', 'dfsf', '0000-00-00', null, '2018-05-22 17:27:02');
INSERT INTO `user` VALUES ('1048', 'sdf', 'dsfs', null, null, '2018-05-22 17:27:36');
INSERT INTO `user` VALUES ('1049', 'dsf', 'fds', null, null, '2018-05-22 17:29:09');
INSERT INTO `user` VALUES ('1050', 'f', 'f', null, null, '2018-05-22 17:31:16');
INSERT INTO `user` VALUES ('1051', 'sd', 'sda', null, '2', '2018-05-22 17:34:13');
INSERT INTO `user` VALUES ('1052', 'sd', 'sfs', null, '0', '2018-05-22 17:34:54');
INSERT INTO `user` VALUES ('1053', '是否', '123', null, '2', '2018-05-24 09:40:32');
INSERT INTO `user` VALUES ('1054', '是否', '123', null, '2', '2018-05-24 09:41:10');
INSERT INTO `user` VALUES ('1055', '11111', '11111', null, '1', '2018-05-24 09:43:11');
INSERT INTO `user` VALUES ('1056', '1', '1', null, '2', '2018-05-24 10:43:42');
INSERT INTO `user` VALUES ('1057', '士大夫', '123', null, '2', '2018-05-24 14:38:24');
INSERT INTO `user` VALUES ('1058', '233', '233', null, '2', '2018-05-24 16:58:55');
INSERT INTO `user` VALUES ('1059', 'qqq', 'qqq', null, '2', '2018-05-25 10:26:04');
INSERT INTO `user` VALUES ('1060', 'q', 'q', '1111-11-11', '2', '2018-05-25 10:46:30');
INSERT INTO `user` VALUES ('1061', '1', '1', '1111-11-11', '2', '2018-05-25 10:49:44');
INSERT INTO `user` VALUES ('1062', '1', '1', '1111-11-11', '2', '2018-05-25 10:50:39');
INSERT INTO `user` VALUES ('1063', '1', '1', '2018-08-23', '2', '2018-05-25 11:40:39');
INSERT INTO `user` VALUES ('1064', '1', '1', null, '2', '2018-05-25 11:51:29');
INSERT INTO `user` VALUES ('1065', '1', '1', '1111-11-11', '2', '2018-05-25 14:10:10');
INSERT INTO `user` VALUES ('1066', '1', '1', null, '2', '2018-05-25 14:10:38');
INSERT INTO `user` VALUES ('1067', '2', '2', '2222-11-11', '1', '2018-05-25 14:21:41');
INSERT INTO `user` VALUES ('1068', '的方法是', '123', '1992-12-31', '1', '2018-05-28 15:44:54');
INSERT INTO `user` VALUES ('1069', '双方的', '123', null, '2', '2018-05-28 17:39:51');
INSERT INTO `user` VALUES ('1070', '螺丝钉解放拉萨', '123', '1992-11-26', '2', '2018-05-29 11:27:26');
INSERT INTO `user` VALUES ('1071', '2', '2', null, '2', '2018-05-29 14:43:02');
INSERT INTO `user` VALUES ('1072', 'qyq', '123', null, '2', '2018-06-05 12:12:37');
INSERT INTO `user` VALUES ('1073', 'qyq', '123', null, '1', '2018-06-05 12:50:42');
INSERT INTO `user` VALUES ('1074', 'qyq', '123', null, '2', '2018-06-05 13:08:47');
INSERT INTO `user` VALUES ('1075', 'qyq', '123', null, '2', '2018-06-06 17:24:03');
INSERT INTO `user` VALUES ('1076', '电话卡', '202cb962ac59075b964b07152d234b70', '2018-08-08', '0', '2018-06-16 17:13:37');
INSERT INTO `user` VALUES ('1077', '哈哈哈哈哈哈哈哈', '202cb962ac59075b964b07152d234b70', null, '2', '2018-06-16 19:48:33');
INSERT INTO `user` VALUES ('1078', '音乐播放器', '202cb962ac59075b964b07152d234b70', null, '2', '2018-06-16 20:59:04');
INSERT INTO `user` VALUES ('1079', '4566', '202cb962ac59075b964b07152d234b70', null, '2', '2018-06-16 21:00:48');
INSERT INTO `user` VALUES ('1080', '音乐播放器', '202cb962ac59075b964b07152d234b70', null, '2', '2018-06-16 21:01:27');
INSERT INTO `user` VALUES ('1081', '都是浪费空间', 'd9b1d7db4cd6e70935368a1efb10e377', null, '2', '2018-06-17 00:59:30');
