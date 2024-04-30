CREATE TABLE IF NOT EXISTS `member_user` (
         `id` bigint NOT NULL AUTO_INCREMENT,
         `nickname` varchar(30) NOT NULL DEFAULT '',
         `name` varchar(30) NULL,
         `sex` tinyint NULL,
         `birthday` datetime NULL,
         `area_id` int NULL,
         `mark` varchar(255) NULL,
         `point` int DEFAULT 0 NULL,
         `avatar` varchar(255) NOT NULL DEFAULT '',
         `status` tinyint NOT NULL,
         `mobile` varchar(11) NOT NULL,
         `password` varchar(100) NOT NULL DEFAULT '',
         `register_ip` varchar(32) NOT NULL,
         `login_ip` varchar(50) NULL DEFAULT '',
         `login_date` datetime NULL DEFAULT NULL,
         `tag_ids` varchar(255) NULL DEFAULT NULL,
         `level_id` bigint NULL DEFAULT NULL,
         `experience` bigint NULL DEFAULT NULL,
         `group_id` bigint NULL DEFAULT NULL,
         `creator` varchar(64) NULL DEFAULT '',
         `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
         `updater` varchar(64) NULL DEFAULT '',
         `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
         `deleted` bit NOT NULL DEFAULT b'0',
         `tenant_id` bigint NOT NULL DEFAULT '0',
         PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '会员表';

CREATE TABLE IF NOT EXISTS `member_address` (
        `id` bigint NOT NULL AUTO_INCREMENT,
        `user_id` bigint NOT NULL,
        `name` varchar(10) NOT NULL,
        `mobile` varchar(20) NOT NULL,
        `area_id` bigint NOT NULL,
        `detail_address` varchar(250) NOT NULL,
        `default_status` bit NOT NULL,
        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `creator` varchar(64) DEFAULT '',
        `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `deleted` bit NOT NULL DEFAULT b'0',
        `updater` varchar(64) DEFAULT '',
        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '用户收件地址';

CREATE TABLE IF NOT EXISTS `member_tag` (
        `id` bigint NOT NULL AUTO_INCREMENT,
        `name` varchar(30) NOT NULL,
        `creator` varchar(64) DEFAULT '',
        `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
        `updater` varchar(64) DEFAULT '',
        `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
        `deleted` bit NOT NULL DEFAULT b'0',
        `tenant_id` bigint NOT NULL DEFAULT '0',
        PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '会员标签';

CREATE TABLE IF NOT EXISTS `member_level` (
      `id` bigint NOT NULL AUTO_INCREMENT,
      `name` varchar(30) NOT NULL,
      `experience` int NOT NULL,
      `level` int NOT NULL,
      `discount_percent` int NOT NULL,
      `icon` varchar(100) NOT NULL,
      `background_url` varchar(300) NOT NULL,
      `creator` varchar(64) DEFAULT '',
      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `updater` varchar(64) DEFAULT '',
      `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `deleted` bit NOT NULL DEFAULT b'0',
      `tenant_id` bigint NOT NULL DEFAULT '0',
      `status` tinyint NOT NULL DEFAULT '0',
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '会员等级';

CREATE TABLE IF NOT EXISTS `member_group` (
      `id` bigint NOT NULL AUTO_INCREMENT,
      `name` varchar(30) NOT NULL,
      `remark` varchar(500) NOT NULL,
      `status` tinyint NOT NULL DEFAULT '0',
      `creator` varchar(64) DEFAULT '',
      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `updater` varchar(64) DEFAULT '',
      `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `deleted` bit NOT NULL DEFAULT b'0',
      `tenant_id` bigint NOT NULL DEFAULT '0',
      PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '用户分组';

CREATE TABLE IF NOT EXISTS `member_brokerage_record` (
     `id` int NOT NULL AUTO_INCREMENT,
     `user_id` bigint NOT NULL,
     `biz_id` varchar(20) NOT NULL,
     `biz_type` varchar(64) NOT NULL,
     `title` varchar(64) NOT NULL,
     `price` int NOT NULL,
     `total_price` int NOT NULL,
     `description` varchar(64) NOT NULL,
     `status` varchar(64) NOT NULL,
     `frozen_days` int NOT NULL,
     `unfreeze_time` varchar(64),
     `creator` varchar(64) DEFAULT '',
     `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `updater` varchar(64) DEFAULT '',
     `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     `deleted` bit NOT NULL DEFAULT b'0',
     `tenant_id` bigint NOT NULL DEFAULT '0',
     PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT '佣金记录';