/*
Navicat MySQL Data Transfer

Source Server         : local_mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : shopping

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2017-09-19 13:41:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for business_info
-- ----------------------------
DROP TABLE IF EXISTS `business_info`;
CREATE TABLE `business_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商家主键 自增id',
  `name` varchar(50) DEFAULT NULL COMMENT '店铺名称',
  `phone` varchar(20) DEFAULT NULL COMMENT '店铺电话',
  `address` varchar(255) DEFAULT NULL COMMENT '店铺地址',
  `describe` varchar(255) DEFAULT NULL COMMENT '商家店铺描述信息字段',
  `updateTime` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of business_info
-- ----------------------------

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `quantity` int(11) DEFAULT NULL COMMENT '数量',
  `createTime` varchar(25) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('1', '1', '2', '9', '2017-09-19 11:23:21');
INSERT INTO `cart` VALUES ('2', '1', '1', '6', '2017-09-19 10:35:20');
INSERT INTO `cart` VALUES ('3', '1', '4', '4', '2017-09-19 11:37:52');
INSERT INTO `cart` VALUES ('4', '1', '3', '3', '2017-09-19 11:25:17');

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

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `parentId` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '被评论的商品的id',
  `comment` text,
  `status` int(11) DEFAULT NULL,
  `createTime` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
  `order_no` bigint(20) DEFAULT NULL COMMENT '订单号',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `shipping_id` int(11) DEFAULT NULL COMMENT '收货地址编号',
  `payment` decimal(20,2) DEFAULT NULL COMMENT '实际付款金额,单位是元,保留两位小数',
  `status` int(10) DEFAULT NULL COMMENT '订单状态:0-已取消-10-未付款，20-已付款，40-已发货，50-交易成功，60-交易关闭',
  `payment_time` varchar(25) DEFAULT NULL COMMENT '支付时间',
  `send_time` varchar(25) DEFAULT NULL COMMENT '发货时间',
  `end_time` varchar(25) DEFAULT NULL COMMENT '交易完成时间',
  `createTime` varchar(25) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '订单子表id',
  `user_id` int(11) DEFAULT NULL,
  `order_no` bigint(20) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL COMMENT '商品id',
  `product_name` varchar(100) DEFAULT NULL COMMENT '商品名称',
  `product_image` varchar(500) DEFAULT NULL COMMENT '商品图片地址',
  `unit_price` decimal(20,2) DEFAULT NULL COMMENT '生成订单时的商品单价，单位是元,保留两位小数',
  `quantity` int(10) DEFAULT NULL COMMENT '商品数量',
  `total_price` decimal(20,2) DEFAULT NULL COMMENT '商品总价,单位是元,保留两位小数',
  `createTime` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `category_id` int(11) NOT NULL COMMENT '分类id,对应mmall_category表的主键',
  `name` varchar(100) NOT NULL COMMENT '商品名称',
  `subtitle` varchar(200) DEFAULT NULL COMMENT '商品副标题',
  `main_image` varchar(500) DEFAULT NULL COMMENT '产品主图,url相对地址',
  `sub_images` text COMMENT '图片地址,json格式,扩展用',
  `detail` text COMMENT '商品详情',
  `price` decimal(20,2) NOT NULL COMMENT '价格,单位-元保留两位小数',
  `stock` int(11) NOT NULL COMMENT '库存数量',
  `status` int(6) DEFAULT '1' COMMENT '商品状态.1-在售 2-下架 3-删除',
  `createTime` varchar(25) DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '1021', '三只松鼠', '开心果225g休闲零食坚果特产无漂白2件起售', '0cf7e53e-8c2d-4d9c-ab15-419d555b44dc.png', '', '开心果225g休闲零食坚果特产无漂白2件起售', '27.90', '100', '1', '2017-9-15 10:39:38');
INSERT INTO `product` VALUES ('2', '1021', '三只松鼠', '开心果225g休闲零食坚果特产无漂白2件起售', '0cf7e53e-8c2d-4d9c-ab15-419d555b44dc.png', '', '开心果225g休闲零食坚果特产无漂白2件起售', '27.90', '100', '1', '2017-9-15 10:39:38');
INSERT INTO `product` VALUES ('3', '1021', '三只松鼠', '开心果225g休闲零食坚果特产无漂白2件起售', '0cf7e53e-8c2d-4d9c-ab15-419d555b44dc.png', '', '开心果225g休闲零食坚果特产无漂白2件起售', '27.90', '100', '1', '2017-9-15 10:39:38');
INSERT INTO `product` VALUES ('4', '1021', '三只松鼠', '开心果225g休闲零食坚果特产无漂白2件起售', '0cf7e53e-8c2d-4d9c-ab15-419d555b44dc.png', '', '开心果225g休闲零食坚果特产无漂白2件起售', '27.90', '100', '1', '2017-9-15 10:39:38');
INSERT INTO `product` VALUES ('5', '1021', '三只松鼠', '开心果225g休闲零食坚果特产无漂白2件起售', '0cf7e53e-8c2d-4d9c-ab15-419d555b44dc.png', '', '开心果225g休闲零食坚果特产无漂白2件起售', '27.90', '100', '1', '2017-9-15 10:39:38');
INSERT INTO `product` VALUES ('6', '1021', '三只松鼠', '开心果225g休闲零食坚果特产无漂白2件起售', '0cf7e53e-8c2d-4d9c-ab15-419d555b44dc.png', '', '开心果225g休闲零食坚果特产无漂白2件起售', '27.90', '100', '1', '2017-9-15 10:39:38');
INSERT INTO `product` VALUES ('7', '1021', '三只松鼠', '开心果225g休闲零食坚果特产无漂白2件起售', '0cf7e53e-8c2d-4d9c-ab15-419d555b44dc.png', '', '开心果225g休闲零食坚果特产无漂白2件起售', '27.90', '100', '1', '2017-9-15 10:39:38');
INSERT INTO `product` VALUES ('8', '1021', '三只松鼠', '开心果225g休闲零食坚果特产无漂白2件起售', '0cf7e53e-8c2d-4d9c-ab15-419d555b44dc.png', '', '开心果225g休闲零食坚果特产无漂白2件起售', '27.90', '100', '1', '2017-9-15 10:39:38');
INSERT INTO `product` VALUES ('9', '1021', '三只松鼠', '开心果225g休闲零食坚果特产无漂白2件起售', '0cf7e53e-8c2d-4d9c-ab15-419d555b44dc.png', '', '开心果225g休闲零食坚果特产无漂白2件起售', '27.90', '100', '1', '2017-9-15 10:39:38');
INSERT INTO `product` VALUES ('10', '1021', '三只松鼠', '开心果225g休闲零食坚果特产无漂白2件起售', '0cf7e53e-8c2d-4d9c-ab15-419d555b44dc.png', '', '开心果225g休闲零食坚果特产无漂白2件起售', '27.90', '100', '1', '2017-9-15 10:39:38');

-- ----------------------------
-- Table structure for shipping
-- ----------------------------
DROP TABLE IF EXISTS `shipping`;
CREATE TABLE `shipping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `name` varchar(20) DEFAULT NULL COMMENT '收货姓名',
  `phone` varchar(20) DEFAULT NULL COMMENT '收货固定电话',
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `district` varchar(20) DEFAULT NULL COMMENT '区/县',
  `address` varchar(200) DEFAULT NULL COMMENT '详细地址',
  `createTime` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shipping
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '用户密码，MD5加密',
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL COMMENT '找回密码问题',
  `answer` varchar(100) DEFAULT NULL COMMENT '找回密码答案',
  `role` int(4) NOT NULL COMMENT '角色0-管理员,1-普通用户',
  `status` int(11) DEFAULT NULL COMMENT '用户状态，是否激活；0-已激活  1-未激活',
  `activeKey` varchar(100) DEFAULT NULL COMMENT '邮箱验证时候产生的激活码',
  `createTime` varchar(25) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '202CB962AC59075B964B07152D234B70', '', null, '问题', '答案', '0', '0', null, '2017-9-12 14:46:29');
INSERT INTO `user` VALUES ('2', 'chencong', 'E10ADC3949BA59ABBE56E057F20F883E', '1042738887@qq.com', '1234567890', '问题', '答案', '1', '1', '106c11f8cb2b4b40b102a57008ad00a7', '2017-09-14 10:12:22');
INSERT INTO `user` VALUES ('7', 'ccoder', '202CB962AC59075B964B07152D234B70', '1042738887@qq.com', '123456789', '问题', '答案', '1', '0', 'fae6c17b8a65415a8dd431dc3fbba070', '2017-09-15 11:00:19');
