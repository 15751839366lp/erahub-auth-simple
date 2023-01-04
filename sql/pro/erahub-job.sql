/*
 Navicat Premium Data Transfer

 Source Server         : 1.117.176.57
 Source Server Type    : MySQL
 Source Server Version : 80031
 Source Host           : 1.117.176.57:3306
 Source Schema         : erahub-job

 Target Server Type    : MySQL
 Target Server Version : 80031
 File Encoding         : 65001

 Date: 03/01/2023 18:53:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for undo_log
-- ----------------------------
DROP TABLE IF EXISTS `undo_log`;
CREATE TABLE `undo_log`  (
  `branch_id` bigint(0) NOT NULL COMMENT 'branch transaction id',
  `xid` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'global transaction id',
  `context` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'undo_log context,such as serialization',
  `rollback_info` longblob NOT NULL COMMENT 'rollback info',
  `log_status` int(0) NOT NULL COMMENT '0:normal status,1:defense status',
  `log_created` datetime(6) NOT NULL COMMENT 'create datetime',
  `log_modified` datetime(6) NOT NULL COMMENT 'modify datetime',
  UNIQUE INDEX `ux_undo_log`(`xid`, `branch_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'AT transaction mode undo table' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of undo_log
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_group
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_group`;
CREATE TABLE `xxl_job_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行器AppName',
  `title` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '执行器名称',
  `address_type` tinyint(0) NOT NULL DEFAULT 0 COMMENT '执行器地址类型：0=自动注册、1=手动录入',
  `address_list` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行器地址列表，多地址逗号分隔',
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_group
-- ----------------------------
INSERT INTO `xxl_job_group` VALUES (1, 'erahub-job-executor', '示例执行器', 0, 'http://10.0.4.7:9901/', '2023-01-03 18:52:52');

-- ----------------------------
-- Table structure for xxl_job_info
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_info`;
CREATE TABLE `xxl_job_info`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `job_group` int(0) NOT NULL COMMENT '执行器主键ID',
  `job_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `add_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '作者',
  `alarm_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '报警邮件',
  `schedule_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'NONE' COMMENT '调度类型',
  `schedule_conf` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '调度配置，值含义取决于调度类型',
  `misfire_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'DO_NOTHING' COMMENT '调度过期策略',
  `executor_route_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器路由策略',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_block_strategy` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '阻塞处理策略',
  `executor_timeout` int(0) NOT NULL DEFAULT 0 COMMENT '任务执行超时时间，单位秒',
  `executor_fail_retry_count` int(0) NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'GLUE备注',
  `glue_updatetime` datetime(0) NULL DEFAULT NULL COMMENT 'GLUE更新时间',
  `child_jobid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '子任务ID，多个逗号分隔',
  `trigger_status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '调度状态：0-停止，1-运行',
  `trigger_last_time` bigint(0) NOT NULL DEFAULT 0 COMMENT '上次调度时间',
  `trigger_next_time` bigint(0) NOT NULL DEFAULT 0 COMMENT '下次调度时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_info
-- ----------------------------
INSERT INTO `xxl_job_info` VALUES (1, 1, '测试任务1', '2018-11-03 22:21:31', '2018-11-03 22:21:31', 'XXL', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'demoJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2018-11-03 22:21:31', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (2, 1, '多服务任务', '2022-02-17 12:21:31', '2022-02-17 12:21:31', 'XXL', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'multiServiceHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2022-02-17 12:21:31', '', 0, 0, 0);
INSERT INTO `xxl_job_info` VALUES (3, 1, '临时文件清理任务', '2022-12-02 11:33:55', '2022-12-02 11:39:57', 'admin', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'clearTempFileJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2022-12-02 11:33:55', '', 1, 1672675200000, 1672761600000);
INSERT INTO `xxl_job_info` VALUES (4, 1, 'ERP临时文件清理任务', '2022-12-21 18:02:03', '2022-12-21 18:02:26', 'admin', '', 'CRON', '0 0 0 * * ? *', 'DO_NOTHING', 'FIRST', 'clearFinanceERPTempFileJobHandler', '', 'SERIAL_EXECUTION', 0, 0, 'BEAN', '', 'GLUE代码初始化', '2022-12-21 18:02:03', '', 1, 1672675200000, 1672761600000);

-- ----------------------------
-- Table structure for xxl_job_lock
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_lock`;
CREATE TABLE `xxl_job_lock`  (
  `lock_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '锁名称',
  PRIMARY KEY (`lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_lock
-- ----------------------------
INSERT INTO `xxl_job_lock` VALUES ('schedule_lock');

-- ----------------------------
-- Table structure for xxl_job_log
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log`;
CREATE TABLE `xxl_job_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `job_group` int(0) NOT NULL COMMENT '执行器主键ID',
  `job_id` int(0) NOT NULL COMMENT '任务，主键ID',
  `executor_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器地址，本次执行的地址',
  `executor_handler` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务handler',
  `executor_param` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务参数',
  `executor_sharding_param` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '执行器任务分片参数，格式如 1/2',
  `executor_fail_retry_count` int(0) NOT NULL DEFAULT 0 COMMENT '失败重试次数',
  `trigger_time` datetime(0) NULL DEFAULT NULL COMMENT '调度-时间',
  `trigger_code` int(0) NOT NULL COMMENT '调度-结果',
  `trigger_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '调度-日志',
  `handle_time` datetime(0) NULL DEFAULT NULL COMMENT '执行-时间',
  `handle_code` int(0) NOT NULL COMMENT '执行-状态',
  `handle_msg` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '执行-日志',
  `alarm_status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `I_trigger_time`(`trigger_time`) USING BTREE,
  INDEX `I_handle_code`(`handle_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_log
-- ----------------------------
INSERT INTO `xxl_job_log` VALUES (7, 1, 3, 'http://192.168.10.2:9901/', 'clearTempFileJobHandler', '', NULL, 0, '2022-12-10 15:38:47', 200, '任务触发类型：手动触发<br>调度机器：192.168.10.2<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.10.2:9901/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.10.2:9901/<br>code：200<br>msg：null', '2022-12-10 15:38:47', 200, '', 0);
INSERT INTO `xxl_job_log` VALUES (8, 1, 3, 'http://192.168.10.2:9901/', 'clearTempFileJobHandler', '', NULL, 0, '2022-12-11 12:52:59', 200, '任务触发类型：手动触发<br>调度机器：192.168.10.2<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.10.2:9901/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.10.2:9901/<br>code：200<br>msg：null', '2022-12-11 12:52:59', 200, '', 0);
INSERT INTO `xxl_job_log` VALUES (9, 1, 3, 'http://192.168.56.1:9901/', 'clearTempFileJobHandler', '', NULL, 0, '2022-12-18 09:15:30', 200, '任务触发类型：手动触发<br>调度机器：192.168.56.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.56.1:9901/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.56.1:9901/<br>code：200<br>msg：null', '2022-12-18 09:15:30', 200, '', 0);
INSERT INTO `xxl_job_log` VALUES (10, 1, 4, 'http://192.168.56.1:9901/', 'clearFinanceERPTempFileJobHandler', '', NULL, 0, '2022-12-21 18:02:13', 200, '任务触发类型：手动触发<br>调度机器：192.168.56.1<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://192.168.56.1:9901/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://192.168.56.1:9901/<br>code：200<br>msg：null', '2022-12-21 18:02:13', 200, '', 0);
INSERT INTO `xxl_job_log` VALUES (11, 1, 3, 'http://10.0.4.7:9901/', 'clearTempFileJobHandler', '', NULL, 0, '2023-01-03 00:00:00', 200, '任务触发类型：Cron触发<br>调度机器：10.0.4.7<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.0.4.7:9901/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.0.4.7:9901/<br>code：200<br>msg：null', '2023-01-03 00:00:01', 200, '', 0);
INSERT INTO `xxl_job_log` VALUES (12, 1, 4, 'http://10.0.4.7:9901/', 'clearFinanceERPTempFileJobHandler', '', NULL, 0, '2023-01-03 00:00:00', 200, '任务触发类型：Cron触发<br>调度机器：10.0.4.7<br>执行器-注册方式：自动注册<br>执行器-地址列表：[http://10.0.4.7:9901/]<br>路由策略：第一个<br>阻塞处理策略：单机串行<br>任务超时时间：0<br>失败重试次数：0<br><br><span style=\"color:#00c0ef;\" > >>>>>>>>>>>触发调度<<<<<<<<<<< </span><br>触发调度：<br>address：http://10.0.4.7:9901/<br>code：200<br>msg：null', '2023-01-03 00:00:01', 500, 'java.lang.reflect.InvocationTargetException\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at com.xxl.job.core.handler.impl.MethodJobHandler.execute(MethodJobHandler.java:31)\n	at com.xxl.job.core.thread.JobThread.run(JobThread.java:166)\nCaused by: org.apache.dubbo.rpc.RpcException: Failed to invoke the method clearTempFiles in the service com.erahub.biz.finance.api.RemoteFinanceERPService. Tried 3 times of the providers [10.0.4.7:20880] (1/1) from the registry 127.0.0.1:8848 on the consumer 10.0.4.7 using the dubbo version 3.1.3. Last error is: Failed to invoke remote method: clearTempFiles, provider: DefaultServiceInstance{serviceName=\'erahub-biz\', host=\'10.0.4.7\', port=20880, enabled=true, healthy=true, metadata={dubbo.endpoints=[{\"port\":20880,\"protocol\":\"dubbo\"}], dubbo.metadata.revision=751bb40c2da13cce1712eb919750186e, dubbo.metadata.storage-type=remote, timestamp=1672626245592}}, cause: org.apache.dubbo.remoting.RemotingException: java.lang.NullPointerException\njava.lang.NullPointerException\n	at java.util.concurrent.ConcurrentHashMap.get(ConcurrentHashMap.java:936)\n	at org.apache.dubbo.rpc.support.GroupServiceKeyCache.getServiceKey(GroupServiceKeyCache.java:37)\n	at org.apache.dubbo.rpc.support.ProtocolUtils.serviceKey(ProtocolUtils.java:51)\n	at org.apache.dubbo.rpc.protocol.AbstractProtocol.serviceKey(AbstractProtocol.java:83)\n	at org.apache.dubbo.rpc.protocol.dubbo.DubboProtocol.getInvoker(DubboProtocol.java:282)\n	at org.apache.dubbo.rpc.protocol.dubbo.DubboProtocol$1.reply(DubboProtocol.java:126)\n	at org.apache.dubbo.remoting.exchange.support.header.HeaderExchangeHandler.handleRequest(HeaderExchangeHandler.java:102)\n	at org.apache.dubbo.remoting.exchange.support.header.HeaderExchangeHandler.received(HeaderExchangeHandler.java:177)\n	at org.apache.dubbo.remoting.transport.DecodeHandler.received(DecodeHandler.java:53)\n	at org.apache.dubbo.remoting.transport.dispatcher.ChannelEventRunnable.run(ChannelEventRunnable.java:61)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.dubbo.common.threadlocal.InternalRunnable.run(InternalRunnable.java:41)\n	at java.lang.Thread.run(Thread.java:826)\n\n	at org.apache.dubbo.rpc.cluster.support.FailoverClusterInvoker.doInvoke(FailoverClusterInvoker.java:115)\n	at org.apache.dubbo.rpc.cluster.support.AbstractClusterInvoker.invoke(AbstractClusterInvoker.java:341)\n	at org.apache.dubbo.rpc.cluster.router.RouterSnapshotFilter.invoke(RouterSnapshotFilter.java:46)\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:327)\n	at org.apache.dubbo.monitor.support.MonitorFilter.invoke(MonitorFilter.java:100)\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:327)\n	at org.apache.dubbo.rpc.protocol.dubbo.filter.FutureFilter.invoke(FutureFilter.java:52)\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:327)\n	at org.apache.dubbo.rpc.cluster.filter.support.ConsumerContextFilter.invoke(ConsumerContextFilter.java:110)\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:327)\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CallbackRegistrationInvoker.invoke(FilterChainBuilder.java:194)\n	at org.apache.dubbo.rpc.cluster.support.wrapper.AbstractCluster$ClusterFilterInvoker.invoke(AbstractCluster.java:92)\n	at org.apache.dubbo.rpc.cluster.support.wrapper.MockClusterInvoker.invoke(MockClusterInvoker.java:103)\n	at org.apache.dubbo.registry.client.migration.MigrationInvoker.invoke(MigrationInvoker.java:284)\n	at org.apache.dubbo.rpc.proxy.InvocationUtil.invoke(InvocationUtil.java:56)\n	at org.apache.dubbo.rpc.proxy.InvokerInvocationHandler.invoke(InvokerInvocationHandler.java:75)\n	at com.erahub.biz.finance.api.RemoteFinanceERPServiceDubboProxy4.clearTempFiles(RemoteFinanceERPServiceDubboProxy4.java)\n	at sun.reflect.NativeMethodAccessorImpl.invoke0(Native Method)\n	at sun.reflect.NativeMethodAccessorImpl.invoke(NativeMethodAccessorImpl.java:62)\n	at sun.reflect.DelegatingMethodAccessorImpl.invoke(DelegatingMethodAccessorImpl.java:43)\n	at java.lang.reflect.Method.invoke(Method.java:498)\n	at org.springframework.aop.support.AopUtils.invokeJoinpointUsingReflection(AopUtils.java:344)\n	at org.springframework.aop.framework.JdkDynamicAopProxy.invoke(JdkDynamicAopProxy.java:208)\n	at com.sun.proxy.$Proxy145.clearTempFiles(Unknown Source)\n	at com.erahub.job.service.business.finance.FinanceERPService.clearTempFileJobHandler(FinanceERPService.java:24)\n	... 6 more\nCaused by: java.util.concurrent.ExecutionException: org.apache.dubbo.remoting.RemotingException: java.lang.NullPointerException\njava.lang.NullPointerException\n	at java.util.concurrent.ConcurrentHashMap.get(ConcurrentHashMap.java:936)\n	at org.apache.dubbo.rpc.support.GroupServiceKeyCache.getServiceKey(GroupServiceKeyCache.java:37)\n	at org.apache.dubbo.rpc.support.ProtocolUtils.serviceKey(ProtocolUtils.java:51)\n	at org.apache.dubbo.rpc.protocol.AbstractProtocol.serviceKey(AbstractProtocol.java:83)\n	at org.apache.dubbo.rpc.protocol.dubbo.DubboProtocol.getInvoker(DubboProtocol.java:282)\n	at org.apache.dubbo.rpc.protocol.dubbo.DubboProtocol$1.reply(DubboProtocol.java:126)\n	at org.apache.dubbo.remoting.exchange.support.header.HeaderExchangeHandler.handleRequest(HeaderExchangeHandler.java:102)\n	at org.apache.dubbo.remoting.exchange.support.header.HeaderExchangeHandler.received(HeaderExchangeHandler.java:177)\n	at org.apache.dubbo.remoting.transport.DecodeHandler.received(DecodeHandler.java:53)\n	at org.apache.dubbo.remoting.transport.dispatcher.ChannelEventRunnable.run(ChannelEventRunnable.java:61)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.dubbo.common.threadlocal.InternalRunnable.run(InternalRunnable.java:41)\n	at java.lang.Thread.run(Thread.java:826)\n\n	at java.util.concurrent.CompletableFuture.reportGet(CompletableFuture.java:357)\n	at java.util.concurrent.CompletableFuture.get(CompletableFuture.java:1928)\n	at org.apache.dubbo.rpc.AsyncRpcResult.get(AsyncRpcResult.java:196)\n	at org.apache.dubbo.rpc.protocol.AbstractInvoker.waitForResultIfSync(AbstractInvoker.java:265)\n	at org.apache.dubbo.rpc.protocol.AbstractInvoker.invoke(AbstractInvoker.java:186)\n	at org.apache.dubbo.rpc.listener.ListenerInvokerWrapper.invoke(ListenerInvokerWrapper.java:70)\n	at com.erahub.common.dubbo.filter.DubboRequestFilter.invoke(DubboRequestFilter.java:42)\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:327)\n	at org.apache.dubbo.validation.filter.ValidationFilter.invoke(ValidationFilter.java:98)\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:327)\n	at io.seata.integration.dubbo.ApacheDubboTransactionPropagationFilter.invoke(ApacheDubboTransactionPropagationFilter.java:64)\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:327)\n	at com.alibaba.dubbo.rpc.Invoker$CompatibleInvoker.invoke(Invoker.java:55)\n	at io.seata.integration.dubbo.alibaba.AlibabaDubboTransactionPropagationFilter.invoke(AlibabaDubboTransactionPropagationFilter.java:45)\n	at com.alibaba.dubbo.rpc.Filter.invoke(Filter.java:29)\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:327)\n	at com.erahub.common.mybatis.filter.DubboDataPermissionFilter.invoke(DubboDataPermissionFilter.java:25)\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:327)\n	at cn.dev33.satoken.context.dubbo.filter.SaTokenDubboConsumerFilter.invoke(SaTokenDubboConsumerFilter.java:42)\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CopyOfFilterChainNode.invoke(FilterChainBuilder.java:327)\n	at org.apache.dubbo.rpc.cluster.filter.FilterChainBuilder$CallbackRegistrationInvoker.invoke(FilterChainBuilder.java:194)\n	at org.apache.dubbo.rpc.cluster.support.AbstractClusterInvoker.invokeWithContext(AbstractClusterInvoker.java:379)\n	at org.apache.dubbo.rpc.cluster.support.FailoverClusterInvoker.doInvoke(FailoverClusterInvoker.java:81)\n	... 30 more\nCaused by: org.apache.dubbo.remoting.RemotingException: java.lang.NullPointerException\njava.lang.NullPointerException\n	at java.util.concurrent.ConcurrentHashMap.get(ConcurrentHashMap.java:936)\n	at org.apache.dubbo.rpc.support.GroupServiceKeyCache.getServiceKey(GroupServiceKeyCache.java:37)\n	at org.apache.dubbo.rpc.support.ProtocolUtils.serviceKey(ProtocolUtils.java:51)\n	at org.apache.dubbo.rpc.protocol.AbstractProtocol.serviceKey(AbstractProtocol.java:83)\n	at org.apache.dubbo.rpc.protocol.dubbo.DubboProtocol.getInvoker(DubboProtocol.java:282)\n	at org.apache.dubbo.rpc.protocol.dubbo.DubboProtocol$1.reply(DubboProtocol.java:126)\n	at org.apache.dubbo.remoting.exchange.support.header.HeaderExchangeHandler.handleRequest(HeaderExchangeHandler.java:102)\n	at org.apache.dubbo.remoting.exchange.support.header.HeaderExchangeHandler.received(HeaderExchangeHandler.java:177)\n	at org.apache.dubbo.remoting.transport.DecodeHandler.received(DecodeHandler.java:53)\n	at org.apache.dubbo.remoting.transport.dispatcher.ChannelEventRunnable.run(ChannelEventRunnable.java:61)\n	at java.util.concurrent.ThreadPoolExecutor.runWorker(ThreadPoolExecutor.java:1149)\n	at java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:624)\n	at org.apache.dubbo.common.threadlocal.InternalRunnable.run(InternalRunnable.java:41)\n	at java.lang.Thread.run(Thread.java:826)\n\n	at org.apache.dubbo.remoting.exchange.support.DefaultFuture.doReceived(DefaultFuture.java:224)\n	at org.apache.dubbo.remoting.exchange.support.DefaultFuture.received(DefaultFuture.java:186)\n	at org.apache.dubbo.remoting.exchange.support.DefaultFuture.received(DefaultFuture.java:174)\n	at org.apache.dubbo.remoting.exchange.support.header.HeaderExchangeHandler.handleResponse(HeaderExchangeHandler.java:62)\n	at org.apache.dubbo.remoting.exchange.support.header.HeaderExchangeHandler.received(HeaderExchangeHandler.java:183)\n	at org.apache.dubbo.remoting.transport.DecodeHandler.received(DecodeHandler.java:53)\n	at org.apache.dubbo.remoting.transport.dispatcher.ChannelEventRunnable.run(ChannelEventRunnable.java:61)\n	at org.apache.dubbo.common.threadpool.ThreadlessExecutor$RunnableWrapper.run(ThreadlessExecutor.java:184)\n	at org.apache.dubbo.common.threadpool.ThreadlessExecutor.waitAndDrain(ThreadlessExecutor.java:103)\n	at org.apache.dubbo.rpc.AsyncRpcResult.get(AsyncRpcResult.java:194)\n	... 50 more\n', 2);

-- ----------------------------
-- Table structure for xxl_job_log_report
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_log_report`;
CREATE TABLE `xxl_job_log_report`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `trigger_day` datetime(0) NULL DEFAULT NULL COMMENT '调度-时间',
  `running_count` int(0) NOT NULL DEFAULT 0 COMMENT '运行中-日志数量',
  `suc_count` int(0) NOT NULL DEFAULT 0 COMMENT '执行成功-日志数量',
  `fail_count` int(0) NOT NULL DEFAULT 0 COMMENT '执行失败-日志数量',
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_trigger_day`(`trigger_day`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 60 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_log_report
-- ----------------------------
INSERT INTO `xxl_job_log_report` VALUES (1, '2022-09-10 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (2, '2022-09-09 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (3, '2022-09-08 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (4, '2022-09-11 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (5, '2022-09-12 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (6, '2022-09-14 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (7, '2022-09-13 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (8, '2022-09-15 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (9, '2022-09-19 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (10, '2022-09-18 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (11, '2022-09-17 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (12, '2022-09-20 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (13, '2022-09-25 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (14, '2022-09-24 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (15, '2022-09-23 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (16, '2022-09-28 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (17, '2022-09-27 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (18, '2022-09-26 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (19, '2022-09-29 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (20, '2022-09-30 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (21, '2022-10-01 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (22, '2022-10-02 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (23, '2022-10-03 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (24, '2022-10-08 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (25, '2022-10-07 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (26, '2022-10-06 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (27, '2022-10-21 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (28, '2022-10-20 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (29, '2022-10-19 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (30, '2022-10-29 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (31, '2022-10-28 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (32, '2022-10-27 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (33, '2022-10-31 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (34, '2022-10-30 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (35, '2022-11-01 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (36, '2022-11-05 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (37, '2022-11-04 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (38, '2022-11-03 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (39, '2022-12-02 00:00:00', 0, 2, 4, NULL);
INSERT INTO `xxl_job_log_report` VALUES (40, '2022-12-01 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (41, '2022-11-30 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (42, '2022-12-10 00:00:00', 0, 1, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (43, '2022-12-09 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (44, '2022-12-08 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (45, '2022-12-11 00:00:00', 0, 1, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (46, '2022-12-13 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (47, '2022-12-12 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (48, '2022-12-14 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (49, '2022-12-17 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (50, '2022-12-16 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (51, '2022-12-15 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (52, '2022-12-18 00:00:00', 0, 1, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (53, '2022-12-21 00:00:00', 0, 1, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (54, '2022-12-20 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (55, '2022-12-19 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (56, '2023-01-02 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (57, '2023-01-01 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (58, '2022-12-31 00:00:00', 0, 0, 0, NULL);
INSERT INTO `xxl_job_log_report` VALUES (59, '2023-01-03 00:00:00', 0, 1, 1, NULL);

-- ----------------------------
-- Table structure for xxl_job_logglue
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_logglue`;
CREATE TABLE `xxl_job_logglue`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `job_id` int(0) NOT NULL COMMENT '任务，主键ID',
  `glue_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'GLUE类型',
  `glue_source` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT 'GLUE源代码',
  `glue_remark` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT 'GLUE备注',
  `add_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_logglue
-- ----------------------------

-- ----------------------------
-- Table structure for xxl_job_registry
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_registry`;
CREATE TABLE `xxl_job_registry`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `registry_group` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `registry_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `registry_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i_g_k_v`(`registry_group`, `registry_key`, `registry_value`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_registry
-- ----------------------------
INSERT INTO `xxl_job_registry` VALUES (51, 'EXECUTOR', 'erahub-job-executor', 'http://10.0.4.7:9901/', '2023-01-03 18:52:51');

-- ----------------------------
-- Table structure for xxl_job_user
-- ----------------------------
DROP TABLE IF EXISTS `xxl_job_user`;
CREATE TABLE `xxl_job_user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '账号',
  `password` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '密码',
  `role` tinyint(0) NOT NULL COMMENT '角色：0-普通用户、1-管理员',
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限：执行器ID列表，多个逗号分割',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `i_username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xxl_job_user
-- ----------------------------
INSERT INTO `xxl_job_user` VALUES (1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1, NULL);

SET FOREIGN_KEY_CHECKS = 1;
