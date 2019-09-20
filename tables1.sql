/*
 Navicat Premium Data Transfer

 Source Server         : This
 Source Server Type    : MySQL
 Source Server Version : 50553
 Source Host           : localhost:3306
 Source Schema         : tables

 Target Server Type    : MySQL
 Target Server Version : 50553
 File Encoding         : 65001

 Date: 20/09/2019 17:24:43
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '父菜单id',
  `type` tinyint(3) UNSIGNED NOT NULL DEFAULT 1 COMMENT '菜单类型;1:有界面可访问菜单,2:无界面可访问菜单,0:只作为菜单',
  `status` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT '状态;1:显示,0:不显示',
  `list_order` float NOT NULL DEFAULT 10000 COMMENT '排序',
  `app` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '应用名',
  `controller` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '控制器名',
  `action` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '操作名称',
  `param` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '额外参数',
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '菜单图标',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE,
  INDEX `parent_id`(`parent_id`) USING BTREE,
  INDEX `controller`(`controller`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 133 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '后台菜单表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录名',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '企业名',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `ip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'IP',
  `exp_date` int(11) NOT NULL COMMENT '到期时间',
  `status` int(255) NOT NULL COMMENT '0正常访问 1禁止登陆 ',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES (0, 'test', '测试', '7037e8ceaf686b8979b21e58f26674ce', 1568444887, '', 1571036886, 0);
INSERT INTO `company` VALUES (1, 'xinfucekong', '山东鑫福测控技术有限公司', '31937793b4cc5d6975c5d8ecb5f25f1d', 1568444887, '', 1571036886, 0);

-- ----------------------------
-- Table structure for recharge
-- ----------------------------
DROP TABLE IF EXISTS `recharge`;
CREATE TABLE `recharge`  (
  `id` int(11) NOT NULL,
  `company_id` int(255) NOT NULL COMMENT '公司ID',
  `recharge_time` int(11) NOT NULL COMMENT '充值时间',
  `recharge_money` int(10) NOT NULL COMMENT '充值金额',
  `type` int(2) NOT NULL COMMENT '0支付宝、1微信',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for table
-- ----------------------------
DROP TABLE IF EXISTS `table`;
CREATE TABLE `table`  (
  `id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '生成二维码的唯一ID',
  `company_id` int(11) NOT NULL COMMENT '公司ID',
  `table_head` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表头图片',
  `table_footer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表头底部',
  `create_time` int(11) NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '标文件名，方便查找',
  `update_time` int(11) NULL DEFAULT NULL,
  `status` tinyint(255) NOT NULL COMMENT '0开启 1关闭 2需要密码',
  `pwd` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '访问密码',
  `table_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '内容（\r\n1-2,2:2-2-2-2;\r\n）   \r\n\r\nOR \r\n\r\nImgUrl',
  `type` int(2) NOT NULL COMMENT '1表格 2纯图片',
  `qrcode` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '二维码地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of table
-- ----------------------------
INSERT INTO `table` VALUES ('3a063bd16afffed0c54e14d1c015301c', 0, NULL, NULL, 1568787081, '的点点滴滴', NULL, 0, NULL, '../Public/Picture/2019-09-18/5d81ca8939edb.png', 2, '/Qrcode/735143e9ff8c47def504f1ba0442df98.png');
INSERT INTO `table` VALUES ('733714cd904374584c8fb8384c57a0ea', 0, NULL, '', 1568787096, '1231231', NULL, 0, NULL, '1:2-2-2,333:3333-3333', 1, '/Qrcode/7690dd4db7a92524c684e3191919eb6b.png');
INSERT INTO `table` VALUES ('ec61d7a10e8307b8df54ce9d43b290d5', 1, NULL, NULL, 1568702482, '点点滴滴', NULL, 0, NULL, '../Public/Picture/2019-09-17/5d8080128b10d.jpg', 2, '/Qrcode/e5770a47472445b3f839a58a32b8abe5.png');
INSERT INTO `table` VALUES ('fbb4ac5a05d24ec39d96472faaa4fe55', 1, NULL, NULL, 1568701556, '111', NULL, 0, NULL, '../Public/Picture/2019-09-17/5d807c74e4e9d.jpg', 2, '/Qrcode/055e31fa43e652cb4ab6c0ee845c8d36.png');

SET FOREIGN_KEY_CHECKS = 1;
