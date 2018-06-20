/*
Navicat MySQL Data Transfer

Source Server         : test1
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : temp

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2018-06-20 15:24:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for log
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
) ENGINE=InnoDB AUTO_INCREMENT=1158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log
-- ----------------------------
INSERT INTO `log` VALUES ('00000001000', '2018-06-20 14:55:05', '1', null, '1');
INSERT INTO `log` VALUES ('00000001001', '2018-06-20 14:55:13', '0:0:0:0:0:0:0:1', null, '/Test1/index');
INSERT INTO `log` VALUES ('00000001002', '2018-06-20 14:55:24', '0:0:0:0:0:0:0:1', null, '/Test1/Login.jsp');
INSERT INTO `log` VALUES ('00000001003', '2018-06-20 14:55:24', '0:0:0:0:0:0:0:1', null, '/Test1/GetPassCode.jpg');
INSERT INTO `log` VALUES ('00000001004', '2018-06-20 14:55:33', '0:0:0:0:0:0:0:1', null, '/Test1/login');
INSERT INTO `log` VALUES ('00000001005', '2018-06-20 14:55:33', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/index');
INSERT INTO `log` VALUES ('00000001006', '2018-06-20 14:56:15', '0:0:0:0:0:0:0:1', '00000001078', '/Test1/index');
INSERT INTO `log` VALUES ('00000001007', '2018-06-20 14:57:03', '172.21.1.148', null, '/Test1/');
INSERT INTO `log` VALUES ('00000001008', '2018-06-20 14:57:03', '172.21.1.148', null, '/Test1/');
INSERT INTO `log` VALUES ('00000001009', '2018-06-20 14:57:17', '172.21.1.148', null, '/Test1/MyPageSvl');
INSERT INTO `log` VALUES ('00000001010', '2018-06-20 14:57:34', '172.21.1.148', null, '/Test1/MyPageSvl');
INSERT INTO `log` VALUES ('00000001011', '2018-06-20 14:59:20', '172.21.1.148', null, '/Test1/');
INSERT INTO `log` VALUES ('00000001012', '2018-06-20 14:59:21', '172.21.1.148', null, '/Test1/');
INSERT INTO `log` VALUES ('00000001013', '2018-06-20 14:59:32', '172.21.1.148', null, '/Test1/');
INSERT INTO `log` VALUES ('00000001014', '2018-06-20 14:59:35', '172.21.1.148', null, '/Test1/MyPageSvl');
INSERT INTO `log` VALUES ('00000001015', '2018-06-20 14:59:38', '172.21.1.148', null, '/Test1/MyPageSvl');
INSERT INTO `log` VALUES ('00000001016', '2018-06-20 14:59:42', '172.21.1.148', null, '/Test1/MyPageSvl');
INSERT INTO `log` VALUES ('00000001017', '2018-06-20 15:05:47', '172.21.1.148', null, '/Test1/MyPageSvl');
INSERT INTO `log` VALUES ('00000001018', '2018-06-20 15:05:48', '172.21.1.148', null, '/Test1/MyPageSvl');
INSERT INTO `log` VALUES ('00000001019', '2018-06-20 15:06:16', '172.21.1.148', null, '/Test1/');
INSERT INTO `log` VALUES ('00000001020', '2018-06-20 15:06:18', '172.21.1.148', null, '/Test1/MyPageSvl');
INSERT INTO `log` VALUES ('00000001021', '2018-06-20 15:07:13', '172.21.1.148', null, '/Test1/MyPageSvl?id=1120&timeStamp=2018-06-18%2018:11:42');
INSERT INTO `log` VALUES ('00000001022', '2018-06-20 15:07:13', '172.21.1.148', null, '/Test1/MyPageSvl?id=1120&timeStamp=2018-06-18%2018:11:42');
INSERT INTO `log` VALUES ('00000001023', '2018-06-20 15:07:17', '172.21.1.148', null, '/Test1/MyPageSvl?id=1120&timeStamp=2018-06-18%2018:11:42');
INSERT INTO `log` VALUES ('00000001024', '2018-06-20 15:07:22', '172.21.1.148', null, '/Test1/?null');
INSERT INTO `log` VALUES ('00000001025', '2018-06-20 15:07:38', '172.21.1.148', null, '/Test1/?null');
INSERT INTO `log` VALUES ('00000001026', '2018-06-20 15:07:46', '172.21.1.148', null, '/Test1/MyPageSvl?id=1125&timeStamp=2018-06-19%2016:57:50');
INSERT INTO `log` VALUES ('00000001027', '2018-06-20 15:07:56', '172.21.1.148', null, '/Test1/?null');
INSERT INTO `log` VALUES ('00000001028', '2018-06-20 15:08:02', '172.21.1.148', null, '/Test1/MyPageSvl?id=1099&timeStamp=2018-06-04%2014:42:36');
INSERT INTO `log` VALUES ('00000001029', '2018-06-20 15:08:58', '172.21.1.148', null, '/Test1/?null');
INSERT INTO `log` VALUES ('00000001030', '2018-06-20 15:08:58', '172.21.1.148', null, '/Test1/?null');
INSERT INTO `log` VALUES ('00000001031', '2018-06-20 15:09:06', '172.21.1.148', null, '/Test1/?null');
INSERT INTO `log` VALUES ('00000001032', '2018-06-20 15:09:09', '172.21.1.148', null, '/Test1/?null');
INSERT INTO `log` VALUES ('00000001033', '2018-06-20 15:09:11', '172.21.1.148', null, '/Test1/MyPageSvl?id=1125&timeStamp=2018-06-19%2016:57:50');
INSERT INTO `log` VALUES ('00000001034', '2018-06-20 15:09:30', '0:0:0:0:0:0:0:1', null, '/Test1/index?null');
INSERT INTO `log` VALUES ('00000001035', '2018-06-20 15:09:30', '0:0:0:0:0:0:0:1', null, '/Test1/index?null');
INSERT INTO `log` VALUES ('00000001036', '2018-06-20 15:09:41', '0:0:0:0:0:0:0:1', null, '//Test1/MyPageSvl?id=1125&timeStamp=2018-06-19%2016:57:50');
INSERT INTO `log` VALUES ('00000001037', '2018-06-20 15:09:41', '0:0:0:0:0:0:0:1', null, '//Test1/MyPageSvl?id=1125&timeStamp=2018-06-19%2016:57:50');
INSERT INTO `log` VALUES ('00000001038', '2018-06-20 15:09:41', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/0fc71b3f-175a-4360-a7ba-5e9ece35730c_02ab4db185c92cc40a4f37b85a86af37_b.jpg?null');
INSERT INTO `log` VALUES ('00000001039', '2018-06-20 15:09:41', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg?null');
INSERT INTO `log` VALUES ('00000001040', '2018-06-20 15:09:41', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/66ab30ff-4229-412a-86a1-29b418aae676_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E%20%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3?null');
INSERT INTO `log` VALUES ('00000001041', '2018-06-20 15:10:35', '0:0:0:0:0:0:0:1', null, '//Test1/MyPageSvl?id=1125&timeStamp=2018-06-19%2016:57:50');
INSERT INTO `log` VALUES ('00000001042', '2018-06-20 15:10:35', '0:0:0:0:0:0:0:1', null, '//Test1/MyPageSvl?id=1125&timeStamp=2018-06-19%2016:57:50');
INSERT INTO `log` VALUES ('00000001043', '2018-06-20 15:10:35', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg?null');
INSERT INTO `log` VALUES ('00000001044', '2018-06-20 15:10:35', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/0fc71b3f-175a-4360-a7ba-5e9ece35730c_02ab4db185c92cc40a4f37b85a86af37_b.jpg?null');
INSERT INTO `log` VALUES ('00000001045', '2018-06-20 15:10:35', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/66ab30ff-4229-412a-86a1-29b418aae676_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E%20%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3?null');
INSERT INTO `log` VALUES ('00000001046', '2018-06-20 15:10:36', '0:0:0:0:0:0:0:1', null, '//Test1/MyPageSvl?id=1125&timeStamp=2018-06-19%2016:57:50');
INSERT INTO `log` VALUES ('00000001047', '2018-06-20 15:10:36', '0:0:0:0:0:0:0:1', null, '//Test1/MyPageSvl?id=1125&timeStamp=2018-06-19%2016:57:50');
INSERT INTO `log` VALUES ('00000001048', '2018-06-20 15:10:36', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/0fc71b3f-175a-4360-a7ba-5e9ece35730c_02ab4db185c92cc40a4f37b85a86af37_b.jpg?null');
INSERT INTO `log` VALUES ('00000001049', '2018-06-20 15:10:36', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg?null');
INSERT INTO `log` VALUES ('00000001050', '2018-06-20 15:10:36', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/66ab30ff-4229-412a-86a1-29b418aae676_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E%20%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3?null');
INSERT INTO `log` VALUES ('00000001051', '2018-06-20 15:10:37', '0:0:0:0:0:0:0:1', null, '//Test1/MyPageSvl?id=1125&timeStamp=2018-06-19%2016:57:50');
INSERT INTO `log` VALUES ('00000001052', '2018-06-20 15:10:37', '0:0:0:0:0:0:0:1', null, '//Test1/MyPageSvl?id=1125&timeStamp=2018-06-19%2016:57:50');
INSERT INTO `log` VALUES ('00000001053', '2018-06-20 15:10:37', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/0fc71b3f-175a-4360-a7ba-5e9ece35730c_02ab4db185c92cc40a4f37b85a86af37_b.jpg?null');
INSERT INTO `log` VALUES ('00000001054', '2018-06-20 15:10:37', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/66ab30ff-4229-412a-86a1-29b418aae676_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E%20%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3?null');
INSERT INTO `log` VALUES ('00000001055', '2018-06-20 15:10:37', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg?null');
INSERT INTO `log` VALUES ('00000001056', '2018-06-20 15:10:39', '0:0:0:0:0:0:0:1', null, '//Test1/index?null');
INSERT INTO `log` VALUES ('00000001057', '2018-06-20 15:10:39', '0:0:0:0:0:0:0:1', null, '//Test1/index?null');
INSERT INTO `log` VALUES ('00000001058', '2018-06-20 15:10:41', '0:0:0:0:0:0:0:1', null, '//Test1/MyPageSvl;jsessionid=BD686394194F5DA5597C6C1D1F9AAA0B?id=1124&timeStamp=2018-06-19%2016:48:48');
INSERT INTO `log` VALUES ('00000001059', '2018-06-20 15:10:41', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1121%EF%BC%86pageNumber=1%EF%BC%86pageLength=30');
INSERT INTO `log` VALUES ('00000001060', '2018-06-20 15:10:43', '0:0:0:0:0:0:0:1', null, '//Test1/index?null');
INSERT INTO `log` VALUES ('00000001061', '2018-06-20 15:10:43', '0:0:0:0:0:0:0:1', null, '//Test1/index?null');
INSERT INTO `log` VALUES ('00000001062', '2018-06-20 15:10:44', '0:0:0:0:0:0:0:1', null, '//Test1/MyPageSvl;jsessionid=DA5F3A94ADC3ED4B773BA84AF5F18257?id=1125&timeStamp=2018-06-19%2016:57:50');
INSERT INTO `log` VALUES ('00000001063', '2018-06-20 15:10:44', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg?null');
INSERT INTO `log` VALUES ('00000001064', '2018-06-20 15:10:44', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/0fc71b3f-175a-4360-a7ba-5e9ece35730c_02ab4db185c92cc40a4f37b85a86af37_b.jpg?null');
INSERT INTO `log` VALUES ('00000001065', '2018-06-20 15:10:44', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/66ab30ff-4229-412a-86a1-29b418aae676_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E%20%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3?null');
INSERT INTO `log` VALUES ('00000001066', '2018-06-20 15:10:48', '0:0:0:0:0:0:0:1', null, '//Test1/index?null');
INSERT INTO `log` VALUES ('00000001067', '2018-06-20 15:10:48', '0:0:0:0:0:0:0:1', null, '//Test1/index?null');
INSERT INTO `log` VALUES ('00000001068', '2018-06-20 15:10:49', '0:0:0:0:0:0:0:1', null, '//Test1/MyPageSvl;jsessionid=E7496E0C378B70884D73D049724CA3FC?id=1109&timeStamp=2018-06-18%2018:08:34');
INSERT INTO `log` VALUES ('00000001069', '2018-06-20 15:10:51', '0:0:0:0:0:0:0:1', null, '//Test1/index?null');
INSERT INTO `log` VALUES ('00000001070', '2018-06-20 15:10:51', '0:0:0:0:0:0:0:1', null, '//Test1/index?null');
INSERT INTO `log` VALUES ('00000001071', '2018-06-20 15:10:53', '0:0:0:0:0:0:0:1', null, '//Test1/index?null');
INSERT INTO `log` VALUES ('00000001072', '2018-06-20 15:10:53', '0:0:0:0:0:0:0:1', null, '//Test1/index?null');
INSERT INTO `log` VALUES ('00000001073', '2018-06-20 15:10:58', '0:0:0:0:0:0:0:1', null, '/Test1/index?null');
INSERT INTO `log` VALUES ('00000001074', '2018-06-20 15:10:59', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1119&timeStamp=2018-06-18%2018:09:31');
INSERT INTO `log` VALUES ('00000001075', '2018-06-20 15:11:03', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1113&timeStamp=2018-06-16%2018:25:15');
INSERT INTO `log` VALUES ('00000001076', '2018-06-20 15:11:08', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1105&timeStamp=2018-06-04%2012:46:04');
INSERT INTO `log` VALUES ('00000001077', '2018-06-20 15:11:11', '0:0:0:0:0:0:0:1', null, '/Test1/index?null');
INSERT INTO `log` VALUES ('00000001078', '2018-06-20 15:11:53', '172.21.1.148', null, '/Test1/MyPageSvl?id=1125&timeStamp=2018-06-19%2016:57:50');
INSERT INTO `log` VALUES ('00000001079', '2018-06-20 15:12:35', '172.21.1.148', null, '/Test1/?null');
INSERT INTO `log` VALUES ('00000001080', '2018-06-20 15:12:35', '172.21.1.148', null, '/Test1/?null');
INSERT INTO `log` VALUES ('00000001081', '2018-06-20 15:12:39', '172.21.1.148', null, '/Test1/MyPageSvl?id=1110&timeStamp=2018-06-05%2010:23:07');
INSERT INTO `log` VALUES ('00000001082', '2018-06-20 15:12:43', '172.21.1.148', null, '/Test1/MyPageSvl?id=1122&timeStamp=2018-06-18%2018:35:25');
INSERT INTO `log` VALUES ('00000001083', '2018-06-20 15:12:45', '172.21.1.148', null, '/Test1/MyPageSvl?id=1112&timeStamp=2018-06-18%2022:47:48');
INSERT INTO `log` VALUES ('00000001084', '2018-06-20 15:12:58', '172.21.1.148', null, '/Test1/MyPageSvl?id=1112&timeStamp=2018-06-18%2022:47:48');
INSERT INTO `log` VALUES ('00000001085', '2018-06-20 15:13:12', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1112&timeStamp=2018-06-18%2022:47:48');
INSERT INTO `log` VALUES ('00000001086', '2018-06-20 15:13:12', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1112&timeStamp=2018-06-18%2022:47:48');
INSERT INTO `log` VALUES ('00000001087', '2018-06-20 15:13:12', '0:0:0:0:0:0:0:1', null, '/Test1/www.baidu.com?null');
INSERT INTO `log` VALUES ('00000001088', '2018-06-20 15:13:12', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/db5c182b-1b43-480c-ae1f-34292a33ed5a_4.mp4?null');
INSERT INTO `log` VALUES ('00000001089', '2018-06-20 15:13:12', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_%E6%B2%99%E5%AE%9D%E4%BA%AE%20-%20%E6%9A%97%E9%A6%99%20[mqms2].mp3?null');
INSERT INTO `log` VALUES ('00000001090', '2018-06-20 15:13:12', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/ae8450b0-efa3-4479-8cf9-dbaa06117bea_47_2826b519176277740efd436be521e53f_3.mp4?null');
INSERT INTO `log` VALUES ('00000001091', '2018-06-20 15:13:12', '0:0:0:0:0:0:0:1', null, '/Test1/www.baidu.com?null');
INSERT INTO `log` VALUES ('00000001092', '2018-06-20 15:13:12', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/db5c182b-1b43-480c-ae1f-34292a33ed5a_4.mp4?null');
INSERT INTO `log` VALUES ('00000001093', '2018-06-20 15:13:12', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_%E6%B2%99%E5%AE%9D%E4%BA%AE%20-%20%E6%9A%97%E9%A6%99%20[mqms2].mp3?null');
INSERT INTO `log` VALUES ('00000001094', '2018-06-20 15:13:12', '0:0:0:0:0:0:0:1', null, '/Test1/www.baidu.com?null');
INSERT INTO `log` VALUES ('00000001095', '2018-06-20 15:13:12', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/8ccc5b06-e988-45fa-9678-95a839cdcdbf_%E5%90%89%E7%94%B0%E6%B4%81%20%E6%97%A5%E6%9C%AC%E4%BA%BA%E7%9A%84%E9%81%A5%E8%BF%9C%E6%97%85%E9%80%94%20%E6%97%85%E7%A8%8B%E7%9A%84%E7%BB%88%E7%BB%93.mp3?null');
INSERT INTO `log` VALUES ('00000001096', '2018-06-20 15:13:12', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/643cc08f-dd96-416c-ae40-634074a10150_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E%20%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3?null');
INSERT INTO `log` VALUES ('00000001097', '2018-06-20 15:13:12', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_%E6%B2%99%E5%AE%9D%E4%BA%AE%20-%20%E6%9A%97%E9%A6%99%20[mqms2].mp3?null');
INSERT INTO `log` VALUES ('00000001098', '2018-06-20 15:14:58', '172.21.1.148', null, '/Test1/index?null');
INSERT INTO `log` VALUES ('00000001099', '2018-06-20 15:15:11', '172.21.1.148', null, '/Test1/Login.jsp?null');
INSERT INTO `log` VALUES ('00000001100', '2018-06-20 15:15:12', '172.21.1.148', null, '/Test1/GetPassCode.jpg?null');
INSERT INTO `log` VALUES ('00000001101', '2018-06-20 15:15:28', '172.21.1.148', null, '/Test1/login?null');
INSERT INTO `log` VALUES ('00000001102', '2018-06-20 15:15:28', '172.21.1.148', '00000001078', '/Test1/index?null');
INSERT INTO `log` VALUES ('00000001103', '2018-06-20 15:15:49', '172.21.1.148', '00000001078', '/Test1/MyPageSvl?id=1125&timeStamp=2018-06-19%2016:57:50');
INSERT INTO `log` VALUES ('00000001104', '2018-06-20 15:15:57', '172.21.1.148', '00000001078', '/Test1/index?null');
INSERT INTO `log` VALUES ('00000001105', '2018-06-20 15:16:05', '172.21.1.148', '00000001078', '/Test1/MyPageSvl?id=1121&timeStamp=2018-06-19%2016:45:26');
INSERT INTO `log` VALUES ('00000001106', '2018-06-20 15:16:31', '172.21.1.148', '00000001078', '/Test1/index?null');
INSERT INTO `log` VALUES ('00000001107', '2018-06-20 15:16:39', '172.21.1.148', '00000001078', '/Test1/MyPageSvl?id=1122&timeStamp=2018-06-18%2018:35:25');
INSERT INTO `log` VALUES ('00000001108', '2018-06-20 15:16:43', '172.21.1.148', '00000001078', '/Test1/MyPageSvl?id=1112&timeStamp=2018-06-18%2022:47:48');
INSERT INTO `log` VALUES ('00000001109', '2018-06-20 15:17:34', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1112&timeStamp=2018-06-18%2022:47:48');
INSERT INTO `log` VALUES ('00000001110', '2018-06-20 15:17:34', '0:0:0:0:0:0:0:1', null, '/Test1/www.baidu.com?null');
INSERT INTO `log` VALUES ('00000001111', '2018-06-20 15:17:34', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/ae8450b0-efa3-4479-8cf9-dbaa06117bea_47_2826b519176277740efd436be521e53f_3.mp4?null');
INSERT INTO `log` VALUES ('00000001112', '2018-06-20 15:17:34', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_%E6%B2%99%E5%AE%9D%E4%BA%AE%20-%20%E6%9A%97%E9%A6%99%20[mqms2].mp3?null');
INSERT INTO `log` VALUES ('00000001113', '2018-06-20 15:17:34', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/db5c182b-1b43-480c-ae1f-34292a33ed5a_4.mp4?null');
INSERT INTO `log` VALUES ('00000001114', '2018-06-20 15:17:34', '0:0:0:0:0:0:0:1', null, '/Test1/www.baidu.com?null');
INSERT INTO `log` VALUES ('00000001115', '2018-06-20 15:17:34', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_%E6%B2%99%E5%AE%9D%E4%BA%AE%20-%20%E6%9A%97%E9%A6%99%20[mqms2].mp3?null');
INSERT INTO `log` VALUES ('00000001116', '2018-06-20 15:17:34', '0:0:0:0:0:0:0:1', null, '/Test1/www.baidu.com?null');
INSERT INTO `log` VALUES ('00000001117', '2018-06-20 15:17:35', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/db5c182b-1b43-480c-ae1f-34292a33ed5a_4.mp4?null');
INSERT INTO `log` VALUES ('00000001118', '2018-06-20 15:17:35', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/8ccc5b06-e988-45fa-9678-95a839cdcdbf_%E5%90%89%E7%94%B0%E6%B4%81%20%E6%97%A5%E6%9C%AC%E4%BA%BA%E7%9A%84%E9%81%A5%E8%BF%9C%E6%97%85%E9%80%94%20%E6%97%85%E7%A8%8B%E7%9A%84%E7%BB%88%E7%BB%93.mp3?null');
INSERT INTO `log` VALUES ('00000001119', '2018-06-20 15:17:35', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_%E6%B2%99%E5%AE%9D%E4%BA%AE%20-%20%E6%9A%97%E9%A6%99%20[mqms2].mp3?null');
INSERT INTO `log` VALUES ('00000001120', '2018-06-20 15:17:35', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/643cc08f-dd96-416c-ae40-634074a10150_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E%20%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3?null');
INSERT INTO `log` VALUES ('00000001121', '2018-06-20 15:17:43', '0:0:0:0:0:0:0:1', null, '/Test1/index?null');
INSERT INTO `log` VALUES ('00000001122', '2018-06-20 15:17:44', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1121&timeStamp=2018-06-19%2016:45:26');
INSERT INTO `log` VALUES ('00000001123', '2018-06-20 15:17:44', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg?null');
INSERT INTO `log` VALUES ('00000001124', '2018-06-20 15:17:45', '0:0:0:0:0:0:0:1', null, '/Test1/upload/user/1078/21a54623-fa63-440e-ab6a-8d2224f78f32_TIM%E5%9B%BE%E7%89%8720180316145534.jpg?null');
INSERT INTO `log` VALUES ('00000001125', '2018-06-20 15:17:47', '0:0:0:0:0:0:0:1', null, '/Test1/index?null');
INSERT INTO `log` VALUES ('00000001126', '2018-06-20 15:17:51', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1042&timeStamp=2018-06-05%2014:28:01');
INSERT INTO `log` VALUES ('00000001127', '2018-06-20 15:17:55', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1042&pageNumber=2&pageLength=30');
INSERT INTO `log` VALUES ('00000001128', '2018-06-20 15:17:58', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1042&pageNumber=2&pageLength=30');
INSERT INTO `log` VALUES ('00000001129', '2018-06-20 15:18:02', '0:0:0:0:0:0:0:1', null, '/Test1/index?null');
INSERT INTO `log` VALUES ('00000001130', '2018-06-20 15:19:09', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1042&timeStamp=2018-06-05%2014:28:01');
INSERT INTO `log` VALUES ('00000001131', '2018-06-20 15:19:12', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1042&pageNumber=2&pageLength=30');
INSERT INTO `log` VALUES ('00000001132', '2018-06-20 15:19:15', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1042&pageNumber=2&pageLength=30');
INSERT INTO `log` VALUES ('00000001133', '2018-06-20 15:19:37', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1112&timeStamp=2018-06-18%2022:47:48');
INSERT INTO `log` VALUES ('00000001134', '2018-06-20 15:19:37', '0:0:0:0:0:0:0:1', null, '/Test1/www.baidu.com?null');
INSERT INTO `log` VALUES ('00000001135', '2018-06-20 15:19:37', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/db5c182b-1b43-480c-ae1f-34292a33ed5a_4.mp4?null');
INSERT INTO `log` VALUES ('00000001136', '2018-06-20 15:19:37', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/ae8450b0-efa3-4479-8cf9-dbaa06117bea_47_2826b519176277740efd436be521e53f_3.mp4?null');
INSERT INTO `log` VALUES ('00000001137', '2018-06-20 15:19:37', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_%E6%B2%99%E5%AE%9D%E4%BA%AE%20-%20%E6%9A%97%E9%A6%99%20[mqms2].mp3?null');
INSERT INTO `log` VALUES ('00000001138', '2018-06-20 15:19:37', '0:0:0:0:0:0:0:1', null, '/Test1/www.baidu.com?null');
INSERT INTO `log` VALUES ('00000001139', '2018-06-20 15:19:37', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_%E6%B2%99%E5%AE%9D%E4%BA%AE%20-%20%E6%9A%97%E9%A6%99%20[mqms2].mp3?null');
INSERT INTO `log` VALUES ('00000001140', '2018-06-20 15:19:37', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/db5c182b-1b43-480c-ae1f-34292a33ed5a_4.mp4?null');
INSERT INTO `log` VALUES ('00000001141', '2018-06-20 15:19:37', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_%E6%B2%99%E5%AE%9D%E4%BA%AE%20-%20%E6%9A%97%E9%A6%99%20[mqms2].mp3?null');
INSERT INTO `log` VALUES ('00000001142', '2018-06-20 15:19:37', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/8ccc5b06-e988-45fa-9678-95a839cdcdbf_%E5%90%89%E7%94%B0%E6%B4%81%20%E6%97%A5%E6%9C%AC%E4%BA%BA%E7%9A%84%E9%81%A5%E8%BF%9C%E6%97%85%E9%80%94%20%E6%97%85%E7%A8%8B%E7%9A%84%E7%BB%88%E7%BB%93.mp3?null');
INSERT INTO `log` VALUES ('00000001143', '2018-06-20 15:19:37', '0:0:0:0:0:0:0:1', null, '/Test1/www.baidu.com?null');
INSERT INTO `log` VALUES ('00000001144', '2018-06-20 15:19:37', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/643cc08f-dd96-416c-ae40-634074a10150_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E%20%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3?null');
INSERT INTO `log` VALUES ('00000001145', '2018-06-20 15:20:28', '0:0:0:0:0:0:0:1', null, '/Test1/MyPageSvl?id=1112&timeStamp=2018-06-18%2022:47:48');
INSERT INTO `log` VALUES ('00000001146', '2018-06-20 15:20:28', '0:0:0:0:0:0:0:1', null, '/Test1/www.baidu.com?null');
INSERT INTO `log` VALUES ('00000001147', '2018-06-20 15:20:28', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_%E6%B2%99%E5%AE%9D%E4%BA%AE%20-%20%E6%9A%97%E9%A6%99%20[mqms2].mp3?null');
INSERT INTO `log` VALUES ('00000001148', '2018-06-20 15:20:28', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/ae8450b0-efa3-4479-8cf9-dbaa06117bea_47_2826b519176277740efd436be521e53f_3.mp4?null');
INSERT INTO `log` VALUES ('00000001149', '2018-06-20 15:20:28', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/db5c182b-1b43-480c-ae1f-34292a33ed5a_4.mp4?null');
INSERT INTO `log` VALUES ('00000001150', '2018-06-20 15:20:28', '0:0:0:0:0:0:0:1', null, '/Test1/www.baidu.com?null');
INSERT INTO `log` VALUES ('00000001151', '2018-06-20 15:20:28', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_%E6%B2%99%E5%AE%9D%E4%BA%AE%20-%20%E6%9A%97%E9%A6%99%20[mqms2].mp3?null');
INSERT INTO `log` VALUES ('00000001152', '2018-06-20 15:20:28', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/8ccc5b06-e988-45fa-9678-95a839cdcdbf_%E5%90%89%E7%94%B0%E6%B4%81%20%E6%97%A5%E6%9C%AC%E4%BA%BA%E7%9A%84%E9%81%A5%E8%BF%9C%E6%97%85%E9%80%94%20%E6%97%85%E7%A8%8B%E7%9A%84%E7%BB%88%E7%BB%93.mp3?null');
INSERT INTO `log` VALUES ('00000001153', '2018-06-20 15:20:28', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/db5c182b-1b43-480c-ae1f-34292a33ed5a_4.mp4?null');
INSERT INTO `log` VALUES ('00000001154', '2018-06-20 15:20:28', '0:0:0:0:0:0:0:1', null, '/Test1/www.baidu.com?null');
INSERT INTO `log` VALUES ('00000001155', '2018-06-20 15:20:28', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_%E6%B2%99%E5%AE%9D%E4%BA%AE%20-%20%E6%9A%97%E9%A6%99%20[mqms2].mp3?null');
INSERT INTO `log` VALUES ('00000001156', '2018-06-20 15:20:28', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/643cc08f-dd96-416c-ae40-634074a10150_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E%20%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3?null');
INSERT INTO `log` VALUES ('00000001157', '2018-06-20 15:20:28', '0:0:0:0:0:0:0:1', null, '/Test1/upload/picture/user/1078/0309876e-1380-4ceb-a96a-a88d01b51f49_%E3%80%90%E5%9B%9B%E6%9C%88%E6%90%9C%E5%A4%A9%E4%B8%8B%E3%80%91%E4%BF%84%E7%BD%97%E6%96%AF%E5%9B%BD%E5%AE%B6%E5%BD%A2%E8%B1%A1%E5%AE%A3%E4%BC%A0%E7%89%87%EF%BC%88%E4%B8%AD%E6%96%87%E5%AD%97%E5%B9%95%EF%BC%89_%E8%B6%85%E6%B8%85.mp4?null');

-- ----------------------------
-- Table structure for media
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
) ENGINE=InnoDB AUTO_INCREMENT=1065 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media` VALUES ('1048', '1078', '9ff6991a5839a413b1ac40a532ab42c1_r.jpg', 'http://localhost:8080/Test1/upload/user/1078/e4685ed2-23cc-4396-86eb-96e84a3c3b49_9ff6991a5839a413b1ac40a532ab42c1_r.jpg', '0', '2018-06-20 12:04:48');
INSERT INTO `media` VALUES ('1053', '1078', '9ff6991a5839a413b1ac40a532ab42c1_r.jpg', 'http://localhost:8080/Test1/upload/user/1078/f6601eda-c235-4d9c-a396-aa15b5f08def_9ff6991a5839a413b1ac40a532ab42c1_r.jpg', '0', '2018-06-20 12:07:30');
INSERT INTO `media` VALUES ('1061', '1078', '272775451.jpg', 'http://localhost:8080/Test1/upload/user/1078/328dd806-8593-428a-a622-f158ce6ba618_272775451.jpg', '0', '2018-06-20 12:19:13');
INSERT INTO `media` VALUES ('1062', '1078', '9ff6991a5839a413b1ac40a532ab42c1_r.jpg', 'http://localhost:8080/Test1/upload/user/1078/5b5d5e7f-eb35-4b81-82e0-4eb5a7023234_9ff6991a5839a413b1ac40a532ab42c1_r.jpg', '0', '2018-06-20 13:23:50');
INSERT INTO `media` VALUES ('1063', '1078', '272775451.jpg', 'http://localhost:8080/Test1/upload/user/1078/43a6cb14-2858-4d8f-97d0-323c43837c2c_272775451.jpg', '0', '2018-06-20 13:25:42');
INSERT INTO `media` VALUES ('1064', '1078', '02ab4db185c92cc40a4f37b85a86af37_b.jpg', 'http://localhost:8080/Test1/upload/user/1078/8c0fefaa-85c1-4f8e-8d27-4cb6a05beafd_02ab4db185c92cc40a4f37b85a86af37_b.jpg', '0', '2018-06-20 13:26:28');

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(1) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `userId` int(1) unsigned zerofill NOT NULL,
  `text` varchar(767) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `pageId` int(1) unsigned zerofill NOT NULL,
  `floorNumber` int(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `userId` (`userId`) USING BTREE,
  KEY `pageId` (`pageId`) USING BTREE,
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`pageId`) REFERENCES `mypage` (`id`),
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1385 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------
INSERT INTO `message` VALUES ('1092', '2018-05-21 20:46:02', '1000', '这是第二楼', '1042', '1');
INSERT INTO `message` VALUES ('1093', '2018-05-21 20:47:54', '1000', '这是第三楼', '1042', '2');
INSERT INTO `message` VALUES ('1094', '2018-05-21 20:48:24', '1000', '这是第四楼', '1042', '3');
INSERT INTO `message` VALUES ('1096', '2018-05-21 20:49:11', '1000', '我是秦亚祺', '1043', '1');
INSERT INTO `message` VALUES ('1097', '2018-05-21 20:49:23', '1000', '顶', '1042', '4');
INSERT INTO `message` VALUES ('1098', '2018-05-21 20:53:38', '1000', '现在几点了', '1043', '2');
INSERT INTO `message` VALUES ('1099', '2018-05-21 20:54:14', '1000', '而嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡嗡', '1043', '3');
INSERT INTO `message` VALUES ('1100', '2018-05-21 21:03:49', '1000', '对方是否', '1048', '1');
INSERT INTO `message` VALUES ('1101', '2018-05-21 21:09:27', '1000', '个大概豆腐干反对个', '1042', '5');
INSERT INTO `message` VALUES ('1102', '2018-05-21 21:18:06', '1000', '你是不是傻啊', '1042', '6');
INSERT INTO `message` VALUES ('1103', '2018-05-21 21:18:13', '1000', '我不傻', '1042', '7');
INSERT INTO `message` VALUES ('1104', '2018-05-21 21:21:47', '1000', '我也要睡了', '1051', '1');
INSERT INTO `message` VALUES ('1109', '2018-05-21 21:39:39', '1037', '呵呵呵呵', '1051', '5');
INSERT INTO `message` VALUES ('1110', '2018-05-21 21:39:48', '1037', '司法考试分厘卡电视机分厘卡电视机', '1050', '1');
INSERT INTO `message` VALUES ('1111', '2018-05-21 21:39:58', '1037', '地方就是离开房间', '1050', '2');
INSERT INTO `message` VALUES ('1112', '2018-05-21 21:40:01', '1037', '士大夫十分', '1050', '3');
INSERT INTO `message` VALUES ('1113', '2018-05-21 21:40:04', '1037', '打发士大夫士大夫大师傅', '1050', '4');
INSERT INTO `message` VALUES ('1114', '2018-05-21 21:51:47', '1000', '有啊', '1052', '1');
INSERT INTO `message` VALUES ('1115', '2018-05-21 21:52:26', '1000', '一楼', '1053', '1');
INSERT INTO `message` VALUES ('1116', '2018-05-21 21:52:38', '1000', '顶', '1052', '2');
INSERT INTO `message` VALUES ('1117', '2018-05-21 22:06:36', '1037', '在哪里啊', '1054', '1');
INSERT INTO `message` VALUES ('1118', '2018-05-21 22:06:46', '1000', '顶', '1054', '2');
INSERT INTO `message` VALUES ('1119', '2018-05-21 22:07:36', '1000', '在黄河路上啊', '1054', '3');
INSERT INTO `message` VALUES ('1120', '2018-05-21 22:20:13', '1037', '狼狼恶狗', '1053', '2');
INSERT INTO `message` VALUES ('1121', '2018-05-21 22:31:37', '1000', '个方法烦烦烦烦烦烦烦烦烦', '1053', '3');
INSERT INTO `message` VALUES ('1122', '2018-05-21 22:33:35', '1000', '这个帖子回复最多，哈哈哈哈', '1042', '8');
INSERT INTO `message` VALUES ('1124', '2018-05-22 15:51:21', '1000', '士大夫', '1042', '10');
INSERT INTO `message` VALUES ('1125', '2018-05-22 15:53:18', '1000', '电风扇士大夫', '1042', '11');
INSERT INTO `message` VALUES ('1126', '2018-05-22 18:08:57', '1000', '上了飞机昂克赛拉', '1058', '1');
INSERT INTO `message` VALUES ('1127', '2018-05-22 18:09:00', '1000', '随风倒十分', '1058', '2');
INSERT INTO `message` VALUES ('1128', '2018-05-22 18:29:54', '1000', '登上了飞机考虑', '1060', '1');
INSERT INTO `message` VALUES ('1129', '2018-05-22 18:30:09', '1000', '萨芬', '1042', '12');
INSERT INTO `message` VALUES ('1130', '2018-05-23 14:24:37', '1000', '第一楼', '1061', '1');
INSERT INTO `message` VALUES ('1131', '2018-05-23 14:24:42', '1000', '第二楼', '1061', '2');
INSERT INTO `message` VALUES ('1132', '2018-05-23 14:24:48', '1000', '第三楼', '1061', '3');
INSERT INTO `message` VALUES ('1133', '2018-05-23 14:24:51', '1000', '的方式', '1061', '4');
INSERT INTO `message` VALUES ('1134', '2018-05-23 14:25:56', '1000', '士大夫', '1061', '5');
INSERT INTO `message` VALUES ('1135', '2018-05-24 14:34:16', '1000', '士大夫似的', '1062', '1');
INSERT INTO `message` VALUES ('1136', '2018-05-24 14:34:19', '1000', '房贷首付', '1062', '2');
INSERT INTO `message` VALUES ('1137', '2018-05-24 14:37:23', '1000', '士大夫似的', '1063', '1');
INSERT INTO `message` VALUES ('1138', '2018-05-24 14:38:07', '1000', 'DVD发的', '1062', '3');
INSERT INTO `message` VALUES ('1139', '2018-05-24 14:38:41', '1057', '打我的', '1062', '4');
INSERT INTO `message` VALUES ('1140', '2018-05-24 14:38:44', '1057', '大苏打', '1062', '5');
INSERT INTO `message` VALUES ('1141', '2018-05-24 14:39:14', '1057', '方式是十分', '1059', '1');
INSERT INTO `message` VALUES ('1142', '2018-05-24 16:59:05', '1058', '233', '1059', '2');
INSERT INTO `message` VALUES ('1143', '2018-05-24 18:02:32', '1000', '反倒是', '1064', '1');
INSERT INTO `message` VALUES ('1144', '2018-05-24 18:03:39', '1000', '将很快', '1059', '3');
INSERT INTO `message` VALUES ('1145', '2018-05-24 18:04:27', '1000', '房贷首付', '1065', '1');
INSERT INTO `message` VALUES ('1146', '2018-05-24 18:05:02', '1000', '十分的', '1065', '2');
INSERT INTO `message` VALUES ('1147', '2018-05-24 18:06:57', '1000', '胜多负少', '1065', '3');
INSERT INTO `message` VALUES ('1148', '2018-05-24 18:07:00', '1000', '的说法是', '1065', '4');
INSERT INTO `message` VALUES ('1149', '2018-05-24 18:20:31', '1000', '大苏打', '1066', '1');
INSERT INTO `message` VALUES ('1150', '2018-05-24 18:20:42', '1000', '给对方', '1065', '5');
INSERT INTO `message` VALUES ('1151', '2018-05-25 14:11:01', '1066', '1', '1059', '4');
INSERT INTO `message` VALUES ('1152', '2018-05-25 14:13:08', '1066', '123', '1053', '4');
INSERT INTO `message` VALUES ('1153', '2018-05-25 14:19:09', '1066', '2', '1067', '1');
INSERT INTO `message` VALUES ('1154', '2018-05-25 14:21:53', '1067', '22', '1059', '5');
INSERT INTO `message` VALUES ('1155', '2018-05-25 14:23:20', '1000', '发士大夫', '1068', '1');
INSERT INTO `message` VALUES ('1156', '2018-05-25 14:24:05', '1000', '打算', '1042', '13');
INSERT INTO `message` VALUES ('1157', '2018-05-28 15:45:12', '1068', '规划局规划局', '1070', '1');
INSERT INTO `message` VALUES ('1158', '2018-05-28 17:25:45', '1000', '房贷首付', '1070', '2');
INSERT INTO `message` VALUES ('1159', '2018-05-28 17:39:30', '1000', '但是发射点发射点', '1071', '1');
INSERT INTO `message` VALUES ('1160', '2018-05-28 17:39:59', '1069', '大师傅大师傅', '1070', '3');
INSERT INTO `message` VALUES ('1161', '2018-05-28 17:40:15', '1069', '顺丰到付', '1067', '2');
INSERT INTO `message` VALUES ('1162', '2018-05-28 17:46:29', '1057', '大师傅士大夫', '1067', '3');
INSERT INTO `message` VALUES ('1163', '2018-05-29 11:27:36', '1070', '热热我', '1072', '1');
INSERT INTO `message` VALUES ('1164', '2018-05-29 11:29:43', '1070', '今天星期3', '1073', '1');
INSERT INTO `message` VALUES ('1165', '2018-05-29 11:31:38', '1070', '今天星期4', '1073', '2');
INSERT INTO `message` VALUES ('1166', '2018-05-29 11:32:33', '1070', '他人的人感', '1074', '1');
INSERT INTO `message` VALUES ('1167', '2018-05-29 14:01:19', '1070', '的方式', '1075', '1');
INSERT INTO `message` VALUES ('1168', '2018-05-29 14:05:22', '1070', '国家和国际', '1075', '2');
INSERT INTO `message` VALUES ('1169', '2018-05-29 14:05:58', '1070', '客户', '1073', '3');
INSERT INTO `message` VALUES ('1170', '2018-05-29 14:06:30', '1070', '健康', '1073', '4');
INSERT INTO `message` VALUES ('1171', '2018-05-29 14:07:28', '1070', '金黄即可', '1075', '3');
INSERT INTO `message` VALUES ('1172', '2018-05-29 14:08:01', '1070', '和', '1072', '2');
INSERT INTO `message` VALUES ('1173', '2018-05-29 14:10:48', '1070', '十大', '1072', '3');
INSERT INTO `message` VALUES ('1174', '2018-05-29 14:10:59', '1070', '十大', '1072', '4');
INSERT INTO `message` VALUES ('1175', '2018-05-29 14:18:47', '1070', '的方式', '1072', '5');
INSERT INTO `message` VALUES ('1176', '2018-05-29 14:19:00', '1070', '的方式', '1072', '6');
INSERT INTO `message` VALUES ('1177', '2018-05-29 14:19:22', '1070', '的身份', '1072', '7');
INSERT INTO `message` VALUES ('1178', '2018-05-29 14:19:29', '1070', '胜多负少', '1072', '8');
INSERT INTO `message` VALUES ('1179', '2018-05-29 14:19:51', '1070', '可怜见看来', '1072', '9');
INSERT INTO `message` VALUES ('1180', '2018-05-29 14:20:52', '1070', '可怜见立刻', '1072', '10');
INSERT INTO `message` VALUES ('1181', '2018-05-29 14:22:04', '1000', '对方是否', '1072', '11');
INSERT INTO `message` VALUES ('1182', '2018-05-29 14:43:29', '1071', '范德萨范德萨', '1072', '12');
INSERT INTO `message` VALUES ('1183', '2018-05-29 14:57:18', '1070', '的活动', '1076', '1');
INSERT INTO `message` VALUES ('1184', '2018-05-29 15:22:40', '1000', '豫章故郡，洪都新府。星分翼轸，地接衡庐。襟三江而带五湖，控蛮荆而引瓯越。物华天宝，龙光射牛斗之墟；人杰地灵，徐孺下陈蕃之榻。雄州雾列，俊采星驰。台隍枕夷夏之交，宾主尽东南之美。都督阎公之雅望，棨戟遥临；宇文新州之懿范，襜帷暂驻。', '1076', '2');
INSERT INTO `message` VALUES ('1192', '2018-05-29 15:27:10', '1000', '德国官方答复', '1070', '4');
INSERT INTO `message` VALUES ('1193', '2018-05-29 15:27:11', '1070', 'http://localhost:8080/Test1/index', '1072', '13');
INSERT INTO `message` VALUES ('1194', '2018-05-29 15:27:11', '1071', '现场支持', '1076', '3');
INSERT INTO `message` VALUES ('1195', '2018-05-29 15:27:11', '1070', 'http://localhost:8080/Test1/index', '1072', '13');
INSERT INTO `message` VALUES ('1196', '2018-05-29 15:36:43', '1000', '电风扇士大夫', '1072', '15');
INSERT INTO `message` VALUES ('1197', '2018-05-29 15:38:09', '1000', '士大夫大师傅', '1072', '16');
INSERT INTO `message` VALUES ('1198', '2018-05-29 15:38:23', '1000', '的说法是', '1072', '17');
INSERT INTO `message` VALUES ('1199', '2018-05-29 15:42:03', '1070', '二分三分', '1066', '2');
INSERT INTO `message` VALUES ('1200', '2018-05-29 15:44:58', '1070', '豫章故郡，洪都新府。星分翼轸，地接衡庐。襟三江而带五湖，控蛮荆而引瓯越。物华天宝，龙光射牛斗之墟；人杰地灵，徐孺下陈蕃之榻。雄州雾列，俊采星驰。台隍枕夷夏之交，宾主尽东南之美。都督阎公之雅望，棨戟遥临；宇文新州之懿范，襜帷暂驻。十旬休假，胜友如云；千里逢迎，高朋满座。腾蛟起凤，孟学士之词宗；紫电青霜，王将军之武库。', '1066', '3');
INSERT INTO `message` VALUES ('1201', '2018-05-29 15:46:58', '1070', '刚刚好', '1072', '18');
INSERT INTO `message` VALUES ('1202', '2018-05-29 15:56:20', '1070', '没有', '1077', '1');
INSERT INTO `message` VALUES ('1206', '2018-05-29 16:00:00', '1000', '电风扇犯得上', '1077', '2');
INSERT INTO `message` VALUES ('1207', '2018-05-29 16:00:29', '1070', '打发士大夫', '1077', '3');
INSERT INTO `message` VALUES ('1208', '2018-05-29 16:00:39', '1000', '房贷首付', '1077', '4');
INSERT INTO `message` VALUES ('1209', '2018-05-29 16:00:53', '1070', '大师傅士大夫', '1077', '5');
INSERT INTO `message` VALUES ('1210', '2018-05-29 16:01:09', '1000', '当时的', '1077', '6');
INSERT INTO `message` VALUES ('1211', '2018-05-29 16:04:55', '1000', '电视机分厘卡时间的浪费空间的实力', '1078', '1');
INSERT INTO `message` VALUES ('1212', '2018-05-29 16:12:45', '1070', '<a href=\"www.baidu.com\">百度</a>', '1078', '2');
INSERT INTO `message` VALUES ('1213', '2018-05-29 16:13:05', '1070', '秦亚祺', '1078', '3');
INSERT INTO `message` VALUES ('1214', '2018-05-29 16:13:25', '1070', '<a href=\"Home?id=1000\">秦亚祺</a>', '1078', '4');
INSERT INTO `message` VALUES ('1215', '2018-05-29 16:15:00', '1000', '<a href=\"Home?id=1000\">秦亚祺</a>', '1079', '1');
INSERT INTO `message` VALUES ('1216', '2018-05-29 16:16:42', '1000', '<a href=\"Home?id=1000\">秦亚祺</a>', '1079', '2');
INSERT INTO `message` VALUES ('1217', '2018-05-29 16:17:12', '1000', '<a href=\"Home?id=1000\">秦亚祺</a>', '1081', '1');
INSERT INTO `message` VALUES ('1218', '2018-05-29 16:18:39', '1000', '    \r\n<a href=\"Home?id=1000\">秦亚祺</a> \r\n', '1081', '2');
INSERT INTO `message` VALUES ('1219', '2018-05-29 16:18:46', '1000', '    \r\n<a href=\"Home?id=1000\">秦亚祺</a> \r\n', '1081', '3');
INSERT INTO `message` VALUES ('1220', '2018-05-29 16:19:50', '1000', '<a href=\"Home?id=1000\">秦亚祺</a> ', '1084', '1');
INSERT INTO `message` VALUES ('1221', '2018-05-29 16:27:37', '1070', 'out.print(\"<td>\"+ \"--------\" + \"</td>\");', '1085', '1');
INSERT INTO `message` VALUES ('1222', '2018-05-29 16:34:00', '1000', '<a href=\"Home?id=1000\">123</a>', '1087', '1');
INSERT INTO `message` VALUES ('1223', '2018-05-29 16:35:57', '1000', '<a href=\"Home?id=1000\">123</a>', '1088', '1');
INSERT INTO `message` VALUES ('1224', '2018-05-29 16:37:02', '1000', '<a href=\'Home?id=1000\'>123</a>', '1088', '2');
INSERT INTO `message` VALUES ('1225', '2018-05-29 16:41:26', '1000', '<script type=\"text/javascript\">\r\n	  window.location.href=\"index\";\r\n\r\n</script>', '1088', '3');
INSERT INTO `message` VALUES ('1226', '2018-05-29 17:36:10', '1000', '的方式发送', '1097', '1');
INSERT INTO `message` VALUES ('1227', '2018-05-29 17:54:14', '1000', '顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶顶', '1099', '1');
INSERT INTO `message` VALUES ('1228', '2018-05-30 10:16:41', '1000', '<>', '1100', '1');
INSERT INTO `message` VALUES ('1229', '2018-05-30 10:19:29', '1000', '**', '1101', '1');
INSERT INTO `message` VALUES ('1230', '2018-05-30 10:20:52', '1000', '**', '1101', '2');
INSERT INTO `message` VALUES ('1231', '2018-05-30 10:21:03', '1000', '**script type=\"text/javascript\">\r\n  window.location.href=\"http://www.baidu.com\";\r\n**/script>', '1101', '3');
INSERT INTO `message` VALUES ('1232', '2018-05-30 10:51:14', '1000', 'testword', '1104', '1');
INSERT INTO `message` VALUES ('1233', '2018-05-30 10:51:20', '1000', '**', '1104', '2');
INSERT INTO `message` VALUES ('1234', '2018-05-30 10:51:33', '1000', '＜＞', '1104', '3');
INSERT INTO `message` VALUES ('1235', '2018-05-30 10:52:03', '1000', '＆＂', '1104', '4');
INSERT INTO `message` VALUES ('1236', '2018-05-31 15:22:05', '1000', '撒旦发射点 ', '1103', '1');
INSERT INTO `message` VALUES ('1237', '2018-05-31 15:33:49', '1070', '大师傅但是', '1103', '2');
INSERT INTO `message` VALUES ('1238', '2018-05-31 15:35:44', '1070', '发士大夫', '1103', '3');
INSERT INTO `message` VALUES ('1239', '2018-05-31 16:58:39', '1070', '二分', '1094', '1');
INSERT INTO `message` VALUES ('1240', '2018-06-04 14:37:43', '1000', '手动阀手动阀', '1108', '1');
INSERT INTO `message` VALUES ('1241', '2018-06-04 14:42:36', '1000', '但是犯得上发生', '1099', '2');
INSERT INTO `message` VALUES ('1242', '2018-06-04 14:42:44', '1000', '法大师傅大师傅', '1094', '2');
INSERT INTO `message` VALUES ('1243', '2018-06-04 14:47:39', '1000', '大师傅大师傅似的', '1072', '19');
INSERT INTO `message` VALUES ('1244', '2018-06-04 14:47:43', '1000', '犯得上发射点发射点', '1072', '20');
INSERT INTO `message` VALUES ('1245', '2018-06-05 10:22:22', '1070', '立刻大师傅将来肯定是', '1072', '21');
INSERT INTO `message` VALUES ('1246', '2018-06-05 10:23:28', '1070', '的撒', '1109', '1');
INSERT INTO `message` VALUES ('1247', '2018-06-05 10:29:32', '1000', '电风扇犯得上', '1042', '14');
INSERT INTO `message` VALUES ('1248', '2018-06-05 10:29:38', '1000', '地方都是', '1042', '15');
INSERT INTO `message` VALUES ('1249', '2018-06-05 10:29:43', '1000', '大幅答复是否', '1042', '16');
INSERT INTO `message` VALUES ('1250', '2018-06-05 10:29:49', '1000', '电风扇大师傅', '1042', '17');
INSERT INTO `message` VALUES ('1251', '2018-06-05 10:29:58', '1000', '地方地方大师傅', '1042', '18');
INSERT INTO `message` VALUES ('1252', '2018-06-05 10:30:17', '1000', '地方大师傅士大夫', '1042', '19');
INSERT INTO `message` VALUES ('1253', '2018-06-05 10:30:32', '1000', '感到反感', '1042', '20');
INSERT INTO `message` VALUES ('1254', '2018-06-05 10:30:52', '1000', '感到反感', '1042', '21');
INSERT INTO `message` VALUES ('1255', '2018-06-05 10:31:08', '1000', '犯得上发生', '1042', '22');
INSERT INTO `message` VALUES ('1256', '2018-06-05 13:16:48', '1074', '大师傅似的', '1042', '23');
INSERT INTO `message` VALUES ('1257', '2018-06-05 13:16:54', '1074', '的说法是', '1042', '24');
INSERT INTO `message` VALUES ('1258', '2018-06-05 13:19:43', '1074', '十点十分', '1042', '25');
INSERT INTO `message` VALUES ('1259', '2018-06-05 13:22:09', '1074', '发士大夫', '1042', '26');
INSERT INTO `message` VALUES ('1260', '2018-06-05 13:22:18', '1074', '顺丰到付', '1042', '27');
INSERT INTO `message` VALUES ('1261', '2018-06-05 13:22:34', '1074', '的身份', '1042', '28');
INSERT INTO `message` VALUES ('1262', '2018-06-05 13:23:02', '1074', '登上 ', '1042', '29');
INSERT INTO `message` VALUES ('1263', '2018-06-05 13:25:46', '1000', '发士大夫', '1042', '30');
INSERT INTO `message` VALUES ('1264', '2018-06-05 13:26:45', '1000', '肺栓塞发表', '1042', '31');
INSERT INTO `message` VALUES ('1265', '2018-06-05 13:27:06', '1000', '就', '1042', '32');
INSERT INTO `message` VALUES ('1266', '2018-06-05 13:27:17', '1000', '能成功', '1042', '33');
INSERT INTO `message` VALUES ('1267', '2018-06-05 13:27:26', '1000', ' 从', '1042', '34');
INSERT INTO `message` VALUES ('1268', '2018-06-05 13:28:10', '1000', '离开家', '1042', '35');
INSERT INTO `message` VALUES ('1269', '2018-06-05 13:34:05', '1070', '顶顶顶', '1042', '36');
INSERT INTO `message` VALUES ('1270', '2018-06-05 13:53:54', '1000', '大哥', '1042', '37');
INSERT INTO `message` VALUES ('1271', '2018-06-05 13:55:31', '1000', '房贷首付', '1042', '38');
INSERT INTO `message` VALUES ('1272', '2018-06-05 13:55:40', '1000', '地方大师傅', '1042', '39');
INSERT INTO `message` VALUES ('1273', '2018-06-05 14:06:38', '1070', '4', '1042', '40');
INSERT INTO `message` VALUES ('1274', '2018-06-05 14:16:34', '1070', '5', '1042', '41');
INSERT INTO `message` VALUES ('1275', '2018-06-05 14:16:44', '1070', '2', '1042', '42');
INSERT INTO `message` VALUES ('1276', '2018-06-05 14:16:54', '1070', '对方是否', '1042', '43');
INSERT INTO `message` VALUES ('1277', '2018-06-05 14:17:00', '1070', '合法化', '1042', '44');
INSERT INTO `message` VALUES ('1278', '2018-06-05 14:17:14', '1070', '感到反感', '1042', '45');
INSERT INTO `message` VALUES ('1279', '2018-06-05 14:17:26', '1070', '横幅广告和', '1042', '46');
INSERT INTO `message` VALUES ('1280', '2018-06-05 14:17:36', '1070', '护法国会', '1042', '47');
INSERT INTO `message` VALUES ('1281', '2018-06-05 14:17:40', '1070', '规划风格化', '1042', '48');
INSERT INTO `message` VALUES ('1282', '2018-06-05 14:17:43', '1070', '挂号费', '1042', '49');
INSERT INTO `message` VALUES ('1283', '2018-06-05 14:17:50', '1070', '挂号费', '1042', '50');
INSERT INTO `message` VALUES ('1284', '2018-06-05 14:17:57', '1070', '好几个', '1042', '51');
INSERT INTO `message` VALUES ('1285', '2018-06-05 14:18:01', '1070', '合法化', '1042', '52');
INSERT INTO `message` VALUES ('1286', '2018-06-05 14:18:37', '1070', '的发射点', '1106', '1');
INSERT INTO `message` VALUES ('1287', '2018-06-05 14:18:42', '1070', '个人', '1106', '2');
INSERT INTO `message` VALUES ('1288', '2018-06-05 14:18:48', '1070', '挂号费', '1106', '3');
INSERT INTO `message` VALUES ('1289', '2018-06-05 14:18:51', '1070', '规划风格化', '1106', '4');
INSERT INTO `message` VALUES ('1290', '2018-06-05 14:18:53', '1070', '个复活复活', '1106', '5');
INSERT INTO `message` VALUES ('1291', '2018-06-05 14:18:56', '1070', '规划风格化', '1106', '6');
INSERT INTO `message` VALUES ('1292', '2018-06-05 14:18:59', '1070', '合法化', '1106', '7');
INSERT INTO `message` VALUES ('1293', '2018-06-05 14:19:02', '1070', '个复活复活', '1106', '8');
INSERT INTO `message` VALUES ('1294', '2018-06-05 14:19:04', '1070', '规范化', '1106', '9');
INSERT INTO `message` VALUES ('1295', '2018-06-05 14:19:11', '1070', '规范化', '1106', '10');
INSERT INTO `message` VALUES ('1296', '2018-06-05 14:19:15', '1070', '感到反感', '1106', '11');
INSERT INTO `message` VALUES ('1297', '2018-06-05 14:28:01', '1070', '健康哈哈', '1042', '53');
INSERT INTO `message` VALUES ('1298', '2018-06-06 11:29:06', '1000', '**', '1088', '4');
INSERT INTO `message` VALUES ('1299', '2018-06-16 17:22:46', '1076', 'http://localhost:8080/Test1/upload/picture/user/1076/a3a1126c-f579-4ff5-b5df-8c54ff26ee5a_Friends%20.mp3', '1088', '5');
INSERT INTO `message` VALUES ('1300', '2018-06-16 18:04:45', '1076', '逻辑上的两块腹肌拉伤放假了', '1111', '1');
INSERT INTO `message` VALUES ('1301', '2018-06-16 18:04:50', '1076', '发；狗啃；对方是个；拉卡拉； ', '1111', '2');
INSERT INTO `message` VALUES ('1302', '2018-06-16 18:05:39', '1076', '发射点发生', '1111', '3');
INSERT INTO `message` VALUES ('1303', '2018-06-16 18:05:42', '1076', '第三方', '1111', '4');
INSERT INTO `message` VALUES ('1304', '2018-06-16 18:05:45', '1076', '发大水', '1111', '5');
INSERT INTO `message` VALUES ('1305', '2018-06-16 18:06:22', '1076', '士大夫士大夫', '1112', '1');
INSERT INTO `message` VALUES ('1306', '2018-06-16 18:06:24', '1076', '法大师傅士大夫', '1112', '2');
INSERT INTO `message` VALUES ('1307', '2018-06-16 18:06:26', '1076', '法大师傅士大夫', '1112', '3');
INSERT INTO `message` VALUES ('1308', '2018-06-16 18:25:15', '1076', '就拉开决定了', '1113', '1');
INSERT INTO `message` VALUES ('1309', '2018-06-16 19:51:15', '1077', '了开始觉得分厘卡电视机联发科', '1114', '1');
INSERT INTO `message` VALUES ('1310', '2018-06-16 19:51:28', '1077', '立刻解放的落款时间分厘卡懒得看是否就是考虑对方接受了都快放假了', '1114', '2');
INSERT INTO `message` VALUES ('1311', '2018-06-16 20:29:19', '1076', '\r\n壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。 于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。离开戒毒所分厘卡时间电风扇', '1114', '3');
INSERT INTO `message` VALUES ('1312', '2018-06-16 20:29:44', '1077', '\r\n壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。 于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。离开戒毒所分厘卡时间电风扇', '1114', '4');
INSERT INTO `message` VALUES ('1313', '2018-06-16 20:30:12', '1077', '\r\n壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。 于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。离开戒毒所分厘卡时间电风扇', '1088', '6');
INSERT INTO `message` VALUES ('1314', '2018-06-16 21:03:23', '1079', '到了看见分厘卡似的放假了深刻搭街坊', '1115', '1');
INSERT INTO `message` VALUES ('1315', '2018-06-16 23:44:47', '1078', 'yi\r\ner\r\nsan', '1115', '2');
INSERT INTO `message` VALUES ('1316', '2018-06-16 23:45:12', '1078', '  df  fdf df', '1115', '3');
INSERT INTO `message` VALUES ('1317', '2018-06-16 23:48:31', '1078', '1\r<br>1\r<br>1', '1115', '4');
INSERT INTO `message` VALUES ('1318', '2018-06-16 23:48:51', '1078', '＜＞', '1115', '5');
INSERT INTO `message` VALUES ('1319', '2018-06-16 23:50:32', '1078', '1\r</br>1\r</br>1', '1115', '6');
INSERT INTO `message` VALUES ('1320', '2018-06-16 23:53:02', '1078', '＜br＞', '1115', '7');
INSERT INTO `message` VALUES ('1321', '2018-06-16 23:56:09', '1078', '1\r<br>1\r<br>1\r<br>1\r<br>', '1115', '8');
INSERT INTO `message` VALUES ('1322', '2018-06-16 23:56:22', '1078', '1            1', '1115', '9');
INSERT INTO `message` VALUES ('1323', '2018-06-17 00:01:44', '1078', '1      2', '1115', '10');
INSERT INTO `message` VALUES ('1324', '2018-06-17 00:01:59', '1078', '1     3', '1115', '11');
INSERT INTO `message` VALUES ('1325', '2018-06-17 00:04:53', '1078', '1&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp3', '1115', '12');
INSERT INTO `message` VALUES ('1326', '2018-06-17 00:05:12', '1078', '11111111\r<br>11&nbsp11&nbsp11', '1115', '13');
INSERT INTO `message` VALUES ('1327', '2018-06-17 00:06:53', '1078', '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp1', '1115', '14');
INSERT INTO `message` VALUES ('1328', '2018-06-17 01:03:40', '1081', '$video&nbspsrc=\'http://localhost:8080/Test1/upload/picture/user/1081/97083826-6ea5-492e-9544-c6e28216f4ca_%E6%97%A5%E6%9C%AC%E5%AE%98%E6%96%B9%E6%97%85%E6%B8%B8%E5%AE%A3%E4%BC%A0%E7%89%87%EF%BC%81_%E6%A0%87%E6%B8%85.mp4\'&nbspvideo$', '1115', '15');
INSERT INTO `message` VALUES ('1329', '2018-06-17 01:05:10', '1078', '\r<br><video src=\"http://localhost:8080/Test1/upload/picture/user/1081/97083826-6ea5-492e-9544-c6e28216f4ca_%E6%97%A5%E6%9C%AC%E5%AE%98%E6%96%B9%E6%97%85%E6%B8%B8%E5%AE%A3%E4%BC%A0%E7%89%87%EF%BC%81_%E6%A0%87%E6%B8%85.mp4\" controls=\"controls\"></video>', '1115', '16');
INSERT INTO `message` VALUES ('1330', '2018-06-17 01:11:07', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_%E6%B2%99%E5%AE%9D%E4%BA%AE%20-%20%E6%9A%97%E9%A6%99%20[mqms2].mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1115', '17');
INSERT INTO `message` VALUES ('1331', '2018-06-17 02:16:06', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/57837af3-fdb3-43f7-a0cd-bf041fe60f4f_1.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1115', '18');
INSERT INTO `message` VALUES ('1332', '2018-06-17 02:22:13', '1078', '<audio src=\"http://192.168.1.104:8080/Test1/upload/picture/user/1078/57837af3-fdb3-43f7-a0cd-bf041fe60f4f_1.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1115', '19');
INSERT INTO `message` VALUES ('1333', '2018-06-17 02:23:50', '1078', '<video src=\"http://192.168.1.104:8080/Test1/upload/picture/user/1081/97083826-6ea5-492e-9544-c6e28216f4ca_%E6%97%A5%E6%9C%AC%E5%AE%98%E6%96%B9%E6%97%85%E6%B8%B8%E5%AE%A3%E4%BC%A0%E7%89%87%EF%BC%81_%E6%A0%87%E6%B8%85.mp4\" controls=\"controls\"></video>', '1115', '20');
INSERT INTO `message` VALUES ('1334', '2018-06-17 02:36:53', '1078', '<audio width=\"100\" src=\"http://192.168.1.104:8080/Test1/upload/picture/user/1078/57837af3-fdb3-43f7-a0cd-bf041fe60f4f_1.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1115', '21');
INSERT INTO `message` VALUES ('1335', '2018-06-17 03:02:40', '1078', '12', '1112', '4');
INSERT INTO `message` VALUES ('1336', '2018-06-17 03:02:45', '1078', '123', '1112', '5');
INSERT INTO `message` VALUES ('1337', '2018-06-17 03:04:17', '1078', 'sfd', '1112', '6');
INSERT INTO `message` VALUES ('1338', '2018-06-17 03:04:22', '1078', 'ds', '1112', '7');
INSERT INTO `message` VALUES ('1339', '2018-06-17 03:09:29', '1078', '<video src=\"http://192.168.1.104:8080/Test1/upload/picture/user/1081/97083826-6ea5-492e-9544-c6e28216f4ca_%E6%97%A5%E6%9C%AC%E5%AE%98%E6%96%B9%E6%97%85%E6%B8%B8%E5%AE%A3%E4%BC%A0%E7%89%87%EF%BC%81_%E6%A0%87%E6%B8%85.mp4\" controls=\"controls\"></video>', '1112', '8');
INSERT INTO `message` VALUES ('1340', '2018-06-18 13:08:42', '1078', '<audio src=\"http://192.168.1.104:8080/Test1/upload/picture/user/1078/57837af3-fdb3-43f7-a0cd-bf041fe60f4f_1.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1115', '22');
INSERT INTO `message` VALUES ('1341', '2018-06-18 15:36:59', '1078', '壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。&nbsp于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。离开戒毒所分厘卡时间电风扇', '1112', '9');
INSERT INTO `message` VALUES ('1342', '2018-06-18 16:27:39', '1078', '<audio src=\"www.baidu.com\" controls=\"controls\" loop=\"loop\"></audio>', '1112', '10');
INSERT INTO `message` VALUES ('1343', '2018-06-18 16:29:15', '1078', '<video src=\"\" controls=\"controls\"></video>', '1112', '11');
INSERT INTO `message` VALUES ('1344', '2018-06-18 16:29:35', '1078', '<video src=\"www.baidu.com\" controls=\"controls\"></video>', '1112', '12');
INSERT INTO `message` VALUES ('1345', '2018-06-18 16:29:44', '1078', '<audio src=\"www.baidu.com\" controls=\"controls\" loop=\"loop\"></audio>', '1112', '13');
INSERT INTO `message` VALUES ('1346', '2018-06-18 16:39:03', '1078', '<video src=\"http://192.168.1.104:8080/Test1/upload/picture/user/1081/97083826-6ea5-492e-9544-c6e28216f4ca_%E6%97%A5%E6%9C%AC%E5%AE%98%E6%96%B9%E6%97%85%E6%B8%B8%E5%AE%A3%E4%BC%A0%E7%89%87%EF%BC%81_%E6%A0%87%E6%B8%85.mp4\" controls=\"controls\"></video>', '1112', '14');
INSERT INTO `message` VALUES ('1347', '2018-06-18 16:43:39', '1078', '<video src=\"http://localhost:8080/Test1/upload/picture/user/1078/db5c182b-1b43-480c-ae1f-34292a33ed5a_4.mp4\" controls=\"controls\"></video>', '1112', '15');
INSERT INTO `message` VALUES ('1348', '2018-06-18 16:45:08', '1078', '<video src=\"http://localhost:8080/Test1/upload/picture/user/1078/ae8450b0-efa3-4479-8cf9-dbaa06117bea_47_2826b519176277740efd436be521e53f_3.mp4\" controls=\"controls\"></video>', '1112', '16');
INSERT INTO `message` VALUES ('1349', '2018-06-18 16:49:12', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_沙宝亮%20-%20暗香%20[mqms2].mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1112', '17');
INSERT INTO `message` VALUES ('1350', '2018-06-18 16:49:35', '1078', '的路上看见分厘卡<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_沙宝亮%20-%20暗香%20[mqms2].mp3\" controls=\"controls\" loop=\"loop\"></audio>来看圣诞节分厘卡', '1112', '18');
INSERT INTO `message` VALUES ('1351', '2018-06-18 17:38:23', '1078', '<video src=\"http://localhost:8080/Test1/upload/picture/user/1078/db5c182b-1b43-480c-ae1f-34292a33ed5a_4.mp4\" controls=\"controls\"></video><audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/9364d1f5-b1a3-499f-abf1-f7d47dd491fb_%E6%B2%99%E5%AE%9D%E4%BA%AE%20-%20%E6%9A%97%E9%A6%99%20[mqms2].mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1112', '19');
INSERT INTO `message` VALUES ('1352', '2018-06-18 17:39:24', '1078', '壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。\r<br>于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。\r<br>苏子愀然，正襟危坐而问客曰：“何为其然也？”客曰：“月明星稀，乌鹊南飞，此非曹孟德之诗乎？西望夏口，东望武昌，山川相缪，郁乎苍苍，此非孟德之困于', '1112', '20');
INSERT INTO `message` VALUES ('1353', '2018-06-18 17:57:47', '1078', '壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。\r<br>＜br＞\r<br>＜br＞于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。\r<br>＜br＞\r<br>＜br＞苏子愀然，正襟危坐而问客曰：“何为其然也？”客曰：“月明星稀，乌鹊南飞，此非曹孟德之诗乎？西望夏口，东望武昌，山川相缪，郁乎苍苍，此非孟德之困于周郎者乎？方其破荆州，下江陵，顺流而东也，舳舻千里，旌旗蔽空，酾酒临江，横槊赋诗，固一世之雄也，而今安在哉？况吾与子渔樵于江渚之上，侣鱼虾而友麋鹿，驾一叶之扁舟，举匏樽以相属。寄蜉蝣于天地，渺沧海之一粟。哀吾生之须臾，羡长江之无穷。挟飞仙以遨游，抱明月而长终。知不可乎骤得，托遗响于悲风。”\r<br>＜br＞\r<br>＜br＞苏子曰：“客亦知夫水与月乎？逝者如斯，而未尝往也；盈虚者莫消长。盖将', '1112', '21');
INSERT INTO `message` VALUES ('1354', '2018-06-18 17:58:10', '1078', '\r<br>\r<br>10', '1112', '22');
INSERT INTO `message` VALUES ('1355', '2018-06-18 18:00:04', '1078', '<video src=\"http://localhost:8080/Test1/upload/picture/user/1078/0309876e-1380-4ceb-a96a-a88d01b51f49_%E3%80%90%E5%9B%9B%E6%9C%88%E6%90%9C%E5%A4%A9%E4%B8%8B%E3%80%91%E4%BF%84%E7%BD%97%E6%96%AF%E5%9B%BD%E5%AE%B6%E5%BD%A2%E8%B1%A1%E5%AE%A3%E4%BC%A0%E7%89%87%EF%BC%88%E4%B8%AD%E6%96%87%E5%AD%97%E5%B9%95%EF%BC%89_%E8%B6%85%E6%B8%85.mp4\" controls=\"controls\"></video>', '1112', '23');
INSERT INTO `message` VALUES ('1356', '2018-06-18 18:01:19', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/8ccc5b06-e988-45fa-9678-95a839cdcdbf_%E5%90%89%E7%94%B0%E6%B4%81%20%E6%97%A5%E6%9C%AC%E4%BA%BA%E7%9A%84%E9%81%A5%E8%BF%9C%E6%97%85%E9%80%94%20%E6%97%85%E7%A8%8B%E7%9A%84%E7%BB%88%E7%BB%93.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1112', '24');
INSERT INTO `message` VALUES ('1357', '2018-06-18 18:08:34', '1078', '＜＞', '1109', '2');
INSERT INTO `message` VALUES ('1358', '2018-06-18 18:09:21', '1078', '＜a&nbsphref=＂Home?id=1000＂＞秦亚祺＜/a＞', '1118', '1');
INSERT INTO `message` VALUES ('1359', '2018-06-18 18:14:39', '1078', '＜a&nbsphref=＂Home?id=1000＂＞秦亚祺＜/a＞', '1122', '1');
INSERT INTO `message` VALUES ('1360', '2018-06-18 18:16:24', '1078', '<video src=\"http://localhost:8080/Test1/upload/picture/user/1078/88e2fc3b-14be-402e-be14-aa410d30292e_32_5d124998ca4c8282d67c187a6009b6b2_3.mp4\" controls=\"controls\"></video>', '1122', '2');
INSERT INTO `message` VALUES ('1361', '2018-06-18 18:35:25', '1078', '<audio src=\"http://localhost:8080/Test1/MyPageSvl?id=1122＆timeStamp=2018-06-18%2018:16:24\" controls=\"controls\" loop=\"loop\"></audio>', '1122', '3');
INSERT INTO `message` VALUES ('1362', '2018-06-18 18:39:28', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/643cc08f-dd96-416c-ae40-634074a10150_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E%20%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1112', '25');
INSERT INTO `message` VALUES ('1363', '2018-06-18 22:47:48', '1078', '/upload/picture/user/1078/8ccc5b06-e988-45fa-9678-95a839cdcdbf_吉田洁&nbsp日本人的遥远旅途&nbsp旅程的终结.mp3<audio src=\"/upload/picture/user/1078/8ccc5b06-e988-45fa-9678-95a839cdcdbf_吉田洁&nbsp日本人的遥远旅途&nbsp旅程的终结.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1112', '26');
INSERT INTO `message` VALUES ('1364', '2018-06-19 00:03:00', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/9b2e863b-09a3-4588-ad9d-11d984c27999_8.フォールオブフォール&nbsp～&nbsp秋めく滝.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1123', '1');
INSERT INTO `message` VALUES ('1365', '2018-06-19 00:04:03', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/9b2e863b-09a3-4588-ad9d-11d984c27999_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%C2%A0%EF%BD%9E%C2%A0%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1123', '2');
INSERT INTO `message` VALUES ('1366', '2018-06-19 00:09:01', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/d3ddf2b5-24ea-4453-ab59-9c5863b6391e_BGM.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1123', '3');
INSERT INTO `message` VALUES ('1367', '2018-06-19 00:12:22', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/d3ddf2b5-24ea-4453-ab59-9c5863b6391e_BGM.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1123', '4');
INSERT INTO `message` VALUES ('1368', '2018-06-19 00:12:27', '1078', 'http://localhost:8080/Test1/upload/picture/user/1078/9b2e863b-09a3-4588-ad9d-11d984c27999_8.フォールオブフォール　～&nbsp秋めく滝.mp3', '1123', '5');
INSERT INTO `message` VALUES ('1369', '2018-06-19 00:14:33', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/2e03f893-015d-45c5-8993-0af7ae085494_沙宝亮&nbsp-&nbsp暗香&nbsp[mqms2].mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1123', '6');
INSERT INTO `message` VALUES ('1370', '2018-06-19 00:15:42', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/9b2e863b-09a3-4588-ad9d-11d984c27999_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E%20%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1123', '7');
INSERT INTO `message` VALUES ('1371', '2018-06-19 00:26:51', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/9b2e863b-09a3-4588-ad9d-11d984c27999_8.フォールオブフォール&nbsp～&nbsp秋めく滝.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1123', '8');
INSERT INTO `message` VALUES ('1372', '2018-06-19 00:27:53', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/67edc56d-1885-4e8c-94df-01c4cdb15577_AKB48&nbsp-&nbsp一歩目音頭&nbsp(第一步起舞)&nbsp[mqms2].mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1123', '9');
INSERT INTO `message` VALUES ('1373', '2018-06-19 00:29:23', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/67edc56d-1885-4e8c-94df-01c4cdb15577_AKB48%20-%20%E4%B8%80%E6%AD%A9%E7%9B%AE%E9%9F%B3%E9%A0%AD%20(%E7%AC%AC%E4%B8%80%E6%AD%A5%E8%B5%B7%E8%88%9E)%20%5Bmqms2%5D.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1123', '10');
INSERT INTO `message` VALUES ('1374', '2018-06-19 00:32:13', '1078', '<audio src=\"http%3a%2f%2flocalhost%3a8080%2fTest1%2fupload%2fpicture%2fuser%2f1078%2f9b2e863b-09a3-4588-ad9d-11d984c27999_8.%e3%83%95%e3%82%a9%e3%83%bc%e3%83%ab%e3%82%aa%e3%83%96%e3%83%95%e3%82%a9%e3%83%bc%e3%83%ab%e3%80%80%ef%bd%9e+%e7%a7%8b%e3%82%81%e3%81%8f%e6%bb%9d.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1123', '11');
INSERT INTO `message` VALUES ('1375', '2018-06-19 00:33:43', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/9b2e863b-09a3-4588-ad9d-11d984c27999_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E%20%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1123', '12');
INSERT INTO `message` VALUES ('1376', '2018-06-19 00:50:35', '1078', '<audio src=\"http://localhost:8080/Test1/upload/picture/user/1078/8b66ed50-8971-4df8-a238-416da4a14317_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E+%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1123', '13');
INSERT INTO `message` VALUES ('1377', '2018-06-19 14:25:21', '1078', '<audio src=\"http://localhost:8080/Test1/upload/user/1078/66ab30ff-4229-412a-86a1-29b418aae676_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E%20%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1123', '14');
INSERT INTO `message` VALUES ('1378', '2018-06-19 14:35:44', '1078', '<video src=\"http://localhost:8080/Test1/upload/user/1078/695848da-aea6-41f0-92e5-a1a2592f8575_E52BDAD8-7637-43C1-88EE-D8FE0E6A0227.MOV\" controls=\"controls\"></video>', '1123', '15');
INSERT INTO `message` VALUES ('1379', '2018-06-19 16:18:16', '1078', '<a href = \"http://localhost:8080/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg\"><img src=\"http://localhost:8080/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg\" style=\"max-width:1280px\"/></a>', '1121', '1');
INSERT INTO `message` VALUES ('1380', '2018-06-19 16:18:08', '1078', '<a href = \"http://localhost:8080/Test1/upload/user/1078/21a54623-fa63-440e-ab6a-8d2224f78f32_TIM%E5%9B%BE%E7%89%8720180316145534.jpg\"><img src=\"http://localhost:8080/Test1/upload/user/1078/21a54623-fa63-440e-ab6a-8d2224f78f32_TIM%E5%9B%BE%E7%89%8720180316145534.jpg\" style=\"max-width:1280px\"/></a>', '1121', '2');
INSERT INTO `message` VALUES ('1381', '2018-06-19 16:44:49', '1078', '<a href=\"http://localhost:8080/Test1/upload/user/1078/21a54623-fa63-440e-ab6a-8d2224f78f32_TIM%E5%9B%BE%E7%89%8720180316145534.jpg\"><img src=\"http://localhost:8080/Test1/upload/user/1078/21a54623-fa63-440e-ab6a-8d2224f78f32_TIM%E5%9B%BE%E7%89%8720180316145534.jpg\" style=\"max-width:800px\"/></a>', '1121', '3');
INSERT INTO `message` VALUES ('1382', '2018-06-19 16:45:26', '1078', '<a href=\"http://localhost:8080/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg\"><img src=\"http://localhost:8080/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg\" style=\"max-width:800px\"/></a>', '1121', '4');
INSERT INTO `message` VALUES ('1383', '2018-06-19 16:55:02', '1078', '<a href=\"http://localhost:8080/Test1/upload/user/1078/0fc71b3f-175a-4360-a7ba-5e9ece35730c_02ab4db185c92cc40a4f37b85a86af37_b.jpg\"><img src=\"http://localhost:8080/Test1/upload/user/1078/0fc71b3f-175a-4360-a7ba-5e9ece35730c_02ab4db185c92cc40a4f37b85a86af37_b.jpg\" style=\"max-width:800px\"/></a>', '1125', '1');
INSERT INTO `message` VALUES ('1384', '2018-06-19 16:57:50', '1078', '<audio src=\"http://localhost:8080/Test1/upload/user/1078/66ab30ff-4229-412a-86a1-29b418aae676_8.%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%82%AA%E3%83%96%E3%83%95%E3%82%A9%E3%83%BC%E3%83%AB%E3%80%80%EF%BD%9E%20%E7%A7%8B%E3%82%81%E3%81%8F%E6%BB%9D.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1125', '2');

-- ----------------------------
-- Table structure for mypage
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
) ENGINE=InnoDB AUTO_INCREMENT=1126 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mypage
-- ----------------------------
INSERT INTO `mypage` VALUES ('1042', '这是第一条帖子', '2018-05-24 17:44:43', '这是第一条帖子的第一楼', '1000', '2018-06-05 14:28:01', '53');
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
INSERT INTO `mypage` VALUES ('1086', '<%out.print(\"<td>\"+ \"--------\" + \"</td>\");%>', '2018-05-29 16:28:19', '<%out.print(\"<td>\"+ \"--------\" + \"</td>\");%>', '1070', '2018-05-29 16:28:19', '0');
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
INSERT INTO `mypage` VALUES ('1114', '两点开始减肥来看大家分厘卡电视机分厘卡分', '2018-06-16 19:48:57', '壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。 于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。离开戒毒所分厘卡时间电风扇', '1077', '2018-06-16 20:29:44', '4');
INSERT INTO `mypage` VALUES ('1115', '是先嗯哼', '2018-06-16 21:02:13', '岜那那睡女女', '1080', '2018-06-18 13:08:42', '22');
INSERT INTO `mypage` VALUES ('1116', '&nbsp壬戌之秋，游于赤', '2018-06-18 18:04:39', '\r<br>壬戌之秋，七月既望，苏子与客泛舟游于赤壁之下。清风徐来，水波不兴。举酒属客，诵明月之诗，歌窈窕之章。少焉，月出于东山之上，徘徊于斗牛之间。白露横江，水光接天。纵一苇之所如，凌万顷之茫然。浩浩乎如冯虚御风，而不知其所止；飘飘乎如遗世独立，羽化而登仙。&nbsp\r<br>＜br＞&nbsp\r<br>＜br＞于是饮酒乐甚，扣舷而歌之。歌曰：“桂棹兮兰桨，击空明兮溯流光。渺渺兮予怀，望美人兮天一方。”客有吹洞箫者，倚歌而和之。其声呜呜然，如怨如慕，如泣如诉，余音袅袅，不绝如缕。舞幽壑之潜蛟，泣孤舟之嫠妇。&nbsp\r<br>＜br＞&nbsp\r<br>＜br＞苏子愀然，正襟危坐而问客曰：“何为其然也？”客曰：“月明星稀，乌鹊南飞，此非曹孟德之诗乎？西望夏口，东望武昌，山川相缪，郁乎苍苍，此非孟德之困于周郎者乎？方其破荆州，下江陵，顺流而东也，舳舻千里，旌旗蔽空，酾酒临江，横槊赋诗，固一世之雄也，而今安在哉？况吾与子渔樵于江渚之上，侣鱼虾而友麋鹿，驾一叶之扁舟，举匏樽以相属。寄蜉蝣于天地，渺沧海之一粟。哀吾生之须臾，羡长江之无穷。挟飞仙以遨游，抱明月而长终。知不可乎骤得，托遗响于悲风。”&nbsp\r<br>＜br＞&nbsp\r<br>＜br＞苏子曰：“客亦知夫水与月乎？逝者如斯，而未尝往也；盈虚者莫消长。盖将', '1078', '2018-06-18 18:04:39', '0');
INSERT INTO `mypage` VALUES ('1117', '&nbsp&nbsp&nbsp', '2018-06-18 18:04:53', '&nbsp&nbsp&nbsp', '1078', '2018-06-18 18:04:53', '0');
INSERT INTO `mypage` VALUES ('1118', '&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp1', '2018-06-18 18:08:09', '都是防辐射地方escapeXml=＂false＂', '1078', '2018-06-18 18:09:21', '1');
INSERT INTO `mypage` VALUES ('1119', '＜a&nbsphref=＂Home?id=100', '2018-06-18 18:09:31', '＜a&nbsphref=＂Home?id=1000＂＞秦亚祺＜/a＞', '1078', '2018-06-18 18:09:31', '0');
INSERT INTO `mypage` VALUES ('1120', '＜a&nbsphref=＂Home?id=1000＂＞秦亚祺＜/a＞', '2018-06-18 18:11:42', '＜a&nbsphref=＂Home?id=1000＂＞秦亚祺＜/a＞', '1078', '2018-06-18 18:11:42', '0');
INSERT INTO `mypage` VALUES ('1121', 'what\'s&nbspyou&nbspname?', '2018-06-18 18:13:00', '1', '1078', '2018-06-19 16:45:26', '4');
INSERT INTO `mypage` VALUES ('1122', 'what\'s&nbspyou&nbspname?', '2018-06-18 18:13:22', 'sdf', '1078', '2018-06-18 18:35:25', '3');
INSERT INTO `mypage` VALUES ('1123', 'what\'s&nbspyou&nbspname?', '2018-06-18 23:33:17', '/upload/picture/user/1078/8ccc5b06-e988-45fa-9678-95a839cdcdbf_吉田洁&nbsp日本人的遥远旅途&nbsp旅程的终结.mp3<audio src=\"/upload/picture/user/1078/8ccc5b06-e988-45fa-9678-95a839cdcdbf_吉田洁&nbsp日本人的遥远旅途&nbsp旅程的终结.mp3\" controls=\"controls\" loop=\"loop\"></audio>', '1078', '2018-06-19 14:35:44', '15');
INSERT INTO `mypage` VALUES ('1124', 'win32下&nbsp如何定位内存泄漏', '2018-06-19 16:48:48', '<a href=\"http://localhost:8080/Test1/MyPageSvl?id=1121＆pageNumber=1＆pageLength=30\"><img src=\"http://localhost:8080/Test1/MyPageSvl?id=1121＆pageNumber=1＆pageLength=30\" style=\"max-width:800px\"/></a>', '1078', '2018-06-19 16:48:48', '0');
INSERT INTO `mypage` VALUES ('1125', 'win32下&nbsp如何定位内存泄漏', '2018-06-19 16:49:54', '<a href=\"http://localhost:8080/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg\"><img src=\"http://localhost:8080/Test1/upload/user/1078/d2bc0960-2681-46ce-b02f-be5f411cd06a_RedEaredSlider05.jpg\" style=\"max-width:800px\"/></a>', '1078', '2018-06-19 16:57:50', '2');

-- ----------------------------
-- Table structure for user
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
