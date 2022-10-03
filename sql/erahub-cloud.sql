/*
 Navicat Premium Data Transfer

 Source Server         : mysql-10
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : 192.168.56.10:3306
 Source Schema         : erahub-cloud

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 16/09/2022 21:03:14
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL COMMENT '编号',
  `table_id` bigint(0) NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` bigint(0) NOT NULL COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-09-10 17:10:48', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-09-10 17:10:48', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-09-10 17:10:48', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-09-10 17:10:48', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (11, 'OSS预览列表资源开关', 'sys.oss.previewListResource', 'true', 'Y', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-16 20:33:48', 'true:开启, false:关闭');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL COMMENT '部门id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', 'EH科技', 0, 'EH', '15888888888', 'eh@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-12 17:01:52');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', '', NULL);
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-10 17:10:48', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '性别未知');
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

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '登录状态列表');

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示信息',
  `access_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (1568761479632216065, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-11 08:40:58');
INSERT INTO `sys_logininfor` VALUES (1568778836857548802, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-11 09:49:56');
INSERT INTO `sys_logininfor` VALUES (1568894461747609601, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-11 17:29:23');
INSERT INTO `sys_logininfor` VALUES (1569147316832280578, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-12 10:14:08');
INSERT INTO `sys_logininfor` VALUES (1569244846941253634, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-12 16:41:41');
INSERT INTO `sys_logininfor` VALUES (1569245621868277762, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-12 16:44:46');
INSERT INTO `sys_logininfor` VALUES (1569245675941244930, 'test01', '127.0.0.1', '0', '登录成功', '2022-09-12 16:44:59');
INSERT INTO `sys_logininfor` VALUES (1569245698355605506, 'test01', '127.0.0.1', '0', '退出成功', '2022-09-12 16:45:04');
INSERT INTO `sys_logininfor` VALUES (1569245740961345537, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-12 16:45:14');
INSERT INTO `sys_logininfor` VALUES (1569246015612760066, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-12 16:46:20');
INSERT INTO `sys_logininfor` VALUES (1569246053659291649, 'test01', '127.0.0.1', '0', '登录成功', '2022-09-12 16:46:29');
INSERT INTO `sys_logininfor` VALUES (1569246286623518721, 'test01', '127.0.0.1', '0', '退出成功', '2022-09-12 16:47:25');
INSERT INTO `sys_logininfor` VALUES (1569246332538564610, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-12 16:47:36');
INSERT INTO `sys_logininfor` VALUES (1569290920104022018, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-12 19:44:46');
INSERT INTO `sys_logininfor` VALUES (1569294084437954561, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-12 19:57:20');
INSERT INTO `sys_logininfor` VALUES (1569294117656842241, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-12 19:57:28');
INSERT INTO `sys_logininfor` VALUES (1570006943706865665, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-14 19:09:59');
INSERT INTO `sys_logininfor` VALUES (1570012269789274114, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-14 19:31:09');
INSERT INTO `sys_logininfor` VALUES (1570012299002601474, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-14 19:31:16');
INSERT INTO `sys_logininfor` VALUES (1570017363897311233, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-14 19:51:24');
INSERT INTO `sys_logininfor` VALUES (1570017382197059586, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-14 19:51:28');
INSERT INTO `sys_logininfor` VALUES (1570028795753881601, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-14 20:36:49');
INSERT INTO `sys_logininfor` VALUES (1570361307424346114, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-15 18:38:06');
INSERT INTO `sys_logininfor` VALUES (1570371058493190146, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-15 19:16:51');
INSERT INTO `sys_logininfor` VALUES (1570371142383464450, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-15 19:17:11');
INSERT INTO `sys_logininfor` VALUES (1570371216698142721, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-15 19:17:29');
INSERT INTO `sys_logininfor` VALUES (1570372361847992322, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-15 19:22:02');
INSERT INTO `sys_logininfor` VALUES (1570372394383208449, 'test01', '127.0.0.1', '0', '登录成功', '2022-09-15 19:22:10');
INSERT INTO `sys_logininfor` VALUES (1570376216191070209, 'test01', '127.0.0.1', '0', '退出成功', '2022-09-15 19:37:21');
INSERT INTO `sys_logininfor` VALUES (1570376227817680897, 'test01', '127.0.0.1', '0', '登录成功', '2022-09-15 19:37:24');
INSERT INTO `sys_logininfor` VALUES (1570376241864404994, 'test01', '127.0.0.1', '0', '退出成功', '2022-09-15 19:37:27');
INSERT INTO `sys_logininfor` VALUES (1570376265864212481, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-15 19:37:33');
INSERT INTO `sys_logininfor` VALUES (1570379140749225985, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-15 19:48:58');
INSERT INTO `sys_logininfor` VALUES (1570380797272813569, 'admin', '127.0.0.1', '0', '登录成功', '2022-09-15 19:55:33');
INSERT INTO `sys_logininfor` VALUES (1570380875836321794, 'admin', '127.0.0.1', '0', '退出成功', '2022-09-15 19:55:52');
INSERT INTO `sys_logininfor` VALUES (1570734600022781953, 'admin', '192.168.56.1', '0', '登录成功', '2022-09-16 19:21:26');
INSERT INTO `sys_logininfor` VALUES (1570740557767372802, 'admin', '192.168.56.1', '0', '退出成功', '2022-09-16 19:45:07');
INSERT INTO `sys_logininfor` VALUES (1570740573898665985, 'admin', '192.168.56.1', '0', '登录成功', '2022-09-16 19:45:10');
INSERT INTO `sys_logininfor` VALUES (1570740777087528962, 'admin', '192.168.56.1', '0', '退出成功', '2022-09-16 19:45:59');
INSERT INTO `sys_logininfor` VALUES (1570748951697944577, 'admin', '192.168.56.1', '0', '登录成功', '2022-09-16 20:18:28');
INSERT INTO `sys_logininfor` VALUES (1570753312524201986, 'admin', '192.168.56.1', '0', '登录成功', '2022-09-16 20:35:48');
INSERT INTO `sys_logininfor` VALUES (1570757578651463682, 'admin', '192.168.56.1', '0', '退出成功', '2022-09-16 20:52:45');
INSERT INTO `sys_logininfor` VALUES (1570757590231937025, 'admin', '192.168.56.1', '0', '登录成功', '2022-09-16 20:52:47');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-09-10 17:10:48', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-09-10 17:10:48', '', NULL, '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-09-10 17:10:48', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (5, '测试菜单', 0, 5, 'demo', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'star', 'admin', '2022-09-10 17:10:57', NULL, NULL, '');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-09-10 17:10:48', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-09-10 17:10:48', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-09-10 17:10:48', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-09-10 17:10:48', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-09-10 17:10:48', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-09-10 17:10:48', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-09-10 17:10:48', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-09-10 17:10:48', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-09-10 17:10:48', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-09-10 17:10:48', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, 'XxlJob控制台', 2, 7, 'Xxljob', 'monitor/xxljob/index', '', 1, 0, 'C', '0', '0', 'monitor:xxljob:list', 'job', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-14 20:06:47', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, 'Sentinel控制台', 2, 6, 'Sentinel', 'monitor/sentinel/index', '', 1, 0, 'C', '0', '0', 'monitor:sentinel:list', 'sentinel', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-14 19:38:05', '流量控制菜单');
INSERT INTO `sys_menu` VALUES (112, 'Nacos控制台', 2, 8, 'http://192.168.56.10:8848/nacos', '', '', 0, 0, 'C', '0', '0', 'monitor:nacos:list', 'nacos', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-16 20:58:22', '服务治理菜单');
INSERT INTO `sys_menu` VALUES (113, 'Admin控制台', 2, 5, 'Admin', 'monitor/admin/index', '', 1, 0, 'C', '0', '0', 'monitor:admin:list', 'server', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-14 19:35:20', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (114, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-09-10 17:10:48', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (115, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-09-10 17:10:48', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (118, '文件管理', 1, 10, 'oss', 'system/oss/index', '', 1, 0, 'C', '0', '0', 'system:oss:list', 'upload', 'admin', '2022-09-10 17:10:48', '', NULL, '文件管理菜单');
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
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
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
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 115, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 115, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 115, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 115, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 115, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1500, '测试单表', 5, 1, 'demo', 'demo/demo/index', NULL, 1, 0, 'C', '0', '0', 'demo:demo:list', '#', 'admin', '2022-09-10 17:10:57', '', NULL, '测试单表菜单');
INSERT INTO `sys_menu` VALUES (1501, '测试单表查询', 1500, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:query', '#', 'admin', '2022-09-10 17:10:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1502, '测试单表新增', 1500, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:add', '#', 'admin', '2022-09-10 17:10:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1503, '测试单表修改', 1500, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:edit', '#', 'admin', '2022-09-10 17:10:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1504, '测试单表删除', 1500, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:remove', '#', 'admin', '2022-09-10 17:10:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1505, '测试单表导出', 1500, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:demo:export', '#', 'admin', '2022-09-10 17:10:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1506, '测试树表', 5, 1, 'tree', 'demo/tree/index', NULL, 1, 0, 'C', '0', '0', 'demo:tree:list', '#', 'admin', '2022-09-10 17:10:57', '', NULL, '测试树表菜单');
INSERT INTO `sys_menu` VALUES (1507, '测试树表查询', 1506, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:query', '#', 'admin', '2022-09-10 17:10:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1508, '测试树表新增', 1506, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:add', '#', 'admin', '2022-09-10 17:10:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1509, '测试树表修改', 1506, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:edit', '#', 'admin', '2022-09-10 17:10:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1510, '测试树表删除', 1506, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:remove', '#', 'admin', '2022-09-10 17:10:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1511, '测试树表导出', 1506, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'demo:tree:export', '#', 'admin', '2022-09-10 17:10:57', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1600, '文件查询', 118, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:query', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1601, '文件上传', 118, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:upload', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1602, '文件下载', 118, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:download', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1603, '文件删除', 118, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:remove', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1604, '配置添加', 118, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:add', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1605, '配置编辑', 118, 6, '#', '', '', 1, 0, 'F', '0', '0', 'system:oss:edit', '#', 'admin', '2022-09-10 17:10:48', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1570009901798481921, '缓存监控', 2, 2, 'cache', 'monitor/cache/index', NULL, 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-09-14 19:21:45', 'admin', '2022-09-14 19:21:45', '');
INSERT INTO `sys_menu` VALUES (1570010319794429953, '缓存列表', 2, 3, 'cacheList', 'monitor/cache/list', NULL, 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-09-14 19:23:24', 'admin', '2022-09-14 19:23:24', '');
INSERT INTO `sys_menu` VALUES (1570022388644143106, '服务监控', 2, 4, 'server', 'monitor/server/index', NULL, 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-09-14 20:11:22', 'admin', '2022-09-15 18:39:17', '');
INSERT INTO `sys_menu` VALUES (1570758202780676098, 'Minio控制台', 2, 9, 'http://192.168.56.10:9000', '', NULL, 0, 0, 'C', '0', '0', 'monitor:minio:list', 'upload', 'admin', '2022-09-16 20:55:13', 'admin', '2022-09-16 20:59:39', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` bigint(0) NOT NULL COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-09-10 17:10:48', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-09-10 17:10:48', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1568761560569700354, '用户管理', 2, 'com.erahub.base.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/user/changeStatus', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"userId\":1,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"1\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":true}', '', 1, '不允许操作超级管理员用户', '2022-09-11 08:41:17');
INSERT INTO `sys_oper_log` VALUES (1568761572607352833, '用户管理', 2, 'com.erahub.base.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/user/changeStatus', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-09-11 08:41:19\",\"params\":{},\"userId\":3,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"1\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-11 08:41:20');
INSERT INTO `sys_oper_log` VALUES (1568761581092429826, '用户管理', 2, 'com.erahub.base.system.controller.SysUserController.changeStatus()', 'PUT', 1, 'admin', '', '/user/changeStatus', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-09-11 08:41:21\",\"params\":{},\"userId\":3,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-11 08:41:22');
INSERT INTO `sys_oper_log` VALUES (1568761652005527554, 'OSS对象存储', 1, 'com.erahub.base.resource.controller.SysOssController.upload()', 'POST', 1, 'admin', '', '/oss/upload', '127.0.0.1', '', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: connect]', '2022-09-11 08:41:39');
INSERT INTO `sys_oper_log` VALUES (1568761881207463938, 'OSS对象存储', 1, 'com.erahub.base.resource.controller.SysOssController.upload()', 'POST', 1, 'admin', '', '/oss/upload', '127.0.0.1', '', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: connect]', '2022-09-11 08:42:33');
INSERT INTO `sys_oper_log` VALUES (1568762665055772673, 'OSS对象存储', 1, 'com.erahub.base.resource.controller.SysOssController.upload()', 'POST', 1, 'admin', '', '/oss/upload', '127.0.0.1', '', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: connect]', '2022-09-11 08:45:40');
INSERT INTO `sys_oper_log` VALUES (1568762879925772289, 'OSS对象存储', 1, 'com.erahub.base.resource.controller.SysOssController.upload()', 'POST', 1, 'admin', '', '/oss/upload', '127.0.0.1', '', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: connect]', '2022-09-11 08:46:31');
INSERT INTO `sys_oper_log` VALUES (1568762990772838401, 'OSS对象存储', 1, 'com.erahub.base.resource.controller.SysOssController.upload()', 'POST', 1, 'admin', '', '/oss/upload', '127.0.0.1', '', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: connect]', '2022-09-11 08:46:58');
INSERT INTO `sys_oper_log` VALUES (1568763333913042945, 'OSS对象存储', 1, 'com.erahub.base.resource.controller.SysOssController.upload()', 'POST', 1, 'admin', '', '/oss/upload', '127.0.0.1', '', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: connect]', '2022-09-11 08:48:20');
INSERT INTO `sys_oper_log` VALUES (1568765668550729730, 'OSS对象存储', 1, 'com.erahub.base.resource.controller.SysOssController.upload()', 'POST', 1, 'admin', '', '/oss/upload', '127.0.0.1', '', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: connect]', '2022-09-11 08:57:36');
INSERT INTO `sys_oper_log` VALUES (1568765905352744962, 'OSS对象存储', 1, 'com.erahub.base.resource.controller.SysOssController.upload()', 'POST', 1, 'admin', '', '/oss/upload', '127.0.0.1', '', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: connect]', '2022-09-11 08:58:33');
INSERT INTO `sys_oper_log` VALUES (1568770503085875201, '用户管理', 5, 'com.erahub.base.system.controller.SysUserController.export()', 'POST', 1, 'admin', '', '/user/export', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"userId\":null,\"deptId\":103,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":null,\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '', 0, '', '2022-09-11 09:16:49');
INSERT INTO `sys_oper_log` VALUES (1568770564888944641, '用户管理', 5, 'com.erahub.base.system.controller.SysUserController.export()', 'POST', 1, 'admin', '', '/user/export', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"userId\":null,\"deptId\":100,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":null,\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '', 0, '', '2022-09-11 09:17:04');
INSERT INTO `sys_oper_log` VALUES (1568779241930846209, '代码生成', 6, 'com.erahub.base.gen.controller.GenController.importTableSave()', 'POST', 1, 'admin', '', '/gen/importTable', '127.0.0.1', '', '\"test_demo\"', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-11 09:51:32');
INSERT INTO `sys_oper_log` VALUES (1568779340157251585, '代码生成', 3, 'com.erahub.base.gen.controller.GenController.remove()', 'DELETE', 1, 'admin', '', '/gen/1568779241301643266', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-11 09:51:56');
INSERT INTO `sys_oper_log` VALUES (1568898673483137025, '参数管理', 9, 'com.erahub.base.system.controller.SysConfigController.refreshCache()', 'DELETE', 1, 'admin', '', '/config/refreshCache', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-11 17:46:07');
INSERT INTO `sys_oper_log` VALUES (1569147628368404481, '个人信息', 2, 'com.erahub.base.system.controller.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '', '/user/profile', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 10:15:22\",\"params\":{},\"userId\":1,\"deptId\":103,\"userName\":null,\"nickName\":\"erahub\",\"userType\":\"sys_user\",\"email\":\"123456@163.com\",\"phonenumber\":\"13999999999\",\"sex\":\"0\",\"avatar\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"127.0.0.1\",\"loginDate\":\"2022-09-10 17:10:48\",\"remark\":\"管理员\",\"dept\":{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"parentName\":null,\"parentId\":101,\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"orderNum\":1,\"leader\":\"若依\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0,100,101\"},\"roles\":[{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"roleId\":1,\"roleName\":\"超级管理员\",\"roleKey\":\"admin\",\"roleSort\":1,\"dataScope\":\"1\",\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"admin\":true}],\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":true}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 10:15:23');
INSERT INTO `sys_oper_log` VALUES (1569147843590725633, '用户头像', 2, 'com.erahub.base.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '', '/user/profile/avatar', '127.0.0.1', '', '', '', 1, 'Failed to invoke the method upload in the service com.erahub.base.resource.api.RemoteFileService. Tried 3 times of the providers [192.168.10.2:20880] (1/1) from the registry 127.0.0.1:8848 on the consumer 192.168.10.2 using the dubbo version 3.0.10. Last error is: Invoke remote method timeout. method: upload, provider: DefaultServiceInstance{serviceName=\'erahub-resource\', host=\'192.168.10.2\', port=20880, enabled=true, healthy=true, metadata={dubbo.endpoints=[{\"port\":20880,\"protocol\":\"dubbo\"}], dubbo.metadata.revision=f8870b0d559a0b39b108b21cd93f4239, dubbo.metadata.storage-type=remote, timestamp=1662948756985}}, service{name=\'com.erahub.base.resource.api.RemoteFileService\',group=\'null\',version=\'null\',protocol=\'dubbo\',params={$ref=$.services.com\\.erahub\\.resource\\.api\\.RemoteFileService\\:dubbo.allParams},}, cause: org.apache.dubbo.remoting.TimeoutException: Waiting server-side response timeout by scan timer. start time: 2022-09-12 10:16:10.882, end time: 2022-09-12 10:16:13.926, client elapsed: 0 ms, server elapsed: 3044 ms, timeout: 3000 ms, request: Request [id=8, version=2.0.2, twoway=true, event=false, broken=false, data=null], channel: /192.168.10.2:53266 -> /192.168.10.2:20880', '2022-09-12 10:16:14');
INSERT INTO `sys_oper_log` VALUES (1569147851115307010, '用户头像', 2, 'com.erahub.base.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '', '/user/profile/avatar', '127.0.0.1', '', '', '', 1, 'Failed to invoke the method upload in the service com.erahub.base.resource.api.RemoteFileService. Tried 3 times of the providers [192.168.10.2:20880] (1/1) from the registry 127.0.0.1:8848 on the consumer 192.168.10.2 using the dubbo version 3.0.10. Last error is: Invoke remote method timeout. method: upload, provider: DefaultServiceInstance{serviceName=\'erahub-resource\', host=\'192.168.10.2\', port=20880, enabled=true, healthy=true, metadata={dubbo.endpoints=[{\"port\":20880,\"protocol\":\"dubbo\"}], dubbo.metadata.revision=f8870b0d559a0b39b108b21cd93f4239, dubbo.metadata.storage-type=remote, timestamp=1662948756985}}, service{name=\'com.erahub.base.resource.api.RemoteFileService\',group=\'null\',version=\'null\',protocol=\'dubbo\',params={$ref=$.services.com\\.erahub\\.resource\\.api\\.RemoteFileService\\:dubbo.allParams},}, cause: org.apache.dubbo.remoting.TimeoutException: Waiting server-side response timeout by scan timer. start time: 2022-09-12 10:16:12.691, end time: 2022-09-12 10:16:15.720, client elapsed: 0 ms, server elapsed: 3029 ms, timeout: 3000 ms, request: Request [id=10, version=2.0.2, twoway=true, event=false, broken=false, data=null], channel: /192.168.10.2:53266 -> /192.168.10.2:20880', '2022-09-12 10:16:16');
INSERT INTO `sys_oper_log` VALUES (1569147856857309186, '用户头像', 2, 'com.erahub.base.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '', '/user/profile/avatar', '127.0.0.1', '', '', '', 1, 'Failed to invoke the method upload in the service com.erahub.base.resource.api.RemoteFileService. Tried 3 times of the providers [192.168.10.2:20880] (1/1) from the registry 127.0.0.1:8848 on the consumer 192.168.10.2 using the dubbo version 3.0.10. Last error is: Invoke remote method timeout. method: upload, provider: DefaultServiceInstance{serviceName=\'erahub-resource\', host=\'192.168.10.2\', port=20880, enabled=true, healthy=true, metadata={dubbo.endpoints=[{\"port\":20880,\"protocol\":\"dubbo\"}], dubbo.metadata.revision=f8870b0d559a0b39b108b21cd93f4239, dubbo.metadata.storage-type=remote, timestamp=1662948756985}}, service{name=\'com.erahub.base.resource.api.RemoteFileService\',group=\'null\',version=\'null\',protocol=\'dubbo\',params={$ref=$.services.com\\.erahub\\.resource\\.api\\.RemoteFileService\\:dubbo.allParams},}, cause: org.apache.dubbo.remoting.TimeoutException: Waiting server-side response timeout by scan timer. start time: 2022-09-12 10:16:14.068, end time: 2022-09-12 10:16:17.090, client elapsed: 0 ms, server elapsed: 3022 ms, timeout: 3000 ms, request: Request [id=11, version=2.0.2, twoway=true, event=false, broken=false, data=null], channel: /192.168.10.2:53266 -> /192.168.10.2:20880', '2022-09-12 10:16:17');
INSERT INTO `sys_oper_log` VALUES (1569148054190923777, 'OSS对象存储', 1, 'com.erahub.base.resource.controller.SysOssController.upload()', 'POST', 1, 'admin', '', '/oss/upload', '127.0.0.1', '', '', '', 1, '创建Bucket失败, 请核对配置信息:[Unable to execute HTTP request: Connect to 127.0.0.1:9000 [/127.0.0.1] failed: Connection refused: connect]', '2022-09-12 10:17:04');
INSERT INTO `sys_oper_log` VALUES (1569151140179451905, '对象存储配置', 2, 'com.erahub.base.resource.controller.SysOssConfigController.edit()', 'PUT', 1, 'admin', '', '/oss/config', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"erahub\",\"secretKey\":\"erahub123\",\"bucketName\":\"erahub\",\"prefix\":\"\",\"endpoint\":\"127.0.0.1:9000\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 10:29:20');
INSERT INTO `sys_oper_log` VALUES (1569151165202669569, '对象存储配置', 2, 'com.erahub.base.resource.controller.SysOssConfigController.edit()', 'PUT', 1, 'admin', '', '/oss/config', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"ossConfigId\":2,\"configKey\":\"qiniu\",\"accessKey\":\"XXXXXXXXXXXXXXX\",\"secretKey\":\"XXXXXXXXXXXXXXX\",\"bucketName\":\"erahub\",\"prefix\":\"\",\"endpoint\":\"s3-cn-north-1.qiniucs.com\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"1\",\"region\":\"\",\"ext1\":\"\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 10:29:26');
INSERT INTO `sys_oper_log` VALUES (1569151178473447426, '对象存储配置', 2, 'com.erahub.base.resource.controller.SysOssConfigController.edit()', 'PUT', 1, 'admin', '', '/oss/config', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"ossConfigId\":3,\"configKey\":\"aliyun\",\"accessKey\":\"XXXXXXXXXXXXXXX\",\"secretKey\":\"XXXXXXXXXXXXXXX\",\"bucketName\":\"erahub\",\"prefix\":\"\",\"endpoint\":\"oss-cn-beijing.aliyuncs.com\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"1\",\"region\":\"\",\"ext1\":\"\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 10:29:29');
INSERT INTO `sys_oper_log` VALUES (1569151195229691905, '对象存储配置', 2, 'com.erahub.base.resource.controller.SysOssConfigController.edit()', 'PUT', 1, 'admin', '', '/oss/config', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"ossConfigId\":4,\"configKey\":\"qcloud\",\"accessKey\":\"XXXXXXXXXXXXXXX\",\"secretKey\":\"XXXXXXXXXXXXXXX\",\"bucketName\":\"erahub-1250000000\",\"prefix\":\"\",\"endpoint\":\"cos.ap-beijing.myqcloud.com\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"1\",\"region\":\"ap-beijing\",\"ext1\":\"\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 10:29:33');
INSERT INTO `sys_oper_log` VALUES (1569151228373082113, '对象存储配置', 2, 'com.erahub.base.resource.controller.SysOssConfigController.edit()', 'PUT', 1, 'admin', '', '/oss/config', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"ossConfigId\":5,\"configKey\":\"image\",\"accessKey\":\"erahub\",\"secretKey\":\"erahub123\",\"bucketName\":\"erahub\",\"prefix\":\"image\",\"endpoint\":\"127.0.0.1:9000\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"1\",\"region\":\"\",\"ext1\":\"\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 10:29:41');
INSERT INTO `sys_oper_log` VALUES (1569154295894089730, '对象存储配置', 2, 'com.erahub.base.resource.controller.SysOssConfigController.edit()', 'PUT', 1, 'admin', '', '/oss/config', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"minioadmin\",\"secretKey\":\"minioadmin\",\"bucketName\":\"erahub\",\"prefix\":\"\",\"endpoint\":\"127.0.0.1:9000\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 10:41:52');
INSERT INTO `sys_oper_log` VALUES (1569156019820142594, 'OSS对象存储', 1, 'com.erahub.base.resource.controller.SysOssController.upload()', 'POST', 1, 'admin', '', '/oss/upload', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"ossId\":\"1569155999922364418\",\"url\":\"http://127.0.0.1:9000/erahub/2022/09/12/4b6b27cfa0e54a1180d1f845fc0649ff.docx\",\"fileName\":\"IT项目质量管理.docx\"}}', 0, '', '2022-09-12 10:48:43');
INSERT INTO `sys_oper_log` VALUES (1569156236422389762, 'OSS对象存储', 3, 'com.erahub.base.resource.controller.SysOssController.remove()', 'DELETE', 1, 'admin', '', '/oss/1569155999922364418', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 10:49:35');
INSERT INTO `sys_oper_log` VALUES (1569156389745172481, '用户头像', 2, 'com.erahub.base.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '', '/user/profile/avatar', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"imgUrl\":\"http://127.0.0.1:9000/erahub/2022/09/12/8072ad305d004111a7ab2c8b9971eb32.jpg\"}}', 0, '', '2022-09-12 10:50:12');
INSERT INTO `sys_oper_log` VALUES (1569244942302949378, '用户管理', 3, 'com.erahub.base.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/user/4', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:42:04');
INSERT INTO `sys_oper_log` VALUES (1569244953258471425, '用户管理', 3, 'com.erahub.base.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/user/3', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:42:07');
INSERT INTO `sys_oper_log` VALUES (1569244963819728897, '用户管理', 3, 'com.erahub.base.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/user/2', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:42:09');
INSERT INTO `sys_oper_log` VALUES (1569245007394353153, '角色管理', 3, 'com.erahub.base.system.controller.SysRoleController.remove()', 'DELETE', 1, 'admin', '', '/role/4', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:42:20');
INSERT INTO `sys_oper_log` VALUES (1569245015829098497, '角色管理', 3, 'com.erahub.base.system.controller.SysRoleController.remove()', 'DELETE', 1, 'admin', '', '/role/3', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:42:22');
INSERT INTO `sys_oper_log` VALUES (1569245087056769025, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/role', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 16:42:38\",\"params\":{},\"roleId\":2,\"roleName\":\"普通角色\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":\"管理员\",\"flag\":false,\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,1050,118,1600,1601,1602,1603,1604,1605,2,109,1046,1047,1048,110,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,4,5,1500,1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511],\"deptIds\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:42:39');
INSERT INTO `sys_oper_log` VALUES (1569245126458060802, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/role', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 16:42:47\",\"params\":{},\"roleId\":2,\"roleName\":\"管理员\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":\"管理员\",\"flag\":false,\"menuIds\":[1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,1050,118,1600,1601,1602,1603,1604,1605,2,109,1046,1047,1048,110,111,112,113,3,114,115,1055,1056,1058,1057,1059,1060,4,5,1500,1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511],\"deptIds\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:42:48');
INSERT INTO `sys_oper_log` VALUES (1569245243407839234, '角色管理', 1, 'com.erahub.base.system.controller.SysRoleController.add()', 'POST', 1, 'admin', '', '/role', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"roleId\":null,\"roleName\":\"test01\",\"roleKey\":\"common\",\"roleSort\":3,\"dataScope\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":[],\"deptIds\":[],\"admin\":false}', '{\"code\":500,\"msg\":\"新增角色\'test01\'失败，角色权限已存在\",\"data\":null}', 0, '', '2022-09-12 16:43:16');
INSERT INTO `sys_oper_log` VALUES (1569245266669449217, '角色管理', 1, 'com.erahub.base.system.controller.SysRoleController.add()', 'POST', 1, 'admin', '', '/role', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"roleId\":null,\"roleName\":\"test01\",\"roleKey\":\"common\",\"roleSort\":3,\"dataScope\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":[],\"deptIds\":[],\"admin\":false}', '{\"code\":500,\"msg\":\"新增角色\'test01\'失败，角色权限已存在\",\"data\":null}', 0, '', '2022-09-12 16:43:21');
INSERT INTO `sys_oper_log` VALUES (1569245300584591363, '角色管理', 1, 'com.erahub.base.system.controller.SysRoleController.add()', 'POST', 1, 'admin', '', '/role', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-12 16:43:29\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 16:43:29\",\"params\":{},\"roleId\":\"1569245300584591362\",\"roleName\":\"test01\",\"roleKey\":\"test01\",\"roleSort\":3,\"dataScope\":null,\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":[],\"deptIds\":[],\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:43:29');
INSERT INTO `sys_oper_log` VALUES (1569245585432358915, '用户管理', 1, 'com.erahub.base.system.controller.SysUserController.add()', 'POST', 1, 'admin', '', '/user', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-12 16:44:37\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 16:44:37\",\"params\":{},\"userId\":\"1569245585432358914\",\"deptId\":109,\"userName\":\"test01\",\"nickName\":\"test01\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:44:37');
INSERT INTO `sys_oper_log` VALUES (1569245605246251009, '用户管理', 2, 'com.erahub.base.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', '', '/user', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-12 16:44:37\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 16:44:42\",\"params\":{},\"userId\":\"1569245585432358914\",\"deptId\":109,\"userName\":\"test01\",\"nickName\":\"test01\",\"userType\":\"sys_user\",\"email\":\"\",\"phonenumber\":\"\",\"sex\":\"0\",\"avatar\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"\",\"loginDate\":null,\"remark\":null,\"dept\":{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"parentName\":null,\"parentId\":102,\"children\":[],\"deptId\":109,\"deptName\":\"财务部门\",\"orderNum\":2,\"leader\":\"若依\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0,100,102\"},\"roles\":[],\"roleIds\":[\"1569245300584591362\"],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:44:42');
INSERT INTO `sys_oper_log` VALUES (1569245998818766849, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/role', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-12 16:43:29\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 16:46:15\",\"params\":{},\"roleId\":\"1569245300584591362\",\"roleName\":\"test01\",\"roleKey\":\"test01\",\"roleSort\":3,\"dataScope\":\"1\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":[1,100,101,105,2,3,1001,1003,1004,1008,1009,1026,1030,112,113,115,1055,1056,1058,1057,1059,1060],\"deptIds\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:46:16');
INSERT INTO `sys_oper_log` VALUES (1569246527183630338, '用户管理', 1, 'com.erahub.base.system.controller.SysUserController.add()', 'POST', 1, 'admin', '', '/user', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-12 16:48:21\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 16:48:21\",\"params\":{},\"userId\":\"1569246527183630337\",\"deptId\":100,\"userName\":\"test02\",\"nickName\":\"test02\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:48:22');
INSERT INTO `sys_oper_log` VALUES (1569246601489920001, '角色管理', 5, 'com.erahub.base.system.controller.SysRoleController.export()', 'POST', 1, 'admin', '', '/role/export', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"roleId\":null,\"roleName\":null,\"roleKey\":null,\"roleSort\":null,\"dataScope\":null,\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":null,\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"admin\":false}', '', 0, '', '2022-09-12 16:48:40');
INSERT INTO `sys_oper_log` VALUES (1569246907724443649, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.changeStatus()', 'PUT', 1, 'admin', '', '/role/changeStatus', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 16:49:52\",\"params\":{},\"roleId\":2,\"roleName\":null,\"roleKey\":null,\"roleSort\":null,\"dataScope\":null,\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"1\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:49:53');
INSERT INTO `sys_oper_log` VALUES (1569246914187866114, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.changeStatus()', 'PUT', 1, 'admin', '', '/role/changeStatus', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 16:49:54\",\"params\":{},\"roleId\":2,\"roleName\":null,\"roleKey\":null,\"roleSort\":null,\"dataScope\":null,\"menuCheckStrictly\":null,\"deptCheckStrictly\":null,\"status\":\"0\",\"delFlag\":null,\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:49:54');
INSERT INTO `sys_oper_log` VALUES (1569246971624665089, '用户管理', 2, 'com.erahub.base.system.controller.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/user/resetPwd', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 16:50:07\",\"params\":{},\"userId\":\"1569246527183630337\",\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":null,\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:50:08');
INSERT INTO `sys_oper_log` VALUES (1569246997558046722, '用户管理', 2, 'com.erahub.base.system.controller.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/user/resetPwd', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 16:50:14\",\"params\":{},\"userId\":\"1569246527183630337\",\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":null,\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:50:14');
INSERT INTO `sys_oper_log` VALUES (1569247066432712705, '用户管理', 4, 'com.erahub.base.system.controller.SysUserController.insertAuthRole()', 'PUT', 1, 'admin', '', '/user/authRole', '127.0.0.1', '', '\"1569246527183630337\" [\"1569245300584591362\"]', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:50:31');
INSERT INTO `sys_oper_log` VALUES (1569249386130288642, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', '', '/role/dataScope', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-12 16:43:29\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 16:59:43\",\"params\":{},\"roleId\":\"1569245300584591362\",\"roleName\":\"test01\",\"roleKey\":\"test01\",\"roleSort\":3,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":[100,101,103,104,105,106,107,102,108,109],\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:59:44');
INSERT INTO `sys_oper_log` VALUES (1569249400936181762, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', '', '/role/dataScope', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-12 16:43:29\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 16:59:47\",\"params\":{},\"roleId\":\"1569245300584591362\",\"roleName\":\"test01\",\"roleKey\":\"test01\",\"roleSort\":3,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":[],\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 16:59:47');
INSERT INTO `sys_oper_log` VALUES (1569249619715272705, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', '', '/role/dataScope', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-12 16:43:29\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 17:00:39\",\"params\":{},\"roleId\":\"1569245300584591362\",\"roleName\":\"test01\",\"roleKey\":\"test01\",\"roleSort\":3,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":[100,101,103,104,105,106,107,102,108,109],\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 17:00:39');
INSERT INTO `sys_oper_log` VALUES (1569249681283461121, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', '', '/role/dataScope', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-12 16:43:29\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 17:00:53\",\"params\":{},\"roleId\":\"1569245300584591362\",\"roleName\":\"test01\",\"roleKey\":\"test01\",\"roleSort\":3,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":[],\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 17:00:54');
INSERT INTO `sys_oper_log` VALUES (1569249924012027906, '部门管理', 2, 'com.erahub.base.system.controller.SysDeptController.edit()', 'PUT', 1, 'admin', '', '/dept', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 17:01:51\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"deptId\":100,\"deptName\":\"EH科技\",\"orderNum\":0,\"leader\":\"EH\",\"phone\":\"15888888888\",\"email\":\"eh@qq.com\",\"status\":\"0\",\"delFlag\":\"0\",\"ancestors\":\"0\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 17:01:52');
INSERT INTO `sys_oper_log` VALUES (1569250070296768513, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', '', '/role/dataScope', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-12 16:43:29\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 17:02:26\",\"params\":{},\"roleId\":\"1569245300584591362\",\"roleName\":\"test01\",\"roleKey\":\"test01\",\"roleSort\":3,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":[100,101,103],\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 17:02:27');
INSERT INTO `sys_oper_log` VALUES (1569250192736890881, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', '', '/role/dataScope', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-12 16:43:29\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 17:02:55\",\"params\":{},\"roleId\":\"1569245300584591362\",\"roleName\":\"test01\",\"roleKey\":\"test01\",\"roleSort\":3,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":[100,102,109],\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 17:02:56');
INSERT INTO `sys_oper_log` VALUES (1569250240166080514, '角色管理', 4, 'com.erahub.base.system.controller.SysRoleController.cancelAuthUser()', 'PUT', 1, 'admin', '', '/role/authUser/cancel', '127.0.0.1', '', '{\"userId\":\"1569246527183630337\",\"roleId\":\"1569245300584591362\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 17:03:07');
INSERT INTO `sys_oper_log` VALUES (1569250283728121858, '用户管理', 2, 'com.erahub.base.system.controller.SysUserController.edit()', 'PUT', 1, 'admin', '', '/user', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-12 16:48:22\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 17:03:17\",\"params\":{},\"userId\":\"1569246527183630337\",\"deptId\":100,\"userName\":\"test02\",\"nickName\":\"test02\",\"userType\":\"sys_user\",\"email\":\"\",\"phonenumber\":\"\",\"sex\":\"0\",\"avatar\":\"\",\"status\":\"0\",\"delFlag\":\"0\",\"loginIp\":\"\",\"loginDate\":null,\"remark\":null,\"dept\":{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"deptId\":100,\"deptName\":\"EH科技\",\"orderNum\":0,\"leader\":\"EH\",\"phone\":null,\"email\":null,\"status\":\"0\",\"delFlag\":null,\"ancestors\":\"0\"},\"roles\":[],\"roleIds\":[\"1569245300584591362\"],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 17:03:18');
INSERT INTO `sys_oper_log` VALUES (1569250545150701569, '参数管理', 2, 'com.erahub.base.system.controller.SysConfigController.updateByKey()', 'PUT', 1, 'admin', '', '/config/updateByKey', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 17:04:19\",\"params\":{},\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"false\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 17:04:20');
INSERT INTO `sys_oper_log` VALUES (1569250558815744001, '参数管理', 2, 'com.erahub.base.system.controller.SysConfigController.updateByKey()', 'PUT', 1, 'admin', '', '/config/updateByKey', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 17:04:23\",\"params\":{},\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"true\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 17:04:23');
INSERT INTO `sys_oper_log` VALUES (1569250600108666881, '对象存储状态修改', 2, 'com.erahub.base.resource.controller.SysOssConfigController.changeStatus()', 'PUT', 1, 'admin', '', '/oss/config/changeStatus', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"ossConfigId\":2,\"configKey\":\"qiniu\",\"accessKey\":null,\"secretKey\":null,\"bucketName\":null,\"prefix\":null,\"endpoint\":null,\"domain\":null,\"isHttps\":null,\"status\":\"0\",\"region\":null,\"ext1\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 17:04:33');
INSERT INTO `sys_oper_log` VALUES (1569250610011418625, '对象存储状态修改', 2, 'com.erahub.base.resource.controller.SysOssConfigController.changeStatus()', 'PUT', 1, 'admin', '', '/oss/config/changeStatus', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":null,\"secretKey\":null,\"bucketName\":null,\"prefix\":null,\"endpoint\":null,\"domain\":null,\"isHttps\":null,\"status\":\"0\",\"region\":null,\"ext1\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 17:04:35');
INSERT INTO `sys_oper_log` VALUES (1569254837253287938, '用户管理', 1, 'com.erahub.base.system.controller.SysUserController.add()', 'POST', 1, 'admin', '', '/user', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-12 17:21:11\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 17:21:11\",\"params\":{},\"userId\":\"1569254790117699586\",\"deptId\":108,\"userName\":\"test03\",\"nickName\":\"test03\",\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":\"0\",\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":[],\"postIds\":[],\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 17:21:23');
INSERT INTO `sys_oper_log` VALUES (1569258584041828353, '用户管理', 3, 'com.erahub.base.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/user/1569254790117699586', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 17:36:17');
INSERT INTO `sys_oper_log` VALUES (1569291086718554114, '用户管理', 5, 'com.erahub.base.system.controller.SysUserController.export()', 'POST', 1, 'admin', '', '/user/export', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"userId\":null,\"deptId\":100,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":null,\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '', 0, '', '2022-09-12 19:45:26');
INSERT INTO `sys_oper_log` VALUES (1569291940691431425, '用户管理', 5, 'com.erahub.base.system.controller.SysUserController.export()', 'POST', 1, 'admin', '', '/user/export', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"userId\":null,\"deptId\":100,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":null,\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '', 0, '', '2022-09-12 19:48:49');
INSERT INTO `sys_oper_log` VALUES (1569292144253587458, '用户管理', 6, 'com.erahub.base.system.controller.SysUserController.importData()', 'POST', 1, 'admin', '', '/user/importData', '127.0.0.1', '', 'false', '', 1, 'Convert data com.alibaba.excel.metadata.data.ReadCellData@26ac67be to class java.lang.Long error ', '2022-09-12 19:49:38');
INSERT INTO `sys_oper_log` VALUES (1569292962591657985, '用户管理', 6, 'com.erahub.base.system.controller.SysUserController.importData()', 'POST', 1, 'admin', '', '/user/importData', '127.0.0.1', '', 'false', '', 1, 'Convert data com.alibaba.excel.metadata.data.ReadCellData@411be578 to class java.lang.String error ', '2022-09-12 19:52:53');
INSERT INTO `sys_oper_log` VALUES (1569293243647774721, '用户管理', 6, 'com.erahub.base.system.controller.SysUserController.importData()', 'POST', 1, 'admin', '', '/user/importData', '127.0.0.1', '', 'false', '', 1, 'Convert data com.alibaba.excel.metadata.data.ReadCellData@b1d1adbb to class java.lang.String error ', '2022-09-12 19:54:00');
INSERT INTO `sys_oper_log` VALUES (1569293307413778433, '用户管理', 6, 'com.erahub.base.system.controller.SysUserController.importData()', 'POST', 1, 'admin', '', '/user/importData', '127.0.0.1', '', 'false', '', 1, 'Convert data com.alibaba.excel.metadata.data.ReadCellData@411be578 to class java.lang.String error ', '2022-09-12 19:54:15');
INSERT INTO `sys_oper_log` VALUES (1569293460040306689, '用户管理', 6, 'com.erahub.base.system.controller.SysUserController.importData()', 'POST', 1, 'admin', '', '/user/importData', '127.0.0.1', '', 'false', '', 1, '很抱歉，导入失败！共 2 条数据格式不正确，错误如下：<br/>1、账号 test03 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'sys_user.PRIMARY\'\r\n### The error may exist in com/erahub/system/mapper/SysUserMapper.java (best guess)\r\n### The error may involve com.erahub.base.system.mapper.SysUserMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_user  ( user_id, dept_id, user_name, nick_name,    sex,  password, status,     create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?,    ?,  ?, ?,     ?, ?, ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'sys_user.PRIMARY\'\n; Duplicate entry \'2\' for key \'sys_user.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'2\' for key \'sys_user.PRIMARY\'<br/>2、账号 test04 导入失败：\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3\' for key \'sys_user.PRIMARY\'\r\n### The error may exist in com/erahub/system/mapper/SysUserMapper.java (best guess)\r\n### The error may involve com.erahub.base.system.mapper.SysUserMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO sys_user  ( user_id, dept_id, user_name, nick_name,    sex,  password, status,     create_by, create_time, update_by, update_time )  VALUES  ( ?, ?, ?, ?,    ?,  ?, ?,     ?, ?, ?, ? )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3\' for key \'sys_user.PRIMARY\'\n; Duplicate entry \'3\' for key \'sys_user.PRIMARY\'; nested exception is java.sql.SQLIntegrityConstraintViolationException: Duplicate entry \'3\' for key \'sys_user.PRIMARY\'', '2022-09-12 19:54:52');
INSERT INTO `sys_oper_log` VALUES (1569293854220996610, '用户管理', 6, 'com.erahub.base.system.controller.SysUserController.importData()', 'POST', 1, 'admin', '', '/user/importData', '127.0.0.1', '', 'false', '{\"code\":200,\"msg\":\"恭喜您，数据已全部导入成功！共 2 条，数据如下：<br/>1、账号 test03 导入成功<br/>2、账号 test04 导入成功\",\"data\":null}', 0, '', '2022-09-12 19:56:26');
INSERT INTO `sys_oper_log` VALUES (1569293878589902849, '用户管理', 3, 'com.erahub.base.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/user/5', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 19:56:31');
INSERT INTO `sys_oper_log` VALUES (1569293893001531394, '用户管理', 3, 'com.erahub.base.system.controller.SysUserController.remove()', 'DELETE', 1, 'admin', '', '/user/6', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 19:56:35');
INSERT INTO `sys_oper_log` VALUES (1569293980473741313, '用户管理', 2, 'com.erahub.base.system.controller.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/user/resetPwd', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-09-12 19:56:55\",\"params\":{},\"userId\":\"1569245585432358914\",\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":null,\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-12 19:56:56');
INSERT INTO `sys_oper_log` VALUES (1570009902054334465, '菜单管理', 1, 'com.erahub.base.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-14 19:21:44\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 19:21:44\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":\"1570009901798481921\",\"menuName\":\"缓存监控\",\"orderNum\":2,\"path\":\"cache\",\"component\":\"monitor/cache/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:cache:list\",\"icon\":\"redis\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 19:21:45');
INSERT INTO `sys_oper_log` VALUES (1570010110481883138, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 19:22:34\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":110,\"menuName\":\"XxlJob控制台\",\"orderNum\":5,\"path\":\"http://localhost:9900\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:job:list\",\"icon\":\"job\",\"remark\":\"定时任务菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 19:22:34');
INSERT INTO `sys_oper_log` VALUES (1570010131646341122, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 19:22:39\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":111,\"menuName\":\"Sentinel控制台\",\"orderNum\":6,\"path\":\"http://localhost:8718\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:sentinel:list\",\"icon\":\"sentinel\",\"remark\":\"流量控制菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 19:22:39');
INSERT INTO `sys_oper_log` VALUES (1570010148582940674, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 19:22:43\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":112,\"menuName\":\"Nacos控制台\",\"orderNum\":7,\"path\":\"http://localhost:8848/nacos\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:nacos:list\",\"icon\":\"nacos\",\"remark\":\"服务治理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 19:22:43');
INSERT INTO `sys_oper_log` VALUES (1570010162642247682, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 19:22:46\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":110,\"menuName\":\"XxlJob控制台\",\"orderNum\":8,\"path\":\"http://localhost:9900\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:job:list\",\"icon\":\"job\",\"remark\":\"定时任务菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 19:22:47');
INSERT INTO `sys_oper_log` VALUES (1570010319861538818, '菜单管理', 1, 'com.erahub.base.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-14 19:23:24\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 19:23:24\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":\"1570010319794429953\",\"menuName\":\"缓存列表\",\"orderNum\":3,\"path\":\"cacheList\",\"component\":\"monitor/cache/list\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:cache:list\",\"icon\":\"redis\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 19:23:24');
INSERT INTO `sys_oper_log` VALUES (1570012770098438146, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 19:33:08\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":113,\"menuName\":\"Admin控制台\",\"orderNum\":5,\"path\":\"Admin\",\"component\":\"monitor/admin/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:admin:list\",\"icon\":\"server\",\"remark\":\"服务监控菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 19:33:08');
INSERT INTO `sys_oper_log` VALUES (1570013320319819777, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 19:35:19\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":113,\"menuName\":\"Admin控制台\",\"orderNum\":5,\"path\":\"Admin\",\"component\":\"monitor/admin/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:admin:list\",\"icon\":\"server\",\"remark\":\"服务监控菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 19:35:20');
INSERT INTO `sys_oper_log` VALUES (1570014012472254466, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 19:38:04\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":111,\"menuName\":\"Sentinel控制台\",\"orderNum\":6,\"path\":\"Sentinel\",\"component\":\"monitor/sentinel/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:sentinel:list\",\"icon\":\"sentinel\",\"remark\":\"流量控制菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 19:38:05');
INSERT INTO `sys_oper_log` VALUES (1570014809922691074, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 19:41:14\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":112,\"menuName\":\"Nacos控制台\",\"orderNum\":7,\"path\":\"Nacos\",\"component\":\"monitor/nacos/list\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:nacos:list\",\"icon\":\"nacos\",\"remark\":\"服务治理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 19:41:15');
INSERT INTO `sys_oper_log` VALUES (1570014883113295874, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 19:41:32\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":112,\"menuName\":\"Nacos控制台\",\"orderNum\":7,\"path\":\"Nacos\",\"component\":\"monitor/nacos/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:nacos:list\",\"icon\":\"nacos\",\"remark\":\"服务治理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 19:41:32');
INSERT INTO `sys_oper_log` VALUES (1570014988717481985, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 19:41:57\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":110,\"menuName\":\"XxlJob控制台\",\"orderNum\":8,\"path\":\"Xxljob\",\"component\":\"monitor/job/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:job:list\",\"icon\":\"job\",\"remark\":\"定时任务菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 19:41:57');
INSERT INTO `sys_oper_log` VALUES (1570016676702543874, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 19:48:39\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":110,\"menuName\":\"XxlJob控制台\",\"orderNum\":8,\"path\":\"Xxljob\",\"component\":\"monitor/xxljob/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:xxljob:list\",\"icon\":\"job\",\"remark\":\"定时任务菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 19:48:40');
INSERT INTO `sys_oper_log` VALUES (1570017460609572866, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 19:51:46\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":112,\"menuName\":\"Nacos控制台\",\"orderNum\":7,\"path\":\"Nacos\",\"component\":\"monitor/nacos/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:nacos:list\",\"icon\":\"nacos\",\"remark\":\"服务治理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 19:51:47');
INSERT INTO `sys_oper_log` VALUES (1570020931748454402, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 20:05:34\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":112,\"menuName\":\"Nacos控制台\",\"orderNum\":7,\"path\":\"http://localhost:8848/nacos\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:nacos:list\",\"icon\":\"nacos\",\"remark\":\"服务治理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 20:05:34');
INSERT INTO `sys_oper_log` VALUES (1570021218567544833, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 20:06:42\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":112,\"menuName\":\"Nacos控制台\",\"orderNum\":8,\"path\":\"http://localhost:8848/nacos\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:nacos:list\",\"icon\":\"nacos\",\"remark\":\"服务治理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 20:06:43');
INSERT INTO `sys_oper_log` VALUES (1570021235713859586, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 20:06:46\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":110,\"menuName\":\"XxlJob控制台\",\"orderNum\":7,\"path\":\"Xxljob\",\"component\":\"monitor/xxljob/index\",\"queryParam\":\"\",\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:xxljob:list\",\"icon\":\"job\",\"remark\":\"定时任务菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 20:06:47');
INSERT INTO `sys_oper_log` VALUES (1570022388644143107, '菜单管理', 1, 'com.erahub.base.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-14 20:11:21\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-14 20:11:21\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":\"1570022388644143106\",\"menuName\":\"数据监控\",\"orderNum\":4,\"path\":\"Druid\",\"component\":\"monitor/druid/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:druid:list\",\"icon\":\"druid\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 20:11:22');
INSERT INTO `sys_oper_log` VALUES (1570028996531019778, '在线用户', 7, 'com.erahub.base.system.controller.SysUserOnlineController.forceLogout()', 'DELETE', 1, 'admin', '', '/online/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJzeXNfdXNlcjoxIiwicm5TdHIiOiJ1T2ZHN0tvUWNOR1JKNDdrVEJiYUxSbms3bTNIUGhnSyJ9._ZHkQvgSRtqlSmufm6JTe6Hg0SZai4cfbj0he55y3zw', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-14 20:37:37');
INSERT INTO `sys_oper_log` VALUES (1570361544176029698, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-14 20:11:22\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-15 18:39:02\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":\"1570022388644143106\",\"menuName\":\"服务监控\",\"orderNum\":4,\"path\":\"server\",\"component\":\"monitor/server/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:server:list\",\"icon\":\"druid\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-15 18:39:03');
INSERT INTO `sys_oper_log` VALUES (1570361604989243393, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-14 20:11:22\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-15 18:39:17\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":\"1570022388644143106\",\"menuName\":\"服务监控\",\"orderNum\":4,\"path\":\"server\",\"component\":\"monitor/server/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:server:list\",\"icon\":\"server\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-15 18:39:17');
INSERT INTO `sys_oper_log` VALUES (1570371962537668609, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.dataScope()', 'PUT', 1, 'admin', '', '/role/dataScope', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-12 16:43:29\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-15 19:20:26\",\"params\":{},\"roleId\":\"1569245300584591362\",\"roleName\":\"test01\",\"roleKey\":\"test01\",\"roleSort\":3,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":null,\"flag\":false,\"menuIds\":null,\"deptIds\":[100,102,108,109],\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-15 19:20:27');
INSERT INTO `sys_oper_log` VALUES (1570372105395662849, '用户头像', 2, 'com.erahub.base.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '', '/user/profile/avatar', '127.0.0.1', '', '', '{\"code\":500,\"msg\":\"文件格式不正确，请上传[bmp, gif, jpg, jpeg, png]格式\",\"data\":null}', 0, '', '2022-09-15 19:21:01');
INSERT INTO `sys_oper_log` VALUES (1570372117756276738, '用户头像', 2, 'com.erahub.base.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '', '/user/profile/avatar', '127.0.0.1', '', '', '{\"code\":500,\"msg\":\"文件格式不正确，请上传[bmp, gif, jpg, jpeg, png]格式\",\"data\":null}', 0, '', '2022-09-15 19:21:04');
INSERT INTO `sys_oper_log` VALUES (1570372139298222082, '用户头像', 2, 'com.erahub.base.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '', '/user/profile/avatar', '127.0.0.1', '', '', '{\"code\":500,\"msg\":\"文件格式不正确，请上传[bmp, gif, jpg, jpeg, png]格式\",\"data\":null}', 0, '', '2022-09-15 19:21:09');
INSERT INTO `sys_oper_log` VALUES (1570372178607239169, '用户头像', 2, 'com.erahub.base.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '', '/user/profile/avatar', '127.0.0.1', '', '', '{\"code\":500,\"msg\":\"文件格式不正确，请上传[bmp, gif, jpg, jpeg, png]格式\",\"data\":null}', 0, '', '2022-09-15 19:21:18');
INSERT INTO `sys_oper_log` VALUES (1570372348287807489, '用户管理', 2, 'com.erahub.base.system.controller.SysUserController.resetPwd()', 'PUT', 1, 'admin', '', '/user/resetPwd', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-09-15 19:21:58\",\"params\":{},\"userId\":\"1569245585432358914\",\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":null,\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-15 19:21:59');
INSERT INTO `sys_oper_log` VALUES (1570376110725296129, '用户头像', 2, 'com.erahub.base.system.controller.SysProfileController.avatar()', 'POST', 1, 'test01', '', '/user/profile/avatar', '127.0.0.1', '', '', '{\"code\":500,\"msg\":\"文件格式不正确，请上传[bmp, gif, jpg, jpeg, png]格式\",\"data\":null}', 0, '', '2022-09-15 19:36:56');
INSERT INTO `sys_oper_log` VALUES (1570376352208154625, '菜单管理', 3, 'com.erahub.base.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/menu/4', '127.0.0.1', '', '', '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null}', 0, '', '2022-09-15 19:37:53');
INSERT INTO `sys_oper_log` VALUES (1570376396223180801, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-15 19:38:03\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":4,\"menuName\":\"PLUS官网\",\"orderNum\":4,\"path\":\"https://gitee.com/JavaLionLi/erahub-auth-simple\",\"component\":null,\"queryParam\":\"\",\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"guide\",\"remark\":\"若依官网地址\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-15 19:38:04');
INSERT INTO `sys_oper_log` VALUES (1570376409875640321, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-15 19:38:06\",\"params\":{},\"parentName\":null,\"parentId\":0,\"children\":[],\"menuId\":4,\"menuName\":\"PLUS官网\",\"orderNum\":4,\"path\":\"https://gitee.com/JavaLionLi/erahub-auth-simple\",\"component\":null,\"queryParam\":\"\",\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"\",\"icon\":\"guide\",\"remark\":\"若依官网地址\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-15 19:38:07');
INSERT INTO `sys_oper_log` VALUES (1570376416632664065, '菜单管理', 3, 'com.erahub.base.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/menu/4', '127.0.0.1', '', '', '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null}', 0, '', '2022-09-15 19:38:09');
INSERT INTO `sys_oper_log` VALUES (1570376573801623553, '菜单管理', 3, 'com.erahub.base.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/menu/4', '127.0.0.1', '', '', '{\"code\":500,\"msg\":\"菜单已分配,不允许删除\",\"data\":null}', 0, '', '2022-09-15 19:38:46');
INSERT INTO `sys_oper_log` VALUES (1570376734648987650, '角色管理', 2, 'com.erahub.base.system.controller.SysRoleController.edit()', 'PUT', 1, 'admin', '', '/role', '127.0.0.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-15 19:39:24\",\"params\":{},\"roleId\":2,\"roleName\":\"管理员\",\"roleKey\":\"common\",\"roleSort\":2,\"dataScope\":\"2\",\"menuCheckStrictly\":true,\"deptCheckStrictly\":true,\"status\":\"0\",\"delFlag\":\"0\",\"remark\":\"管理员\",\"flag\":false,\"menuIds\":[2,1,100,1001,1002,1003,1004,1005,1006,1007,101,1008,1009,1010,1011,1012,102,1013,1014,1015,1016,103,1017,1018,1019,1020,104,1021,1022,1023,1024,1025,105,1026,1027,1028,1029,1030,106,1031,1032,1033,1034,1035,107,1036,1037,1038,1039,108,500,1040,1041,1042,501,1043,1044,1045,1050,118,1600,1601,1602,1603,1604,1605,109,1046,1047,1048,113,111,110,112,3,114,115,1055,1056,1058,1057,1059,1060,5,1500,1501,1502,1503,1504,1505,1506,1507,1508,1509,1510,1511],\"deptIds\":null,\"admin\":false}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-15 19:39:24');
INSERT INTO `sys_oper_log` VALUES (1570376779683229698, '菜单管理', 3, 'com.erahub.base.system.controller.SysMenuController.remove()', 'DELETE', 1, 'admin', '', '/menu/4', '127.0.0.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-15 19:39:35');
INSERT INTO `sys_oper_log` VALUES (1570734670872965121, '用户管理', 5, 'com.erahub.base.system.controller.SysUserController.export()', 'POST', 1, 'admin', '', '/user/export', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"userId\":null,\"deptId\":null,\"userName\":null,\"nickName\":null,\"userType\":null,\"email\":null,\"phonenumber\":null,\"sex\":null,\"avatar\":null,\"status\":null,\"delFlag\":null,\"loginIp\":null,\"loginDate\":null,\"remark\":null,\"dept\":null,\"roles\":null,\"roleIds\":null,\"postIds\":null,\"roleId\":null,\"admin\":false}', '', 0, '', '2022-09-16 19:21:43');
INSERT INTO `sys_oper_log` VALUES (1570749077799694338, 'OSS对象存储', 3, 'com.erahub.base.resource.controller.SysOssController.remove()', 'DELETE', 1, 'admin', '', '/oss/1569156387274727426', '192.168.56.1', '', '', '', 1, '创建Bucket失败, 请核对配置信息:[The Access Key Id you provided does not exist in our records. (Service: Amazon S3; Status Code: 403; Error Code: InvalidAccessKeyId; Request ID: 1715567E41449531; S3 Extended Request ID: 7884da5a-3c57-471f-b72b-be44e5fe726e; Proxy: null)]', '2022-09-16 20:18:58');
INSERT INTO `sys_oper_log` VALUES (1570749585604079617, '用户头像', 2, 'com.erahub.base.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '', '/user/profile/avatar', '192.168.56.1', '', '', '', 1, '上传文件失败', '2022-09-16 20:20:59');
INSERT INTO `sys_oper_log` VALUES (1570750186962415618, '对象存储配置', 2, 'com.erahub.base.resource.controller.SysOssConfigController.edit()', 'PUT', 1, 'admin', '', '/oss/config', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"erahub\",\"secretKey\":\"erahub123\",\"bucketName\":\"erahub\",\"prefix\":\"\",\"endpoint\":\"127.0.0.1:9000\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:23:22');
INSERT INTO `sys_oper_log` VALUES (1570750216339320834, '用户头像', 2, 'com.erahub.base.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '', '/user/profile/avatar', '192.168.56.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"imgUrl\":\"http://127.0.0.1:9000/erahub/2022/09/16/ca193326dd954694b23ad380a9746a4f.jpg\"}}', 0, '', '2022-09-16 20:23:29');
INSERT INTO `sys_oper_log` VALUES (1570750296635076609, '用户头像', 2, 'com.erahub.base.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '', '/user/profile/avatar', '192.168.56.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"imgUrl\":\"http://127.0.0.1:9000/erahub/2022/09/16/1a800eb99f9242e38630b1fc93ae4f07.jpg\"}}', 0, '', '2022-09-16 20:23:49');
INSERT INTO `sys_oper_log` VALUES (1570750512532680705, '对象存储配置', 2, 'com.erahub.base.resource.controller.SysOssConfigController.edit()', 'PUT', 1, 'admin', '', '/oss/config', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"erahub\",\"secretKey\":\"erahub123\",\"bucketName\":\"erahub\",\"prefix\":\"\",\"endpoint\":\"192.168.56.10:9000\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:24:40');
INSERT INTO `sys_oper_log` VALUES (1570751929876082689, '对象存储配置', 2, 'com.erahub.base.resource.controller.SysOssConfigController.edit()', 'PUT', 1, 'admin', '', '/oss/config', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"erahub\",\"secretKey\":\"erahub123\",\"bucketName\":\"erahub\",\"prefix\":\"\",\"endpoint\":\"192.168.56.10:9001\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:30:18');
INSERT INTO `sys_oper_log` VALUES (1570752557901803522, '对象存储配置', 2, 'com.erahub.base.resource.controller.SysOssConfigController.edit()', 'PUT', 1, 'admin', '', '/oss/config', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"erahub\",\"secretKey\":\"erahub123\",\"bucketName\":\"erahub\",\"prefix\":\"\",\"endpoint\":\"192.168.56.10:9000\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:32:48');
INSERT INTO `sys_oper_log` VALUES (1570752575106838530, '参数管理', 2, 'com.erahub.base.system.controller.SysConfigController.updateByKey()', 'PUT', 1, 'admin', '', '/config/updateByKey', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-09-16 20:32:51\",\"params\":{},\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"false\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:32:52');
INSERT INTO `sys_oper_log` VALUES (1570752609781149697, '参数管理', 2, 'com.erahub.base.system.controller.SysConfigController.updateByKey()', 'PUT', 1, 'admin', '', '/config/updateByKey', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-09-16 20:32:59\",\"params\":{},\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"true\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:33:00');
INSERT INTO `sys_oper_log` VALUES (1570752790228496386, '参数管理', 2, 'com.erahub.base.system.controller.SysConfigController.updateByKey()', 'PUT', 1, 'admin', '', '/config/updateByKey', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-09-16 20:33:43\",\"params\":{},\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"false\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:33:43');
INSERT INTO `sys_oper_log` VALUES (1570752813204893697, '参数管理', 2, 'com.erahub.base.system.controller.SysConfigController.updateByKey()', 'PUT', 1, 'admin', '', '/config/updateByKey', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":\"admin\",\"updateTime\":\"2022-09-16 20:33:48\",\"params\":{},\"configId\":null,\"configName\":null,\"configKey\":\"sys.oss.previewListResource\",\"configValue\":\"true\",\"configType\":null,\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:33:49');
INSERT INTO `sys_oper_log` VALUES (1570753261634711554, '对象存储配置', 2, 'com.erahub.base.resource.controller.SysOssConfigController.edit()', 'PUT', 1, 'admin', '', '/oss/config', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"erahub\",\"secretKey\":\"erahub123\",\"bucketName\":\"erahub\",\"prefix\":\"\",\"endpoint\":\"192.168.56.10:9001\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:35:35');
INSERT INTO `sys_oper_log` VALUES (1570756179498758146, '用户头像', 2, 'com.erahub.base.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '', '/user/profile/avatar', '192.168.56.1', '', '', '', 1, '上传文件失败', '2022-09-16 20:47:11');
INSERT INTO `sys_oper_log` VALUES (1570756254052511746, '对象存储配置', 2, 'com.erahub.base.resource.controller.SysOssConfigController.edit()', 'PUT', 1, 'admin', '', '/oss/config', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":null,\"createTime\":null,\"updateBy\":null,\"updateTime\":null,\"params\":{},\"ossConfigId\":1,\"configKey\":\"minio\",\"accessKey\":\"erahub\",\"secretKey\":\"erahub123\",\"bucketName\":\"erahub\",\"prefix\":\"\",\"endpoint\":\"192.168.56.10:9000\",\"domain\":\"\",\"isHttps\":\"N\",\"status\":\"0\",\"region\":\"\",\"ext1\":\"\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:47:29');
INSERT INTO `sys_oper_log` VALUES (1570756423556919297, '用户头像', 2, 'com.erahub.base.system.controller.SysProfileController.avatar()', 'POST', 1, 'admin', '', '/user/profile/avatar', '192.168.56.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":{\"imgUrl\":\"http://192.168.56.10:9000/erahub/2022/09/16/cd579c34f22e46aab82a8f2414674cfd.jpg\"}}', 0, '', '2022-09-16 20:48:09');
INSERT INTO `sys_oper_log` VALUES (1570756650506514433, '在线用户', 7, 'com.erahub.base.system.controller.SysUserOnlineController.forceLogout()', 'DELETE', 1, 'admin', '', '/online/eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJsb2dpblR5cGUiOiJsb2dpbiIsImxvZ2luSWQiOiJzeXNfdXNlcjoxIiwicm5TdHIiOiJ0TThFZDAwT0ZZejI5Y1JPNE54d0pjNFpVbWRSbTltTCJ9.zdyFlYx5Tr1HTjaoCuYw06agfvTvSTk3RSQziy14gMs', '192.168.56.1', '', '', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:49:03');
INSERT INTO `sys_oper_log` VALUES (1570758202881339393, '菜单管理', 1, 'com.erahub.base.system.controller.SysMenuController.add()', 'POST', 1, 'admin', '', '/menu', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-16 20:55:13\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-16 20:55:13\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":\"1570758202780676098\",\"menuName\":\"Minio控制台\",\"orderNum\":9,\"path\":\"Minio\",\"component\":\"monitor/minio/index\",\"queryParam\":null,\"isFrame\":\"1\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:minio:list\",\"icon\":\"upload\",\"remark\":null}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:55:13');
INSERT INTO `sys_oper_log` VALUES (1570758902126342146, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-16 20:58:00\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":112,\"menuName\":\"Nacos控制台\",\"orderNum\":8,\"path\":\"http://127.0.0.1:8848/nacos\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:nacos:list\",\"icon\":\"nacos\",\"remark\":\"服务治理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:58:00');
INSERT INTO `sys_oper_log` VALUES (1570758994883375105, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-10 17:10:48\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-16 20:58:22\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":112,\"menuName\":\"Nacos控制台\",\"orderNum\":8,\"path\":\"http://192.168.56.10:8848/nacos\",\"component\":\"\",\"queryParam\":\"\",\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:nacos:list\",\"icon\":\"nacos\",\"remark\":\"服务治理菜单\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:58:22');
INSERT INTO `sys_oper_log` VALUES (1570759315567276033, '菜单管理', 2, 'com.erahub.base.system.controller.SysMenuController.edit()', 'PUT', 1, 'admin', '', '/menu', '192.168.56.1', '', '{\"searchValue\":null,\"createBy\":\"admin\",\"createTime\":\"2022-09-16 20:55:13\",\"updateBy\":\"admin\",\"updateTime\":\"2022-09-16 20:59:38\",\"params\":{},\"parentName\":null,\"parentId\":2,\"children\":[],\"menuId\":\"1570758202780676098\",\"menuName\":\"Minio控制台\",\"orderNum\":9,\"path\":\"http://192.168.56.10:9000\",\"component\":\"\",\"queryParam\":null,\"isFrame\":\"0\",\"isCache\":\"0\",\"menuType\":\"C\",\"visible\":\"0\",\"status\":\"0\",\"perms\":\"monitor:minio:list\",\"icon\":\"upload\",\"remark\":\"\"}', '{\"code\":200,\"msg\":\"操作成功\",\"data\":null}', 0, '', '2022-09-16 20:59:39');

-- ----------------------------
-- Table structure for sys_oss
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss`;
CREATE TABLE `sys_oss`  (
  `oss_id` bigint(0) NOT NULL COMMENT '对象存储主键',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件名',
  `original_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '原名',
  `file_suffix` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '文件后缀名',
  `url` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'URL地址',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '上传人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新人',
  `service` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'minio' COMMENT '服务商',
  PRIMARY KEY (`oss_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'OSS对象存储表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss
-- ----------------------------
INSERT INTO `sys_oss` VALUES (1570756422994882562, '2022/09/16/cd579c34f22e46aab82a8f2414674cfd.jpg', '1580571204769.jpg', '.jpg', 'http://192.168.56.10:9000/erahub/2022/09/16/cd579c34f22e46aab82a8f2414674cfd.jpg', '2022-09-16 20:48:09', 'admin', '2022-09-16 20:48:09', 'admin', 'minio');

-- ----------------------------
-- Table structure for sys_oss_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_oss_config`;
CREATE TABLE `sys_oss_config`  (
  `oss_config_id` bigint(0) NOT NULL COMMENT '主建',
  `config_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '配置key',
  `access_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'accessKey',
  `secret_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '秘钥',
  `bucket_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '桶名称',
  `prefix` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '前缀',
  `endpoint` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '访问站点',
  `domain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '自定义域名',
  `is_https` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否https（Y=是,N=否）',
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '域',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '状态（0=正常,1=停用）',
  `ext1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '扩展字段',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`oss_config_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '对象存储配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oss_config
-- ----------------------------
INSERT INTO `sys_oss_config` VALUES (1, 'minio', 'erahub', 'erahub123', 'erahub', '', '192.168.56.10:9000', '', 'N', '', '0', '', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-16 20:47:29', '');
INSERT INTO `sys_oss_config` VALUES (2, 'qiniu', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'erahub', '', 's3-cn-north-1.qiniucs.com', '', 'N', '', '1', '', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-12 17:04:33', '');
INSERT INTO `sys_oss_config` VALUES (3, 'aliyun', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'erahub', '', 'oss-cn-beijing.aliyuncs.com', '', 'N', '', '1', '', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-12 10:29:29', '');
INSERT INTO `sys_oss_config` VALUES (4, 'qcloud', 'XXXXXXXXXXXXXXX', 'XXXXXXXXXXXXXXX', 'erahub-1250000000', '', 'cos.ap-beijing.myqcloud.com', '', 'N', 'ap-beijing', '1', '', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-12 10:29:33', '');
INSERT INTO `sys_oss_config` VALUES (5, 'image', 'erahub', 'erahub123', 'erahub', 'image', '127.0.0.1:9000', '', 'N', '', '1', '', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-12 10:29:41', '');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

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
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-09-10 17:10:48', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '管理员', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-15 19:39:24', '管理员');
INSERT INTO `sys_role` VALUES (3, '本部门及以下', 'test1', 3, '4', 1, 1, '0', '2', 'admin', '2022-09-10 17:10:57', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES (4, '仅本人', 'test2', 4, '5', 1, 1, '0', '2', 'admin', '2022-09-10 17:10:57', 'admin', NULL, NULL);
INSERT INTO `sys_role` VALUES (1569245300584591362, 'test01', 'test01', 3, '2', 1, 1, '0', '0', 'admin', '2022-09-12 16:43:29', 'admin', '2022-09-15 19:20:27', NULL);

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(0) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);
INSERT INTO `sys_role_dept` VALUES (1569245300584591362, 100);
INSERT INTO `sys_role_dept` VALUES (1569245300584591362, 102);
INSERT INTO `sys_role_dept` VALUES (1569245300584591362, 108);
INSERT INTO `sys_role_dept` VALUES (1569245300584591362, 109);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 5);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 118);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 1500);
INSERT INTO `sys_role_menu` VALUES (2, 1501);
INSERT INTO `sys_role_menu` VALUES (2, 1502);
INSERT INTO `sys_role_menu` VALUES (2, 1503);
INSERT INTO `sys_role_menu` VALUES (2, 1504);
INSERT INTO `sys_role_menu` VALUES (2, 1505);
INSERT INTO `sys_role_menu` VALUES (2, 1506);
INSERT INTO `sys_role_menu` VALUES (2, 1507);
INSERT INTO `sys_role_menu` VALUES (2, 1508);
INSERT INTO `sys_role_menu` VALUES (2, 1509);
INSERT INTO `sys_role_menu` VALUES (2, 1510);
INSERT INTO `sys_role_menu` VALUES (2, 1511);
INSERT INTO `sys_role_menu` VALUES (2, 1600);
INSERT INTO `sys_role_menu` VALUES (2, 1601);
INSERT INTO `sys_role_menu` VALUES (2, 1602);
INSERT INTO `sys_role_menu` VALUES (2, 1603);
INSERT INTO `sys_role_menu` VALUES (2, 1604);
INSERT INTO `sys_role_menu` VALUES (2, 1605);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 1);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 2);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 3);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 100);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 101);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 105);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 112);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 113);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 115);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 1001);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 1003);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 1004);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 1008);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 1009);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 1026);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 1030);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 1055);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 1056);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 1057);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 1058);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 1059);
INSERT INTO `sys_role_menu` VALUES (1569245300584591362, 1060);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'sys_user' COMMENT '用户类型（sys_user系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', 'erahub', 'sys_user', '123456@163.com', '13999999999', '0', 'http://192.168.56.10:9000/erahub/2022/09/16/cd579c34f22e46aab82a8f2414674cfd.jpg', '$2a$10$dxE0pcoClCoqok3FZYQyuuF0OCW.h2bd5GfGGPwvOjEv5DgwqY9bi', '0', '0', '127.0.0.1', '2022-09-10 17:10:48', 'admin', '2022-09-10 17:10:48', 'admin', '2022-09-12 10:15:23', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'lionli', '疯狂的狮子Li', 'sys_user', 'crazyLionLi@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '2', '127.0.0.1', '2022-09-10 17:10:48', 'admin', '2022-09-10 17:10:48', '', NULL, '测试员');
INSERT INTO `sys_user` VALUES (3, 108, 'test', '本部门及以下 密码666666', 'sys_user', '', '', '0', '', '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '2', '127.0.0.1', '2022-09-10 17:10:57', 'admin', '2022-09-10 17:10:57', 'admin', '2022-09-11 08:41:22', NULL);
INSERT INTO `sys_user` VALUES (4, 102, 'test1', '仅本人 密码666666', 'sys_user', '', '', '0', '', '$2a$10$b8yUzN0C71sbz.PhNOCgJe.Tu1yWC3RNrTyjSQ8p1W0.aaUXUJ.Ne', '0', '2', '127.0.0.1', '2022-09-10 17:10:57', 'admin', '2022-09-10 17:10:57', 'test1', '2022-09-10 17:10:57', NULL);
INSERT INTO `sys_user` VALUES (5, 101, 'test03', 'test03', 'sys_user', '', '', '0', '', '$2a$10$FH9R/Swubpy/0Shjly10Ref8Qd3X2F6W.b7mi8Ft3fZJ/8VYTqOCW', '0', '2', '', NULL, 'admin', '2022-09-12 19:56:26', 'admin', '2022-09-12 19:56:26', NULL);
INSERT INTO `sys_user` VALUES (6, 101, 'test04', 'test04', 'sys_user', '', '', '0', '', '$2a$10$FH9R/Swubpy/0Shjly10Ref8Qd3X2F6W.b7mi8Ft3fZJ/8VYTqOCW', '0', '2', '', NULL, 'admin', '2022-09-12 19:56:26', 'admin', '2022-09-12 19:56:26', NULL);
INSERT INTO `sys_user` VALUES (1569245585432358914, 109, 'test01', 'test01', 'sys_user', '', '', '0', '', '$2a$10$iHn4k1aouggnzTFpgCKF7uOfAfj4uCSc6JqITyj30m3ZRPkeRGSB.', '0', '0', '', NULL, 'admin', '2022-09-12 16:44:37', 'admin', '2022-09-15 19:21:59', NULL);
INSERT INTO `sys_user` VALUES (1569246527183630337, 100, 'test02', 'test02', 'sys_user', '', '', '0', '', '$2a$10$MQIbXDzpRf1S0Yx8BtvBuuFCriXSSZ5X8/owo..sYj4CmnEvG8yuO', '0', '0', '', NULL, 'admin', '2022-09-12 16:48:22', 'admin', '2022-09-12 17:03:18', NULL);
INSERT INTO `sys_user` VALUES (1569254790117699586, 108, 'test03', 'test03', 'sys_user', '', '', '0', '', '$2a$10$bMaY30XqbcZ3lxc/1OK7eugTJRXFwBQyEni9YQwBKT7fWdz.nKTwe', '0', '2', '', NULL, 'admin', '2022-09-12 17:21:12', 'admin', '2022-09-12 17:21:12', NULL);

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (1569245585432358914, 1569245300584591362);
INSERT INTO `sys_user_role` VALUES (1569246527183630337, 1569245300584591362);

-- ----------------------------
-- Table structure for test_demo
-- ----------------------------
DROP TABLE IF EXISTS `test_demo`;
CREATE TABLE `test_demo`  (
  `id` bigint(0) NOT NULL COMMENT '主键',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '部门id',
  `user_id` bigint(0) NULL DEFAULT NULL COMMENT '用户id',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '排序号',
  `test_key` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'key键',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `version` int(0) NULL DEFAULT 0 COMMENT '版本',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试单表' ROW_FORMAT = Dynamic;

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
  `tree_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值',
  `version` int(0) NULL DEFAULT 0 COMMENT '版本',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `del_flag` int(0) NULL DEFAULT 0 COMMENT '删除标志',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '测试树表' ROW_FORMAT = Dynamic;

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
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `branch_id` bigint(0) NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int(0) NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = 'AT transaction mode undo table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
