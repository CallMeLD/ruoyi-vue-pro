CREATE TABLE IF NOT EXISTS `trade_order` (
     `id` bigint NOT NULL AUTO_INCREMENT,
     `no` varchar(64) NOT NULL,
     `type` int NOT NULL,
     `terminal` int NOT NULL,
     `user_id` bigint NOT NULL,
     `user_ip` varchar(64) NOT NULL,
     `user_remark` varchar(1000) ,
     `status` int NOT NULL,
     `product_count` int NOT NULL,
     `cancel_type` int,
     `remark` varchar(1000) ,
     `pay_status` bit NOT NULL,
     `pay_time` datetime,
     `finish_time` datetime,
     `cancel_time` datetime,
     `original_price` int NOT NULL,
     `order_price` int NOT NULL,
     `discount_price` int NOT NULL,
     `delivery_price` int NOT NULL,
     `adjust_price` int NOT NULL,
     `pay_price` int NOT NULL,
     `pay_order_id` bigint,
     `pay_channel_code` varchar(16) ,
     `delivery_template_id` bigint,
     `logistics_id` bigint,
     `logistics_no` varchar(64) ,
     `delivery_time` datetime,
     `receive_time` datetime,
     `receiver_name` varchar(64) NOT NULL,
     `receiver_mobile` varchar(64) NOT NULL,
     `receiver_area_id` int NOT NULL,
     `receiver_post_code` int,
     `receiver_detail_address` varchar(64) NOT NULL,
     `after_sale_status` int NOT NULL,
     `refund_price` int NOT NULL,
     `coupon_id` bigint NOT NULL,
     `coupon_price` int NOT NULL,
     `point_price` int NOT NULL,
     `creator` varchar(64) DEFAULT '',
     `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
     `updater` varchar(64)  DEFAULT '',
     `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
     `deleted` bit NOT NULL DEFAULT FALSE,
     PRIMARY KEY (`id`)
) COMMENT '交易订单表';

CREATE TABLE IF NOT EXISTS `trade_order_item` (
      `id` bigint NOT NULL AUTO_INCREMENT,
      `user_id` bigint NOT NULL,
      `order_id` bigint NOT NULL,
      `spu_id` bigint NOT NULL,
      `spu_name` varchar(64) NOT NULL,
      `sku_id` bigint NOT NULL,
      `properties` varchar(64) ,
      `pic_url` varchar(255) ,
      `count` int NOT NULL,
      `original_price` int NOT NULL,
      `original_unit_price` int NOT NULL,
      `discount_price` int NOT NULL,
      `pay_price` int NOT NULL,
      `order_part_price` int NOT NULL,
      `order_divide_price` int NOT NULL,
      `after_sale_status` int NOT NULL,
      `creator` varchar(64) DEFAULT '',
      `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
      `updater` varchar(64)  DEFAULT '',
      `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
      `deleted` bit NOT NULL DEFAULT FALSE,
      PRIMARY KEY (`id`)
) COMMENT '交易订单明细表';

CREATE TABLE IF NOT EXISTS `trade_after_sale` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `no` varchar(64) NOT NULL,
    `status` int NOT NULL,
    `type` int NOT NULL,
    `way` int NOT NULL,
    `user_id` bigint NOT NULL,
    `apply_reason` varchar(64) NOT NULL,
    `apply_description` varchar(255) ,
    `apply_pic_urls` varchar(255) ,
    `order_id` bigint NOT NULL,
    `order_no` varchar(64) NOT NULL,
    `order_item_id` bigint NOT NULL,
    `spu_id` bigint NOT NULL,
    `spu_name` varchar(64) NOT NULL,
    `sku_id` bigint NOT NULL,
    `properties` varchar(255) ,
    `pic_url` varchar(255) ,
    `count` int NOT NULL,
    `audit_time` varchar(255) ,
    `audit_user_id` bigint,
    `audit_reason` varchar(255) ,
    `refund_price` int NOT NULL,
    `pay_refund_id` bigint,
    `refund_time` varchar(255) ,
    `logistics_id` bigint,
    `logistics_no` varchar(255) ,
    `delivery_time` varchar(255) ,
    `receive_time` varchar(255) ,
    `receive_reason` varchar(255) ,
    `creator` varchar(64) DEFAULT '',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater` varchar(64)  DEFAULT '',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted` bit NOT NULL DEFAULT FALSE,
    PRIMARY KEY (`id`)
) COMMENT '交易售后表';

CREATE TABLE IF NOT EXISTS `trade_after_sale_log` (
    `id` bigint NOT NULL AUTO_INCREMENT,
    `user_id` bigint NOT NULL,
    `user_type` int NOT NULL,
    `after_sale_id` bigint NOT NULL,
    `order_id` bigint NOT NULL,
    `order_item_id` bigint NOT NULL,
    `before_status` int,
    `after_status` int NOT NULL,
    `content` varchar(64) NOT NULL,
    `creator` varchar(64) DEFAULT '',
    `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater` varchar(64)  DEFAULT '',
    `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted` bit NOT NULL DEFAULT FALSE,
    PRIMARY KEY (`id`)
) COMMENT '交易售后日志';

CREATE TABLE IF NOT EXISTS `trade_brokerage_user`
(
    `id`                bigint   NOT NULL AUTO_INCREMENT,
    `bind_user_id`      bigint   NOT NULL,
    `bind_user_time`    varchar(255) ,
    `brokerage_enabled` bit      NOT NULL,
    `brokerage_time`    varchar(255) ,
    `price`             int      NOT NULL,
    `frozen_price`      int      NOT NULL,
    `creator`           varchar(64)           DEFAULT '',
    `create_time`       datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`           varchar(64)         DEFAULT '',
    `update_time`       datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`           bit      NOT NULL DEFAULT FALSE,
    `tenant_id`         bigint   NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) COMMENT '分销用户';
CREATE TABLE IF NOT EXISTS `trade_brokerage_record`
(
    `id`            int      NOT NULL AUTO_INCREMENT,
    `user_id`       bigint   NOT NULL,
    `biz_id`        varchar(64)   NOT NULL, 
    `biz_type`      varchar(64)   NOT NULL, 
    `title`         varchar(64)   NOT NULL, 
    `price`         int      NOT NULL,
    `total_price`   int      NOT NULL,
    `description`   varchar(64)   NOT NULL, 
    `status`        varchar(64)   NOT NULL, 
    `frozen_days`   int      NOT NULL,
    `unfreeze_time` varchar(255) ,
    `creator`       varchar(64)           DEFAULT '',
    `create_time`   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`       varchar(64)           DEFAULT '',
    `update_time`   datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`       bit      NOT NULL DEFAULT FALSE,
    `tenant_id`      bigint   not null default '0',
    PRIMARY KEY (`id`)
) COMMENT '佣金记录';
CREATE TABLE IF NOT EXISTS `trade_brokerage_withdraw`
(
    `id`                  int      NOT NULL AUTO_INCREMENT,
    `user_id`             bigint   NOT NULL,
    `price`               int      NOT NULL,
    `fee_price`           int      NOT NULL,
    `total_price`         int      NOT NULL,
    `type`                varchar(64)   NOT NULL, 
    `name`                varchar(255) ,
    `account_no`          varchar(255) ,
    `bank_name`           varchar(255) ,
    `bank_address`        varchar(255) ,
    `account_qr_code_url` varchar(255) ,
    `status`              varchar(64)   NOT NULL, 
    `audit_reason`        varchar(255) ,
    `audit_time`          varchar(255) ,
    `remark`              varchar(255) ,
    `creator`             varchar(64)          DEFAULT '',
    `create_time`         datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updater`             varchar(64)          DEFAULT '',
    `update_time`         datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `deleted`             bit      NOT NULL DEFAULT FALSE,
    `tenant_id`      bigint   not null default '0',
    PRIMARY KEY (`id`)
) COMMENT '佣金提现';