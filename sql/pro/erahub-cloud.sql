/*
 Navicat Premium Data Transfer

 Source Server         : 1.117.176.57
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 1.117.176.57:3306
 Source Schema         : erahub-cloud

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 03/01/2023 18:52:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for biz_finance_erp_project
-- ----------------------------
DROP TABLE IF EXISTS `biz_finance_erp_project`;
CREATE TABLE `biz_finance_erp_project`  (
  `project_id` bigint(0) NOT NULL COMMENT 'ERP工程ID',
  `project_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ERP工单号',
  `requisition_number` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'ERP请购单号',
  `device_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ERP装置名称',
  `project_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'ERP工程名称',
  `plan_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '计划类别',
  `department` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '单位',
  `settlement_review_amount` decimal(60, 0) NULL DEFAULT NULL COMMENT '结算审核额',
  `contract_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '合同编号',
  `project_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '工程类别',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`project_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'ERP工程明细表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of biz_finance_erp_project
-- ----------------------------

-- ----------------------------
-- Table structure for blog_article
-- ----------------------------
DROP TABLE IF EXISTS `blog_article`;
CREATE TABLE `blog_article`  (
  `article_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `category_id` int(0) NULL DEFAULT NULL COMMENT '文章分类ID',
  `article_cover` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '文章缩略图',
  `article_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '文章标题',
  `article_content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '文章内容',
  `is_top` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否置顶 0否 1是',
  `is_featured` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否推荐 0否 1是',
  `is_delete` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '0' COMMENT '是否删除  0否 1是',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '状态值 1公开 2私密 3草稿',
  `type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '文章类型 1原创 2转载 3翻译',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问密码',
  `original_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原文链接',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '发表时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`article_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1604081892463243266 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '博客文章表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article
-- ----------------------------
INSERT INTO `blog_article` VALUES (1604060262542467074, 11, 'http://127.0.0.1:9000/erahub/2022/12/02/4cc68162eeff43d88b1b751adde1bb95.jpg', '11dddsss', NULL, '1', '1', '0', '2', '2', '11', '11', 'admin', '2022-12-17 18:25:43', 'admin', '2022-12-18 17:24:58');
INSERT INTO `blog_article` VALUES (1604081892463243265, 123, 'http://127.0.0.1:9000/erahub/2022/12/11/49b8cc3fe7d0461f8c44f02d3ef830c7.jpg', 'sss', '', '0', '0', '0', '1', '1', NULL, NULL, 'test', '2022-12-17 19:51:40', 'admin', '2022-12-19 18:02:11');

-- ----------------------------
-- Table structure for blog_article_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_article_tag`;
CREATE TABLE `blog_article_tag`  (
  `article_id` bigint(0) NOT NULL COMMENT '文章ID',
  `tag_id` bigint(0) NOT NULL COMMENT '标签ID',
  PRIMARY KEY (`article_id`, `tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '博客文章和标签关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_article_tag
-- ----------------------------

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category`  (
  `category_id` bigint(0) NOT NULL COMMENT '分类ID',
  `category_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '分类名',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '1' COMMENT '分类状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '发表时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '博客分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES (1605159324440162305, 'ss', '0', 'admin', '2022-12-20 19:13:00', 'admin', '2022-12-20 19:13:00', 'ss');
INSERT INTO `blog_category` VALUES (1605166598017581057, 'ss', '0', 'admin', '2022-12-20 19:41:54', 'admin', '2022-12-20 19:41:54', 's');

-- ----------------------------
-- Table structure for blog_tag
-- ----------------------------
DROP TABLE IF EXISTS `blog_tag`;
CREATE TABLE `blog_tag`  (
  `tag_id` bigint(0) NOT NULL COMMENT '标签ID',
  `tag_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '标签名',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '标签状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '创建者',
  `create_time` datetime(0) NOT NULL COMMENT '发表时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`tag_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '博客标签表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_tag
-- ----------------------------
INSERT INTO `blog_tag` VALUES (1605165450388885506, 'ss', '0', 'admin', '2022-12-20 19:37:21', 'admin', '2022-12-20 19:37:21', 'ss');
INSERT INTO `blog_tag` VALUES (1605166617282019330, 's', '1', 'admin', '2022-12-20 19:41:59', 'admin', '2022-12-20 19:42:05', 'sss');

-- ----------------------------
-- Table structure for blog_user
-- ----------------------------
DROP TABLE IF EXISTS `blog_user`;
CREATE TABLE `blog_user`  (
  `blog_user_id` bigint(0) NOT NULL COMMENT '博客用户ID',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '邮箱号',
  `blog_user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '博客用户名称',
  `nick_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '博客用户昵称',
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '2' COMMENT '用户性别（0男 1女 2未知）',
  `intro` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '用户简介',
  `website` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '个人网站',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`blog_user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '博客用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of blog_user
-- ----------------------------

-- ----------------------------
-- Table structure for bs_notice
-- ----------------------------
DROP TABLE IF EXISTS `bs_notice`;
CREATE TABLE `bs_notice`  (
  `notice_id` bigint(0) NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_notice
-- ----------------------------

-- ----------------------------
-- Table structure for bs_oss
-- ----------------------------
DROP TABLE IF EXISTS `bs_oss`;
CREATE TABLE `bs_oss`  (
  `oss_id` bigint(0) NOT NULL COMMENT '对象存储主键',
  `file_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'URL地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '上传人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新人',
  `service` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'OSS对象存储表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_oss
-- ----------------------------
INSERT INTO `bs_oss` VALUES (1609742595688210433, '2023/01/02/58dd74b3bc304774947dcb1acf998882.jpg', '6fda9fc715ad61e2a439fbd606a86a7e5080f2dc_raw.jpg', '.jpg', 'http://1.117.176.57:9000/erahub/2023/01/02/58dd74b3bc304774947dcb1acf998882.jpg', '2023-01-02 10:45:17', 'admin', '2023-01-02 10:45:17', 'admin', 'minio');
INSERT INTO `bs_oss` VALUES (1610192748823945218, '2023/01/03/445d32cc647d4b1db0d7f8e66f5ecc93.xls', '1.xls', '.xls', 'http://1.117.176.57:9000/erahub/2023/01/03/445d32cc647d4b1db0d7f8e66f5ecc93.xls', '2023-01-03 16:34:02', 'admin', '2023-01-03 16:34:02', 'admin', 'minio');

-- ----------------------------
-- Table structure for bs_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `bs_oss_config`;
CREATE TABLE `bs_oss_config`  (
  `oss_config_id` bigint(0) NOT NULL COMMENT '主建',
  `config_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '域',
  `access_policy` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '1' COMMENT '桶权限类型(0=private 1=public 2=custom)',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '状态（0=正常,1=停用）',
  `ext1` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '对象存储配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bs_oss_config
-- ----------------------------
INSERT INTO `bs_oss_config` VALUES (1, 'minio', 'erahub', 'erahub123', 'erahub', '', '1.117.176.57:9000', '', 'N', '', '1', '0', '', 'admin', '2022-09-10 17:10:48', 'admin', '2023-01-02 10:38:12', '');
INSERT INTO `bs_oss_config` VALUES (2, 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'erahub147258369', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '1', '', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-12 18:34:29', '');
INSERT INTO `bs_oss_config` VALUES (3, 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'erahub', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '1', '', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-12 10:29:29', '');
INSERT INTO `bs_oss_config` VALUES (4, 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'erahub-1250000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '1', '', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-12 10:29:33', '');
INSERT INTO `bs_oss_config` VALUES (5, 'minio-lp', 'minioadmin', 'minioadmin', 'priv-lp', '', '127.0.0.1:9000', '', 'N', '', '0', '1', '', 'admin', '2022-09-10 17:10:48', 'admin', '2022-12-11 12:50:27', '');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint(0) NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-red', 'Y', 'admin', '2022-09-10 17:10:48', 'admin', '2022-12-03 18:22:21', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-20 14:39:07', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-20 15:14:48', '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-19 10:28:31', '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 'admin', '2022-09-10 17:10:48', 'admin', '2023-01-02 10:41:24', 'true:开启, false:关闭');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'EH科技', 0, 'EH', '15888888888', 'eh@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-12 17:01:52');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '南京总公司', 1, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:25:33');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '上海分公司', 2, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:26:09');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:27:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:25:45');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:25:49');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:25:53');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:25:59');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:26:13');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, 'erahub', '15888888888', 'erahub@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-17 10:26:18');
INSERT INTO `sys_dept` VALUES (1571078717323554817, 105, '0,100,101,105', '测试部门A', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-17 18:08:50', 'admin', '2022-09-17 18:08:50');
INSERT INTO `sys_dept` VALUES (1571078749145739265, 1571078717323554817, '0,100,101,105,1571078717323554817', '测试部门AA', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-17 18:08:58', 'admin', '2022-09-17 18:08:58');
INSERT INTO `sys_dept` VALUES (1571078778984017922, 1571078749145739265, '0,100,101,105,1571078717323554817,1571078749145739265', '测试部门AAA', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-17 18:09:05', 'admin', '2022-09-17 18:09:05');
INSERT INTO `sys_dept` VALUES (1571080170138185729, 1571078778984017922, '0,100,101,105,1571078717323554817,1571078749145739265,1571078778984017922', '测试部门AAAA', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-17 18:14:36', 'admin', '2022-09-17 18:14:36');
INSERT INTO `sys_dept` VALUES (1571080202354634754, 1571080170138185729, '0,100,101,105,1571078717323554817,1571078749145739265,1571078778984017922,1571080170138185729', '测试部门AAAAA', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-17 18:14:44', 'admin', '2022-09-17 18:14:44');
INSERT INTO `sys_dept` VALUES (1571080230607466498, 1571080202354634754, '0,100,101,105,1571078717323554817,1571078749145739265,1571078778984017922,1571080170138185729,1571080202354634754', '测试部门AAAAAA', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-17 18:14:51', 'admin', '2022-09-17 18:14:51');
INSERT INTO `sys_dept` VALUES (1574282456201113601, 1571078717323554817, '0,100,101,105,1571078717323554817', '测试部门B', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-26 14:19:21', 'admin', '2022-09-26 14:19:21');
INSERT INTO `sys_dept` VALUES (1574282486169415681, 1574282456201113601, '0,100,101,105,1571078717323554817,1574282456201113601', '测试部门C', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-26 14:19:28', 'admin', '2022-09-26 14:19:28');
INSERT INTO `sys_dept` VALUES (1574282516406153217, 1574282486169415681, '0,100,101,105,1571078717323554817,1574282456201113601,1574282486169415681', '测试部门D', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-26 14:19:35', 'admin', '2022-09-26 14:19:35');
INSERT INTO `sys_dept` VALUES (1574282653543116802, 1574282516406153217, '0,100,101,105,1571078717323554817,1574282456201113601,1574282486169415681,1574282516406153217', '测试部门E', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-26 14:20:08', 'admin', '2022-09-26 14:20:08');
INSERT INTO `sys_dept` VALUES (1574282681611399170, 1574282653543116802, '0,100,101,105,1571078717323554817,1574282456201113601,1574282486169415681,1574282516406153217,1574282653543116802', '测试部门F', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-26 14:20:15', 'admin', '2022-09-26 14:20:15');
INSERT INTO `sys_dept` VALUES (1574282704453578754, 1574282681611399170, '0,100,101,105,1571078717323554817,1574282456201113601,1574282486169415681,1574282516406153217,1574282653543116802,1574282681611399170', '测试部门G', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-26 14:20:20', 'admin', '2022-09-26 14:20:20');
INSERT INTO `sys_dept` VALUES (1574282842853027842, 1574282704453578754, '0,100,101,105,1571078717323554817,1574282456201113601,1574282486169415681,1574282516406153217,1574282653543116802,1574282681611399170,1574282704453578754', '测试部门H', 1, NULL, NULL, NULL, '0', '2', 'admin', '2022-09-26 14:20:53', 'admin', '2022-09-26 14:20:53');
INSERT INTO `sys_dept` VALUES (1580862888259334146, 1574282681611399170, '0,100,101,105,1571078717323554817,1574282456201113601,1574282486169415681,1574282516406153217,1574282653543116802,1574282681611399170', '测试部门V', 0, NULL, NULL, NULL, '0', '2', 'admin', '2022-10-14 18:07:38', 'admin', '2022-10-14 18:07:38');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-12-08 18:50:40', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-20 09:01:35', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (1604040132781514753, 1, '是', '1', 'blog_article_top', NULL, 'success', 'N', '0', 'admin', '2022-12-17 17:05:44', 'admin', '2022-12-18 17:26:42', NULL);
INSERT INTO `sys_dict_data` VALUES (1604040775759929345, 1, '是', '1', 'blog_article_featured', NULL, 'success', 'N', '0', 'admin', '2022-12-17 17:08:17', 'admin', '2022-12-18 17:26:48', NULL);
INSERT INTO `sys_dict_data` VALUES (1604040814603378689, 2, '否', '0', 'blog_article_featured', NULL, 'info', 'N', '0', 'admin', '2022-12-17 17:08:27', 'admin', '2022-12-18 17:24:43', NULL);
INSERT INTO `sys_dict_data` VALUES (1604041000348131329, 1, '公开', '1', 'blog_article_status', NULL, 'success', 'N', '0', 'admin', '2022-12-17 17:09:11', 'admin', '2022-12-17 17:10:00', '公开文章');
INSERT INTO `sys_dict_data` VALUES (1604041151041085442, 2, '私密', '2', 'blog_article_status', NULL, 'primary', 'N', '0', 'admin', '2022-12-17 17:09:47', 'admin', '2022-12-17 17:10:06', '私密文章');
INSERT INTO `sys_dict_data` VALUES (1604041306075144194, 3, '草稿', '3', 'blog_article_status', NULL, 'info', 'N', '0', 'admin', '2022-12-17 17:10:24', 'admin', '2022-12-17 17:10:24', '草稿文章');
INSERT INTO `sys_dict_data` VALUES (1604041610262847490, 1, '原创', '1', 'blog_article_type', NULL, 'success', 'N', '0', 'admin', '2022-12-17 17:11:36', 'admin', '2022-12-17 17:11:36', '原创文章');
INSERT INTO `sys_dict_data` VALUES (1604041716135469057, 2, '转载', '2', 'blog_article_type', NULL, 'primary', 'N', '0', 'admin', '2022-12-17 17:12:01', 'admin', '2022-12-17 17:12:01', '转载文章');
INSERT INTO `sys_dict_data` VALUES (1604041776072073217, 3, '翻译', '3', 'blog_article_type', NULL, 'info', 'N', '0', 'admin', '2022-12-17 17:12:16', 'admin', '2022-12-17 17:12:26', '翻译文章');
INSERT INTO `sys_dict_data` VALUES (1604407232372985857, 2, '否', '0', 'blog_article_top', NULL, 'info', 'N', '0', 'admin', '2022-12-18 17:24:27', 'admin', '2022-12-18 17:24:27', NULL);
INSERT INTO `sys_dict_data` VALUES (1604795986233315330, 2, '回收站', '1', 'blog_article_delete', NULL, 'danger', 'N', '0', 'admin', '2022-12-19 19:09:13', 'admin', '2022-12-19 19:41:44', NULL);
INSERT INTO `sys_dict_data` VALUES (1604796105099890689, 1, '发表中', '0', 'blog_article_delete', NULL, 'success', 'N', '0', 'admin', '2022-12-19 19:09:42', 'admin', '2022-12-19 19:41:33', NULL);
INSERT INTO `sys_dict_data` VALUES (1605147913261518850, 1, '正常', '0', 'blog_category_status', NULL, 'success', 'N', '0', 'admin', '2022-12-20 18:27:39', 'admin', '2022-12-20 18:27:39', NULL);
INSERT INTO `sys_dict_data` VALUES (1605147974510940161, 2, '停用', '1', 'blog_category_status', NULL, 'danger', 'N', '0', 'admin', '2022-12-20 18:27:54', 'admin', '2022-12-20 18:27:54', NULL);
INSERT INTO `sys_dict_data` VALUES (1605148171500621826, 1, '正常', '0', 'blog_tag_status', NULL, 'success', 'N', '0', 'admin', '2022-12-20 18:28:41', 'admin', '2022-12-20 18:28:41', NULL);
INSERT INTO `sys_dict_data` VALUES (1605148230401232897, 2, '停用', '1', 'blog_tag_status', NULL, 'danger', 'N', '0', 'admin', '2022-12-20 18:28:55', 'admin', '2022-12-20 18:28:55', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-20 09:24:53', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-20 09:16:46', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (1604038001353662465, '博客文章置顶', 'blog_article_top', '0', 'admin', '2022-12-17 16:57:16', 'admin', '2022-12-17 16:57:16', '博客文章表');
INSERT INTO `sys_dict_type` VALUES (1604038222871633921, '博客文章推荐', 'blog_article_featured', '0', 'admin', '2022-12-17 16:58:09', 'admin', '2022-12-17 16:58:09', '博客文章表');
INSERT INTO `sys_dict_type` VALUES (1604038459145166849, '博客文章状态', 'blog_article_status', '0', 'admin', '2022-12-17 16:59:05', 'admin', '2022-12-17 16:59:05', '博客文章表');
INSERT INTO `sys_dict_type` VALUES (1604038658206834690, '博客文章类型', 'blog_article_type', '0', 'admin', '2022-12-17 16:59:52', 'admin', '2022-12-17 16:59:52', '博客文章表');
INSERT INTO `sys_dict_type` VALUES (1604795854305677313, '博客文章删除', 'blog_article_delete', '0', 'admin', '2022-12-19 19:08:42', 'admin', '2022-12-19 19:08:42', '博客文章表');
INSERT INTO `sys_dict_type` VALUES (1605147558851219457, '博客分类状态', 'blog_category_status', '0', 'admin', '2022-12-20 18:26:15', 'admin', '2022-12-20 18:26:15', '博客分类表');
INSERT INTO `sys_dict_type` VALUES (1605147784060178434, '博客标签状态', 'blog_tag_status', '0', 'admin', '2022-12-20 18:27:09', 'admin', '2022-12-20 18:29:36', NULL);

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  `login_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '登录地址',
  `browser` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `os` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '操作系统',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1609759166074691585, 'test', '183.209.138.27', '0', '登录成功', '2023-01-02 11:51:08', '江苏省 南京市', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1610068954390175746, 'admin', '180.101.128.246', '0', '登录成功', '2023-01-03 08:22:07', '江苏省 南京市', 'Chrome', 'Windows 7 or Windows Server 2008R2');
INSERT INTO `sys_logininfor` VALUES (1610078778469359617, 'admin', '180.101.128.246', '0', '登录成功', '2023-01-03 09:01:09', '江苏省 南京市', 'Chrome', 'Windows 7 or Windows Server 2008R2');
INSERT INTO `sys_logininfor` VALUES (1610086845110001666, 'admin', '180.101.128.246', '1', '密码输入错误1次', '2023-01-03 09:33:12', '江苏省 南京市', 'Chrome', 'Windows 7 or Windows Server 2008R2');
INSERT INTO `sys_logininfor` VALUES (1610086890089717762, 'admin', '180.101.128.246', '0', '登录成功', '2023-01-03 09:33:23', '江苏省 南京市', 'Chrome', 'Windows 7 or Windows Server 2008R2');
INSERT INTO `sys_logininfor` VALUES (1610096356319272961, 'admin', '180.101.128.246', '0', '登录成功', '2023-01-03 10:11:00', '江苏省 南京市', 'Chrome', 'Windows 7 or Windows Server 2008R2');
INSERT INTO `sys_logininfor` VALUES (1610189335151222785, 'admin', '180.101.128.246', '1', '密码输入错误1次', '2023-01-03 16:20:28', '江苏省 南京市', 'Chrome', 'Windows 7 or Windows Server 2008R2');
INSERT INTO `sys_logininfor` VALUES (1610189372379865090, 'admin', '180.101.128.246', '1', '密码输入错误2次', '2023-01-03 16:20:37', '江苏省 南京市', 'Chrome', 'Windows 7 or Windows Server 2008R2');
INSERT INTO `sys_logininfor` VALUES (1610189425051934721, 'admin', '180.101.128.246', '0', '登录成功', '2023-01-03 16:20:49', '江苏省 南京市', 'Chrome', 'Windows 7 or Windows Server 2008R2');
INSERT INTO `sys_logininfor` VALUES (1610190337954783233, 'admin', '180.101.128.246', '0', '退出成功', '2023-01-03 16:24:27', '江苏省 南京市', 'Chrome', 'Windows 7 or Windows Server 2008R2');
INSERT INTO `sys_logininfor` VALUES (1610190369353342977, 'test', '180.101.128.246', '0', '登录成功', '2023-01-03 16:24:35', '江苏省 南京市', 'Chrome', 'Windows 7 or Windows Server 2008R2');
INSERT INTO `sys_logininfor` VALUES (1610190408070963201, 'test', '180.101.128.246', '0', '退出成功', '2023-01-03 16:24:44', '江苏省 南京市', 'Chrome', 'Windows 7 or Windows Server 2008R2');
INSERT INTO `sys_logininfor` VALUES (1610190443642855425, 'admin', '180.101.128.246', '0', '登录成功', '2023-01-03 16:24:52', '江苏省 南京市', 'Chrome', 'Windows 7 or Windows Server 2008R2');
INSERT INTO `sys_logininfor` VALUES (1610193070824857602, 'admin', '180.101.128.246', '0', '登录成功', '2023-01-03 16:35:19', '江苏省 南京市', 'Chrome', 'Windows 7 or Windows Server 2008R2');
INSERT INTO `sys_logininfor` VALUES (1610206949227339778, 'admin', '183.209.138.27', '0', '登录成功', '2023-01-03 17:30:28', '江苏省 南京市', 'Chrome', 'Windows 10 or Windows Server 2016');
INSERT INTO `sys_logininfor` VALUES (1610220465124515842, 'admin', '183.209.138.27', '0', '登录成功', '2023-01-03 18:24:10', '江苏省 南京市', 'Chrome', 'Windows 10 or Windows Server 2016');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-09-10 17:10:48', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-09-10 17:10:48', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-09-10 17:10:48', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (5, '博客管理', 0, 5, 'blog', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'star', 'admin', '2022-09-10 17:10:57', 'admin', '2022-12-17 16:52:06', '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-09-10 17:10:48', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-09-10 17:10:48', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-09-10 17:10:48', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-09-10 17:10:48', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-09-10 17:10:48', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-09-10 17:10:48', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'systemconfig', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-13 14:44:57', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1588742925398171649, 1, 'notice', 'basicservice/notice/index', '', 1, 0, 'C', '0', '0', 'basicservice:notice:list', 'message', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 12:01:13', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-09-10 17:10:48', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-09-10 17:10:48', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, 'XxlJob', 2, 7, 'Xxljob', 'monitor/xxljob/index', '', 1, 0, 'C', '0', '0', 'monitor:xxljob:list', 'job', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-23 10:44:19', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel', 2, 6, 'Sentinel', 'monitor/sentinel/index', '', 1, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-23 10:44:15', '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos', 2, 8, 'http://1.117.176.57:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2022-09-10 17:10:48', 'admin', '2023-01-02 10:27:46', '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin', 2, 5, 'Admin', 'monitor/admin/index', '', 1, 0, 'C', '0', '0', 'monitor:admin:list', 'server', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-23 18:33:28', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '1', 'tool:build:list', 'build', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-01 08:32:36', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-09-10 17:10:48', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (118, '文件管理', 1591655291324977153, 1, 'oss', 'basicservice/oss/index', '', 1, 0, 'C', '0', '0', 'basicservice:oss:list', 'upload', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-13 12:55:29', '文件管理菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'system/operlog/index', '', 1, 0, 'C', '0', '0', 'system:operlog:list', 'form', 'admin', '2022-09-10 17:10:48', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'system/logininfor/index', '', 1, 0, 'C', '0', '0', 'system:logininfor:list', 'logininfor', 'admin', '2022-09-10 17:10:48', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:notice:query', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:42:37', '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:notice:add', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:42:42', '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:notice:edit', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:42:47', '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:notice:remove', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:42:52', '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:operlog:export', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:logininfor:export', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-09-10 17:10:48', 'test01', '2022-11-05 19:00:24', '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:oss:query', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:43:03', '');
INSERT INTO `sys_menu` VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:oss:upload', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:43:07', '');
INSERT INTO `sys_menu` VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:oss:download', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:43:15', '');
INSERT INTO `sys_menu` VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:oss:remove', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 17:43:20', '');
INSERT INTO `sys_menu` VALUES (1604, '配置添加', 1591655913331871746, 2, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:oss:config:add', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-13 13:00:50', '');
INSERT INTO `sys_menu` VALUES (1605, '配置编辑', 1591655913331871746, 3, '#', '', '', 1, 0, 'F', '0', '0', 'basicservice:oss:config:edit', '#', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-13 13:00:43', '');
INSERT INTO `sys_menu` VALUES (1570009901798481921, '缓存监控', 2, 2, 'cache', 'monitor/cache/index', NULL, 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-09-14 19:21:45', 'admin', '2022-11-05 11:18:09', '');
INSERT INTO `sys_menu` VALUES (1570010319794429953, '缓存列表', 2, 3, 'cacheList', 'monitor/cache/list', NULL, 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-09-14 19:23:24', 'admin', '2022-09-14 19:23:24', '');
INSERT INTO `sys_menu` VALUES (1570022388644143106, '服务监控', 2, 4, 'server', 'monitor/server/index', NULL, 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-09-14 20:11:22', 'admin', '2022-09-15 18:39:17', '');
INSERT INTO `sys_menu` VALUES (1570758202780676098, 'Minio', 2, 9, 'http://1.117.176.57:9000', '', NULL, 0, 0, 'C', '0', '0', 'monitor:minio:list', 'upload', 'admin', '2022-09-16 20:55:13', 'admin', '2023-01-02 10:27:38', '');
INSERT INTO `sys_menu` VALUES (1572393811995209730, 'Seata', 2, 10, 'http://1.117.176.57:7091', NULL, NULL, 0, 0, 'C', '0', '0', 'monitor:seata:list', 'tool', 'admin', '2022-09-21 09:14:33', 'admin', '2023-01-02 10:27:32', '');
INSERT INTO `sys_menu` VALUES (1588077119135821826, '数据库文档', 3, 2, 'dbDoc', 'tool/dbDoc/index', NULL, 1, 0, 'C', '0', '0', 'tool:database:doc:list', 'date-range', 'admin', '2022-11-03 15:54:25', 'admin', '2022-11-05 17:20:41', '');
INSERT INTO `sys_menu` VALUES (1588092486994432002, '数据库文档导出', 1588077119135821826, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'tool:database:doc:export', '#', 'admin', '2022-11-03 16:55:29', 'admin', '2022-11-05 17:41:58', '');
INSERT INTO `sys_menu` VALUES (1588742925398171649, '基础服务', 0, 4, 'basicservice', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'server', 'admin', '2022-11-05 12:00:05', 'admin', '2022-11-05 12:00:05', '');
INSERT INTO `sys_menu` VALUES (1591655291324977153, '文件服务', 1588742925398171649, 2, 'file', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'clipboard', 'admin', '2022-11-13 12:52:48', 'admin', '2022-11-13 14:39:19', '');
INSERT INTO `sys_menu` VALUES (1591655913331871746, '配置管理', 1591655291324977153, 2, 'ossconfig', 'basicservice/oss/config', NULL, 1, 0, 'C', '0', '0', 'basicservice:oss:config:list', 'system', 'admin', '2022-11-13 12:55:16', 'admin', '2022-11-13 14:44:44', '');
INSERT INTO `sys_menu` VALUES (1591657525559414786, '配置查询', 1591655913331871746, 1, '', NULL, NULL, 1, 0, 'F', '0', '0', 'basicservice:oss:config:query', '#', 'admin', '2022-11-13 13:01:40', 'admin', '2022-11-13 13:01:40', '');
INSERT INTO `sys_menu` VALUES (1591657626285625346, '配置删除', 1591655913331871746, 4, '', NULL, NULL, 1, 0, 'F', '0', '0', 'basicservice:oss:config:remove', '#', 'admin', '2022-11-13 13:02:04', 'admin', '2022-11-13 13:02:04', '');
INSERT INTO `sys_menu` VALUES (1604042195666051072, '博客文章', 1604778822075994114, 1, 'article', 'blog/article/index', NULL, 1, 0, 'C', '0', '0', 'blog:article:list', 'form', 'admin', '2022-12-17 17:14:05', 'admin', '2022-12-19 18:01:37', '博客文章菜单');
INSERT INTO `sys_menu` VALUES (1604042195666051073, '博客文章查询', 1604042195666051072, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:query', '#', 'admin', '2022-12-17 17:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604042195666051074, '博客文章新增', 1604042195666051072, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:add', '#', 'admin', '2022-12-17 17:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604042195666051075, '博客文章修改', 1604042195666051072, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:edit', '#', 'admin', '2022-12-17 17:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604042195666051076, '博客文章删除', 1604042195666051072, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:remove', '#', 'admin', '2022-12-17 17:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604042195666051077, '博客文章导出', 1604042195666051072, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:article:export', '#', 'admin', '2022-12-17 17:14:05', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604778822075994114, '文章管理', 5, 1, 'article', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2022-12-19 18:01:01', 'admin', '2022-12-19 18:01:28', '');
INSERT INTO `sys_menu` VALUES (1605153186864795648, '博客分类', 1604778822075994114, 2, 'category', 'blog/category/index', NULL, 1, 0, 'C', '0', '0', 'blog:category:list', 'checkbox', 'admin', '2022-12-20 18:48:45', 'admin', '2022-12-20 19:30:58', '博客分类菜单');
INSERT INTO `sys_menu` VALUES (1605153186864795649, '博客分类查询', 1605153186864795648, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:query', '#', 'admin', '2022-12-20 18:48:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605153186864795650, '博客分类新增', 1605153186864795648, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:add', '#', 'admin', '2022-12-20 18:48:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605153186864795651, '博客分类修改', 1605153186864795648, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:edit', '#', 'admin', '2022-12-20 18:48:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605153186864795652, '博客分类删除', 1605153186864795648, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:remove', '#', 'admin', '2022-12-20 18:48:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605153186864795653, '博客分类导出', 1605153186864795648, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:category:export', '#', 'admin', '2022-12-20 18:48:45', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605160868417998848, '博客标签', 1604778822075994114, 3, 'tag', 'blog/tag/index', NULL, 1, 0, 'C', '0', '0', 'blog:tag:list', 'list', 'admin', '2022-12-20 19:19:44', 'admin', '2022-12-20 19:31:05', '博客标签菜单');
INSERT INTO `sys_menu` VALUES (1605160868417998849, '博客标签查询', 1605160868417998848, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tag:query', '#', 'admin', '2022-12-20 19:19:44', 'admin', '2022-12-20 19:25:29', '');
INSERT INTO `sys_menu` VALUES (1605160868417998850, '博客标签新增', 1605160868417998848, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tag:add', '#', 'admin', '2022-12-20 19:19:44', 'admin', '2022-12-20 19:25:35', '');
INSERT INTO `sys_menu` VALUES (1605160868417998851, '博客标签修改', 1605160868417998848, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tag:edit', '#', 'admin', '2022-12-20 19:19:44', 'admin', '2022-12-20 19:25:41', '');
INSERT INTO `sys_menu` VALUES (1605160868417998852, '博客标签删除', 1605160868417998848, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tag:remove', '#', 'admin', '2022-12-20 19:19:44', 'admin', '2022-12-20 19:25:46', '');
INSERT INTO `sys_menu` VALUES (1605160868417998853, '博客标签导出', 1605160868417998848, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'blog:tag:export', '#', 'admin', '2022-12-20 19:19:44', 'admin', '2022-12-20 19:25:53', '');
INSERT INTO `sys_menu` VALUES (1609385420790530049, '业务管理', 0, 6, 'biz', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'documentation', 'admin', '2023-01-01 11:06:00', 'admin', '2023-01-01 11:23:33', '');
INSERT INTO `sys_menu` VALUES (1609385690836598786, '财务管理', 1609385420790530049, 1, 'finance', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'money', 'admin', '2023-01-01 11:07:04', 'admin', '2023-01-01 11:07:04', '');
INSERT INTO `sys_menu` VALUES (1609386213455265792, 'ERP工程', 1609385690836598786, 1, 'financeERPProject', 'biz/financeERPProject/index', NULL, 1, 0, 'C', '0', '0', 'biz:financeERPProject:list', 'nested', 'admin', '2023-01-01 11:09:21', 'admin', '2023-01-01 11:23:47', 'ERP工程明细菜单');
INSERT INTO `sys_menu` VALUES (1609386213455265793, 'ERP工程明细查询', 1609386213455265792, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:financeERPProject:query', '#', 'admin', '2023-01-01 11:09:21', 'admin', '2023-01-01 11:23:54', '');
INSERT INTO `sys_menu` VALUES (1609386213455265794, 'ERP工程明细新增', 1609386213455265792, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:financeERPProject:add', '#', 'admin', '2023-01-01 11:09:21', 'admin', '2023-01-01 11:23:59', '');
INSERT INTO `sys_menu` VALUES (1609386213455265795, 'ERP工程明细修改', 1609386213455265792, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:financeERPProject:edit', '#', 'admin', '2023-01-01 11:09:21', 'admin', '2023-01-01 11:24:04', '');
INSERT INTO `sys_menu` VALUES (1609386213455265796, 'ERP工程明细删除', 1609386213455265792, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:financeERPProject:remove', '#', 'admin', '2023-01-01 11:09:21', 'admin', '2023-01-01 11:24:09', '');
INSERT INTO `sys_menu` VALUES (1609386213455265797, 'ERP工程明细导出', 1609386213455265792, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'biz:financeERPProject:export', '#', 'admin', '2023-01-01 11:09:21', 'admin', '2023-01-01 11:24:15', '');
INSERT INTO `sys_menu` VALUES (1609400747695906817, 'ERP工程明细导入', 1609386213455265792, 6, '', NULL, NULL, 1, 0, 'F', '0', '0', 'biz:financeERPProject:import', '#', 'admin', '2023-01-01 12:06:54', 'admin', '2023-01-01 12:06:54', '');
INSERT INTO `sys_menu` VALUES (1609738660390871042, 'Kibana', 2, 11, 'http://1.117.176.57:5601', NULL, NULL, 0, 0, 'C', '0', '0', 'monitor:kibana:list', 'log', 'admin', '2023-01-02 10:29:39', 'admin', '2023-01-02 10:33:18', '');
INSERT INTO `sys_menu` VALUES (1609738937630171137, 'Skywalking', 2, 12, 'http://1.117.176.57:18080', NULL, NULL, 0, 0, 'C', '0', '0', 'monitor:skywalking:list', 'tree', 'admin', '2023-01-02 10:30:45', 'admin', '2023-01-02 10:33:46', '');
INSERT INTO `sys_menu` VALUES (1609739163833180161, 'Grafana', 2, 13, 'http://1.117.176.57:3000', NULL, NULL, 0, 0, 'C', '0', '0', 'monitor:grafana:list', 'system', 'admin', '2023-01-02 10:31:39', 'admin', '2023-01-02 10:31:39', '');
INSERT INTO `sys_menu` VALUES (1609739421833207810, 'Prometheus', 2, 14, 'http://1.117.176.57:9090', NULL, NULL, 0, 0, 'C', '0', '0', 'monitor:prometheus:list', 'system', 'admin', '2023-01-02 10:32:40', 'admin', '2023-01-02 10:32:40', '');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1610226733956440066, '操作日志', 9, 'com.erahub.base.system.controller.SysOperlogController.clean()', 'DELETE', 1, 'admin', '', '/operlog/clean', '183.209.138.27', '', '{}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2023-01-03 18:49:05');
INSERT INTO `sys_oper_log` VALUES (1610227424137551873, 'ERP工程', 6, 'com.erahub.biz.finance.controller.BizFinanceERPProjectController.importData()', 'POST', 1, 'admin', '', '/financeERPProject/importData', '183.209.138.27', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":[{\"projectId\":1,\"projectNumber\":\"8301306397\",\"requisitionNumber\":\"5500926332\",\"deviceName\":\"Ⅱ柴油加氢装置\",\"projectName\":\"外委：II柴加2021年大修换热器检维修项目\",\"planType\":\"大修\",\"department\":\"交换\",\"settlementReviewAmount\":\"446104.44\",\"contractNumber\":\"31700000-20-FW1703-0073-BG01\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":2,\"projectNumber\":\"8301559568\",\"requisitionNumber\":\"5501085980\",\"deviceName\":\"异丁烷装置\",\"projectName\":\"外委：C4异构化大修V1401等7台容器常规检修\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"2932.54\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":3,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"1808.53\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":4,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"10774.30\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":5,\"projectNumber\":\"8301667243\",\"requisitionNumber\":\"5501150412\",\"deviceName\":\"四空站\",\"projectName\":\"外委：公用工程气体工区三空站3#离心机电机维修\",\"planType\":\"月度\",\"department\":\"机修\",\"settlementReviewAmount\":\"1319.15\",\"contractNumber\":\"31700000-21-FW1703-0092\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":6,\"projectNumber\":\"8301601285\",\"requisitionNumber\":\"5501103306\",\"deviceName\":\"化工运行二部连续重整装置\",\"projectName\":\"外委：Ⅰ重整E204底等敞口导凝盲盖安装\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"9746.84\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":7,\"projectNumber\":\"8301616291\",\"requisitionNumber\":\"5501115733\",\"deviceName\":\"Ⅱ常减压装置\",\"projectName\":\"外委：Ⅱ常减压装置预热器底部排水管更换\",\"planType\":\"月度\",\"department\":\"管焊\",\"settlementReviewAmount\":\"4812.59\",\"contractNumber\":\"31700000-21-F', 0, '', '2023-01-03 18:51:49');
INSERT INTO `sys_oper_log` VALUES (1610227446455443457, 'ERP工程', 6, 'com.erahub.biz.finance.controller.BizFinanceERPProjectController.importData()', 'POST', 1, 'admin', '', '/financeERPProject/importData', '183.209.138.27', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":[{\"projectId\":1,\"projectNumber\":\"8301306397\",\"requisitionNumber\":\"5500926332\",\"deviceName\":\"Ⅱ柴油加氢装置\",\"projectName\":\"外委：II柴加2021年大修换热器检维修项目\",\"planType\":\"大修\",\"department\":\"交换\",\"settlementReviewAmount\":\"446104.44\",\"contractNumber\":\"31700000-20-FW1703-0073-BG01\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":2,\"projectNumber\":\"8301559568\",\"requisitionNumber\":\"5501085980\",\"deviceName\":\"异丁烷装置\",\"projectName\":\"外委：C4异构化大修V1401等7台容器常规检修\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"2932.54\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":3,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"1808.53\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":4,\"projectNumber\":\"8301442420\",\"requisitionNumber\":\"5501000120\",\"deviceName\":\"Ⅱ催化裂化装置\",\"projectName\":\"外委：II催化2021年大修分馏塔底搅拌蒸汽线拆复（追二）\",\"planType\":\"大修\",\"department\":\"铆焊\",\"settlementReviewAmount\":\"10774.30\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":5,\"projectNumber\":\"8301667243\",\"requisitionNumber\":\"5501150412\",\"deviceName\":\"四空站\",\"projectName\":\"外委：公用工程气体工区三空站3#离心机电机维修\",\"planType\":\"月度\",\"department\":\"机修\",\"settlementReviewAmount\":\"1319.15\",\"contractNumber\":\"31700000-21-FW1703-0092\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":6,\"projectNumber\":\"8301601285\",\"requisitionNumber\":\"5501103306\",\"deviceName\":\"化工运行二部连续重整装置\",\"projectName\":\"外委：Ⅰ重整E204底等敞口导凝盲盖安装\",\"planType\":\"大修\",\"department\":\"管焊\",\"settlementReviewAmount\":\"9746.84\",\"contractNumber\":\"31700000-21-FW1703-0085\",\"projectType\":\"股份\",\"remark\":null},{\"projectId\":7,\"projectNumber\":\"8301616291\",\"requisitionNumber\":\"5501115733\",\"deviceName\":\"Ⅱ常减压装置\",\"projectName\":\"外委：Ⅱ常减压装置预热器底部排水管更换\",\"planType\":\"月度\",\"department\":\"管焊\",\"settlementReviewAmount\":\"4812.59\",\"contractNumber\":\"31700000-21-F', 0, '', '2023-01-03 18:51:54');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2022-09-10 17:10:48', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '管理员', 'common', 2, '2', 1, 1, '0', '2', 'admin', '2022-09-10 17:10:48', 'admin', '2022-11-05 18:39:04', '管理员');
INSERT INTO `sys_role` VALUES (3, '本部门及以下', 'test1', 3, '4', 1, 1, '0', '2', 'admin', '2022-09-10 17:10:57', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES (4, '仅本人', 'test2', 4, '5', 1, 1, '0', '2', 'admin', '2022-09-10 17:10:57', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES (1569245300584591362, 'test01', 'test01', 3, '1', 1, 1, '0', '2', 'admin', '2022-09-12 16:43:29', 'admin', '2022-11-05 18:39:07', NULL);
INSERT INTO `sys_role` VALUES (1575818848019136513, '11111', '1111', 11, '1', 1, 1, '0', '2', 'admin', '2022-09-30 20:04:25', 'admin', '2022-09-30 20:04:25', NULL);
INSERT INTO `sys_role` VALUES (1575820925898309634, '111', '111', 111, '1', 1, 1, '0', '2', 'admin', '2022-09-30 20:12:41', 'admin', '2022-09-30 20:12:41', NULL);
INSERT INTO `sys_role` VALUES (1575821813400453122, '222', '222', 222, '1', 1, 1, '0', '2', 'admin', '2022-09-30 20:16:12', 'admin', '2022-09-30 20:16:12', NULL);
INSERT INTO `sys_role` VALUES (1575826547146485762, 'zzz', 'zzz', 11, '1', 1, 1, '0', '2', 'admin', '2022-09-30 20:35:01', 'admin', '2022-09-30 20:35:01', NULL);
INSERT INTO `sys_role` VALUES (1575832652555735042, '11', '11', 11, '1', 1, 1, '0', '2', 'admin', '2022-09-30 20:59:17', 'admin', '2022-09-30 20:59:17', NULL);
INSERT INTO `sys_role` VALUES (1575836920754982913, '111', '11', 11, '1', 1, 1, '0', '2', 'admin', '2022-09-30 21:16:14', 'admin', '2022-09-30 21:16:14', NULL);
INSERT INTO `sys_role` VALUES (1575838078710042626, '22', '22', 22, '1', 1, 1, '0', '2', 'admin', '2022-09-30 21:20:50', 'admin', '2022-09-30 21:20:50', NULL);
INSERT INTO `sys_role` VALUES (1588844816627372034, '管理员', 'common', 2, '1', 1, 1, '0', '0', 'admin', '2022-11-05 18:44:58', 'admin', '2023-01-02 10:34:16', NULL);
INSERT INTO `sys_role` VALUES (1588845036673142786, 'test01', 'test01', 3, '1', 1, 1, '0', '0', 'admin', '2022-11-05 18:45:51', 'admin', '2022-12-17 08:58:06', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 2);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 3);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 5);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 100);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 101);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 102);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 103);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 104);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 105);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 106);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 107);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 108);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 109);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 110);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 111);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 112);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 113);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 114);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 115);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 118);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 500);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 501);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1001);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1002);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1003);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1004);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1005);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1006);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1007);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1008);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1009);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1010);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1011);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1012);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1013);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1014);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1015);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1016);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1017);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1018);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1019);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1020);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1021);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1022);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1023);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1024);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1025);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1026);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1027);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1028);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1029);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1030);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1031);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1032);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1033);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1034);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1035);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1036);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1037);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1038);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1039);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1040);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1041);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1042);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1043);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1044);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1045);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1046);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1047);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1048);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1050);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1055);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1056);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1057);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1058);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1059);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1060);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1600);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1601);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1602);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1603);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1570009901798481921);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1570010319794429953);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1570022388644143106);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1570758202780676098);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1572393811995209730);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1588077119135821826);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1588092486994432002);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1588742925398171649);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1591655291324977153);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1591655913331871746);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1591657525559414786);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1591657626285625346);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604042195666051072);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604042195666051073);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604042195666051074);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604042195666051075);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604042195666051076);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604042195666051077);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1604778822075994114);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605153186864795648);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605153186864795649);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605153186864795650);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605153186864795651);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605153186864795652);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605153186864795653);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605160868417998848);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605160868417998849);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605160868417998850);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605160868417998851);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605160868417998852);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1605160868417998853);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609385420790530049);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609385690836598786);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609386213455265792);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609386213455265793);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609386213455265794);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609386213455265795);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609386213455265796);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609386213455265797);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609400747695906817);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609738660390871042);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609738937630171137);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609739163833180161);
INSERT INTO `sys_role_menu` VALUES (1588844816627372034, 1609739421833207810);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 2);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 3);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 100);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 101);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 102);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 103);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 104);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 105);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 106);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 107);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 108);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 109);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 110);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 111);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 112);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 113);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 115);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 118);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 500);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 501);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1001);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1002);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1003);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1004);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1005);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1006);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1007);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1008);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1009);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1010);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1011);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1012);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1013);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1014);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1015);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1016);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1017);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1018);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1019);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1020);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1021);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1022);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1023);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1024);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1025);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1026);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1027);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1028);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1029);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1030);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1031);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1032);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1033);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1034);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1035);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1036);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1038);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1040);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1041);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1042);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1043);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1044);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1045);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1046);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1047);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1048);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1050);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1055);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1600);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1601);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1570009901798481921);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1570010319794429953);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1570022388644143106);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1570758202780676098);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1572393811995209730);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1588742925398171649);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1591655291324977153);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1591655913331871746);
INSERT INTO `sys_role_menu` VALUES (1588845036673142786, 1591657525559414786);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'erahub', 'sys_user', '123456@163.com', '13912345678', '0', 'http://1.117.176.57:9000/erahub/2023/01/02/58dd74b3bc304774947dcb1acf998882.jpg', '$2a$10$AzrC.0tmwFX.ML5E1KfcoOz.4o3zii06W/52Gwvic/G..jU3dUwS6', '0', '0', '127.0.0.1', '2022-09-10 17:10:48', 'admin', '2022-09-10 17:10:48', 'admin', '2022-12-11 13:02:57', '管理员');
INSERT INTO `sys_user` VALUES (1588845214859759618, 104, 'test', '管理员', 'sys_user', '1234@sss.com', '15712344556', '0', '', '$2a$10$sShnAptWQ68avyybynnIoO5wbxZUYFGmuCdPR.v67wrQH2k70FimS', '0', '0', '', NULL, 'admin', '2022-11-05 18:46:33', 'admin', '2023-01-02 10:26:25', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (1588845214859759618, 4);
INSERT INTO `sys_user_post` VALUES (1588845286838210561, 4);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1588845214859759618, 1588844816627372034);
INSERT INTO `sys_user_role` VALUES (1588845286838210561, 1588845036673142786);

-- ----------------------------
-- Table structure for test_demo
-- ----------------------------
DROP TABLE IF EXISTS `test_demo`;
CREATE TABLE `test_demo`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '排序号',
  `test_key` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'key键',
  `value` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '值',
  `version` int(0) NULL DEFAULT 0 COMMENT '版本',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '测试单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_demo
-- ----------------------------
INSERT INTO `test_demo` VALUES (1, 102, 4, 1, '测试数据权限', '测试', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (2, 102, 3, 2, '子节点1', '111', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (3, 102, 3, 3, '子节点2', '222', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (4, 108, 4, 4, '测试数据', 'demo', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (5, 108, 3, 13, '子节点11', '1111', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (6, 108, 3, 12, '子节点22', '2222', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (7, 108, 3, 11, '子节点33', '3333', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (8, 108, 3, 10, '子节点44', '4444', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (9, 108, 3, 9, '子节点55', '5555', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (10, 108, 3, 8, '子节点66', '6666', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (11, 108, 3, 7, '子节点77', '7777', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (12, 108, 3, 6, '子节点88', '8888', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_demo` VALUES (13, 108, 3, 5, '子节点99', '9999', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);

-- ----------------------------
-- Table structure for test_tree
-- ----------------------------
DROP TABLE IF EXISTS `test_tree`;
CREATE TABLE `test_tree`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父id',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `tree_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '值',
  `version` int(0) NULL DEFAULT 0 COMMENT '版本',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '测试树表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of test_tree
-- ----------------------------
INSERT INTO `test_tree` VALUES (1, 0, 102, 4, '测试数据权限', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (2, 1, 102, 3, '子节点1', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (3, 2, 102, 3, '子节点2', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (4, 0, 108, 4, '测试树1', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (5, 4, 108, 3, '子节点11', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (6, 4, 108, 3, '子节点22', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (7, 4, 108, 3, '子节点33', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (8, 5, 108, 3, '子节点44', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (9, 6, 108, 3, '子节点55', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (10, 7, 108, 3, '子节点66', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (11, 7, 108, 3, '子节点77', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (12, 10, 108, 3, '子节点88', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);
INSERT INTO `test_tree` VALUES (13, 10, 108, 3, '子节点99', 0, '2022-09-10 17:10:57', 'admin', NULL, NULL, 0);

-- ----------------------------
-- Table structure for to_gen_table
-- ----------------------------
DROP TABLE IF EXISTS `to_gen_table`;
CREATE TABLE `to_gen_table`  (
  `table_id` bigint(0) NOT NULL COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of to_gen_table
-- ----------------------------
INSERT INTO `to_gen_table` VALUES (1600469115549192194, 'blog_user', '博客用户信息表', NULL, NULL, 'BlogUser', 'crud', 'com.erahub.base', 'base', 'user', '博客用户信息', 'erahub', '0', '/', NULL, 'admin', '2022-12-03 13:39:50', 'admin', '2022-12-03 13:39:50', NULL);
INSERT INTO `to_gen_table` VALUES (1604032297792282626, 'blog_article', '博客文章表', NULL, NULL, 'BlogArticle', 'crud', 'com.erahub.blog', 'blog', 'article', '博客分类', 'erahub', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1604778822075994114\"}', 'admin', '2022-12-17 16:34:22', 'admin', '2022-12-20 18:39:09', NULL);
INSERT INTO `to_gen_table` VALUES (1605139861862977537, 'blog_category', '博客分类表', NULL, NULL, 'BlogCategory', 'crud', 'com.erahub.blog', 'blog', 'category', '博客分类', 'erahub', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1604778822075994114\"}', 'admin', '2022-12-20 17:54:08', 'admin', '2022-12-20 18:47:39', NULL);
INSERT INTO `to_gen_table` VALUES (1605139861988806657, 'blog_tag', '博客标签表', NULL, NULL, 'BlogTag', 'crud', 'com.erahub.blog', 'blog', 'tag', '博客标签', 'erahub', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1604778822075994114\"}', 'admin', '2022-12-20 17:48:39', 'admin', '2022-12-20 19:23:54', NULL);
INSERT INTO `to_gen_table` VALUES (1605165953176932354, 'blog_article_tag', '博客文章和标签关联表', NULL, NULL, 'BlogArticleTag', 'crud', 'com.erahub.base', 'base', 'tag', '博客文章和标签关联', 'erahub', '0', '/', NULL, 'admin', '2022-12-20 17:48:52', 'admin', '2022-12-20 17:48:52', NULL);
INSERT INTO `to_gen_table` VALUES (1609381755329544193, 'biz_finance_erp_project', 'ERP工程明细表', NULL, NULL, 'BizFinanceERPProject', 'crud', 'com.erahub.business.finance', 'business', 'financeERPProject', 'ERP工程明细', 'erahub', '0', '/', '{\"treeCode\":null,\"treeName\":null,\"treeParentCode\":null,\"parentMenuId\":\"1609385690836598786\"}', 'admin', '2023-01-01 10:43:23', 'admin', '2023-01-01 11:09:06', NULL);

-- ----------------------------
-- Table structure for to_gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `to_gen_table_column`;
CREATE TABLE `to_gen_table_column`  (
  `column_id` bigint(0) NOT NULL COMMENT '编号',
  `table_id` bigint(0) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of to_gen_table_column
-- ----------------------------
INSERT INTO `to_gen_table_column` VALUES (1600469115616301057, 1600469115549192194, 'blog_user_id', '博客用户ID', 'bigint', 'Long', 'blogUserId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301058, 1600469115549192194, 'email', '邮箱号', 'varchar(50)', 'String', 'email', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301059, 1600469115549192194, 'blog_user_name', '博客用户名称', 'varchar(30)', 'String', 'blogUserName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301060, 1600469115549192194, 'nick_name', '博客用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301061, 1600469115549192194, 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301062, 1600469115549192194, 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301063, 1600469115549192194, 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 7, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301064, 1600469115549192194, 'intro', '用户简介', 'varchar(255)', 'String', 'intro', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301065, 1600469115549192194, 'website', '个人网站', 'varchar(255)', 'String', 'website', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301066, 1600469115549192194, 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301067, 1600469115549192194, 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', '', 11, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301068, 1600469115549192194, 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301069, 1600469115549192194, 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301070, 1600469115549192194, 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301071, 1600469115549192194, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301072, 1600469115549192194, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301073, 1600469115549192194, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301074, 1600469115549192194, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1600469115616301075, 1600469115549192194, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 19, 'admin', '2022-12-07 20:35:47', 'admin', '2022-12-17 16:32:50');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282627, 1604032297792282626, 'id', '文章ID', 'int', 'Long', 'id', '1', '1', '1', NULL, '0', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282628, 1604032297792282626, 'user_id', '作者ID', 'int', 'Long', 'userId', '0', '0', '1', '0', '0', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282629, 1604032297792282626, 'category_id', '文章分类ID', 'int', 'Long', 'categoryId', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282630, 1604032297792282626, 'article_cover', '文章缩略图', 'varchar(1024)', 'String', 'articleCover', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 4, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282631, 1604032297792282626, 'article_title', '标题', 'varchar(50)', 'String', 'articleTitle', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 5, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282632, 1604032297792282626, 'article_content', '内容', 'longtext', 'String', 'articleContent', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'editor', '', 6, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282633, 1604032297792282626, 'is_top', '置顶', 'tinyint(1)', 'Integer', 'isTop', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'blog_article_top', 7, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282634, 1604032297792282626, 'is_featured', '推荐', 'tinyint(1)', 'Integer', 'isFeatured', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'blog_article_featured', 8, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282635, 1604032297792282626, 'is_delete', '删除', 'tinyint(1)', 'Integer', 'isDelete', '0', '0', '1', '0', '0', '0', '0', 'EQ', 'radio', '', 9, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282636, 1604032297792282626, 'status', '状态', 'tinyint(1)', 'Integer', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_status', 10, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282637, 1604032297792282626, 'type', '文章类型', 'tinyint(1)', 'Integer', 'type', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', 'blog_article_type', 11, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282638, 1604032297792282626, 'password', '访问密码', 'varchar(255)', 'String', 'password', '0', '0', '1', '1', '1', '0', '0', 'EQ', 'input', '', 12, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282639, 1604032297792282626, 'original_url', '原文链接', 'varchar(255)', 'String', 'originalUrl', '0', '0', '0', '1', '1', '0', '0', 'EQ', 'input', '', 13, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282640, 1604032297792282626, 'create_time', '发表时间', 'datetime', 'Date', 'createTime', '0', '0', '1', NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 14, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1604032297792282641, 1604032297792282626, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, '1', NULL, 'EQ', 'datetime', '', 15, 'admin', '2022-12-17 16:34:36', 'admin', '2022-12-20 18:39:09');
INSERT INTO `to_gen_table_column` VALUES (1605139861938475009, 1605139861862977537, 'category_id', '分类ID', 'bigint', 'Long', 'categoryId', '1', '0', '1', NULL, '0', '1', '1', 'EQ', 'input', '', 1, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605139861938475010, 1605139861862977537, 'category_name', '分类名', 'varchar(30)', 'String', 'categoryName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605139861938475011, 1605139861862977537, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, '0', '0', 'EQ', 'input', '', 4, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605139861963640833, 1605139861862977537, 'create_time', '发表时间', 'datetime', 'Date', 'createTime', '0', '0', '1', NULL, NULL, '1', '1', 'EQ', 'datetime', '', 5, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605139861963640834, 1605139861862977537, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605139861963640835, 1605139861862977537, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605139861963640836, 1605139861862977537, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '0', NULL, 'EQ', 'textarea', '', 8, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605139862013972482, 1605139861988806657, 'tag_id', '标签ID', 'bigint', 'Long', 'tagId', '1', '0', '1', NULL, '0', '1', '1', 'EQ', 'input', '', 1, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 19:23:54');
INSERT INTO `to_gen_table_column` VALUES (1605139862013972483, 1605139861988806657, 'tag_name', '标签名', 'varchar(30)', 'String', 'tagName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 19:23:54');
INSERT INTO `to_gen_table_column` VALUES (1605139862013972484, 1605139861988806657, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 19:23:54');
INSERT INTO `to_gen_table_column` VALUES (1605139862043332610, 1605139861988806657, 'create_time', '发表时间', 'datetime', 'Date', 'createTime', '0', '0', '1', NULL, NULL, '1', '1', 'BETWEEN', 'datetime', '', 5, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 19:23:54');
INSERT INTO `to_gen_table_column` VALUES (1605139862043332611, 1605139861988806657, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 19:23:54');
INSERT INTO `to_gen_table_column` VALUES (1605139862043332612, 1605139861988806657, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 7, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 19:23:54');
INSERT INTO `to_gen_table_column` VALUES (1605139862043332613, 1605139861988806657, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '1', '1', '1', '0', NULL, 'EQ', 'textarea', '', 8, 'admin', '2022-12-20 17:55:40', 'admin', '2022-12-20 19:23:54');
INSERT INTO `to_gen_table_column` VALUES (1605146761161707521, 1605139861988806657, 'status', '标签状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'blog_tag_status', 3, 'admin', '2022-12-20 18:23:05', 'admin', '2022-12-20 19:23:54');
INSERT INTO `to_gen_table_column` VALUES (1605146769781002242, 1605139861862977537, 'status', '分类状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'radio', 'blog_category_status', 3, 'admin', '2022-12-20 18:23:07', 'admin', '2022-12-20 18:47:39');
INSERT INTO `to_gen_table_column` VALUES (1605165953206292482, 1605165953176932354, 'article_id', '文章ID', 'bigint', 'Long', 'articleId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2022-12-20 19:39:20', 'admin', '2022-12-20 19:39:20');
INSERT INTO `to_gen_table_column` VALUES (1605165953206292483, 1605165953176932354, 'tag_id', '标签ID', 'bigint', 'Long', 'tagId', '1', '0', '1', NULL, '1', '1', NULL, 'EQ', 'input', '', 2, 'admin', '2022-12-20 19:39:20', 'admin', '2022-12-20 19:39:20');
INSERT INTO `to_gen_table_column` VALUES (1609381755354710018, 1609381755329544193, 'project_id', 'ERP工程ID', 'bigint', 'Long', 'projectId', '1', '0', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 1, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');
INSERT INTO `to_gen_table_column` VALUES (1609381755405041666, 1609381755329544193, 'project_number', 'ERP工单号', 'varchar(50)', 'String', 'projectNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');
INSERT INTO `to_gen_table_column` VALUES (1609381755405041667, 1609381755329544193, 'requisition_number', 'ERP请购单号', 'varchar(50)', 'String', 'requisitionNumber', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');
INSERT INTO `to_gen_table_column` VALUES (1609381755405041668, 1609381755329544193, 'device_name', 'ERP装置名称', 'varchar(255)', 'String', 'deviceName', '0', '0', '1', '1', '1', '1', '0', 'LIKE', 'input', '', 4, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');
INSERT INTO `to_gen_table_column` VALUES (1609381755405041669, 1609381755329544193, 'project_name', 'ERP工程名称', 'varchar(255)', 'String', 'projectName', '0', '0', '1', '1', '1', '1', '0', 'LIKE', 'input', '', 5, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');
INSERT INTO `to_gen_table_column` VALUES (1609381755405041670, 1609381755329544193, 'plan_type', '计划类别', 'varchar(255)', 'String', 'planType', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'select', '', 6, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');
INSERT INTO `to_gen_table_column` VALUES (1609381755405041671, 1609381755329544193, 'department', '单位', 'varchar(255)', 'String', 'department', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 7, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207489, 1609381755329544193, 'settlement_review_amount', '结算审核额', 'decimal(60,0)', 'BigDecimal', 'settlementReviewAmount', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 8, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207490, 1609381755329544193, 'contract_number', '合同编号', 'varchar(255)', 'String', 'contractNumber', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'input', '', 9, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207491, 1609381755329544193, 'project_type', '工程类别', 'varchar(255)', 'String', 'projectType', '0', '0', '1', '1', '1', '1', '0', 'EQ', 'select', '', 10, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207492, 1609381755329544193, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207493, 1609381755329544193, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207494, 1609381755329544193, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207495, 1609381755329544193, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');
INSERT INTO `to_gen_table_column` VALUES (1609381755430207496, 1609381755329544193, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 15, 'admin', '2023-01-01 10:51:26', 'admin', '2023-01-01 11:09:06');

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `branch_id` bigint(0) NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int(0) NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = 'AT transaction mode undo table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
