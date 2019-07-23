/*
 Navicat Premium Data Transfer

 Source Server         : homestead
 Source Server Type    : MySQL
 Source Server Version : 50722
 Source Host           : 127.0.0.1:33060
 Source Schema         : shopApi

 Target Server Type    : MySQL
 Target Server Version : 50722
 File Encoding         : 65001

 Date: 23/07/2019 18:01:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, '首页', 'fa-bar-chart', '/', NULL, NULL, '2019-07-23 08:10:11');
INSERT INTO `admin_menu` VALUES (2, 0, 2, '系统管理', 'fa-tasks', NULL, NULL, NULL, '2019-07-23 08:10:26');
INSERT INTO `admin_menu` VALUES (3, 2, 3, '用户管理', 'fa-users', 'auth/users', NULL, NULL, '2019-07-23 08:10:35');
INSERT INTO `admin_menu` VALUES (4, 2, 4, '角色', 'fa-user', 'auth/roles', NULL, NULL, '2019-07-23 08:10:40');
INSERT INTO `admin_menu` VALUES (5, 2, 5, '权限', 'fa-ban', 'auth/permissions', NULL, NULL, '2019-07-23 08:10:45');
INSERT INTO `admin_menu` VALUES (6, 2, 6, '菜单', 'fa-bars', 'auth/menu', NULL, NULL, '2019-07-23 08:10:53');
INSERT INTO `admin_menu` VALUES (7, 2, 7, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, '2019-07-23 08:10:59');
INSERT INTO `admin_menu` VALUES (8, 0, 0, '用户管理', 'fa-users', '/users', NULL, '2019-07-23 08:13:41', '2019-07-23 08:13:41');
INSERT INTO `admin_menu` VALUES (9, 0, 0, '商品管理', 'fa-cubes', '/products', NULL, '2019-07-23 08:26:10', '2019-07-23 08:26:10');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-07-23 08:09:35', '2019-07-23 08:09:35');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:09:55', '2019-07-23 08:09:55');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin/auth/menu/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:10:04', '2019-07-23 08:10:04');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:10:06', '2019-07-23 08:10:06');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin/auth/menu/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:10:07', '2019-07-23 08:10:07');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/auth/menu/1', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u9996\\u9875\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"NCKxNJ26HAwl0MfwLlNwmF5YMG04jEZVhmCtRwb5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shopapi.test\\/admin\\/auth\\/menu\"}', '2019-07-23 08:10:11', '2019-07-23 08:10:11');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-23 08:10:11', '2019-07-23 08:10:11');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/auth/menu/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:10:21', '2019-07-23 08:10:21');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/auth/menu/2', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"NCKxNJ26HAwl0MfwLlNwmF5YMG04jEZVhmCtRwb5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shopapi.test\\/admin\\/auth\\/menu\"}', '2019-07-23 08:10:26', '2019-07-23 08:10:26');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-23 08:10:26', '2019-07-23 08:10:26');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/auth/menu/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:10:28', '2019-07-23 08:10:28');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/auth/menu/3', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"NCKxNJ26HAwl0MfwLlNwmF5YMG04jEZVhmCtRwb5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shopapi.test\\/admin\\/auth\\/menu\"}', '2019-07-23 08:10:35', '2019-07-23 08:10:35');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-23 08:10:35', '2019-07-23 08:10:35');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/auth/menu/4/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:10:36', '2019-07-23 08:10:36');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/auth/menu/4', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"NCKxNJ26HAwl0MfwLlNwmF5YMG04jEZVhmCtRwb5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shopapi.test\\/admin\\/auth\\/menu\"}', '2019-07-23 08:10:40', '2019-07-23 08:10:40');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-23 08:10:40', '2019-07-23 08:10:40');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/auth/menu/5/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:10:42', '2019-07-23 08:10:42');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/auth/menu/5', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"NCKxNJ26HAwl0MfwLlNwmF5YMG04jEZVhmCtRwb5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shopapi.test\\/admin\\/auth\\/menu\"}', '2019-07-23 08:10:45', '2019-07-23 08:10:45');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-23 08:10:45', '2019-07-23 08:10:45');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/menu/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:10:51', '2019-07-23 08:10:51');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/auth/menu/6', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"NCKxNJ26HAwl0MfwLlNwmF5YMG04jEZVhmCtRwb5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shopapi.test\\/admin\\/auth\\/menu\"}', '2019-07-23 08:10:53', '2019-07-23 08:10:53');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-23 08:10:53', '2019-07-23 08:10:53');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/auth/menu/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:10:55', '2019-07-23 08:10:55');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/auth/menu/7', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"NCKxNJ26HAwl0MfwLlNwmF5YMG04jEZVhmCtRwb5\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shopapi.test\\/admin\\/auth\\/menu\"}', '2019-07-23 08:10:59', '2019-07-23 08:10:59');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-23 08:10:59', '2019-07-23 08:10:59');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:13:29', '2019-07-23 08:13:29');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"NCKxNJ26HAwl0MfwLlNwmF5YMG04jEZVhmCtRwb5\"}', '2019-07-23 08:13:41', '2019-07-23 08:13:41');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-23 08:13:42', '2019-07-23 08:13:42');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-23 08:13:43', '2019-07-23 08:13:43');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:13:45', '2019-07-23 08:13:45');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:25:55', '2019-07-23 08:25:55');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u5546\\u54c1\\u7ba1\\u7406\",\"icon\":\"fa-cubes\",\"uri\":\"\\/products\",\"roles\":[null],\"permission\":null,\"_token\":\"NCKxNJ26HAwl0MfwLlNwmF5YMG04jEZVhmCtRwb5\"}', '2019-07-23 08:26:10', '2019-07-23 08:26:10');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-23 08:26:11', '2019-07-23 08:26:11');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-23 08:26:12', '2019-07-23 08:26:12');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:26:13', '2019-07-23 08:26:13');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2019-07-23 08:30:55', '2019-07-23 08:30:55');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:30:56', '2019-07-23 08:30:56');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2019-07-23 08:31:05', '2019-07-23 08:31:05');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2019-07-23 08:31:17', '2019-07-23 08:31:17');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2019-07-23 08:31:55', '2019-07-23 08:31:55');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2019-07-23 08:31:57', '2019-07-23 08:31:57');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:31:58', '2019-07-23 08:31:58');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2019-07-23 08:31:59', '2019-07-23 08:31:59');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:32:07', '2019-07-23 08:32:07');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2019-07-23 08:33:21', '2019-07-23 08:33:21');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:34:03', '2019-07-23 08:34:03');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2019-07-23 08:34:07', '2019-07-23 08:34:07');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/products/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:34:09', '2019-07-23 08:34:09');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2019-07-23 08:34:20', '2019-07-23 08:34:20');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2019-07-23 08:34:31', '2019-07-23 08:34:31');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2019-07-23 08:34:38', '2019-07-23 08:34:38');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2019-07-23 08:35:50', '2019-07-23 08:35:50');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/products/create', 'GET', '192.168.10.1', '[]', '2019-07-23 08:35:57', '2019-07-23 08:35:57');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/products', 'POST', '192.168.10.1', '{\"title\":\"IPhone X\",\"description\":\"<p>12312313```sdasdasdasd```<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"new_1\":{\"title\":\"IPhone X  \\u4e00\\u53f0\",\"description\":\"\\u4f18\\u60e0\\u4ef7\",\"price\":\"10\",\"stock\":\"100\",\"id\":null,\"_remove_\":\"0\"}},\"_token\":\"NCKxNJ26HAwl0MfwLlNwmF5YMG04jEZVhmCtRwb5\"}', '2019-07-23 08:37:26', '2019-07-23 08:37:26');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2019-07-23 08:37:26', '2019-07-23 08:37:26');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2019-07-23 08:37:28', '2019-07-23 08:37:28');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2019-07-23 08:38:02', '2019-07-23 08:38:02');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2019-07-23 08:38:21', '2019-07-23 08:38:21');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2019-07-23 08:38:30', '2019-07-23 08:38:30');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-23 08:38:31', '2019-07-23 08:38:31');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '[]', '2019-07-23 08:38:46', '2019-07-23 08:38:46');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2019-07-23 08:08:48', '2019-07-23 08:08:48');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$xwuihaZmYdl8m5lS541AMuLh1c1nbF1Evr2qEQ8gfS708WrN7Fsxi', 'Administrator', NULL, 'vh3YLm3ZBPvNWYkexEPrwYHj3zqpb4rHrRNBIIPCSLmArJjKrTsiFcsRJl1Q', '2019-07-23 08:08:48', '2019-07-23 08:08:48');

-- ----------------------------
-- Table structure for cart_items
-- ----------------------------
DROP TABLE IF EXISTS `cart_items`;
CREATE TABLE `cart_items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_sku_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cart_items_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `cart_items_product_sku_id_foreign`(`product_sku_id`) USING BTREE,
  CONSTRAINT `cart_items_product_sku_id_foreign` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cart_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_06_01_000001_create_oauth_auth_codes_table', 2);
INSERT INTO `migrations` VALUES (4, '2016_06_01_000002_create_oauth_access_tokens_table', 2);
INSERT INTO `migrations` VALUES (5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 2);
INSERT INTO `migrations` VALUES (6, '2016_06_01_000004_create_oauth_clients_table', 2);
INSERT INTO `migrations` VALUES (7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 2);
INSERT INTO `migrations` VALUES (8, '2019_07_23_073121_create_user_addresses_table', 3);
INSERT INTO `migrations` VALUES (9, '2016_01_04_173148_create_admin_tables', 4);
INSERT INTO `migrations` VALUES (10, '2019_07_23_081452_create_products_table', 5);
INSERT INTO `migrations` VALUES (11, '2019_07_23_081526_create_product_skus_table', 5);
INSERT INTO `migrations` VALUES (12, '2019_07_23_090714_create_user_favorite_products_table', 6);
INSERT INTO `migrations` VALUES (14, '2019_07_23_092539_create_cart_items_table', 7);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for product_skus
-- ----------------------------
DROP TABLE IF EXISTS `product_skus`;
CREATE TABLE `product_skus`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '详情',
  `price` decimal(10, 2) NOT NULL,
  `stock` int(10) UNSIGNED NOT NULL COMMENT '库存',
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `product_skus_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `product_skus_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 92 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_skus
-- ----------------------------
INSERT INTO `product_skus` VALUES (1, 'IPhone X  一台', '优惠价', 10.00, 100, 1, '2019-07-23 08:37:26', '2019-07-23 08:37:26');
INSERT INTO `product_skus` VALUES (2, 'voluptates', 'Et consequuntur a provident labore id sed.', 7615.00, 61006, 2, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (3, 'voluptatem', 'Rem earum cum eos qui exercitationem incidunt hic.', 9477.00, 28769, 2, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (4, 'iure', 'At eum quos aut ea.', 6093.00, 42023, 2, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (5, 'dolores', 'Consequatur molestias officia sequi.', 7110.00, 26696, 3, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (6, 'quia', 'In ut atque voluptatem enim et iusto veritatis inventore.', 4413.00, 27369, 3, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (7, 'laudantium', 'Voluptates rerum nihil repudiandae nam.', 7266.00, 73063, 3, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (8, 'aspernatur', 'Possimus dolores dicta sint nemo natus.', 8515.00, 94108, 4, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (9, 'eum', 'Assumenda eaque sunt omnis perspiciatis expedita.', 8068.00, 20579, 4, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (10, 'suscipit', 'Recusandae aliquam recusandae repellendus voluptate dignissimos voluptas.', 7707.00, 39820, 4, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (11, 'nemo', 'Quidem et distinctio magnam.', 8596.00, 37329, 5, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (12, 'explicabo', 'Porro doloremque architecto qui beatae dolor eligendi quo.', 8885.00, 50996, 5, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (13, 'dignissimos', 'A molestiae alias dolores molestias at deleniti.', 1116.00, 9417, 5, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (14, 'natus', 'Amet deserunt quasi qui sint est.', 5100.00, 27402, 6, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (15, 'neque', 'Laborum magnam unde ipsam doloribus accusantium quos repellat.', 4487.00, 65806, 6, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (16, 'est', 'Quibusdam ab consequatur et pariatur vitae commodi ratione.', 1426.00, 16372, 6, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (17, 'quis', 'Illo voluptatem consequatur ea.', 2305.00, 39577, 7, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (18, 'maiores', 'Sequi officiis aut quia.', 1050.00, 41523, 7, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (19, 'exercitationem', 'Voluptas aspernatur et non doloremque provident facilis voluptatem.', 3097.00, 12281, 7, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (20, 'omnis', 'Ex aut laborum dolorem omnis iste.', 5567.00, 87292, 8, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (21, 'esse', 'Velit dolor rerum beatae possimus sapiente voluptas.', 1312.00, 98976, 8, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (22, 'repellendus', 'Enim qui aut esse corporis voluptatem.', 6204.00, 47565, 8, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (23, 'sit', 'Dicta qui vel laudantium qui vitae eius.', 2676.00, 27616, 9, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (24, 'vero', 'Repudiandae est consequatur asperiores ullam temporibus laudantium hic.', 2880.00, 53782, 9, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (25, 'qui', 'Cumque quae iure quae rem.', 5440.00, 30737, 9, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (26, 'natus', 'Sed omnis velit nam harum laboriosam.', 9026.00, 44321, 10, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (27, 'eum', 'Reprehenderit harum sed rerum est saepe nobis.', 6009.00, 45367, 10, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (28, 'labore', 'Vitae dolorum facere est quibusdam aspernatur ut.', 6652.00, 68073, 10, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (29, 'et', 'Pariatur quos explicabo eos blanditiis et voluptas voluptatum.', 4417.00, 35257, 11, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (30, 'aspernatur', 'Porro doloribus exercitationem nihil et et minima.', 7757.00, 54493, 11, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (31, 'accusantium', 'Quibusdam commodi atque voluptas sit.', 8055.00, 91265, 11, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (32, 'molestias', 'Similique iusto facere blanditiis dolor ab omnis iusto.', 1307.00, 30897, 12, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (33, 'beatae', 'Assumenda qui aut vel sed enim qui.', 4678.00, 25387, 12, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (34, 'ut', 'Ut veritatis perspiciatis ullam sint sint unde.', 3756.00, 42214, 12, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (35, 'magni', 'Perspiciatis ipsum voluptas a magni sint molestiae sapiente.', 9141.00, 12665, 13, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (36, 'aut', 'Quas adipisci aut perspiciatis tempore libero maiores.', 8581.00, 16345, 13, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (37, 'pariatur', 'Ab eos laborum veritatis.', 9192.00, 44822, 13, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (38, 'ipsa', 'Est aut velit ad velit ipsum.', 5451.00, 19842, 14, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (39, 'velit', 'Repellat qui ut quod.', 1993.00, 63730, 14, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (40, 'molestiae', 'Perspiciatis officia illum dolorum quam voluptas enim.', 547.00, 72003, 14, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (41, 'aperiam', 'Dolorum voluptas qui sit.', 7543.00, 3594, 15, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (42, 'nam', 'Repudiandae qui voluptatum sapiente eligendi ut hic voluptatem.', 2203.00, 46783, 15, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (43, 'nisi', 'Ipsum vel necessitatibus numquam et.', 6540.00, 95385, 15, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (44, 'voluptatem', 'Rem alias recusandae perferendis cumque.', 9725.00, 33665, 16, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (45, 'enim', 'Non aut id blanditiis velit nihil corporis nisi officia.', 9398.00, 15583, 16, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (46, 'vel', 'Minima ea aspernatur enim illo sint.', 1576.00, 72016, 16, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (47, 'et', 'Eaque dolore dolores ut corporis quo soluta voluptas.', 9974.00, 86071, 17, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (48, 'facere', 'Inventore porro voluptas quibusdam.', 2108.00, 6751, 17, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (49, 'nam', 'Recusandae eveniet dolores inventore quia quo.', 7484.00, 77820, 17, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (50, 'quia', 'Et molestiae sed accusantium a.', 3145.00, 34387, 18, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (51, 'quam', 'Iste hic commodi maiores blanditiis nihil qui vel.', 259.00, 78096, 18, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (52, 'at', 'Pariatur vel aut iste temporibus veniam minus.', 8464.00, 94680, 18, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (53, 'eveniet', 'Omnis iusto magni eos quos.', 2034.00, 16579, 19, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (54, 'qui', 'Est ullam quis debitis corrupti et voluptate qui.', 2612.00, 73963, 19, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (55, 'enim', 'Autem quia esse ad rerum quia.', 5063.00, 41585, 19, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (56, 'voluptas', 'Nisi et officiis provident eius qui placeat.', 8616.00, 95076, 20, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (57, 'maiores', 'Laudantium ab vel quaerat omnis consequatur expedita.', 894.00, 49327, 20, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (58, 'assumenda', 'Amet eum ex enim unde quis placeat molestias.', 8872.00, 6253, 20, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (59, 'accusantium', 'Mollitia non in molestias quia blanditiis corrupti omnis.', 1693.00, 85120, 21, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (60, 'adipisci', 'A voluptas nulla rerum sapiente.', 5836.00, 46245, 21, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (61, 'modi', 'Veritatis quam cumque ad qui voluptates velit sit ut.', 1452.00, 92219, 21, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (62, 'accusamus', 'Rerum voluptates et qui vel dolorum aliquid.', 1614.00, 71953, 22, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (63, 'nobis', 'Porro aut fugit officia odio velit.', 5526.00, 21859, 22, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (64, 'et', 'Doloribus voluptatem saepe soluta.', 7874.00, 63116, 22, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (65, 'saepe', 'Voluptas est ut quo numquam voluptas rerum.', 5055.00, 45691, 23, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (66, 'omnis', 'Et ad quam dolorum quaerat.', 2837.00, 21354, 23, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (67, 'nam', 'Sed in modi occaecati eos qui.', 4106.00, 76384, 23, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (68, 'blanditiis', 'Occaecati similique vel enim.', 6813.00, 89969, 24, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (69, 'quasi', 'Et quia occaecati ducimus sed inventore.', 977.00, 9316, 24, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (70, 'ut', 'Fuga ea sit consectetur ratione.', 1388.00, 77362, 24, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (71, 'porro', 'Qui facilis rerum quaerat optio consequuntur.', 3007.00, 31023, 25, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (72, 'ut', 'Quaerat delectus vel repellendus quia molestiae ratione.', 5002.00, 77632, 25, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (73, 'et', 'Magni aliquam aut qui et qui.', 7350.00, 53076, 25, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (74, 'cumque', 'Non quod nobis reiciendis dicta sequi sunt.', 1045.00, 7768, 26, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (75, 'eum', 'Quam veritatis veniam est.', 5428.00, 38202, 26, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (76, 'fugiat', 'Eaque saepe reprehenderit porro.', 1142.00, 26008, 26, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (77, 'accusamus', 'Placeat quas voluptatibus at.', 1597.00, 19495, 27, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (78, 'aspernatur', 'Sit commodi eum enim iste aut in in.', 4786.00, 16930, 27, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (79, 'molestiae', 'Quasi quis et voluptatem et enim totam harum.', 59.00, 19953, 27, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (80, 'dicta', 'In explicabo libero debitis et ab odio quo.', 8417.00, 89334, 28, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (81, 'est', 'Natus doloremque adipisci quisquam impedit.', 3558.00, 55801, 28, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (82, 'fugiat', 'Deserunt ut facere eligendi aut aliquam illo ut.', 6484.00, 98895, 28, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (83, 'eum', 'Quisquam in ea adipisci nihil.', 2269.00, 32309, 29, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (84, 'deserunt', 'Error adipisci fugit sit dolore dolorum.', 432.00, 67044, 29, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (85, 'quia', 'Velit repellat facere sequi quos odit fugit.', 2758.00, 77277, 29, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (86, 'velit', 'Sint dicta voluptas id.', 1275.00, 7732, 30, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (87, 'nostrum', 'Dolores ut cumque non accusantium asperiores minima accusamus.', 4936.00, 85042, 30, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (88, 'et', 'Quisquam magni quos velit dolor qui aut reprehenderit architecto.', 1725.00, 96949, 30, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (89, 'ex', 'Quae hic et numquam quaerat temporibus itaque ad vero.', 609.00, 68836, 31, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (90, 'quia', 'Rerum ducimus dignissimos veritatis sunt autem ullam.', 4492.00, 21530, 31, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `product_skus` VALUES (91, 'odit', 'Nihil provident explicabo cumque ex qui.', 1865.00, 39239, 31, '2019-07-23 08:47:55', '2019-07-23 08:47:55');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短标题',
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '商品详情',
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '封面图片',
  `on_sale` tinyint(1) NOT NULL DEFAULT 1 COMMENT '商品是否正在售卖',
  `rating` double(8, 2) NOT NULL DEFAULT 5.00 COMMENT '商品平均评分',
  `sold_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '销量',
  `review_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '评论数量',
  `price` decimal(10, 2) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 'IPhone X', '<p>12312313```sdasdasdasd```</p>', 'images/IMG_7112.JPG', 1, 5.00, 0, 0, 10.00, '2019-07-23 08:37:26', '2019-07-23 08:37:26');
INSERT INTO `products` VALUES (2, 'omnis', 'Et labore et deserunt recusandae.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 0.00, 0, 0, 6093.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (3, 'autem', 'At quis suscipit quod earum dignissimos earum voluptatibus maiores.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 2.00, 0, 0, 4413.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (4, 'ducimus', 'Nihil maiores enim beatae eos exercitationem.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 1.00, 0, 0, 7707.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (5, 'eum', 'Quaerat illo accusantium alias.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 3.00, 0, 0, 1116.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (6, 'voluptatem', 'Et pariatur mollitia dolor iure explicabo sed.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 4.00, 0, 0, 1426.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (7, 'sed', 'Et modi perferendis dolorem architecto qui repellendus quia.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 0.00, 0, 0, 1050.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (8, 'qui', 'Repellendus sequi aut corporis id.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 4.00, 0, 0, 1312.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (9, 'sit', 'Maxime ratione dolor consequatur aut et.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 5.00, 0, 0, 2676.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (10, 'qui', 'Eligendi veniam officiis maxime voluptates.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 0.00, 0, 0, 6009.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (11, 'asperiores', 'Cumque et sint laboriosam molestiae ipsum rem voluptatibus.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 4.00, 0, 0, 4417.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (12, 'vero', 'Aut et iusto nobis rerum recusandae aut rerum et.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 1, 5.00, 0, 0, 1307.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (13, 'eveniet', 'A consequatur commodi error harum tenetur ut.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 3.00, 0, 0, 8581.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (14, 'ab', 'Velit odit temporibus explicabo fugiat.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 3.00, 0, 0, 547.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (15, 'asperiores', 'Qui sunt nostrum et consequatur nam rerum.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 1, 0.00, 0, 0, 2203.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (16, 'cupiditate', 'Voluptatem aut et non rerum.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 3.00, 0, 0, 1576.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (17, 'omnis', 'Ipsum sequi ut atque ea.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 5.00, 0, 0, 2108.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (18, 'aperiam', 'Vel nemo beatae id hic eos sunt.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 1, 0.00, 0, 0, 259.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (19, 'sint', 'Aut temporibus libero reprehenderit aliquid exercitationem.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 5.00, 0, 0, 2034.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (20, 'non', 'Ea commodi aliquam fugiat omnis cumque aliquam assumenda odio.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 2.00, 0, 0, 894.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (21, 'earum', 'Eius repudiandae quisquam illo odio.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 1.00, 0, 0, 1452.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (22, 'non', 'Et minima molestiae accusamus quisquam qui.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 1.00, 0, 0, 1614.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (23, 'expedita', 'Nam ipsum voluptatem accusamus non ut quibusdam.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 4.00, 0, 0, 2837.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (24, 'et', 'Vitae consequatur et consequatur ullam cum sit aliquid.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 5.00, 0, 0, 977.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (25, 'sint', 'Pariatur itaque unde et debitis.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 1.00, 0, 0, 3007.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (26, 'quis', 'Non aliquid voluptas pariatur impedit porro.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 4.00, 0, 0, 1045.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (27, 'cupiditate', 'Ea placeat voluptates culpa nemo est architecto labore.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 4.00, 0, 0, 59.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (28, 'fugit', 'Ratione autem at enim et sint beatae nobis.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 1, 3.00, 0, 0, 3558.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (29, 'consequatur', 'Nemo quis officiis porro et.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 1, 4.00, 0, 0, 432.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (30, 'quo', 'Itaque voluptatem soluta omnis ipsa ut.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 5.00, 0, 0, 1275.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (31, 'aut', 'Iste fuga a quia harum nihil dignissimos.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 1, 5.00, 0, 0, 609.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');

-- ----------------------------
-- Table structure for user_addresses
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `province` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `zip` int(10) UNSIGNED NOT NULL,
  `contact_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_used_at` datetime(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_addresses_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `user_addresses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------
INSERT INTO `user_addresses` VALUES (1, 1, '广东省', '深圳市', '福田区', '第54街道第363号', 425000, '张瑞', '13386506098', NULL, '2019-07-23 07:47:17', '2019-07-23 07:47:17');
INSERT INTO `user_addresses` VALUES (2, 1, '广东省', '深圳市', '福田区', '第70街道第480号', 296400, '常超', '18393637997', NULL, '2019-07-23 07:47:17', '2019-07-23 07:47:17');
INSERT INTO `user_addresses` VALUES (3, 1, '北京市', '市辖区', '东城区', '第73街道第814号', 846500, '严志新', '18885300893', NULL, '2019-07-23 07:47:17', '2019-07-23 07:47:17');
INSERT INTO `user_addresses` VALUES (5, 1, '北京市', '市辖区', '东城区', '第15街道第555号', 61000, '夏海洋', '18584864076', NULL, '2019-07-23 07:57:21', '2019-07-23 07:57:21');
INSERT INTO `user_addresses` VALUES (6, 1, '北京市', '市辖区', '东城区', '第15街道第5556号', 61000, '夏海洋', '18584864076', NULL, '2019-07-23 07:59:23', '2019-07-23 07:59:23');

-- ----------------------------
-- Table structure for user_favorite_products
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite_products`;
CREATE TABLE `user_favorite_products`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_favorite_products_user_id_foreign`(`user_id`) USING BTREE,
  INDEX `user_favorite_products_product_id_foreign`(`product_id`) USING BTREE,
  CONSTRAINT `user_favorite_products_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `user_favorite_products_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_favorite_products
-- ----------------------------
INSERT INTO `user_favorite_products` VALUES (4, 1, 1, '2019-07-23 09:23:55', '2019-07-23 09:23:55');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '奈斯', '2514430140@qq.com', NULL, '$2y$10$m1xGsaUvjBf5AOkIdff.1ubdu4K/pHePoFU44NaFRjsT3KmuhBCHm', NULL, '2019-07-23 06:55:51', '2019-07-23 06:55:51');
INSERT INTO `users` VALUES (2, '奈斯', '25144301401@qq.com', NULL, '$2y$10$WJhRBuUtMYoFnMIZkuJ.EuYUMyxsWOKpoXpOFAE/Hid0bKXsbu776', NULL, '2019-07-23 07:27:33', '2019-07-23 07:27:33');

SET FOREIGN_KEY_CHECKS = 1;
