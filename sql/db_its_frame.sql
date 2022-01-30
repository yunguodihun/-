/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50730
 Source Host           : localhost:18008
 Source Schema         : db_its_frame

 Target Server Type    : MySQL
 Target Server Version : 50730
 File Encoding         : 65001

 Date: 05/05/2021 08:55:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for demo_validation
-- ----------------------------
DROP TABLE IF EXISTS `demo_validation`;
CREATE TABLE `demo_validation` (
  `validation_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '验证实例ID',
  `int_greater_than_zero` int(30) NOT NULL COMMENT '整数大于零',
  `float_greater_than_zero` double DEFAULT NULL COMMENT '浮点大于零',
  `integer_num` int(255) DEFAULT NULL COMMENT '整数',
  `float_num` double(30,0) NOT NULL COMMENT '必须浮点',
  `number` varchar(2) DEFAULT '00' COMMENT '数字',
  `zero_to_nine` int(255) DEFAULT NULL COMMENT '零到九',
  `lng` varchar(255) DEFAULT NULL COMMENT '经度',
  `lat` varchar(255) DEFAULT NULL COMMENT '纬度',
  `chinese` varchar(255) DEFAULT NULL COMMENT '中文',
  `english` varchar(255) DEFAULT NULL COMMENT '英文',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `phone_number` varchar(11) DEFAULT '' COMMENT '手机号码',
  `zip_code` varchar(255) DEFAULT NULL COMMENT '邮政编码',
  `identity_card` varchar(255) DEFAULT NULL COMMENT '身份证',
  `license_plate_number` varchar(255) DEFAULT NULL COMMENT '车牌号',
  `ip` varchar(100) DEFAULT '' COMMENT 'ip',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`validation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='验证实例';

-- ----------------------------
-- Table structure for demo_vitae
-- ----------------------------
DROP TABLE IF EXISTS `demo_vitae`;
CREATE TABLE `demo_vitae` (
  `vitae_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '简历ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `code` varchar(30) NOT NULL COMMENT '编号',
  `birthday` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '生日',
  `sort` varchar(255) DEFAULT NULL COMMENT '排序',
  `name` varchar(30) NOT NULL COMMENT '姓名',
  `position` varchar(100) DEFAULT '00' COMMENT '职位',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `phone_number` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '在职状态（0在职 1离职）',
  `entry_start_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '入职开始时间',
  `entry_end_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '入职结束时间',
  `adept_technology` varchar(255) DEFAULT NULL COMMENT '擅长技术',
  `education_experience` varchar(255) DEFAULT NULL COMMENT '教育经历',
  `file` varchar(255) DEFAULT NULL COMMENT '附件',
  `score` double(8,0) DEFAULT NULL,
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`vitae_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='简历信息表';

-- ----------------------------
-- Records of demo_vitae
-- ----------------------------
BEGIN;
INSERT INTO `demo_vitae` VALUES (1, 100, 'admin', '2021-04-27 00:00:00', '0', '超级管理员', '1', 'langdawei@itssky.com', '15888888888', '1', '', '$2a$10$UsPVAzYpnmEqIzbY1e0pReV0amLRB465pWkY.qCWGR707KoE0OW9q', '0', '2021-04-27 00:00:00', '2021-05-15 00:00:00', '', '测试', '', 100, '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2021-05-05 08:38:12', '超级管理员');
INSERT INTO `demo_vitae` VALUES (2, 100, 'itssky', '2021-04-27 16:59:42', NULL, '管理员', '00', 'itssky@itssky.com', '15666666666', '1', '', '$2a$10$lx4xe7aJwqlANsLQ1KsRIu5tq8abKTzzTD/09VM9p8FwGYhZFLhOm', '0', '2021-04-27 16:59:42', '2021-04-27 16:59:42', '1', NULL, NULL, 88, '0', 'admin', '2020-06-01 10:30:00', 'admin', '2021-03-11 10:31:55', '管理员');
INSERT INTO `demo_vitae` VALUES (3, 100, '22', '2021-04-27 16:59:43', '0', 'test', '00', '', '', '0', '', '$2a$10$IgN/0GRk.e9wAWVL0u11BO8XjXhMMcdkSCJulf8igArFDpUDhUuoq', '0', '2021-04-27 16:59:43', '2021-04-27 16:59:43', '1', NULL, NULL, 99, '0', 'admin', '2021-03-11 10:30:48', '', '2021-04-20 13:48:26', NULL);
INSERT INTO `demo_vitae` VALUES (4, 100, '112', '2021-03-09 00:00:00', '2', '张XX', '00', '123', '123', '0', '', '', '0', '2021-03-23 00:00:00', '2021-03-27 00:00:00', ',1,2,3', '2123123', NULL, 22, '0', '', '2021-03-12 23:35:49', '', '2021-04-22 09:47:36', NULL);
INSERT INTO `demo_vitae` VALUES (5, 101, '000001', '2021-04-27 16:59:44', '0', '王XX', '4', '', '', '1', '', '', '1', '2021-04-27 16:59:44', '2021-04-27 16:59:44', '1,2,3,4,5', NULL, NULL, 77, '0', '', '2021-03-13 23:21:51', '', '2021-03-14 00:25:42', NULL);
INSERT INTO `demo_vitae` VALUES (6, 100, 'lxx', '2021-04-27 16:59:45', '1', '李XX', '2', '', '', '0', '', '', '0', '2021-04-27 16:59:45', '2021-04-27 16:59:45', '2', NULL, NULL, 66, '0', '', '2021-03-14 23:34:47', '', '2021-03-14 23:35:08', NULL);
COMMIT;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT '{}' COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `particle_status` varchar(1) DEFAULT '0' COMMENT '颗粒注册状态（0-未注册  1-已注册）',
  `request_path` varchar(500) DEFAULT NULL COMMENT '请求路径',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
BEGIN;
INSERT INTO `gen_table` VALUES (29, 'demo_vitae', '简历信息表', 'DemoVitae', 'crud', 'com.itssky.modules.demo', 'demo', 'vitae', '简历信息', 'itssky', '0', '/', '{\"parentMenuId\":\"1269\"}', 'admin', '2021-04-16 15:46:30', '', '2021-04-23 14:07:29', NULL, '1', 'com.itssky.modules.demo.demo.vitae');
INSERT INTO `gen_table` VALUES (33, 'rrd_b_reportrt_bridge_technical', '桥梁等级统计年表', 'RrdBReportrtBridgeTechnical', 'crud', 'com.itssky.modules.system', 'system', 'technical', '桥梁等级统计年', 'itssky', '0', '/', '{}', 'admin', '2021-04-22 16:22:12', '', '2021-04-22 16:22:12', NULL, '0', 'com.itssky.modules.system.system.technical');
INSERT INTO `gen_table` VALUES (34, 'rrd_b_road_administrative', '首页行政等级公路里程配置表', 'RrdBRoadAdministrative', 'crud', 'com.itssky.modules.system', 'system', 'administrative', '首页行政等级公路里程配置', 'itssky', '0', '/', '{}', 'admin', '2021-04-22 16:23:24', '', '2021-04-22 16:23:24', NULL, '0', 'com.itssky.modules.system.system.administrative');
INSERT INTO `gen_table` VALUES (35, 'sys_user', '用户信息表', 'SysUser', 'crud', 'com.itssky.modules.system', 'system', 'user', '用户信息', 'itssky', '0', '/', '{}', 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:53', NULL, '1', 'com.itssky.modules.system.system.user');
INSERT INTO `gen_table` VALUES (36, 'particle_table', '代码生成业务表', 'ParticleTable', 'crud', 'com.itssky.modules.particle', 'particle', 'table', '数据清单', 'itssky', '0', '/', '{\"parentMenuId\":\"1322\"}', 'admin', '2021-04-23 16:20:19', '', '2021-04-23 23:51:53', NULL, '1', 'com.itssky.modules.particle.particle.table');
INSERT INTO `gen_table` VALUES (37, 'particle_table_column', '数据清单字段表', 'ParticleTableColumn', 'crud', 'com.itssky.modules.system', 'system', 'column', '数据清单字段', 'itssky', '0', '/', '{}', 'admin', '2021-04-24 15:45:46', '', '2021-04-24 15:45:46', NULL, '0', 'com.itssky.modules.system.system.column');
INSERT INTO `gen_table` VALUES (39, 'demo_validation', '验证实例', 'DemoValidation', 'crud', 'com.itssky.modules.system', 'system', 'validation', '验证实例', 'itssky', '0', '/', '{}', 'admin', '2021-04-25 00:31:55', '', '2021-04-25 00:31:55', NULL, '0', 'com.itssky.modules.system.system.validation');
INSERT INTO `gen_table` VALUES (41, 'oneaccess_user', '', 'OneaccessUser', 'crud', 'com.itssky.modules.system', 'system', 'user', NULL, 'itssky', '0', '/', '{}', 'admin', '2021-04-25 15:06:33', '', '2021-04-25 15:06:33', NULL, '0', NULL);
INSERT INTO `gen_table` VALUES (42, 'oneaccess_org', '', 'OneaccessOrg', 'crud', 'com.itssky.modules.system', 'system', 'org', NULL, 'itssky', '0', '/', '{}', 'admin', '2021-04-26 16:14:16', '', '2021-04-26 16:14:16', NULL, '0', NULL);
INSERT INTO `gen_table` VALUES (43, 'particle_config', '颗粒配置表', 'ParticleConfig', 'crud', 'com.itssky.modules.particle', 'particle', 'config', '颗粒配置', 'itssky', '0', '/', '{\"parentMenuId\":1322}', 'admin', '2021-04-29 16:38:49', '', '2021-04-29 16:42:53', NULL, '0', 'com.itssky.modules.system.system.config');
INSERT INTO `gen_table` VALUES (45, 'sys_area', '区域表', 'SysArea', 'crud', 'com.itssky.modules.system', 'system', 'area', '区域', 'itssky', '0', '/', '{}', 'admin', '2021-05-04 14:40:34', '', '2021-05-04 14:42:05', NULL, '0', 'com.itssky.modules.system.system.area');
COMMIT;

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `is_detail` char(1) DEFAULT NULL COMMENT '是否详情字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=927 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_column` VALUES (625, '29', 'vitae_id', '简历ID', 'bigint(20)', 'Long', 'vitaeId', '1', '1', NULL, '1', NULL, '1', NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-16 15:46:30', '', '2021-04-23 14:07:29');
INSERT INTO `gen_table_column` VALUES (626, '29', 'dept_id', '部门ID', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 2, 'admin', '2021-04-16 15:46:30', '', '2021-04-23 14:07:29');
INSERT INTO `gen_table_column` VALUES (627, '29', 'code', '编号', 'varchar(30)', 'String', 'code', '0', '0', '1', '1', '1', '1', NULL, '1', 'EQ', 'input', '', 3, 'admin', '2021-04-16 15:46:30', '', '2021-04-23 14:07:29');
INSERT INTO `gen_table_column` VALUES (628, '29', 'birthday', '生日', 'datetime', 'Date', 'birthday', '0', '0', NULL, '1', '1', '1', NULL, '1', 'EQ', 'datetime', '', 4, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:29');
INSERT INTO `gen_table_column` VALUES (629, '29', 'sort', '排序', 'varchar(255)', 'String', 'sort', '0', '0', NULL, '1', '1', '1', '1', '1', 'EQ', 'input', '', 5, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:29');
INSERT INTO `gen_table_column` VALUES (630, '29', 'name', '姓名', 'varchar(30)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 6, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:29');
INSERT INTO `gen_table_column` VALUES (631, '29', 'position', '职位', 'varchar(2)', 'String', 'position', '0', '0', NULL, '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:29');
INSERT INTO `gen_table_column` VALUES (632, '29', 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', '1', 'EQ', 'input', '', 8, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:29');
INSERT INTO `gen_table_column` VALUES (633, '29', 'phone_number', '手机号码', 'varchar(11)', 'String', 'phoneNumber', '0', '0', NULL, '1', '1', '1', '1', '1', 'EQ', 'input', '', 9, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:29');
INSERT INTO `gen_table_column` VALUES (634, '29', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 10, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:29');
INSERT INTO `gen_table_column` VALUES (635, '29', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'uploadImage', '', 11, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:29');
INSERT INTO `gen_table_column` VALUES (636, '29', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:29');
INSERT INTO `gen_table_column` VALUES (637, '29', 'status', '在职状态（0在职 1离职）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'radio', 'on_job_status', 13, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:29');
INSERT INTO `gen_table_column` VALUES (638, '29', 'entry_start_time', '入职开始时间', 'datetime', 'Date', 'entryStartTime', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:29');
INSERT INTO `gen_table_column` VALUES (639, '29', 'entry_end_time', '入职结束时间', 'datetime', 'Date', 'entryEndTime', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'datetime', '', 15, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:30');
INSERT INTO `gen_table_column` VALUES (640, '29', 'adept_technology', '擅长技术', 'varchar(255)', 'String', 'adeptTechnology', '0', '0', NULL, '1', '1', '1', '1', '1', 'EQ', 'select', '', 16, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:30');
INSERT INTO `gen_table_column` VALUES (641, '29', 'education_experience', '教育经历', 'varchar(255)', 'String', 'educationExperience', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 17, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:30');
INSERT INTO `gen_table_column` VALUES (642, '29', 'file', '附件', 'varchar(255)', 'String', 'file', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 18, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:30');
INSERT INTO `gen_table_column` VALUES (643, '29', 'score', NULL, 'double(8,0)', 'Long', 'score', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 19, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:30');
INSERT INTO `gen_table_column` VALUES (644, '29', 'del_flag', '删除标志（0代表存在 1代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:30');
INSERT INTO `gen_table_column` VALUES (645, '29', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 21, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:30');
INSERT INTO `gen_table_column` VALUES (646, '29', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 22, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:30');
INSERT INTO `gen_table_column` VALUES (647, '29', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 23, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:30');
INSERT INTO `gen_table_column` VALUES (648, '29', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 24, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:30');
INSERT INTO `gen_table_column` VALUES (649, '29', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, '1', 'EQ', 'textarea', '', 25, 'admin', '2021-04-16 15:46:31', '', '2021-04-23 14:07:30');
INSERT INTO `gen_table_column` VALUES (696, '33', 'ID', '编号', 'varchar(64)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (697, '33', 'AREA_ID', '区域', 'varchar(64)', 'String', 'areaId', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 2, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (698, '33', 'YEAR', '年', 'varchar(4)', 'String', 'year', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (699, '33', 'ONE_NUMBER', '一类数量', 'int(8)', 'Integer', 'oneNumber', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (700, '33', 'TWO_NUMBER', '二类数量', 'int(8)', 'Integer', 'twoNumber', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (701, '33', 'THREE_NUMBER', '三类数量', 'int(8)', 'Integer', 'threeNumber', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (702, '33', 'FOUR_NUMBER', '四类数量', 'int(8)', 'Integer', 'fourNumber', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (703, '33', 'FIVE_NUMBER', '五类数量', 'int(8)', 'Integer', 'fiveNumber', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (704, '33', 'UNASSESSED_NUMBER', '五类数量', 'int(8)', 'Integer', 'unassessedNumber', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (705, '33', 'TOTAL', '合计', 'int(8)', 'Integer', 'total', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (706, '33', 'SOURCE', '数据来源类型 1:ETL抽取 2:手动配置', 'varchar(64)', 'String', 'source', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (707, '33', 'CREATE_BY', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (708, '33', 'CREATE_DATE', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'datetime', '', 13, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (709, '33', 'UPDATE_BY', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 14, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (710, '33', 'UPDATE_DATE', '更新时间', 'datetime', 'Date', 'updateDate', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'datetime', '', 15, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (711, '33', 'REMARKS', '备注信息', 'varchar(1000)', 'String', 'remarks', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 16, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (712, '33', 'DEL_FLAG', '删除标记', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 17, 'admin', '2021-04-22 16:22:13', '', NULL);
INSERT INTO `gen_table_column` VALUES (713, '34', 'ID', 'ID', 'varchar(64)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-22 16:23:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (714, '34', 'CREATE_BY', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 2, 'admin', '2021-04-22 16:23:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (715, '34', 'CREATE_DATE', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'datetime', '', 3, 'admin', '2021-04-22 16:23:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (716, '34', 'UPDATE_BY', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2021-04-22 16:23:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (717, '34', 'UPDATE_DATE', '更新时间', 'datetime', 'Date', 'updateDate', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'datetime', '', 5, 'admin', '2021-04-22 16:23:24', '', NULL);
INSERT INTO `gen_table_column` VALUES (718, '34', 'REMARKS', '备注', 'varchar(2000)', 'String', 'remarks', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 6, 'admin', '2021-04-22 16:23:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (719, '34', 'DEL_FLAG', '删除标志', 'varchar(1)', 'String', 'delFlag', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-04-22 16:23:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (720, '34', 'SOURCE', '数据来源', 'varchar(1)', 'String', 'source', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-04-22 16:23:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (721, '34', 'YEAR', '年份', 'varchar(4)', 'String', 'year', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-04-22 16:23:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (722, '34', 'AREA_ID', '区域ID', 'varchar(64)', 'String', 'areaId', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-04-22 16:23:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (723, '34', 'ROAD_X', '县道里程', 'double(10,3)', 'BigDecimal', 'roadX', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2021-04-22 16:23:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (724, '34', 'ROAD_Y', '乡道里程', 'double(10,3)', 'BigDecimal', 'roadY', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-04-22 16:23:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (725, '34', 'ROAD_C', '村道里程', 'double(10,3)', 'BigDecimal', 'roadC', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2021-04-22 16:23:25', '', NULL);
INSERT INTO `gen_table_column` VALUES (726, '35', 'user_id', '用户ID', 'bigint(20)', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:54');
INSERT INTO `gen_table_column` VALUES (727, '35', 'dept_id', '部门ID', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', '1', 'EQ', 'input', '', 2, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:54');
INSERT INTO `gen_table_column` VALUES (728, '35', 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:54');
INSERT INTO `gen_table_column` VALUES (729, '35', 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:54');
INSERT INTO `gen_table_column` VALUES (730, '35', 'user_type', '用户类型（00系统用户 20执法人员）', 'varchar(2)', 'String', 'userType', '0', '0', NULL, '1', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:54');
INSERT INTO `gen_table_column` VALUES (731, '35', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:54');
INSERT INTO `gen_table_column` VALUES (732, '35', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:54');
INSERT INTO `gen_table_column` VALUES (733, '35', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'select', '', 8, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:55');
INSERT INTO `gen_table_column` VALUES (734, '35', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:55');
INSERT INTO `gen_table_column` VALUES (735, '35', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:55');
INSERT INTO `gen_table_column` VALUES (736, '35', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'radio', '', 11, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:55');
INSERT INTO `gen_table_column` VALUES (737, '35', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:55');
INSERT INTO `gen_table_column` VALUES (738, '35', 'login_ip', '最后登陆IP', 'varchar(50)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:55');
INSERT INTO `gen_table_column` VALUES (739, '35', 'login_date', '最后登陆时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:55');
INSERT INTO `gen_table_column` VALUES (740, '35', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:56');
INSERT INTO `gen_table_column` VALUES (741, '35', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:56');
INSERT INTO `gen_table_column` VALUES (742, '35', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:56');
INSERT INTO `gen_table_column` VALUES (743, '35', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:56');
INSERT INTO `gen_table_column` VALUES (744, '35', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'textarea', '', 19, 'admin', '2021-04-22 23:56:55', '', '2021-04-23 15:25:56');
INSERT INTO `gen_table_column` VALUES (745, '36', 'table_id', '编号', 'bigint(20)', 'Long', 'tableId', '1', '1', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-23 16:20:19', '', '2021-04-23 23:51:53');
INSERT INTO `gen_table_column` VALUES (746, '36', 'table_name', '表名称', 'varchar(200)', 'String', 'tableName', '0', '0', NULL, '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2021-04-23 16:20:19', '', '2021-04-23 23:51:53');
INSERT INTO `gen_table_column` VALUES (747, '36', 'table_comment', '表描述', 'varchar(500)', 'String', 'tableComment', '0', '0', NULL, '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', '2021-04-23 16:20:19', '', '2021-04-23 23:51:53');
INSERT INTO `gen_table_column` VALUES (748, '36', 'role_id', '角色ID', 'bigint(11)', 'Long', 'roleId', '0', '0', '1', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 4, 'admin', '2021-04-23 16:20:19', '', '2021-04-23 23:51:53');
INSERT INTO `gen_table_column` VALUES (749, '36', 'class_name', '实体类名称', 'varchar(100)', 'String', 'className', '0', '0', NULL, '1', '1', '1', NULL, '1', 'LIKE', 'input', '', 5, 'admin', '2021-04-23 16:20:19', '', '2021-04-23 23:51:53');
INSERT INTO `gen_table_column` VALUES (750, '36', 'tpl_category', '使用的模板（crud单表操作 tree树表操作）', 'varchar(200)', 'String', 'tplCategory', '0', '0', NULL, '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 6, 'admin', '2021-04-23 16:20:19', '', '2021-04-23 23:51:53');
INSERT INTO `gen_table_column` VALUES (751, '36', 'package_name', '生成包路径', 'varchar(100)', 'String', 'packageName', '0', '0', NULL, '1', '1', NULL, NULL, '1', 'LIKE', 'input', '', 7, 'admin', '2021-04-23 16:20:19', '', '2021-04-23 23:51:53');
INSERT INTO `gen_table_column` VALUES (752, '36', 'module_name', '生成模块名', 'varchar(30)', 'String', 'moduleName', '0', '0', NULL, '1', '1', NULL, NULL, '1', 'LIKE', 'input', '', 8, 'admin', '2021-04-23 16:20:19', '', '2021-04-23 23:51:53');
INSERT INTO `gen_table_column` VALUES (753, '36', 'business_name', '生成业务名', 'varchar(30)', 'String', 'businessName', '0', '0', NULL, '1', '1', NULL, NULL, '1', 'LIKE', 'input', '', 9, 'admin', '2021-04-23 16:20:20', '', '2021-04-23 23:51:53');
INSERT INTO `gen_table_column` VALUES (754, '36', 'function_name', '生成功能名', 'varchar(50)', 'String', 'functionName', '0', '0', NULL, '1', '1', NULL, NULL, '1', 'LIKE', 'input', '', 10, 'admin', '2021-04-23 16:20:20', '', '2021-04-23 23:51:53');
INSERT INTO `gen_table_column` VALUES (755, '36', 'function_author', '生成功能作者', 'varchar(50)', 'String', 'functionAuthor', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-04-23 16:20:20', '', '2021-04-23 23:51:53');
INSERT INTO `gen_table_column` VALUES (756, '36', 'gen_type', '生成代码方式（0zip压缩包 1自定义路径）', 'char(1)', 'String', 'genType', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'select', '', 12, 'admin', '2021-04-23 16:20:20', '', '2021-04-23 23:51:53');
INSERT INTO `gen_table_column` VALUES (757, '36', 'gen_path', '生成路径（不填默认项目路径）', 'varchar(200)', 'String', 'genPath', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2021-04-23 16:20:20', '', '2021-04-23 23:51:53');
INSERT INTO `gen_table_column` VALUES (758, '36', 'options', '其它生成选项', 'varchar(1000)', 'String', 'options', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'textarea', '', 14, 'admin', '2021-04-23 16:20:20', '', '2021-04-23 23:51:54');
INSERT INTO `gen_table_column` VALUES (759, '36', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2021-04-23 16:20:20', '', '2021-04-23 23:51:54');
INSERT INTO `gen_table_column` VALUES (760, '36', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, '1', NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2021-04-23 16:20:20', '', '2021-04-23 23:51:54');
INSERT INTO `gen_table_column` VALUES (761, '36', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2021-04-23 16:20:20', '', '2021-04-23 23:51:54');
INSERT INTO `gen_table_column` VALUES (762, '36', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2021-04-23 16:20:20', '', '2021-04-23 23:51:54');
INSERT INTO `gen_table_column` VALUES (763, '36', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'textarea', '', 19, 'admin', '2021-04-23 16:20:20', '', '2021-04-23 23:51:54');
INSERT INTO `gen_table_column` VALUES (764, '36', 'particle_status', '颗粒注册状态（0-未注册  1-已注册）', 'varchar(1)', 'String', 'particleStatus', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'radio', '', 20, 'admin', '2021-04-23 16:20:20', '', '2021-04-23 23:51:54');
INSERT INTO `gen_table_column` VALUES (765, '36', 'request_path', '请求路径', 'varchar(500)', 'String', 'requestPath', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'textarea', '', 21, 'admin', '2021-04-23 16:20:20', '', '2021-04-23 23:51:54');
INSERT INTO `gen_table_column` VALUES (766, '37', 'column_id', '编号', 'bigint(20)', 'Long', 'columnId', '1', '1', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (767, '37', 'table_id', '归属表编号', 'varchar(64)', 'String', 'tableId', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 2, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (768, '37', 'column_name', '列名称', 'varchar(200)', 'String', 'columnName', '0', '0', NULL, '1', '1', '1', '1', NULL, 'LIKE', 'input', '', 3, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (769, '37', 'column_comment', '列描述', 'varchar(500)', 'String', 'columnComment', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 4, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (770, '37', 'column_type', '列类型', 'varchar(100)', 'String', 'columnType', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'select', '', 5, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (771, '37', 'java_type', 'JAVA类型', 'varchar(500)', 'String', 'javaType', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'select', '', 6, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (772, '37', 'java_field', 'JAVA字段名', 'varchar(200)', 'String', 'javaField', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (773, '37', 'is_pk', '是否主键（1是）', 'char(1)', 'String', 'isPk', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (774, '37', 'is_increment', '是否自增（1是）', 'char(1)', 'String', 'isIncrement', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (775, '37', 'is_required', '是否必填（1是）', 'char(1)', 'String', 'isRequired', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (776, '37', 'is_insert', '是否为插入字段（1是）', 'char(1)', 'String', 'isInsert', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (777, '37', 'is_edit', '是否编辑字段（1是）', 'char(1)', 'String', 'isEdit', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (778, '37', 'is_list', '是否列表字段（1是）', 'char(1)', 'String', 'isList', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (779, '37', 'is_query', '是否查询字段（1是）', 'char(1)', 'String', 'isQuery', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 14, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (780, '37', 'is_detail', '是否详情字段（1是）', 'char(1)', 'String', 'isDetail', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 15, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (781, '37', 'query_type', '查询方式（等于、不等于、大于、小于、范围）', 'varchar(200)', 'String', 'queryType', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'select', '', 16, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (782, '37', 'html_type', '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）', 'varchar(200)', 'String', 'htmlType', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'select', '', 17, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (783, '37', 'dict_type', '字典类型', 'varchar(200)', 'String', 'dictType', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'select', '', 18, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (784, '37', 'sort', '排序', 'int(11)', 'Long', 'sort', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 19, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (785, '37', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 20, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (786, '37', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 21, 'admin', '2021-04-24 15:45:46', '', NULL);
INSERT INTO `gen_table_column` VALUES (787, '37', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 22, 'admin', '2021-04-24 15:45:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (788, '37', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 23, 'admin', '2021-04-24 15:45:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (789, '37', 'role_id', '角色ID', 'bigint(20)', 'Long', 'roleId', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 24, 'admin', '2021-04-24 15:45:47', '', NULL);
INSERT INTO `gen_table_column` VALUES (810, '39', 'validation_id', '验证实例ID', 'bigint(20)', 'Long', 'validationId', '1', '1', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (811, '39', 'int_greater_than_zero', '整数大于零', 'int(30)', 'Long', 'intGreaterThanZero', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 2, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (812, '39', 'float_greater_than_zero', '浮点大于零', 'double', 'Long', 'floatGreaterThanZero', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (813, '39', 'integer_num', '整数', 'int(255)', 'Long', 'integerNum', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (814, '39', 'float_num', '必须浮点', 'double(30,0)', 'Long', 'floatNum', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (815, '39', 'number', '数字', 'varchar(2)', 'String', 'number', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (816, '39', 'zero_to_nine', '零到九', 'int(255)', 'Long', 'zeroToNine', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (817, '39', 'lng', '经度', 'varchar(255)', 'String', 'lng', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (818, '39', 'lat', '纬度', 'varchar(255)', 'String', 'lat', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (819, '39', 'chinese', '中文', 'varchar(255)', 'String', 'chinese', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (820, '39', 'english', '英文', 'varchar(255)', 'String', 'english', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (821, '39', 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (822, '39', 'phone_number', '手机号码', 'varchar(11)', 'String', 'phoneNumber', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (823, '39', 'zip_code', '邮政编码', 'varchar(255)', 'String', 'zipCode', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 14, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (824, '39', 'identity_card', '身份证', 'varchar(255)', 'String', 'identityCard', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 15, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (825, '39', 'license_plate_number', '车牌号', 'varchar(255)', 'String', 'licensePlateNumber', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 16, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (826, '39', 'ip', 'ip', 'varchar(100)', 'String', 'ip', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 17, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (827, '39', 'del_flag', '删除标志（0代表存在 1代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (828, '39', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (829, '39', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 20, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (830, '39', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 21, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (831, '39', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 22, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (832, '39', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'textarea', '', 23, 'admin', '2021-04-25 00:31:55', '', NULL);
INSERT INTO `gen_table_column` VALUES (833, '40', 'config_id', '配置主键', 'bigint(20)', 'Long', 'configId', '1', '1', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (834, '40', 'config_name', '配置名称', 'varchar(50)', 'String', 'configName', '0', '0', '1', '1', '1', '1', '1', NULL, 'LIKE', 'input', '', 2, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (835, '40', 'order_num', '显示顺序', 'int(4)', 'Integer', 'orderNum', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (836, '40', 'path', '路由地址', 'varchar(200)', 'String', 'path', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (837, '40', 'component', '组件路径', 'varchar(255)', 'String', 'component', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (838, '40', 'is_frame', '是否为外链（0是 1否）', 'int(1)', 'Integer', 'isFrame', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (839, '40', 'status', '菜单状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'radio', '', 7, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (840, '40', 'perms', '权限标识', 'varchar(100)', 'String', 'perms', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (841, '40', 'icon', '菜单图标', 'varchar(100)', 'String', 'icon', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (842, '40', 'table_id', '业务表ID', 'varchar(10)', 'String', 'tableId', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (843, '40', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (844, '40', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (845, '40', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 13, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (846, '40', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (847, '40', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'textarea', '', 15, 'admin', '2021-04-25 00:32:08', '', NULL);
INSERT INTO `gen_table_column` VALUES (848, '41', 'id', '主键', 'varchar(64)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-25 15:06:33', '', NULL);
INSERT INTO `gen_table_column` VALUES (849, '41', 'name', '姓名', 'varchar(30)', 'String', 'name', '0', '0', NULL, '1', '1', '1', '1', NULL, 'LIKE', 'input', '', 2, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (850, '41', 'phone', '手机号', 'varchar(30)', 'String', 'phone', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (851, '41', 'mail', '邮箱', 'varchar(50)', 'String', 'mail', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (852, '41', 'id_num', '身份证', 'varchar(60)', 'String', 'idNum', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (853, '41', 'password', '密码', 'varchar(60)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (854, '41', 'confirm_password', '确认密码', 'varchar(60)', 'String', 'confirmPassword', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (855, '41', 'sex', '性别', 'varchar(10)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'select', '', 8, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (856, '41', 'political_outlook', '政治面貌', 'varchar(16)', 'String', 'politicalOutlook', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (857, '41', 'direct_leadership', '直属领导', 'varchar(64)', 'String', 'directLeadership', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (858, '41', 'license_plate', '车牌号', 'varchar(64)', 'String', 'licensePlate', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (859, '41', 'office_telephone', '办公电话', 'varchar(40)', 'String', 'officeTelephone', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (860, '41', 'fax', '传真', 'varchar(40)', 'String', 'fax', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (861, '41', 'main_position', '主要职务', 'varchar(40)', 'String', 'mainPosition', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 14, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (862, '41', 'job_responsibilities', '职位职责', 'varchar(40)', 'String', 'jobResponsibilities', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 15, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (863, '41', 'personnel_nature', '人员性质', 'varchar(40)', 'String', 'personnelNature', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 16, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (864, '41', 'nation', '民族', 'varchar(10)', 'String', 'nation', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 17, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (865, '41', 'qq_num', 'QQ', 'varchar(20)', 'String', 'qqNum', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 18, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (866, '41', 'serial_number', '序号', 'varchar(20)', 'String', 'serialNumber', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 19, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (867, '41', 'org_id', '党政通ID', 'varchar(64)', 'String', 'orgId', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 20, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (868, '41', 'user_name', '用户名', 'varchar(30)', 'String', 'userName', '0', '0', NULL, '1', '1', '1', '1', NULL, 'LIKE', 'input', '', 21, 'admin', '2021-04-25 15:06:34', '', NULL);
INSERT INTO `gen_table_column` VALUES (869, '42', 'id', '主键', 'varchar(64)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-26 16:14:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (870, '42', 'full_name_one', '全名', 'varchar(64)', 'String', 'fullNameOne', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 2, 'admin', '2021-04-26 16:14:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (871, '42', 'sup_org_one', '上级机构', 'varchar(64)', 'String', 'supOrgOne', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2021-04-26 16:14:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (872, '42', 'describe_one', '描述', 'varchar(300)', 'String', 'describeOne', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', '2021-04-26 16:14:16', '', NULL);
INSERT INTO `gen_table_column` VALUES (873, '42', 'category_one', '类别', 'varchar(30)', 'String', 'categoryOne', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-04-26 16:14:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (874, '42', 'type_one', '类型', 'varchar(30)', 'String', 'typeOne', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-04-26 16:14:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (875, '42', 'serial_num_one', '序号', 'varchar(30)', 'String', 'serialNumOne', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-04-26 16:14:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (876, '42', 'occupation_one', '职务', 'varchar(30)', 'String', 'occupationOne', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 8, 'admin', '2021-04-26 16:14:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (877, '42', 'phone_one', '电话', 'varchar(20)', 'String', 'phoneOne', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-04-26 16:14:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (878, '42', 'postcode_one', '邮编', 'varchar(40)', 'String', 'postcodeOne', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 10, 'admin', '2021-04-26 16:14:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (879, '42', 'org_id_one', '党政通组织ID', 'varchar(64)', 'String', 'orgIdOne', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2021-04-26 16:14:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (880, '42', 'address_one', '地址', 'varchar(300)', 'String', 'addressOne', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 12, 'admin', '2021-04-26 16:14:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (881, '42', 'credit_code_one', '信用代码', 'varchar(200)', 'String', 'creditCodeOne', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2021-04-26 16:14:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (882, '42', 'area_code_one', '辖区编码', 'varchar(64)', 'String', 'areaCodeOne', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 14, 'admin', '2021-04-26 16:14:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (883, '42', 'guid_one', 'guid', 'varchar(64)', 'String', 'guidOne', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 15, 'admin', '2021-04-26 16:14:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (884, '42', 'update_date', '修改时间', 'datetime', 'Date', 'updateDate', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'datetime', '', 16, 'admin', '2021-04-26 16:14:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (885, '42', 'create_date', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'datetime', '', 17, 'admin', '2021-04-26 16:14:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (886, '42', 'create_by', '创建人', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 18, 'admin', '2021-04-26 16:14:17', '', NULL);
INSERT INTO `gen_table_column` VALUES (887, '43', 'config_id', '配置主键', 'bigint(20)', 'Long', 'configId', '1', '1', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-04-29 16:38:49', '', '2021-04-29 16:42:53');
INSERT INTO `gen_table_column` VALUES (888, '43', 'config_name', '配置名称', 'varchar(50)', 'String', 'configName', '0', '0', '1', '1', '1', '1', '1', NULL, 'LIKE', 'input', '', 2, 'admin', '2021-04-29 16:38:49', '', '2021-04-29 16:42:53');
INSERT INTO `gen_table_column` VALUES (889, '43', 'request_path', '路由地址', 'varchar(200)', 'String', 'requestPath', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2021-04-29 16:38:49', '', '2021-04-29 16:42:53');
INSERT INTO `gen_table_column` VALUES (890, '43', 'params', '参数', 'varchar(2000)', 'String', 'params', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'textarea', '', 4, 'admin', '2021-04-29 16:38:49', '', '2021-04-29 16:42:53');
INSERT INTO `gen_table_column` VALUES (891, '43', 'status', '启用状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'radio', '', 5, 'admin', '2021-04-29 16:38:49', '', '2021-04-29 16:42:53');
INSERT INTO `gen_table_column` VALUES (892, '43', 'table_id', '业务表ID', 'varchar(10)', 'String', 'tableId', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-04-29 16:38:49', '', '2021-04-29 16:42:53');
INSERT INTO `gen_table_column` VALUES (893, '43', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', '2021-04-29 16:38:49', '', '2021-04-29 16:42:53');
INSERT INTO `gen_table_column` VALUES (894, '43', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', '2021-04-29 16:38:50', '', '2021-04-29 16:42:53');
INSERT INTO `gen_table_column` VALUES (895, '43', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', '2021-04-29 16:38:50', '', '2021-04-29 16:42:53');
INSERT INTO `gen_table_column` VALUES (896, '43', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-04-29 16:38:50', '', '2021-04-29 16:42:54');
INSERT INTO `gen_table_column` VALUES (897, '43', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'textarea', '', 11, 'admin', '2021-04-29 16:38:50', '', '2021-04-29 16:42:54');
INSERT INTO `gen_table_column` VALUES (898, '43', 'del_flag', '删除标志（0代表存在 1代表删除）', 'varchar(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', '2021-04-29 16:38:50', '', '2021-04-29 16:42:54');
INSERT INTO `gen_table_column` VALUES (913, '45', 'ID', '主键', 'varchar(64)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2021-05-04 14:40:34', '', '2021-05-04 14:42:05');
INSERT INTO `gen_table_column` VALUES (914, '45', 'PARENT_ID', '父ID', 'varchar(64)', 'String', 'parentId', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 2, 'admin', '2021-05-04 14:40:34', '', '2021-05-04 14:42:05');
INSERT INTO `gen_table_column` VALUES (915, '45', 'PARENT_IDS', '父IDS', 'text', 'String', 'parentIds', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 3, 'admin', '2021-05-04 14:40:34', '', '2021-05-04 14:42:05');
INSERT INTO `gen_table_column` VALUES (916, '45', 'NAME', '名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', '1', NULL, 'LIKE', 'input', '', 4, 'admin', '2021-05-04 14:40:34', '', '2021-05-04 14:42:05');
INSERT INTO `gen_table_column` VALUES (917, '45', 'SORT', '排序', 'decimal(10,0)', 'Long', 'sort', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 5, 'admin', '2021-05-04 14:40:34', '', '2021-05-04 14:42:05');
INSERT INTO `gen_table_column` VALUES (918, '45', 'PARENT_CODE', '父编号', 'varchar(100)', 'String', 'parentCode', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', '2021-05-04 14:40:34', '', '2021-05-04 14:42:05');
INSERT INTO `gen_table_column` VALUES (919, '45', 'CODE', '编号', 'varchar(100)', 'String', 'code', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 7, 'admin', '2021-05-04 14:40:35', '', '2021-05-04 14:42:05');
INSERT INTO `gen_table_column` VALUES (920, '45', 'TYPE', '类型', 'char(1)', 'String', 'type', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'select', 'site_point_type', 8, 'admin', '2021-05-04 14:40:35', '', '2021-05-04 14:42:05');
INSERT INTO `gen_table_column` VALUES (921, '45', 'CREATE_BY', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 9, 'admin', '2021-05-04 14:40:35', '', '2021-05-04 14:42:05');
INSERT INTO `gen_table_column` VALUES (922, '45', 'CREATE_DATE', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'datetime', '', 10, 'admin', '2021-05-04 14:40:35', '', '2021-05-04 14:42:05');
INSERT INTO `gen_table_column` VALUES (923, '45', 'UPDATE_BY', '修改者', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 11, 'admin', '2021-05-04 14:40:35', '', '2021-05-04 14:42:05');
INSERT INTO `gen_table_column` VALUES (924, '45', 'UPDATE_DATE', '修改时间', 'datetime', 'Date', 'updateDate', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'datetime', '', 12, 'admin', '2021-05-04 14:40:35', '', '2021-05-04 14:42:05');
INSERT INTO `gen_table_column` VALUES (925, '45', 'REMARKS', '备注', 'varchar(255)', 'String', 'remarks', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 13, 'admin', '2021-05-04 14:40:35', '', '2021-05-04 14:42:05');
INSERT INTO `gen_table_column` VALUES (926, '45', 'DEL_FLAG', '删除标识', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', '1', '1', '1', NULL, 'EQ', 'input', '', 14, 'admin', '2021-05-04 14:40:35', '', '2021-05-04 14:42:05');
COMMIT;

-- ----------------------------
-- Table structure for gen_table_role
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_role`;
CREATE TABLE `gen_table_role` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '表编号',
  `role_id` varchar(200) NOT NULL DEFAULT '' COMMENT '角色编号',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table_role
-- ----------------------------
BEGIN;
INSERT INTO `gen_table_role` VALUES (29, '1');
COMMIT;

-- ----------------------------
-- Table structure for oneaccess_org
-- ----------------------------
DROP TABLE IF EXISTS `oneaccess_org`;
CREATE TABLE `oneaccess_org` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `full_name_one` varchar(64) DEFAULT NULL COMMENT '全名',
  `sup_org_one` varchar(64) DEFAULT NULL COMMENT '上级机构',
  `describe_one` varchar(300) DEFAULT NULL COMMENT '描述',
  `category_one` varchar(30) DEFAULT NULL COMMENT '类别',
  `type_one` varchar(30) DEFAULT NULL COMMENT '类型',
  `serial_num_one` varchar(30) DEFAULT NULL COMMENT '序号',
  `occupation_one` varchar(30) DEFAULT NULL COMMENT '职务',
  `phone_one` varchar(20) DEFAULT NULL COMMENT '电话',
  `postcode_one` varchar(40) DEFAULT NULL COMMENT '邮编',
  `org_id_one` varchar(64) DEFAULT NULL COMMENT '党政通组织ID',
  `address_one` varchar(300) DEFAULT NULL COMMENT '地址',
  `credit_code_one` varchar(200) DEFAULT NULL COMMENT '信用代码',
  `area_code_one` varchar(64) DEFAULT NULL COMMENT '辖区编码',
  `guid_one` varchar(64) DEFAULT NULL COMMENT 'guid',
  `update_date` datetime DEFAULT NULL COMMENT '修改时间',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `create_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '创建人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for oneaccess_user
-- ----------------------------
DROP TABLE IF EXISTS `oneaccess_user`;
CREATE TABLE `oneaccess_user` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `name` varchar(30) DEFAULT NULL COMMENT '姓名',
  `phone` varchar(30) DEFAULT NULL COMMENT '手机号',
  `mail` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `id_num` varchar(60) DEFAULT NULL COMMENT '身份证',
  `password` varchar(60) DEFAULT NULL COMMENT '密码',
  `confirm_password` varchar(60) DEFAULT NULL COMMENT '确认密码',
  `sex` varchar(10) DEFAULT NULL COMMENT '性别',
  `political_outlook` varchar(16) DEFAULT NULL COMMENT '政治面貌',
  `direct_leadership` varchar(64) DEFAULT NULL COMMENT '直属领导',
  `license_plate` varchar(64) DEFAULT NULL COMMENT '车牌号',
  `office_telephone` varchar(40) DEFAULT NULL COMMENT '办公电话',
  `fax` varchar(40) DEFAULT NULL COMMENT '传真',
  `main_position` varchar(40) DEFAULT NULL COMMENT '主要职务',
  `job_responsibilities` varchar(40) DEFAULT NULL COMMENT '职位职责',
  `personnel_nature` varchar(40) DEFAULT NULL COMMENT '人员性质',
  `nation` varchar(10) DEFAULT NULL COMMENT '民族',
  `qq_num` varchar(20) DEFAULT NULL COMMENT 'QQ',
  `serial_number` varchar(20) DEFAULT NULL COMMENT '序号',
  `org_id` varchar(64) DEFAULT NULL COMMENT '党政通ID',
  `user_name` varchar(30) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for particle_config
-- ----------------------------
DROP TABLE IF EXISTS `particle_config`;
CREATE TABLE `particle_config` (
  `config_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '配置主键',
  `config_name` varchar(50) NOT NULL COMMENT '配置名称',
  `config_params` varchar(2000) DEFAULT '1' COMMENT '参数',
  `request_path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `status` char(1) DEFAULT '0' COMMENT '启用状态（0正常 1停用）',
  `table_id` varchar(10) DEFAULT NULL COMMENT '业务表ID',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  `del_flag` varchar(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='颗粒配置表';

-- ----------------------------
-- Records of particle_config
-- ----------------------------
BEGIN;
INSERT INTO `particle_config` VALUES (1, '治超站点', '1', 'zc', '0', 'd_zcb', 'admin', '2021-04-29 17:30:23', 'admin', '2021-04-29 17:30:26', '', '0');
INSERT INTO `particle_config` VALUES (2, '测试2', '1', '', '0', NULL, '', '2021-04-29 23:18:06', '', NULL, '', NULL);
INSERT INTO `particle_config` VALUES (3, '测试2', '1', '', '0', NULL, '', '2021-04-29 23:23:20', '', NULL, '', '0');
COMMIT;

-- ----------------------------
-- Table structure for particle_table
-- ----------------------------
DROP TABLE IF EXISTS `particle_table`;
CREATE TABLE `particle_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) DEFAULT '' COMMENT '表描述',
  `role_id` bigint(11) DEFAULT NULL COMMENT '角色ID',
  `class_name` varchar(100) DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) DEFAULT '{}' COMMENT '其它生成选项',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `particle_status` varchar(1) DEFAULT '0' COMMENT '颗粒注册状态（0-未注册  1-已注册）',
  `request_path` varchar(500) DEFAULT NULL COMMENT '请求路径',
  `del_flag` varchar(1) DEFAULT '0' COMMENT '删除标志（0代表存在 1代表删除）',
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 COMMENT='数据清单表';

-- ----------------------------
-- Records of particle_table
-- ----------------------------
BEGIN;
INSERT INTO `particle_table` VALUES (57, 'demo_vitae', '简历信息表', 1, 'DemoVitae', 'crud', 'com.itssky.modules.demo', 'demo', 'vitae', '简历信息', 'itssky', '0', '/', '{}', 'admin', '2021-04-16 15:46:30', '', '2021-04-23 14:07:29', NULL, '1', 'com.itssky.modules.demo.demo.vitae', '0');
INSERT INTO `particle_table` VALUES (58, 'demo_vitae', '简历信息表', 2, 'DemoVitae', 'crud', 'com.itssky.modules.system', 'system', 'vitae', '简历信息', 'itssky', '0', '/', '{}', 'admin', '2021-04-16 15:46:30', '', '2021-04-23 14:07:29', NULL, '1', 'com.itssky.modules.demo.demo.vitae', '0');
INSERT INTO `particle_table` VALUES (59, 'particle_config', '颗粒配置表', 2, 'ParticleConfig', 'crud', 'com.itssky.modules.system', 'system', 'config', '颗粒配置', 'itssky', '0', '/', '{}', 'admin', '2021-04-29 16:38:49', '', '2021-04-29 16:42:53', NULL, '1', 'com.itssky.modules.particle.particle.config', '0');
INSERT INTO `particle_table` VALUES (60, 'particle_config', '颗粒配置表', 1, 'ParticleConfig', 'crud', 'com.itssky.modules.particle', 'particle', 'config', '颗粒配置', 'itssky', '0', '/', '{}', 'admin', '2021-04-29 16:38:49', '', '2021-04-29 16:42:53', NULL, '1', 'com.itssky.modules.particle.particle.config', '0');
INSERT INTO `particle_table` VALUES (61, 'sys_area', '区域表', 1, 'SysArea', 'crud', 'com.itssky.modules.system', 'system', 'area', '区域', 'itssky', '0', '/', '{}', 'admin', '2021-05-04 14:40:34', '', '2021-05-04 14:42:05', NULL, '1', 'com.itssky.modules.system.system.area', '0');
COMMIT;

-- ----------------------------
-- Table structure for particle_table_column
-- ----------------------------
DROP TABLE IF EXISTS `particle_table_column`;
CREATE TABLE `particle_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) DEFAULT NULL COMMENT '是否查询字段（1是）',
  `is_detail` char(1) DEFAULT NULL COMMENT '是否详情字段（1是）',
  `query_type` varchar(200) DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `role_id` bigint(20) DEFAULT NULL COMMENT '角色ID',
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1170 DEFAULT CHARSET=utf8 COMMENT='数据清单字段表';

-- ----------------------------
-- Records of particle_table_column
-- ----------------------------
BEGIN;
INSERT INTO `particle_table_column` VALUES (1082, '57', 'vitae_id', '简历ID', 'bigint(20)', 'Long', 'vitaeId', '1', '1', NULL, '1', '1', '', NULL, NULL, 'EQ', 'input', '', 1, 'admin', NULL, '', '2021-05-03 14:28:50', 1);
INSERT INTO `particle_table_column` VALUES (1083, '57', 'dept_id', '部门111', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 2, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1084, '57', 'code', '编号', 'varchar(30)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', '1', 'EQ', 'input', '', 1, 'admin', NULL, '', '2021-05-03 14:28:50', 1);
INSERT INTO `particle_table_column` VALUES (1085, '57', 'birthday', '生日', 'datetime', 'Date', 'birthday', '0', '0', NULL, '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1086, '57', 'sort', '排序', 'varchar(255)', 'String', 'sort', '0', '0', NULL, '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 5, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1087, '57', 'name', '姓名', 'varchar(30)', 'String', 'name', '0', '0', '1', '1', '1', '1', NULL, '1', 'LIKE', 'input', '', 6, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1088, '57', 'position', '位置', 'varchar(2)', 'String', 'position', '0', '0', NULL, '1', '1', '1', NULL, '1', 'EQ', 'input', '', 7, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1089, '57', 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', NULL, '1', 'EQ', 'input', '', 8, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1090, '57', 'phone_number', '手机号码', 'varchar(11)', 'String', 'phoneNumber', '0', '0', NULL, '1', '1', '1', NULL, '1', 'EQ', 'input', '', 9, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1091, '57', 'sex', '用户性别', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'select', 'sys_user_sex', 10, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1092, '57', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 11, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1093, '57', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 12, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1094, '57', 'status', '在职状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'radio', 'on_job_status', 13, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1095, '57', 'entry_start_time', '入职开始时间', 'datetime', 'Date', 'entryStartTime', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1096, '57', 'entry_end_time', '入职结束时间', 'datetime', 'Date', 'entryEndTime', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1097, '57', 'adept_technology', '擅长技术', 'varchar(255)', 'String', 'adeptTechnology', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'input', 'software_technology', 16, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1098, '57', 'education_experience', '教育经历', 'varchar(255)', 'String', 'educationExperience', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1099, '57', 'file', '附件', 'varchar(255)', 'String', 'file', '0', '0', NULL, '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 18, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1100, '57', 'score', '评分', 'double(8,0)', 'Long', 'score', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'input', '', 19, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1101, '57', 'del_flag', '删除标志', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', '1', '', NULL, NULL, 'EQ', 'input', '', 20, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1102, '57', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 21, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1103, '57', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'datetime', '', 22, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1104, '57', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 23, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1105, '57', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 24, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1106, '57', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'textarea', '', 25, 'admin', NULL, '', '2021-05-03 14:28:51', 1);
INSERT INTO `particle_table_column` VALUES (1107, '58', 'vitae_id', '简历ID', 'bigint(20)', 'Long', 'vitaeId', '1', '1', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1108, '58', 'dept_id', '部门ID', 'bigint(20)', 'Long', 'deptId', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1109, '58', 'code', '编号', 'varchar(30)', 'String', 'code', '0', '0', '1', '1', '1', '1', '1', '1', 'EQ', 'input', '', 3, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1110, '58', 'birthday', '生日', 'datetime', 'Date', 'birthday', '0', '0', NULL, '1', '1', '1', '1', '1', 'EQ', 'datetime', '', 4, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1111, '58', 'sort', '排序', 'varchar(255)', 'String', 'sort', '0', '0', NULL, '1', '1', '1', NULL, '1', 'EQ', 'input', '', 5, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1112, '58', 'name', '姓名', 'varchar(30)', 'String', 'name', '0', '0', '1', '1', '1', '1', NULL, '1', 'LIKE', 'input', '', 6, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1113, '58', 'position', '职位', 'varchar(100)', 'String', 'position', '0', '0', NULL, '1', '1', '1', NULL, '1', 'EQ', 'input', '', 7, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1114, '58', 'email', '邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', NULL, '1', 'EQ', 'input', '', 8, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1115, '58', 'phone_number', '手机号码', 'varchar(11)', 'String', 'phoneNumber', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1116, '58', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'select', '', 10, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1117, '58', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 11, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1118, '58', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1119, '58', 'status', '在职状态（0在职 1离职）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'radio', '', 13, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1120, '58', 'entry_start_time', '入职开始时间', 'datetime', 'Date', 'entryStartTime', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 14, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1121, '58', 'entry_end_time', '入职结束时间', 'datetime', 'Date', 'entryEndTime', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 15, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1122, '58', 'adept_technology', '擅长技术', 'varchar(255)', 'String', 'adeptTechnology', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 16, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1123, '58', 'education_experience', '教育经历', 'varchar(255)', 'String', 'educationExperience', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 17, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1124, '58', 'file', '附件', 'varchar(255)', 'String', 'file', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 18, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1125, '58', 'score', '', 'double(8,0)', 'Long', 'score', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 19, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1126, '58', 'del_flag', '删除标志（0代表存在 1代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 20, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1127, '58', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 21, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1128, '58', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 22, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1129, '58', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 23, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1130, '58', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 24, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1131, '58', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'textarea', '', 25, 'admin', NULL, '', '2021-05-03 14:29:04', 2);
INSERT INTO `particle_table_column` VALUES (1132, '59', 'config_id', '配置主键', 'bigint(20)', 'Long', 'configId', '1', '1', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', NULL, '', '2021-04-29 17:29:41', 2);
INSERT INTO `particle_table_column` VALUES (1133, '59', 'config_name', '配置名称', 'varchar(50)', 'String', 'configName', '0', '0', '1', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', NULL, '', '2021-04-29 17:29:41', 2);
INSERT INTO `particle_table_column` VALUES (1134, '59', 'config_params', '参数', 'varchar(2000)', 'String', 'configParams', '0', '0', NULL, '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', NULL, '', '2021-04-29 17:29:41', 2);
INSERT INTO `particle_table_column` VALUES (1135, '59', 'request_path', '路由地址', 'varchar(200)', 'String', 'requestPath', '0', '0', NULL, '1', '1', '1', NULL, '1', 'EQ', 'input', '', 4, 'admin', NULL, '', '2021-04-29 17:29:41', 2);
INSERT INTO `particle_table_column` VALUES (1136, '59', 'status', '启用状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'radio', '', 5, 'admin', NULL, '', '2021-04-29 17:29:41', 2);
INSERT INTO `particle_table_column` VALUES (1137, '59', 'table_id', '业务表ID', 'varchar(10)', 'String', 'tableId', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', NULL, '', '2021-04-29 17:29:41', 2);
INSERT INTO `particle_table_column` VALUES (1138, '59', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', NULL, '', '2021-04-29 17:29:41', 2);
INSERT INTO `particle_table_column` VALUES (1139, '59', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', NULL, '', '2021-04-29 17:29:41', 2);
INSERT INTO `particle_table_column` VALUES (1140, '59', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', NULL, '', '2021-04-29 17:29:41', 2);
INSERT INTO `particle_table_column` VALUES (1141, '59', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', NULL, '', '2021-04-29 17:29:41', 2);
INSERT INTO `particle_table_column` VALUES (1142, '59', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'textarea', '', 11, 'admin', NULL, '', '2021-04-29 17:29:41', 2);
INSERT INTO `particle_table_column` VALUES (1143, '59', 'del_flag', '删除标志（0代表存在 1代表删除）', 'varchar(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', NULL, '', '2021-04-29 17:29:41', 2);
INSERT INTO `particle_table_column` VALUES (1144, '60', 'config_id', '配置主键', 'bigint(20)', 'Long', 'configId', '1', '1', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', NULL, '', '2021-04-29 23:08:06', 1);
INSERT INTO `particle_table_column` VALUES (1145, '60', 'config_name', '配置名称', 'varchar(50)', 'String', 'configName', '0', '0', '1', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', NULL, '', '2021-04-29 23:08:06', 1);
INSERT INTO `particle_table_column` VALUES (1146, '60', 'config_params', '参数', 'varchar(2000)', 'String', 'configParams', '0', '0', NULL, '1', '1', '1', '1', '1', 'EQ', 'textarea', '', 3, 'admin', NULL, '', '2021-04-29 23:08:06', 1);
INSERT INTO `particle_table_column` VALUES (1147, '60', 'request_path', '路由地址', 'varchar(200)', 'String', 'requestPath', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 4, 'admin', NULL, '', '2021-04-29 23:08:06', 1);
INSERT INTO `particle_table_column` VALUES (1148, '60', 'status', '启用状态', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'radio', '', 5, 'admin', NULL, '', '2021-04-29 23:08:06', 1);
INSERT INTO `particle_table_column` VALUES (1149, '60', 'table_id', '业务表ID', 'varchar(10)', 'String', 'tableId', '0', '0', NULL, '1', '1', '1', '1', NULL, 'EQ', 'input', '', 6, 'admin', NULL, '', '2021-04-29 23:08:06', 1);
INSERT INTO `particle_table_column` VALUES (1150, '60', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 7, 'admin', NULL, '', '2021-04-29 23:08:06', 1);
INSERT INTO `particle_table_column` VALUES (1151, '60', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'datetime', '', 8, 'admin', NULL, '', '2021-04-29 23:08:06', 1);
INSERT INTO `particle_table_column` VALUES (1152, '60', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 9, 'admin', NULL, '', '2021-04-29 23:08:06', 1);
INSERT INTO `particle_table_column` VALUES (1153, '60', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 10, 'admin', NULL, '', '2021-04-29 23:08:06', 1);
INSERT INTO `particle_table_column` VALUES (1154, '60', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, NULL, 'EQ', 'textarea', '', 11, 'admin', NULL, '', '2021-04-29 23:08:06', 1);
INSERT INTO `particle_table_column` VALUES (1155, '60', 'del_flag', '删除标志（0代表存在 1代表删除）', 'varchar(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 12, 'admin', NULL, '', '2021-04-29 23:08:06', 1);
INSERT INTO `particle_table_column` VALUES (1156, '61', 'ID', '主键', 'varchar(64)', 'String', 'id', '1', '0', NULL, '1', NULL, NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', NULL, '', '2021-05-04 19:03:51', 1);
INSERT INTO `particle_table_column` VALUES (1157, '61', 'PARENT_ID', '父ID', 'varchar(64)', 'String', 'parentId', '0', '0', '1', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 2, 'admin', NULL, '', '2021-05-04 19:03:51', 1);
INSERT INTO `particle_table_column` VALUES (1158, '61', 'PARENT_IDS', '父IDS', 'text', 'String', 'parentIds', '0', '0', '1', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 3, 'admin', NULL, '', '2021-05-04 19:03:51', 1);
INSERT INTO `particle_table_column` VALUES (1159, '61', 'NAME', '区域名称', 'varchar(100)', 'String', 'name', '0', '0', '1', '1', '1', '1', NULL, '1', 'LIKE', 'input', '', 4, 'admin', NULL, '', '2021-05-04 19:03:51', 1);
INSERT INTO `particle_table_column` VALUES (1160, '61', 'SORT', '排序', 'decimal(10,0)', 'Long', 'sort', '0', '0', '1', '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 5, 'admin', NULL, '', '2021-05-04 19:03:51', 1);
INSERT INTO `particle_table_column` VALUES (1161, '61', 'PARENT_CODE', '父编号', 'varchar(100)', 'String', 'parentCode', '0', '0', NULL, '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 6, 'admin', NULL, '', '2021-05-04 19:03:51', 1);
INSERT INTO `particle_table_column` VALUES (1162, '61', 'CODE', '编号', 'varchar(100)', 'String', 'code', '0', '0', NULL, '1', '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', NULL, '', '2021-05-04 19:03:51', 1);
INSERT INTO `particle_table_column` VALUES (1163, '61', 'TYPE', '类型', 'char(1)', 'String', 'type', '0', '0', NULL, '1', '1', NULL, '1', '1', 'EQ', 'select', '', 8, 'admin', NULL, '', '2021-05-04 19:03:51', 1);
INSERT INTO `particle_table_column` VALUES (1164, '61', 'CREATE_BY', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 9, 'admin', NULL, '', '2021-05-04 19:03:51', 1);
INSERT INTO `particle_table_column` VALUES (1165, '61', 'CREATE_DATE', '创建时间', 'datetime', 'Date', 'createDate', '0', '0', '1', '1', '1', '1', NULL, '1', 'EQ', 'datetime', '', 10, 'admin', NULL, '', '2021-05-04 19:03:51', 1);
INSERT INTO `particle_table_column` VALUES (1166, '61', 'UPDATE_BY', '修改者', 'varchar(64)', 'String', 'updateBy', '0', '0', '1', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 11, 'admin', NULL, '', '2021-05-04 19:03:51', 1);
INSERT INTO `particle_table_column` VALUES (1167, '61', 'UPDATE_DATE', '修改时间', 'datetime', 'Date', 'updateDate', '0', '0', '1', '1', '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 12, 'admin', NULL, '', '2021-05-04 19:03:51', 1);
INSERT INTO `particle_table_column` VALUES (1168, '61', 'REMARKS', '备注', 'varchar(255)', 'String', 'remarks', '0', '0', NULL, '1', '1', NULL, NULL, '1', 'EQ', 'input', '', 13, 'admin', NULL, '', '2021-05-04 19:03:51', 1);
INSERT INTO `particle_table_column` VALUES (1169, '61', 'DEL_FLAG', '删除标识', 'char(1)', 'String', 'delFlag', '0', '0', '1', '1', '1', NULL, NULL, NULL, 'EQ', 'input', '', 14, 'admin', NULL, '', '2021-05-04 19:03:51', 1);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='以Blob 类型存储的触发器';

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存放日历信息， quartz可配置一个日历来指定一个时间范围。';

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存放cron类型的触发器。 ';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_cron_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME2', 'DEFAULT', '0/15 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME3', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存放已触发的触发器。 ';

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储每一个已配置的 Job 的详细信息 ';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_job_details` VALUES ('Scheduler', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 'com.itssky.modules.job.utils.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720024636F6D2E697473736B792E6D6F64756C65732E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720034636F6D2E697473736B792E6D6F64756C65732E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E74697479000000000000000102000E4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00095B00096461746552616E67657400135B4C6A6176612F6C616E672F537472696E673B4C000864656C46696C657371007E00034C000764656C466C616771007E00094C0007656E6454696D6571007E00094C000866696C654C69737471007E00034C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001726DB6DC4078707070740001307070707400007070707400013174000E302F3130202A202A202A202A203F74000D7461736B2E6E6F506172616D7374000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000001740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('Scheduler', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 'com.itssky.modules.job.utils.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720024636F6D2E697473736B792E6D6F64756C65732E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720034636F6D2E697473736B792E6D6F64756C65732E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E74697479000000000000000102000E4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00095B00096461746552616E67657400135B4C6A6176612F6C616E672F537472696E673B4C000864656C46696C657371007E00034C000764656C466C616771007E00094C0007656E6454696D6571007E00094C000866696C654C69737471007E00034C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001726DB6DC4078707070740001307070707400007070707400013174000E302F3135202A202A202A202A203F7400157461736B2E706172616D732827697473736B79272974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000002740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC8974000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('Scheduler', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 'com.itssky.modules.job.utils.QuartzDisallowConcurrentExecution', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000F5441534B5F50524F5045525449455373720024636F6D2E697473736B792E6D6F64756C65732E6A6F622E646F6D61696E2E5379734A6F6200000000000000010200084C000A636F6E63757272656E747400124C6A6176612F6C616E672F537472696E673B4C000E63726F6E45787072657373696F6E71007E00094C000C696E766F6B6554617267657471007E00094C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720034636F6D2E697473736B792E6D6F64756C65732E636F6D6D6F6E2E636F72652E7765622E646F6D61696E2E42617365456E74697479000000000000000102000E4C0009626567696E54696D6571007E00094C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C00096461746153636F706571007E00095B00096461746552616E67657400135B4C6A6176612F6C616E672F537472696E673B4C000864656C46696C657371007E00034C000764656C466C616771007E00094C0007656E6454696D6571007E00094C000866696C654C69737471007E00034C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C78707074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001726DB6DC4078707070740001307070707400007070707400013174000E302F3230202A202A202A202A203F7400387461736B2E6D756C7469706C65506172616D732827697473736B79272C20747275652C20323030304C2C203331362E3530442C203130302974000744454641554C547372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B02000078700000000000000003740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E5A49AE58F82EFBC8974000133740001317800);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储程序的悲观锁的信息(假如使用了悲观锁) ';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_locks` VALUES ('Scheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('Scheduler', 'TRIGGER_ACCESS');
COMMIT;

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储已暂停的 Trigger 组的信息';

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调度器状态，存储少量的有关 Scheduler 的状态信息，和别的 Scheduler实例(假如是用于一个集群中) \r\n';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_scheduler_state` VALUES ('Scheduler', 'Lang.local1620175392866', 1620175441241, 15000);
COMMIT;

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储简单的Trigger，包括重复次数，间隔，以及已触的次数 ';

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='存储CalendarIntervalTrigger和DailyTimeIntervalTrigger两种类型的触发器';

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='触发器的基本信息（存储已配置的 Trigger 的信息 ）';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
BEGIN;
INSERT INTO `qrtz_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME1', 'DEFAULT', 'TASK_CLASS_NAME1', 'DEFAULT', NULL, 1620175400000, -1, 5, 'PAUSED', 'CRON', 1620175392000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME2', 'DEFAULT', 'TASK_CLASS_NAME2', 'DEFAULT', NULL, 1620175395000, -1, 5, 'PAUSED', 'CRON', 1620175393000, 0, NULL, 2, '');
INSERT INTO `qrtz_triggers` VALUES ('Scheduler', 'TASK_CLASS_NAME3', 'DEFAULT', 'TASK_CLASS_NAME3', 'DEFAULT', NULL, 1620175400000, -1, 5, 'PAUSED', 'CRON', 1620175393000, 0, NULL, 2, '');
COMMIT;

-- ----------------------------
-- Table structure for rrd_b_reportrt_bridge_technical
-- ----------------------------
DROP TABLE IF EXISTS `rrd_b_reportrt_bridge_technical`;
CREATE TABLE `rrd_b_reportrt_bridge_technical` (
  `ID` varchar(64) NOT NULL COMMENT '编号',
  `AREA_ID` varchar(64) DEFAULT NULL COMMENT '区域',
  `YEAR` varchar(4) DEFAULT NULL COMMENT '年',
  `ONE_NUMBER` int(8) DEFAULT NULL COMMENT '一类数量',
  `TWO_NUMBER` int(8) DEFAULT NULL COMMENT '二类数量',
  `THREE_NUMBER` int(8) DEFAULT NULL COMMENT '三类数量',
  `FOUR_NUMBER` int(8) DEFAULT NULL COMMENT '四类数量',
  `FIVE_NUMBER` int(8) DEFAULT NULL COMMENT '五类数量',
  `UNASSESSED_NUMBER` int(8) DEFAULT NULL COMMENT '五类数量',
  `TOTAL` int(8) DEFAULT NULL COMMENT '合计',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT '数据来源类型 1:ETL抽取 2:手动配置',
  `CREATE_BY` varchar(64) NOT NULL COMMENT '创建者',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) NOT NULL COMMENT '更新者',
  `UPDATE_DATE` datetime NOT NULL COMMENT '更新时间',
  `REMARKS` varchar(1000) DEFAULT NULL COMMENT '备注信息',
  `DEL_FLAG` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='桥梁等级统计年表';

-- ----------------------------
-- Records of rrd_b_reportrt_bridge_technical
-- ----------------------------
BEGIN;
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('1', '8d97711c5d8946e98e0a65b6dc7347ba', '2019', 4, 36, 5, 0, 0, 0, 45, '1', '1', '2018-07-24 11:00:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('10', '3fba47a4d6a14620959346aca63f3b90', '2019', 5, 14, 2, 0, 0, 1, 22, '1', '1', '2018-07-24 19:02:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('11', 'f55448ed17f04aff86c22a719dc8582e', '2019', 46, 208, 88, 2, 0, 6, 350, '1', '1', '2018-07-24 19:03:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('12', '1c04357c20d24dd5946e2cb25848463a', '2019', 50, 182, 28, 0, 0, 0, 260, '1', '1', '2018-07-24 19:04:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('13', '949ab6769ae74092bc03523d2df37c5a', '2019', 72, 92, 26, 8, 5, 1, 204, '1', '1', '2018-07-24 19:05:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('14', 'd2b60d97e5f24b1dabb6a0dcbbac9e22', '2019', 64, 54, 40, 1, 0, 1, 160, '1', '1', '2018-07-24 19:06:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('15', '2bb62af2bcaf425d8c5e786cfa9abfc9', '2019', 39, 101, 36, 1, 0, 0, 177, '1', '1', '2018-07-24 19:07:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('16', '74114f0e121548718eaa011d72a0296b', '2019', 14, 46, 7, 0, 0, 0, 67, '1', '1', '2018-07-24 19:08:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('17', '8d97711c5d8946e98e0a65b6dc7347ba', '2020', 5, 36, 5, 0, 0, 0, 46, '1', '1', '2018-07-24 19:01:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('18', '3fba47a4d6a14620959346aca63f3b90', '2020', 3, 17, 1, 0, 0, 0, 21, '1', '1', '2018-07-24 19:02:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('19', 'f55448ed17f04aff86c22a719dc8582e', '2020', 52, 208, 89, 0, 0, 1, 350, '1', '1', '2018-07-24 19:03:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('2', '3fba47a4d6a14620959346aca63f3b90', '2019', 5, 14, 2, 0, 0, 1, 22, '1', '1', '2018-07-24 12:02:55', '1', '2018-12-04 14:08:55', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('20', '1c04357c20d24dd5946e2cb25848463a', '2020', 47, 157, 24, 0, 0, 0, 228, '1', '1', '2018-07-24 19:04:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('21', '949ab6769ae74092bc03523d2df37c5a', '2020', 101, 73, 11, 0, 0, 0, 185, '1', '1', '2018-07-24 19:05:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('22', 'd2b60d97e5f24b1dabb6a0dcbbac9e22', '2020', 83, 62, 38, 0, 0, 0, 183, '1', '1', '2018-07-24 19:06:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('23', '2bb62af2bcaf425d8c5e786cfa9abfc9', '2020', 25, 110, 38, 2, 0, 0, 175, '1', '1', '2018-07-24 19:07:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('24', '74114f0e121548718eaa011d72a0296b', '2020', 4, 57, 6, 0, 0, 5, 72, '1', '1', '2018-07-24 19:08:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('3', 'f55448ed17f04aff86c22a719dc8582e', '2019', 46, 208, 88, 2, 0, 6, 350, '1', '1', '2018-07-24 13:02:55', '1', '2018-07-24 17:02:58', NULL, '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('4', '1c04357c20d24dd5946e2cb25848463a', '2019', 50, 182, 28, 0, 0, 0, 260, '1', '1', '2018-07-24 14:00:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('5', '949ab6769ae74092bc03523d2df37c5a', '2019', 72, 92, 26, 8, 5, 1, 204, '1', '1', '2018-07-24 15:00:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('6', 'd2b60d97e5f24b1dabb6a0dcbbac9e22', '2019', 64, 54, 40, 1, 0, 1, 160, '1', '1', '2018-07-24 16:00:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('7', '2bb62af2bcaf425d8c5e786cfa9abfc9', '2019', 39, 101, 36, 1, 0, 0, 177, '1', '1', '2018-07-24 17:00:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('8', '74114f0e121548718eaa011d72a0296b', '2019', 14, 46, 7, 0, 0, 0, 67, '1', '1', '2018-07-24 18:00:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_technical` VALUES ('9', '8d97711c5d8946e98e0a65b6dc7347ba', '2019', 4, 36, 5, 0, 0, 0, 45, '1', '1', '2018-07-24 19:01:17', '1', '2018-07-24 17:00:42', '', '0');
COMMIT;

-- ----------------------------
-- Table structure for rrd_b_reportrt_bridge_type
-- ----------------------------
DROP TABLE IF EXISTS `rrd_b_reportrt_bridge_type`;
CREATE TABLE `rrd_b_reportrt_bridge_type` (
  `ID` varchar(64) NOT NULL COMMENT '编号',
  `AREA_ID` varchar(64) DEFAULT NULL COMMENT '区域',
  `YEAR` varchar(4) DEFAULT NULL COMMENT '年',
  `BIG_NUMBER` int(8) DEFAULT NULL COMMENT '大桥数量',
  `MIDDLE_NUMBER` int(8) DEFAULT NULL COMMENT '中桥数量',
  `SMALL_NUMBER` int(8) DEFAULT NULL COMMENT '小桥数量',
  `TOTAL` int(8) DEFAULT NULL COMMENT '合计',
  `SOURCE` varchar(64) DEFAULT NULL COMMENT '数据来源类型 1:ETL抽取 2:手动配置',
  `CREATE_BY` varchar(64) NOT NULL COMMENT '创建者',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) NOT NULL COMMENT '更新者',
  `UPDATE_DATE` datetime NOT NULL COMMENT '更新时间',
  `REMARKS` varchar(1000) DEFAULT NULL COMMENT '备注信息',
  `DEL_FLAG` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='桥梁等级统计年表';

-- ----------------------------
-- Records of rrd_b_reportrt_bridge_type
-- ----------------------------
BEGIN;
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('1', '8d97711c5d8946e98e0a65b6dc7347ba', '2019', 1, 20, 24, 45, '1', '1', '2018-07-24 11:00:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('10', '3fba47a4d6a14620959346aca63f3b90', '2019', 8, 9, 5, 22, '1', '1', '2018-07-24 19:02:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('11', 'f55448ed17f04aff86c22a719dc8582e', '2019', 23, 93, 234, 350, '1', '1', '2018-07-24 19:03:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('12', '1c04357c20d24dd5946e2cb25848463a', '2019', 6, 39, 215, 260, '1', '1', '2018-07-24 19:04:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('13', '949ab6769ae74092bc03523d2df37c5a', '2019', 4, 82, 118, 204, '1', '1', '2018-07-24 19:05:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('14', 'd2b60d97e5f24b1dabb6a0dcbbac9e22', '2019', 9, 39, 112, 160, '1', '1', '2018-07-24 19:06:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('15', '2bb62af2bcaf425d8c5e786cfa9abfc9', '2019', 9, 16, 152, 177, '1', '1', '2018-07-24 19:07:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('16', '74114f0e121548718eaa011d72a0296b', '2019', 7, 15, 45, 67, '1', '1', '2018-07-24 19:08:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('17', '8d97711c5d8946e98e0a65b6dc7347ba', '2020', 1, 19, 26, 46, '1', '1', '2018-07-24 19:01:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('18', '3fba47a4d6a14620959346aca63f3b90', '2020', 7, 9, 5, 21, '1', '1', '2018-07-24 19:02:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('19', 'f55448ed17f04aff86c22a719dc8582e', '2020', 23, 93, 234, 350, '1', '1', '2018-07-24 19:03:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('2', '3fba47a4d6a14620959346aca63f3b90', '2019', 8, 9, 5, 22, '1', '1', '2018-07-24 12:02:55', '1', '2018-12-04 14:08:55', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('20', '1c04357c20d24dd5946e2cb25848463a', '2020', 4, 30, 194, 228, '1', '1', '2018-07-24 19:04:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('21', '949ab6769ae74092bc03523d2df37c5a', '2020', 6, 83, 96, 185, '1', '1', '2018-07-24 19:05:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('22', 'd2b60d97e5f24b1dabb6a0dcbbac9e22', '2020', 10, 52, 121, 183, '1', '1', '2018-07-24 19:06:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('23', '2bb62af2bcaf425d8c5e786cfa9abfc9', '2020', 9, 16, 150, 175, '1', '1', '2018-07-24 19:07:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('24', '74114f0e121548718eaa011d72a0296b', '2020', 7, 16, 49, 72, '1', '1', '2018-07-24 19:08:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('3', 'f55448ed17f04aff86c22a719dc8582e', '2019', 23, 93, 234, 350, '1', '1', '2018-07-24 13:02:55', '1', '2018-07-24 17:02:58', NULL, '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('4', '1c04357c20d24dd5946e2cb25848463a', '2019', 6, 39, 215, 260, '1', '1', '2018-07-24 14:00:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('5', '949ab6769ae74092bc03523d2df37c5a', '2019', 4, 82, 118, 204, '1', '1', '2018-07-24 15:00:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('6', 'd2b60d97e5f24b1dabb6a0dcbbac9e22', '2019', 9, 39, 112, 160, '1', '1', '2018-07-24 16:00:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('7', '2bb62af2bcaf425d8c5e786cfa9abfc9', '2019', 9, 16, 152, 177, '1', '1', '2018-07-24 17:00:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('8', '74114f0e121548718eaa011d72a0296b', '2019', 7, 15, 45, 67, '1', '1', '2018-07-24 18:00:17', '1', '2018-07-24 17:00:42', '', '0');
INSERT INTO `rrd_b_reportrt_bridge_type` VALUES ('9', '8d97711c5d8946e98e0a65b6dc7347ba', '2019', 1, 20, 24, 45, '1', '1', '2018-07-24 19:01:17', '1', '2018-07-24 17:00:42', '', '0');
COMMIT;

-- ----------------------------
-- Table structure for rrd_b_road_administrative
-- ----------------------------
DROP TABLE IF EXISTS `rrd_b_road_administrative`;
CREATE TABLE `rrd_b_road_administrative` (
  `ID` varchar(64) NOT NULL COMMENT 'ID',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) DEFAULT NULL COMMENT '更新者',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新时间',
  `REMARKS` varchar(2000) DEFAULT NULL COMMENT '备注',
  `DEL_FLAG` varchar(1) DEFAULT NULL COMMENT '删除标志',
  `SOURCE` varchar(1) DEFAULT NULL COMMENT '数据来源',
  `YEAR` varchar(4) DEFAULT NULL COMMENT '年份',
  `AREA_ID` varchar(64) DEFAULT NULL COMMENT '区域ID',
  `ROAD_X` double(10,3) DEFAULT NULL COMMENT '县道里程',
  `ROAD_Y` double(10,3) DEFAULT NULL COMMENT '乡道里程',
  `ROAD_C` double(10,3) DEFAULT NULL COMMENT '村道里程',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页行政等级公路里程配置表';

-- ----------------------------
-- Records of rrd_b_road_administrative
-- ----------------------------
BEGIN;
INSERT INTO `rrd_b_road_administrative` VALUES ('1c2b9307b7f54aaaaafb2f4219607c23', '1', '2019-09-25 10:04:34', '1', '2019-09-25 10:04:34', '', '0', '2', '2019', 'd2b60d97e5f24b1dabb6a0dcbbac9e22', 377.175, 674.999, 277.667);
INSERT INTO `rrd_b_road_administrative` VALUES ('1c2b9307b7f54aabacfb2f4219607e23', '1', '2019-09-25 10:04:34', '1', '2019-09-25 10:04:34', '', '0', '2', '2020', 'd2b60d97e5f24b1dabb6a0dcbbac9e22', 377.175, 693.309, 281.651);
INSERT INTO `rrd_b_road_administrative` VALUES ('26fa9d9054e3470b90f815657dbe18ab', '1', '2019-09-25 10:03:58', '1', '2019-09-25 10:03:58', '', '0', '2', '2019', '949ab6769ae74092bc03523d2df37c5a', 432.434, 1027.898, 588.336);
INSERT INTO `rrd_b_road_administrative` VALUES ('26fa9d9154e3470b30f815657dbe18ab', '1', '2019-09-25 10:03:58', '1', '2019-09-25 10:03:58', '', '0', '2', '2020', '949ab6769ae74092bc03523d2df37c5a', 442.294, 1052.547, 555.403);
INSERT INTO `rrd_b_road_administrative` VALUES ('2f516ee3b3094e88a75c2abbd356f398', '1', '2019-09-25 10:02:51', '1', '2019-09-25 10:02:51', '', '0', '2', '2019', 'f55448ed17f04aff86c22a719dc8582e', 451.976, 977.668, 491.419);
INSERT INTO `rrd_b_road_administrative` VALUES ('2f516ee3b3094e88a75h2abbd356e398', '1', '2019-09-25 10:02:51', '1', '2019-09-25 10:02:51', '', '0', '2', '2020', 'f55448ed17f04aff86c22a719dc8582e', 454.861, 906.734, 633.409);
INSERT INTO `rrd_b_road_administrative` VALUES ('4ef38a9c7c2d4c23b8c8dd71619fc03f', '1', '2019-09-25 10:01:19', '1', '2019-09-25 10:01:19', '', '0', '2', '2019', '8d97711c5d8946e98e0a65b6dc7347ba', 92.665, 170.555, 131.476);
INSERT INTO `rrd_b_road_administrative` VALUES ('4ef38a9c7c2d4c78b8c8dd71619fc03f', '1', '2019-09-25 10:01:19', '1', '2019-09-25 10:01:19', '', '0', '2', '2020', '8d97711c5d8946e98e0a65b6dc7347ba', 92.665, 166.027, 133.384);
INSERT INTO `rrd_b_road_administrative` VALUES ('9b2e59e1b54b4f4081ce03fb4036949e', '1', '2019-09-25 10:05:04', '1', '2019-09-25 10:05:04', '', '0', '2', '2019', '2bb62af2bcaf425d8c5e786cfa9abfc9', 197.481, 843.800, 403.022);
INSERT INTO `rrd_b_road_administrative` VALUES ('9b2e59f1b54b4f4081cf03fb4036849e', '1', '2019-09-25 10:05:04', '1', '2019-09-25 10:05:04', '', '0', '2', '2020', '2bb62af2bcaf425d8c5e786cfa9abfc9', 197.481, 842.127, 422.317);
INSERT INTO `rrd_b_road_administrative` VALUES ('a2c8f851bef74fb39fe59b190114feb2', '1', '2019-09-25 10:05:45', '1', '2019-09-25 10:05:45', '', '0', '2', '2020', '74114f0e121548718eaa011d72a0296b', 133.818, 138.949, 59.531);
INSERT INTO `rrd_b_road_administrative` VALUES ('a2c8f871bff74fb39fd59c190114feb2', '1', '2019-09-25 10:05:45', '1', '2019-09-25 10:05:45', '', '0', '2', '2019', '74114f0e121548718eaa011d72a0296b', 137.806, 229.193, 76.212);
INSERT INTO `rrd_b_road_administrative` VALUES ('f8fce002eba84d47bdee8be1654bacc7', '1', '2019-09-25 10:02:01', '1', '2019-09-25 10:02:01', '', '0', '2', '2019', '3fba47a4d6a14620959346aca63f3b90', 58.271, 65.897, 19.064);
INSERT INTO `rrd_b_road_administrative` VALUES ('f8fce002eba84d47bdyn8be1654bacc7', '1', '2019-09-25 10:02:01', '1', '2019-09-25 10:02:01', '', '0', '2', '2020', '3fba47a4d6a14620959346aca63f3b90', 57.755, 65.897, 19.064);
INSERT INTO `rrd_b_road_administrative` VALUES ('fca3dc1153e342e6600d70f0a2fa2cd8', '1', '2019-09-25 10:03:23', '1', '2019-09-25 10:03:23', '', '0', '2', '2020', '1c04357c20d24dd5946e2cb25848463a', 228.419, 395.724, 261.975);
INSERT INTO `rrd_b_road_administrative` VALUES ('fca3dc1153e342e6900c70f0a2fa2cd8', '1', '2019-09-25 10:03:23', '1', '2019-09-25 10:03:23', '', '0', '2', '2019', '1c04357c20d24dd5946e2cb25848463a', 228.419, 547.783, 571.764);
COMMIT;

-- ----------------------------
-- Table structure for rrd_b_road_technical
-- ----------------------------
DROP TABLE IF EXISTS `rrd_b_road_technical`;
CREATE TABLE `rrd_b_road_technical` (
  `ID` varchar(64) NOT NULL COMMENT 'ID',
  `CREATE_BY` varchar(64) DEFAULT NULL COMMENT '创建者',
  `CREATE_DATE` datetime DEFAULT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) DEFAULT NULL COMMENT '更新者',
  `UPDATE_DATE` datetime DEFAULT NULL COMMENT '更新时间',
  `REMARKS` varchar(2000) DEFAULT NULL COMMENT '备注',
  `DEL_FLAG` varchar(1) DEFAULT NULL COMMENT '删除标志',
  `SOURCE` varchar(1) DEFAULT NULL COMMENT '数据来源',
  `YEAR` varchar(4) DEFAULT NULL COMMENT '年份',
  `AREA_ID` varchar(64) DEFAULT NULL COMMENT '区域ID',
  `LEVEL_ONE` double(10,3) DEFAULT NULL COMMENT ' 一级公路',
  `LEVEL_TWO` double(10,3) DEFAULT NULL COMMENT '二级公路',
  `LEVEL_THREE` double(10,3) DEFAULT NULL COMMENT '三级公路',
  `LEVEL_FOUR` double(10,3) DEFAULT NULL COMMENT '四级公路',
  `LEVEL_OUT` double(10,3) DEFAULT NULL COMMENT '等外',
  `HIGH_SPEED` double(10,3) DEFAULT '0.000' COMMENT '高速',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='首页道路技术等级里程配置表';

-- ----------------------------
-- Records of rrd_b_road_technical
-- ----------------------------
BEGIN;
INSERT INTO `rrd_b_road_technical` VALUES ('1adf6ef5fb014c22941e0771c4bf5d5d', '1', '2019-09-25 17:00:25', '1', '2019-09-25 17:00:25', '', '0', '2', '2019', '949ab6769ae74092bc03523d2df37c5a', 37.597, 127.045, 578.515, 1246.344, 55.666, 3.501);
INSERT INTO `rrd_b_road_technical` VALUES ('1ahf6ef5fb012c22941o0781c4bf2d5d', '1', '2019-09-25 17:00:25', '1', '2019-09-25 17:00:25', '', '0', '2', '2020', '949ab6769ae74092bc03523d2df37c5a', 46.316, 134.776, 592.007, 1273.644, 0.000, 3.501);
INSERT INTO `rrd_b_road_technical` VALUES ('60c1259841e24bth8e31239a7l72758a', '1', '2019-09-25 16:59:28', '1', '2019-09-25 16:59:28', '', '0', '2', '2020', '1c04357c20d24dd5946e2cb25848463a', 24.937, 100.311, 164.994, 595.876, 0.000, 0.000);
INSERT INTO `rrd_b_road_technical` VALUES ('60c1359841e24bca8e32259a7e72758a', '1', '2019-09-25 16:59:28', '1', '2019-09-25 16:59:28', '', '0', '2', '2019', '1c04357c20d24dd5946e2cb25848463a', 60.045, 137.856, 187.290, 962.775, 0.000, 0.000);
INSERT INTO `rrd_b_road_technical` VALUES ('650f22494b8r43fub24e403c1156636c', '1', '2019-09-25 17:01:12', '1', '2019-09-25 17:01:12', '', '0', '2', '2020', 'd2b60d97e5f24b1dabb6a0dcbbac9e22', 92.203, 184.716, 285.228, 789.988, 0.000, 0.000);
INSERT INTO `rrd_b_road_technical` VALUES ('650f96494b8a44fab14e403c1856636c', '1', '2019-09-25 17:01:12', '1', '2019-09-25 17:01:12', '', '0', '2', '2019', 'd2b60d97e5f24b1dabb6a0dcbbac9e22', 92.203, 184.833, 289.123, 763.682, 0.000, 0.000);
INSERT INTO `rrd_b_road_technical` VALUES ('ba920378d6f14e41833j691812595d9e', '1', '2019-09-25 17:05:22', '1', '2019-09-25 17:05:22', '', '0', '2', '2020', '2bb62af2bcaf425d8c5e786cfa9abfc9', 48.298, 152.213, 168.777, 1092.637, 0.000, 0.000);
INSERT INTO `rrd_b_road_technical` VALUES ('ba920378d6f14e41893d891812295d9e', '1', '2019-09-25 17:05:22', '1', '2019-09-25 17:05:22', '', '0', '2', '2019', '2bb62af2bcaf425d8c5e786cfa9abfc9', 48.298, 154.853, 188.933, 1052.219, 0.000, 0.000);
INSERT INTO `rrd_b_road_technical` VALUES ('c47fec629c2647cf8023e006d79034d5', '1', '2019-09-25 16:58:29', '1', '2019-09-25 16:58:29', '', '0', '2', '2019', 'f55448ed17f04aff86c22a719dc8582e', 250.891, 93.614, 358.887, 1217.671, 0.000, 0.000);
INSERT INTO `rrd_b_road_technical` VALUES ('c47fhc629c2647ce8023e006d73034d5', '1', '2019-09-25 16:58:29', '1', '2019-09-25 16:58:29', '', '0', '2', '2020', 'f55448ed17f04aff86c22a719dc8582e', 247.271, 87.588, 394.049, 1266.096, 0.000, 0.000);
INSERT INTO `rrd_b_road_technical` VALUES ('dc0337ee146b40f6bgf90ocef5v2b0a9', '1', '2019-09-25 17:06:31', '1', '2019-09-25 17:06:31', '', '0', '2', '2020', '74114f0e121548718eaa011d72a0296b', 92.520, 27.560, 9.583, 202.635, 0.000, 0.000);
INSERT INTO `rrd_b_road_technical` VALUES ('dc0338ec146b40f6bbf90fcef5b2b0a9', '1', '2019-09-25 17:06:31', '1', '2019-09-25 17:06:31', '', '0', '2', '2019', '74114f0e121548718eaa011d72a0296b', 98.169, 82.502, 21.730, 235.514, 5.296, 0.000);
INSERT INTO `rrd_b_road_technical` VALUES ('fa8af1caccee485687f5e83189981af2', '1', '2019-09-25 16:57:25', '1', '2019-09-25 16:57:25', '', '0', '2', '2019', '3fba47a4d6a14620959346aca63f3b90', 43.173, 36.712, 23.286, 40.061, 0.000, 0.000);
INSERT INTO `rrd_b_road_technical` VALUES ('fa8af1cadcee485627f5e83189481af2', '1', '2019-09-25 16:57:25', '1', '2019-09-25 16:57:25', '', '0', '2', '2020', '3fba47a4d6a14620959346aca63f3b90', 42.657, 36.712, 23.286, 40.061, 0.000, 0.000);
INSERT INTO `rrd_b_road_technical` VALUES ('fdb3f06562ce48bba9df55beb4a9a610', '1', '2019-09-25 16:56:29', '1', '2019-09-25 16:56:29', '', '0', '2', '2019', '8d97711c5d8946e98e0a65b6dc7347ba', 21.096, 30.129, 59.018, 284.453, 0.000, 0.000);
INSERT INTO `rrd_b_road_technical` VALUES ('fdb3f16562ce48bba9df45geb4a9a610', '1', '2019-09-25 16:56:29', '1', '2019-09-25 16:56:29', '', '0', '2', '2020', '8d97711c5d8946e98e0a65b6dc7347ba', 21.096, 38.526, 51.348, 281.106, 0.000, 0.000);
COMMIT;

-- ----------------------------
-- Table structure for sys_area
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `ID` varchar(64) NOT NULL COMMENT '主键',
  `PARENT_ID` varchar(64) NOT NULL COMMENT '父ID',
  `PARENT_IDS` text NOT NULL COMMENT '父IDS',
  `NAME` varchar(100) NOT NULL COMMENT '名称',
  `SORT` decimal(10,0) NOT NULL COMMENT '排序',
  `PARENT_CODE` varchar(100) DEFAULT NULL COMMENT '父编号',
  `CODE` varchar(100) DEFAULT NULL COMMENT '编号',
  `TYPE` char(1) DEFAULT NULL COMMENT '类型',
  `CREATE_BY` varchar(64) NOT NULL COMMENT '创建者',
  `CREATE_DATE` datetime NOT NULL COMMENT '创建时间',
  `UPDATE_BY` varchar(64) NOT NULL COMMENT '修改者',
  `UPDATE_DATE` datetime NOT NULL COMMENT '修改时间',
  `REMARKS` varchar(255) DEFAULT NULL COMMENT '备注',
  `DEL_FLAG` char(1) NOT NULL DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`ID`),
  KEY `SYS_AREA_DEL_FLAG` (`DEL_FLAG`) USING BTREE,
  KEY `SYS_AREA_PARENT_ID` (`PARENT_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
BEGIN;
INSERT INTO `sys_area` VALUES ('0a0706d63fb5439e8dba26def362ba87', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '江宁区', 110, '3201', '320115', '4', '1', '2017-02-21 00:00:00', '1', '2017-02-21 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('0a3fa02e85b349869f68f7d3417a56e9', '1bd1d43b423145a5a0ef79eb00a3326a', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,', '宿迁市', 130, '320000', '3213', '3', '1', '2017-02-21 00:00:00', '1', '2017-02-21 00:00:00', '', '0');
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', 10, '32', '100000', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '0');
INSERT INTO `sys_area` VALUES ('12313b44342f4b24ba767ce63ab23940', '1bd1d43b423145a5a0ef79eb00a3326a', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,', '淮安市', 80, '320000', '3208', '3', '1', '2017-02-21 14:31:39', '1', '2017-02-21 14:31:39', '', '0');
INSERT INTO `sys_area` VALUES ('18877a5a2c70414fbe38e9c4063f9e99', '1bd1d43b423145a5a0ef79eb00a3326a', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,', '南京市', 10, '320000', '3201', '3', '1', '2017-02-06 17:19:44', '1', '2017-02-06 17:19:44', '', '0');
INSERT INTO `sys_area` VALUES ('1aabb47d81da4b1b8afe6979de9ea8ec', 'bbad6425049042a0b5deaa4744f28308', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,bbad6425049042a0b5deaa4744f28308,', '南长区', 30, '3202', '320203', '4', '1', '2017-02-06 17:24:05', '1', '2017-02-06 17:24:05', '', '0');
INSERT INTO `sys_area` VALUES ('1ba0974b7dfc4eb2beb925fe2bef0584', 'bbad6425049042a0b5deaa4744f28308', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,bbad6425049042a0b5deaa4744f28308,', '惠山区', 30, '3202', '320206', '4', '1', '2017-02-21 11:00:42', '1', '2017-02-21 13:22:12', '', '0');
INSERT INTO `sys_area` VALUES ('1bd1d43b423145a5a0ef79eb00a3326a', '1', '0,1,', '江苏省', 30, '32', '320000', '2', '1', '2017-02-06 17:12:10', '1', '2017-02-06 17:16:37', '', '0');
INSERT INTO `sys_area` VALUES ('202b2a774ab44e14b14403fcc7929da5', 'bbad6425049042a0b5deaa4744f28308', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,bbad6425049042a0b5deaa4744f28308,', '江阴市', 30, '3202', '320281', '4', '1', '2017-04-07 10:35:02', '1', '2017-04-07 10:35:02', '', '0');
INSERT INTO `sys_area` VALUES ('21f7f81e006f4d4ea384f7b84c49569f', '1bd1d43b423145a5a0ef79eb00a3326a', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,', '盐城市', 90, '320000', '3209', '3', '1', '2017-02-21 14:09:20', '1', '2017-02-21 14:09:20', '', '0');
INSERT INTO `sys_area` VALUES ('273af4033b994ab9bf7e7071aa56689f', '1bd1d43b423145a5a0ef79eb00a3326a', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,', '连云港市', 70, '320000', '3207', '3', '1', '2017-02-21 13:34:13', '1', '2017-02-21 13:34:13', '', '0');
INSERT INTO `sys_area` VALUES ('2d7a01d07f054d1580be113d80640536', 'c363b18f297645aeade77042b9ff4c57', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,c363b18f297645aeade77042b9ff4c57,', '张家港市', 30, '3205', '320582', '4', '1', '2017-02-21 13:24:10', '1', '2017-02-21 13:24:10', '', '0');
INSERT INTO `sys_area` VALUES ('30b2cef0781e43ac9eba922c5543a65e', '1bd1d43b423145a5a0ef79eb00a3326a', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,', '扬州市', 100, '320000', '3210', '3', '1', '2017-02-21 13:28:23', '1', '2017-02-21 13:28:23', '', '0');
INSERT INTO `sys_area` VALUES ('310d49baa982448586c08b2c9fadbc88', '273af4033b994ab9bf7e7071aa56689f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,273af4033b994ab9bf7e7071aa56689f,', '新浦区', 30, '3207', '320705', '4', '1', '2017-02-21 13:34:54', '1', '2017-08-23 12:57:03', '', '0');
INSERT INTO `sys_area` VALUES ('320103_jiangsu_nanjing_baixia', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '白下区', 30, '3201', '320103', '4', '1', '2020-10-17 19:14:20', '1', '2020-10-17 19:14:25', NULL, '0');
INSERT INTO `sys_area` VALUES ('320107_jiangsu_nanjing_xiaguan', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '下关区', 70, '3201', '320107', '4', '1', '2020-10-17 19:17:29', '1', '2020-10-17 19:17:34', NULL, '0');
INSERT INTO `sys_area` VALUES ('320114_jiangsu_nanjing_yuhua', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '雨花区', 100, '3201', '320114', '4', '1', '2017-02-21 14:33:51', '1', '2017-02-21 14:33:51', '', '0');
INSERT INTO `sys_area` VALUES ('320124_jiangsu_nanjing_lihsui', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '溧水县', 150, '3201', '320124', '4', '1', '2020-10-17 19:17:29', '1', '2020-10-17 19:17:34', NULL, '0');
INSERT INTO `sys_area` VALUES ('320125_jiangsu_nanjing_gaochun', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '高淳县', 160, '3201', '320125', '4', '1', '2020-10-17 19:17:29', '1', '2020-10-17 19:17:34', NULL, '0');
INSERT INTO `sys_area` VALUES ('320204_jiangsu_wuxi_beitang', 'bbad6425049042a0b5deaa4744f28308', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,bbad6425049042a0b5deaa4744f28308,', '北塘区', 30, '3202', '320204', '4', '1', '2017-04-07 10:35:02', '1', '2017-04-07 10:35:02', '', '0');
INSERT INTO `sys_area` VALUES ('320204_jiangsu_wuxi_xishan', 'bbad6425049042a0b5deaa4744f28308', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,bbad6425049042a0b5deaa4744f28308,', '锡山区', 30, '3202', '320205', '4', '1', '2017-04-07 10:35:02', '1', '2017-04-07 10:35:02', '', '0');
INSERT INTO `sys_area` VALUES ('320204_jiangsu_wuxi_yixing', 'bbad6425049042a0b5deaa4744f28308', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,bbad6425049042a0b5deaa4744f28308,', '宜兴市', 30, '3202', '320282', '4', '1', '2017-04-07 10:35:02', '1', '2017-04-07 10:35:02', '', '0');
INSERT INTO `sys_area` VALUES ('320305_jiangsu_xuzhou_fengxian', '5d17903e0c8848a9b4d2740a09bdc512', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,5d17903e0c8848a9b4d2740a09bdc512,', '丰县', 30, '3203', '320321', '4', '1', '2017-02-21 14:13:13', '1', '2017-02-21 14:13:13', '', '0');
INSERT INTO `sys_area` VALUES ('320305_jiangsu_xuzhou_jiawang', '5d17903e0c8848a9b4d2740a09bdc512', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,5d17903e0c8848a9b4d2740a09bdc512,', '贾汪区', 30, '3203', '320305', '4', '1', '2017-02-21 14:13:13', '1', '2017-02-21 14:13:13', '', '0');
INSERT INTO `sys_area` VALUES ('320305_jiangsu_xuzhou_peixian', '5d17903e0c8848a9b4d2740a09bdc512', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,5d17903e0c8848a9b4d2740a09bdc512,', '沛县', 30, '3203', '320322', '4', '1', '2017-02-21 14:13:13', '1', '2017-02-21 14:13:13', '', '0');
INSERT INTO `sys_area` VALUES ('320305_jiangsu_xuzhou_pizhou', '5d17903e0c8848a9b4d2740a09bdc512', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,5d17903e0c8848a9b4d2740a09bdc512,', '邳州市', 30, '3203', '320382', '4', '1', '2017-02-21 14:13:13', '1', '2017-02-21 14:13:13', '', '0');
INSERT INTO `sys_area` VALUES ('320305_jiangsu_xuzhou_quanshan', '5d17903e0c8848a9b4d2740a09bdc512', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,5d17903e0c8848a9b4d2740a09bdc512,', '泉山区', 30, '3203', '320311', '4', '1', '2017-02-21 14:13:13', '1', '2017-02-21 14:13:13', '', '0');
INSERT INTO `sys_area` VALUES ('320305_jiangsu_xuzhou_suining', '5d17903e0c8848a9b4d2740a09bdc512', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,5d17903e0c8848a9b4d2740a09bdc512,', '睢宁县', 30, '3203', '320324', '4', '1', '2017-02-21 14:13:13', '1', '2017-02-21 14:13:13', '', '0');
INSERT INTO `sys_area` VALUES ('320305_jiangsu_xuzhou_tongshan', '5d17903e0c8848a9b4d2740a09bdc512', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,5d17903e0c8848a9b4d2740a09bdc512,', '铜山县', 30, '3203', '320323', '4', '1', '2017-02-21 14:13:13', '1', '2017-02-21 14:13:13', '', '0');
INSERT INTO `sys_area` VALUES ('320305_jiangsu_xuzhou_xinyi', '5d17903e0c8848a9b4d2740a09bdc512', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,5d17903e0c8848a9b4d2740a09bdc512,', '新沂市', 30, '3203', '320381', '4', '1', '2017-02-21 14:13:13', '1', '2017-02-21 14:13:13', '', '0');
INSERT INTO `sys_area` VALUES ('3204_jiangsu_changzhou_jintan', 'fede762c6d0d45a08d7c9e13f025ab9e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fede762c6d0d45a08d7c9e13f025ab9e,', '金坛市', 30, '3204', '320482', '4', '1', '2017-02-21 13:14:57', '1', '2017-02-21 13:14:57', '', '0');
INSERT INTO `sys_area` VALUES ('3204_jiangsu_changzhou_liyang', 'fede762c6d0d45a08d7c9e13f025ab9e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fede762c6d0d45a08d7c9e13f025ab9e,', '溧阳市', 30, '3204', '320481', '4', '1', '2017-02-21 13:14:57', '1', '2017-02-21 13:14:57', '', '0');
INSERT INTO `sys_area` VALUES ('3204_jiangsu_changzhou_qishuyan', 'fede762c6d0d45a08d7c9e13f025ab9e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fede762c6d0d45a08d7c9e13f025ab9e,', '戚墅堰区', 30, '3204', '320405', '4', '1', '2017-02-21 13:14:57', '1', '2017-02-21 13:14:57', '', '0');
INSERT INTO `sys_area` VALUES ('3204_jiangsu_changzhou_xinbei', 'fede762c6d0d45a08d7c9e13f025ab9e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fede762c6d0d45a08d7c9e13f025ab9e,', '新北区', 30, '3204', '320411', '4', '1', '2017-02-21 13:14:57', '1', '2017-02-21 13:14:57', '', '0');
INSERT INTO `sys_area` VALUES ('320502', 'c363b18f297645aeade77042b9ff4c57', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,c363b18f297645aeade77042b9ff4c57,', '沧浪区', 30, '3205', '320502', '4', '1', '2017-02-21 11:28:20', '1', '2017-02-21 11:28:20', '', '0');
INSERT INTO `sys_area` VALUES ('320503', 'c363b18f297645aeade77042b9ff4c57', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,c363b18f297645aeade77042b9ff4c57,', '平江区', 30, '3205', '320503', '4', '1', '2017-02-21 11:28:20', '1', '2017-02-21 11:28:20', '', '0');
INSERT INTO `sys_area` VALUES ('320504', 'c363b18f297645aeade77042b9ff4c57', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,c363b18f297645aeade77042b9ff4c57,', '金阊区', 30, '3205', '320504', '4', '1', '2017-02-21 11:28:20', '1', '2017-02-21 11:28:20', '', '0');
INSERT INTO `sys_area` VALUES ('320505', 'c363b18f297645aeade77042b9ff4c57', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,c363b18f297645aeade77042b9ff4c57,', '虎丘区', 30, '3205', '320505', '4', '1', '2017-02-21 11:28:20', '1', '2017-02-21 11:28:20', '', '0');
INSERT INTO `sys_area` VALUES ('320506', 'c363b18f297645aeade77042b9ff4c57', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,c363b18f297645aeade77042b9ff4c57,', '吴中区', 30, '3205', '320506', '4', '1', '2017-02-21 11:28:20', '1', '2017-02-21 11:28:20', '', '0');
INSERT INTO `sys_area` VALUES ('320507', 'c363b18f297645aeade77042b9ff4c57', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,c363b18f297645aeade77042b9ff4c57,', '相城区', 30, '3205', '320507', '4', '1', '2017-02-21 11:28:20', '1', '2017-02-21 11:28:20', '', '0');
INSERT INTO `sys_area` VALUES ('320581', 'c363b18f297645aeade77042b9ff4c57', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,c363b18f297645aeade77042b9ff4c57,', '常熟市', 30, '3205', '320581', '4', '1', '2017-02-21 11:28:20', '1', '2017-02-21 11:28:20', '', '0');
INSERT INTO `sys_area` VALUES ('320584', 'c363b18f297645aeade77042b9ff4c57', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,c363b18f297645aeade77042b9ff4c57,', '吴江市', 30, '3205', '320584', '4', '1', '2017-02-21 11:28:20', '1', '2017-02-21 11:28:20', '', '0');
INSERT INTO `sys_area` VALUES ('320585', 'c363b18f297645aeade77042b9ff4c57', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,c363b18f297645aeade77042b9ff4c57,', '太仓市', 30, '3205', '320585', '4', '1', '2017-02-21 11:28:20', '1', '2017-02-21 11:28:20', '', '0');
INSERT INTO `sys_area` VALUES ('320602', 'fb619776f686499e89ad1222f9fcdd17', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fb619776f686499e89ad1222f9fcdd17,', '崇川区', 30, '3206', '320602', '4', '1', '2017-03-16 09:23:45', '1', '2017-03-16 09:23:45', '', '0');
INSERT INTO `sys_area` VALUES ('320621', 'fb619776f686499e89ad1222f9fcdd17', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fb619776f686499e89ad1222f9fcdd17,', '海安县', 30, '3206', '320621', '4', '1', '2017-03-16 09:23:45', '1', '2017-03-16 09:23:45', '', '0');
INSERT INTO `sys_area` VALUES ('320623', 'fb619776f686499e89ad1222f9fcdd17', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fb619776f686499e89ad1222f9fcdd17,', '如东县', 30, '3206', '320623', '4', '1', '2017-03-16 09:23:45', '1', '2017-03-16 09:23:45', '', '0');
INSERT INTO `sys_area` VALUES ('320681', 'fb619776f686499e89ad1222f9fcdd17', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fb619776f686499e89ad1222f9fcdd17,', '启东市', 30, '3206', '320681', '4', '1', '2017-03-16 09:23:45', '1', '2017-03-16 09:23:45', '', '0');
INSERT INTO `sys_area` VALUES ('320682', 'fb619776f686499e89ad1222f9fcdd17', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fb619776f686499e89ad1222f9fcdd17,', '如皋市', 30, '3206', '320682', '4', '1', '2017-03-16 09:23:45', '1', '2017-03-16 09:23:45', '', '0');
INSERT INTO `sys_area` VALUES ('320683', 'fb619776f686499e89ad1222f9fcdd17', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fb619776f686499e89ad1222f9fcdd17,', '通州市', 30, '3206', '320683', '4', '1', '2017-03-16 09:23:45', '1', '2017-03-16 09:23:45', '', '0');
INSERT INTO `sys_area` VALUES ('320684', 'fb619776f686499e89ad1222f9fcdd17', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fb619776f686499e89ad1222f9fcdd17,', '海门市', 30, '3206', '320684', '4', '1', '2017-03-16 09:23:45', '1', '2017-03-16 09:23:45', '', '0');
INSERT INTO `sys_area` VALUES ('320703', '273af4033b994ab9bf7e7071aa56689f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,273af4033b994ab9bf7e7071aa56689f,', '连云区', 30, '3207', '320703', '4', '1', '2017-02-21 13:34:54', '1', '2017-08-23 12:57:03', '', '0');
INSERT INTO `sys_area` VALUES ('320706', '273af4033b994ab9bf7e7071aa56689f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,273af4033b994ab9bf7e7071aa56689f,', '海州区', 30, '3207', '320706', '4', '1', '2017-02-21 13:34:54', '1', '2017-08-23 12:57:03', '', '0');
INSERT INTO `sys_area` VALUES ('320721', '273af4033b994ab9bf7e7071aa56689f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,273af4033b994ab9bf7e7071aa56689f,', '赣榆县', 30, '3207', '320721', '4', '1', '2017-02-21 13:34:54', '1', '2017-08-23 12:57:03', '', '0');
INSERT INTO `sys_area` VALUES ('320723', '273af4033b994ab9bf7e7071aa56689f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,273af4033b994ab9bf7e7071aa56689f,', '灌云县', 30, '3207', '320723', '4', '1', '2017-02-21 13:34:54', '1', '2017-08-23 12:57:03', '', '0');
INSERT INTO `sys_area` VALUES ('320724', '273af4033b994ab9bf7e7071aa56689f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,273af4033b994ab9bf7e7071aa56689f,', '灌南县', 30, '3207', '320724', '4', '1', '2017-02-21 13:34:54', '1', '2017-08-23 12:57:03', '', '0');
INSERT INTO `sys_area` VALUES ('320802', '12313b44342f4b24ba767ce63ab23940', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,12313b44342f4b24ba767ce63ab23940,', '清河区', 30, '3208', '320802', '4', '1', '2017-02-21 14:32:01', '1', '2017-02-22 17:18:31', '', '0');
INSERT INTO `sys_area` VALUES ('320803', '12313b44342f4b24ba767ce63ab23940', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,12313b44342f4b24ba767ce63ab23940,', '楚州区', 30, '3208', '320803', '4', '1', '2017-02-21 14:32:01', '1', '2017-02-22 17:18:31', '', '0');
INSERT INTO `sys_area` VALUES ('320811', '12313b44342f4b24ba767ce63ab23940', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,12313b44342f4b24ba767ce63ab23940,', '青浦区', 30, '3208', '320811', '4', '1', '2017-02-21 14:32:01', '1', '2017-02-22 17:18:31', '', '0');
INSERT INTO `sys_area` VALUES ('320826', '12313b44342f4b24ba767ce63ab23940', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,12313b44342f4b24ba767ce63ab23940,', '涟水县', 30, '3208', '320826', '4', '1', '2017-02-21 14:32:01', '1', '2017-02-22 17:18:31', '', '0');
INSERT INTO `sys_area` VALUES ('320829', '12313b44342f4b24ba767ce63ab23940', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,12313b44342f4b24ba767ce63ab23940,', '洪泽县', 30, '3208', '320829', '4', '1', '2017-02-21 14:32:01', '1', '2017-02-22 17:18:31', '', '0');
INSERT INTO `sys_area` VALUES ('320830', '12313b44342f4b24ba767ce63ab23940', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,12313b44342f4b24ba767ce63ab23940,', '盱眙县', 30, '3208', '320830', '4', '1', '2017-02-21 14:32:01', '1', '2017-02-22 17:18:31', '', '0');
INSERT INTO `sys_area` VALUES ('320831', '12313b44342f4b24ba767ce63ab23940', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,12313b44342f4b24ba767ce63ab23940,', '金湖县', 30, '3208', '320831', '4', '1', '2017-02-21 14:32:01', '1', '2017-02-22 17:18:31', '', '0');
INSERT INTO `sys_area` VALUES ('320921', '21f7f81e006f4d4ea384f7b84c49569f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,21f7f81e006f4d4ea384f7b84c49569f,', '响水县', 30, '3209', '320921', '4', '1', '2017-02-21 14:09:44', '1', '2017-02-21 14:09:44', '', '0');
INSERT INTO `sys_area` VALUES ('320922', '21f7f81e006f4d4ea384f7b84c49569f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,21f7f81e006f4d4ea384f7b84c49569f,', '滨海县', 30, '3209', '320922', '4', '1', '2017-02-21 14:09:44', '1', '2017-02-21 14:09:44', '', '0');
INSERT INTO `sys_area` VALUES ('320923', '21f7f81e006f4d4ea384f7b84c49569f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,21f7f81e006f4d4ea384f7b84c49569f,', '阜宁县', 30, '3209', '320923', '4', '1', '2017-02-21 14:09:44', '1', '2017-02-21 14:09:44', '', '0');
INSERT INTO `sys_area` VALUES ('320924', '21f7f81e006f4d4ea384f7b84c49569f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,21f7f81e006f4d4ea384f7b84c49569f,', '射阳县', 30, '3209', '320924', '4', '1', '2017-02-21 14:09:44', '1', '2017-02-21 14:09:44', '', '0');
INSERT INTO `sys_area` VALUES ('320925', '21f7f81e006f4d4ea384f7b84c49569f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,21f7f81e006f4d4ea384f7b84c49569f,', '建湖县', 30, '3209', '320925', '4', '1', '2017-02-21 14:09:44', '1', '2017-02-21 14:09:44', '', '0');
INSERT INTO `sys_area` VALUES ('320928', '21f7f81e006f4d4ea384f7b84c49569f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,21f7f81e006f4d4ea384f7b84c49569f,', '盐都县', 30, '3209', '320928', '4', '1', '2017-02-21 14:09:44', '1', '2017-02-21 14:09:44', '', '0');
INSERT INTO `sys_area` VALUES ('320981', '21f7f81e006f4d4ea384f7b84c49569f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,21f7f81e006f4d4ea384f7b84c49569f,', '东台市', 30, '3209', '320981', '4', '1', '2017-02-21 14:09:44', '1', '2017-02-21 14:09:44', '', '0');
INSERT INTO `sys_area` VALUES ('320982', '21f7f81e006f4d4ea384f7b84c49569f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,21f7f81e006f4d4ea384f7b84c49569f,', '大丰市', 30, '3209', '320982', '4', '1', '2017-02-21 14:09:44', '1', '2017-02-21 14:09:44', '', '0');
INSERT INTO `sys_area` VALUES ('321002', '30b2cef0781e43ac9eba922c5543a65e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,30b2cef0781e43ac9eba922c5543a65e,', '广陵区', 30, '3210', '321002', '4', '1', '2017-02-21 13:28:43', '1', '2017-02-21 13:28:43', '', '0');
INSERT INTO `sys_area` VALUES ('321003', '30b2cef0781e43ac9eba922c5543a65e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,30b2cef0781e43ac9eba922c5543a65e,', '邗江区', 30, '3210', '321003', '4', '1', '2017-02-21 13:28:43', '1', '2017-02-21 13:28:43', '', '0');
INSERT INTO `sys_area` VALUES ('321011', '30b2cef0781e43ac9eba922c5543a65e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,30b2cef0781e43ac9eba922c5543a65e,', '维扬区', 30, '3210', '321011', '4', '1', '2017-02-21 13:28:43', '1', '2017-02-21 13:28:43', '', '0');
INSERT INTO `sys_area` VALUES ('321023', '30b2cef0781e43ac9eba922c5543a65e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,30b2cef0781e43ac9eba922c5543a65e,', '宝应县', 30, '3210', '321023', '4', '1', '2017-02-21 13:28:43', '1', '2017-02-21 13:28:43', '', '0');
INSERT INTO `sys_area` VALUES ('321081', '30b2cef0781e43ac9eba922c5543a65e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,30b2cef0781e43ac9eba922c5543a65e,', '仪征市', 30, '3210', '321081', '4', '1', '2017-02-21 13:28:43', '1', '2017-02-21 13:28:43', '', '0');
INSERT INTO `sys_area` VALUES ('321084', '30b2cef0781e43ac9eba922c5543a65e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,30b2cef0781e43ac9eba922c5543a65e,', '高邮市', 30, '3210', '321084', '4', '1', '2017-02-21 13:28:43', '1', '2017-02-21 13:28:43', '', '0');
INSERT INTO `sys_area` VALUES ('321088', '30b2cef0781e43ac9eba922c5543a65e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,30b2cef0781e43ac9eba922c5543a65e,', '江都市', 30, '3210', '321088', '4', '1', '2017-02-21 13:28:43', '1', '2017-02-21 13:28:43', '', '0');
INSERT INTO `sys_area` VALUES ('321102', 'd30b82b939224c359d440656aa9621d0', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,d30b82b939224c359d440656aa9621d0,', '京口区', 30, '3211', '321102', '4', '1', '2017-02-21 13:53:50', '1', '2017-02-21 13:53:50', '', '0');
INSERT INTO `sys_area` VALUES ('321112', 'd30b82b939224c359d440656aa9621d0', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,d30b82b939224c359d440656aa9621d0,', '丹徒区', 30, '3211', '321112', '4', '1', '2017-02-21 13:53:50', '1', '2017-02-21 13:53:50', '', '0');
INSERT INTO `sys_area` VALUES ('321182', 'd30b82b939224c359d440656aa9621d0', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,d30b82b939224c359d440656aa9621d0,', '扬中市', 30, '3211', '321182', '4', '1', '2017-02-21 10:35:43', '1', '2017-02-21 10:35:43', '', '0');
INSERT INTO `sys_area` VALUES ('321202', 'a1a210b862c14c04ab0e3ad9cbbd19f9', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,a1a210b862c14c04ab0e3ad9cbbd19f9,', '海陵区', 30, '3212', '321202', '4', '1', '2017-02-21 14:07:16', '1', '2017-02-21 14:07:16', '', '0');
INSERT INTO `sys_area` VALUES ('321203', 'a1a210b862c14c04ab0e3ad9cbbd19f9', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,a1a210b862c14c04ab0e3ad9cbbd19f9,', '高港区', 30, '3212', '321203', '4', '1', '2017-02-21 14:07:16', '1', '2017-02-21 14:07:16', '', '0');
INSERT INTO `sys_area` VALUES ('321282', 'a1a210b862c14c04ab0e3ad9cbbd19f9', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,a1a210b862c14c04ab0e3ad9cbbd19f9,', '靖江市', 30, '3212', '321282', '4', '1', '2017-02-21 14:07:16', '1', '2017-02-21 14:07:16', '', '0');
INSERT INTO `sys_area` VALUES ('321302', '0a3fa02e85b349869f68f7d3417a56e9', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,0a3fa02e85b349869f68f7d3417a56e9,', '宿城区', 30, '3213', '321302', '4', '1', '2017-02-21 13:40:38', '1', '2017-02-21 13:40:38', '', '0');
INSERT INTO `sys_area` VALUES ('321322', '0a3fa02e85b349869f68f7d3417a56e9', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,0a3fa02e85b349869f68f7d3417a56e9,', '沐阳县', 30, '3213', '321322', '4', '1', '2017-02-21 13:40:38', '1', '2017-02-21 13:40:38', '', '0');
INSERT INTO `sys_area` VALUES ('321323', '0a3fa02e85b349869f68f7d3417a56e9', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,0a3fa02e85b349869f68f7d3417a56e9,', '泗阳县', 30, '3213', '321323', '4', '1', '2017-02-21 13:40:38', '1', '2017-02-21 13:40:38', '', '0');
INSERT INTO `sys_area` VALUES ('321324', '0a3fa02e85b349869f68f7d3417a56e9', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,0a3fa02e85b349869f68f7d3417a56e9,', '泗洪县', 30, '3213', '321324', '4', '1', '2017-02-21 13:40:38', '1', '2017-02-21 13:40:38', '', '0');
INSERT INTO `sys_area` VALUES ('3c90142ad95544ddb4d3b0c28d4a484e', 'a1a210b862c14c04ab0e3ad9cbbd19f9', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,a1a210b862c14c04ab0e3ad9cbbd19f9,', '姜堰区', 30, '3212', '321284', '4', '1', '2017-02-21 14:07:16', '1', '2017-02-21 14:07:16', '', '0');
INSERT INTO `sys_area` VALUES ('4', '3', '0,1,2,3,', '历城区', 40, '32', '110102', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '1');
INSERT INTO `sys_area` VALUES ('4d6e1bce0eb94e50b3a1bab4e4939aba', 'bbad6425049042a0b5deaa4744f28308', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,bbad6425049042a0b5deaa4744f28308,', '滨湖区', 30, '3202', '320211', '4', '1', '2017-02-21 10:59:48', '1', '2017-02-21 11:00:13', '', '0');
INSERT INTO `sys_area` VALUES ('5', '3', '0,1,2,3,', '历下区', 50, '32', '110104', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '1');
INSERT INTO `sys_area` VALUES ('568c2bb6011540b2bc45375150e7dd99', '0a3fa02e85b349869f68f7d3417a56e9', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,0a3fa02e85b349869f68f7d3417a56e9,', '宿豫县', 30, '3213', '321321', '4', '1', '2017-02-21 13:40:38', '1', '2017-02-21 13:40:38', '', '0');
INSERT INTO `sys_area` VALUES ('578bf8ce2d7b43a49dadc88335b27b58', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '浦口区', 80, '3201', '320111', '4', '1', '2017-02-21 14:33:22', '1', '2017-02-21 14:33:22', '', '0');
INSERT INTO `sys_area` VALUES ('5d17903e0c8848a9b4d2740a09bdc512', '1bd1d43b423145a5a0ef79eb00a3326a', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,', '徐州市', 30, '320000', '3203', '3', '1', '2017-02-06 17:24:39', '1', '2017-02-06 17:24:39', '', '0');
INSERT INTO `sys_area` VALUES ('6', '3', '0,1,2,3,', '高新区', 60, '32', '110105', '4', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', NULL, '1');
INSERT INTO `sys_area` VALUES ('6116b5f01c50492e9b87bd27cf703036', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '建邺区', 50, '3201', '320105', '4', '1', '2017-02-06 17:22:01', '1', '2017-02-06 17:22:01', '', '0');
INSERT INTO `sys_area` VALUES ('712854bca447403bb7e3dbd44389dff3', 'd30b82b939224c359d440656aa9621d0', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,d30b82b939224c359d440656aa9621d0,', '丹阳市', 30, '3211', '321181', '4', '1', '2017-02-21 10:35:43', '1', '2017-02-21 10:35:43', '', '0');
INSERT INTO `sys_area` VALUES ('769c2b6fd7a34adc9c5b012d88f1c01d', 'c363b18f297645aeade77042b9ff4c57', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,c363b18f297645aeade77042b9ff4c57,', '昆山市', 30, '3205', '320583', '4', '1', '2017-02-21 11:28:20', '1', '2017-02-21 11:28:20', '', '0');
INSERT INTO `sys_area` VALUES ('76edfcec5fca4aa4a209f765cbfb41bd', '5d17903e0c8848a9b4d2740a09bdc512', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,5d17903e0c8848a9b4d2740a09bdc512,', '鼓楼区', 30, '3203', '320302', '4', '1', '2017-02-06 17:25:17', '1', '2017-04-07 11:06:26', '', '0');
INSERT INTO `sys_area` VALUES ('87a71d7f61e84889838e7234774fb11c', 'fb619776f686499e89ad1222f9fcdd17', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fb619776f686499e89ad1222f9fcdd17,', '港闸区', 30, '3206', '320611', '4', '1', '2017-03-16 09:23:45', '1', '2017-03-16 09:23:45', '', '0');
INSERT INTO `sys_area` VALUES ('8cbb5862bb66402eb89d3761f572e78f', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '高淳区', 140, '3201', '320118', '4', '1', '2017-02-21 14:34:53', '1', '2017-02-21 14:34:53', '', '0');
INSERT INTO `sys_area` VALUES ('90b4fd09e36c485ca7a4fcd5e773b913', '21f7f81e006f4d4ea384f7b84c49569f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,21f7f81e006f4d4ea384f7b84c49569f,', '城区', 30, '3209', '320902', '4', '1', '2017-02-21 14:09:44', '1', '2017-02-21 14:09:44', '', '0');
INSERT INTO `sys_area` VALUES ('93fd3db9405843b4be6e5527c5bd31ff', 'bbad6425049042a0b5deaa4744f28308', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,bbad6425049042a0b5deaa4744f28308,', '崇安区', 30, '3202', '320202', '4', '1', '2017-02-06 17:23:37', '1', '2017-02-06 17:23:37', '', '0');
INSERT INTO `sys_area` VALUES ('9e2dc25729df4d58a08e4a51b2079a71', 'fede762c6d0d45a08d7c9e13f025ab9e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fede762c6d0d45a08d7c9e13f025ab9e,', '武进区', 30, '3204', '320412', '4', '1', '2017-02-21 13:45:32', '1', '2017-02-21 13:45:32', '', '0');
INSERT INTO `sys_area` VALUES ('a11c88d834444aa5986ac32c6685e071', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '鼓楼区', 60, '3201', '320106', '4', '1', '2017-02-21 14:33:08', '1', '2017-02-21 14:33:08', '', '0');
INSERT INTO `sys_area` VALUES ('a1a210b862c14c04ab0e3ad9cbbd19f9', '1bd1d43b423145a5a0ef79eb00a3326a', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,', '泰州市', 120, '320000', '3212', '3', '1', '2017-02-21 14:05:32', '1', '2017-02-21 14:05:32', '', '0');
INSERT INTO `sys_area` VALUES ('a29eff885e3a4d5c8232e3afb650ec03', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '玄武区', 20, '3201', '320102', '4', '1', '2017-02-06 17:21:00', '1', '2017-02-06 17:21:00', '', '0');
INSERT INTO `sys_area` VALUES ('a30a26ccc013441797669c5ee746b2bf', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '六合区', 120, '3201', '320116', '4', '1', '2017-02-21 14:34:24', '1', '2017-02-21 14:34:24', '', '0');
INSERT INTO `sys_area` VALUES ('a6717148c7ed4fbc8ccebfabe6ee4711', 'd30b82b939224c359d440656aa9621d0', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,d30b82b939224c359d440656aa9621d0,', '润州区', 30, '3211', '321111', '4', '1', '2017-02-21 13:53:50', '1', '2017-02-21 13:53:50', '', '0');
INSERT INTO `sys_area` VALUES ('a6e04c007f8940d4967f5377a37f35ac', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '秦淮区', 40, '3201', '320104', '4', '1', '2017-02-06 17:21:23', '1', '2017-02-06 17:21:23', '', '0');
INSERT INTO `sys_area` VALUES ('a984e48d50b14bc383a1cd649a653af8', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '栖霞区', 90, '3201', '320113', '4', '1', '2017-02-21 14:33:36', '1', '2017-02-21 14:33:36', '', '0');
INSERT INTO `sys_area` VALUES ('aca9d3cebe734b5cbcd7d2e959895568', 'd30b82b939224c359d440656aa9621d0', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,d30b82b939224c359d440656aa9621d0,', '句容市', 30, '3211', '321183', '4', '1', '2017-04-07 09:48:04', '1', '2017-04-07 09:48:04', '', '0');
INSERT INTO `sys_area` VALUES ('bbad6425049042a0b5deaa4744f28308', '1bd1d43b423145a5a0ef79eb00a3326a', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,', '无锡市', 20, '320000', '3202', '3', '1', '2017-02-06 17:22:53', '1', '2017-02-06 17:22:53', '', '0');
INSERT INTO `sys_area` VALUES ('bdfc93fd84de4962bb251bfabccadfdb', 'fede762c6d0d45a08d7c9e13f025ab9e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fede762c6d0d45a08d7c9e13f025ab9e,', '钟楼区', 30, '3204', '320404', '4', '1', '2017-02-21 13:14:57', '1', '2017-02-21 13:14:57', '', '0');
INSERT INTO `sys_area` VALUES ('c363b18f297645aeade77042b9ff4c57', '1bd1d43b423145a5a0ef79eb00a3326a', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,', '苏州市', 50, '320000', '3205', '3', '1', '2017-02-21 11:02:04', '1', '2017-02-21 11:02:04', '', '0');
INSERT INTO `sys_area` VALUES ('cc09b98819b940ecbbcbe25a023ec13c', '12313b44342f4b24ba767ce63ab23940', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,12313b44342f4b24ba767ce63ab23940,', '淮阴区', 30, '3208', '320804', '4', '1', '2017-02-21 14:32:01', '1', '2017-02-22 17:18:31', '', '0');
INSERT INTO `sys_area` VALUES ('d30b82b939224c359d440656aa9621d0', '1bd1d43b423145a5a0ef79eb00a3326a', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,', '镇江市', 110, '320000', '3211', '3', '1', '2017-02-21 10:35:11', '1', '2017-02-21 10:35:11', '', '0');
INSERT INTO `sys_area` VALUES ('d39b39f3bfab48c5b7acdb68707bcaca', 'a1a210b862c14c04ab0e3ad9cbbd19f9', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,a1a210b862c14c04ab0e3ad9cbbd19f9,', '兴化市', 30, '3212', '321281', '4', '1', '2017-02-21 14:11:00', '1', '2017-02-21 14:11:00', '', '0');
INSERT INTO `sys_area` VALUES ('d6eddb4966f644ca9650c88f05557a39', 'fede762c6d0d45a08d7c9e13f025ab9e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,fede762c6d0d45a08d7c9e13f025ab9e,', '天宁区', 30, '3204', '320402', '4', '1', '2017-02-21 13:26:07', '1', '2017-02-21 13:26:07', '', '0');
INSERT INTO `sys_area` VALUES ('db91289281424a23b24dc8f16e475645', '18877a5a2c70414fbe38e9c4063f9e99', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,18877a5a2c70414fbe38e9c4063f9e99,', '市辖区', 130, '3201', '320100', '4', '1', '2017-02-21 14:34:38', '1', '2017-02-21 14:34:38', '', '0');
INSERT INTO `sys_area` VALUES ('defc052593f544a0b6b95f6ef36047ee', 'a1a210b862c14c04ab0e3ad9cbbd19f9', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,a1a210b862c14c04ab0e3ad9cbbd19f9,', '泰兴市', 30, '3212', '321283', '4', '1', '2017-02-21 14:24:36', '1', '2017-02-21 14:24:36', '', '0');
INSERT INTO `sys_area` VALUES ('e748f08e35da43b9bac86c7e7ef1d209', '5d17903e0c8848a9b4d2740a09bdc512', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,5d17903e0c8848a9b4d2740a09bdc512,', '云龙区', 30, '3203', '320303', '4', '1', '2017-02-06 17:25:36', '1', '2017-02-06 17:25:36', '', '0');
INSERT INTO `sys_area` VALUES ('e8fe32475f1f45128da0ff80ed045995', '273af4033b994ab9bf7e7071aa56689f', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,273af4033b994ab9bf7e7071aa56689f,', '东海县', 30, '3207', '320722', '4', '1', '2017-02-21 14:14:10', '1', '2017-02-21 14:14:10', '', '0');
INSERT INTO `sys_area` VALUES ('e9b539ff02f6445d8ab74bb5c9909d51', '30b2cef0781e43ac9eba922c5543a65e', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,30b2cef0781e43ac9eba922c5543a65e,', '江都区', 30, '3210', '321012', '4', '1', '2017-02-21 13:28:43', '1', '2017-02-21 13:28:43', '', '0');
INSERT INTO `sys_area` VALUES ('f7602e5aad034bc4b2db5e11f15c17fc', '5d17903e0c8848a9b4d2740a09bdc512', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,5d17903e0c8848a9b4d2740a09bdc512,', '九里区', 30, '3203', '320304', '4', '1', '2017-02-21 14:13:13', '1', '2017-02-21 14:13:13', '', '0');
INSERT INTO `sys_area` VALUES ('fb619776f686499e89ad1222f9fcdd17', '1bd1d43b423145a5a0ef79eb00a3326a', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,', '南通市', 60, '320000', '3206', '3', '1', '2017-02-21 14:21:57', '1', '2017-02-21 14:21:57', '', '0');
INSERT INTO `sys_area` VALUES ('fede762c6d0d45a08d7c9e13f025ab9e', '1bd1d43b423145a5a0ef79eb00a3326a', '0,1,1bd1d43b423145a5a0ef79eb00a3326a,', '常州市', 40, '320000', '3204', '3', '1', '2017-02-21 13:14:35', '1', '2017-02-21 13:14:35', '', '0');
COMMIT;

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
BEGIN;
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2020-06-01 10:30:00', 'admin', '2020-06-15 00:34:25', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '深色主题theme-dark，浅色主题theme-light');
COMMIT;

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_code` varchar(32) DEFAULT NULL COMMENT '部门编码',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(500) DEFAULT NULL COMMENT '部门地址（新增字段）',
  `type` char(2) DEFAULT NULL COMMENT '部门类型（新增字段，备用）',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `fax` varchar(20) DEFAULT NULL COMMENT '传真',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_dept` VALUES (100, 0, '0', NULL, '张家港市', 0, 'itssky', '15888888888', 'itssky@itssky.com', NULL, NULL, '0', '0', 'admin', '2020-06-01 10:30:00', 'admin', '2021-04-09 16:38:33', NULL);
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', NULL, '政府部门', 1, 'itssky', '15888888888', 'itssky@itssky.com', NULL, '10', '0', '0', 'admin', '2020-06-01 10:30:00', 'admin', '2021-04-09 16:38:33', NULL);
INSERT INTO `sys_dept` VALUES (102, 101, '0,100,101', NULL, '交通运输局', 10, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:05:41', 'admin', '2021-04-09 16:38:33', NULL);
INSERT INTO `sys_dept` VALUES (103, 102, '0,100,101,102', NULL, '领导班子', 10, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:05:56', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (104, 102, '0,100,101,102', NULL, '主任科员副主任科员', 20, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:06:17', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (105, 102, '0,100,101,102', NULL, '综合办公室', 30, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:06:37', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (106, 102, '0,100,101,102', NULL, '组织人事科(党建科)', 40, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:06:58', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (107, 102, '0,100,101,102', NULL, '综合计划科', 50, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:07:10', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,101,102', NULL, '法制安保科', 60, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:07:21', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,101,102', NULL, '财务审计科', 70, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:07:38', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (110, 102, '0,100,101,102', NULL, '科技信息科', 90, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:08:28', 'admin', '2021-04-09 16:08:39', NULL);
INSERT INTO `sys_dept` VALUES (111, 102, '0,100,101,102', NULL, '建设管理科', 80, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:08:52', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (112, 102, '0,100,101,102', NULL, '行政监管科(市行政审批中心交通窗口)', 100, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:09:43', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (113, 102, '0,100,101,102', NULL, '宣传科', 110, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:09:55', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (114, 102, '0,100,101,102', NULL, '原港政科(大队)', 120, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:10:11', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (115, 102, '0,100,101,102', NULL, '督察科', 130, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:10:23', 'admin', '2021-04-09 16:35:09', NULL);
INSERT INTO `sys_dept` VALUES (116, 102, '0,100,101,102', NULL, '交通战备办公室', 140, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:10:38', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (117, 102, '0,100,101,102', NULL, '市纪委市监委派驻市交通运输局纪检监察组', 150, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:11:11', 'admin', '2021-04-09 16:35:38', NULL);
INSERT INTO `sys_dept` VALUES (118, 102, '0,100,101,102', NULL, '大厦管理中心', 160, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:11:27', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (119, 102, '0,100,101,102', NULL, '道路工程建设指挥部', 170, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:11:44', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (120, 102, '0,100,101,102', NULL, '港通路桥集团', 180, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:12:02', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (121, 102, '0,100,101,102', NULL, '港城汽运集团', 190, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:12:25', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (122, 102, '0,100,101,102', NULL, '金港检测站', 200, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:12:46', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (123, 102, '0,100,101,102', NULL, '下属事业单位', 210, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:13:01', 'admin', '2021-04-09 16:38:33', NULL);
INSERT INTO `sys_dept` VALUES (124, 123, '0,100,101,102,123', NULL, '铁路建设服务中心', 10, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:13:27', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (125, 123, '0,100,101,102,123', NULL, '交通工程质量监督站', 20, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:13:42', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (126, 123, '0,100,101,102,123', NULL, '邮政业发展中心', 30, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:13:59', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (127, 123, '0,100,101,102,123', NULL, '交通控股有限公司', 40, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:14:16', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (128, 127, '0,100,101,102,123,127', NULL, '经理室', 10, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:14:30', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (129, 127, '0,100,101,102,123,127', NULL, '行政管理部', 20, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:14:42', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (130, 127, '0,100,101,102,123,127', NULL, '财务审计部', 30, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:14:55', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (131, 127, '0,100,101,102,123,127', NULL, '资产管理部', 40, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:15:07', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (132, 127, '0,100,101,102,123,127', NULL, '投资发展部', 50, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:15:17', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (133, 123, '0,100,101,102,123', NULL, '公路管理处', 50, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:15:41', 'admin', '2021-04-09 16:38:33', NULL);
INSERT INTO `sys_dept` VALUES (134, 123, '0,100,101,102,123', NULL, '运输管理处', 60, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:15:56', 'admin', '2021-04-09 16:16:43', NULL);
INSERT INTO `sys_dept` VALUES (135, 123, '0,100,101,102,123', NULL, '地方海事处', 70, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:16:58', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (136, 123, '0,100,101,102,123', NULL, '航道管理处', 80, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:17:08', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (137, 123, '0,100,101,102,123', NULL, '船闸管理处', 90, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:17:22', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (138, 123, '0,100,101,102,123', NULL, '维修管理处', 100, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:17:33', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (139, 123, '0,100,101,102,123', NULL, '运政稽查大队', 110, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:17:46', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (140, 123, '0,100,101,102,123', NULL, '乡镇综合管理服务所(杨舍所)', 120, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:18:10', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (141, 123, '0,100,101,102,123', NULL, '金港中心交通管理服务所', 130, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:18:30', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (142, 123, '0,100,101,102,123', NULL, '锦丰中心交通管理服务所', 140, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:18:56', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (143, 123, '0,100,101,102,123', NULL, '乐余中心交通管理服务所', 150, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:19:16', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (144, 123, '0,100,101,102,123', NULL, '塘桥中心交通管理服务所', 160, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:19:25', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (145, 123, '0,100,101,102,123', NULL, '凤凰中心交通管理服务所', 170, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:19:36', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (146, 123, '0,100,101,102,123', NULL, '南丰交通管理服务所', 180, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:19:47', 'admin', '2021-04-09 16:37:44', NULL);
INSERT INTO `sys_dept` VALUES (147, 123, '0,100,101,102,123', NULL, '大新交通管理服务所', 190, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:19:57', 'admin', '2021-04-09 16:37:50', NULL);
INSERT INTO `sys_dept` VALUES (148, 133, '0,100,101,102,123,133', NULL, '处长室', 10, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:20:18', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (149, 133, '0,100,101,102,123,133', NULL, '办公室', 20, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:20:27', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (150, 133, '0,100,101,102,123,133', NULL, '财务审计股', 30, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:20:38', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (151, 133, '0,100,101,102,123,133', NULL, '养护工程管理股', 40, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:20:51', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (152, 133, '0,100,101,102,123,133', NULL, '农村公路管理股', 50, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:21:05', 'admin', '2021-04-09 16:38:33', NULL);
INSERT INTO `sys_dept` VALUES (153, 133, '0,100,101,102,123,133', NULL, '安全机务股', 60, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:21:20', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (154, 133, '0,100,101,102,123,133', NULL, '法制信息股', 70, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:21:34', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (155, 133, '0,100,101,102,123,133', NULL, '路政综合业务股', 80, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:22:05', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (156, 133, '0,100,101,102,123,133', NULL, '路网信息应急处置股', 90, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:22:19', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (157, 133, '0,100,101,102,123,133', NULL, '违章处理股', 100, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:22:33', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (158, 133, '0,100,101,102,123,133', NULL, '巡查中队', 110, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:22:44', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (159, 133, '0,100,101,102,123,133', NULL, '治超中队', 120, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:22:53', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (160, 134, '0,100,101,102,123,134', NULL, '处长室', 10, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:23:58', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (161, 134, '0,100,101,102,123,134', NULL, '综合办公室', 20, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:24:07', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (162, 134, '0,100,101,102,123,134', NULL, '客运管理股', 30, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:24:19', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (163, 134, '0,100,101,102,123,134', NULL, '货运管理股', 40, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:24:30', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (164, 134, '0,100,101,102,123,134', NULL, '驾培管理股', 50, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:24:41', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (165, 134, '0,100,101,102,123,134', NULL, '法制信息股', 60, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:24:52', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (166, 134, '0,100,101,102,123,134', NULL, '财务票证股', 70, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:25:06', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (167, 135, '0,100,101,102,123,135', NULL, '处长室', 10, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:25:49', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (168, 135, '0,100,101,102,123,135', NULL, '办公室', 20, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:25:58', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (169, 135, '0,100,101,102,123,135', NULL, '财务装备股', 30, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:26:11', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (170, 135, '0,100,101,102,123,135', NULL, '航行监督股', 40, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:26:26', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (171, 135, '0,100,101,102,123,135', NULL, '船检股', 50, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:26:47', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (172, 135, '0,100,101,102,123,135', NULL, '船务股', 60, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:26:57', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (173, 135, '0,100,101,102,123,135', NULL, '执法监督股', 70, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:27:07', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (174, 135, '0,100,101,102,123,135', NULL, '金港海事所', 80, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:27:20', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (175, 135, '0,100,101,102,123,135', NULL, '锦丰海事所', 90, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:27:29', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (176, 135, '0,100,101,102,123,135', NULL, '凤凰海事所', 100, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:27:41', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (177, 135, '0,100,101,102,123,135', NULL, '南丰海事所', 110, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:27:50', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (178, 136, '0,100,101,102,123,136', NULL, '处长室', 10, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:28:07', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (179, 136, '0,100,101,102,123,136', NULL, '办公室', 20, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:28:14', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (180, 136, '0,100,101,102,123,136', NULL, '财务股', 30, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:28:33', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (181, 136, '0,100,101,102,123,136', NULL, '工程股', 40, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:28:42', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (182, 136, '0,100,101,102,123,136', NULL, '航政股', 50, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:28:55', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (183, 136, '0,100,101,102,123,136', NULL, '稽查股', 60, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:29:15', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (184, 136, '0,100,101,102,123,136', NULL, '港口办', 70, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:29:29', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (185, 137, '0,100,101,102,123,137', NULL, '处长室', 10, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:29:49', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (186, 137, '0,100,101,102,123,137', NULL, '人秘股', 20, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:29:58', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (187, 137, '0,100,101,102,123,137', NULL, '运调股', 30, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:30:13', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (188, 137, '0,100,101,102,123,137', NULL, '财务股', 40, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:30:24', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (189, 137, '0,100,101,102,123,137', NULL, '工程股', 50, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:30:35', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (190, 137, '0,100,101,102,123,137', NULL, '法制安全股', 60, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:30:46', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (191, 137, '0,100,101,102,123,137', NULL, '稽查股', 70, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:30:56', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (192, 137, '0,100,101,102,123,137', NULL, '科技信息股', 80, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:31:09', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (193, 138, '0,100,101,102,123,138', NULL, '主任室', 10, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:31:26', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (194, 138, '0,100,101,102,123,138', NULL, '办公室', 20, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:31:37', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (195, 138, '0,100,101,102,123,138', NULL, '业务室', 30, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:32:27', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (196, 138, '0,100,101,102,123,138', NULL, '稽查队', 40, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:32:37', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (197, 138, '0,100,101,102,123,138', NULL, '财务室', 50, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:32:47', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (198, 138, '0,100,101,102,123,138', NULL, '车技室', 60, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:33:02', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (199, 138, '0,100,101,102,123,138', NULL, '车大夫', 70, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:33:15', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (200, 140, '0,100,101,102,123,140', NULL, '所长室', 10, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:33:41', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (201, 140, '0,100,101,102,123,140', NULL, '办公室', 20, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:33:49', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (202, 140, '0,100,101,102,123,140', NULL, '业务股', 30, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:33:58', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (203, 140, '0,100,101,102,123,140', NULL, '法制股', 40, NULL, NULL, NULL, NULL, NULL, '0', '0', 'admin', '2021-04-09 16:34:06', '', NULL, NULL);
INSERT INTO `sys_dept` VALUES (204, 110, '0,100,101,102,110', NULL, '科技信息科', 10, '陈勇', '13701563518', NULL, NULL, NULL, '0', '2', 'admin', '2021-04-13 13:51:14', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (19, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (20, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (21, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (22, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (23, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (24, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (25, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (26, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (27, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (28, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (29, 10, '治超站', '1', 'station_type', NULL, NULL, 'N', '0', 'admin', '2020-06-22 09:58:10', 'admin', '2020-06-22 09:59:09', NULL);
INSERT INTO `sys_dict_data` VALUES (30, 20, '公路站', '2', 'station_type', NULL, NULL, 'N', '0', 'admin', '2020-06-22 09:59:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (31, 30, '高速路政大队', '3', 'station_type', NULL, NULL, 'N', '0', 'admin', '2020-06-22 09:59:27', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (32, 1, '普通货运源头', '1', 'road_owner_type', NULL, NULL, 'N', '0', 'admin', '2020-10-22 14:28:44', '', NULL, '普通货运源头');
INSERT INTO `sys_dict_data` VALUES (33, 2, '重点货运源头', '2', 'road_owner_type', NULL, NULL, 'N', '0', 'admin', '2020-10-22 14:28:58', '', NULL, '重点货运源头');
INSERT INTO `sys_dict_data` VALUES (34, 1, '港口码头', '1', 'road_owner_property', NULL, NULL, 'N', '0', 'admin', '2020-10-22 14:29:18', '', NULL, '港口码头');
INSERT INTO `sys_dict_data` VALUES (35, 2, '非港口码头', '2', 'road_owner_property', NULL, NULL, 'N', '0', 'admin', '2020-10-22 14:29:39', '', NULL, '非港口码头');
INSERT INTO `sys_dict_data` VALUES (36, 0, '正常', '0', 'equipment_status', NULL, NULL, 'N', '0', 'admin', '2020-10-22 14:30:17', '', NULL, '正常');
INSERT INTO `sys_dict_data` VALUES (37, 1, ' 异常', '1', 'equipment_status', NULL, NULL, 'N', '0', 'admin', '2020-10-22 14:30:31', '', NULL, '异常');
INSERT INTO `sys_dict_data` VALUES (38, 1, '快速动态检测数据', '1', 'base_site_type', NULL, NULL, 'N', '0', 'admin', '2020-10-25 15:16:03', '', NULL, '快速动态检测数据');
INSERT INTO `sys_dict_data` VALUES (39, 2, '固定点检测数据', '2', 'base_site_type', NULL, NULL, 'N', '0', 'admin', '2020-10-25 15:16:15', '', NULL, '固定点检测数据');
INSERT INTO `sys_dict_data` VALUES (40, 3, '收费站检测数据', '3', 'base_site_type', NULL, NULL, 'N', '0', 'admin', '2020-10-25 15:16:27', '', NULL, '收费站检测数据');
INSERT INTO `sys_dict_data` VALUES (41, 4, '源头末端检测数据', '4', 'base_site_type', NULL, NULL, 'N', '0', 'admin', '2020-10-25 15:16:38', '', NULL, '源头末端检测数据');
INSERT INTO `sys_dict_data` VALUES (42, 5, '移动治超检测数据', '5', 'base_site_type', NULL, NULL, 'N', '0', 'admin', '2020-10-25 15:16:49', '', NULL, '移动治超检测数据');
INSERT INTO `sys_dict_data` VALUES (43, 10, '执法车辆', '10', 'base_car_type', NULL, NULL, 'N', '0', 'admin', '2020-10-25 15:17:21', '', NULL, '执法车辆');
INSERT INTO `sys_dict_data` VALUES (44, 1, '行政处罚决定书', '1', 'other_provinces_wslb', NULL, NULL, 'N', '0', 'admin', '2020-10-28 16:42:00', '', NULL, '行政处罚决定书');
INSERT INTO `sys_dict_data` VALUES (45, 3, '强制措施凭证', '3', 'other_provinces_wslb', NULL, NULL, 'N', '0', 'admin', '2020-10-28 16:42:11', '', NULL, '强制措施凭证');
INSERT INTO `sys_dict_data` VALUES (46, 6, '违法处理通知书', '6', 'other_provinces_wslb', NULL, NULL, 'N', '0', 'admin', '2020-10-28 16:42:22', '', NULL, '违法处理通知书');
INSERT INTO `sys_dict_data` VALUES (47, 0, '跨省抄告', '0', 'other_provinces_copy_type', NULL, NULL, 'N', '0', 'admin', '2020-10-28 16:43:13', '', NULL, '跨省抄告');
INSERT INTO `sys_dict_data` VALUES (48, 1, '省内抄告', '1', 'other_provinces_copy_type', NULL, NULL, 'N', '0', 'admin', '2020-10-28 16:43:22', '', NULL, '省内抄告');
INSERT INTO `sys_dict_data` VALUES (49, 0, '在线', '0', 'base_site_status', NULL, NULL, 'N', '0', 'admin', '2020-10-28 16:44:24', '', NULL, '在线');
INSERT INTO `sys_dict_data` VALUES (50, 1, '离线', '1', 'base_site_status', NULL, NULL, 'N', '0', 'admin', '2020-10-28 16:44:36', '', NULL, '离线');
INSERT INTO `sys_dict_data` VALUES (51, 0, '蓝色', '0', 'plate_color', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:05:21', '', NULL, '蓝色');
INSERT INTO `sys_dict_data` VALUES (52, 1, '黄色', '1', 'plate_color', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:05:45', '', NULL, '黄色');
INSERT INTO `sys_dict_data` VALUES (53, 2, '黑色', '2', 'plate_color', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:05:55', '', NULL, '黑色');
INSERT INTO `sys_dict_data` VALUES (54, 3, '白色', '3', 'plate_color', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:06:05', '', NULL, '白色');
INSERT INTO `sys_dict_data` VALUES (55, 4, '渐变绿色', '4', 'plate_color', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:06:18', '', NULL, '渐变绿色');
INSERT INTO `sys_dict_data` VALUES (56, 5, '黄绿双拼色', '5', 'plate_color', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:06:35', '', NULL, '黄绿双拼色');
INSERT INTO `sys_dict_data` VALUES (57, 6, '蓝白渐变色', '6', 'plate_color', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:06:49', '', NULL, '蓝白渐变色');
INSERT INTO `sys_dict_data` VALUES (58, 9, '未确定', '9', 'plate_color', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:07:01', '', NULL, '未确定');
INSERT INTO `sys_dict_data` VALUES (59, 11, '绿色', '11', 'plate_color', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:07:12', '', NULL, '绿色');
INSERT INTO `sys_dict_data` VALUES (60, 12, '红色', '12', 'plate_color', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:07:23', '', NULL, '红色');
INSERT INTO `sys_dict_data` VALUES (61, 1, '驾驶员', '1', 'copy_object', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:14:18', '', NULL, '驾驶员');
INSERT INTO `sys_dict_data` VALUES (62, 2, '车辆', '2', 'copy_object', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:14:30', '', NULL, '车辆');
INSERT INTO `sys_dict_data` VALUES (63, 3, '运输经营业户', '3', 'copy_object', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:14:44', '', NULL, '运输经营业户');
INSERT INTO `sys_dict_data` VALUES (64, 4, '源头线索', '4', 'copy_object', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:15:17', '', NULL, '源头线索');
INSERT INTO `sys_dict_data` VALUES (65, 1, '有效', '1', 'case_status', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:16:52', '', NULL, '有效');
INSERT INTO `sys_dict_data` VALUES (66, 2, '已撤销', '2', 'case_status', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:17:14', '', NULL, '已撤销');
INSERT INTO `sys_dict_data` VALUES (67, 0, '待审核', '0', 'non_ose_info_flag', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:32:33', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (68, 1, '驳回', '-1', 'non_ose_info_flag', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:33:21', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (69, 2, '通过', '1', 'non_ose_info_flag', NULL, NULL, 'N', '0', 'admin', '2020-10-28 18:33:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (70, 1, '精检站', '1', 'site_point_type', NULL, NULL, 'N', '0', 'admin', '2020-10-31 15:06:08', '', NULL, '精检站');
INSERT INTO `sys_dict_data` VALUES (71, 3, '高速收费站', '3', 'site_point_type', NULL, NULL, 'N', '0', 'admin', '2020-10-31 15:06:21', '', NULL, '高速收费站');
INSERT INTO `sys_dict_data` VALUES (72, 7, '计重收费站', '7', 'site_point_type', NULL, NULL, 'N', '0', 'admin', '2020-10-31 15:06:33', '', NULL, '计重收费站');
INSERT INTO `sys_dict_data` VALUES (73, 8, '不停车预检', '8', 'site_point_type', NULL, NULL, 'N', '0', 'admin', '2020-10-31 15:06:47', '', NULL, '不停车预检');
INSERT INTO `sys_dict_data` VALUES (74, 10, '非现场检测点', '10', 'site_point_type', NULL, NULL, 'N', '0', 'admin', '2020-10-31 15:07:00', '', NULL, '非现场检测点');
INSERT INTO `sys_dict_data` VALUES (75, 11, '轴载调查', '11', 'site_point_type', NULL, NULL, 'N', '0', 'admin', '2020-10-31 15:07:20', '', NULL, '轴载调查');
INSERT INTO `sys_dict_data` VALUES (76, 1, '超限检测站', '1', 'province_site_type', NULL, NULL, 'N', '0', 'admin', '2020-10-31 15:08:31', '', NULL, '超限检测站');
INSERT INTO `sys_dict_data` VALUES (77, 2, '动态检测站', '2', 'province_site_type', NULL, NULL, 'N', '0', 'admin', '2020-10-31 15:08:41', '', NULL, '动态检测站');
INSERT INTO `sys_dict_data` VALUES (78, 3, '收费站', '3', 'province_site_type', NULL, NULL, 'N', '0', 'admin', '2020-10-31 15:08:55', '', NULL, '收费站');
INSERT INTO `sys_dict_data` VALUES (79, 4, '高速收费站', '4', 'province_site_type', NULL, NULL, 'N', '0', 'admin', '2020-10-31 15:09:14', '', NULL, '高速收费站');
INSERT INTO `sys_dict_data` VALUES (80, 0, '否', '0', 'yes_no', NULL, NULL, 'N', '0', 'admin', '2020-10-31 15:10:02', '', NULL, '否');
INSERT INTO `sys_dict_data` VALUES (81, 1, '是', '1', 'yes_no', NULL, NULL, 'N', '0', 'admin', '2020-10-31 15:10:17', '', NULL, '是');
INSERT INTO `sys_dict_data` VALUES (125, 10, '测试', '10', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2021-01-17 18:02:50', 'admin', '2021-01-17 18:02:50', '测试操作');
INSERT INTO `sys_dict_data` VALUES (126, 0, 'java', '1', 'software_technology', NULL, NULL, 'N', '0', 'admin', '2021-03-12 16:56:05', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (127, 0, 'c++', '2', 'software_technology', NULL, NULL, 'N', '0', 'admin', '2021-03-12 16:56:13', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (128, 0, 'phython', '3', 'software_technology', NULL, NULL, 'N', '0', 'admin', '2021-03-12 16:56:58', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (129, 0, 'ruby', '4', 'software_technology', NULL, NULL, 'N', '0', 'admin', '2021-03-12 16:57:30', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (130, 0, '吹牛B', '5', 'software_technology', NULL, NULL, 'N', '0', 'admin', '2021-03-12 16:57:39', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (131, 0, '在职', '0', 'on_job_status', NULL, NULL, 'N', '0', 'admin', '2021-03-12 17:15:49', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (132, 0, '离职', '1', 'on_job_status', NULL, NULL, 'N', '0', 'admin', '2021-03-12 17:15:55', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
BEGIN;
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (11, '站端类型', 'station_type', '0', 'admin', '2020-06-19 17:43:50', 'admin', '2020-09-01 09:53:25', '站端类型');
INSERT INTO `sys_dict_type` VALUES (12, '源头单位类型', 'road_owner_type', '0', 'admin', '2020-10-22 14:27:05', '', NULL, '源头单位类型');
INSERT INTO `sys_dict_type` VALUES (13, '源头单位属性', 'road_owner_property', '0', 'admin', '2020-10-22 14:27:47', '', NULL, '源头单位属性');
INSERT INTO `sys_dict_type` VALUES (14, '设备状态', 'equipment_status', '0', 'admin', '2020-10-22 14:28:04', '', NULL, '设备状态');
INSERT INTO `sys_dict_type` VALUES (15, '站点类型', 'base_site_type', '0', 'admin', '2020-10-25 15:12:53', '', NULL, '站点类型');
INSERT INTO `sys_dict_type` VALUES (16, '车辆类型', 'base_car_type', '0', 'admin', '2020-10-25 15:13:14', '', NULL, '车辆类型');
INSERT INTO `sys_dict_type` VALUES (17, '文书类别', 'other_provinces_wslb', '0', 'admin', '2020-10-28 16:41:41', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (18, '抄告信息类型', 'other_provinces_copy_type', '0', 'admin', '2020-10-28 16:42:52', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (19, '站点状态', 'base_site_status', '0', 'admin', '2020-10-28 16:44:10', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (20, '车牌颜色', 'plate_color', '0', 'admin', '2020-10-28 18:04:47', 'admin', '2020-10-28 18:05:00', '车牌颜色');
INSERT INTO `sys_dict_type` VALUES (21, '抄告对象', 'copy_object', '0', 'admin', '2020-10-28 18:13:55', '', NULL, '1-驾驶员，2-车辆，3-运输经营业户，4-源头线索');
INSERT INTO `sys_dict_type` VALUES (22, '案件状态', 'case_status', '0', 'admin', '2020-10-28 18:16:28', '', NULL, '案件状态');
INSERT INTO `sys_dict_type` VALUES (23, '非现场执法审核状态', 'non_ose_info_flag', '0', 'admin', '2020-10-28 18:32:11', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (24, '站点类型', 'site_point_type', '0', 'admin', '2020-10-31 15:00:31', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (25, '省站点类型', 'province_site_type', '0', 'admin', '2020-10-31 15:08:08', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (26, '是否', 'yes_no', '0', 'admin', '2020-10-31 15:09:34', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (27, '软件技术', 'software_technology', '0', 'admin', '2021-03-12 16:55:39', '', NULL, '软件技术');
INSERT INTO `sys_dict_type` VALUES (28, '在职状态', 'on_job_status', '0', 'admin', '2021-03-12 17:15:31', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_file
-- ----------------------------
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE `sys_file` (
  `file_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `file_name` varchar(500) DEFAULT NULL COMMENT '文件名',
  `file_origin_name` varchar(64) DEFAULT NULL COMMENT '文件源头名称',
  `file_type` char(4) DEFAULT '10' COMMENT '文件类型(10-普通附件)',
  `file_path` text COMMENT '文件路径',
  `file_size` int(11) DEFAULT NULL COMMENT '文件字节',
  `search_id` bigint(10) DEFAULT NULL COMMENT '查询ID',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT NULL COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标识',
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB AUTO_INCREMENT=298 DEFAULT CHARSET=utf8 COMMENT='文件存储表';

-- ----------------------------
-- Records of sys_file
-- ----------------------------
BEGIN;
INSERT INTO `sys_file` VALUES (275, '9c99821a-38a1-4917-85d4-1ac3fb6f0fa6.docx', '江苏省级治超管理系统——系统管理操作指南.docx', '10', '/profile/upload/2021/03/20/9c99821a-38a1-4917-85d4-1ac3fb6f0fa6.docx', 1621575, 158, 'admin', '2021-03-20 18:33:51', 'admin', '2021-03-20 18:33:51', '0');
INSERT INTO `sys_file` VALUES (276, 'eb0cbfd1-2d19-40c0-b7c3-58d19dc04235.docx', '一超四罚案件录入过程.docx', '10', '/profile/upload/2021/03/20/eb0cbfd1-2d19-40c0-b7c3-58d19dc04235.docx', 494942, 158, 'admin', '2021-03-20 18:34:11', 'admin', '2021-03-20 18:34:11', '0');
INSERT INTO `sys_file` VALUES (277, 'a7377baf-8131-4bbf-9e64-c56f868da0b9.docx', 'web前端开发规范.docx', '10', '/profile/upload/2021/03/20/a7377baf-8131-4bbf-9e64-c56f868da0b9.docx', 59363, 158, 'admin', '2021-03-20 18:34:11', 'admin', '2021-03-20 18:34:11', '0');
INSERT INTO `sys_file` VALUES (281, 'c64fe02e-170f-4099-b4cd-32f85c998180.docx', '江苏省级治超联网管理信息系统（试行）20210319.docx', '10', '/profile/upload/2021/03/20/c64fe02e-170f-4099-b4cd-32f85c998180.docx', 3610525, 160, 'admin', '2021-03-20 19:22:13', 'admin', '2021-03-20 19:22:13', '0');
INSERT INTO `sys_file` VALUES (282, 'cc12ad1f-c169-434e-abd1-bda0e57ff0b0.docx', '高速非现场案件办理函告环节操作流程.docx', '10', '/profile/upload/2021/03/20/cc12ad1f-c169-434e-abd1-bda0e57ff0b0.docx', 668080, 160, 'admin', '2021-03-20 19:25:14', 'admin', '2021-03-20 19:25:14', '0');
INSERT INTO `sys_file` VALUES (283, '8fd8f79b-d3ba-4335-b5a0-8708ebca10e2.docx', '鼓楼区幼儿健康卡（返园审核）.docx', '10', '/profile/upload/2021/03/20/8fd8f79b-d3ba-4335-b5a0-8708ebca10e2.docx', 16190, 161, 'admin', '2021-03-20 19:25:47', 'admin', '2021-03-20 19:25:47', '0');
INSERT INTO `sys_file` VALUES (284, '17c6a854-4773-458a-9503-36cde79e7f16.docx', '高速非现场案件办理函告环节操作流程.docx', '10', '/profile/upload/2021/03/20/17c6a854-4773-458a-9503-36cde79e7f16.docx', 668080, 161, 'admin', '2021-03-20 19:25:59', 'admin', '2021-03-20 19:25:59', '1');
INSERT INTO `sys_file` VALUES (285, 'e104c182-b3b0-4cb2-a3d1-241e82f29468.docx', '大件运输车辆通行智能化监管（核验）参考.docx', '10', '/profile/upload/2021/03/20/e104c182-b3b0-4cb2-a3d1-241e82f29468.docx', 686278, 161, 'admin', '2021-03-20 19:26:25', 'admin', '2021-03-20 19:26:25', '1');
INSERT INTO `sys_file` VALUES (286, '5b028087-f818-4556-a1cd-00a316bad332.docx', 'web前端开发规范.docx', '10', '/profile/upload/2021/03/20/5b028087-f818-4556-a1cd-00a316bad332.docx', 59363, 161, 'admin', '2021-03-20 19:26:34', 'admin', '2021-03-20 19:26:34', '0');
INSERT INTO `sys_file` VALUES (287, '9ed614bc-64ae-492f-93d5-c5e98e99845b.docx', '大件运输车辆通行智能化监管（核验）参考.docx', '10', '/profile/upload/2021/03/20/9ed614bc-64ae-492f-93d5-c5e98e99845b.docx', 686278, 162, 'admin', '2021-03-20 19:38:30', 'admin', '2021-03-20 19:38:30', '0');
INSERT INTO `sys_file` VALUES (288, 'ae2c0530-0696-40a8-8ff3-34f6a3dd997f.docx', '健康码行程卡.docx', '10', '/profile/upload/2021/03/20/ae2c0530-0696-40a8-8ff3-34f6a3dd997f.docx', 808327, 163, 'admin', '2021-03-20 19:39:55', 'admin', '2021-03-20 19:39:55', '0');
INSERT INTO `sys_file` VALUES (289, 'cd8bfa48-0978-44b0-a7f2-2f05822e86b0.docx', '高速非现场案件办理函告环节操作流程.docx', '10', '/profile/upload/2021/03/20/cd8bfa48-0978-44b0-a7f2-2f05822e86b0.docx', 668080, 169, 'admin', '2021-03-20 19:48:57', 'admin', '2021-03-20 19:48:57', '0');
INSERT INTO `sys_file` VALUES (290, '8eacac3f-9896-48c5-adc3-3b935550f67d.docx', '一超四罚案件录入过程.docx', '10', '/profile/upload/2021/03/20/8eacac3f-9896-48c5-adc3-3b935550f67d.docx', 494942, 169, 'admin', '2021-03-20 19:48:59', 'admin', '2021-03-20 19:48:59', '0');
INSERT INTO `sys_file` VALUES (291, 'a6a819b3-6dc9-4a0f-97a9-9ea0730b5114.docx', 'Eslint规则说明.docx', '10', '/profile/upload/2021/03/20/a6a819b3-6dc9-4a0f-97a9-9ea0730b5114.docx', 19001, 169, 'admin', '2021-03-20 19:49:14', 'admin', '2021-03-20 19:49:14', '0');
INSERT INTO `sys_file` VALUES (292, '8024c233-32ba-49af-8c40-ccb3acf8a60a.docx', '鼓楼区幼儿健康卡（返园审核）.docx', '10', '/profile/upload/2021/03/20/8024c233-32ba-49af-8c40-ccb3acf8a60a.docx', 16190, 170, 'admin', '2021-03-20 19:49:37', 'admin', '2021-03-20 19:49:37', '0');
INSERT INTO `sys_file` VALUES (293, '78ea7b0e-c0b2-4294-a405-cd8db41dc9a3.xlsx', '苏EJ5649_20210317101744.xlsx', '10', '/profile/upload/2021/03/20/78ea7b0e-c0b2-4294-a405-cd8db41dc9a3.xlsx', 1365300, 170, 'admin', '2021-03-20 19:49:37', 'admin', '2021-03-20 19:49:37', '0');
INSERT INTO `sys_file` VALUES (294, 'bcea732d-2c49-4ba7-a484-3042f0635b79.xls', '20210419105525-user.xls', '10', '/profile/upload/2021/04/28/bcea732d-2c49-4ba7-a484-3042f0635b79.xls', 88064, 171, 'admin', '2021-04-28 15:52:40', 'admin', '2021-04-28 15:52:40', '0');
INSERT INTO `sys_file` VALUES (295, '581f987f-962f-42e5-8a72-b0c32eda17bf.doc', '统一身份与访问管理应用集成对接规范.doc', '10', '/profile/upload/2021/05/03/581f987f-962f-42e5-8a72-b0c32eda17bf.doc', 3414016, 172, 'admin', '2021-05-03 14:17:57', 'admin', '2021-05-03 14:17:57', '0');
INSERT INTO `sys_file` VALUES (296, '4005c9fd-98f5-4664-a35d-68ef8310573e.xlsx', '运政库查询结果.xlsx', '10', '/profile/upload/2021/05/03/4005c9fd-98f5-4664-a35d-68ef8310573e.xlsx', 8979, 172, 'admin', '2021-05-03 14:17:57', 'admin', '2021-05-03 14:17:57', '0');
INSERT INTO `sys_file` VALUES (297, 'af6cc0f1-4e03-443c-8c5d-1abcbaf82ad8.docx', '超限检测站接入.docx', '10', '/profile/upload/2021/05/03/af6cc0f1-4e03-443c-8c5d-1abcbaf82ad8.docx', 15011, 172, 'admin', '2021-05-03 14:18:58', 'admin', '2021-05-03 14:18:58', '1');
COMMIT;

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
BEGIN;
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'task.noParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-15 00:38:14', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'task.params(\'itssky\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'task.multipleParams(\'itssky\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_job_log` VALUES (21, '系统默认（无参）', 'DEFAULT', 'task.noParams', '系统默认（无参） 总共耗时：3毫秒', '0', '', '2021-05-03 14:07:08');
INSERT INTO `sys_job_log` VALUES (22, '系统默认（无参）', 'DEFAULT', 'task.noParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2021-05-03 14:07:18');
INSERT INTO `sys_job_log` VALUES (23, '系统默认（无参）', 'DEFAULT', 'task.noParams', '系统默认（无参） 总共耗时：0毫秒', '0', '', '2021-05-03 14:07:28');
COMMIT;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
BEGIN;
INSERT INTO `sys_logininfor` VALUES (1, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-05-05 00:00:52');
INSERT INTO `sys_logininfor` VALUES (2, 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Mac OS X', '0', '登录成功', '2021-05-05 00:37:55');
COMMIT;

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) DEFAULT NULL COMMENT '组件路径',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `menu_type` char(2) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `table_id` varchar(10) DEFAULT NULL COMMENT '业务表ID',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1342 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 10, 'system', NULL, 1, 'M', '0', '0', '', 'system', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 20, 'monitor', NULL, 1, 'M', '0', '0', '', 'monitor', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 30, 'tool', NULL, 1, 'M', '0', '0', '', 'tool', NULL, 'admin', '2020-06-01 10:30:00', 'admin', '2021-04-21 10:22:35', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', 1, 'C', '0', '0', 'system:user:list', 'user', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', 1, 'C', '0', '0', 'system:role:list', 'peoples', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', 1, 'C', '0', '0', 'system:menu:list', 'tree-table', NULL, 'admin', '2020-06-01 10:30:00', 'admin', '2021-04-29 23:13:33', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '组织管理', 1, 4, 'dept', 'system/dept/index', 1, 'C', '0', '0', 'system:dept:list', 'tree', NULL, 'admin', '2020-06-01 10:30:00', 'admin', '2021-04-14 13:53:53', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '用户组管理', 1, 5, 'post', 'system/post/index', 1, 'C', '0', '0', 'system:post:list', 'post', NULL, 'admin', '2020-06-01 10:30:00', 'admin', '2021-04-15 15:43:03', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', 1, 'C', '0', '0', 'system:dict:list', 'dict', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', 1, 'C', '0', '0', 'system:config:list', 'edit', '1', 'admin', '2020-06-01 10:30:00', 'admin', '2021-03-29 09:34:52', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1268, 8, 'notice', 'system/notice/index', 1, 'C', '0', '0', 'system:notice:list', 'message', NULL, 'admin', '2020-06-01 10:30:00', 'admin', '2021-05-04 19:04:37', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', 'system/log/index', 1, 'M', '0', '0', '', 'log', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', 1, 'C', '0', '0', 'monitor:online:list', 'online', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', 1, 'C', '0', '0', 'monitor:job:list', 'job', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', 1, 'C', '0', '0', 'monitor:druid:list', 'druid', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', 1, 'C', '0', '0', 'monitor:server:list', 'server', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, 'build', 'tool/build/index', 1, 'C', '0', '0', 'tool:build:list', 'build', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, 'gen', 'tool/gen/index', 1, 'C', '0', '0', 'tool:gen:list', 'code', NULL, 'admin', '2020-06-01 10:30:00', 'admin', '2021-04-21 09:31:13', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', 1, 'C', '0', '0', 'tool:swagger:list', 'swagger', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', 1, 'C', '0', '0', 'monitor:operlog:list', 'form', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', 1, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1001, '用户查询', 100, 1, '', '', 1, 'F', '0', '0', 'system:user:query', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户新增', 100, 2, '', '', 1, 'F', '0', '0', 'system:user:add', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户修改', 100, 3, '', '', 1, 'F', '0', '0', 'system:user:edit', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户删除', 100, 4, '', '', 1, 'F', '0', '0', 'system:user:remove', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1005, '用户导出', 100, 5, '', '', 1, 'F', '0', '0', 'system:user:export', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1006, '用户导入', 100, 6, '', '', 1, 'F', '0', '0', 'system:user:import', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1007, '重置密码', 100, 7, '', '', 1, 'F', '0', '0', 'system:user:resetPwd', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色查询', 101, 1, '', '', 1, 'F', '0', '0', 'system:role:query', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色新增', 101, 2, '', '', 1, 'F', '0', '0', 'system:role:add', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色修改', 101, 3, '', '', 1, 'F', '0', '0', 'system:role:edit', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1011, '角色删除', 101, 4, '', '', 1, 'F', '0', '0', 'system:role:remove', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1012, '角色导出', 101, 5, '', '', 1, 'F', '0', '0', 'system:role:export', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1013, '颗粒查询', 102, 1, '', '', 1, 'F', '0', '0', 'system:menu:query', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1014, '颗粒新增', 102, 2, '', '', 1, 'F', '0', '0', 'system:menu:add', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1015, '颗粒修改', 102, 3, '', '', 1, 'F', '0', '0', 'system:menu:edit', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1016, '颗粒删除', 102, 4, '', '', 1, 'F', '0', '0', 'system:menu:remove', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1017, '组织查询', 103, 1, '', '', 1, 'F', '0', '0', 'system:dept:query', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1018, '组织新增', 103, 2, '', '', 1, 'F', '0', '0', 'system:dept:add', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1019, '组织修改', 103, 3, '', '', 1, 'F', '0', '0', 'system:dept:edit', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1020, '组织删除', 103, 4, '', '', 1, 'F', '0', '0', 'system:dept:remove', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位查询', 104, 1, '', '', 1, 'F', '0', '0', 'system:post:query', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位新增', 104, 2, '', '', 1, 'F', '0', '0', 'system:post:add', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位修改', 104, 3, '', '', 1, 'F', '0', '0', 'system:post:edit', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1024, '岗位删除', 104, 4, '', '', 1, 'F', '0', '0', 'system:post:remove', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1025, '岗位导出', 104, 5, '', '', 1, 'F', '0', '0', 'system:post:export', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典查询', 105, 1, '#', '', 1, 'F', '0', '0', 'system:dict:query', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典新增', 105, 2, '#', '', 1, 'F', '0', '0', 'system:dict:add', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典修改', 105, 3, '#', '', 1, 'F', '0', '0', 'system:dict:edit', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1029, '字典删除', 105, 4, '#', '', 1, 'F', '0', '0', 'system:dict:remove', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1030, '字典导出', 105, 5, '#', '', 1, 'F', '0', '0', 'system:dict:export', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数查询', 106, 1, '#', '', 1, 'F', '0', '0', 'system:config:query', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数新增', 106, 2, '#', '', 1, 'F', '0', '0', 'system:config:add', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数修改', 106, 3, '#', '', 1, 'F', '0', '0', 'system:config:edit', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1034, '参数删除', 106, 4, '#', '', 1, 'F', '0', '0', 'system:config:remove', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1035, '参数导出', 106, 5, '#', '', 1, 'F', '0', '0', 'system:config:export', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告查询', 107, 1, '#', '', 1, 'F', '0', '0', 'system:notice:query', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告新增', 107, 2, '#', '', 1, 'F', '0', '0', 'system:notice:add', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1038, '公告修改', 107, 3, '#', '', 1, 'F', '0', '0', 'system:notice:edit', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1039, '公告删除', 107, 4, '#', '', 1, 'F', '0', '0', 'system:notice:remove', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1040, '操作查询', 500, 1, '#', '', 1, 'F', '0', '0', 'monitor:operlog:query', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1041, '操作删除', 500, 2, '#', '', 1, 'F', '0', '0', 'monitor:operlog:remove', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1042, '日志导出', 500, 4, '#', '', 1, 'F', '0', '0', 'monitor:operlog:export', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录查询', 501, 1, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:query', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1044, '登录删除', 501, 2, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:remove', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1045, '日志导出', 501, 3, '#', '', 1, 'F', '0', '0', 'monitor:logininfor:export', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', 1, 'F', '0', '0', 'monitor:online:query', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', 1, 'F', '0', '0', 'monitor:online:batchLogout', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', 1, 'F', '0', '0', 'monitor:online:forceLogout', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', 1, 'F', '0', '0', 'monitor:job:query', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', 1, 'F', '0', '0', 'monitor:job:add', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', 1, 'F', '0', '0', 'monitor:job:edit', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', 1, 'F', '0', '0', 'monitor:job:remove', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', 1, 'F', '0', '0', 'monitor:job:changeStatus', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', '', 1, 'F', '0', '0', 'monitor:job:export', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 114, 1, '#', '', 1, 'F', '0', '0', 'tool:gen:query', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 114, 2, '#', '', 1, 'F', '0', '0', 'tool:gen:edit', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 114, 3, '#', '', 1, 'F', '0', '0', 'tool:gen:remove', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 114, 2, '#', '', 1, 'F', '0', '0', 'tool:gen:import', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 114, 4, '#', '', 1, 'F', '0', '0', 'tool:gen:preview', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 114, 5, '#', '', 1, 'F', '0', '0', 'tool:gen:code', '#', NULL, 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '');
INSERT INTO `sys_menu` VALUES (1210, '即时通信', 1183, 5, '#', NULL, 1, 'M', '0', '0', NULL, 'table', NULL, 'admin', '2020-10-10 16:34:25', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1211, '我的消息', 1210, 1, '#', NULL, 1, 'C', '0', '0', NULL, 'list', NULL, 'admin', '2020-10-10 16:34:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1212, '消息发送', 1210, 2, '#', NULL, 1, 'C', '0', '0', NULL, 'list', NULL, 'admin', '2020-10-10 16:35:08', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1263, '部门查询', 1262, 1, '', NULL, 1, 'F', '0', '0', 'system:dept:query', '#', NULL, 'admin', '2020-10-24 16:01:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1264, '部门新增', 1262, 2, '', NULL, 1, 'F', '0', '0', 'system:dept:add', '#', NULL, 'admin', '2020-10-24 16:02:19', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1265, '部门修改', 1262, 3, '', NULL, 1, 'F', '0', '0', 'system:dept:edit', '#', NULL, 'admin', '2020-10-24 16:02:35', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1266, '部门删除', 1262, 4, '', NULL, 1, 'F', '0', '0', 'system:dept:remove', '#', NULL, 'admin', '2020-10-24 16:02:51', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1268, 'DEMO展示', 0, 5, 'demo', NULL, 1, 'M', '0', '0', '', 'build', NULL, 'admin', '2021-03-12 15:41:15', 'admin', '2021-04-14 15:36:01', '');
INSERT INTO `sys_menu` VALUES (1269, '简历信息', 1268, 1, 'vitae', 'demo/vitae/index', 1, 'C', '0', '0', 'demo:vitae:list', 'list', NULL, 'admin', '2018-03-01 00:00:00', 'admin', '2021-05-04 17:04:59', '简历信息菜单');
INSERT INTO `sys_menu` VALUES (1270, '简历信息查询', 1269, 1, '#', '', 1, 'F', '0', '0', 'demo:vitae:query', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1271, '简历信息新增', 1269, 2, '#', '', 1, 'F', '0', '0', 'demo:vitae:add', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1272, '简历信息修改', 1269, 3, '#', '', 1, 'F', '0', '0', 'demo:vitae:edit', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1273, '简历信息删除', 1269, 4, '#', '', 1, 'F', '0', '0', 'demo:vitae:remove', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1274, '简历信息导出', 1269, 5, '#', '', 1, 'F', '0', '0', 'demo:vitae:export', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1275, '区域管理', 1, 1, 'area', 'system/area/index', 1, 'M', '0', '1', 'system:area:list', 'international', NULL, 'admin', '2018-03-01 00:00:00', 'admin', '2021-04-14 22:41:54', '区域菜单');
INSERT INTO `sys_menu` VALUES (1276, '区域查询', 1275, 1, '#', '', 1, 'F', '0', '0', 'system:area:query', '#', NULL, 'admin', '2020-06-01 00:00:00', 'admin', '2020-12-07 14:47:40', '');
INSERT INTO `sys_menu` VALUES (1277, '区域新增', 1275, 2, '#', '', 1, 'F', '0', '0', 'system:area:add', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1278, '区域修改', 1275, 3, '#', '', 1, 'F', '0', '0', 'system:area:edit', '#', NULL, 'admin', '2020-06-01 00:00:00', 'admin', '2020-12-07 14:47:50', '');
INSERT INTO `sys_menu` VALUES (1279, '区域删除', 1275, 4, '#', '', 1, 'F', '0', '0', 'system:area:remove', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1280, '区域导出', 1275, 5, '#', '', 1, 'F', '0', '0', 'system:area:export', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1281, '验证实例', 1268, 1, 'validation', 'demo/validation/index', 1, 'C', '0', '0', 'demo:validation:list', 'checkbox', NULL, 'admin', '2018-03-01 00:00:00', 'admin', '2021-05-04 17:04:51', '验证实例菜单');
INSERT INTO `sys_menu` VALUES (1282, '验证实例查询', 1281, 1, '#', '', 1, 'F', '0', '0', 'demo:validation:query', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1283, '验证实例新增', 1281, 2, '#', '', 1, 'F', '0', '0', 'demo:validation:add', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1284, '验证实例修改', 1281, 3, '#', '', 1, 'F', '0', '0', 'demo:validation:edit', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1285, '验证实例删除', 1281, 4, '#', '', 1, 'F', '0', '0', 'demo:validation:remove', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1286, '验证实例导出', 1281, 5, '#', '', 1, 'F', '0', '0', 'demo:validation:export', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1287, '内网地图', 1288, 1, 'map', 'demo/map/index', 1, 'M', '0', '0', '', '#', NULL, 'admin', '2021-03-15 16:42:00', 'admin', '2021-03-16 09:18:20', '');
INSERT INTO `sys_menu` VALUES (1288, 'GIS地图', 0, 6, 'map', NULL, 1, 'M', '0', '0', NULL, 'build', NULL, 'admin', '2021-03-16 09:13:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1289, '基础控件', 1288, 2, 'control', 'demo/map/control', 1, 'M', '0', '0', NULL, '#', NULL, 'admin', '2021-03-16 09:19:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1290, '图层切换', 1288, 3, 'switch', 'demo/map/switchLayers', 1, 'M', '0', '0', NULL, '#', NULL, 'admin', '2021-03-16 10:13:36', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1291, '折线图', 1288, 4, 'lineChart', 'demo/map/lineChart', 1, 'M', '0', '0', NULL, '#', NULL, 'admin', '2021-03-17 10:08:41', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1292, '轨迹', 1288, 5, 'antPath', 'demo/map/antPath', 1, 'M', '0', '0', NULL, '#', NULL, 'admin', '2021-03-17 14:02:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1293, '轨迹2', 1288, 6, 'animatedMarker', 'demo/map/animatedMarker', 1, 'M', '0', '0', NULL, '#', NULL, 'admin', '2021-03-17 15:30:30', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1294, '聚合', 1288, 7, 'markercluster', 'demo/map/markercluster', 1, 'M', '0', '0', NULL, '#', NULL, 'admin', '2021-03-17 16:55:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1295, '数据项', 104, 1, '', NULL, 1, 'F', '0', '0', 'system:post:data:name', '#', NULL, 'admin', '2021-04-01 17:35:23', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1314, '搜索', 100, 300, '', NULL, 1, 'F', '0', '0', 'system:user:query:search', '#', NULL, 'admin', '2021-04-12 10:55:05', 'admin', '2021-04-12 11:04:35', '');
INSERT INTO `sys_menu` VALUES (1315, '重置', 100, 310, '', NULL, 1, 'F', '0', '0', 'system:user:query:reset', '#', NULL, 'admin', '2021-04-12 10:55:05', 'admin', '2021-04-12 11:04:35', '');
INSERT INTO `sys_menu` VALUES (1317, '表格字段查询', 1316, 1, '#', '', 1, 'F', '0', '0', 'system:column:query', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1318, '表格字段新增', 1316, 2, '#', '', 1, 'F', '0', '0', 'system:column:add', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1319, '表格字段修改', 1316, 3, '#', '', 1, 'F', '0', '0', 'system:column:edit', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1320, '表格字段删除', 1316, 4, '#', '', 1, 'F', '0', '0', 'system:column:remove', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1321, '表格字段导出', 1316, 5, '#', '', 1, 'F', '0', '0', 'system:column:export', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1322, '颗粒仓库', 0, 100, 'warehouse', '', 1, 'M', '0', '0', '', 'build', NULL, 'admin', '2021-04-21 09:20:49', 'admin', '2021-04-21 10:21:27', '');
INSERT INTO `sys_menu` VALUES (1323, '数据清单', 1322, 10, 'particle', 'particle/table/index', 1, 'C', '0', '0', 'particle:table:list', 'code', NULL, 'admin', '2021-04-21 09:27:04', 'admin', '2021-04-28 15:39:02', '');
INSERT INTO `sys_menu` VALUES (1331, '颗粒配置查询', 1330, 1, '#', '', 1, 'F', '0', '0', 'particle:config:query', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1332, '颗粒配置新增', 1330, 2, '#', '', 1, 'F', '0', '0', 'particle:config:add', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1333, '颗粒配置修改', 1330, 3, '#', '', 1, 'F', '0', '0', 'particle:config:edit', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1334, '颗粒配置删除', 1330, 4, '#', '', 1, 'F', '0', '0', 'particle:config:remove', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1335, '颗粒配置导出', 1330, 5, '#', '', 1, 'F', '0', '0', 'particle:config:export', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1336, '颗粒清单', 1322, 3, 'menu', 'particle/menu/index', 1, 'C', '0', '0', 'system:menu:list', 'tree-table', NULL, 'admin', '2021-04-29 23:15:02', 'admin', '2021-04-29 23:16:08', '');
INSERT INTO `sys_menu` VALUES (1337, '区域管理', 1268, 5, 'area', 'system/area/index', 1, 'C', '0', '0', 'system:area:list', 'international', NULL, 'admin', '2018-03-01 00:00:00', 'admin', '2021-05-04 17:04:07', '区域菜单');
INSERT INTO `sys_menu` VALUES (1338, '区域查询', 1337, 1, '#', '', 1, 'F', '0', '0', 'system:area:query', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1339, '区域新增', 1337, 2, '#', '', 1, 'F', '0', '0', 'system:area:add', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1340, '区域修改', 1337, 3, '#', '', 1, 'F', '0', '0', 'system:area:edit', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
INSERT INTO `sys_menu` VALUES (1341, '区域删除', 1337, 4, '#', '', 1, 'F', '0', '0', 'system:area:remove', '#', NULL, 'admin', '2020-06-01 00:00:00', 'itssky', '2020-06-01 00:00:00', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(1) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=173 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
BEGIN;
INSERT INTO `sys_notice` VALUES (172, '开会', '1', NULL, '0', 'admin', '2021-05-03 14:17:57', 'admin', '2021-05-03 14:19:19', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
BEGIN;
INSERT INTO `sys_oper_log` VALUES (1, '简历信息', 2, 'com.itssky.modules.demo.controller.DemoVitaeController.edit()', 'PUT', 1, 'admin', NULL, '/demo/vitae', '127.0.0.1', '内网IP', '{\"birthday\":1619452800000,\"code\":\"admin\",\"entryEndTime\":1621008000000,\"remark\":\"超级管理员\",\"delFlag\":\"0\",\"score\":100,\"password\":\"$2a$10$UsPVAzYpnmEqIzbY1e0pReV0amLRB465pWkY.qCWGR707KoE0OW9q\",\"file\":\"\",\"updateBy\":\"itssky\",\"educationExperience\":\"测试\",\"adeptTechnology\":\"\",\"vitaeId\":1,\"email\":\"langdawei@itssky.com\",\"entryStartTime\":1619452800000,\"sex\":\"1\",\"deptId\":100,\"updateTime\":1620175092310,\"avatar\":\"\",\"dept\":{\"deptName\":\"张家港市\",\"delFlag\":\"0\",\"children\":[],\"deptId\":100,\"params\":{}},\"sort\":\"0\",\"params\":{},\"createBy\":\"admin\",\"phoneNumber\":\"15888888888\",\"createTime\":1590978600000,\"name\":\"超级管理员\",\"position\":\"1\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2021-05-05 00:38:12');
COMMIT;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_post` VALUES (1, 'zc', '治超组', 1, '0', 'admin', '2020-06-01 10:30:00', 'admin', '2021-04-15 15:53:05', '');
INSERT INTO `sys_post` VALUES (2, 'zf', '执法组', 2, '0', 'admin', '2020-06-01 10:30:00', 'admin', '2021-04-15 15:53:16', '');
INSERT INTO `sys_post` VALUES (3, 'kp', '考评组', 3, '0', 'admin', '2020-06-01 10:30:00', 'admin', '2021-04-15 15:53:27', '');
INSERT INTO `sys_post` VALUES (4, 'wh', '危货组', 4, '0', 'admin', '2020-06-01 10:30:00', 'admin', '2021-04-15 15:53:36', '');
COMMIT;

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-06-01 10:30:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '4', '0', '0', 'admin', '2020-06-01 10:30:00', 'admin', '2021-04-29 00:29:24', '普通角色');
INSERT INTO `sys_role` VALUES (5, '测试', '测试', 0, '4', '0', '0', 'admin', '2021-01-15 16:49:24', 'admin', '2021-04-29 00:28:23', NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 102);
INSERT INTO `sys_role_dept` VALUES (2, 103);
INSERT INTO `sys_role_dept` VALUES (2, 104);
INSERT INTO `sys_role_dept` VALUES (2, 105);
INSERT INTO `sys_role_dept` VALUES (2, 106);
INSERT INTO `sys_role_dept` VALUES (2, 107);
INSERT INTO `sys_role_dept` VALUES (2, 108);
INSERT INTO `sys_role_dept` VALUES (2, 109);
INSERT INTO `sys_role_dept` VALUES (2, 110);
INSERT INTO `sys_role_dept` VALUES (2, 111);
INSERT INTO `sys_role_dept` VALUES (2, 112);
INSERT INTO `sys_role_dept` VALUES (2, 113);
INSERT INTO `sys_role_dept` VALUES (2, 114);
INSERT INTO `sys_role_dept` VALUES (2, 115);
INSERT INTO `sys_role_dept` VALUES (2, 116);
INSERT INTO `sys_role_dept` VALUES (2, 117);
INSERT INTO `sys_role_dept` VALUES (2, 118);
INSERT INTO `sys_role_dept` VALUES (2, 119);
INSERT INTO `sys_role_dept` VALUES (2, 120);
INSERT INTO `sys_role_dept` VALUES (2, 121);
INSERT INTO `sys_role_dept` VALUES (2, 122);
INSERT INTO `sys_role_dept` VALUES (2, 123);
INSERT INTO `sys_role_dept` VALUES (2, 124);
INSERT INTO `sys_role_dept` VALUES (2, 125);
INSERT INTO `sys_role_dept` VALUES (2, 126);
INSERT INTO `sys_role_dept` VALUES (2, 127);
INSERT INTO `sys_role_dept` VALUES (2, 128);
INSERT INTO `sys_role_dept` VALUES (2, 129);
INSERT INTO `sys_role_dept` VALUES (2, 130);
INSERT INTO `sys_role_dept` VALUES (2, 131);
INSERT INTO `sys_role_dept` VALUES (2, 132);
INSERT INTO `sys_role_dept` VALUES (2, 133);
INSERT INTO `sys_role_dept` VALUES (2, 134);
INSERT INTO `sys_role_dept` VALUES (2, 135);
INSERT INTO `sys_role_dept` VALUES (2, 136);
INSERT INTO `sys_role_dept` VALUES (2, 137);
INSERT INTO `sys_role_dept` VALUES (2, 138);
INSERT INTO `sys_role_dept` VALUES (2, 139);
INSERT INTO `sys_role_dept` VALUES (2, 140);
INSERT INTO `sys_role_dept` VALUES (2, 141);
INSERT INTO `sys_role_dept` VALUES (2, 142);
INSERT INTO `sys_role_dept` VALUES (2, 143);
INSERT INTO `sys_role_dept` VALUES (2, 144);
INSERT INTO `sys_role_dept` VALUES (2, 145);
INSERT INTO `sys_role_dept` VALUES (2, 146);
INSERT INTO `sys_role_dept` VALUES (2, 147);
INSERT INTO `sys_role_dept` VALUES (2, 148);
INSERT INTO `sys_role_dept` VALUES (2, 149);
INSERT INTO `sys_role_dept` VALUES (2, 150);
INSERT INTO `sys_role_dept` VALUES (2, 151);
INSERT INTO `sys_role_dept` VALUES (2, 152);
INSERT INTO `sys_role_dept` VALUES (2, 153);
INSERT INTO `sys_role_dept` VALUES (2, 154);
INSERT INTO `sys_role_dept` VALUES (2, 155);
INSERT INTO `sys_role_dept` VALUES (2, 156);
INSERT INTO `sys_role_dept` VALUES (2, 157);
INSERT INTO `sys_role_dept` VALUES (2, 158);
INSERT INTO `sys_role_dept` VALUES (2, 159);
INSERT INTO `sys_role_dept` VALUES (2, 160);
INSERT INTO `sys_role_dept` VALUES (2, 161);
INSERT INTO `sys_role_dept` VALUES (2, 162);
INSERT INTO `sys_role_dept` VALUES (2, 163);
INSERT INTO `sys_role_dept` VALUES (2, 164);
INSERT INTO `sys_role_dept` VALUES (2, 165);
INSERT INTO `sys_role_dept` VALUES (2, 166);
INSERT INTO `sys_role_dept` VALUES (2, 167);
INSERT INTO `sys_role_dept` VALUES (2, 168);
INSERT INTO `sys_role_dept` VALUES (2, 169);
INSERT INTO `sys_role_dept` VALUES (2, 170);
INSERT INTO `sys_role_dept` VALUES (2, 171);
INSERT INTO `sys_role_dept` VALUES (2, 172);
INSERT INTO `sys_role_dept` VALUES (2, 173);
INSERT INTO `sys_role_dept` VALUES (2, 174);
INSERT INTO `sys_role_dept` VALUES (2, 175);
INSERT INTO `sys_role_dept` VALUES (2, 176);
INSERT INTO `sys_role_dept` VALUES (2, 177);
INSERT INTO `sys_role_dept` VALUES (2, 178);
INSERT INTO `sys_role_dept` VALUES (2, 179);
INSERT INTO `sys_role_dept` VALUES (2, 180);
INSERT INTO `sys_role_dept` VALUES (2, 181);
INSERT INTO `sys_role_dept` VALUES (2, 182);
INSERT INTO `sys_role_dept` VALUES (2, 183);
INSERT INTO `sys_role_dept` VALUES (2, 184);
INSERT INTO `sys_role_dept` VALUES (2, 185);
INSERT INTO `sys_role_dept` VALUES (2, 186);
INSERT INTO `sys_role_dept` VALUES (2, 187);
INSERT INTO `sys_role_dept` VALUES (2, 188);
INSERT INTO `sys_role_dept` VALUES (2, 189);
INSERT INTO `sys_role_dept` VALUES (2, 190);
INSERT INTO `sys_role_dept` VALUES (2, 191);
INSERT INTO `sys_role_dept` VALUES (2, 192);
INSERT INTO `sys_role_dept` VALUES (2, 193);
INSERT INTO `sys_role_dept` VALUES (2, 194);
INSERT INTO `sys_role_dept` VALUES (2, 195);
INSERT INTO `sys_role_dept` VALUES (2, 196);
INSERT INTO `sys_role_dept` VALUES (2, 197);
INSERT INTO `sys_role_dept` VALUES (2, 198);
INSERT INTO `sys_role_dept` VALUES (2, 199);
INSERT INTO `sys_role_dept` VALUES (2, 200);
INSERT INTO `sys_role_dept` VALUES (2, 201);
INSERT INTO `sys_role_dept` VALUES (2, 202);
INSERT INTO `sys_role_dept` VALUES (2, 203);
COMMIT;

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
BEGIN;
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
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
INSERT INTO `sys_role_menu` VALUES (2, 1268);
INSERT INTO `sys_role_menu` VALUES (2, 1269);
INSERT INTO `sys_role_menu` VALUES (2, 1270);
INSERT INTO `sys_role_menu` VALUES (2, 1271);
INSERT INTO `sys_role_menu` VALUES (2, 1272);
INSERT INTO `sys_role_menu` VALUES (2, 1273);
INSERT INTO `sys_role_menu` VALUES (2, 1274);
INSERT INTO `sys_role_menu` VALUES (2, 1275);
INSERT INTO `sys_role_menu` VALUES (2, 1276);
INSERT INTO `sys_role_menu` VALUES (2, 1277);
INSERT INTO `sys_role_menu` VALUES (2, 1278);
INSERT INTO `sys_role_menu` VALUES (2, 1279);
INSERT INTO `sys_role_menu` VALUES (2, 1280);
INSERT INTO `sys_role_menu` VALUES (2, 1281);
INSERT INTO `sys_role_menu` VALUES (2, 1282);
INSERT INTO `sys_role_menu` VALUES (2, 1283);
INSERT INTO `sys_role_menu` VALUES (2, 1284);
INSERT INTO `sys_role_menu` VALUES (2, 1285);
INSERT INTO `sys_role_menu` VALUES (2, 1286);
INSERT INTO `sys_role_menu` VALUES (2, 1295);
INSERT INTO `sys_role_menu` VALUES (2, 1314);
INSERT INTO `sys_role_menu` VALUES (2, 1315);
INSERT INTO `sys_role_menu` VALUES (2, 1322);
INSERT INTO `sys_role_menu` VALUES (5, 1268);
INSERT INTO `sys_role_menu` VALUES (5, 1269);
INSERT INTO `sys_role_menu` VALUES (5, 1270);
INSERT INTO `sys_role_menu` VALUES (5, 1271);
INSERT INTO `sys_role_menu` VALUES (5, 1272);
INSERT INTO `sys_role_menu` VALUES (5, 1273);
INSERT INTO `sys_role_menu` VALUES (5, 1274);
INSERT INTO `sys_role_menu` VALUES (5, 1281);
INSERT INTO `sys_role_menu` VALUES (5, 1282);
INSERT INTO `sys_role_menu` VALUES (5, 1283);
INSERT INTO `sys_role_menu` VALUES (5, 1284);
INSERT INTO `sys_role_menu` VALUES (5, 1285);
INSERT INTO `sys_role_menu` VALUES (5, 1286);
INSERT INTO `sys_role_menu` VALUES (7, 1090);
INSERT INTO `sys_role_menu` VALUES (7, 1186);
INSERT INTO `sys_role_menu` VALUES (7, 1238);
INSERT INTO `sys_role_menu` VALUES (7, 1239);
INSERT INTO `sys_role_menu` VALUES (7, 1240);
INSERT INTO `sys_role_menu` VALUES (7, 1241);
INSERT INTO `sys_role_menu` VALUES (7, 1242);
INSERT INTO `sys_role_menu` VALUES (7, 1243);
COMMIT;

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户 20执法人员）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
BEGIN;
INSERT INTO `sys_user` VALUES (1, 100, 'admin', '超级管理员', '00', 'langdawei@itssky.com', '15888888888', '1', '', '$2a$10$UsPVAzYpnmEqIzbY1e0pReV0amLRB465pWkY.qCWGR707KoE0OW9q', '0', '0', '127.0.0.1', '2020-06-01 10:30:00', 'admin', '2020-06-01 10:30:00', 'itssky', '2020-10-28 20:00:46', '超级管理员');
INSERT INTO `sys_user` VALUES (2, 100, 'itssky', '管理员', '00', 'itssky@itssky.com', '15666666666', '1', '', '$2a$10$lx4xe7aJwqlANsLQ1KsRIu5tq8abKTzzTD/09VM9p8FwGYhZFLhOm', '0', '0', '127.0.0.1', '2020-06-01 10:30:00', 'admin', '2020-06-01 10:30:00', 'admin', '2021-04-30 11:32:29', '管理员');
INSERT INTO `sys_user` VALUES (3, 102, 'test', 'test', '00', '', '', '0', '', '$2a$10$T0j96QH8eDVb1Aai9ZrsCetWZx195c0CUFw5JgP03lPX0MkNe32hO', '0', '0', '', NULL, 'admin', '2021-03-11 10:30:48', 'test', '2021-04-12 11:19:12', NULL);
INSERT INTO `sys_user` VALUES (4, 101, '111', '222', '00', '', '', '0', '', '$2a$10$gRQS0ClTqO07o0a/JgSN1esuH8OdCi8EoHVpmZRErIs.E8ZmajqL6', '0', '0', '', NULL, 'admin', '2021-04-11 22:06:43', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (5, 110, '陈勇', '陈勇', '00', '', '', '0', '', '$2a$10$r/a.w3uDdSB.fjYKPt5GseZxfx9lmIdunt1TvZX7fz/a0PEHnTo/S', '0', '0', '', NULL, 'admin', '2021-04-13 13:54:59', '', NULL, NULL);
INSERT INTO `sys_user` VALUES (6, 110, '陈云', '陈云', '00', '', '', '0', '', '$2a$10$jhQojCEspueSfv.9rFQxzuos02El.etz.iMMb6aKzFSxAieN/btMW', '0', '0', '', NULL, 'admin', '2021-04-13 13:58:39', '', NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);
COMMIT;

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
BEGIN;
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);
INSERT INTO `sys_user_role` VALUES (3, 2);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
