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

 Date: 25/07/2019 17:53:31
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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `admin_menu` VALUES (10, 0, 0, '订单管理', 'fa-rmb', '/orders', NULL, '2019-07-25 03:00:08', '2019-07-25 03:00:08');
INSERT INTO `admin_menu` VALUES (11, 0, 0, '类目管理', 'fa-bars', '/categories', NULL, '2019-07-25 08:43:40', '2019-07-25 08:43:40');

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
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-07-25 02:59:44', '2019-07-25 02:59:44');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 02:59:46', '2019-07-25 02:59:46');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 02:59:46', '2019-07-25 02:59:46');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 02:59:47', '2019-07-25 02:59:47');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-rmb\",\"uri\":\"\\/orders\",\"roles\":[null],\"permission\":null,\"_token\":\"7uXp52rbTOC8lLNQQm00VTok2ThDvY4vvrugKGRs\"}', '2019-07-25 03:00:08', '2019-07-25 03:00:08');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 03:00:08', '2019-07-25 03:00:08');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 03:00:09', '2019-07-25 03:00:09');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 03:00:10', '2019-07-25 03:00:10');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/orders/40', 'GET', '192.168.10.1', '[]', '2019-07-25 03:01:55', '2019-07-25 03:01:55');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/orders/40', 'GET', '192.168.10.1', '[]', '2019-07-25 03:03:52', '2019-07-25 03:03:52');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/orders/40', 'GET', '192.168.10.1', '[]', '2019-07-25 03:03:57', '2019-07-25 03:03:57');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/orders/40', 'GET', '192.168.10.1', '[]', '2019-07-25 03:04:02', '2019-07-25 03:04:02');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/orders/39', 'GET', '192.168.10.1', '[]', '2019-07-25 03:04:51', '2019-07-25 03:04:51');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/orders/39', 'GET', '192.168.10.1', '[]', '2019-07-25 03:06:04', '2019-07-25 03:06:04');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/orders/39/ship', 'POST', '192.168.10.1', '{\"_token\":\"7uXp52rbTOC8lLNQQm00VTok2ThDvY4vvrugKGRs\",\"express_company\":null,\"express_no\":null}', '2019-07-25 03:06:47', '2019-07-25 03:06:47');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/orders/39', 'GET', '192.168.10.1', '[]', '2019-07-25 03:06:47', '2019-07-25 03:06:47');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/orders/39', 'GET', '192.168.10.1', '[]', '2019-07-25 03:10:55', '2019-07-25 03:10:55');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/orders/39/ship', 'POST', '192.168.10.1', '{\"_token\":\"7uXp52rbTOC8lLNQQm00VTok2ThDvY4vvrugKGRs\",\"express_company\":\"1231\",\"express_no\":\"312312\"}', '2019-07-25 03:10:57', '2019-07-25 03:10:57');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/orders/39', 'GET', '192.168.10.1', '[]', '2019-07-25 03:10:57', '2019-07-25 03:10:57');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-07-25 07:15:53', '2019-07-25 07:15:53');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:15:54', '2019-07-25 07:15:54');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/orders/39', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 07:15:57', '2019-07-25 07:15:57');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/orders/39', 'GET', '192.168.10.1', '[]', '2019-07-25 07:16:05', '2019-07-25 07:16:05');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/orders/39/refund', 'POST', '192.168.10.1', '{\"agree\":false,\"reason\":\"3123\",\"_token\":\"dSfj50xHTeZQLDHDBKRqZhzpgFDEqKBoxcJxk08P\"}', '2019-07-25 07:16:28', '2019-07-25 07:16:28');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin/orders/39', 'GET', '192.168.10.1', '[]', '2019-07-25 07:16:30', '2019-07-25 07:16:30');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/orders/39', 'GET', '192.168.10.1', '[]', '2019-07-25 07:18:58', '2019-07-25 07:18:58');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/orders/39', 'GET', '192.168.10.1', '[]', '2019-07-25 07:19:23', '2019-07-25 07:19:23');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/orders/39/refund', 'POST', '192.168.10.1', '{\"agree\":true,\"_token\":\"dSfj50xHTeZQLDHDBKRqZhzpgFDEqKBoxcJxk08P\"}', '2019-07-25 07:19:26', '2019-07-25 07:19:26');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/orders/39', 'GET', '192.168.10.1', '[]', '2019-07-25 07:19:45', '2019-07-25 07:19:45');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/orders/39/refund', 'POST', '192.168.10.1', '{\"agree\":true,\"_token\":\"dSfj50xHTeZQLDHDBKRqZhzpgFDEqKBoxcJxk08P\"}', '2019-07-25 07:19:50', '2019-07-25 07:19:50');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/orders/39', 'GET', '192.168.10.1', '[]', '2019-07-25 07:19:56', '2019-07-25 07:19:56');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin', 'GET', '192.168.10.1', '[]', '2019-07-25 08:43:21', '2019-07-25 08:43:21');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:43:23', '2019-07-25 08:43:23');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7c7b\\u76ee\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/categories\",\"roles\":[null],\"permission\":null,\"_token\":\"dSfj50xHTeZQLDHDBKRqZhzpgFDEqKBoxcJxk08P\"}', '2019-07-25 08:43:40', '2019-07-25 08:43:40');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 08:43:40', '2019-07-25 08:43:40');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2019-07-25 08:43:43', '2019-07-25 08:43:43');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2019-07-25 08:43:52', '2019-07-25 08:43:52');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/categories/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:44:04', '2019-07-25 08:44:04');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:44:06', '2019-07-25 08:44:06');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/categories/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:44:18', '2019-07-25 08:44:18');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u84dd\\u7259\"}', '2019-07-25 08:44:23', '2019-07-25 08:44:23');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u84dd\"}', '2019-07-25 08:44:25', '2019-07-25 08:44:25');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u8033\\u673a\"}', '2019-07-25 08:44:26', '2019-07-25 08:44:26');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:44:36', '2019-07-25 08:44:36');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/categories/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:44:42', '2019-07-25 08:44:42');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u84dd\\u7259\\u8033\\u673a\"}', '2019-07-25 08:44:43', '2019-07-25 08:44:43');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u84dd\\u7259\\u8033\\u673a\"}', '2019-07-25 08:44:45', '2019-07-25 08:44:45');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u84dd\\u7259\\u8033\\u673as\"}', '2019-07-25 08:45:31', '2019-07-25 08:45:31');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u84dd\\u7259\\u8033\\u673as\"}', '2019-07-25 08:45:32', '2019-07-25 08:45:32');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u84dd\\u7259\\u8033\\u673a\"}', '2019-07-25 08:45:40', '2019-07-25 08:45:40');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/categories', 'POST', '192.168.10.1', '{\"name\":null,\"is_directory\":\"0\",\"parent_id\":\"9\",\"_token\":\"dSfj50xHTeZQLDHDBKRqZhzpgFDEqKBoxcJxk08P\",\"_previous_\":\"http:\\/\\/shopapi.test\\/admin\\/categories\"}', '2019-07-25 08:45:45', '2019-07-25 08:45:45');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/categories/create', 'GET', '192.168.10.1', '[]', '2019-07-25 08:45:45', '2019-07-25 08:45:45');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"langya\"}', '2019-07-25 08:45:49', '2019-07-25 08:45:49');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"langy\"}', '2019-07-25 08:45:50', '2019-07-25 08:45:50');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"l\"}', '2019-07-25 08:45:50', '2019-07-25 08:45:50');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"l\"}', '2019-07-25 08:45:51', '2019-07-25 08:45:51');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"langya\"}', '2019-07-25 08:45:52', '2019-07-25 08:45:52');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"lan\"}', '2019-07-25 08:45:53', '2019-07-25 08:45:53');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"lanya\"}', '2019-07-25 08:45:53', '2019-07-25 08:45:53');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u84dd\\u7259\"}', '2019-07-25 08:45:53', '2019-07-25 08:45:53');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/categories', 'POST', '192.168.10.1', '{\"name\":\"1111\",\"is_directory\":\"0\",\"parent_id\":\"9\",\"_token\":\"dSfj50xHTeZQLDHDBKRqZhzpgFDEqKBoxcJxk08P\"}', '2019-07-25 08:45:58', '2019-07-25 08:45:58');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2019-07-25 08:45:58', '2019-07-25 08:45:58');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2019-07-25 08:45:59', '2019-07-25 08:45:59');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2019-07-25 08:46:39', '2019-07-25 08:46:39');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/categories/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:46:44', '2019-07-25 08:46:44');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:50:13', '2019-07-25 08:50:13');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2019-07-25 08:50:18', '2019-07-25 08:50:18');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:50:20', '2019-07-25 08:50:20');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/categories/28/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:50:23', '2019-07-25 08:50:23');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:50:26', '2019-07-25 08:50:26');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/categories/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:50:27', '2019-07-25 08:50:27');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"lk\"}', '2019-07-25 08:50:42', '2019-07-25 08:50:42');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"langyta\"}', '2019-07-25 08:50:43', '2019-07-25 08:50:43');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"langyt\"}', '2019-07-25 08:50:43', '2019-07-25 08:50:43');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"langyta\"}', '2019-07-25 08:50:44', '2019-07-25 08:50:44');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u7405\\u740a\"}', '2019-07-25 08:50:44', '2019-07-25 08:50:44');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u7405\"}', '2019-07-25 08:50:44', '2019-07-25 08:50:44');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"e\"}', '2019-07-25 08:50:46', '2019-07-25 08:50:46');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u8033\\u673a\"}', '2019-07-25 08:50:46', '2019-07-25 08:50:46');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/categories', 'POST', '192.168.10.1', '{\"name\":null,\"is_directory\":\"1\",\"parent_id\":\"7\",\"_token\":\"dSfj50xHTeZQLDHDBKRqZhzpgFDEqKBoxcJxk08P\",\"_previous_\":\"http:\\/\\/shopapi.test\\/admin\\/categories?page=2\"}', '2019-07-25 08:50:49', '2019-07-25 08:50:49');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/categories/create', 'GET', '192.168.10.1', '[]', '2019-07-25 08:50:49', '2019-07-25 08:50:49');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"\\u8033\\u673a\"}', '2019-07-25 08:50:55', '2019-07-25 08:50:55');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/categories', 'POST', '192.168.10.1', '{\"name\":\"123123\",\"is_directory\":\"1\",\"parent_id\":\"7\",\"_token\":\"dSfj50xHTeZQLDHDBKRqZhzpgFDEqKBoxcJxk08P\"}', '2019-07-25 08:50:56', '2019-07-25 08:50:56');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/categories', 'GET', '192.168.10.1', '[]', '2019-07-25 08:50:56', '2019-07-25 08:50:56');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"page\":\"2\",\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:50:59', '2019-07-25 08:50:59');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/categories/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:53:44', '2019-07-25 08:53:44');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"5555\"}', '2019-07-25 08:53:50', '2019-07-25 08:53:50');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"555\"}', '2019-07-25 08:53:52', '2019-07-25 08:53:52');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"5\"}', '2019-07-25 08:53:53', '2019-07-25 08:53:53');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2019-07-25 08:53:54', '2019-07-25 08:53:54');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"11\"}', '2019-07-25 08:53:54', '2019-07-25 08:53:54');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"q\":\"1\"}', '2019-07-25 08:53:55', '2019-07-25 08:53:55');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/categories', 'POST', '192.168.10.1', '{\"name\":\"sss\",\"is_directory\":\"1\",\"parent_id\":\"29\",\"_token\":\"dSfj50xHTeZQLDHDBKRqZhzpgFDEqKBoxcJxk08P\",\"_previous_\":\"http:\\/\\/shopapi.test\\/admin\\/categories?page=2\"}', '2019-07-25 08:53:57', '2019-07-25 08:53:57');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"page\":\"2\"}', '2019-07-25 08:53:57', '2019-07-25 08:53:57');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/categories', 'GET', '192.168.10.1', '{\"page\":\"2\"}', '2019-07-25 08:53:59', '2019-07-25 08:53:59');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:58:28', '2019-07-25 08:58:28');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/products/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:58:30', '2019-07-25 08:58:30');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"\\u8033\\u673a\"}', '2019-07-25 08:58:34', '2019-07-25 08:58:34');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"123123\"}', '2019-07-25 08:58:38', '2019-07-25 08:58:38');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/api/categories', 'GET', '192.168.10.1', '{\"is_directory\":\"0\",\"q\":\"sss\"}', '2019-07-25 08:58:56', '2019-07-25 08:58:56');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/products/1', 'PUT', '192.168.10.1', '{\"title\":\"IPhone X\",\"category_id\":\"30\",\"description\":\"<p>12312313```sdasdasdasd```<\\/p>\",\"on_sale\":\"1\",\"skus\":{\"1\":{\"title\":\"IPhone X  \\u4e00\\u53f0\",\"description\":\"\\u4f18\\u60e0\\u4ef7\",\"price\":\"10.00\",\"stock\":\"95\",\"id\":\"1\",\"_remove_\":\"0\"}},\"_token\":\"dSfj50xHTeZQLDHDBKRqZhzpgFDEqKBoxcJxk08P\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/shopapi.test\\/admin\\/products\"}', '2019-07-25 08:58:59', '2019-07-25 08:58:59');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2019-07-25 08:58:59', '2019-07-25 08:58:59');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/products', 'GET', '192.168.10.1', '[]', '2019-07-25 08:59:46', '2019-07-25 08:59:46');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/products', 'GET', '192.168.10.1', '{\"page\":\"4\",\"_pjax\":\"#pjax-container\"}', '2019-07-25 08:59:48', '2019-07-25 08:59:48');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/products', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"page\":\"3\"}', '2019-07-25 08:59:51', '2019-07-25 08:59:51');

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for categories
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
  `is_directory` tinyint(1) NOT NULL,
  `level` int(10) UNSIGNED NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `categories_parent_id_foreign`(`parent_id`) USING BTREE,
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES (1, '手机配件', NULL, 1, 0, '-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (2, '手机壳', 1, 0, 1, '-1-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (3, '贴膜', 1, 0, 1, '-1-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (4, '存储卡', 1, 0, 1, '-1-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (5, '数据线', 1, 0, 1, '-1-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (6, '充电器', 1, 0, 1, '-1-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (7, '耳机', 1, 1, 1, '-1-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (8, '有线耳机', 7, 0, 2, '-1-7-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (9, '蓝牙耳机', 7, 0, 2, '-1-7-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (10, '电脑配件', NULL, 1, 0, '-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (11, '显示器', 10, 0, 1, '-10-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (12, '显卡', 10, 0, 1, '-10-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (13, '内存', 10, 0, 1, '-10-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (14, 'CPU', 10, 0, 1, '-10-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (15, '主板', 10, 0, 1, '-10-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (16, '硬盘', 10, 0, 1, '-10-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (17, '电脑整机', NULL, 1, 0, '-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (18, '笔记本', 17, 0, 1, '-17-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (19, '台式机', 17, 0, 1, '-17-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (20, '平板电脑', 17, 0, 1, '-17-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (21, '一体机', 17, 0, 1, '-17-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (22, '服务器', 17, 0, 1, '-17-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (23, '工作站', 17, 0, 1, '-17-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (24, '手机通讯', NULL, 1, 0, '-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (25, '智能机', 24, 0, 1, '-24-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (26, '老人机', 24, 0, 1, '-24-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (27, '对讲机', 24, 0, 1, '-24-', '2019-07-25 08:23:59', '2019-07-25 08:23:59');
INSERT INTO `categories` VALUES (28, '1111', 9, 0, 3, '-1-7-9-', '2019-07-25 08:45:58', '2019-07-25 08:45:58');
INSERT INTO `categories` VALUES (29, '123123', 7, 1, 2, '-1-7-', '2019-07-25 08:50:56', '2019-07-25 08:50:56');
INSERT INTO `categories` VALUES (30, 'sss', 29, 0, 3, '-1-7-29-', '2019-07-25 08:53:57', '2019-07-25 08:53:57');

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
INSERT INTO `migrations` VALUES (17, '2019_07_23_133911_create_orders_table', 8);
INSERT INTO `migrations` VALUES (18, '2019_07_23_135335_create_order_items_table', 8);
INSERT INTO `migrations` VALUES (19, '2019_07_25_081040_create_categories_table', 9);
INSERT INTO `migrations` VALUES (20, '2019_07_25_082113_products_add_category_id', 9);

-- ----------------------------
-- Table structure for order_items
-- ----------------------------
DROP TABLE IF EXISTS `order_items`;
CREATE TABLE `order_items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `product_sku_id` bigint(20) UNSIGNED NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `price` decimal(10, 2) NOT NULL,
  `rating` int(10) UNSIGNED NULL DEFAULT NULL,
  `review` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `reviewed_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_items_order_id_foreign`(`order_id`) USING BTREE,
  INDEX `order_items_product_id_foreign`(`product_id`) USING BTREE,
  INDEX `order_items_product_sku_id_foreign`(`product_sku_id`) USING BTREE,
  CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `order_items_ibfk_3` FOREIGN KEY (`product_sku_id`) REFERENCES `product_skus` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_items
-- ----------------------------
INSERT INTO `order_items` VALUES (1, 30, 1, 1, 1, 10.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (2, 32, 1, 1, 1, 10.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (3, 33, 1, 1, 1, 10.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (4, 34, 1, 1, 1, 10.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (5, 35, 1, 1, 1, 10.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (6, 36, 1, 1, 1, 10.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (7, 37, 1, 1, 1, 10.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (8, 38, 1, 1, 1, 10.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (9, 39, 1, 1, 1, 10.00, 5, '666666', '2019-07-25 03:50:18');
INSERT INTO `order_items` VALUES (10, 40, 1, 1, 1, 10.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (11, 41, 1, 1, 1, 10.00, NULL, NULL, NULL);
INSERT INTO `order_items` VALUES (12, 42, 1, 1, 1, 10.00, 5, '666666', '2019-07-25 06:20:56');
INSERT INTO `order_items` VALUES (13, 43, 1, 1, 1, 10.00, 1, '6666664645654', '2019-07-25 06:23:34');
INSERT INTO `order_items` VALUES (14, 44, 1, 1, 1, 10.00, 3, '6666664645654', '2019-07-25 06:30:07');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单号',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '收货地址',
  `total_amount` decimal(10, 2) NOT NULL,
  `remark` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '订单备注',
  `paid_at` datetime(0) NULL DEFAULT NULL COMMENT '支付时间',
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付方式',
  `payment_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '支付平台订单号',
  `refund_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '退款状态',
  `refund_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '退款订单号',
  `closed` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单是否已关闭',
  `reviewed` tinyint(1) NOT NULL DEFAULT 0 COMMENT '订单是否已评价',
  `ship_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending' COMMENT '物流状态',
  `ship_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '物流数据',
  `extra` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '其他额外的数据',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `orders_no_unique`(`no`) USING BTREE,
  UNIQUE INDEX `orders_refund_no_unique`(`refund_no`) USING BTREE,
  INDEX `orders_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 45 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (29, '20190724032150570431', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 0.00, 'sss', NULL, NULL, NULL, 'pending', NULL, 0, 0, 'pending', NULL, NULL, '2019-07-24 03:21:50', '2019-07-24 03:21:50');
INSERT INTO `orders` VALUES (30, '20190724032328942088', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 10.00, 'sss', NULL, NULL, NULL, 'pending', NULL, 0, 0, 'pending', NULL, NULL, '2019-07-24 03:23:28', '2019-07-24 03:23:28');
INSERT INTO `orders` VALUES (32, '20190724060803565053', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 10.00, 'sss', NULL, NULL, NULL, 'pending', NULL, 0, 0, 'pending', NULL, NULL, '2019-07-24 06:08:03', '2019-07-24 06:08:03');
INSERT INTO `orders` VALUES (33, '20190724062949469157', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 10.00, 'sss', NULL, NULL, NULL, 'pending', NULL, 1, 0, 'pending', NULL, NULL, '2019-07-24 06:29:49', '2019-07-24 06:30:21');
INSERT INTO `orders` VALUES (34, '20190724063042173386', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 10.00, 'sss', NULL, NULL, NULL, 'pending', NULL, 1, 0, 'pending', NULL, NULL, '2019-07-24 06:30:42', '2019-07-24 06:31:12');
INSERT INTO `orders` VALUES (35, '20190724063126800153', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 10.00, 'sss', NULL, NULL, NULL, 'pending', NULL, 1, 0, 'pending', NULL, NULL, '2019-07-24 06:31:26', '2019-07-24 06:31:33');
INSERT INTO `orders` VALUES (36, '20190724071339079145', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 10.00, 'sss', NULL, NULL, NULL, 'pending', NULL, 0, 0, 'pending', NULL, NULL, '2019-07-24 07:13:39', '2019-07-24 07:13:39');
INSERT INTO `orders` VALUES (37, '20190724071413778628', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 10.00, 'sss', NULL, NULL, NULL, 'pending', NULL, 0, 0, 'pending', NULL, NULL, '2019-07-24 07:14:13', '2019-07-24 07:14:13');
INSERT INTO `orders` VALUES (38, '20190724071522245081', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 10.00, 'sss', NULL, NULL, NULL, 'pending', NULL, 0, 0, 'pending', NULL, NULL, '2019-07-24 07:15:22', '2019-07-24 07:15:22');
INSERT INTO `orders` VALUES (39, '20190724071611542640', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 10.00, 'sss', '2019-07-25 02:14:12', 'alipay', '2019072522001442511000035494', 'success', '7896a41b5e2e4693b56a98aa6cbe214c', 0, 1, 'received', '{\"express_company\":\"1231\",\"express_no\":\"312312\"}', '{\"refund_reason\":\"\\u4e0d\\u8981\"}', '2019-07-24 07:16:11', '2019-07-25 07:19:53');
INSERT INTO `orders` VALUES (40, '20190724071703926275', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 10.00, 'sss', NULL, NULL, NULL, 'pending', NULL, 0, 0, 'pending', NULL, NULL, '2019-07-24 07:17:03', '2019-07-24 07:17:08');
INSERT INTO `orders` VALUES (41, '20190725061545522829', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 10.00, 'sss', '2019-07-25 14:16:01', NULL, NULL, 'pending', NULL, 1, 0, 'pending', NULL, NULL, '2019-07-25 06:15:45', '2019-07-25 06:15:50');
INSERT INTO `orders` VALUES (42, '20190725061859684043', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 10.00, 'sss', '2019-07-25 14:19:04', NULL, NULL, 'pending', NULL, 0, 1, 'pending', NULL, NULL, '2019-07-25 06:18:59', '2019-07-25 06:20:56');
INSERT INTO `orders` VALUES (43, '20190725062242131772', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 10.00, 'sss', '2019-07-25 14:23:08', NULL, NULL, 'pending', NULL, 1, 1, 'pending', NULL, NULL, '2019-07-25 06:22:42', '2019-07-25 06:23:34');
INSERT INTO `orders` VALUES (44, '20190725062548868673', 1, '{\"address\":\"\\u5317\\u4eac\\u5e02\\u5e02\\u8f96\\u533a\\u4e1c\\u57ce\\u533a\\u7b2c15\\u8857\\u9053\\u7b2c5556\\u53f7\",\"zip\":61000,\"contact_name\":\"\\u590f\\u6d77\\u6d0b\",\"contact_phone\":\"18584864076\"}', 10.00, 'sss', '2019-07-25 14:26:08', NULL, NULL, 'pending', NULL, 1, 1, 'pending', NULL, NULL, '2019-07-25 06:25:48', '2019-07-25 06:26:12');

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
) ENGINE = InnoDB AUTO_INCREMENT = 182 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_skus
-- ----------------------------
INSERT INTO `product_skus` VALUES (1, 'IPhone X  一台', '优惠价', 10.00, 95, 1, '2019-07-23 08:37:26', '2019-07-25 06:25:53');
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
INSERT INTO `product_skus` VALUES (92, 'rerum', 'Veniam nihil repudiandae distinctio assumenda optio doloribus delectus quibusdam.', 6365.00, 98689, 32, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (93, 'pariatur', 'Sed accusamus nihil officiis.', 1959.00, 84155, 32, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (94, 'corrupti', 'Est in non est officia.', 8670.00, 96496, 32, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (95, 'possimus', 'Cupiditate illo dolor incidunt maiores.', 4103.00, 86181, 33, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (96, 'ut', 'Et minus distinctio aperiam quisquam nihil ipsam.', 5390.00, 52664, 33, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (97, 'dolor', 'Quos sit adipisci sed sit repellendus.', 8861.00, 55847, 33, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (98, 'rerum', 'Cupiditate ea ea provident.', 786.00, 45704, 34, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (99, 'tenetur', 'Vitae aut eaque nesciunt molestias commodi commodi est dolore.', 4860.00, 27987, 34, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (100, 'tempore', 'Occaecati perferendis similique ratione laudantium fugit dolore voluptatem sint.', 5986.00, 27368, 34, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (101, 'similique', 'Molestiae cum ut sed occaecati sed.', 1293.00, 56757, 35, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (102, 'perferendis', 'Non aliquam possimus sed veniam.', 4613.00, 55717, 35, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (103, 'quaerat', 'Quia quia aut dolore aperiam qui voluptatum et.', 8551.00, 82227, 35, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (104, 'nam', 'Unde debitis sequi nisi corrupti.', 7332.00, 70574, 36, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (105, 'qui', 'Et necessitatibus voluptates molestias totam sint.', 7464.00, 61418, 36, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (106, 'aut', 'Sint excepturi mollitia eos cumque doloribus.', 2282.00, 29961, 36, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (107, 'aut', 'Et assumenda sit sapiente esse ipsum aliquam ea inventore.', 3725.00, 77379, 37, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (108, 'omnis', 'Est nesciunt minus ipsum et.', 6298.00, 596, 37, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (109, 'enim', 'Autem enim quia eaque fugiat repellendus rem quo.', 2270.00, 76424, 37, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (110, 'quam', 'Ab deserunt dicta sapiente ex voluptatibus quisquam fuga.', 3761.00, 86394, 38, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (111, 'officiis', 'Ea assumenda sit et sed mollitia.', 6087.00, 52160, 38, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (112, 'officia', 'Illo dolor a ut optio quia quibusdam veritatis.', 8632.00, 34437, 38, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (113, 'eaque', 'Qui in sunt doloremque voluptatem assumenda omnis.', 6604.00, 46268, 39, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (114, 'ab', 'Harum exercitationem reprehenderit itaque ut distinctio sit quo praesentium.', 1139.00, 13009, 39, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (115, 'iure', 'Assumenda labore esse hic ut dolorem impedit.', 406.00, 81648, 39, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (116, 'corporis', 'Fugiat in nulla neque corporis eligendi quia nihil.', 9725.00, 78485, 40, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (117, 'quos', 'Et impedit qui et quo perspiciatis quas.', 6230.00, 52560, 40, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (118, 'sunt', 'Quis optio et ut sunt molestias.', 2145.00, 14725, 40, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (119, 'est', 'Et corporis aspernatur et beatae aut hic non non.', 8485.00, 85507, 41, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (120, 'accusamus', 'Inventore eos molestiae quia consectetur.', 8327.00, 1214, 41, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (121, 'ipsa', 'Sint ut aliquam nulla aperiam et.', 2668.00, 22408, 41, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (122, 'totam', 'Qui voluptatem nulla vitae alias et exercitationem accusamus enim.', 2705.00, 94218, 42, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (123, 'quam', 'Sint maiores dolore voluptas ut.', 6182.00, 27422, 42, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (124, 'id', 'Ex id repellat voluptatum maiores voluptas aut cumque.', 6682.00, 45490, 42, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (125, 'iste', 'Architecto voluptatem dolor nihil et quibusdam sit qui nisi.', 8341.00, 29180, 43, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (126, 'et', 'Quibusdam mollitia quod et vitae et atque.', 8567.00, 81858, 43, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (127, 'distinctio', 'Non officiis adipisci earum quia alias qui sequi.', 4013.00, 37147, 43, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (128, 'iure', 'Temporibus omnis et porro quas maiores.', 1416.00, 31472, 44, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (129, 'nihil', 'Facilis vero aspernatur eos quia.', 5647.00, 78071, 44, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (130, 'dolorem', 'Et vel minus possimus quasi.', 8413.00, 97794, 44, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (131, 'qui', 'Deserunt omnis et illo unde dolor dolorem est.', 2475.00, 12477, 45, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (132, 'ratione', 'Consequatur enim autem modi.', 3325.00, 29761, 45, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (133, 'molestias', 'Temporibus nulla facere officia eaque.', 2095.00, 87845, 45, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (134, 'voluptates', 'Nihil velit voluptates occaecati voluptatem magnam et.', 5306.00, 53845, 46, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (135, 'amet', 'Ab velit voluptates omnis qui quis alias labore voluptatibus.', 2919.00, 35551, 46, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (136, 'dolorum', 'Iusto quae atque ab blanditiis.', 3912.00, 91134, 46, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (137, 'aliquam', 'Aut asperiores voluptatem aliquid voluptate quam quo cum vel.', 4492.00, 67557, 47, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (138, 'id', 'Expedita corporis sed architecto aut aut et est quia.', 8475.00, 7294, 47, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (139, 'facere', 'Hic nisi ullam nostrum quae sed.', 9438.00, 20792, 47, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (140, 'et', 'Similique repudiandae fugit eius deserunt in et.', 1842.00, 6044, 48, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (141, 'rerum', 'A quia omnis sit quasi.', 7011.00, 47489, 48, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (142, 'sapiente', 'Eveniet amet totam modi consectetur qui.', 8404.00, 48156, 48, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (143, 'placeat', 'Dolor praesentium quidem voluptatum sit.', 2449.00, 30724, 49, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (144, 'non', 'Consequatur animi aut earum libero qui soluta at odio.', 6930.00, 65013, 49, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (145, 'temporibus', 'Blanditiis temporibus quis provident ut dolore.', 9013.00, 87018, 49, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (146, 'sequi', 'Voluptatem excepturi autem corporis sed nostrum.', 3631.00, 58032, 50, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (147, 'quia', 'Dolor alias ut alias totam esse atque.', 7525.00, 69966, 50, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (148, 'et', 'Dignissimos quasi voluptates accusantium nostrum.', 8930.00, 56852, 50, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (149, 'aliquid', 'Dolorem pariatur nihil aut et autem quibusdam facere.', 8324.00, 24323, 51, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (150, 'in', 'Amet quisquam perspiciatis consectetur.', 7903.00, 63210, 51, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (151, 'corrupti', 'Quaerat error voluptatem aspernatur dolore magni sint tempora rem.', 9684.00, 42315, 51, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (152, 'sit', 'Nisi nisi corporis dolor et reprehenderit.', 7777.00, 20771, 52, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (153, 'rem', 'Eum voluptatem iure ut.', 4626.00, 6133, 52, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (154, 'minus', 'Minus illo saepe voluptatem pariatur quas.', 5695.00, 62339, 52, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (155, 'non', 'Tempora illum distinctio ipsam aliquid.', 3084.00, 36300, 53, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (156, 'quibusdam', 'Velit fugiat dolores quis eveniet possimus ullam fuga.', 4945.00, 8726, 53, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (157, 'illo', 'Consequatur ut adipisci quibusdam cupiditate iste.', 3562.00, 8558, 53, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (158, 'distinctio', 'Dolores voluptas vel quia.', 4010.00, 33840, 54, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (159, 'officiis', 'Quae repudiandae nisi amet eveniet rerum necessitatibus rem.', 3597.00, 93475, 54, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (160, 'est', 'Labore dolor sint cumque ipsam qui.', 6356.00, 50612, 54, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (161, 'praesentium', 'Iste ut eum exercitationem voluptas.', 8763.00, 90537, 55, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (162, 'eius', 'Iste quo vel atque mollitia laudantium natus corrupti.', 836.00, 33195, 55, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (163, 'nulla', 'Hic nulla nisi fugit aliquam.', 9828.00, 84140, 55, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (164, 'laudantium', 'Porro provident mollitia consequatur eum assumenda ut et.', 322.00, 65179, 56, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (165, 'delectus', 'Consequuntur earum tempora ratione et ut molestiae.', 5507.00, 66522, 56, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (166, 'amet', 'Doloribus impedit dicta quo non.', 5171.00, 50730, 56, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (167, 'quis', 'Autem eos magni minus similique repellendus consequuntur officia.', 2315.00, 29210, 57, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (168, 'qui', 'Eum mollitia quia est quia non.', 9109.00, 29283, 57, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (169, 'excepturi', 'Neque tenetur consequatur atque sit natus vero in consequatur.', 2603.00, 25013, 57, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (170, 'architecto', 'Eos autem laboriosam dicta adipisci.', 1715.00, 85180, 58, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (171, 'ducimus', 'Laborum itaque in illo neque repellendus.', 9542.00, 49304, 58, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (172, 'enim', 'Est qui corrupti veritatis expedita omnis at.', 5230.00, 31056, 58, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (173, 'ea', 'Quod ea nisi praesentium fugit adipisci ex.', 4824.00, 12412, 59, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (174, 'quia', 'Et eveniet quos consectetur blanditiis quae ut.', 7284.00, 31042, 59, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (175, 'beatae', 'Hic quae fuga quam nobis qui aut.', 3291.00, 45817, 59, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (176, 'vel', 'Quis commodi cumque eligendi quae facilis ea aut.', 3842.00, 5517, 60, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (177, 'placeat', 'Eius accusamus aperiam soluta cum sit quisquam voluptatem voluptas.', 3011.00, 42601, 60, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (178, 'aspernatur', 'Qui omnis expedita porro vel enim dolore aut.', 3167.00, 82515, 60, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (179, 'consectetur', 'Assumenda eum inventore cupiditate voluptatem.', 6202.00, 18547, 61, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (180, 'et', 'Dolor veniam qui optio iste qui.', 1626.00, 27956, 61, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `product_skus` VALUES (181, 'eum', 'Commodi dicta sit repudiandae voluptatem adipisci voluptas cum voluptas.', 2424.00, 21749, 61, '2019-07-25 08:59:42', '2019-07-25 08:59:42');

-- ----------------------------
-- Table structure for products
-- ----------------------------
DROP TABLE IF EXISTS `products`;
CREATE TABLE `products`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint(20) UNSIGNED NULL DEFAULT NULL,
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
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `products_category_id_foreign`(`category_id`) USING BTREE,
  CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 62 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of products
-- ----------------------------
INSERT INTO `products` VALUES (1, 30, 'IPhone X', '<p>12312313```sdasdasdasd```</p>', 'images/IMG_7112.JPG', 1, 3.50, 1, 5, 10.00, '2019-07-23 08:37:26', '2019-07-25 08:58:59');
INSERT INTO `products` VALUES (2, NULL, 'omnis', 'Et labore et deserunt recusandae.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 0.00, 0, 0, 6093.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (3, NULL, 'autem', 'At quis suscipit quod earum dignissimos earum voluptatibus maiores.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 2.00, 0, 0, 4413.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (4, NULL, 'ducimus', 'Nihil maiores enim beatae eos exercitationem.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 1.00, 0, 0, 7707.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (5, NULL, 'eum', 'Quaerat illo accusantium alias.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 3.00, 0, 0, 1116.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (6, NULL, 'voluptatem', 'Et pariatur mollitia dolor iure explicabo sed.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 4.00, 0, 0, 1426.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (7, NULL, 'sed', 'Et modi perferendis dolorem architecto qui repellendus quia.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 0.00, 0, 0, 1050.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (8, NULL, 'qui', 'Repellendus sequi aut corporis id.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 4.00, 0, 0, 1312.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (9, NULL, 'sit', 'Maxime ratione dolor consequatur aut et.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 5.00, 0, 0, 2676.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (10, NULL, 'qui', 'Eligendi veniam officiis maxime voluptates.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 0.00, 0, 0, 6009.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (11, NULL, 'asperiores', 'Cumque et sint laboriosam molestiae ipsum rem voluptatibus.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 4.00, 0, 0, 4417.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (12, NULL, 'vero', 'Aut et iusto nobis rerum recusandae aut rerum et.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 1, 5.00, 0, 0, 1307.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (13, NULL, 'eveniet', 'A consequatur commodi error harum tenetur ut.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 3.00, 0, 0, 8581.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (14, NULL, 'ab', 'Velit odit temporibus explicabo fugiat.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 3.00, 0, 0, 547.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (15, NULL, 'asperiores', 'Qui sunt nostrum et consequatur nam rerum.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 1, 0.00, 0, 0, 2203.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (16, NULL, 'cupiditate', 'Voluptatem aut et non rerum.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 3.00, 0, 0, 1576.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (17, NULL, 'omnis', 'Ipsum sequi ut atque ea.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 5.00, 0, 0, 2108.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (18, NULL, 'aperiam', 'Vel nemo beatae id hic eos sunt.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 1, 0.00, 0, 0, 259.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (19, NULL, 'sint', 'Aut temporibus libero reprehenderit aliquid exercitationem.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 5.00, 0, 0, 2034.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (20, NULL, 'non', 'Ea commodi aliquam fugiat omnis cumque aliquam assumenda odio.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 2.00, 0, 0, 894.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (21, NULL, 'earum', 'Eius repudiandae quisquam illo odio.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 1.00, 0, 0, 1452.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (22, NULL, 'non', 'Et minima molestiae accusamus quisquam qui.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 1.00, 0, 0, 1614.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (23, NULL, 'expedita', 'Nam ipsum voluptatem accusamus non ut quibusdam.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 4.00, 0, 0, 2837.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (24, NULL, 'et', 'Vitae consequatur et consequatur ullam cum sit aliquid.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 5.00, 0, 0, 977.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (25, NULL, 'sint', 'Pariatur itaque unde et debitis.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 1.00, 0, 0, 3007.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (26, NULL, 'quis', 'Non aliquid voluptas pariatur impedit porro.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 4.00, 0, 0, 1045.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (27, NULL, 'cupiditate', 'Ea placeat voluptates culpa nemo est architecto labore.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 4.00, 0, 0, 59.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (28, NULL, 'fugit', 'Ratione autem at enim et sint beatae nobis.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 1, 3.00, 0, 0, 3558.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (29, NULL, 'consequatur', 'Nemo quis officiis porro et.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 1, 4.00, 0, 0, 432.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (30, NULL, 'quo', 'Itaque voluptatem soluta omnis ipsa ut.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 5.00, 0, 0, 1275.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (31, NULL, 'aut', 'Iste fuga a quia harum nihil dignissimos.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 1, 5.00, 0, 0, 609.00, '2019-07-23 08:47:55', '2019-07-23 08:47:55');
INSERT INTO `products` VALUES (32, 14, 'ducimus', 'Exercitationem exercitationem in veniam eos ratione.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 3.00, 0, 0, 1959.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (33, 2, 'neque', 'Deserunt culpa at aperiam earum quidem.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 1.00, 0, 0, 4103.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (34, 26, 'in', 'Rerum est est a voluptates soluta nostrum voluptatem.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 0.00, 0, 0, 786.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (35, 21, 'fuga', 'Laudantium quos et qui.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 1, 2.00, 0, 0, 1293.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (36, 12, 'assumenda', 'Sed et aut dolorum earum quo.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 4.00, 0, 0, 2282.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (37, 20, 'neque', 'Quae quasi quia itaque similique omnis in esse.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 3.00, 0, 0, 2270.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (38, 19, 'totam', 'Et molestiae alias sed natus odit facere qui.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 5.00, 0, 0, 3761.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (39, 30, 'velit', 'Distinctio qui aliquam et deleniti.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/2JMRaFwRpo.jpg', 1, 1.00, 0, 0, 406.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (40, 19, 'est', 'Voluptatibus nihil dignissimos mollitia quia.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 1.00, 0, 0, 2145.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (41, 11, 'molestiae', 'Qui veniam veniam incidunt.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 2.00, 0, 0, 2668.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (42, 25, 'dolor', 'Dolor laudantium qui enim voluptates ea.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 5.00, 0, 0, 2705.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (43, 20, 'ducimus', 'Qui ea rerum velit dolorum commodi.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 2.00, 0, 0, 4013.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (44, 6, 'sed', 'Voluptatem blanditiis est velit sunt provident.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 5.00, 0, 0, 1416.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (45, 26, 'voluptatibus', 'Sit suscipit sapiente porro iusto est cum.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 0.00, 0, 0, 2095.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (46, 19, 'ut', 'Aut aperiam voluptas consequatur.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 0.00, 0, 0, 2919.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (47, 13, 'minima', 'Autem est ea hic rem natus quasi ipsa.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/XrtIwzrxj7.jpg', 1, 5.00, 0, 0, 4492.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (48, 2, 'nam', 'Sint harum occaecati dolores nesciunt.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 0.00, 0, 0, 1842.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (49, 4, 'cupiditate', 'Et quam ducimus nobis dolorum autem ut numquam.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 5.00, 0, 0, 2449.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (50, 30, 'rerum', 'Impedit qui sit omnis dolores quae.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 3.00, 0, 0, 3631.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (51, 19, 'ipsam', 'Accusantium deleniti earum quae voluptate voluptates omnis autem.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 3.00, 0, 0, 7903.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (52, 5, 'error', 'Nobis temporibus qui velit sequi porro iste ut.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/82Wf2sg8gM.jpg', 1, 2.00, 0, 0, 4626.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (53, 25, 'omnis', 'Dignissimos voluptas quas dolore illum rerum officiis.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/nIvBAQO5Pj.jpg', 1, 0.00, 0, 0, 3084.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (54, 3, 'temporibus', 'Eos repellendus cum ratione aspernatur.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/C0bVuKB2nt.jpg', 1, 5.00, 0, 0, 3597.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (55, 26, 'blanditiis', 'Repudiandae et sequi magnam nostrum blanditiis.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/pa7DrV43Mw.jpg', 1, 5.00, 0, 0, 836.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (56, 8, 'repellendus', 'Animi minima cupiditate eaque vitae quaerat magni voluptas.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/r3BNRe4zXG.jpg', 1, 5.00, 0, 0, 322.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (57, 27, 'quis', 'Quibusdam illo quia et soluta occaecati sit.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/1B3n0ATKrn.jpg', 1, 2.00, 0, 0, 2315.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (58, 18, 'vitae', 'Labore distinctio hic magni sed ea impedit et.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 0.00, 0, 0, 1715.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (59, 27, 'veniam', 'Repellat et quasi id dolores velit omnis quibusdam.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 0.00, 0, 0, 3291.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (60, 4, 'quia', 'Odio dignissimos beatae dolor neque quia.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/uYEHCJ1oRp.jpg', 1, 2.00, 0, 0, 3011.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');
INSERT INTO `products` VALUES (61, 15, 'dolores', 'Ut suscipit itaque eligendi aut saepe officiis error aperiam.', 'https://cdn.learnku.com/uploads/images/201806/01/5320/7kG1HekGK6.jpg', 1, 5.00, 0, 0, 1626.00, '2019-07-25 08:59:42', '2019-07-25 08:59:42');

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
INSERT INTO `user_addresses` VALUES (6, 1, '北京市', '市辖区', '东城区', '第15街道第5556号', 61000, '夏海洋', '18584864076', '2019-07-25 06:25:48', '2019-07-23 07:59:23', '2019-07-25 06:25:48');

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
