/*
 Navicat Premium Data Transfer

 Source Server         : 本机mysql
 Source Server Type    : MySQL
 Source Server Version : 50717
 Source Host           : 127.0.0.1:3306
 Source Schema         : oauth2_server

 Target Server Type    : MySQL
 Target Server Version : 50717
 File Encoding         : 65001

 Date: 18/02/2020 16:14:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for k_oauth_app
-- ----------------------------
DROP TABLE IF EXISTS `k_oauth_app`;
CREATE TABLE `k_oauth_app`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `record_status` int(11) NULL DEFAULT 0,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_priority` int(11) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 0,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `application_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authorized_grant_types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auto_approve` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiration_date` datetime(0) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `resource_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `app_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `order_num` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK210h4lkd469srbl9s8r8o5lrq`(`client_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of k_oauth_app
-- ----------------------------
INSERT INTO `k_oauth_app` VALUES ('1', '2019-12-25 19:30:13', '2020-01-07 12:58:52', 0, '测试明文:tgb.258', 0, 1, 7200, NULL, 'SampleClientId 测试应用', 'ROLE_TRUSTED_CLIENT', 'authorization_code,refresh_token,password', 'user_info', 'SampleClientId', '$2a$10$tPObGDaYdEzi4ExlJctAt.S/31yKb4Eh5xRP751zjaalFWrSEzBxC', NULL, 2592000, NULL, 'user_info', 'http://client.sso.com:10480/login/oauth2/code/sso-login', 'http://client.sso.com:10480/user', NULL, 1);
INSERT INTO `k_oauth_app` VALUES ('2', '2019-12-26 09:16:48', '2020-01-07 12:58:54', 0, '测试客户1', 0, 3, 7200, NULL, '测试客户1', 'ROLE_TRUSTED_CLIENT', 'authorization_code,password,refresh_token', 'user_info', 'SampleClientId1', '$2a$10$iWF8WgXQ9BMZsnyp866H0eQKpzOY0BVcUNUggZTtSgOWkCAwFbMr.', NULL, NULL, NULL, 'user_info', 'http://a.jdsoft.com:10481/login/oauth2/code/sso-login,http://b.jdsoft.com/sso-login', 'http://b.jdsoft.com/index.htm', NULL, 2);
INSERT INTO `k_oauth_app` VALUES ('3', '2020-01-02 17:24:42', '2020-01-07 12:58:52', 0, '测试客户2', 0, 0, NULL, NULL, NULL, 'ROLE_TRUSTED_CLIENT', 'authorization_code,password,refresh_token', 'user_info', 'SampleClientId2', '$2a$10$eG8gcZ/FfD58PXgmhsnItu4SQvHZkazoSbD3Ma1yIRHkKbMnBJ8L2', NULL, NULL, NULL, 'user_info', 'http://client.sso.com:10482/login/oauth2/code/sso-login', NULL, NULL, 3);

-- ----------------------------
-- Table structure for k_oauth_client
-- ----------------------------
DROP TABLE IF EXISTS `k_oauth_client`;
CREATE TABLE `k_oauth_client`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `record_status` int(11) NULL DEFAULT 0,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_priority` int(11) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 0,
  `access_token_validity` int(11) NULL DEFAULT NULL,
  `additional_information` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `application_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `authorities` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `authorized_grant_types` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `auto_approve` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `client_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `client_secret` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expiration_date` datetime(0) NULL DEFAULT NULL,
  `refresh_token_validity` int(11) NULL DEFAULT NULL,
  `resource_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `web_server_redirect_uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_9dsoft` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK6qwoy0liiuiwjy5ffrsew0g7m`(`client_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of k_oauth_client
-- ----------------------------
INSERT INTO `k_oauth_client` VALUES (1, '2019-12-25 19:30:13', '2020-01-03 18:18:23', 0, '测试明文:tgb.258', 0, 1, 7200, NULL, 'SampleClientId 测试应用', 'ROLE_TRUSTED_CLIENT', 'authorization_code,refresh_token,password', 'user_info', 'SampleClientId', '$2a$10$tPObGDaYdEzi4ExlJctAt.S/31yKb4Eh5xRP751zjaalFWrSEzBxC', NULL, 2592000, NULL, 'user_info', 'http://client.sso.com:10480/login/oauth2/code/sso-login', 0);
INSERT INTO `k_oauth_client` VALUES (2, '2019-12-26 09:16:48', '2020-01-03 19:22:35', 0, '测试客户1', 0, 3, 7200, NULL, '测试客户1', 'ROLE_TRUSTED_CLIENT', 'authorization_code,password,refresh_token', 'user_info', 'SampleClientId1', '$2a$10$iWF8WgXQ9BMZsnyp866H0eQKpzOY0BVcUNUggZTtSgOWkCAwFbMr.', NULL, NULL, NULL, 'user_info', 'http://a.jdsoft.com:10481/login/oauth2/code/sso-login,http://b.jdsoft.com/sso-login', 0);
INSERT INTO `k_oauth_client` VALUES (3, '2020-01-02 17:24:42', '2020-01-06 09:20:44', 0, '测试客户2', 0, 0, NULL, NULL, NULL, 'ROLE_TRUSTED_CLIENT', 'authorization_code,password,refresh_token', 'user_info', 'SampleClientId2', '$2a$10$eG8gcZ/FfD58PXgmhsnItu4SQvHZkazoSbD3Ma1yIRHkKbMnBJ8L2', NULL, NULL, NULL, 'user_info', 'http://client.sso.com:10482/login/oauth2/code/sso-login', 0);

-- ----------------------------
-- Table structure for k_user
-- ----------------------------
DROP TABLE IF EXISTS `k_user`;
CREATE TABLE `k_user`  (
  `id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `record_status` int(11) NULL DEFAULT 0,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_priority` int(11) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 0,
  `account_open_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birthday` date NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `failure_count` int(11) NULL DEFAULT 0,
  `failure_time` datetime(0) NULL DEFAULT NULL,
  `lastlogintime` datetime(0) NULL DEFAULT NULL,
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pwdtype` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `regname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKkiirq9qkk3bphf8um8al5siau`(`regname`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of k_user
-- ----------------------------
INSERT INTO `k_user` VALUES ('1', '2020-01-06 20:09:14', '2020-01-06 20:09:14', 0, NULL, 0, 0, NULL, '南内环', NULL, NULL, 0, NULL, NULL, '111111', '张三', '$2a$10$LJIDUFLEo5pox8KnruUHWeBg55doRU1AuIP/7o.t77oTS751R.Y6O', NULL, NULL, NULL, 'zhangsan');
INSERT INTO `k_user` VALUES ('3', '2020-01-06 20:09:14', '2020-01-06 20:09:14', 0, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, '李四', '$2a$10$gcrWom7ubcRaVD1.6ZIrIeJP0mtPLH5J9V/.8Qth59lZ4B/5HMq96', NULL, NULL, NULL, 'lisi');

-- ----------------------------
-- Table structure for k_user_apps
-- ----------------------------
DROP TABLE IF EXISTS `k_user_apps`;
CREATE TABLE `k_user_apps`  (
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `app_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of k_user_apps
-- ----------------------------
INSERT INTO `k_user_apps` VALUES ('1', '1');
INSERT INTO `k_user_apps` VALUES ('1', '2');
INSERT INTO `k_user_apps` VALUES ('3', '1');
INSERT INTO `k_user_apps` VALUES ('3', '3');

-- ----------------------------
-- Table structure for k_user_roles
-- ----------------------------
DROP TABLE IF EXISTS `k_user_roles`;
CREATE TABLE `k_user_roles`  (
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of k_user_roles
-- ----------------------------
INSERT INTO `k_user_roles` VALUES ('1', '1');
INSERT INTO `k_user_roles` VALUES ('3', '3');

-- ----------------------------
-- Table structure for login_history_entity
-- ----------------------------
DROP TABLE IF EXISTS `login_history_entity`;
CREATE TABLE `login_history_entity`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `record_status` int(11) NULL DEFAULT 0,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_priority` int(11) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 0,
  `client_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `device` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `username` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_username`(`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of login_history_entity
-- ----------------------------
INSERT INTO `login_history_entity` VALUES ('1', '2019-12-25 19:29:49', '2019-12-25 19:29:49', 0, '用户名和密码不匹配', 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '0:0:0:0:0:0:0:1', 'aa');
INSERT INTO `login_history_entity` VALUES ('112', '2019-12-31 09:57:12', '2019-12-31 09:57:12', 0, '验证码错误！', 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('113', '2019-12-31 09:57:17', '2019-12-31 09:57:17', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('114', '2019-12-31 09:59:12', '2019-12-31 09:59:12', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('138', '2019-12-31 14:35:16', '2019-12-31 14:35:16', 0, '验证码错误！', 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('139', '2019-12-31 14:35:23', '2019-12-31 14:35:23', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('140', '2019-12-31 14:38:42', '2019-12-31 14:38:42', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('141', '2019-12-31 14:46:22', '2019-12-31 14:46:22', 0, '验证码错误！', 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('142', '2019-12-31 14:46:26', '2019-12-31 14:46:26', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('143', '2020-01-02 12:23:26', '2020-01-02 12:23:26', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('144', '2020-01-02 12:24:12', '2020-01-02 12:24:12', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('145', '2020-01-02 12:25:22', '2020-01-02 12:25:22', 0, '验证码错误！', 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('146', '2020-01-02 12:25:30', '2020-01-02 12:25:30', 0, '用户名和密码不匹配', 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('20', '2019-12-26 10:04:07', '2019-12-26 10:04:07', 0, '验证码错误！', 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '0:0:0:0:0:0:0:1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('21', '2019-12-26 10:04:13', '2019-12-26 10:04:13', 0, '验证码错误！', 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '0:0:0:0:0:0:0:1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('211', '2020-01-03 18:36:01', '2020-01-03 18:36:01', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36 Edg/79.0.309.56', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('22', '2019-12-26 10:04:19', '2019-12-26 10:04:19', 0, '用户名和密码不匹配', 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '0:0:0:0:0:0:0:1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('227', '2020-01-06 16:48:07', '2020-01-06 16:48:07', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('228', '2020-01-06 17:33:39', '2020-01-06 17:33:39', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('37', '2019-12-26 11:52:18', '2019-12-26 11:52:18', 0, '验证码错误！', 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('38', '2019-12-26 11:52:24', '2019-12-26 11:52:24', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('39', '2019-12-26 12:05:10', '2019-12-26 12:05:10', 0, '验证码错误！', 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('40', '2019-12-26 12:05:17', '2019-12-26 12:05:17', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028098170537694017053b69b940000', '2020-02-17 23:14:01', '2020-02-17 23:14:01', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('402809817055ed71017055ef5ec50000', '2020-02-18 09:35:16', '2020-02-18 09:35:16', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('402809817055ed710170561ce4470001', '2020-02-18 10:24:59', '2020-02-18 10:24:59', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('402809817055ed710170561d179f0002', '2020-02-18 10:25:12', '2020-02-18 10:25:12', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('402809817055ed710170562070060003', '2020-02-18 10:28:51', '2020-02-18 10:28:51', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('402809817055ed71017056217fed0004', '2020-02-18 10:30:01', '2020-02-18 10:30:01', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('402809817055ed710170564db2960005', '2020-02-18 11:18:17', '2020-02-18 11:18:17', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('402809817055ed710170564e454e0006', '2020-02-18 11:18:55', '2020-02-18 11:18:55', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('402809817055ed7101705679cb0e0007', '2020-02-18 12:06:27', '2020-02-18 12:06:27', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('402809817055ed710170567b1b590008', '2020-02-18 12:07:53', '2020-02-18 12:07:53', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('402809817055ed710170573b4c660009', '2020-02-18 15:37:49', '2020-02-18 15:37:49', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('402809817055ed710170573cbfca000a', '2020-02-18 15:39:24', '2020-02-18 15:39:24', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f7acad6016f7ad253c70006', '2020-01-06 20:26:42', '2020-01-06 20:26:42', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f7acad6016f7ad464ed0007', '2020-01-06 20:28:57', '2020-01-06 20:28:57', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f7acad6016f7ad8065f0008', '2020-01-06 20:32:55', '2020-01-06 20:32:55', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f7ae18d016f7ae1ed940000', '2020-01-06 20:43:44', '2020-01-06 20:43:44', 0, '用户名和密码不匹配', 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f7ae18d016f7ae50efb0004', '2020-01-06 20:47:10', '2020-01-06 20:47:10', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f7ae905016f7aef1ccc0000', '2020-01-06 20:58:08', '2020-01-06 20:58:08', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f7ae905016f7af526ea0001', '2020-01-06 21:04:44', '2020-01-06 21:04:44', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/78.0.3904.108 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f7d8461016f7d898c600000', '2020-01-07 09:06:04', '2020-01-07 09:06:04', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f7d8c51016f7e4b3d4e0000', '2020-01-07 12:37:38', '2020-01-07 12:37:38', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f7e6167016f7e625aea0000', '2020-01-07 13:02:53', '2020-01-07 13:02:53', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f7e6167016f7e62a6ba0001', '2020-01-07 13:03:12', '2020-01-07 13:03:12', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f7e6167016f7e62f4790002', '2020-01-07 13:03:32', '2020-01-07 13:03:32', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f7e6167016f7f1718ab0003', '2020-01-07 16:20:18', '2020-01-07 16:20:18', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f7e6167016f7f926cf90004', '2020-01-07 18:35:00', '2020-01-07 18:35:00', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');
INSERT INTO `login_history_entity` VALUES ('4028802a6f843d5b016f8933e1f70000', '2020-01-09 15:27:56', '2020-01-09 15:27:56', 1, NULL, 0, 0, NULL, 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36', '127.0.0.1', 'zhangsan');

-- ----------------------------
-- Table structure for role_entity
-- ----------------------------
DROP TABLE IF EXISTS `role_entity`;
CREATE TABLE `role_entity`  (
  `id` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `record_status` int(11) NULL DEFAULT 0,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_priority` int(11) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 0,
  `role_name` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_9dsoft` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK6tqlgmw16egvfr70ndgd9nqyf`(`role_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role_entity
-- ----------------------------
INSERT INTO `role_entity` VALUES ('1', '2019-12-25 19:30:13', '2019-12-25 19:30:13', 0, NULL, 0, 0, 'ROLE_SUPER', 0);
INSERT INTO `role_entity` VALUES ('2', '2019-12-25 19:30:13', '2019-12-25 19:30:13', 0, NULL, 0, 0, 'ROLE_ADMIN', 0);
INSERT INTO `role_entity` VALUES ('3', '2019-12-25 19:30:13', '2019-12-25 19:30:13', 0, NULL, 0, 0, 'ROLE_USER', 0);

-- ----------------------------
-- Table structure for scope_definition_entity
-- ----------------------------
DROP TABLE IF EXISTS `scope_definition_entity`;
CREATE TABLE `scope_definition_entity`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `record_status` int(11) NULL DEFAULT 0,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_priority` int(11) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 0,
  `definition` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_9dsoft` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKn908i6w2068oq5vs137q55ud6`(`scope`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of scope_definition_entity
-- ----------------------------
INSERT INTO `scope_definition_entity` VALUES (1, '2019-12-25 19:30:13', '2019-12-25 19:30:13', 0, NULL, 0, 0, '昵称、头像、性别信息', 'user_info', 0);

-- ----------------------------
-- Table structure for third_party_account_entity
-- ----------------------------
DROP TABLE IF EXISTS `third_party_account_entity`;
CREATE TABLE `third_party_account_entity`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  `last_modified` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0),
  `record_status` int(11) NULL DEFAULT 0,
  `remarks` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort_priority` int(11) NULL DEFAULT 0,
  `version` int(11) NULL DEFAULT 0,
  `account_open_code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nick_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `third_party` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `third_party_account_id` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_9dsoft` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKteg9nl8ovi8h8b69i4li6m2nx`(`third_party`, `third_party_account_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for third_party_account_entity_roles
-- ----------------------------
DROP TABLE IF EXISTS `third_party_account_entity_roles`;
CREATE TABLE `third_party_account_entity_roles`  (
  `third_party_account_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
