/*
 Navicat Premium Data Transfer

 Source Server         : 本地MySQL
 Source Server Type    : MySQL
 Source Server Version : 80034
 Source Host           : localhost:3306
 Source Schema         : db_hebao_counter

 Target Server Type    : MySQL
 Target Server Version : 80034
 File Encoding         : 65001

 Date: 04/12/2023 22:22:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_account
-- ----------------------------
DROP TABLE IF EXISTS `tb_account`;
CREATE TABLE `tb_account` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '账号id',
  `username` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '密码',
  `role` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '普通用户' COMMENT '角色',
  `nick_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '昵称',
  `avatar` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'default.png' COMMENT '头像',
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '电话',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '注册日期',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新日期',
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '正常' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_account
-- ----------------------------
BEGIN;
INSERT INTO `tb_account` (`id`, `username`, `password`, `role`, `nick_name`, `avatar`, `email`, `phone`, `create_time`, `update_time`, `status`) VALUES (1, 'admin', '769d29757b39237e596cf841a56b948d', 'VIP', '浩哲', 'myavatar.png', 'dihaozhe@outlook.com', '18598866404', '2023-12-04 22:20:41', '2023-12-04 22:21:53', '正常');
COMMIT;

-- ----------------------------
-- Table structure for tb_asset
-- ----------------------------
DROP TABLE IF EXISTS `tb_asset`;
CREATE TABLE `tb_asset` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '资产id',
  `account_id` int DEFAULT NULL COMMENT '用户id',
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资产类型',
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '资产名称',
  `money` decimal(10,2) DEFAULT NULL COMMENT '资产余额',
  `money_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '人民币' COMMENT '币种',
  `is_include` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '是' COMMENT '计入总资产',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '正常' COMMENT '状态',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_asset
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for tb_bill
-- ----------------------------
DROP TABLE IF EXISTS `tb_bill`;
CREATE TABLE `tb_bill` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '账单id',
  `account_id` int DEFAULT NULL COMMENT '用户id',
  `asset_id` int DEFAULT NULL COMMENT '资产id',
  `bill_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账单类型',
  `bill_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账单分类',
  `description` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '账单备注',
  `money` decimal(10,2) DEFAULT NULL COMMENT '账单金额',
  `time` datetime DEFAULT NULL COMMENT '账单时间',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `status` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '正常' COMMENT '账单状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- ----------------------------
-- Records of tb_bill
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
