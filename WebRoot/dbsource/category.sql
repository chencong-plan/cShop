/*
Navicat MySQL Data Transfer

Source Server         : local_mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-09-15 20:55:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类别Id',
  `parent_id` int(11) DEFAULT NULL COMMENT '父类别id当id=0时说明是根节点,一级类别',
  `name` varchar(50) DEFAULT NULL COMMENT '类别名称',
  `status` int(11) DEFAULT '1' COMMENT '类别状态1-正常,2-已废弃',
  `image_url` varchar(255) DEFAULT NULL,
  `createTime` varchar(25) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1031 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1001', '1', '家用电器', '1', null, '2017-9-14 23:15:20');
INSERT INTO `category` VALUES ('1002', '1', '数码3C', '1', null, '2017-9-14 23:16:00');
INSERT INTO `category` VALUES ('1003', '1', '服装箱包', '1', null, '2017-9-14 23:16:13');
INSERT INTO `category` VALUES ('1004', '1', '食品生鲜', '1', null, '2017-9-14 23:16:31');
INSERT INTO `category` VALUES ('1005', '1', '酒水饮料', '1', null, '2017-9-14 23:17:12');
INSERT INTO `category` VALUES ('1006', '1001', '冰箱', '1', '1006.jpg', '2017-9-14 23:18:32');
INSERT INTO `category` VALUES ('1007', '1001', '电视', '1', '1007.jpg', '2017-9-14 23:18:51');
INSERT INTO `category` VALUES ('1008', '1001', '洗衣机', '1', '1008.jpg', '2017-9-14 23:19:04');
INSERT INTO `category` VALUES ('1009', '1001', '空调', '1', '1009.jpg', '2017-9-14 23:19:24');
INSERT INTO `category` VALUES ('1010', '1001', '电热水器', '1', '1010.jpg', '2017-9-14 23:19:37');
INSERT INTO `category` VALUES ('1011', '1002', '笔记本电脑', '1', '1011.jpg', '2017-9-14 23:19:57');
INSERT INTO `category` VALUES ('1012', '1002', '手机', '1', '1012.jpg', '2017-9-14 23:20:29');
INSERT INTO `category` VALUES ('1013', '1002', '平板电脑', '1', '1013.jpg', '2017-9-14 23:20:41');
INSERT INTO `category` VALUES ('1014', '1002', '数码相机', '1', '1014.jpg', '2017-9-14 23:20:51');
INSERT INTO `category` VALUES ('1015', '1002', '3C配件', '1', '1015.jpg', '2017-9-14 23:21:03');
INSERT INTO `category` VALUES ('1016', '1003', '女装', '1', '1016.jpg', '2017-9-14 23:21:41');
INSERT INTO `category` VALUES ('1017', '1003', '帽子', '1', '1017.jpg', '2017-9-14 23:21:50');
INSERT INTO `category` VALUES ('1018', '1003', '旅行箱', '1', '1018.jpg', '2017-9-14 23:22:04');
INSERT INTO `category` VALUES ('1019', '1003', '手提包', '1', '1019.jpg', '2017-9-14 23:22:30');
INSERT INTO `category` VALUES ('1020', '1003', '保暖内衣', '1', '1020.jpg', '2017-9-14 23:22:41');
INSERT INTO `category` VALUES ('1021', '1004', '零食', '1', '1021.jpg', '2017-9-14 23:23:01');
INSERT INTO `category` VALUES ('1022', '1004', '生鲜', '1', '1022.jpg', '2017-9-14 23:23:09');
INSERT INTO `category` VALUES ('1023', '1004', '半成品菜', '1', '1023.jpg', '2017-9-14 23:23:17');
INSERT INTO `category` VALUES ('1024', '1004', '速冻食品', '1', '1024.jpg', '2017-9-14 23:23:26');
INSERT INTO `category` VALUES ('1025', '1004', '进口食品', '1', '1025.jpg', '2017-9-14 23:23:47');
INSERT INTO `category` VALUES ('1026', '1005', '白酒', '1', '1026.jpg', '2017-9-14 23:23:58');
INSERT INTO `category` VALUES ('1027', '1005', '红酒', '1', '1027.jpg', '2017-9-14 23:24:05');
INSERT INTO `category` VALUES ('1028', '1005', '饮料', '1', '1028.jpg', '2017-9-14 23:24:12');
INSERT INTO `category` VALUES ('1029', '1005', '调制鸡尾酒', '1', '1029.jpg', '2017-9-14 23:24:24');
INSERT INTO `category` VALUES ('1030', '1005', '进口洋酒', '1', '1030.jpg', '2017-9-14 23:24:37');
