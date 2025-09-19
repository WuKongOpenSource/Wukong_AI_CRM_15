create database wk_crm_nacos character set utf8mb4 collate utf8mb4_general_ci;
use wk_crm_nacos;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for config_info
-- ----------------------------
DROP TABLE IF EXISTS `config_info`;
CREATE TABLE `config_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `c_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `c_use` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `effect` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `c_schema` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL,
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfo_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info
-- ----------------------------
INSERT INTO `config_info` VALUES (24, 'service.vgroupMapping.hrm_tx_group', 'SEATA_GROUP', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2023-12-08 11:26:40', '2023-12-08 11:26:40', NULL, '192.168.1.116', '', '', '', NULL, NULL, 'text', NULL, '');
INSERT INTO `config_info` VALUES (25, 'seataServer.properties', 'SEATA_GROUP', '#For details about configuration items, see https://seata.io/zh-cn/docs/user/configurations.html\n#Transport configuration, for client and server\ntransport.type=TCP\ntransport.server=NIO\ntransport.heartbeat=true\ntransport.enableTmClientBatchSendRequest=false\ntransport.enableRmClientBatchSendRequest=true\ntransport.enableTcServerBatchSendResponse=false\ntransport.rpcRmRequestTimeout=30000\ntransport.rpcTmRequestTimeout=30000\ntransport.rpcTcRequestTimeout=30000\ntransport.threadFactory.bossThreadPrefix=NettyBoss\ntransport.threadFactory.workerThreadPrefix=NettyServerNIOWorker\ntransport.threadFactory.serverExecutorThreadPrefix=NettyServerBizHandler\ntransport.threadFactory.shareBossWorker=false\ntransport.threadFactory.clientSelectorThreadPrefix=NettyClientSelector\ntransport.threadFactory.clientSelectorThreadSize=1\ntransport.threadFactory.clientWorkerThreadPrefix=NettyClientWorkerThread\ntransport.threadFactory.bossThreadSize=1\ntransport.threadFactory.workerThreadSize=default\ntransport.shutdown.wait=3\ntransport.serialization=seata\ntransport.compressor=none\n\n#Transaction routing rules configuration, only for the client\nservice.vgroupMapping.default_tx_group=default\n\n\n#Transaction rule configuration, only for the client\nclient.rm.asyncCommitBufferLimit=10000\nclient.rm.lock.retryInterval=10\nclient.rm.lock.retryTimes=30\nclient.rm.lock.retryPolicyBranchRollbackOnConflict=true\nclient.rm.reportRetryCount=5\nclient.rm.tableMetaCheckEnable=true\nclient.rm.tableMetaCheckerInterval=60000\nclient.rm.sqlParserType=druid\nclient.rm.reportSuccessEnable=false\nclient.rm.sagaBranchRegisterEnable=false\nclient.rm.sagaJsonParser=fastjson\nclient.rm.tccActionInterceptorOrder=-2147482648\nclient.tm.commitRetryCount=5\nclient.tm.rollbackRetryCount=5\nclient.tm.defaultGlobalTransactionTimeout=60000\nclient.tm.degradeCheck=false\nclient.tm.degradeCheckAllowTimes=10\nclient.tm.degradeCheckPeriod=2000\nclient.tm.interceptorOrder=-2147482648\nclient.undo.dataValidation=true\nclient.undo.logSerialization=jackson\nclient.undo.onlyCareUpdateColumns=true\nserver.undo.logSaveDays=7\nserver.undo.logDeletePeriod=86400000\nclient.undo.logTable=undo_log\nclient.undo.compress.enable=true\nclient.undo.compress.type=zip\nclient.undo.compress.threshold=64k\n#For TCC transaction mode\ntcc.fence.logTableName=tcc_fence_log\ntcc.fence.cleanPeriod=1h\n\n#Log rule configuration, for client and server\nlog.exceptionRate=100\n\n#Transaction storage configuration, only for the server. The file, db, and redis configuration values are optional.\nstore.mode=db\n\n#These configurations are required if the `store mode` is `db`. If `store.mode,store.lock.mode,store.session.mode` are not equal to `db`, you can remove the configuration block.\nstore.db.datasource=druid\nstore.db.dbType=mysql\nstore.db.driverClassName=com.mysql.cj.jdbc.Driver\nstore.db.url=jdbc:mysql://127.0.0.1:3306/wk_crm_seata?characterEncoding=utf8&useSSL=false&zeroDateTimeBehavior=convertToNull&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&useAffectedRows=true&allowPublicKeyRetrieval=true&rewriteBatchedStatements=true\nstore.db.user=root\nstore.db.password=password\nstore.db.minConn=5\nstore.db.maxConn=30\nstore.db.globalTable=global_table\nstore.db.branchTable=branch_table\nstore.db.distributedLockTable=distributed_lock\nstore.db.queryLimit=100\nstore.db.lockTable=lock_table\nstore.db.maxWait=5000\n\n\n#Transaction rule configuration, only for the server\nserver.recovery.committingRetryPeriod=1000\nserver.recovery.asynCommittingRetryPeriod=1000\nserver.recovery.rollbackingRetryPeriod=1000\nserver.recovery.timeoutRetryPeriod=1000\nserver.maxCommitRetryTimeout=-1\nserver.maxRollbackRetryTimeout=-1\nserver.rollbackRetryTimeoutUnlockEnable=false\nserver.distributedLockExpireTime=10000\nserver.xaerNotaRetryTimeout=60000\nserver.session.branchAsyncQueueSize=5000\nserver.session.enableBranchAsyncRemove=false\nserver.enableParallelRequestHandle=false', 'acb09bd127b296c2a63d30115391c0d3', '2023-12-08 11:26:40', '2023-12-08 11:26:40', NULL, '192.168.1.116', '', '', '', NULL, NULL, 'properties', NULL, '');
INSERT INTO `config_info` VALUES (26, 'service.vgroupMapping.jxc_tx_group', 'SEATA_GROUP', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2023-12-08 11:26:40', '2023-12-08 11:26:40', NULL, '192.168.1.116', '', '', '', NULL, NULL, 'text', NULL, '');
INSERT INTO `config_info` VALUES (27, 'service.vgroupMapping.admin_tx_group', 'SEATA_GROUP', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2023-12-08 11:26:40', '2023-12-08 11:26:40', NULL, '192.168.1.116', '', '', '', NULL, NULL, 'text', NULL, '');
INSERT INTO `config_info` VALUES (28, 'spring-datasource-gateway.yml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    url: jdbc:mysql://127.0.0.1:3306/wk_crm_nacos?characterEncoding=utf8&useSSL=false&zeroDateTimeBehavior=convertToNull&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&useAffectedRows=true&allowPublicKeyRetrieval=true\n    username: root\n    password: password', '466fbb6b0e9eb07c17679c0794a5683d', '2023-12-08 11:26:40', '2023-12-08 11:26:40', NULL, '192.168.1.116', '', '', 'gateway配置', NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (29, 'service.vgroupMapping.examine_tx_group', 'SEATA_GROUP', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2023-12-08 11:26:40', '2023-12-08 11:26:40', NULL, '192.168.1.116', '', '', '', NULL, NULL, 'text', NULL, '');
INSERT INTO `config_info` VALUES (30, 'service.vgroupMapping.module_tx_group', 'SEATA_GROUP', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2023-12-08 11:26:40', '2023-12-08 11:26:40', NULL, '192.168.1.116', '', '', '', NULL, NULL, 'text', NULL, '');
INSERT INTO `config_info` VALUES (31, 'service.vgroupMapping.crm_tx_group', 'SEATA_GROUP', 'default', 'c21f969b5f03d33d43e04f8f136e7682', '2023-12-08 11:26:40', '2023-12-08 11:26:40', NULL, '192.168.1.116', '', '', '', NULL, NULL, 'text', NULL, '');
INSERT INTO `config_info` VALUES (49, 'spring-redis.yml', 'DEFAULT_GROUP', 'spring:\r\n  data:\r\n    redis:\r\n      host: redis\r\n      port: 6379\r\n      password: 123456\r\n      database: 8\r\n      lettuce:\r\n        pool:\r\n          max-active: 300\r\njetcache:\r\n  statIntervalMinutes: 0\r\n  areaInCacheName: false\r\n  local:\r\n    default:\r\n      type: caffeine\r\n      limit: 1000\r\n      keyConvertor: fastjson\r\n      expireAfterWriteInMillis: 100000\r\n  remote:\r\n    default:\r\n      type: redis.lettuce\r\n      keyConvertor: fastjson\r\n      #mode: cluster\r\n      # 不需要password的redis连接为 redis://127.0.0.1:6379/\r\n      uri: redis://123456@redis:6379/', 'e989d9857b6863b908fba6699b7f12bc', '2025-09-13 09:41:25', '2025-09-13 09:41:25', 'nacos', '192.168.1.116', '', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (50, 'wk-base.yml', 'DEFAULT_GROUP', 'wk:\n  config:\n    # 服务销毁前先将服务下线\n    offlineBeforeDestroy: false\n    # 服务销毁前等待时间\n    destroySleepTime: 2000\n    # 是否开启日志记录\n    enableLog: false\n    # 是否开启接口文档\n    enableDoc: false\n  mq:\n    topic: message\n    type: redis\n    accessKey: LE\n    secretKey: NbC26\n    nameSrvAddr: http://127.0.0.1:9876\n    sendMsgTimeoutMillis: 5000\n    consumeThreadNums: 10\n', '80a5467edfa2170c1538455f391ae7fa', '2025-09-13 09:42:07', '2025-09-13 15:23:04', 'nacos', '192.168.1.116', '', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (51, 'wk-admin.yml', 'DEFAULT_GROUP', 'wukong:\n  common:\n    upload:\n      type: aws_s3\n      endpoint: http://minio:9000\n      accessKeyId: minioadmin\n      accessKeySecret: minioadmin\n      bucketName: wukong\n      domain: http://127.0.0.1/\n      extra:\n        publicBucket: wukong-public\n      region: us-east-1\n  captcha:\n    waterMark:\n    jigsaw: classpath:public\nlocale:\n  init:\n    enabled: true\n    type: code\n    path: locale\n\n', 'cb12498874460c5e9c43e61fe511c0e6', '2025-09-13 09:43:02', '2025-09-15 11:38:18', 'nacos', '192.168.1.116', '', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', '', '', '', 'yaml', '', '');
INSERT INTO `config_info` VALUES (52, 'wk-es.yml', 'DEFAULT_GROUP', 'spring:\r\n  elasticsearch:\r\n    # kibana地址 192.168.1.210:5601\r\n    uris: elasticsearch:9200\r\n    username: elastic\r\n    password: c6oRpADe1SW304zDjqKlNst0', 'cea9e248a3ad0bac1bfba20bb57a1a10', '2025-09-13 15:17:02', '2025-09-13 15:17:02', 'nacos', '192.168.1.116', '', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', NULL, NULL, NULL, 'yaml', NULL, '');
INSERT INTO `config_info` VALUES (53, 'spring-datasource-bi.yml', 'DEFAULT_GROUP', 'spring:\n  datasource:\n    type: com.alibaba.druid.pool.DruidDataSource\n    dynamic:\n      primary: default\n      druid:\n        filters:\n        testWhileIdle: true\n        validationQuery: select 1\n      datasource:\n        #默认的数据源配置\n        default:\n          url: jdbc:mysql://mysql:3306/wk_crm_table?characterEncoding=utf8&useSSL=false&zeroDateTimeBehavior=convertToNull&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&useAffectedRows=true&allowPublicKeyRetrieval=true\n          username: root\n          password: wukongCrm@2025\n        #自定义仪表盘数据源配置\n        setting:\n          url: jdbc:mysql://mysql:3306/wk_modules_table?characterEncoding=utf8&useSSL=false&zeroDateTimeBehavior=convertToNull&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&useAffectedRows=true&allowPublicKeyRetrieval=true\n          username: root\n          password: wukongCrm@2025\n        #自定义仪表盘数据\n        bi:\n          url: jdbc:clickhouse://clickhouse:8123/wk_manager?use_server_time_zone=true\n          username:\n          password:\n          driverClassName: com.clickhouse.jdbc.ClickHouseDriver', '7ff555c4a5e65cf0784b71c955370ede', '2025-09-15 13:55:52', '2025-09-15 14:21:18', 'nacos', '192.168.1.116', '', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', '', '', '', 'yaml', '', '');

-- ----------------------------
-- Table structure for config_info_aggr
-- ----------------------------
DROP TABLE IF EXISTS `config_info_aggr`;
CREATE TABLE `config_info_aggr`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `datum_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'datum_id',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '内容',
  `gmt_modified` datetime NOT NULL COMMENT '修改时间',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfoaggr_datagrouptenantdatum`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `datum_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '增加租户字段' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_aggr
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_beta
-- ----------------------------
DROP TABLE IF EXISTS `config_info_beta`;
CREATE TABLE `config_info_beta`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `beta_ips` varchar(1024) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'betaIps',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfobeta_datagrouptenant`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_beta' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_beta
-- ----------------------------

-- ----------------------------
-- Table structure for config_info_route
-- ----------------------------
DROP TABLE IF EXISTS `config_info_route`;
CREATE TABLE `config_info_route`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'id',
  `route_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '路由id',
  `uri` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'uri路径',
  `predicates` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '判定器',
  `filters` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '过滤器',
  `orders` int NULL DEFAULT NULL COMMENT '排序',
  `description` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `intercept` int NOT NULL DEFAULT 1 COMMENT '是否拦截 1 是 0 否',
  `status` int NOT NULL DEFAULT 1 COMMENT '状态：Y-有效，N-无效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `ux_gateway_routes_uri`(`uri` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 713 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '网关路由表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_route
-- ----------------------------
INSERT INTO `config_info_route` VALUES (101, 'authorization', 'lb://authorization', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/authorization*/**\"}}]', '[]', 100, '用户认证相关接口', 0, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (102, 'admin', 'lb://admin', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/admin*/**\"}}]', '[]', 80, '系统管理相关接口', 1, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (103, 'login', 'lb://authorization/login', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/login\"}}]', '[]', 100, '用户登录相关接口', 0, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (104, 'logout', 'lb://authorization/logout', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/logout\"}}]', '[]', 100, '用户退出相关接口', 0, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (105, 'reLogin', 'lb://authorization/reLogin', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/reLogin\"}}]', '[]', 100, '用户重新登录相关接口', 0, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (106, 'crm', 'lb://crm', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/crm*/**\"}}]', '[]', 100, '客户管理相关接口', 1, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (107, 'hrm', 'lb://hrm', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/hrm*/**\"}}]', '[]', 100, '人力资源相关接口', 1, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (108, 'jxc', 'lb://jxc', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/jxc*/**\"}}]', '[]', 100, '进销存相关接口', 1, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (109, 'work', 'lb://work', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/work*/**\"}}]', '[]', 100, '项目管理相关接口', 1, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (113, 'oa', 'lb://oa', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/oa*/**\"}}]', '[]', 100, 'OA相关接口', 1, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (114, 'email', 'lb://email', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/email*/**\"}}]', '[]', 100, '邮箱相关接口', 1, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (115, 'km', 'lb://km', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/km*/**\"}}]', '[]', 100, '知识库相关接口', 1, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (116, 'bi', 'lb://bi', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/bi*/**\"}}]', '[]', 100, '商业智能相关接口', 1, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (119, 'crm-im', 'lb://crm-im', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/crmCall*/**\"}}]', '[]', 98, '呼叫中心接口', 1, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (123, 'permission', 'lb://authorization/permission', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/permission\"}}]', '[]', 100, '用户权限验证接口', 0, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (124, 'examine', 'lb://examine', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/examine*/**\"}}]', '[]', 100, '审批相关接口', 1, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (125, 'scrm', 'lb://scrm', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/scrm*/**\"}}]', '[]', 100, 'scrm相关接口', 1, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (128, 'module', 'lb://module', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/module*/**\"}}]', '[]', 100, '低代码', 1, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (309, 'finance', 'lb://finance', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/finance*/**\"}}]', '[]', 100, '财务系统相关接口', 1, 1, '2020-04-21 17:00:32', '2020-04-21 17:00:32');
INSERT INTO `config_info_route` VALUES (312, 'project', 'lb://work', '[{\"name\":\"Path\",\"args\":{\"pattern\":\"/project*/**\"}}]', '[]', 100, '项目管理相关接口', 1, 1, '2022-10-22 17:42:45', '2020-04-21 17:00:32');

-- ----------------------------
-- Table structure for config_info_tag
-- ----------------------------
DROP TABLE IF EXISTS `config_info_tag`;
CREATE TABLE `config_info_tag`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tag_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_id',
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'content',
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'md5',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL COMMENT 'source user',
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'source ip',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_configinfotag_datagrouptenanttag`(`data_id` ASC, `group_id` ASC, `tenant_id` ASC, `tag_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_info_tag' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_info_tag
-- ----------------------------

-- ----------------------------
-- Table structure for config_tags_relation
-- ----------------------------
DROP TABLE IF EXISTS `config_tags_relation`;
CREATE TABLE `config_tags_relation`  (
  `id` bigint NOT NULL COMMENT 'id',
  `tag_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'tag_name',
  `tag_type` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tag_type',
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'data_id',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'group_id',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `nid` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`nid`) USING BTREE,
  UNIQUE INDEX `uk_configtagrelation_configidtag`(`id` ASC, `tag_name` ASC, `tag_type` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'config_tag_relation' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of config_tags_relation
-- ----------------------------

-- ----------------------------
-- Table structure for group_capacity
-- ----------------------------
DROP TABLE IF EXISTS `group_capacity`;
CREATE TABLE `group_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Group ID，空字符表示整个集群',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数，，0表示使用默认值',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_group_id`(`group_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '集群、各Group容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of group_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for his_config_info
-- ----------------------------
DROP TABLE IF EXISTS `his_config_info`;
CREATE TABLE `his_config_info`  (
  `id` bigint UNSIGNED NOT NULL,
  `nid` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `data_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `group_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `app_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'app_name',
  `content` longtext CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `md5` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `src_user` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL,
  `src_ip` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `op_type` char(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL,
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT '租户字段',
  `encrypted_data_key` text CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT '秘钥',
  PRIMARY KEY (`nid`) USING BTREE,
  INDEX `idx_gmt_create`(`gmt_create` ASC) USING BTREE,
  INDEX `idx_gmt_modified`(`gmt_modified` ASC) USING BTREE,
  INDEX `idx_did`(`data_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 82 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '多租户改造' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of his_config_info
-- ----------------------------
INSERT INTO `his_config_info` VALUES (48, 72, 'spring-datasource-gateway.yml', 'DEFAULT_GROUP', '', 'spring:\r\n  datasource:\r\n    url: jdbc:mysql://127.0.0.1:3306/wk_crm_nacos?characterEncoding=utf8&useSSL=false&zeroDateTimeBehavior=convertToNull&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&useAffectedRows=true&allowPublicKeyRetrieval=true\r\n    username: root\r\n    password: password', 'fba36a3c3a12b9f0d1e1b45f51fb4745', '2025-09-13 09:39:43', '2025-09-13 09:39:43', 'nacos', '192.168.1.116', 'D', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', '');
INSERT INTO `his_config_info` VALUES (0, 73, 'spring-redis.yml', 'DEFAULT_GROUP', '', 'spring:\r\n  data:\r\n    redis:\r\n      host: redis\r\n      port: 6379\r\n      password: 123456\r\n      database: 8\r\n      lettuce:\r\n        pool:\r\n          max-active: 300\r\njetcache:\r\n  statIntervalMinutes: 0\r\n  areaInCacheName: false\r\n  local:\r\n    default:\r\n      type: caffeine\r\n      limit: 1000\r\n      keyConvertor: fastjson\r\n      expireAfterWriteInMillis: 100000\r\n  remote:\r\n    default:\r\n      type: redis.lettuce\r\n      keyConvertor: fastjson\r\n      #mode: cluster\r\n      # 不需要password的redis连接为 redis://127.0.0.1:6379/\r\n      uri: redis://123456@redis:6379/', 'e989d9857b6863b908fba6699b7f12bc', '2025-09-13 09:41:24', '2025-09-13 09:41:25', 'nacos', '192.168.1.116', 'I', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', '');
INSERT INTO `his_config_info` VALUES (0, 74, 'wk-base.yml', 'DEFAULT_GROUP', '', 'wk:\r\n  config:\r\n    # 服务销毁前先将服务下线\r\n    offlineBeforeDestroy: true\r\n    # 服务销毁前等待时间\r\n    destroySleepTime: 2000\r\n    # 是否开启日志记录\r\n    enableLog: false\r\n    # 是否开启接口文档\r\n    enableDoc: false\r\n  mq:\r\n    topic: message\r\n    type: redis\r\n    accessKey: LE\r\n    secretKey: NbC26\r\n    nameSrvAddr: http://127.0.0.1:9876\r\n    sendMsgTimeoutMillis: 5000\r\n    consumeThreadNums: 10\r\n', '159015e4ffcc43ad18f7a87364f2f280', '2025-09-13 09:42:07', '2025-09-13 09:42:07', 'nacos', '192.168.1.116', 'I', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', '');
INSERT INTO `his_config_info` VALUES (0, 75, 'wk-admin.yml', 'DEFAULT_GROUP', '', 'wukong:\r\n  common:\r\n    upload:\r\n      type: aws_s3\r\n      endpoint: http://minio:9000\r\n      accessKeyId: minioadmin\r\n      accessKeySecret: minioadmin\r\n      bucketName: wukong\r\n      domain: http://127.0.0.1/\r\n      extra:\r\n        publicBucket: wukong-public\r\n      region: us-east-1\r\n  captcha:\r\n    waterMark:\r\n    jigsaw: classpath:public\r\nlocale:\r\n  init:\r\n    enabled: true\r\n    type: code\r\n    path: locale\r\n\r\n', 'd7cf6dac4e117c3cb5539f6a8ef2230e', '2025-09-13 09:43:01', '2025-09-13 09:43:02', 'nacos', '192.168.1.116', 'I', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', '');
INSERT INTO `his_config_info` VALUES (0, 76, 'wk-es.yml', 'DEFAULT_GROUP', '', 'spring:\r\n  elasticsearch:\r\n    # kibana地址 192.168.1.210:5601\r\n    uris: elasticsearch:9200\r\n    username: elastic\r\n    password: c6oRpADe1SW304zDjqKlNst0', 'cea9e248a3ad0bac1bfba20bb57a1a10', '2025-09-13 15:17:01', '2025-09-13 15:17:02', 'nacos', '192.168.1.116', 'I', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', '');
INSERT INTO `his_config_info` VALUES (50, 77, 'wk-base.yml', 'DEFAULT_GROUP', '', 'wk:\r\n  config:\r\n    # 服务销毁前先将服务下线\r\n    offlineBeforeDestroy: true\r\n    # 服务销毁前等待时间\r\n    destroySleepTime: 2000\r\n    # 是否开启日志记录\r\n    enableLog: false\r\n    # 是否开启接口文档\r\n    enableDoc: false\r\n  mq:\r\n    topic: message\r\n    type: redis\r\n    accessKey: LE\r\n    secretKey: NbC26\r\n    nameSrvAddr: http://127.0.0.1:9876\r\n    sendMsgTimeoutMillis: 5000\r\n    consumeThreadNums: 10\r\n', '159015e4ffcc43ad18f7a87364f2f280', '2025-09-13 15:23:04', '2025-09-13 15:23:04', 'nacos', '192.168.1.116', 'U', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', '');
INSERT INTO `his_config_info` VALUES (51, 78, 'wk-admin.yml', 'DEFAULT_GROUP', '', 'wukong:\r\n  common:\r\n    upload:\r\n      type: aws_s3\r\n      endpoint: http://minio:9000\r\n      accessKeyId: minioadmin\r\n      accessKeySecret: minioadmin\r\n      bucketName: wukong\r\n      domain: http://127.0.0.1/\r\n      extra:\r\n        publicBucket: wukong-public\r\n      region: us-east-1\r\n  captcha:\r\n    waterMark:\r\n    jigsaw: classpath:public\r\nlocale:\r\n  init:\r\n    enabled: true\r\n    type: code\r\n    path: locale\r\n\r\n', 'd7cf6dac4e117c3cb5539f6a8ef2230e', '2025-09-15 11:32:40', '2025-09-15 11:32:40', 'nacos', '192.168.1.116', 'U', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', '');
INSERT INTO `his_config_info` VALUES (51, 79, 'wk-admin.yml', 'DEFAULT_GROUP', '', 'wukong:\n  common:\n    upload:\n      type: aws_s3\n      endpoint: http://192.168.1.177:9000\n      accessKeyId: minioadmin\n      accessKeySecret: minioadmin\n      bucketName: wukong\n      domain: http://127.0.0.1/\n      extra:\n        publicBucket: wukong-public\n      region: us-east-1\n  captcha:\n    waterMark:\n    jigsaw: classpath:public\nlocale:\n  init:\n    enabled: true\n    type: code\n    path: locale\n\n', 'f023a78ccc95e4246d87680e571c2a91', '2025-09-15 11:38:17', '2025-09-15 11:38:18', 'nacos', '192.168.1.116', 'U', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', '');
INSERT INTO `his_config_info` VALUES (0, 80, 'spring-datasource-bi.yml', 'DEFAULT_GROUP', '', 'spring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    dynamic:\r\n      primary: default\r\n      druid:\r\n        filters:\r\n        testWhileIdle: true\r\n        validationQuery: select 1\r\n      datasource:\r\n        #默认的数据源配置\r\n        default:\r\n          url: jdbc:mysql://mysql:3306/wk_crm_table?characterEncoding=utf8&useSSL=false&zeroDateTimeBehavior=convertToNull&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&useAffectedRows=true&allowPublicKeyRetrieval=true\r\n          username: root\r\n          password: wukongCrm@2025\r\n        #自定义仪表盘数据源配置\r\n        setting:\r\n          url: jdbc:mysql://192.168.1.210:3306/wk_modules_table?characterEncoding=utf8&useSSL=false&zeroDateTimeBehavior=convertToNull&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&useAffectedRows=true&allowPublicKeyRetrieval=true\r\n          username: root\r\n          password: wukongCrm@2025\r\n        #自定义仪表盘数据\r\n        bi:\r\n          url: jdbc:clickhouse://clickhouse:8123/wk_manager?use_server_time_zone=true\r\n          username:\r\n          password:\r\n          driverClassName: com.clickhouse.jdbc.ClickHouseDriver', 'f9747fc6cbf81bf19dc54dffd56f6ffa', '2025-09-15 13:55:51', '2025-09-15 13:55:52', 'nacos', '192.168.1.116', 'I', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', '');
INSERT INTO `his_config_info` VALUES (53, 81, 'spring-datasource-bi.yml', 'DEFAULT_GROUP', '', 'spring:\r\n  datasource:\r\n    type: com.alibaba.druid.pool.DruidDataSource\r\n    dynamic:\r\n      primary: default\r\n      druid:\r\n        filters:\r\n        testWhileIdle: true\r\n        validationQuery: select 1\r\n      datasource:\r\n        #默认的数据源配置\r\n        default:\r\n          url: jdbc:mysql://mysql:3306/wk_crm_table?characterEncoding=utf8&useSSL=false&zeroDateTimeBehavior=convertToNull&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&useAffectedRows=true&allowPublicKeyRetrieval=true\r\n          username: root\r\n          password: wukongCrm@2025\r\n        #自定义仪表盘数据源配置\r\n        setting:\r\n          url: jdbc:mysql://192.168.1.210:3306/wk_modules_table?characterEncoding=utf8&useSSL=false&zeroDateTimeBehavior=convertToNull&tinyInt1isBit=false&serverTimezone=Asia/Shanghai&useAffectedRows=true&allowPublicKeyRetrieval=true\r\n          username: root\r\n          password: wukongCrm@2025\r\n        #自定义仪表盘数据\r\n        bi:\r\n          url: jdbc:clickhouse://clickhouse:8123/wk_manager?use_server_time_zone=true\r\n          username:\r\n          password:\r\n          driverClassName: com.clickhouse.jdbc.ClickHouseDriver', 'f9747fc6cbf81bf19dc54dffd56f6ffa', '2025-09-15 14:21:17', '2025-09-15 14:21:18', 'nacos', '192.168.1.116', 'U', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', '');

-- ----------------------------
-- Table structure for permissions
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions`  (
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `resource` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `action` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  UNIQUE INDEX `uk_role_permission`(`role` ASC, `resource` ASC, `action` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of permissions
-- ----------------------------

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `role` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  UNIQUE INDEX `idx_user_role`(`username` ASC, `role` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('nacos', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for tenant_capacity
-- ----------------------------
DROP TABLE IF EXISTS `tenant_capacity`;
CREATE TABLE `tenant_capacity`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL DEFAULT '' COMMENT 'Tenant ID',
  `quota` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '配额，0表示使用默认值',
  `usage` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '使用量',
  `max_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个配置大小上限，单位为字节，0表示使用默认值',
  `max_aggr_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '聚合子配置最大个数',
  `max_aggr_size` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '单个聚合数据的子配置大小上限，单位为字节，0表示使用默认值',
  `max_history_count` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '最大变更历史数量',
  `gmt_create` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `gmt_modified` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = '租户容量信息表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_capacity
-- ----------------------------

-- ----------------------------
-- Table structure for tenant_info
-- ----------------------------
DROP TABLE IF EXISTS `tenant_info`;
CREATE TABLE `tenant_info`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `kp` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL COMMENT 'kp',
  `tenant_id` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_id',
  `tenant_name` varchar(128) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT '' COMMENT 'tenant_name',
  `tenant_desc` varchar(256) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'tenant_desc',
  `create_source` varchar(32) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NULL DEFAULT NULL COMMENT 'create_source',
  `gmt_create` bigint NOT NULL COMMENT '创建时间',
  `gmt_modified` bigint NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_tenant_info_kptenantid`(`kp` ASC, `tenant_id` ASC) USING BTREE,
  INDEX `idx_tenant_id`(`tenant_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_bin COMMENT = 'tenant_info' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tenant_info
-- ----------------------------
INSERT INTO `tenant_info` VALUES (1, '1', '5ca4ab9f-6cee-4315-8b55-c1fd22b15d2b', 'wkcrm', '悟空默认命名空间', 'nacos', 1702034763194, 1702034763194);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('nacos', '$2a$10$GQNInSmtBqsPamOsbCCfxOvgsrpHO3tKOAhbEVcmn/tJ70W3r.HQy', 1);

SET FOREIGN_KEY_CHECKS = 1;
