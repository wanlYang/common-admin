/*
 Navicat Premium Data Transfer

 Source Server         : YANG
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : jy_test

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 09/01/2020 17:21:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for jy_acuser
-- ----------------------------
DROP TABLE IF EXISTS `jy_acuser`;
CREATE TABLE `jy_acuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 535 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of jy_acuser
-- ----------------------------
INSERT INTO `jy_acuser` VALUES (497, '马妮妮', '18092286861');
INSERT INTO `jy_acuser` VALUES (498, '魏莉丽', '18049079382');
INSERT INTO `jy_acuser` VALUES (499, '白鸣', '18229079109');
INSERT INTO `jy_acuser` VALUES (500, '詹春玉', '15291878377');
INSERT INTO `jy_acuser` VALUES (501, '龚楠', '17791411101');
INSERT INTO `jy_acuser` VALUES (502, '金长清', '18629262255');
INSERT INTO `jy_acuser` VALUES (503, '李雅娇', '15829325032');
INSERT INTO `jy_acuser` VALUES (504, '黄梓婕', '18392023606');
INSERT INTO `jy_acuser` VALUES (505, '郭雨婷', '19802992281');
INSERT INTO `jy_acuser` VALUES (506, '王荣利', '18802983726');
INSERT INTO `jy_acuser` VALUES (507, '王瑞娟', '13609242036');
INSERT INTO `jy_acuser` VALUES (508, '李媛', '13027829533');
INSERT INTO `jy_acuser` VALUES (509, '张琴', '13689263070');
INSERT INTO `jy_acuser` VALUES (510, '姚雪', '13892879756');
INSERT INTO `jy_acuser` VALUES (511, '李晓茹', '18700330666');
INSERT INTO `jy_acuser` VALUES (512, '王秀清', '13709112044');
INSERT INTO `jy_acuser` VALUES (513, '杨鹏飞', '13991395716');
INSERT INTO `jy_acuser` VALUES (514, '郭俊', '18066621202');
INSERT INTO `jy_acuser` VALUES (515, '李志鹏', '18292167152');
INSERT INTO `jy_acuser` VALUES (516, '司源', '17868583185');
INSERT INTO `jy_acuser` VALUES (517, '郭俊超', '15319929519');
INSERT INTO `jy_acuser` VALUES (518, '杨彬', '18802927580');
INSERT INTO `jy_acuser` VALUES (519, '张天琦', '13572406008');
INSERT INTO `jy_acuser` VALUES (520, '梁光超', '18710385912');
INSERT INTO `jy_acuser` VALUES (521, '袁峰', '18609281113');
INSERT INTO `jy_acuser` VALUES (522, '王昭云', '13991179140');
INSERT INTO `jy_acuser` VALUES (523, '王昭骏', '13363901889');
INSERT INTO `jy_acuser` VALUES (524, '梁光超', '18883809252');
INSERT INTO `jy_acuser` VALUES (525, '杨学辉', '13280321136');
INSERT INTO `jy_acuser` VALUES (526, '李', '13720582823');
INSERT INTO `jy_acuser` VALUES (527, '郑萌', '15529310929');
INSERT INTO `jy_acuser` VALUES (528, '陈重屹', '17729087898');
INSERT INTO `jy_acuser` VALUES (529, '屈秉慧', '18629012825');
INSERT INTO `jy_acuser` VALUES (530, '刘晶', '13700221441');
INSERT INTO `jy_acuser` VALUES (531, '杨楠', '18220800561');
INSERT INTO `jy_acuser` VALUES (532, '刘丽', '13488146321');
INSERT INTO `jy_acuser` VALUES (533, '郝梅', '13571885669');
INSERT INTO `jy_acuser` VALUES (534, '王钰涵', '18192493351');

-- ----------------------------
-- Table structure for jy_cardsetting
-- ----------------------------
DROP TABLE IF EXISTS `jy_cardsetting`;
CREATE TABLE `jy_cardsetting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '卡项ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '卡项名称',
  `card_type` int(11) NULL DEFAULT NULL COMMENT '1 计时卡  2 次卡  3 时效性次卡 ',
  `money` decimal(20, 2) NULL DEFAULT NULL COMMENT '卡面额',
  `validity` int(255) NULL DEFAULT NULL COMMENT '单位天 有效期',
  `days_can` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '可使用时间 周内 周末1,2,3,4,5,6,7',
  `status` int(11) NULL DEFAULT 1 COMMENT '1 启用  0 未启用',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '可使用开始时间',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '可使用结束时间',
  `remark` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  `num` int(11) NULL DEFAULT NULL COMMENT '次卡次数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jy_cardsetting
-- ----------------------------
INSERT INTO `jy_cardsetting` VALUES (1, '次卡（20）', 1, 1888.00, 200, '周一、周二、周三', 1, '2019-12-17 19:18:04', '2019-12-26 19:18:08', '次卡', '2019-12-16 19:18:15', NULL);
INSERT INTO `jy_cardsetting` VALUES (2, '次卡（50）', 1, 2999.00, 500, '周一、周二、周三', 1, '2019-12-19 19:18:04', '2019-12-27 19:18:08', '次卡', '2019-12-16 19:18:15', NULL);
INSERT INTO `jy_cardsetting` VALUES (3, '年卡', 1, 3980.00, 365, '周一、周二、周三、周四、周五、周六、周天、', 1, '2019-01-01 00:00:00', '2019-01-01 00:00:00', '年卡', '2019-12-18 20:20:52', 0);
INSERT INTO `jy_cardsetting` VALUES (4, '预售年卡', 1, 8888.00, 365, '周一、周二、周三、周四、周五、', 1, '2019-01-01 00:00:00', '2019-01-01 00:00:00', '预售年卡', '2019-12-19 19:18:12', 0);

-- ----------------------------
-- Table structure for jy_clubcard
-- ----------------------------
DROP TABLE IF EXISTS `jy_clubcard`;
CREATE TABLE `jy_clubcard`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '会员卡ID',
  `cust_id` int(11) NULL DEFAULT NULL COMMENT '会员名 关联客户表ID',
  `membercard_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `member_status` int(11) NULL DEFAULT NULL COMMENT '1 无效  2 挂失  3 转让  4 续会  5退费  6待续会 7已过期  ',
  `cardsetting_id` int(11) NULL DEFAULT NULL COMMENT '卡项表cardsetting表主键ID',
  `fromsource_id` int(11) NULL DEFAULT NULL COMMENT '来源表fromsource表主键ID',
  `mt_id` int(11) NULL DEFAULT NULL COMMENT '员工表user表主键',
  `store_scope` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店名',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `paytype_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '拉取付款方式表数据  第一项付款方式',
  `pay_receipts` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款单据',
  `create_user` int(11) NULL DEFAULT NULL COMMENT '员工表user主键ID 创建人',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建的时间',
  `update_user` int(11) NULL DEFAULT NULL COMMENT '员工表user主键ID 修改人',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '修改时间',
  `check_user` int(11) NULL DEFAULT NULL COMMENT '员工表user主键ID 审核人',
  `check_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `start_time` datetime(0) NULL DEFAULT NULL COMMENT '启用日期',
  `end_time` datetime(0) NULL DEFAULT NULL COMMENT '届满日期',
  `payfor` decimal(20, 2) NULL DEFAULT NULL COMMENT '实际收款金额',
  `examine` int(11) NULL DEFAULT 0 COMMENT '审核状态 0 未审核  1 已审核',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jy_clubcard_paytype
-- ----------------------------
DROP TABLE IF EXISTS `jy_clubcard_paytype`;
CREATE TABLE `jy_clubcard_paytype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户会员卡付款方式ID',
  `money` decimal(20, 2) NULL DEFAULT NULL COMMENT '金额',
  `clubcard_id` int(11) NULL DEFAULT NULL COMMENT '会员卡ID',
  `paytype_id` int(11) NULL DEFAULT NULL COMMENT '付款方式ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户会员卡付款方式表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jy_coupons
-- ----------------------------
DROP TABLE IF EXISTS `jy_coupons`;
CREATE TABLE `jy_coupons`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '优惠券ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'name',
  `start_time` datetime(0) NOT NULL COMMENT '开始时间',
  `end_time` datetime(0) NOT NULL COMMENT '结束时间',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券\r\n' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jy_coupons
-- ----------------------------
INSERT INTO `jy_coupons` VALUES (1, '04号入场券', '2020-01-04 00:00:00', '2020-01-04 23:59:59', '/static/images/bxquan.png');

-- ----------------------------
-- Table structure for jy_customer
-- ----------------------------
DROP TABLE IF EXISTS `jy_customer`;
CREATE TABLE `jy_customer`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '客户ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '客户姓名',
  `cus_type` int(11) NOT NULL DEFAULT 0 COMMENT '客户类型 0 潜在 1 会员',
  `sour_id` int(11) NOT NULL COMMENT '客户来源  外键',
  `ic_card_in` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IC卡号 卡内码 不可重复',
  `ic_card_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IC卡编号',
  `store` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '店面名称   固定值',
  `birthday` date NULL DEFAULT NULL COMMENT '生日',
  `sex` int(11) NULL DEFAULT 1 COMMENT '性别 0 男  1 女',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '电话  唯一',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `reception_id` int(11) NULL DEFAULT NULL COMMENT '接待人 拉取员工表',
  `mt_id` int(11) NULL DEFAULT NULL COMMENT '销售顾问 拉取员工表',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱 可为空',
  `intro_id` int(11) NULL DEFAULT 0 COMMENT '介绍人，拉取客户列表',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户资料表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jy_customer
-- ----------------------------
INSERT INTO `jy_customer` VALUES (11, '杨彬', 1, 6, '', '', '金彦舞蹈（经开店）', '1979-01-01', 0, '18802927580', '', 1, 1, '344295704@qq.com', 0, '');

-- ----------------------------
-- Table structure for jy_firstmoney
-- ----------------------------
DROP TABLE IF EXISTS `jy_firstmoney`;
CREATE TABLE `jy_firstmoney`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '定金合约ID',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '定金备注',
  `first_money` int(11) NOT NULL COMMENT '定金金额',
  `pay_type` int(11) NULL DEFAULT NULL COMMENT '付款方式 连接付款方式表 外键',
  `pay_time` datetime(0) NULL DEFAULT NULL COMMENT '付款时间',
  `mt_id` int(11) NULL DEFAULT NULL COMMENT '绑定销售  外键 员工ID',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '编号',
  `end_time` datetime(0) NOT NULL COMMENT '定金结束时间  过期',
  `insert_time` datetime(0) NOT NULL COMMENT '定金合约添加时间',
  `status` int(5) NOT NULL DEFAULT 0 COMMENT '状态 0 未冲账  1 已冲账  2 已退回  3已过期',
  `store` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店面名称',
  `cust_id` int(11) NOT NULL COMMENT '所属客户',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jy_fromsource
-- ----------------------------
DROP TABLE IF EXISTS `jy_fromsource`;
CREATE TABLE `jy_fromsource`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '来源ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `parent_id` int(11) NOT NULL COMMENT '父级ID 关联本表',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jy_fromsource
-- ----------------------------
INSERT INTO `jy_fromsource` VALUES (1, '商桥', 0);
INSERT INTO `jy_fromsource` VALUES (2, '小红书', 1);
INSERT INTO `jy_fromsource` VALUES (3, '百度信息流', 1);
INSERT INTO `jy_fromsource` VALUES (4, '美团', 1);
INSERT INTO `jy_fromsource` VALUES (5, '知乎', 1);
INSERT INTO `jy_fromsource` VALUES (6, '预售', 0);
INSERT INTO `jy_fromsource` VALUES (7, '预售', 6);

-- ----------------------------
-- Table structure for jy_gift
-- ----------------------------
DROP TABLE IF EXISTS `jy_gift`;
CREATE TABLE `jy_gift`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '中奖表ID',
  `acuser_id` int(11) NOT NULL COMMENT '中奖者ID',
  `gift_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '礼品名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 57 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jy_integral
-- ----------------------------
DROP TABLE IF EXISTS `jy_integral`;
CREATE TABLE `jy_integral`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `insert_time` datetime(0) NULL DEFAULT NULL COMMENT '添加时间',
  `amount` int(11) NULL DEFAULT NULL COMMENT '积分数量',
  `cust_id` int(11) NOT NULL COMMENT '关联客户表ID',
  `use_amount` int(11) NULL DEFAULT 0 COMMENT '使用了多少积分',
  `use_time` datetime(0) NULL DEFAULT NULL COMMENT '使用时间',
  `clubcard_num` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cust_id`(`cust_id`) USING BTREE,
  CONSTRAINT `jy_integral_ibfk_1` FOREIGN KEY (`cust_id`) REFERENCES `jy_customer` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jy_paytype
-- ----------------------------
DROP TABLE IF EXISTS `jy_paytype`;
CREATE TABLE `jy_paytype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '付款方式ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款方式名称',
  `valid` int(5) NOT NULL COMMENT '是否有效  0无效 1为有效 ',
  `create_time` datetime(0) NOT NULL ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jy_paytype
-- ----------------------------
INSERT INTO `jy_paytype` VALUES (5, '支付宝', 1, '2019-12-18 20:22:26');
INSERT INTO `jy_paytype` VALUES (6, '刷卡', 1, '2019-12-16 13:05:26');
INSERT INTO `jy_paytype` VALUES (8, '微信', 1, '2019-12-16 13:27:28');
INSERT INTO `jy_paytype` VALUES (10, '信用卡', 1, '2019-12-18 20:22:18');
INSERT INTO `jy_paytype` VALUES (11, '定金', 1, '2019-12-23 15:19:29');

-- ----------------------------
-- Table structure for jy_setwinner
-- ----------------------------
DROP TABLE IF EXISTS `jy_setwinner`;
CREATE TABLE `jy_setwinner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '本表是设定中奖人表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for jy_usercou
-- ----------------------------
DROP TABLE IF EXISTS `jy_usercou`;
CREATE TABLE `jy_usercou`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `cou_id` int(11) NOT NULL COMMENT '优惠券ID',
  `state` tinyint(1) NOT NULL DEFAULT 0 COMMENT '状态   1通过审核     0未审核',
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '优惠券' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of jy_usercou
-- ----------------------------
INSERT INTO `jy_usercou` VALUES (1, 1, 1, 56);
INSERT INTO `jy_usercou` VALUES (8, 1, 1, 59);
INSERT INTO `jy_usercou` VALUES (9, 1, 0, 60);
INSERT INTO `jy_usercou` VALUES (534, 1, 1, 61);
INSERT INTO `jy_usercou` VALUES (497, 1, 1, 62);
INSERT INTO `jy_usercou` VALUES (502, 1, 1, 63);
INSERT INTO `jy_usercou` VALUES (500, 1, 1, 64);
INSERT INTO `jy_usercou` VALUES (505, 1, 1, 65);
INSERT INTO `jy_usercou` VALUES (504, 1, 1, 66);
INSERT INTO `jy_usercou` VALUES (499, 1, 1, 67);
INSERT INTO `jy_usercou` VALUES (498, 1, 1, 68);
INSERT INTO `jy_usercou` VALUES (501, 1, 1, 69);
INSERT INTO `jy_usercou` VALUES (503, 1, 1, 70);
INSERT INTO `jy_usercou` VALUES (506, 1, 1, 71);

-- ----------------------------
-- Table structure for pe_coach
-- ----------------------------
DROP TABLE IF EXISTS `pe_coach`;
CREATE TABLE `pe_coach`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教练名称',
  `staff_id` int(11) NULL DEFAULT NULL COMMENT '员工 拉取员工表ID',
  `store` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分店',
  `fromsource` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来源  固定员工',
  `isManager` tinyint(1) NULL DEFAULT NULL COMMENT '是否经理 0否 1是',
  `coach_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教练编号',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教练手机',
  `free_coach` tinyint(1) NULL DEFAULT NULL COMMENT '是否自由教练 0否 1是',
  `status` int(11) NULL DEFAULT NULL COMMENT '状态 0正常  1请假  2离职',
  `brief_introduction` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '简介',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `sex` tinyint(1) NULL DEFAULT NULL COMMENT '0女 1男',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pe_coach_dance
-- ----------------------------
DROP TABLE IF EXISTS `pe_coach_dance`;
CREATE TABLE `pe_coach_dance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dance_id` int(11) NULL DEFAULT NULL COMMENT '课程ID',
  `coach_id` int(11) NULL DEFAULT NULL COMMENT '教练ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pe_coach_dance
-- ----------------------------
INSERT INTO `pe_coach_dance` VALUES (2, 4, 2);
INSERT INTO `pe_coach_dance` VALUES (3, 4, 3);
INSERT INTO `pe_coach_dance` VALUES (4, 4, 4);
INSERT INTO `pe_coach_dance` VALUES (5, 5, 4);

-- ----------------------------
-- Table structure for pe_contract
-- ----------------------------
DROP TABLE IF EXISTS `pe_contract`;
CREATE TABLE `pe_contract`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '私教合同ID',
  `contract_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '合同编号',
  `cust_id` int(11) NULL DEFAULT NULL COMMENT '客户信息 包括姓名  电话     外键',
  `is_free_class` int(11) NULL DEFAULT NULL COMMENT '是否自由课 0不是  1是',
  `fromsource` int(11) NULL DEFAULT NULL COMMENT '合同来源 拉取来源表数据    外键',
  `coach_in_class` int(11) NULL DEFAULT NULL COMMENT '上课教练  拉取教练表         外键',
  `pe_course` int(11) NULL DEFAULT NULL COMMENT '选择课程表 对应舞种          外键',
  `class_hour` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课时 默认60min/节',
  `mt_id` int(11) NULL DEFAULT NULL COMMENT '销售顾问  拉取员工表         外键',
  `unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '课程单价',
  `purchase_times` int(11) NULL DEFAULT NULL COMMENT '购买次数',
  `freq_present` int(11) NULL DEFAULT NULL COMMENT '赠送次数',
  `total_number` int(11) NULL DEFAULT NULL COMMENT '总次数',
  `total_purchase_amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '购买总金额',
  `total_amount_of_gifts` decimal(10, 2) NULL DEFAULT NULL COMMENT '赠送总金额',
  `total_sum` decimal(10, 2) NULL DEFAULT NULL COMMENT '总金额',
  `effective_date` date NULL DEFAULT NULL COMMENT '生效日期',
  `closing_date` date NULL DEFAULT NULL COMMENT '截止日期',
  `signing_date` date NULL DEFAULT NULL COMMENT '签署日期  ',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `payment_docu` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '付款单据',
  `presentation_points` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '赠送积分',
  `store` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '店面',
  `audit_status` int(11) NULL DEFAULT NULL COMMENT '0未审核 1已审核',
  `status` int(11) NULL DEFAULT NULL COMMENT '0有效 1无效 2过期 3退费',
  `postponement` int(11) NULL DEFAULT NULL COMMENT '0正常 1延1  2延2  3延期3',
  `residual_times` int(11) NULL DEFAULT NULL COMMENT '剩余次数',
  `operator` int(11) NULL DEFAULT NULL COMMENT '操作员  拉取员工表          外键',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `check_user` int(11) NULL DEFAULT NULL COMMENT '审核人',
  `check_time` datetime(0) NULL DEFAULT NULL COMMENT '审核时间',
  `payfor` decimal(10, 2) NULL DEFAULT NULL COMMENT '实际总收款金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pe_contract_paytype
-- ----------------------------
DROP TABLE IF EXISTS `pe_contract_paytype`;
CREATE TABLE `pe_contract_paytype`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '私教合同付款方式ID',
  `money` decimal(20, 2) NULL DEFAULT NULL COMMENT '金额',
  `contract_id` int(11) NULL DEFAULT NULL COMMENT '私教合同ID',
  `paytype_id` int(11) NULL DEFAULT NULL COMMENT '付款方式ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '客户会员卡付款方式表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for pe_dance
-- ----------------------------
DROP TABLE IF EXISTS `pe_dance`;
CREATE TABLE `pe_dance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '私教舞种ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '舞种名称',
  `brief_introduction` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物种简介',
  `store` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分店名称',
  `unit_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '课程单价',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(10) NULL DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `oper_method` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作方法',
  `request_param` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作参数',
  `oper_desc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作说明',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 688 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (44, 1, 'admin', 'com.xieke.admin.web.UserController.userEdit', '{\"id\":1,\"name\":\"超级管理员\",\"state\":1,\"userName\":\"admin\"}', '本人修改用户操作', '2019-12-10 15:24:55', '2019-12-10 15:24:55');
INSERT INTO `sys_log` VALUES (45, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":2,\"permissionIds\":\",14,20,23,24,21,1,2,3,5,\",\"roleCode\":\"test\",\"roleName\":\"测试员\"}', '保存角色操作', '2019-12-10 18:40:49', '2019-12-10 18:40:49');
INSERT INTO `sys_log` VALUES (46, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":2,\"permissionIds\":\",14,20,23,24,21,1,2,3,4,5,\",\"roleCode\":\"test\",\"roleName\":\"测试员\"}', '保存角色操作', '2019-12-10 18:41:44', '2019-12-10 18:41:44');
INSERT INTO `sys_log` VALUES (47, 1, 'admin', 'com.xieke.admin.web.UserController.edit', '{\"id\":9,\"name\":\"test\",\"roleId\":2,\"state\":1}', '修改用户操作', '2019-12-10 18:58:29', '2019-12-10 18:58:29');
INSERT INTO `sys_log` VALUES (48, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"permissionCode\":\"sys\",\"permissionName\":\"系统设置\",\"resourceType\":\"top_directory\",\"url\":\"\"}', '保存权限操作', '2019-12-10 18:59:47', '2019-12-10 18:59:47');
INSERT INTO `sys_log` VALUES (49, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,1,2,3,4,5,6,7,8,9,10,11,12,13,16,17,18,25,34,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-10 19:00:01', '2019-12-10 19:00:01');
INSERT INTO `sys_log` VALUES (50, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":34,\"permissionCode\":\"log\",\"permissionName\":\"日志管理\",\"resourceType\":\"directory\",\"url\":\"\"}', '保存权限操作', '2019-12-10 19:01:13', '2019-12-10 19:01:13');
INSERT INTO `sys_log` VALUES (51, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,1,2,3,4,5,6,7,8,9,10,11,12,13,16,17,18,25,34,35,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-10 19:01:21', '2019-12-10 19:01:21');
INSERT INTO `sys_log` VALUES (52, 1, 'admin', 'com.xieke.admin.web.PermissionController.delBatch', '[34]', '删除权限操作', '2019-12-10 19:02:14', '2019-12-10 19:02:14');
INSERT INTO `sys_log` VALUES (53, 1, 'admin', 'com.xieke.admin.web.PermissionController.delBatch', '[35]', '删除权限操作', '2019-12-10 19:02:20', '2019-12-10 19:02:20');
INSERT INTO `sys_log` VALUES (54, 1, 'admin', 'com.xieke.admin.web.PermissionController.delBatch', '[34]', '删除权限操作', '2019-12-10 19:02:27', '2019-12-10 19:02:27');
INSERT INTO `sys_log` VALUES (55, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":2,\"permissionIds\":\",14,20,23,24,21,1,2,3,5,\",\"roleCode\":\"test\",\"roleName\":\"测试员\"}', '保存角色操作', '2019-12-10 19:54:29', '2019-12-10 19:54:29');
INSERT INTO `sys_log` VALUES (56, 1, 'admin', 'com.xieke.admin.web.PermissionController.delBatch', 'null', '批量删除权限操作', '2019-12-14 16:07:16', '2019-12-14 16:07:16');
INSERT INTO `sys_log` VALUES (57, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":4,\"parentId\":2,\"permissionCode\":\"user:del\",\"permissionName\":\"删除s\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-14 16:17:02', '2019-12-14 16:17:02');
INSERT INTO `sys_log` VALUES (58, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":4,\"parentId\":2,\"permissionCode\":\"user:del\",\"permissionName\":\"删除\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-14 16:17:30', '2019-12-14 16:17:30');
INSERT INTO `sys_log` VALUES (59, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":2,\"parentId\":1,\"permissionCode\":\"user:view\",\"permissionName\":\"客户管理\",\"resourceType\":\"menu\",\"url\":\"/user/list\"}', '保存权限操作', '2019-12-14 16:52:30', '2019-12-14 16:52:30');
INSERT INTO `sys_log` VALUES (60, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":2,\"parentId\":1,\"permissionCode\":\"user:view\",\"permissionName\":\"用户管理\",\"resourceType\":\"menu\",\"url\":\"/user/list\"}', '保存权限操作', '2019-12-14 16:52:55', '2019-12-14 16:52:55');
INSERT INTO `sys_log` VALUES (61, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":0,\"id\":1,\"permissionCode\":\"system\",\"permissionName\":\"系统管理\",\"resourceType\":\"top_directory\",\"url\":\"\"}', '保存权限操作', '2019-12-14 16:53:10', '2019-12-14 16:53:10');
INSERT INTO `sys_log` VALUES (62, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"permissionCode\":\"customer\",\"permissionName\":\"客户管理\",\"resourceType\":\"top_directory\",\"url\":\"\"}', '保存权限操作', '2019-12-14 17:02:35', '2019-12-14 17:02:35');
INSERT INTO `sys_log` VALUES (63, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":35,\"permissionCode\":\"customer:view\",\"permissionName\":\"客户列表\",\"resourceType\":\"directory\",\"url\":\"\"}', '保存权限操作', '2019-12-14 17:05:02', '2019-12-14 17:05:02');
INSERT INTO `sys_log` VALUES (64, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,1,2,3,4,5,6,7,8,9,10,11,12,13,16,17,18,25,35,36,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-14 17:05:14', '2019-12-14 17:05:14');
INSERT INTO `sys_log` VALUES (65, 1, 'admin', 'com.xieke.admin.web.PermissionController.del', '36', '删除权限操作', '2019-12-14 17:13:05', '2019-12-14 17:13:05');
INSERT INTO `sys_log` VALUES (66, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":35,\"permissionCode\":\"customer:view\",\"permissionName\":\"客户列表\",\"resourceType\":\"menu\",\"url\":\"/customer/list\"}', '保存权限操作', '2019-12-14 17:14:49', '2019-12-14 17:14:49');
INSERT INTO `sys_log` VALUES (67, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,1,2,3,4,5,6,7,8,9,10,11,12,13,16,17,18,25,35,37,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-14 17:15:40', '2019-12-14 17:15:40');
INSERT INTO `sys_log` VALUES (68, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":37,\"permissionCode\":\"customer:add\",\"permissionName\":\"新增\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-15 14:45:12', '2019-12-15 14:45:12');
INSERT INTO `sys_log` VALUES (69, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,1,2,3,4,5,6,7,8,9,10,11,12,13,16,17,18,25,35,37,38,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-15 14:45:27', '2019-12-15 14:45:27');
INSERT INTO `sys_log` VALUES (70, 1, 'admin', 'com.xieke.admin.web.CustomerController.save', '{\"birthday\":1583942400000,\"cusType\":0,\"email\":\"18802927580\",\"fromsource\":{\"id\":1},\"icCardId\":\"1231231231\",\"icCardNum\":\"43534545345\",\"id\":0,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":5,\"sex\":0},\"mt\":{\"id\":4},\"name\":\"admin\",\"phone\":\"18802927580\",\"reception\":{\"id\":4},\"remark\":\"是的方法\",\"sex\":1,\"store\":\"士大夫\"}', '保存客户信息操作', '2019-12-15 17:05:40', '2019-12-15 17:05:40');
INSERT INTO `sys_log` VALUES (71, 1, 'admin', 'com.xieke.admin.web.CustomerController.save', '{\"birthday\":1597161600000,\"cusType\":0,\"email\":\"18802927580\",\"fromsource\":{\"id\":1},\"icCardId\":\"111115\",\"icCardNum\":\"43534545345\",\"id\":0,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":3,\"sex\":0},\"mt\":{\"id\":2},\"name\":\"肚皮舞\",\"phone\":\"18802927580\",\"reception\":{\"id\":3},\"remark\":\"稍等\",\"sex\":1,\"store\":\"士大夫\"}', '保存客户信息操作', '2019-12-15 17:32:34', '2019-12-15 17:32:34');
INSERT INTO `sys_log` VALUES (72, 1, 'admin', 'com.xieke.admin.web.CustomerController.save', '{\"birthday\":1597161600000,\"cusType\":0,\"email\":\"344295704@qq.com\",\"fromsource\":{\"id\":1},\"icCardId\":\"1231231231\",\"icCardNum\":\"43534545345\",\"id\":0,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":10,\"sex\":0},\"mt\":{\"id\":3},\"name\":\"admin\",\"phone\":\"18802927580\",\"reception\":{\"id\":4},\"remark\":\"东方红\",\"sex\":1,\"store\":\"士大夫\"}', '保存客户信息操作', '2019-12-15 17:44:27', '2019-12-15 17:44:27');
INSERT INTO `sys_log` VALUES (73, 1, 'admin', 'com.xieke.admin.web.CustomerController.save', '{\"birthday\":1597161600000,\"cusType\":0,\"email\":\"18802927580\",\"fromsource\":{\"id\":1},\"icCardId\":\"1231231231\",\"icCardNum\":\"43534545345\",\"id\":0,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":13,\"sex\":0},\"mt\":{\"id\":1},\"name\":\"肚皮舞\",\"phone\":\"18802927580\",\"reception\":{\"id\":3},\"remark\":\"地方\",\"sex\":1,\"store\":\"士大夫\"}', '保存客户信息操作', '2019-12-15 17:50:12', '2019-12-15 17:50:12');
INSERT INTO `sys_log` VALUES (74, 1, 'admin', 'com.xieke.admin.web.CustomerController.save', '{\"birthday\":1597161600000,\"cusType\":0,\"email\":\"344295704@qq.com\",\"fromsource\":{\"id\":1},\"icCardId\":\"1231231231\",\"icCardNum\":\"43534545345\",\"id\":0,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":12,\"sex\":0},\"mt\":{\"id\":4},\"name\":\"肚皮舞\",\"phone\":\"18802927580\",\"reception\":{\"id\":2},\"remark\":\"十多个\",\"sex\":0,\"store\":\"士大夫\"}', '保存客户信息操作', '2019-12-15 17:55:09', '2019-12-15 17:55:09');
INSERT INTO `sys_log` VALUES (75, 1, 'admin', 'com.xieke.admin.web.CustomerController.save', '{\"birthday\":1597161600000,\"cusType\":0,\"email\":\"18802927580\",\"fromsource\":{\"id\":1},\"icCardId\":\"1231231231\",\"icCardNum\":\"43534545345\",\"id\":0,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":2,\"sex\":0},\"mt\":{\"id\":1},\"name\":\"admin\",\"phone\":\"18802927580\",\"reception\":{\"id\":1},\"remark\":\"阿萨德\",\"sex\":0,\"store\":\"士大夫\"}', '保存客户信息操作', '2019-12-15 17:57:07', '2019-12-15 17:57:07');
INSERT INTO `sys_log` VALUES (76, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 19:17:35', '2019-12-15 19:17:35');
INSERT INTO `sys_log` VALUES (77, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 19:25:44', '2019-12-15 19:25:44');
INSERT INTO `sys_log` VALUES (78, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 19:27:21', '2019-12-15 19:27:21');
INSERT INTO `sys_log` VALUES (79, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 19:31:10', '2019-12-15 19:31:10');
INSERT INTO `sys_log` VALUES (80, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 19:37:37', '2019-12-15 19:37:37');
INSERT INTO `sys_log` VALUES (81, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 19:42:02', '2019-12-15 19:42:02');
INSERT INTO `sys_log` VALUES (82, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 19:44:38', '2019-12-15 19:44:38');
INSERT INTO `sys_log` VALUES (83, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 20:05:18', '2019-12-15 20:05:18');
INSERT INTO `sys_log` VALUES (84, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 20:06:48', '2019-12-15 20:06:48');
INSERT INTO `sys_log` VALUES (85, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 20:13:07', '2019-12-15 20:13:07');
INSERT INTO `sys_log` VALUES (86, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 20:14:10', '2019-12-15 20:14:10');
INSERT INTO `sys_log` VALUES (87, 1, 'admin', 'com.xieke.admin.web.CustomerController.save', '{\"birthday\":1562860800000,\"cusType\":0,\"email\":\"344295704@qq.com\",\"fromsource\":{\"id\":4},\"icCardId\":\"1231231231\",\"icCardNum\":\"43534545345\",\"id\":0,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":1,\"sex\":0},\"mt\":{\"id\":9},\"name\":\"杨彬\",\"phone\":\"18802927580\",\"reception\":{\"id\":1},\"remark\":\"按时\",\"sex\":0,\"store\":\"金花路店\"}', '保存客户信息操作', '2019-12-15 20:16:05', '2019-12-15 20:16:05');
INSERT INTO `sys_log` VALUES (88, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 20:27:43', '2019-12-15 20:27:43');
INSERT INTO `sys_log` VALUES (89, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 20:29:17', '2019-12-15 20:29:17');
INSERT INTO `sys_log` VALUES (90, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 20:44:25', '2019-12-15 20:44:25');
INSERT INTO `sys_log` VALUES (91, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-15 21:04:52', '2019-12-15 21:04:52');
INSERT INTO `sys_log` VALUES (92, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 11:17:47', '2019-12-16 11:17:47');
INSERT INTO `sys_log` VALUES (93, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":37,\"permissionCode\":\"customer:edit\",\"permissionName\":\"编辑\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-16 11:43:27', '2019-12-16 11:43:27');
INSERT INTO `sys_log` VALUES (94, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":37,\"permissionCode\":\"customer:del\",\"permissionName\":\"删除\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-16 11:43:54', '2019-12-16 11:43:54');
INSERT INTO `sys_log` VALUES (95, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,1,2,3,4,5,6,7,8,9,10,11,12,13,16,17,18,25,35,37,38,39,40,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-16 11:44:11', '2019-12-16 11:44:11');
INSERT INTO `sys_log` VALUES (96, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:16:38', '2019-12-16 12:16:38');
INSERT INTO `sys_log` VALUES (97, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:16:39', '2019-12-16 12:16:39');
INSERT INTO `sys_log` VALUES (98, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:20:55', '2019-12-16 12:20:55');
INSERT INTO `sys_log` VALUES (99, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:20:55', '2019-12-16 12:20:55');
INSERT INTO `sys_log` VALUES (100, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:24:13', '2019-12-16 12:24:13');
INSERT INTO `sys_log` VALUES (101, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:24:14', '2019-12-16 12:24:14');
INSERT INTO `sys_log` VALUES (102, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:25:48', '2019-12-16 12:25:48');
INSERT INTO `sys_log` VALUES (103, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:30:25', '2019-12-16 12:30:25');
INSERT INTO `sys_log` VALUES (104, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:31:55', '2019-12-16 12:31:55');
INSERT INTO `sys_log` VALUES (105, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:32:38', '2019-12-16 12:32:38');
INSERT INTO `sys_log` VALUES (106, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:34:41', '2019-12-16 12:34:41');
INSERT INTO `sys_log` VALUES (107, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:36:10', '2019-12-16 12:36:10');
INSERT INTO `sys_log` VALUES (108, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:37:42', '2019-12-16 12:37:42');
INSERT INTO `sys_log` VALUES (109, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:37:57', '2019-12-16 12:37:57');
INSERT INTO `sys_log` VALUES (110, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:40:50', '2019-12-16 12:40:50');
INSERT INTO `sys_log` VALUES (111, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:42:01', '2019-12-16 12:42:01');
INSERT INTO `sys_log` VALUES (112, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:42:07', '2019-12-16 12:42:07');
INSERT INTO `sys_log` VALUES (113, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:43:17', '2019-12-16 12:43:17');
INSERT INTO `sys_log` VALUES (114, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:43:37', '2019-12-16 12:43:37');
INSERT INTO `sys_log` VALUES (115, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:48:55', '2019-12-16 12:48:55');
INSERT INTO `sys_log` VALUES (116, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:50:05', '2019-12-16 12:50:05');
INSERT INTO `sys_log` VALUES (117, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:53:25', '2019-12-16 12:53:25');
INSERT INTO `sys_log` VALUES (118, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 12:56:53', '2019-12-16 12:56:53');
INSERT INTO `sys_log` VALUES (119, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:00:33', '2019-12-16 13:00:33');
INSERT INTO `sys_log` VALUES (120, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:02:19', '2019-12-16 13:02:19');
INSERT INTO `sys_log` VALUES (121, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:09:38', '2019-12-16 13:09:38');
INSERT INTO `sys_log` VALUES (122, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:28:51', '2019-12-16 13:28:51');
INSERT INTO `sys_log` VALUES (123, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:30:12', '2019-12-16 13:30:12');
INSERT INTO `sys_log` VALUES (124, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:33:37', '2019-12-16 13:33:37');
INSERT INTO `sys_log` VALUES (125, 1, 'admin', 'com.xieke.admin.web.CustomerController.edit', '{\"birthday\":1562860800000,\"cusType\":0,\"email\":\"344295704@qq.com\",\"fromsource\":{\"id\":3},\"icCardId\":\"1231231231\",\"icCardNum\":\"43534545345\",\"id\":4,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":0,\"sex\":0},\"mt\":{\"id\":9},\"name\":\"杨彬\",\"phone\":\"18802927580\",\"reception\":{\"id\":1},\"remark\":\"按时\",\"sex\":0,\"store\":\"金花路店\"}', '编辑客户信息操作', '2019-12-16 13:33:40', '2019-12-16 13:33:40');
INSERT INTO `sys_log` VALUES (126, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:34:18', '2019-12-16 13:34:18');
INSERT INTO `sys_log` VALUES (127, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:34:23', '2019-12-16 13:34:23');
INSERT INTO `sys_log` VALUES (128, 1, 'admin', 'com.xieke.admin.web.CustomerController.edit', '{\"birthday\":1562860800000,\"cusType\":0,\"email\":\"344295704@qq.com\",\"fromsource\":{\"id\":3},\"icCardId\":\"1231231231\",\"icCardNum\":\"43534545345\",\"id\":4,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":4,\"sex\":0},\"mt\":{\"id\":9},\"name\":\"杨彬\",\"phone\":\"18802927580\",\"reception\":{\"id\":1},\"remark\":\"按时\",\"sex\":0,\"store\":\"金花路店\"}', '编辑客户信息操作', '2019-12-16 13:34:32', '2019-12-16 13:34:32');
INSERT INTO `sys_log` VALUES (129, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:34:55', '2019-12-16 13:34:55');
INSERT INTO `sys_log` VALUES (130, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:36:10', '2019-12-16 13:36:10');
INSERT INTO `sys_log` VALUES (131, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:39:49', '2019-12-16 13:39:49');
INSERT INTO `sys_log` VALUES (132, 1, 'admin', 'com.xieke.admin.web.CustomerController.edit', '{\"birthday\":1562860800000,\"cusType\":0,\"email\":\"344295704@qq.com\",\"fromsource\":{\"id\":3},\"icCardId\":\"1231231231\",\"icCardNum\":\"43534545345\",\"id\":4,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":4,\"sex\":0},\"mt\":{\"id\":9},\"name\":\"杨彬\",\"phone\":\"18802927580\",\"reception\":{\"id\":1},\"remark\":\"按时\",\"sex\":0,\"store\":\"金花路店\"}', '编辑客户信息操作', '2019-12-16 13:39:52', '2019-12-16 13:39:52');
INSERT INTO `sys_log` VALUES (133, 1, 'admin', 'com.xieke.admin.web.CustomerController.edit', '{\"birthday\":1562860800000,\"cusType\":0,\"email\":\"344295704@qq.com\",\"fromsource\":{\"id\":3},\"icCardId\":\"1231231231\",\"icCardNum\":\"43534545345\",\"id\":4,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":4,\"sex\":0},\"mt\":{\"id\":9},\"name\":\"杨彬\",\"phone\":\"18802927580\",\"reception\":{\"id\":1},\"remark\":\"按时\",\"sex\":0,\"store\":\"金花路店\"}', '编辑客户信息操作', '2019-12-16 13:39:54', '2019-12-16 13:39:54');
INSERT INTO `sys_log` VALUES (134, 1, 'admin', 'com.xieke.admin.web.CustomerController.edit', '{\"birthday\":1562860800000,\"cusType\":0,\"email\":\"344295704@qq.com\",\"fromsource\":{\"id\":3},\"icCardId\":\"1231231231\",\"icCardNum\":\"43534545345\",\"id\":4,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":0,\"sex\":0},\"mt\":{\"id\":9},\"name\":\"杨彬\",\"phone\":\"18802927580\",\"reception\":{\"id\":1},\"remark\":\"按时\",\"sex\":0,\"store\":\"金花路店\"}', '编辑客户信息操作', '2019-12-16 13:39:59', '2019-12-16 13:39:59');
INSERT INTO `sys_log` VALUES (135, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:42:57', '2019-12-16 13:42:57');
INSERT INTO `sys_log` VALUES (136, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:49:57', '2019-12-16 13:49:57');
INSERT INTO `sys_log` VALUES (137, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:50:12', '2019-12-16 13:50:12');
INSERT INTO `sys_log` VALUES (138, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:51:04', '2019-12-16 13:51:04');
INSERT INTO `sys_log` VALUES (139, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 13:51:17', '2019-12-16 13:51:17');
INSERT INTO `sys_log` VALUES (140, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 14:19:26', '2019-12-16 14:19:26');
INSERT INTO `sys_log` VALUES (141, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 14:19:32', '2019-12-16 14:19:32');
INSERT INTO `sys_log` VALUES (142, 1, 'admin', 'com.xieke.admin.web.CustomerController.edit', '{\"birthday\":1562860800000,\"cusType\":0,\"email\":\"344295704@qq.com\",\"fromsource\":{\"id\":3},\"icCardId\":\"1231231231\",\"icCardNum\":\"43534545345\",\"id\":4,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":4,\"sex\":0},\"mt\":{\"id\":9},\"name\":\"杨彬\",\"phone\":\"18802927580\",\"reception\":{\"id\":1},\"remark\":\"按时\",\"sex\":0,\"store\":\"金花路店\"}', '编辑客户信息操作', '2019-12-16 14:19:41', '2019-12-16 14:19:41');
INSERT INTO `sys_log` VALUES (143, 1, 'admin', 'com.xieke.admin.web.CustomerController.edit', '{\"birthday\":1562860800000,\"cusType\":0,\"email\":\"344295704@qq.com\",\"fromsource\":{\"id\":3},\"icCardId\":\"1231231231\",\"icCardNum\":\"43534545345\",\"id\":4,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":4,\"sex\":0},\"mt\":{\"id\":9},\"name\":\"杨彬\",\"phone\":\"18802927580\",\"reception\":{\"id\":1},\"remark\":\"按时\",\"sex\":0,\"store\":\"金花路店\"}', '编辑客户信息操作', '2019-12-16 14:19:42', '2019-12-16 14:19:42');
INSERT INTO `sys_log` VALUES (144, 1, 'admin', 'com.xieke.admin.web.CustomerController.edit', '{\"birthday\":1562860800000,\"cusType\":0,\"email\":\"344295704@qq.com\",\"fromsource\":{\"id\":3},\"icCardId\":\"1231231231\",\"icCardNum\":\"43534545345\",\"id\":4,\"idCard\":\"610121200106194913\",\"intro\":{\"cusType\":0,\"id\":4,\"sex\":0},\"mt\":{\"id\":9},\"name\":\"杨彬\",\"phone\":\"18802927580\",\"reception\":{\"id\":1},\"remark\":\"按时\",\"sex\":0,\"store\":\"金花路店\"}', '编辑客户信息操作', '2019-12-16 14:19:44', '2019-12-16 14:19:44');
INSERT INTO `sys_log` VALUES (145, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 14:42:49', '2019-12-16 14:42:49');
INSERT INTO `sys_log` VALUES (146, 1, 'admin', 'com.xieke.admin.web.CustomerController.del', '[5]', '删除客户信息操作', '2019-12-16 14:43:02', '2019-12-16 14:43:02');
INSERT INTO `sys_log` VALUES (147, 1, 'admin', 'com.xieke.admin.web.CustomerController.del', '[5]', '删除客户信息操作', '2019-12-16 14:44:51', '2019-12-16 14:44:51');
INSERT INTO `sys_log` VALUES (148, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 14:45:52', '2019-12-16 14:45:52');
INSERT INTO `sys_log` VALUES (149, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 14:58:34', '2019-12-16 14:58:34');
INSERT INTO `sys_log` VALUES (150, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 15:02:34', '2019-12-16 15:02:34');
INSERT INTO `sys_log` VALUES (151, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":35,\"permissionCode\":\"clubcard\",\"permissionName\":\"会员卡管理\",\"resourceType\":\"directory\",\"url\":\"\"}', '保存权限操作', '2019-12-16 15:05:02', '2019-12-16 15:05:02');
INSERT INTO `sys_log` VALUES (152, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,1,2,3,4,5,6,7,8,9,10,11,12,13,16,17,18,25,35,37,38,39,40,41,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-16 15:05:11', '2019-12-16 15:05:11');
INSERT INTO `sys_log` VALUES (153, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":41,\"permissionCode\":\"clubcard:view\",\"permissionName\":\"会员卡信息\",\"resourceType\":\"menu\",\"url\":\"/clubcard/list\"}', '保存权限操作', '2019-12-16 15:06:18', '2019-12-16 15:06:18');
INSERT INTO `sys_log` VALUES (154, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,37,38,39,40,1,2,3,4,5,6,7,8,9,10,11,12,13,16,17,18,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-16 15:07:03', '2019-12-16 15:07:03');
INSERT INTO `sys_log` VALUES (155, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 16:18:19', '2019-12-16 16:18:19');
INSERT INTO `sys_log` VALUES (156, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 16:49:39', '2019-12-16 16:49:39');
INSERT INTO `sys_log` VALUES (157, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 16:57:17', '2019-12-16 16:57:17');
INSERT INTO `sys_log` VALUES (158, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 16:59:06', '2019-12-16 16:59:06');
INSERT INTO `sys_log` VALUES (159, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 16:59:55', '2019-12-16 16:59:55');
INSERT INTO `sys_log` VALUES (160, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:06:49', '2019-12-16 17:06:49');
INSERT INTO `sys_log` VALUES (161, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:08:00', '2019-12-16 17:08:00');
INSERT INTO `sys_log` VALUES (162, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:08:39', '2019-12-16 17:08:39');
INSERT INTO `sys_log` VALUES (163, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:10:01', '2019-12-16 17:10:01');
INSERT INTO `sys_log` VALUES (164, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:10:19', '2019-12-16 17:10:19');
INSERT INTO `sys_log` VALUES (165, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:20:53', '2019-12-16 17:20:53');
INSERT INTO `sys_log` VALUES (166, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:28:48', '2019-12-16 17:28:48');
INSERT INTO `sys_log` VALUES (167, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:29:48', '2019-12-16 17:29:48');
INSERT INTO `sys_log` VALUES (168, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:30:55', '2019-12-16 17:30:55');
INSERT INTO `sys_log` VALUES (169, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:33:39', '2019-12-16 17:33:39');
INSERT INTO `sys_log` VALUES (170, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:35:46', '2019-12-16 17:35:46');
INSERT INTO `sys_log` VALUES (171, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:42:16', '2019-12-16 17:42:16');
INSERT INTO `sys_log` VALUES (172, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:44:53', '2019-12-16 17:44:53');
INSERT INTO `sys_log` VALUES (173, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:44:59', '2019-12-16 17:44:59');
INSERT INTO `sys_log` VALUES (174, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:56:12', '2019-12-16 17:56:12');
INSERT INTO `sys_log` VALUES (175, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 17:56:56', '2019-12-16 17:56:56');
INSERT INTO `sys_log` VALUES (176, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:03:20', '2019-12-16 18:03:20');
INSERT INTO `sys_log` VALUES (177, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:05:01', '2019-12-16 18:05:01');
INSERT INTO `sys_log` VALUES (178, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:06:02', '2019-12-16 18:06:02');
INSERT INTO `sys_log` VALUES (179, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:10:09', '2019-12-16 18:10:09');
INSERT INTO `sys_log` VALUES (180, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:11:33', '2019-12-16 18:11:33');
INSERT INTO `sys_log` VALUES (181, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:15:07', '2019-12-16 18:15:07');
INSERT INTO `sys_log` VALUES (182, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:18:46', '2019-12-16 18:18:46');
INSERT INTO `sys_log` VALUES (183, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:21:47', '2019-12-16 18:21:47');
INSERT INTO `sys_log` VALUES (184, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:23:47', '2019-12-16 18:23:47');
INSERT INTO `sys_log` VALUES (185, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:23:54', '2019-12-16 18:23:54');
INSERT INTO `sys_log` VALUES (186, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:24:43', '2019-12-16 18:24:43');
INSERT INTO `sys_log` VALUES (187, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:24:49', '2019-12-16 18:24:49');
INSERT INTO `sys_log` VALUES (188, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:26:09', '2019-12-16 18:26:09');
INSERT INTO `sys_log` VALUES (189, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:30:10', '2019-12-16 18:30:10');
INSERT INTO `sys_log` VALUES (190, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:32:22', '2019-12-16 18:32:22');
INSERT INTO `sys_log` VALUES (191, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:33:44', '2019-12-16 18:33:44');
INSERT INTO `sys_log` VALUES (192, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:39:36', '2019-12-16 18:39:36');
INSERT INTO `sys_log` VALUES (193, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 18:46:57', '2019-12-16 18:46:57');
INSERT INTO `sys_log` VALUES (194, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 19:00:53', '2019-12-16 19:00:53');
INSERT INTO `sys_log` VALUES (195, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 19:02:15', '2019-12-16 19:02:15');
INSERT INTO `sys_log` VALUES (196, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 19:04:22', '2019-12-16 19:04:22');
INSERT INTO `sys_log` VALUES (197, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 19:07:35', '2019-12-16 19:07:35');
INSERT INTO `sys_log` VALUES (198, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 19:23:43', '2019-12-16 19:23:43');
INSERT INTO `sys_log` VALUES (199, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 19:24:09', '2019-12-16 19:24:09');
INSERT INTO `sys_log` VALUES (200, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 19:26:53', '2019-12-16 19:26:53');
INSERT INTO `sys_log` VALUES (201, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 19:30:47', '2019-12-16 19:30:47');
INSERT INTO `sys_log` VALUES (202, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 19:45:17', '2019-12-16 19:45:17');
INSERT INTO `sys_log` VALUES (203, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 19:46:23', '2019-12-16 19:46:23');
INSERT INTO `sys_log` VALUES (204, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 19:47:47', '2019-12-16 19:47:47');
INSERT INTO `sys_log` VALUES (205, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 19:51:34', '2019-12-16 19:51:34');
INSERT INTO `sys_log` VALUES (206, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 19:58:00', '2019-12-16 19:58:00');
INSERT INTO `sys_log` VALUES (207, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 19:59:18', '2019-12-16 19:59:18');
INSERT INTO `sys_log` VALUES (208, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:04:28', '2019-12-16 20:04:28');
INSERT INTO `sys_log` VALUES (209, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:05:34', '2019-12-16 20:05:34');
INSERT INTO `sys_log` VALUES (210, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:06:57', '2019-12-16 20:06:57');
INSERT INTO `sys_log` VALUES (211, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:10:02', '2019-12-16 20:10:02');
INSERT INTO `sys_log` VALUES (212, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:11:23', '2019-12-16 20:11:23');
INSERT INTO `sys_log` VALUES (213, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:11:27', '2019-12-16 20:11:27');
INSERT INTO `sys_log` VALUES (214, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:13:00', '2019-12-16 20:13:00');
INSERT INTO `sys_log` VALUES (215, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:14:41', '2019-12-16 20:14:41');
INSERT INTO `sys_log` VALUES (216, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:15:45', '2019-12-16 20:15:45');
INSERT INTO `sys_log` VALUES (217, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:16:39', '2019-12-16 20:16:39');
INSERT INTO `sys_log` VALUES (218, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:17:47', '2019-12-16 20:17:47');
INSERT INTO `sys_log` VALUES (219, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:20:14', '2019-12-16 20:20:14');
INSERT INTO `sys_log` VALUES (220, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:21:33', '2019-12-16 20:21:33');
INSERT INTO `sys_log` VALUES (221, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:27:42', '2019-12-16 20:27:42');
INSERT INTO `sys_log` VALUES (222, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:30:44', '2019-12-16 20:30:44');
INSERT INTO `sys_log` VALUES (223, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:32:18', '2019-12-16 20:32:18');
INSERT INTO `sys_log` VALUES (224, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:35:48', '2019-12-16 20:35:48');
INSERT INTO `sys_log` VALUES (225, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:36:47', '2019-12-16 20:36:47');
INSERT INTO `sys_log` VALUES (226, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:38:23', '2019-12-16 20:38:23');
INSERT INTO `sys_log` VALUES (227, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:39:32', '2019-12-16 20:39:32');
INSERT INTO `sys_log` VALUES (228, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:43:43', '2019-12-16 20:43:43');
INSERT INTO `sys_log` VALUES (229, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:50:37', '2019-12-16 20:50:37');
INSERT INTO `sys_log` VALUES (230, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:52:01', '2019-12-16 20:52:01');
INSERT INTO `sys_log` VALUES (231, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 20:53:33', '2019-12-16 20:53:33');
INSERT INTO `sys_log` VALUES (232, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 21:01:57', '2019-12-16 21:01:57');
INSERT INTO `sys_log` VALUES (233, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-16 21:10:40', '2019-12-16 21:10:40');
INSERT INTO `sys_log` VALUES (234, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 14:27:24', '2019-12-17 14:27:24');
INSERT INTO `sys_log` VALUES (235, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 14:38:31', '2019-12-17 14:38:31');
INSERT INTO `sys_log` VALUES (236, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 14:44:39', '2019-12-17 14:44:39');
INSERT INTO `sys_log` VALUES (237, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 14:46:01', '2019-12-17 14:46:01');
INSERT INTO `sys_log` VALUES (238, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 14:52:16', '2019-12-17 14:52:16');
INSERT INTO `sys_log` VALUES (239, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 14:53:39', '2019-12-17 14:53:39');
INSERT INTO `sys_log` VALUES (240, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 14:55:14', '2019-12-17 14:55:14');
INSERT INTO `sys_log` VALUES (241, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 14:56:04', '2019-12-17 14:56:04');
INSERT INTO `sys_log` VALUES (242, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 14:58:22', '2019-12-17 14:58:22');
INSERT INTO `sys_log` VALUES (243, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 14:58:25', '2019-12-17 14:58:25');
INSERT INTO `sys_log` VALUES (244, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 14:59:14', '2019-12-17 14:59:14');
INSERT INTO `sys_log` VALUES (245, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 15:00:07', '2019-12-17 15:00:07');
INSERT INTO `sys_log` VALUES (246, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 15:27:47', '2019-12-17 15:27:47');
INSERT INTO `sys_log` VALUES (247, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 15:33:53', '2019-12-17 15:33:53');
INSERT INTO `sys_log` VALUES (248, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 15:34:35', '2019-12-17 15:34:35');
INSERT INTO `sys_log` VALUES (249, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 15:35:32', '2019-12-17 15:35:32');
INSERT INTO `sys_log` VALUES (250, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 15:36:23', '2019-12-17 15:36:23');
INSERT INTO `sys_log` VALUES (251, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 15:37:56', '2019-12-17 15:37:56');
INSERT INTO `sys_log` VALUES (252, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 15:41:11', '2019-12-17 15:41:11');
INSERT INTO `sys_log` VALUES (253, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 15:43:29', '2019-12-17 15:43:29');
INSERT INTO `sys_log` VALUES (254, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 15:44:42', '2019-12-17 15:44:42');
INSERT INTO `sys_log` VALUES (255, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:05:18', '2019-12-17 16:05:18');
INSERT INTO `sys_log` VALUES (256, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:07:31', '2019-12-17 16:07:31');
INSERT INTO `sys_log` VALUES (257, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:08:08', '2019-12-17 16:08:08');
INSERT INTO `sys_log` VALUES (258, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:10:48', '2019-12-17 16:10:48');
INSERT INTO `sys_log` VALUES (259, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:12:16', '2019-12-17 16:12:16');
INSERT INTO `sys_log` VALUES (260, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:13:03', '2019-12-17 16:13:03');
INSERT INTO `sys_log` VALUES (261, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:15:42', '2019-12-17 16:15:42');
INSERT INTO `sys_log` VALUES (262, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:18:27', '2019-12-17 16:18:27');
INSERT INTO `sys_log` VALUES (263, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:20:02', '2019-12-17 16:20:02');
INSERT INTO `sys_log` VALUES (264, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:20:30', '2019-12-17 16:20:30');
INSERT INTO `sys_log` VALUES (265, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:24:05', '2019-12-17 16:24:05');
INSERT INTO `sys_log` VALUES (266, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:26:53', '2019-12-17 16:26:53');
INSERT INTO `sys_log` VALUES (267, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:28:01', '2019-12-17 16:28:01');
INSERT INTO `sys_log` VALUES (268, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:33:12', '2019-12-17 16:33:12');
INSERT INTO `sys_log` VALUES (269, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:33:42', '2019-12-17 16:33:42');
INSERT INTO `sys_log` VALUES (270, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:38:06', '2019-12-17 16:38:06');
INSERT INTO `sys_log` VALUES (271, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:38:45', '2019-12-17 16:38:45');
INSERT INTO `sys_log` VALUES (272, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:39:18', '2019-12-17 16:39:18');
INSERT INTO `sys_log` VALUES (273, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:40:30', '2019-12-17 16:40:30');
INSERT INTO `sys_log` VALUES (274, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:41:08', '2019-12-17 16:41:08');
INSERT INTO `sys_log` VALUES (275, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:42:50', '2019-12-17 16:42:50');
INSERT INTO `sys_log` VALUES (276, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:56:12', '2019-12-17 16:56:12');
INSERT INTO `sys_log` VALUES (277, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 16:58:19', '2019-12-17 16:58:19');
INSERT INTO `sys_log` VALUES (278, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 17:00:18', '2019-12-17 17:00:18');
INSERT INTO `sys_log` VALUES (279, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 17:08:05', '2019-12-17 17:08:05');
INSERT INTO `sys_log` VALUES (280, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 17:36:46', '2019-12-17 17:36:46');
INSERT INTO `sys_log` VALUES (281, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 17:37:45', '2019-12-17 17:37:45');
INSERT INTO `sys_log` VALUES (282, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 17:43:30', '2019-12-17 17:43:30');
INSERT INTO `sys_log` VALUES (283, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 17:43:56', '2019-12-17 17:43:56');
INSERT INTO `sys_log` VALUES (284, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 17:44:20', '2019-12-17 17:44:20');
INSERT INTO `sys_log` VALUES (285, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 17:45:05', '2019-12-17 17:45:05');
INSERT INTO `sys_log` VALUES (286, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 17:55:17', '2019-12-17 17:55:17');
INSERT INTO `sys_log` VALUES (287, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 17:55:47', '2019-12-17 17:55:47');
INSERT INTO `sys_log` VALUES (288, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 17:58:45', '2019-12-17 17:58:45');
INSERT INTO `sys_log` VALUES (289, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 18:00:11', '2019-12-17 18:00:11');
INSERT INTO `sys_log` VALUES (290, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 18:02:24', '2019-12-17 18:02:24');
INSERT INTO `sys_log` VALUES (291, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 18:04:26', '2019-12-17 18:04:26');
INSERT INTO `sys_log` VALUES (292, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 18:06:57', '2019-12-17 18:06:57');
INSERT INTO `sys_log` VALUES (293, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 18:07:20', '2019-12-17 18:07:20');
INSERT INTO `sys_log` VALUES (294, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 18:08:19', '2019-12-17 18:08:19');
INSERT INTO `sys_log` VALUES (295, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 18:09:43', '2019-12-17 18:09:43');
INSERT INTO `sys_log` VALUES (296, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 18:13:54', '2019-12-17 18:13:54');
INSERT INTO `sys_log` VALUES (297, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 18:16:52', '2019-12-17 18:16:52');
INSERT INTO `sys_log` VALUES (298, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 18:23:11', '2019-12-17 18:23:11');
INSERT INTO `sys_log` VALUES (299, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":42,\"permissionCode\":\"clubcard:add\",\"permissionName\":\"会员卡添加\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-17 18:36:06', '2019-12-17 18:36:06');
INSERT INTO `sys_log` VALUES (300, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,37,38,39,40,1,2,3,4,5,6,7,8,9,10,11,12,13,16,17,18,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-17 18:36:15', '2019-12-17 18:36:15');
INSERT INTO `sys_log` VALUES (301, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 18:44:48', '2019-12-17 18:44:48');
INSERT INTO `sys_log` VALUES (302, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 18:46:52', '2019-12-17 18:46:52');
INSERT INTO `sys_log` VALUES (303, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 18:50:59', '2019-12-17 18:50:59');
INSERT INTO `sys_log` VALUES (304, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 18:52:10', '2019-12-17 18:52:10');
INSERT INTO `sys_log` VALUES (305, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 20:14:19', '2019-12-17 20:14:19');
INSERT INTO `sys_log` VALUES (306, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":4,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1593792000000,\"fromsource\":{\"id\":4},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":1},\"payReceipts\":\"2342323\",\"remark\":\"撒旦法\",\"startTime\":1576512000000,\"storeScope\":\"金花路\"}', '添加会员卡信息', '2019-12-17 20:14:53', '2019-12-17 20:14:53');
INSERT INTO `sys_log` VALUES (307, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 20:16:35', '2019-12-17 20:16:35');
INSERT INTO `sys_log` VALUES (308, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":4,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1593792000000,\"fromsource\":{\"id\":3},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":1},\"payReceipts\":\"234234\",\"remark\":\"对方过后的\",\"startTime\":1576512000000,\"storeScope\":\"金花路\"}', '添加会员卡信息', '2019-12-17 20:17:00', '2019-12-17 20:17:00');
INSERT INTO `sys_log` VALUES (309, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 20:19:12', '2019-12-17 20:19:12');
INSERT INTO `sys_log` VALUES (310, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":4,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1593792000000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":1},\"payReceipts\":\"34534\",\"remark\":\"发布\",\"startTime\":1576512000000,\"storeScope\":\"金花路\"}', '添加会员卡信息', '2019-12-17 20:19:36', '2019-12-17 20:19:36');
INSERT INTO `sys_log` VALUES (311, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 20:20:33', '2019-12-17 20:20:33');
INSERT INTO `sys_log` VALUES (312, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":4,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1593792000000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":1},\"payReceipts\":\"3453453\",\"remark\":\"的双方各\",\"startTime\":1576512000000,\"storeScope\":\"金花路\"}', '添加会员卡信息', '2019-12-17 20:20:53', '2019-12-17 20:20:53');
INSERT INTO `sys_log` VALUES (313, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 20:21:49', '2019-12-17 20:21:49');
INSERT INTO `sys_log` VALUES (314, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":4,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1593792000000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":9},\"payReceipts\":\"345345\",\"remark\":\"东方市公司\",\"startTime\":1576512000000,\"storeScope\":\"金花路\"}', '添加会员卡信息', '2019-12-17 20:22:09', '2019-12-17 20:22:09');
INSERT INTO `sys_log` VALUES (315, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 20:25:48', '2019-12-17 20:25:48');
INSERT INTO `sys_log` VALUES (316, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":4,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1593792000000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":1},\"payReceipts\":\"4564564\",\"remark\":\"托付给如何的\",\"startTime\":1576512000000,\"storeScope\":\"金花路\"}', '添加会员卡信息', '2019-12-17 20:26:11', '2019-12-17 20:26:11');
INSERT INTO `sys_log` VALUES (317, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 20:27:59', '2019-12-17 20:27:59');
INSERT INTO `sys_log` VALUES (318, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":4,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1593792000000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":1},\"payReceipts\":\"345345\",\"remark\":\"东方红\",\"startTime\":1576512000000,\"storeScope\":\"金花路\"}', '添加会员卡信息', '2019-12-17 20:28:26', '2019-12-17 20:28:26');
INSERT INTO `sys_log` VALUES (319, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 20:54:32', '2019-12-17 20:54:32');
INSERT INTO `sys_log` VALUES (320, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 20:55:13', '2019-12-17 20:55:13');
INSERT INTO `sys_log` VALUES (321, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":4,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1593792000000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":1},\"payReceipts\":\"234222\",\"remark\":\"奥术大师\",\"startTime\":1576512000000,\"storeScope\":\"金花路\"}', '添加会员卡信息', '2019-12-17 20:55:37', '2019-12-17 20:55:37');
INSERT INTO `sys_log` VALUES (322, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 20:58:48', '2019-12-17 20:58:48');
INSERT INTO `sys_log` VALUES (323, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":42,\"permissionCode\":\"clubcard:edit\",\"permissionName\":\"编辑\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-17 21:17:58', '2019-12-17 21:17:58');
INSERT INTO `sys_log` VALUES (324, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":43,\"parentId\":42,\"permissionCode\":\"clubcard:add\",\"permissionName\":\"新增\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-17 21:18:11', '2019-12-17 21:18:11');
INSERT INTO `sys_log` VALUES (325, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":42,\"permissionCode\":\"clubcard:del\",\"permissionName\":\"删除\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-17 21:18:26', '2019-12-17 21:18:26');
INSERT INTO `sys_log` VALUES (326, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":42,\"permissionCode\":\"clubcard:printview\",\"permissionName\":\"打印预览\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-17 21:21:34', '2019-12-17 21:21:34');
INSERT INTO `sys_log` VALUES (327, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,44,45,46,37,38,39,40,1,2,3,4,5,6,7,8,9,10,11,12,13,16,17,18,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-17 21:21:48', '2019-12-17 21:21:48');
INSERT INTO `sys_log` VALUES (328, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-17 21:34:04', '2019-12-17 21:34:04');
INSERT INTO `sys_log` VALUES (329, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":4,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1593792000000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":1},\"payReceipts\":\"3453453\",\"remark\":\"更换\",\"startTime\":1576512000000,\"storeScope\":\"金花路\"}', '添加会员卡信息', '2019-12-17 21:34:32', '2019-12-17 21:34:32');
INSERT INTO `sys_log` VALUES (330, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,44,45,46,37,38,39,40,1,2,3,4,5,6,7,8,9,10,11,12,13,16,17,18,25,47,48,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-18 14:04:57', '2019-12-18 14:04:57');
INSERT INTO `sys_log` VALUES (331, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-18 14:42:02', '2019-12-18 14:42:02');
INSERT INTO `sys_log` VALUES (332, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-18 14:52:43', '2019-12-18 14:52:43');
INSERT INTO `sys_log` VALUES (333, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-18 14:55:48', '2019-12-18 14:55:48');
INSERT INTO `sys_log` VALUES (334, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 15:52:05', '2019-12-18 15:52:05');
INSERT INTO `sys_log` VALUES (335, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 15:52:07', '2019-12-18 15:52:07');
INSERT INTO `sys_log` VALUES (336, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 16:23:14', '2019-12-18 16:23:14');
INSERT INTO `sys_log` VALUES (337, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 16:27:42', '2019-12-18 16:27:42');
INSERT INTO `sys_log` VALUES (338, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 17:43:38', '2019-12-18 17:43:38');
INSERT INTO `sys_log` VALUES (339, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 17:45:31', '2019-12-18 17:45:31');
INSERT INTO `sys_log` VALUES (340, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 17:55:42', '2019-12-18 17:55:42');
INSERT INTO `sys_log` VALUES (341, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 17:57:44', '2019-12-18 17:57:44');
INSERT INTO `sys_log` VALUES (342, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 17:57:48', '2019-12-18 17:57:48');
INSERT INTO `sys_log` VALUES (343, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 17:57:53', '2019-12-18 17:57:53');
INSERT INTO `sys_log` VALUES (344, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 18:00:41', '2019-12-18 18:00:41');
INSERT INTO `sys_log` VALUES (345, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 18:01:06', '2019-12-18 18:01:06');
INSERT INTO `sys_log` VALUES (346, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 18:06:40', '2019-12-18 18:06:40');
INSERT INTO `sys_log` VALUES (347, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 18:06:43', '2019-12-18 18:06:43');
INSERT INTO `sys_log` VALUES (348, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 19:07:42', '2019-12-18 19:07:42');
INSERT INTO `sys_log` VALUES (349, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 19:08:25', '2019-12-18 19:08:25');
INSERT INTO `sys_log` VALUES (350, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 19:08:39', '2019-12-18 19:08:39');
INSERT INTO `sys_log` VALUES (351, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 19:08:41', '2019-12-18 19:08:41');
INSERT INTO `sys_log` VALUES (352, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 19:58:25', '2019-12-18 19:58:25');
INSERT INTO `sys_log` VALUES (353, 1, 'admin', 'com.xieke.admin.web.UserController.delBatch', '[9]', '删除用户操作', '2019-12-18 19:59:44', '2019-12-18 19:59:44');
INSERT INTO `sys_log` VALUES (354, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 20:13:10', '2019-12-18 20:13:10');
INSERT INTO `sys_log` VALUES (355, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-18 20:14:30', '2019-12-18 20:14:30');
INSERT INTO `sys_log` VALUES (356, 1, 'admin', 'com.xieke.admin.web.UserController.add', '{\"name\":\"梁光超\",\"passWord\":\"123456\",\"roleId\":1,\"state\":1,\"userName\":\"liang\"}', '添加用户操作', '2019-12-18 20:24:06', '2019-12-18 20:24:06');
INSERT INTO `sys_log` VALUES (357, 1, 'admin', 'com.xieke.admin.web.RoleController.delBatch', '[2]', '删除角色操作', '2019-12-18 20:24:28', '2019-12-18 20:24:28');
INSERT INTO `sys_log` VALUES (358, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"permissionIds\":\"\",\"roleCode\":\"test\",\"roleName\":\"T\"}', '保存角色操作', '2019-12-18 20:24:49', '2019-12-18 20:24:49');
INSERT INTO `sys_log` VALUES (359, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":3,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,44,45,46,37,38,39,40,1,2,3,4,5,6,7,8,9,10,11,12,13,47,48,\",\"roleCode\":\"test\",\"roleName\":\"Test\"}', '保存角色操作', '2019-12-18 20:25:21', '2019-12-18 20:25:21');
INSERT INTO `sys_log` VALUES (360, 1, 'admin', 'com.xieke.admin.web.UserController.edit', '{\"id\":10,\"name\":\"梁光超\",\"roleId\":3,\"state\":1}', '修改用户操作', '2019-12-18 20:25:31', '2019-12-18 20:25:31');
INSERT INTO `sys_log` VALUES (361, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-18 20:25:42', '2019-12-18 20:25:42');
INSERT INTO `sys_log` VALUES (362, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-18 20:25:53', '2019-12-18 20:25:53');
INSERT INTO `sys_log` VALUES (363, 1, 'admin', 'com.xieke.admin.web.CustomerController.save', '{\"birthday\":810057600000,\"cusType\":0,\"email\":\"13356855912@163.com\",\"fromsource\":{\"id\":4},\"icCardId\":\"1382878114\",\"icCardNum\":\"1382878114\",\"id\":0,\"idCard\":\"622201199509037814\",\"intro\":{\"cusType\":0,\"id\":4,\"sex\":0},\"mt\":{\"id\":10},\"name\":\"梁光超\",\"phone\":\"18710385912\",\"reception\":{\"id\":10},\"remark\":\"这是个新会员\",\"sex\":0,\"store\":\"金华路\"}', '保存客户信息操作', '2019-12-18 20:30:20', '2019-12-18 20:30:20');
INSERT INTO `sys_log` VALUES (364, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-18 20:33:41', '2019-12-18 20:33:41');
INSERT INTO `sys_log` VALUES (365, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":3,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":6,\"name\":\"梁光超\",\"sex\":0},\"endTime\":1608134400000,\"fromsource\":{\"id\":4},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":10},\"payReceipts\":\"20191245\",\"remark\":\"年卡合同\",\"startTime\":1576598400000,\"storeScope\":\"金华店\"}', '添加会员卡信息', '2019-12-18 20:35:39', '2019-12-18 20:35:39');
INSERT INTO `sys_log` VALUES (366, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 20:35:42', '2019-12-18 20:35:42');
INSERT INTO `sys_log` VALUES (367, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 20:36:22', '2019-12-18 20:36:22');
INSERT INTO `sys_log` VALUES (368, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 20:36:29', '2019-12-18 20:36:29');
INSERT INTO `sys_log` VALUES (369, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 20:36:35', '2019-12-18 20:36:35');
INSERT INTO `sys_log` VALUES (370, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 20:36:44', '2019-12-18 20:36:44');
INSERT INTO `sys_log` VALUES (371, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 20:36:55', '2019-12-18 20:36:55');
INSERT INTO `sys_log` VALUES (372, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 20:48:03', '2019-12-18 20:48:03');
INSERT INTO `sys_log` VALUES (373, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-18 20:48:49', '2019-12-18 20:48:49');
INSERT INTO `sys_log` VALUES (374, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"permissionIds\":\",35,41,42,43,46,37,38,40,\",\"roleCode\":\"quanbtai\",\"roleName\":\"前台\"}', '保存角色操作', '2019-12-19 15:20:20', '2019-12-19 15:20:20');
INSERT INTO `sys_log` VALUES (375, 1, 'admin', 'com.xieke.admin.web.UserController.add', '{\"name\":\"前台·\",\"passWord\":\"123456\",\"roleId\":4,\"state\":1,\"userName\":\"123456\"}', '添加用户操作', '2019-12-19 15:20:51', '2019-12-19 15:20:51');
INSERT INTO `sys_log` VALUES (376, 1, 'admin', 'com.xieke.admin.web.UserController.edit', '{\"id\":11,\"name\":\"前台·\",\"roleId\":4,\"state\":1}', '修改用户操作', '2019-12-19 15:21:16', '2019-12-19 15:21:16');
INSERT INTO `sys_log` VALUES (377, 1, 'admin', 'com.xieke.admin.web.UserController.edit', '{\"id\":11,\"name\":\"前台·\",\"roleId\":4,\"state\":1}', '修改用户操作', '2019-12-19 15:21:25', '2019-12-19 15:21:25');
INSERT INTO `sys_log` VALUES (378, 11, '123456', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-19 15:21:56', '2019-12-19 15:21:56');
INSERT INTO `sys_log` VALUES (379, 11, '123456', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-19 15:23:00', '2019-12-19 15:23:00');
INSERT INTO `sys_log` VALUES (380, 11, '123456', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-19 15:23:09', '2019-12-19 15:23:09');
INSERT INTO `sys_log` VALUES (381, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":4,\"permissionIds\":\",35,41,42,43,46,37,38,40,\",\"roleCode\":\"quanbtai\",\"roleName\":\"前台\"}', '保存角色操作', '2019-12-19 15:24:15', '2019-12-19 15:24:15');
INSERT INTO `sys_log` VALUES (382, 1, 'admin', 'com.xieke.admin.web.UserController.edit', '{\"id\":11,\"name\":\"前台·\",\"roleId\":4,\"state\":1}', '修改用户操作', '2019-12-19 15:24:48', '2019-12-19 15:24:48');
INSERT INTO `sys_log` VALUES (383, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":40,\"parentId\":37,\"permissionCode\":\"customer:del\",\"permissionName\":\"删除\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-19 16:00:26', '2019-12-19 16:00:26');
INSERT INTO `sys_log` VALUES (384, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":3,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,46,37,38,1,2,3,4,5,6,7,8,9,10,11,12,13,47,48,\",\"roleCode\":\"test\",\"roleName\":\"Test\"}', '保存角色操作', '2019-12-19 16:06:21', '2019-12-19 16:06:21');
INSERT INTO `sys_log` VALUES (385, 10, 'liang', 'com.xieke.admin.web.PermissionController.del', '8', '删除权限操作', '2019-12-19 16:09:55', '2019-12-19 16:09:55');
INSERT INTO `sys_log` VALUES (386, 10, 'liang', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":6,\"permissionCode\":\"role:del\",\"permissionName\":\"删除\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-19 16:10:33', '2019-12-19 16:10:33');
INSERT INTO `sys_log` VALUES (387, 10, 'liang', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":3,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,46,37,38,1,2,3,4,5,6,7,9,49,10,11,12,13,47,48,\",\"roleCode\":\"test\",\"roleName\":\"Test\"}', '保存角色操作', '2019-12-19 16:12:26', '2019-12-19 16:12:26');
INSERT INTO `sys_log` VALUES (388, 10, 'liang', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":4,\"permissionIds\":\",35,41,42,43,46,37,38,\",\"roleCode\":\"quanbtai\",\"roleName\":\"前台\"}', '保存角色操作', '2019-12-19 16:13:08', '2019-12-19 16:13:08');
INSERT INTO `sys_log` VALUES (389, 1, 'admin', 'com.xieke.admin.web.PermissionController.del', '40', '删除权限操作', '2019-12-19 16:14:18', '2019-12-19 16:14:18');
INSERT INTO `sys_log` VALUES (390, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":37,\"permissionCode\":\"customer:del\",\"permissionName\":\"删除\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-19 16:15:06', '2019-12-19 16:15:06');
INSERT INTO `sys_log` VALUES (391, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,44,45,46,37,38,39,1,2,3,4,5,6,7,9,49,10,11,12,13,16,17,18,25,47,48,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-19 16:15:30', '2019-12-19 16:15:30');
INSERT INTO `sys_log` VALUES (392, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":4,\"permissionIds\":\",35,41,42,43,46,37,38,39,\",\"roleCode\":\"quanbtai\",\"roleName\":\"前台\"}', '保存角色操作', '2019-12-19 16:15:47', '2019-12-19 16:15:47');
INSERT INTO `sys_log` VALUES (393, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":47,\"permissionCode\":\"paytype:add\",\"permissionName\":\"添加\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-19 16:28:38', '2019-12-19 16:28:38');
INSERT INTO `sys_log` VALUES (394, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":47,\"permissionCode\":\"paytype:del\",\"permissionName\":\"删除\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-19 16:29:26', '2019-12-19 16:29:26');
INSERT INTO `sys_log` VALUES (395, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":47,\"permissionCode\":\"paytype:edit\",\"permissionName\":\"编辑\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-19 16:30:27', '2019-12-19 16:30:27');
INSERT INTO `sys_log` VALUES (396, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":48,\"permissionCode\":\"cardsetting:add\",\"permissionName\":\"添加\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-19 16:31:28', '2019-12-19 16:31:28');
INSERT INTO `sys_log` VALUES (397, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,44,45,46,37,38,39,50,1,2,3,4,5,6,7,9,49,10,11,12,13,47,51,52,53,48,54,16,17,18,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-19 16:34:30', '2019-12-19 16:34:30');
INSERT INTO `sys_log` VALUES (398, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":3,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,46,37,38,1,2,3,4,5,6,7,9,49,10,11,12,13,47,48,\",\"roleCode\":\"test\",\"roleName\":\"Test\"}', '保存角色操作', '2019-12-19 18:07:01', '2019-12-19 18:07:01');
INSERT INTO `sys_log` VALUES (399, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":3,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,46,37,38,1,2,3,4,5,6,7,9,49,10,11,12,13,47,48,\",\"roleCode\":\"test\",\"roleName\":\"Test\"}', '保存角色操作', '2019-12-19 18:08:22', '2019-12-19 18:08:22');
INSERT INTO `sys_log` VALUES (400, 1, 'admin', 'com.xieke.admin.web.UserController.edit', '{\"id\":10,\"name\":\"梁光超\",\"roleId\":3,\"state\":1}', '修改用户操作', '2019-12-19 18:08:31', '2019-12-19 18:08:31');
INSERT INTO `sys_log` VALUES (401, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,44,45,46,37,38,39,50,1,2,3,5,6,7,9,49,10,11,12,13,47,51,52,53,48,54,16,17,18,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-19 18:22:44', '2019-12-19 18:22:44');
INSERT INTO `sys_log` VALUES (402, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,44,46,37,38,39,50,1,2,3,5,6,7,9,49,10,11,12,13,47,51,52,53,48,54,16,17,18,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-19 18:26:28', '2019-12-19 18:26:28');
INSERT INTO `sys_log` VALUES (403, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,44,45,46,37,39,50,1,2,3,5,6,7,9,49,10,11,12,13,47,51,52,53,48,54,16,17,18,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-19 18:31:40', '2019-12-19 18:31:40');
INSERT INTO `sys_log` VALUES (404, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-19 18:32:05', '2019-12-19 18:32:05');
INSERT INTO `sys_log` VALUES (405, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":38,\"parentId\":37,\"permissionCode\":\"customer:add\",\"permissionName\":\"新增\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-19 18:32:55', '2019-12-19 18:32:55');
INSERT INTO `sys_log` VALUES (406, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-19 18:35:27', '2019-12-19 18:35:27');
INSERT INTO `sys_log` VALUES (407, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,44,45,46,37,39,50,1,2,3,5,6,7,9,49,10,11,12,13,47,51,52,53,48,54,16,17,18,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-19 19:10:17', '2019-12-19 19:10:17');
INSERT INTO `sys_log` VALUES (408, 1, 'admin', 'com.xieke.admin.web.RoleController.delBatch', '[4]', '删除角色操作', '2019-12-19 19:11:36', '2019-12-19 19:11:36');
INSERT INTO `sys_log` VALUES (409, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,46,37,38,39,50,\",\"roleCode\":\"dianzhang\",\"roleName\":\"店长\"}', '保存角色操作', '2019-12-19 19:12:32', '2019-12-19 19:12:32');
INSERT INTO `sys_log` VALUES (410, 1, 'admin', 'com.xieke.admin.web.UserController.add', '{\"name\":\"yang\",\"passWord\":\"123456\",\"roleId\":5,\"state\":1,\"userName\":\"yang\"}', '添加用户操作', '2019-12-19 19:12:57', '2019-12-19 19:12:57');
INSERT INTO `sys_log` VALUES (411, 1, 'admin', 'com.xieke.admin.web.UserController.edit', '{\"id\":12,\"name\":\"yang\",\"roleId\":5,\"state\":1}', '修改用户操作', '2019-12-19 19:13:05', '2019-12-19 19:13:05');
INSERT INTO `sys_log` VALUES (412, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-19 19:18:32', '2019-12-19 19:18:32');
INSERT INTO `sys_log` VALUES (413, 1, 'admin', 'com.xieke.admin.web.CustomerController.save', '{\"birthday\":1576684800000,\"cusType\":0,\"email\":\"13000000000@163.com\",\"fromsource\":{\"id\":5},\"icCardId\":\"1382878114\",\"icCardNum\":\"1382878114\",\"id\":0,\"idCard\":\"622201199509037814\",\"intro\":{\"cusType\":0,\"id\":6,\"sex\":0},\"mt\":{\"id\":12},\"name\":\"测试\",\"phone\":\"13022222222\",\"reception\":{\"id\":12},\"remark\":\"\",\"sex\":0,\"store\":\"金华路\"}', '保存客户信息操作', '2019-12-19 19:22:29', '2019-12-19 19:22:29');
INSERT INTO `sys_log` VALUES (414, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-19 19:22:42', '2019-12-19 19:22:42');
INSERT INTO `sys_log` VALUES (415, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":4,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":7,\"name\":\"测试\",\"sex\":0},\"endTime\":1608220800000,\"fromsource\":{\"id\":5},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":12},\"payReceipts\":\"124654654\",\"remark\":\"\",\"startTime\":1576684800000,\"storeScope\":\"金华路\"}', '添加会员卡信息', '2019-12-19 19:24:46', '2019-12-19 19:24:46');
INSERT INTO `sys_log` VALUES (416, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-19 19:24:50', '2019-12-19 19:24:50');
INSERT INTO `sys_log` VALUES (417, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-19 19:29:26', '2019-12-19 19:29:26');
INSERT INTO `sys_log` VALUES (418, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-19 19:29:59', '2019-12-19 19:29:59');
INSERT INTO `sys_log` VALUES (419, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":4,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":7,\"name\":\"测试\",\"sex\":0},\"endTime\":1608220800000,\"fromsource\":{\"id\":2},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":12},\"payReceipts\":\"1214654\",\"remark\":\"怎松鞋\",\"startTime\":1576684800000,\"storeScope\":\"金华路\"}', '添加会员卡信息', '2019-12-19 19:31:34', '2019-12-19 19:31:34');
INSERT INTO `sys_log` VALUES (420, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-19 19:32:16', '2019-12-19 19:32:16');
INSERT INTO `sys_log` VALUES (421, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-19 19:44:03', '2019-12-19 19:44:03');
INSERT INTO `sys_log` VALUES (422, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-19 19:45:24', '2019-12-19 19:45:24');
INSERT INTO `sys_log` VALUES (423, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-19 19:45:31', '2019-12-19 19:45:31');
INSERT INTO `sys_log` VALUES (424, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-19 19:46:48', '2019-12-19 19:46:48');
INSERT INTO `sys_log` VALUES (425, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-19 19:48:48', '2019-12-19 19:48:48');
INSERT INTO `sys_log` VALUES (426, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,44,45,46,37,38,39,50,1,2,3,4,5,6,7,9,49,10,11,12,13,47,51,52,53,48,54,16,17,18,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-20 18:05:04', '2019-12-20 18:05:04');
INSERT INTO `sys_log` VALUES (427, 1, 'admin', 'com.xieke.admin.web.UserController.delBatch', '[10,11,12]', '删除用户操作', '2019-12-20 18:05:23', '2019-12-20 18:05:23');
INSERT INTO `sys_log` VALUES (428, 1, 'admin', 'com.xieke.admin.web.RoleController.delBatch', '[4,5]', '删除角色操作', '2019-12-20 18:05:29', '2019-12-20 18:05:29');
INSERT INTO `sys_log` VALUES (429, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":3,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,46,37,38,1,2,3,4,5,6,7,9,49,10,11,12,13,47,48,\",\"roleCode\":\"test\",\"roleName\":\"Test\"}', '保存角色操作', '2019-12-20 18:05:34', '2019-12-20 18:05:34');
INSERT INTO `sys_log` VALUES (430, 1, 'admin', 'com.xieke.admin.web.UserController.add', '{\"name\":\"杨彬\",\"passWord\":\"123456\",\"roleId\":3,\"state\":1,\"userName\":\"yang\"}', '添加用户操作', '2019-12-20 18:05:53', '2019-12-20 18:05:53');
INSERT INTO `sys_log` VALUES (431, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-20 18:55:34', '2019-12-20 18:55:34');
INSERT INTO `sys_log` VALUES (432, 1, 'admin', 'com.xieke.admin.web.CustomerController.save', '{\"birthday\":1576771200000,\"cusType\":0,\"email\":\"344295704@qq.com\",\"fromsource\":{\"id\":1},\"icCardId\":\"1382878114\",\"icCardNum\":\"12332313\",\"id\":0,\"idCard\":\"622201199509037814\",\"intro\":{\"cusType\":0,\"id\":0,\"sex\":0},\"mt\":{\"id\":1},\"name\":\"杨彬\",\"phone\":\"18802927580\",\"reception\":{\"id\":1},\"remark\":\"新增1\",\"sex\":0,\"store\":\"金花路店\"}', '保存客户信息操作', '2019-12-20 18:56:32', '2019-12-20 18:56:32');
INSERT INTO `sys_log` VALUES (433, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-20 18:57:05', '2019-12-20 18:57:05');
INSERT INTO `sys_log` VALUES (434, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-20 19:00:13', '2019-12-20 19:00:13');
INSERT INTO `sys_log` VALUES (435, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-20 19:11:46', '2019-12-20 19:11:46');
INSERT INTO `sys_log` VALUES (436, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":2,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1619971200000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":1},\"payReceipts\":\"45345\",\"remark\":\"WDFA\",\"startTime\":1576771200000,\"storeScope\":\"金华路\"}', '添加会员卡信息', '2019-12-20 19:12:08', '2019-12-20 19:12:08');
INSERT INTO `sys_log` VALUES (437, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-20 19:26:21', '2019-12-20 19:26:21');
INSERT INTO `sys_log` VALUES (438, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-20 19:28:09', '2019-12-20 19:28:09');
INSERT INTO `sys_log` VALUES (439, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-20 19:28:17', '2019-12-20 19:28:17');
INSERT INTO `sys_log` VALUES (440, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":3,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,46,37,38,1,2,3,4,5,6,7,9,49,10,11,12,13,47,48,\",\"roleCode\":\"test\",\"roleName\":\"Test\"}', '保存角色操作', '2019-12-21 14:28:57', '2019-12-21 14:28:57');
INSERT INTO `sys_log` VALUES (441, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":35,\"permissionCode\":\"firstmoney\",\"permissionName\":\"定金管理\",\"resourceType\":\"directory\",\"url\":\"\"}', '保存权限操作', '2019-12-21 14:38:10', '2019-12-21 14:38:10');
INSERT INTO `sys_log` VALUES (442, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":55,\"parentId\":35,\"permissionCode\":\"firstmoney\",\"permissionName\":\"定金管理\",\"resourceType\":\"directory\",\"url\":\"\"}', '保存权限操作', '2019-12-21 14:38:47', '2019-12-21 14:38:47');
INSERT INTO `sys_log` VALUES (443, 1, 'admin', 'com.xieke.admin.web.PermissionController.del', '55', '删除权限操作', '2019-12-21 14:39:19', '2019-12-21 14:39:19');
INSERT INTO `sys_log` VALUES (444, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":35,\"permissionCode\":\"firstmoney\",\"permissionName\":\"定金管理\",\"resourceType\":\"menu\",\"url\":\"/first/morey\"}', '保存权限操作', '2019-12-21 14:40:11', '2019-12-21 14:40:11');
INSERT INTO `sys_log` VALUES (445, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":56,\"parentId\":35,\"permissionCode\":\"firstmoney\",\"permissionName\":\"定金管理\",\"resourceType\":\"menu\",\"url\":\"/first/money\"}', '保存权限操作', '2019-12-21 14:40:23', '2019-12-21 14:40:23');
INSERT INTO `sys_log` VALUES (446, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,44,45,46,37,38,39,50,56,1,2,3,4,5,6,7,9,49,10,11,12,13,47,51,52,53,48,54,16,17,18,25,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-21 14:41:05', '2019-12-21 14:41:05');
INSERT INTO `sys_log` VALUES (447, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":56,\"parentId\":35,\"permissionCode\":\"first:view\",\"permissionName\":\"定金管理\",\"resourceType\":\"menu\",\"url\":\"/first/money/list\"}', '保存权限操作', '2019-12-21 15:39:00', '2019-12-21 15:39:00');
INSERT INTO `sys_log` VALUES (448, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-21 15:50:02', '2019-12-21 15:50:02');
INSERT INTO `sys_log` VALUES (449, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":56,\"permissionCode\":\"first:add\",\"permissionName\":\"新增\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-21 18:13:35', '2019-12-21 18:13:35');
INSERT INTO `sys_log` VALUES (450, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":56,\"permissionCode\":\"first:edit\",\"permissionName\":\"编辑\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-21 18:13:59', '2019-12-21 18:13:59');
INSERT INTO `sys_log` VALUES (451, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,44,45,46,37,38,39,50,56,57,58,1,2,3,4,5,6,7,9,49,10,11,12,13,16,17,18,25,47,51,52,53,48,54,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-21 18:14:09', '2019-12-21 18:14:09');
INSERT INTO `sys_log` VALUES (452, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":56,\"permissionCode\":\"first:printview\",\"permissionName\":\"打印预览\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-21 18:55:17', '2019-12-21 18:55:17');
INSERT INTO `sys_log` VALUES (453, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,44,45,46,37,38,39,50,56,57,58,59,1,2,3,4,5,6,7,9,49,10,11,12,13,16,17,18,25,47,51,52,53,48,54,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-21 18:55:35', '2019-12-21 18:55:35');
INSERT INTO `sys_log` VALUES (454, 1, 'admin', 'com.xieke.admin.web.FirstmoneyController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印定金信息', '2019-12-21 19:25:48', '2019-12-21 19:25:48');
INSERT INTO `sys_log` VALUES (455, 1, 'admin', 'com.xieke.admin.web.FirstmoneyController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印定金信息', '2019-12-21 19:26:29', '2019-12-21 19:26:29');
INSERT INTO `sys_log` VALUES (456, 1, 'admin', 'com.xieke.admin.web.FirstmoneyController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印定金信息', '2019-12-21 19:28:18', '2019-12-21 19:28:18');
INSERT INTO `sys_log` VALUES (457, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":42,\"permissionCode\":\"club:examine\",\"permissionName\":\"审核\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-21 19:29:53', '2019-12-21 19:29:53');
INSERT INTO `sys_log` VALUES (458, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",14,20,23,24,21,35,41,42,43,44,45,46,60,37,38,39,50,56,57,58,59,1,2,3,4,5,6,7,9,49,10,11,12,13,16,17,18,25,47,51,52,53,48,54,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-21 19:31:06', '2019-12-21 19:31:06');
INSERT INTO `sys_log` VALUES (459, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examine', '\"10\"', '审核', '2019-12-21 19:46:56', '2019-12-21 19:46:56');
INSERT INTO `sys_log` VALUES (460, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examine', '\"10\"', '审核', '2019-12-21 19:48:18', '2019-12-21 19:48:18');
INSERT INTO `sys_log` VALUES (461, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examine', '\"10\"', '审核', '2019-12-21 19:48:41', '2019-12-21 19:48:41');
INSERT INTO `sys_log` VALUES (462, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-21 19:48:49', '2019-12-21 19:48:49');
INSERT INTO `sys_log` VALUES (463, 1, 'admin', 'com.xieke.admin.web.FirstmoneyController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印定金信息', '2019-12-21 19:48:57', '2019-12-21 19:48:57');
INSERT INTO `sys_log` VALUES (464, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"permissionCode\":\"quanxian\",\"permissionName\":\"营业管理\",\"resourceType\":\"top_directory\",\"url\":\"\"}', '保存权限操作', '2019-12-23 13:29:16', '2019-12-23 13:29:16');
INSERT INTO `sys_log` VALUES (465, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"permissionCode\":\"yuding\",\"permissionName\":\"预定管理\",\"resourceType\":\"top_directory\",\"url\":\"\"}', '保存权限操作', '2019-12-23 13:30:07', '2019-12-23 13:30:07');
INSERT INTO `sys_log` VALUES (466, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,33,7,71,710,718,719,72,720,721,722,73,730,731,732,74,75,76,2,4,5,6,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-23 14:57:14', '2019-12-23 14:57:14');
INSERT INTO `sys_log` VALUES (467, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":1,\"permissionIds\":\",1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,33,7,71,710,718,719,72,720,721,722,73,730,731,732,74,75,76,2,4,5,6,\",\"roleCode\":\"admin\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-23 14:57:24', '2019-12-23 14:57:24');
INSERT INTO `sys_log` VALUES (468, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"permissionIds\":\",1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,33,7,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,2,4,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-23 14:58:32', '2019-12-23 14:58:32');
INSERT INTO `sys_log` VALUES (469, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"permissionIds\":\",1,11,12,120,121,122,\",\"roleCode\":\"2\",\"roleName\":\"test\"}', '保存角色操作', '2019-12-23 15:00:14', '2019-12-23 15:00:14');
INSERT INTO `sys_log` VALUES (470, 1, 'admin', 'com.xieke.admin.web.UserController.edit', '{\"id\":13,\"name\":\"杨彬\",\"roleId\":7,\"state\":1}', '修改用户操作', '2019-12-23 15:00:22', '2019-12-23 15:00:22');
INSERT INTO `sys_log` VALUES (471, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 15:10:11', '2019-12-23 15:10:11');
INSERT INTO `sys_log` VALUES (472, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 15:10:16', '2019-12-23 15:10:16');
INSERT INTO `sys_log` VALUES (473, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-23 15:15:08', '2019-12-23 15:15:08');
INSERT INTO `sys_log` VALUES (474, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 15:16:56', '2019-12-23 15:16:56');
INSERT INTO `sys_log` VALUES (475, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 15:20:49', '2019-12-23 15:20:49');
INSERT INTO `sys_log` VALUES (476, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 15:21:22', '2019-12-23 15:21:22');
INSERT INTO `sys_log` VALUES (477, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 15:36:29', '2019-12-23 15:36:29');
INSERT INTO `sys_log` VALUES (478, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-23 15:36:45', '2019-12-23 15:36:45');
INSERT INTO `sys_log` VALUES (479, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,7,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,2,4,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-23 15:38:46', '2019-12-23 15:38:46');
INSERT INTO `sys_log` VALUES (480, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 15:42:28', '2019-12-23 15:42:28');
INSERT INTO `sys_log` VALUES (481, 1, 'admin', 'com.xieke.admin.web.CustomerController.del', '[10]', '删除客户信息操作', '2019-12-23 15:47:46', '2019-12-23 15:47:46');
INSERT INTO `sys_log` VALUES (482, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 15:49:46', '2019-12-23 15:49:46');
INSERT INTO `sys_log` VALUES (483, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 15:56:00', '2019-12-23 15:56:00');
INSERT INTO `sys_log` VALUES (484, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 15:56:07', '2019-12-23 15:56:07');
INSERT INTO `sys_log` VALUES (485, 1, 'admin', 'com.xieke.admin.web.CustomerController.save', '{\"birthday\":1575993600000,\"cusType\":0,\"email\":\"23423423\",\"fromsource\":{\"id\":1},\"icCardId\":\"2342342\",\"icCardNum\":\"2342432\",\"id\":0,\"idCard\":\"2342342342342\",\"intro\":{\"cusType\":0,\"id\":8,\"sex\":0},\"mt\":{\"id\":1},\"name\":\"asd\",\"phone\":\"3242342\",\"reception\":{\"id\":1},\"remark\":\"\",\"sex\":0,\"store\":\"234234\"}', '保存客户信息操作', '2019-12-23 15:56:26', '2019-12-23 15:56:26');
INSERT INTO `sys_log` VALUES (486, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 15:56:35', '2019-12-23 15:56:35');
INSERT INTO `sys_log` VALUES (487, 1, 'admin', 'com.xieke.admin.web.CustomerController.del', '[9]', '删除客户信息操作', '2019-12-23 15:56:39', '2019-12-23 15:56:39');
INSERT INTO `sys_log` VALUES (488, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-23 16:20:56', '2019-12-23 16:20:56');
INSERT INTO `sys_log` VALUES (489, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-23 16:38:38', '2019-12-23 16:38:38');
INSERT INTO `sys_log` VALUES (490, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-23 16:48:14', '2019-12-23 16:48:14');
INSERT INTO `sys_log` VALUES (491, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examine', '\"10\"', '审核', '2019-12-23 17:00:48', '2019-12-23 17:00:48');
INSERT INTO `sys_log` VALUES (492, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-23 17:40:16', '2019-12-23 17:40:16');
INSERT INTO `sys_log` VALUES (493, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-23 17:41:36', '2019-12-23 17:41:36');
INSERT INTO `sys_log` VALUES (494, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-23 17:43:32', '2019-12-23 17:43:32');
INSERT INTO `sys_log` VALUES (495, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-23 17:45:27', '2019-12-23 17:45:27');
INSERT INTO `sys_log` VALUES (496, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-23 17:46:05', '2019-12-23 17:46:05');
INSERT INTO `sys_log` VALUES (497, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-23 17:46:39', '2019-12-23 17:46:39');
INSERT INTO `sys_log` VALUES (498, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-23 17:47:26', '2019-12-23 17:47:26');
INSERT INTO `sys_log` VALUES (499, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examine', '\"10\"', '审核', '2019-12-23 17:47:31', '2019-12-23 17:47:31');
INSERT INTO `sys_log` VALUES (500, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-23 17:48:53', '2019-12-23 17:48:53');
INSERT INTO `sys_log` VALUES (501, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examine', '\"10\"', '审核', '2019-12-23 17:49:05', '2019-12-23 17:49:05');
INSERT INTO `sys_log` VALUES (502, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-23 17:57:28', '2019-12-23 17:57:28');
INSERT INTO `sys_log` VALUES (503, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-23 17:58:36', '2019-12-23 17:58:36');
INSERT INTO `sys_log` VALUES (504, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 18:04:54', '2019-12-23 18:04:54');
INSERT INTO `sys_log` VALUES (505, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 18:23:33', '2019-12-23 18:23:33');
INSERT INTO `sys_log` VALUES (506, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 18:23:51', '2019-12-23 18:23:51');
INSERT INTO `sys_log` VALUES (507, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 18:35:48', '2019-12-23 18:35:48');
INSERT INTO `sys_log` VALUES (508, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 18:38:03', '2019-12-23 18:38:03');
INSERT INTO `sys_log` VALUES (509, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 18:42:49', '2019-12-23 18:42:49');
INSERT INTO `sys_log` VALUES (510, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 18:46:00', '2019-12-23 18:46:00');
INSERT INTO `sys_log` VALUES (511, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 18:47:18', '2019-12-23 18:47:18');
INSERT INTO `sys_log` VALUES (512, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 18:50:46', '2019-12-23 18:50:46');
INSERT INTO `sys_log` VALUES (513, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 18:51:57', '2019-12-23 18:51:57');
INSERT INTO `sys_log` VALUES (514, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 18:53:43', '2019-12-23 18:53:43');
INSERT INTO `sys_log` VALUES (515, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 19:16:54', '2019-12-23 19:16:54');
INSERT INTO `sys_log` VALUES (516, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 19:20:16', '2019-12-23 19:20:16');
INSERT INTO `sys_log` VALUES (517, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 19:22:03', '2019-12-23 19:22:03');
INSERT INTO `sys_log` VALUES (518, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 19:22:34', '2019-12-23 19:22:34');
INSERT INTO `sys_log` VALUES (519, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 20:07:34', '2019-12-23 20:07:34');
INSERT INTO `sys_log` VALUES (520, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 20:11:54', '2019-12-23 20:11:54');
INSERT INTO `sys_log` VALUES (521, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 20:13:31', '2019-12-23 20:13:31');
INSERT INTO `sys_log` VALUES (522, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1594310400000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":1},\"payReceipts\":\"565645\",\"remark\":\"\",\"startTime\":1577030400000,\"storeScope\":\"75272\"}', '添加会员卡信息', '2019-12-23 20:16:19', '2019-12-23 20:16:19');
INSERT INTO `sys_log` VALUES (523, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-23 20:18:12', '2019-12-23 20:18:12');
INSERT INTO `sys_log` VALUES (524, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examine', '\"11\"', '审核', '2019-12-23 20:18:28', '2019-12-23 20:18:28');
INSERT INTO `sys_log` VALUES (525, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-23 20:18:34', '2019-12-23 20:18:34');
INSERT INTO `sys_log` VALUES (526, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 20:24:37', '2019-12-23 20:24:37');
INSERT INTO `sys_log` VALUES (527, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 20:27:00', '2019-12-23 20:27:00');
INSERT INTO `sys_log` VALUES (528, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 20:27:40', '2019-12-23 20:27:40');
INSERT INTO `sys_log` VALUES (529, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 20:46:54', '2019-12-23 20:46:54');
INSERT INTO `sys_log` VALUES (530, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 21:30:43', '2019-12-23 21:30:43');
INSERT INTO `sys_log` VALUES (531, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":2,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1620230400000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":1},\"payReceipts\":\"121212\",\"remark\":\"\",\"startTime\":1577030400000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '添加会员卡信息', '2019-12-23 21:31:11', '2019-12-23 21:31:11');
INSERT INTO `sys_log` VALUES (532, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-23 21:31:19', '2019-12-23 21:31:19');
INSERT INTO `sys_log` VALUES (533, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examine', '\"12\"', '审核', '2019-12-23 21:31:24', '2019-12-23 21:31:24');
INSERT INTO `sys_log` VALUES (534, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-23 21:31:31', '2019-12-23 21:31:31');
INSERT INTO `sys_log` VALUES (535, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-24 13:23:44', '2019-12-24 13:23:44');
INSERT INTO `sys_log` VALUES (536, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-24 14:28:40', '2019-12-24 14:28:40');
INSERT INTO `sys_log` VALUES (537, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-24 15:50:07', '2019-12-24 15:50:07');
INSERT INTO `sys_log` VALUES (538, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":7,\"permissionCode\":\"activitymanagement\",\"permissionName\":\"活动管理\",\"resourceType\":\"directory\",\"url\":\"\"}', '保存权限操作', '2019-12-24 16:00:36', '2019-12-24 16:00:36');
INSERT INTO `sys_log` VALUES (539, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,7,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,733,2,4,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-24 16:00:48', '2019-12-24 16:00:48');
INSERT INTO `sys_log` VALUES (540, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":733,\"permissionCode\":\"activitymanagement:view\",\"permissionName\":\"用户列表\",\"resourceType\":\"menu\",\"url\":\"/activity/management/userlist\"}', '保存权限操作', '2019-12-24 16:18:42', '2019-12-24 16:18:42');
INSERT INTO `sys_log` VALUES (541, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,7,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,733,734,2,4,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-24 16:19:25', '2019-12-24 16:19:25');
INSERT INTO `sys_log` VALUES (542, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":734,\"permissionCode\":\"activity:examine\",\"permissionName\":\"审核\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-24 17:32:42', '2019-12-24 17:32:42');
INSERT INTO `sys_log` VALUES (543, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",7,733,734,735,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,2,4,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-24 17:32:54', '2019-12-24 17:32:54');
INSERT INTO `sys_log` VALUES (544, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",7,733,734,735,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,2,4,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-24 17:55:24', '2019-12-24 17:55:24');
INSERT INTO `sys_log` VALUES (545, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":734,\"permissionCode\":\"reverse:examine\",\"permissionName\":\"反审核\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-24 20:26:35', '2019-12-24 20:26:35');
INSERT INTO `sys_log` VALUES (546, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",7,733,734,735,736,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,2,4,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-24 20:30:15', '2019-12-24 20:30:15');
INSERT INTO `sys_log` VALUES (547, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 14:08:01', '2019-12-25 14:08:01');
INSERT INTO `sys_log` VALUES (548, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 14:09:27', '2019-12-25 14:09:27');
INSERT INTO `sys_log` VALUES (549, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 14:11:43', '2019-12-25 14:11:43');
INSERT INTO `sys_log` VALUES (550, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 14:12:07', '2019-12-25 14:12:07');
INSERT INTO `sys_log` VALUES (551, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 14:12:20', '2019-12-25 14:12:20');
INSERT INTO `sys_log` VALUES (552, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 14:12:59', '2019-12-25 14:12:59');
INSERT INTO `sys_log` VALUES (553, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 14:13:24', '2019-12-25 14:13:24');
INSERT INTO `sys_log` VALUES (554, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 17:32:50', '2019-12-25 17:32:50');
INSERT INTO `sys_log` VALUES (555, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 17:35:59', '2019-12-25 17:35:59');
INSERT INTO `sys_log` VALUES (556, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 17:37:03', '2019-12-25 17:37:03');
INSERT INTO `sys_log` VALUES (557, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 17:38:42', '2019-12-25 17:38:42');
INSERT INTO `sys_log` VALUES (558, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 17:39:19', '2019-12-25 17:39:19');
INSERT INTO `sys_log` VALUES (559, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 17:39:31', '2019-12-25 17:39:31');
INSERT INTO `sys_log` VALUES (560, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 17:41:18', '2019-12-25 17:41:18');
INSERT INTO `sys_log` VALUES (561, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 17:57:20', '2019-12-25 17:57:20');
INSERT INTO `sys_log` VALUES (562, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 17:59:45', '2019-12-25 17:59:45');
INSERT INTO `sys_log` VALUES (563, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:00:12', '2019-12-25 18:00:12');
INSERT INTO `sys_log` VALUES (564, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:00:46', '2019-12-25 18:00:46');
INSERT INTO `sys_log` VALUES (565, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:02:09', '2019-12-25 18:02:09');
INSERT INTO `sys_log` VALUES (566, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:02:47', '2019-12-25 18:02:47');
INSERT INTO `sys_log` VALUES (567, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:04:09', '2019-12-25 18:04:09');
INSERT INTO `sys_log` VALUES (568, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:04:49', '2019-12-25 18:04:49');
INSERT INTO `sys_log` VALUES (569, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:05:21', '2019-12-25 18:05:21');
INSERT INTO `sys_log` VALUES (570, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:05:53', '2019-12-25 18:05:53');
INSERT INTO `sys_log` VALUES (571, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:06:30', '2019-12-25 18:06:30');
INSERT INTO `sys_log` VALUES (572, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:07:38', '2019-12-25 18:07:38');
INSERT INTO `sys_log` VALUES (573, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:08:49', '2019-12-25 18:08:49');
INSERT INTO `sys_log` VALUES (574, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:12:19', '2019-12-25 18:12:19');
INSERT INTO `sys_log` VALUES (575, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:12:46', '2019-12-25 18:12:46');
INSERT INTO `sys_log` VALUES (576, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:13:11', '2019-12-25 18:13:11');
INSERT INTO `sys_log` VALUES (577, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:21:36', '2019-12-25 18:21:36');
INSERT INTO `sys_log` VALUES (578, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:22:38', '2019-12-25 18:22:38');
INSERT INTO `sys_log` VALUES (579, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 18:25:12', '2019-12-25 18:25:12');
INSERT INTO `sys_log` VALUES (580, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 19:23:23', '2019-12-25 19:23:23');
INSERT INTO `sys_log` VALUES (581, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 19:24:06', '2019-12-25 19:24:06');
INSERT INTO `sys_log` VALUES (582, 1, 'admin', 'com.xieke.admin.web.ClubCardController.edit', '{\"cardsetting\":{\"cardType\":0,\"id\":2,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1620230400000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"JY201912232157384910\",\"mt\":{\"id\":1},\"payReceipts\":\"undefined\",\"remark\":\"\",\"startTime\":1577030400000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '编辑会员卡信息', '2019-12-25 19:24:09', '2019-12-25 19:24:09');
INSERT INTO `sys_log` VALUES (583, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":734,\"permissionCode\":\"activity:adduser\",\"permissionName\":\"录入用户\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-25 19:47:12', '2019-12-25 19:47:12');
INSERT INTO `sys_log` VALUES (584, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",7,733,734,735,736,737,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,2,4,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-25 19:47:21', '2019-12-25 19:47:21');
INSERT INTO `sys_log` VALUES (585, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 20:16:59', '2019-12-25 20:16:59');
INSERT INTO `sys_log` VALUES (586, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 20:19:58', '2019-12-25 20:19:58');
INSERT INTO `sys_log` VALUES (587, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 20:20:21', '2019-12-25 20:20:21');
INSERT INTO `sys_log` VALUES (588, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-25 20:21:57', '2019-12-25 20:21:57');
INSERT INTO `sys_log` VALUES (589, 1, 'admin', 'com.xieke.admin.web.ClubCardController.edit', '{\"cardsetting\":{\"cardType\":0,\"id\":2,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1620230400000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"JY201912232157384910\",\"mt\":{\"id\":1},\"payReceipts\":\"121212\",\"remark\":\"\",\"startTime\":1577030400000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '编辑会员卡信息', '2019-12-25 20:21:59', '2019-12-25 20:21:59');
INSERT INTO `sys_log` VALUES (590, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-26 13:10:01', '2019-12-26 13:10:01');
INSERT INTO `sys_log` VALUES (591, 1, 'admin', 'com.xieke.admin.web.ClubCardController.edit', '{\"cardsetting\":{\"cardType\":0,\"id\":2,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1620230400000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"JY201912232157384910\",\"mt\":{\"id\":1},\"payReceipts\":\"121212\",\"remark\":\"\",\"startTime\":1577030400000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '编辑会员卡信息', '2019-12-26 13:10:12', '2019-12-26 13:10:12');
INSERT INTO `sys_log` VALUES (592, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-26 13:13:47', '2019-12-26 13:13:47');
INSERT INTO `sys_log` VALUES (593, 1, 'admin', 'com.xieke.admin.web.ClubCardController.edit', '{\"cardsetting\":{\"cardType\":0,\"id\":2,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1620230400000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"JY201912232157384910\",\"mt\":{\"id\":1},\"payReceipts\":\"121212\",\"remark\":\"\",\"startTime\":1577030400000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '编辑会员卡信息', '2019-12-26 13:13:52', '2019-12-26 13:13:52');
INSERT INTO `sys_log` VALUES (594, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-26 13:17:40', '2019-12-26 13:17:40');
INSERT INTO `sys_log` VALUES (595, 1, 'admin', 'com.xieke.admin.web.ClubCardController.edit', '{\"cardsetting\":{\"cardType\":0,\"id\":2,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1620230400000,\"fromsource\":{\"id\":1},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"JY201912232157384910\",\"mt\":{\"id\":1},\"payReceipts\":\"121212\",\"remark\":\"\",\"startTime\":1577030400000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '编辑会员卡信息', '2019-12-26 13:17:45', '2019-12-26 13:17:45');
INSERT INTO `sys_log` VALUES (596, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-26 13:32:24', '2019-12-26 13:32:24');
INSERT INTO `sys_log` VALUES (597, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-26 13:34:53', '2019-12-26 13:34:53');
INSERT INTO `sys_log` VALUES (598, 1, 'admin', 'com.xieke.admin.web.ClubCardController.edit', '{\"cardsetting\":{\"cardType\":0,\"id\":2,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1620230400000,\"fromsource\":{\"id\":1},\"id\":12,\"memberStatus\":0,\"menmbercardNumber\":\"JY201912232157384910\",\"mt\":{\"id\":1},\"payReceipts\":\"121212\",\"remark\":\"\",\"startTime\":1577030400000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '编辑会员卡信息', '2019-12-26 13:34:56', '2019-12-26 13:34:56');
INSERT INTO `sys_log` VALUES (599, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-26 13:35:02', '2019-12-26 13:35:02');
INSERT INTO `sys_log` VALUES (600, 1, 'admin', 'com.xieke.admin.web.ClubCardController.edit', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1594569600000,\"fromsource\":{\"id\":1},\"id\":12,\"memberStatus\":0,\"menmbercardNumber\":\"JY201912232157384910\",\"mt\":{\"id\":1},\"payReceipts\":\"121212\",\"remark\":\"\",\"startTime\":1577030400000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '编辑会员卡信息', '2019-12-26 13:35:13', '2019-12-26 13:35:13');
INSERT INTO `sys_log` VALUES (601, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-26 13:35:44', '2019-12-26 13:35:44');
INSERT INTO `sys_log` VALUES (602, 1, 'admin', 'com.xieke.admin.web.ClubCardController.edit', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1594569600000,\"fromsource\":{\"id\":1},\"id\":12,\"memberStatus\":0,\"menmbercardNumber\":\"JY201912232157384910\",\"mt\":{\"id\":1},\"payReceipts\":\"121212\",\"remark\":\"\",\"startTime\":1577203200000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '编辑会员卡信息', '2019-12-26 13:36:23', '2019-12-26 13:36:23');
INSERT INTO `sys_log` VALUES (603, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-26 13:41:04', '2019-12-26 13:41:04');
INSERT INTO `sys_log` VALUES (604, 1, 'admin', 'com.xieke.admin.web.ClubCardController.edit', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1594569600000,\"fromsource\":{\"id\":1},\"id\":12,\"memberStatus\":0,\"menmbercardNumber\":\"JY201912232157384910\",\"mt\":{\"id\":1},\"payReceipts\":\"121212\",\"remark\":\"\",\"startTime\":1577203200000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '编辑会员卡信息', '2019-12-26 13:41:09', '2019-12-26 13:41:09');
INSERT INTO `sys_log` VALUES (605, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-26 13:41:14', '2019-12-26 13:41:14');
INSERT INTO `sys_log` VALUES (606, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-26 13:44:30', '2019-12-26 13:44:30');
INSERT INTO `sys_log` VALUES (607, 1, 'admin', 'com.xieke.admin.web.ClubCardController.edit', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1594569600000,\"fromsource\":{\"id\":1},\"id\":12,\"memberStatus\":0,\"menmbercardNumber\":\"JY201912232157384910\",\"mt\":{\"id\":1},\"payReceipts\":\"121212\",\"remark\":\"\",\"startTime\":1577203200000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '编辑会员卡信息', '2019-12-26 13:44:36', '2019-12-26 13:44:36');
INSERT INTO `sys_log` VALUES (608, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-26 13:44:43', '2019-12-26 13:44:43');
INSERT INTO `sys_log` VALUES (609, 1, 'admin', 'com.xieke.admin.web.ClubCardController.edit', '{\"cardsetting\":{\"cardType\":0,\"id\":3,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1608825600000,\"fromsource\":{\"id\":1},\"id\":12,\"memberStatus\":0,\"menmbercardNumber\":\"JY201912232157384910\",\"mt\":{\"id\":1},\"payReceipts\":\"121212\",\"remark\":\"\",\"startTime\":1577203200000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '编辑会员卡信息', '2019-12-26 13:45:08', '2019-12-26 13:45:08');
INSERT INTO `sys_log` VALUES (610, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-26 17:38:53', '2019-12-26 17:38:53');
INSERT INTO `sys_log` VALUES (611, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-26 17:50:29', '2019-12-26 17:50:29');
INSERT INTO `sys_log` VALUES (612, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-26 17:53:03', '2019-12-26 17:53:03');
INSERT INTO `sys_log` VALUES (613, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-26 17:55:23', '2019-12-26 17:55:23');
INSERT INTO `sys_log` VALUES (614, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-26 17:56:13', '2019-12-26 17:56:13');
INSERT INTO `sys_log` VALUES (615, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-26 17:56:18', '2019-12-26 17:56:18');
INSERT INTO `sys_log` VALUES (616, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-26 18:09:35', '2019-12-26 18:09:35');
INSERT INTO `sys_log` VALUES (617, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-26 18:10:03', '2019-12-26 18:10:03');
INSERT INTO `sys_log` VALUES (618, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-26 18:15:55', '2019-12-26 18:15:55');
INSERT INTO `sys_log` VALUES (619, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examine', '\"12\"', '审核', '2019-12-26 18:16:42', '2019-12-26 18:16:42');
INSERT INTO `sys_log` VALUES (620, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-26 18:16:51', '2019-12-26 18:16:51');
INSERT INTO `sys_log` VALUES (621, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-26 18:28:15', '2019-12-26 18:28:15');
INSERT INTO `sys_log` VALUES (622, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-26 18:28:48', '2019-12-26 18:28:48');
INSERT INTO `sys_log` VALUES (623, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-26 18:31:27', '2019-12-26 18:31:27');
INSERT INTO `sys_log` VALUES (624, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-26 18:31:58', '2019-12-26 18:31:58');
INSERT INTO `sys_log` VALUES (625, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-26 18:33:40', '2019-12-26 18:33:40');
INSERT INTO `sys_log` VALUES (626, 1, 'admin', 'com.xieke.admin.web.ClubCardController.examinePage', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '会员卡审核', '2019-12-26 18:39:10', '2019-12-26 18:39:10');
INSERT INTO `sys_log` VALUES (627, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-30 13:57:13', '2019-12-30 13:57:13');
INSERT INTO `sys_log` VALUES (628, 1, 'admin', 'com.xieke.admin.web.ClubCardController.edit', '{\"cardsetting\":{\"cardType\":0,\"id\":3,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1608825600000,\"fromsource\":{\"id\":6},\"id\":12,\"memberStatus\":0,\"menmbercardNumber\":\"JY201912232157384910\",\"mt\":{\"id\":1},\"payReceipts\":\"121212\",\"remark\":\"\",\"startTime\":1577203200000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '编辑会员卡信息', '2019-12-30 13:57:16', '2019-12-30 13:57:16');
INSERT INTO `sys_log` VALUES (629, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-30 13:57:20', '2019-12-30 13:57:20');
INSERT INTO `sys_log` VALUES (630, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-30 13:57:30', '2019-12-30 13:57:30');
INSERT INTO `sys_log` VALUES (631, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-30 14:45:43', '2019-12-30 14:45:43');
INSERT INTO `sys_log` VALUES (632, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-30 14:46:58', '2019-12-30 14:46:58');
INSERT INTO `sys_log` VALUES (633, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-30 14:47:25', '2019-12-30 14:47:25');
INSERT INTO `sys_log` VALUES (634, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-30 17:33:10', '2019-12-30 17:33:10');
INSERT INTO `sys_log` VALUES (635, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-30 17:36:30', '2019-12-30 17:36:30');
INSERT INTO `sys_log` VALUES (636, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-30 17:37:36', '2019-12-30 17:37:36');
INSERT INTO `sys_log` VALUES (637, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2019-12-30 19:01:16', '2019-12-30 19:01:16');
INSERT INTO `sys_log` VALUES (638, 1, 'admin', 'com.xieke.admin.web.ClubCardController.del', '\"12\"', '删除会员卡信息', '2019-12-30 19:01:39', '2019-12-30 19:01:39');
INSERT INTO `sys_log` VALUES (639, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-31 13:30:31', '2019-12-31 13:30:31');
INSERT INTO `sys_log` VALUES (640, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-31 13:34:20', '2019-12-31 13:34:20');
INSERT INTO `sys_log` VALUES (641, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-31 13:34:35', '2019-12-31 13:34:35');
INSERT INTO `sys_log` VALUES (642, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-31 13:34:43', '2019-12-31 13:34:43');
INSERT INTO `sys_log` VALUES (643, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-31 13:36:26', '2019-12-31 13:36:26');
INSERT INTO `sys_log` VALUES (644, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2019-12-31 13:58:11', '2019-12-31 13:58:11');
INSERT INTO `sys_log` VALUES (645, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":734,\"permissionCode\":\"winner:set\",\"permissionName\":\"中奖人设定\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-31 16:33:21', '2019-12-31 16:33:21');
INSERT INTO `sys_log` VALUES (646, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",7,733,734,735,736,737,738,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,2,4,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-31 16:33:31', '2019-12-31 16:33:31');
INSERT INTO `sys_log` VALUES (647, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":734,\"permissionCode\":\"winner:view\",\"permissionName\":\"查看设定\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-31 18:10:22', '2019-12-31 18:10:22');
INSERT INTO `sys_log` VALUES (648, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",7,733,734,735,736,737,738,739,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,2,4,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-31 18:10:33', '2019-12-31 18:10:33');
INSERT INTO `sys_log` VALUES (649, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":734,\"permissionCode\":\"winner:del\",\"permissionName\":\"删除设定\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2019-12-31 18:22:40', '2019-12-31 18:22:40');
INSERT INTO `sys_log` VALUES (650, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",7,733,734,735,736,737,738,739,740,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,2,4,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2019-12-31 18:22:50', '2019-12-31 18:22:50');
INSERT INTO `sys_log` VALUES (651, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2020-01-02 13:33:23', '2020-01-02 13:33:23');
INSERT INTO `sys_log` VALUES (652, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2020-01-02 13:37:00', '2020-01-02 13:37:00');
INSERT INTO `sys_log` VALUES (653, 1, 'admin', 'com.xieke.admin.web.CustomerController.save', '{\"birthday\":283968000000,\"cusType\":0,\"email\":\"\",\"fromsource\":{\"id\":6},\"icCardId\":\"\",\"icCardNum\":\"\",\"id\":0,\"idCard\":\"\",\"intro\":{\"cusType\":0,\"id\":0,\"sex\":0},\"mt\":{},\"name\":\"安师大会\",\"phone\":\"15151151654\",\"reception\":{},\"remark\":\"\",\"sex\":1,\"store\":\"金彦舞蹈（经开店）\"}', '保存客户信息操作', '2020-01-02 13:37:07', '2020-01-02 13:37:07');
INSERT INTO `sys_log` VALUES (654, 1, 'admin', 'com.xieke.admin.web.CustomerController.del', '[10]', '删除客户信息操作', '2020-01-02 13:53:53', '2020-01-02 13:53:53');
INSERT INTO `sys_log` VALUES (655, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2020-01-06 10:54:04', '2020-01-06 10:54:04');
INSERT INTO `sys_log` VALUES (656, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":2,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1621440000000,\"fromsource\":{\"id\":6},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":1},\"payReceipts\":\"\",\"remark\":\"\",\"startTime\":1578240000000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '添加会员卡信息', '2020-01-06 10:54:21', '2020-01-06 10:54:21');
INSERT INTO `sys_log` VALUES (657, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2020-01-06 10:56:25', '2020-01-06 10:56:25');
INSERT INTO `sys_log` VALUES (658, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1595520000000,\"fromsource\":{\"id\":6},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{\"id\":1},\"payReceipts\":\"\",\"remark\":\"\",\"startTime\":1578240000000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '添加会员卡信息', '2020-01-06 10:56:42', '2020-01-06 10:56:42');
INSERT INTO `sys_log` VALUES (659, 1, 'admin', 'com.xieke.admin.web.ClubCardController.printview', '{\"empty\":true,\"model\":{},\"modelMap\":{\"$ref\":\"$.model\"},\"reference\":false}', '打印会员卡信息', '2020-01-06 10:56:49', '2020-01-06 10:56:49');
INSERT INTO `sys_log` VALUES (660, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2020-01-06 10:59:40', '2020-01-06 10:59:40');
INSERT INTO `sys_log` VALUES (661, 1, 'admin', 'com.xieke.admin.web.ClubCardController.edit', '{\"cardsetting\":{\"cardType\":0,\"id\":1,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1595520000000,\"fromsource\":{\"id\":6},\"id\":14,\"memberStatus\":0,\"menmbercardNumber\":\"JY2020167104295168\",\"mt\":{\"id\":1},\"payReceipts\":\"\",\"remark\":\"\",\"startTime\":1578240000000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '编辑会员卡信息', '2020-01-06 10:59:42', '2020-01-06 10:59:42');
INSERT INTO `sys_log` VALUES (662, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2020-01-06 10:59:45', '2020-01-06 10:59:45');
INSERT INTO `sys_log` VALUES (663, 1, 'admin', 'com.xieke.admin.web.ClubCardController.add', '{\"cardsetting\":{\"cardType\":0,\"id\":2,\"num\":0,\"status\":0,\"validity\":0},\"customer\":{\"cusType\":0,\"id\":8,\"name\":\"杨彬\",\"sex\":0},\"endTime\":1621440000000,\"fromsource\":{\"id\":6},\"id\":0,\"memberStatus\":0,\"menmbercardNumber\":\"\",\"mt\":{},\"payReceipts\":\"\",\"remark\":\"\",\"startTime\":1578240000000,\"storeScope\":\"金彦舞蹈（经开店）\"}', '添加会员卡信息', '2020-01-06 10:59:57', '2020-01-06 10:59:57');
INSERT INTO `sys_log` VALUES (664, 1, 'admin', 'com.xieke.admin.web.ClubCardController.del', '\"15\"', '删除会员卡信息', '2020-01-06 11:00:19', '2020-01-06 11:00:19');
INSERT INTO `sys_log` VALUES (665, 1, 'admin', 'com.xieke.admin.web.ClubCardController.del', '\"14\"', '删除会员卡信息', '2020-01-06 11:00:22', '2020-01-06 11:00:22');
INSERT INTO `sys_log` VALUES (666, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2020-01-06 11:26:03', '2020-01-06 11:26:03');
INSERT INTO `sys_log` VALUES (667, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2020-01-06 11:26:15', '2020-01-06 11:26:15');
INSERT INTO `sys_log` VALUES (668, 1, 'admin', 'com.xieke.admin.web.CustomerController.del', '[8]', '删除客户信息操作', '2020-01-06 11:26:20', '2020-01-06 11:26:20');
INSERT INTO `sys_log` VALUES (669, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2020-01-06 11:28:55', '2020-01-06 11:28:55');
INSERT INTO `sys_log` VALUES (670, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2020-01-06 11:29:00', '2020-01-06 11:29:00');
INSERT INTO `sys_log` VALUES (671, 1, 'admin', 'com.xieke.admin.web.FromsourceController.getTree', NULL, '添加客户获取来源信息操作', '2020-01-06 11:39:14', '2020-01-06 11:39:14');
INSERT INTO `sys_log` VALUES (672, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":33,\"parentId\":3,\"permissionCode\":\"laiyuan\",\"permissionName\":\"来源管理\",\"resourceType\":\"menu\",\"url\":\"/fromsource/list\"}', '保存权限操作', '2020-01-06 12:33:02', '2020-01-06 12:33:02');
INSERT INTO `sys_log` VALUES (673, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",7,733,734,735,736,737,738,739,740,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,2,4,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-01-06 17:09:03', '2020-01-06 17:09:03');
INSERT INTO `sys_log` VALUES (674, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":4,\"permissionCode\":\"course:management\",\"permissionName\":\"课程管理\",\"resourceType\":\"menu\",\"url\":\"/private/management\"}', '保存权限操作', '2020-01-07 14:28:27', '2020-01-07 14:28:27');
INSERT INTO `sys_log` VALUES (675, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",7,733,734,735,736,737,738,739,740,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,4,741,2,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-01-07 14:28:38', '2020-01-07 14:28:38');
INSERT INTO `sys_log` VALUES (676, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":741,\"parentId\":4,\"permissionCode\":\"course:management\",\"permissionName\":\"课程管理\",\"resourceType\":\"menu\",\"url\":\"/course\"}', '保存权限操作', '2020-01-07 14:37:43', '2020-01-07 14:37:43');
INSERT INTO `sys_log` VALUES (677, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"id\":741,\"parentId\":4,\"permissionCode\":\"course:management\",\"permissionName\":\"课程管理\",\"resourceType\":\"menu\",\"url\":\"/course/list\"}', '保存权限操作', '2020-01-07 15:34:02', '2020-01-07 15:34:02');
INSERT INTO `sys_log` VALUES (678, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":741,\"permissionCode\":\"cour:add\",\"permissionName\":\"新增\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2020-01-07 15:52:06', '2020-01-07 15:52:06');
INSERT INTO `sys_log` VALUES (679, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":741,\"permissionCode\":\"cour:edit\",\"permissionName\":\"编辑\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2020-01-07 15:52:23', '2020-01-07 15:52:23');
INSERT INTO `sys_log` VALUES (680, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":741,\"permissionCode\":\"cour:del\",\"permissionName\":\"删除\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2020-01-07 15:52:38', '2020-01-07 15:52:38');
INSERT INTO `sys_log` VALUES (681, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",7,733,734,735,736,737,738,739,740,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,4,741,742,743,744,2,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-01-07 15:52:49', '2020-01-07 15:52:49');
INSERT INTO `sys_log` VALUES (682, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":4,\"permissionCode\":\"contract:management\",\"permissionName\":\"合同管理\",\"resourceType\":\"menu\",\"url\":\"/pe/contract/list\"}', '保存权限操作', '2020-01-07 16:47:35', '2020-01-07 16:47:35');
INSERT INTO `sys_log` VALUES (683, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",7,733,734,735,736,737,738,739,740,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,4,741,742,743,744,745,2,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-01-07 16:47:45', '2020-01-07 16:47:45');
INSERT INTO `sys_log` VALUES (684, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":745,\"permissionCode\":\"contractset:add\",\"permissionName\":\"新增\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2020-01-08 14:21:49', '2020-01-08 14:21:49');
INSERT INTO `sys_log` VALUES (685, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",7,733,734,735,736,737,738,739,740,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,4,741,742,743,744,745,746,2,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-01-08 14:22:27', '2020-01-08 14:22:27');
INSERT INTO `sys_log` VALUES (686, 1, 'admin', 'com.xieke.admin.web.CustomerController.save', '{\"birthday\":283968000000,\"cusType\":0,\"email\":\"344295704@qq.com\",\"fromsource\":{\"id\":6},\"icCardId\":\"\",\"icCardNum\":\"\",\"id\":0,\"idCard\":\"\",\"intro\":{\"cusType\":0,\"id\":0,\"sex\":0},\"mt\":{\"id\":1},\"name\":\"杨彬\",\"phone\":\"18802927580\",\"reception\":{\"id\":1},\"remark\":\"\",\"sex\":0,\"store\":\"金彦舞蹈（经开店）\"}', '保存客户信息操作', '2020-01-08 19:03:51', '2020-01-08 19:03:51');
INSERT INTO `sys_log` VALUES (687, 1, 'admin', 'com.xieke.admin.web.pe.ContractController.add', '{\"auditStatus\":0,\"classHour\":\"60\",\"closingDate\":1580227200000,\"coach\":{\"coachNumber\":\"CO5123\",\"freeCoach\":0,\"id\":1,\"isManager\":0,\"name\":\"杨彬（教练）\",\"sex\":0,\"status\":0},\"contractNumber\":\"\",\"course\":{\"id\":4},\"customer\":{\"cusType\":0,\"id\":11,\"name\":\"杨彬\",\"sex\":0},\"effectiveDate\":1578412800000,\"freqPresent\":5,\"fromsource\":{\"id\":6},\"isFreeClass\":0,\"mt\":{\"id\":1},\"paymentDocu\":\"4545\",\"postponement\":0,\"presentationPoints\":200,\"purchaseTimes\":40,\"remark\":\"45412\",\"residualTimes\":0,\"signingDate\":1578412800000,\"status\":0,\"store\":\"金彦舞(经开店)\",\"totalAmountOfGifts\":\"500\",\"totalNumber\":45,\"totalPurchaseAmount\":4000,\"totalSum\":\"4500\",\"unitPrice\":\"100\"}', '添加私教合同信息', '2020-01-08 19:31:39', '2020-01-08 19:31:39');
INSERT INTO `sys_log` VALUES (688, 1, 'admin', 'com.xieke.admin.web.pe.ContractController.add', '{\"auditStatus\":0,\"classHour\":\"60\",\"closingDate\":1580400000000,\"coach\":{\"coachNumber\":\"CO5123\",\"freeCoach\":0,\"id\":1,\"isManager\":0,\"name\":\"杨彬（教练）\",\"sex\":0,\"status\":0},\"contractNumber\":\"\",\"course\":{\"id\":4},\"customer\":{\"cusType\":0,\"id\":11,\"name\":\"杨彬\",\"sex\":0},\"effectiveDate\":1578499200000,\"freqPresent\":10,\"fromsource\":{\"id\":6},\"isFreeClass\":0,\"mt\":{\"id\":1},\"paymentDocu\":\"12121\",\"postponement\":0,\"presentationPoints\":200,\"purchaseTimes\":40,\"remark\":\"\",\"residualTimes\":0,\"signingDate\":1578499200000,\"status\":0,\"store\":\"金彦舞(经开店)\",\"totalAmountOfGifts\":\"1000\",\"totalNumber\":50,\"totalPurchaseAmount\":4000,\"totalSum\":\"5000\",\"unitPrice\":\"100\"}', '添加私教合同信息', '2020-01-09 13:36:33', '2020-01-09 13:36:33');
INSERT INTO `sys_log` VALUES (689, 1, 'admin', 'com.xieke.admin.web.pe.ContractController.add', '{\"auditStatus\":0,\"classHour\":\"60\",\"closingDate\":1580400000000,\"coach\":{\"coachNumber\":\"CO5123\",\"freeCoach\":0,\"id\":1,\"isManager\":0,\"name\":\"杨彬（教练）\",\"sex\":0,\"status\":0},\"contractNumber\":\"\",\"course\":{\"id\":4},\"customer\":{\"cusType\":0,\"id\":11,\"name\":\"杨彬\",\"sex\":0},\"effectiveDate\":1578499200000,\"freqPresent\":0,\"fromsource\":{\"id\":6},\"isFreeClass\":0,\"mt\":{\"id\":1},\"paymentDocu\":\"52425\",\"postponement\":0,\"presentationPoints\":200,\"purchaseTimes\":10,\"remark\":\"\",\"residualTimes\":0,\"signingDate\":1578499200000,\"status\":0,\"store\":\"金彦舞(经开店)\",\"totalAmountOfGifts\":\"0\",\"totalNumber\":10,\"totalPurchaseAmount\":1000,\"totalSum\":\"1000\",\"unitPrice\":\"100\"}', '添加私教合同信息', '2020-01-09 13:42:02', '2020-01-09 13:42:02');
INSERT INTO `sys_log` VALUES (690, 1, 'admin', 'com.xieke.admin.web.pe.ContractController.add', '{\"auditStatus\":0,\"classHour\":\"60\",\"closingDate\":1580400000000,\"coach\":{\"coachNumber\":\"CO5123\",\"freeCoach\":0,\"id\":1,\"isManager\":0,\"name\":\"杨彬（教练）\",\"sex\":0,\"status\":0},\"contractNumber\":\"\",\"course\":{\"id\":4},\"customer\":{\"cusType\":0,\"id\":11,\"name\":\"杨彬\",\"sex\":0},\"effectiveDate\":1578499200000,\"freqPresent\":0,\"fromsource\":{\"id\":6},\"isFreeClass\":0,\"mt\":{\"id\":1},\"paymentDocu\":\"10414\",\"postponement\":0,\"presentationPoints\":200,\"purchaseTimes\":10,\"remark\":\"\",\"residualTimes\":0,\"signingDate\":1578499200000,\"status\":0,\"store\":\"金彦舞(经开店)\",\"totalAmountOfGifts\":\"0\",\"totalNumber\":10,\"totalPurchaseAmount\":1000,\"totalSum\":\"1000\",\"unitPrice\":\"100\"}', '添加私教合同信息', '2020-01-09 13:48:48', '2020-01-09 13:48:48');
INSERT INTO `sys_log` VALUES (691, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",7,733,734,735,736,737,738,739,740,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,4,741,742,743,744,745,746,748,749,750,751,2,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-01-09 13:53:33', '2020-01-09 13:53:33');
INSERT INTO `sys_log` VALUES (692, 1, 'admin', 'com.xieke.admin.web.pe.ContractController.add', '{\"auditStatus\":0,\"classHour\":\"60\",\"closingDate\":1580400000000,\"coach\":{\"coachNumber\":\"CO5123\",\"freeCoach\":0,\"id\":1,\"isManager\":0,\"name\":\"杨彬（教练）\",\"sex\":0,\"status\":0},\"contractNumber\":\"\",\"course\":{\"id\":4},\"customer\":{\"cusType\":0,\"id\":11,\"name\":\"杨彬\",\"sex\":0},\"effectiveDate\":1578499200000,\"freqPresent\":0,\"fromsource\":{\"id\":6},\"isFreeClass\":0,\"mt\":{\"id\":1},\"paymentDocu\":\"41212\",\"postponement\":0,\"presentationPoints\":200,\"purchaseTimes\":10,\"remark\":\"\",\"residualTimes\":0,\"signingDate\":1578499200000,\"status\":0,\"store\":\"金彦舞(经开店)\",\"totalAmountOfGifts\":\"0\",\"totalNumber\":10,\"totalPurchaseAmount\":1000,\"totalSum\":\"1000\",\"unitPrice\":\"100\"}', '添加私教合同信息', '2020-01-09 13:54:12', '2020-01-09 13:54:12');
INSERT INTO `sys_log` VALUES (693, 1, 'admin', 'com.xieke.admin.web.pe.ContractController.add', '{\"auditStatus\":0,\"classHour\":\"60\",\"closingDate\":1580400000000,\"coach\":{\"coachNumber\":\"CO5123\",\"freeCoach\":0,\"id\":1,\"isManager\":0,\"name\":\"杨彬（教练）\",\"sex\":0,\"status\":0},\"contractNumber\":\"\",\"course\":{\"id\":4},\"customer\":{\"cusType\":0,\"id\":11,\"name\":\"杨彬\",\"sex\":0},\"effectiveDate\":1578499200000,\"freqPresent\":0,\"fromsource\":{\"id\":6},\"isFreeClass\":0,\"mt\":{\"id\":1},\"paymentDocu\":\"545454\",\"postponement\":0,\"purchaseTimes\":10,\"remark\":\"\",\"residualTimes\":0,\"signingDate\":1578499200000,\"status\":0,\"store\":\"金彦舞(经开店)\",\"totalAmountOfGifts\":\"0\",\"totalNumber\":10,\"totalPurchaseAmount\":1000,\"totalSum\":\"1000\",\"unitPrice\":\"100\"}', '添加私教合同信息', '2020-01-09 14:17:45', '2020-01-09 14:17:45');
INSERT INTO `sys_log` VALUES (694, 1, 'admin', 'com.xieke.admin.web.PermissionController.save', '{\"available\":1,\"parentId\":745,\"permissionCode\":\"contractset:printview\",\"permissionName\":\"打印预览\",\"resourceType\":\"button\",\"url\":\"\"}', '保存权限操作', '2020-01-09 15:14:04', '2020-01-09 15:14:04');
INSERT INTO `sys_log` VALUES (695, 1, 'admin', 'com.xieke.admin.web.RoleController.save', '{\"available\":1,\"id\":6,\"permissionIds\":\",7,733,734,735,736,737,738,739,740,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,4,741,742,743,744,745,746,752,748,749,750,751,2,5,6,\",\"roleCode\":\"1\",\"roleName\":\"超级管理员\"}', '保存角色操作', '2020-01-09 15:14:15', '2020-01-09 15:14:15');
INSERT INTO `sys_log` VALUES (696, 1, 'admin', 'com.xieke.admin.web.pe.ContractController.add', '{\"auditStatus\":0,\"classHour\":\"60\",\"closingDate\":1580400000000,\"coach\":{\"coachNumber\":\"453453\",\"freeCoach\":0,\"id\":4,\"isManager\":0,\"name\":\"梁\",\"sex\":0,\"status\":0},\"contractNumber\":\"\",\"course\":{\"id\":5},\"customer\":{\"cusType\":0,\"id\":11,\"name\":\"杨彬\",\"sex\":0},\"effectiveDate\":1578499200000,\"freqPresent\":5,\"fromsource\":{\"id\":6},\"isFreeClass\":0,\"mt\":{\"id\":1},\"paymentDocu\":\"434\",\"postponement\":0,\"presentationPoints\":100,\"purchaseTimes\":10,\"remark\":\"\",\"residualTimes\":0,\"signingDate\":1578499200000,\"status\":0,\"store\":\"金彦舞蹈(经开店)\",\"totalAmountOfGifts\":\"1000\",\"totalNumber\":15,\"totalPurchaseAmount\":2000,\"totalSum\":\"3000\",\"unitPrice\":\"200\"}', '添加私教合同信息', '2020-01-09 17:19:36', '2020-01-09 17:19:36');

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_log`;
CREATE TABLE `sys_login_log`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `user_id` int(10) NULL DEFAULT NULL COMMENT '用户ID',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `ip_address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'IP地址',
  `geography_location` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地理位置',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 331 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '登录日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------
INSERT INTO `sys_login_log` VALUES (71, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 18:37:30', '2019-12-10 18:37:30');
INSERT INTO `sys_login_log` VALUES (72, 9, 'test', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 18:40:03', '2019-12-10 18:40:03');
INSERT INTO `sys_login_log` VALUES (73, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 18:40:21', '2019-12-10 18:40:21');
INSERT INTO `sys_login_log` VALUES (74, 9, 'test', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 18:40:58', '2019-12-10 18:40:58');
INSERT INTO `sys_login_log` VALUES (75, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 18:41:20', '2019-12-10 18:41:20');
INSERT INTO `sys_login_log` VALUES (76, 9, 'test', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 18:41:50', '2019-12-10 18:41:50');
INSERT INTO `sys_login_log` VALUES (77, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 18:52:43', '2019-12-10 18:52:43');
INSERT INTO `sys_login_log` VALUES (78, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 18:58:18', '2019-12-10 18:58:18');
INSERT INTO `sys_login_log` VALUES (79, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 19:00:35', '2019-12-10 19:00:35');
INSERT INTO `sys_login_log` VALUES (80, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 19:01:28', '2019-12-10 19:01:28');
INSERT INTO `sys_login_log` VALUES (81, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 19:03:05', '2019-12-10 19:03:05');
INSERT INTO `sys_login_log` VALUES (82, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 19:15:32', '2019-12-10 19:15:32');
INSERT INTO `sys_login_log` VALUES (83, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 19:35:17', '2019-12-10 19:35:17');
INSERT INTO `sys_login_log` VALUES (84, 9, 'test', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 19:54:08', '2019-12-10 19:54:08');
INSERT INTO `sys_login_log` VALUES (85, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 19:54:21', '2019-12-10 19:54:21');
INSERT INTO `sys_login_log` VALUES (86, 9, 'test', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 19:54:36', '2019-12-10 19:54:36');
INSERT INTO `sys_login_log` VALUES (87, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-10 19:54:46', '2019-12-10 19:54:46');
INSERT INTO `sys_login_log` VALUES (88, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-11 15:25:46', '2019-12-11 15:25:46');
INSERT INTO `sys_login_log` VALUES (89, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-14 13:48:56', '2019-12-14 13:48:56');
INSERT INTO `sys_login_log` VALUES (90, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-14 14:38:25', '2019-12-14 14:38:25');
INSERT INTO `sys_login_log` VALUES (91, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-14 15:12:59', '2019-12-14 15:12:59');
INSERT INTO `sys_login_log` VALUES (92, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-14 15:43:01', '2019-12-14 15:43:01');
INSERT INTO `sys_login_log` VALUES (93, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-14 16:17:02', '2019-12-14 16:17:02');
INSERT INTO `sys_login_log` VALUES (94, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-14 16:51:03', '2019-12-14 16:51:03');
INSERT INTO `sys_login_log` VALUES (95, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-14 16:54:15', '2019-12-14 16:54:15');
INSERT INTO `sys_login_log` VALUES (96, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-14 16:54:49', '2019-12-14 16:54:49');
INSERT INTO `sys_login_log` VALUES (97, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-14 16:55:48', '2019-12-14 16:55:48');
INSERT INTO `sys_login_log` VALUES (98, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-14 17:06:27', '2019-12-14 17:06:27');
INSERT INTO `sys_login_log` VALUES (99, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-14 17:13:24', '2019-12-14 17:13:24');
INSERT INTO `sys_login_log` VALUES (100, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-14 17:15:29', '2019-12-14 17:15:29');
INSERT INTO `sys_login_log` VALUES (101, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-14 17:15:51', '2019-12-14 17:15:51');
INSERT INTO `sys_login_log` VALUES (102, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-14 18:08:51', '2019-12-14 18:08:51');
INSERT INTO `sys_login_log` VALUES (103, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-15 13:39:15', '2019-12-15 13:39:15');
INSERT INTO `sys_login_log` VALUES (104, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-15 14:16:21', '2019-12-15 14:16:21');
INSERT INTO `sys_login_log` VALUES (105, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-15 14:45:39', '2019-12-15 14:45:39');
INSERT INTO `sys_login_log` VALUES (106, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-15 15:23:00', '2019-12-15 15:23:00');
INSERT INTO `sys_login_log` VALUES (107, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-15 15:58:52', '2019-12-15 15:58:52');
INSERT INTO `sys_login_log` VALUES (108, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-15 16:29:30', '2019-12-15 16:29:30');
INSERT INTO `sys_login_log` VALUES (109, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-15 17:04:58', '2019-12-15 17:04:58');
INSERT INTO `sys_login_log` VALUES (110, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-15 17:44:00', '2019-12-15 17:44:00');
INSERT INTO `sys_login_log` VALUES (111, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-15 19:17:24', '2019-12-15 19:17:24');
INSERT INTO `sys_login_log` VALUES (112, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-15 20:05:14', '2019-12-15 20:05:14');
INSERT INTO `sys_login_log` VALUES (113, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-15 20:41:18', '2019-12-15 20:41:18');
INSERT INTO `sys_login_log` VALUES (114, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-15 21:16:12', '2019-12-15 21:16:12');
INSERT INTO `sys_login_log` VALUES (115, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 10:54:30', '2019-12-16 10:54:30');
INSERT INTO `sys_login_log` VALUES (116, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 11:39:56', '2019-12-16 11:39:56');
INSERT INTO `sys_login_log` VALUES (117, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 11:44:26', '2019-12-16 11:44:26');
INSERT INTO `sys_login_log` VALUES (118, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 12:20:47', '2019-12-16 12:20:47');
INSERT INTO `sys_login_log` VALUES (119, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 12:53:21', '2019-12-16 12:53:21');
INSERT INTO `sys_login_log` VALUES (120, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 13:28:32', '2019-12-16 13:28:32');
INSERT INTO `sys_login_log` VALUES (121, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 14:19:21', '2019-12-16 14:19:21');
INSERT INTO `sys_login_log` VALUES (122, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 14:52:41', '2019-12-16 14:52:41');
INSERT INTO `sys_login_log` VALUES (123, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 15:05:20', '2019-12-16 15:05:20');
INSERT INTO `sys_login_log` VALUES (124, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 15:06:44', '2019-12-16 15:06:44');
INSERT INTO `sys_login_log` VALUES (125, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 15:07:12', '2019-12-16 15:07:12');
INSERT INTO `sys_login_log` VALUES (126, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 16:00:29', '2019-12-16 16:00:29');
INSERT INTO `sys_login_log` VALUES (127, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 16:44:32', '2019-12-16 16:44:32');
INSERT INTO `sys_login_log` VALUES (128, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 17:20:46', '2019-12-16 17:20:46');
INSERT INTO `sys_login_log` VALUES (129, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 17:56:07', '2019-12-16 17:56:07');
INSERT INTO `sys_login_log` VALUES (130, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 18:26:11', '2019-12-16 18:26:11');
INSERT INTO `sys_login_log` VALUES (131, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 19:00:49', '2019-12-16 19:00:49');
INSERT INTO `sys_login_log` VALUES (132, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 19:31:53', '2019-12-16 19:31:53');
INSERT INTO `sys_login_log` VALUES (133, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 20:04:22', '2019-12-16 20:04:22');
INSERT INTO `sys_login_log` VALUES (134, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 20:35:42', '2019-12-16 20:35:42');
INSERT INTO `sys_login_log` VALUES (135, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-16 21:10:35', '2019-12-16 21:10:35');
INSERT INTO `sys_login_log` VALUES (136, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-17 14:24:16', '2019-12-17 14:24:16');
INSERT INTO `sys_login_log` VALUES (137, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-17 14:55:07', '2019-12-17 14:55:07');
INSERT INTO `sys_login_log` VALUES (138, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-17 15:27:41', '2019-12-17 15:27:41');
INSERT INTO `sys_login_log` VALUES (139, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-17 16:05:13', '2019-12-17 16:05:13');
INSERT INTO `sys_login_log` VALUES (140, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-17 16:37:39', '2019-12-17 16:37:39');
INSERT INTO `sys_login_log` VALUES (141, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-17 17:08:00', '2019-12-17 17:08:00');
INSERT INTO `sys_login_log` VALUES (142, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-17 17:43:25', '2019-12-17 17:43:25');
INSERT INTO `sys_login_log` VALUES (143, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-17 18:13:46', '2019-12-17 18:13:46');
INSERT INTO `sys_login_log` VALUES (144, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-17 18:36:23', '2019-12-17 18:36:23');
INSERT INTO `sys_login_log` VALUES (145, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-17 20:14:07', '2019-12-17 20:14:07');
INSERT INTO `sys_login_log` VALUES (146, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-17 20:54:11', '2019-12-17 20:54:11');
INSERT INTO `sys_login_log` VALUES (147, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-17 21:33:44', '2019-12-17 21:33:44');
INSERT INTO `sys_login_log` VALUES (148, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-18 13:56:22', '2019-12-18 13:56:22');
INSERT INTO `sys_login_log` VALUES (149, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-18 14:05:04', '2019-12-18 14:05:04');
INSERT INTO `sys_login_log` VALUES (150, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-18 14:36:38', '2019-12-18 14:36:38');
INSERT INTO `sys_login_log` VALUES (151, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-18 15:24:37', '2019-12-18 15:24:37');
INSERT INTO `sys_login_log` VALUES (152, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-18 16:22:41', '2019-12-18 16:22:41');
INSERT INTO `sys_login_log` VALUES (153, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-18 17:43:30', '2019-12-18 17:43:30');
INSERT INTO `sys_login_log` VALUES (154, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-18 18:20:38', '2019-12-18 18:20:38');
INSERT INTO `sys_login_log` VALUES (155, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-18 19:04:17', '2019-12-18 19:04:17');
INSERT INTO `sys_login_log` VALUES (156, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-18 19:53:19', '2019-12-18 19:53:19');
INSERT INTO `sys_login_log` VALUES (157, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-18 19:57:23', '2019-12-18 19:57:23');
INSERT INTO `sys_login_log` VALUES (158, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-18 20:30:20', '2019-12-18 20:30:20');
INSERT INTO `sys_login_log` VALUES (159, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-18 21:19:24', '2019-12-18 21:19:24');
INSERT INTO `sys_login_log` VALUES (160, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 13:21:46', '2019-12-19 13:21:46');
INSERT INTO `sys_login_log` VALUES (161, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 13:52:22', '2019-12-19 13:52:22');
INSERT INTO `sys_login_log` VALUES (162, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 14:34:00', '2019-12-19 14:34:00');
INSERT INTO `sys_login_log` VALUES (163, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 15:19:31', '2019-12-19 15:19:31');
INSERT INTO `sys_login_log` VALUES (164, 11, '123456', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 15:21:47', '2019-12-19 15:21:47');
INSERT INTO `sys_login_log` VALUES (165, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 15:23:37', '2019-12-19 15:23:37');
INSERT INTO `sys_login_log` VALUES (166, 11, '123456', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 15:25:21', '2019-12-19 15:25:21');
INSERT INTO `sys_login_log` VALUES (167, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 15:26:46', '2019-12-19 15:26:46');
INSERT INTO `sys_login_log` VALUES (168, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 15:53:39', '2019-12-19 15:53:39');
INSERT INTO `sys_login_log` VALUES (169, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 16:07:11', '2019-12-19 16:07:11');
INSERT INTO `sys_login_log` VALUES (170, 10, 'liang', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 16:07:43', '2019-12-19 16:07:43');
INSERT INTO `sys_login_log` VALUES (171, 10, 'liang', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 16:10:59', '2019-12-19 16:10:59');
INSERT INTO `sys_login_log` VALUES (172, 10, 'liang', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 16:12:37', '2019-12-19 16:12:37');
INSERT INTO `sys_login_log` VALUES (173, 11, '123456', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 16:13:23', '2019-12-19 16:13:23');
INSERT INTO `sys_login_log` VALUES (174, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 16:13:45', '2019-12-19 16:13:45');
INSERT INTO `sys_login_log` VALUES (175, 11, '123456', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 16:16:00', '2019-12-19 16:16:00');
INSERT INTO `sys_login_log` VALUES (176, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 16:16:32', '2019-12-19 16:16:32');
INSERT INTO `sys_login_log` VALUES (177, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 16:31:49', '2019-12-19 16:31:49');
INSERT INTO `sys_login_log` VALUES (178, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 18:03:47', '2019-12-19 18:03:47');
INSERT INTO `sys_login_log` VALUES (179, 10, 'liang', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 18:05:29', '2019-12-19 18:05:29');
INSERT INTO `sys_login_log` VALUES (180, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 18:05:55', '2019-12-19 18:05:55');
INSERT INTO `sys_login_log` VALUES (181, 10, 'liang', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 18:07:22', '2019-12-19 18:07:22');
INSERT INTO `sys_login_log` VALUES (182, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 18:07:42', '2019-12-19 18:07:42');
INSERT INTO `sys_login_log` VALUES (183, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 18:08:09', '2019-12-19 18:08:09');
INSERT INTO `sys_login_log` VALUES (184, 10, 'liang', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 18:08:42', '2019-12-19 18:08:42');
INSERT INTO `sys_login_log` VALUES (185, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 18:21:46', '2019-12-19 18:21:46');
INSERT INTO `sys_login_log` VALUES (186, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 18:22:55', '2019-12-19 18:22:55');
INSERT INTO `sys_login_log` VALUES (187, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 18:25:54', '2019-12-19 18:25:54');
INSERT INTO `sys_login_log` VALUES (188, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 18:26:40', '2019-12-19 18:26:40');
INSERT INTO `sys_login_log` VALUES (189, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 18:31:01', '2019-12-19 18:31:01');
INSERT INTO `sys_login_log` VALUES (190, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 18:31:51', '2019-12-19 18:31:51');
INSERT INTO `sys_login_log` VALUES (191, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 19:09:41', '2019-12-19 19:09:41');
INSERT INTO `sys_login_log` VALUES (192, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 19:09:53', '2019-12-19 19:09:53');
INSERT INTO `sys_login_log` VALUES (193, 12, 'yang', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 19:13:15', '2019-12-19 19:13:15');
INSERT INTO `sys_login_log` VALUES (194, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 19:15:28', '2019-12-19 19:15:28');
INSERT INTO `sys_login_log` VALUES (195, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-19 19:45:31', '2019-12-19 19:45:31');
INSERT INTO `sys_login_log` VALUES (196, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-20 15:28:16', '2019-12-20 15:28:16');
INSERT INTO `sys_login_log` VALUES (197, 10, 'liang', '0:0:0:0:0:0:0:1', NULL, '2019-12-20 15:30:59', '2019-12-20 15:30:59');
INSERT INTO `sys_login_log` VALUES (198, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-20 18:03:58', '2019-12-20 18:03:58');
INSERT INTO `sys_login_log` VALUES (199, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-20 18:05:17', '2019-12-20 18:05:17');
INSERT INTO `sys_login_log` VALUES (200, 13, 'yang', '0:0:0:0:0:0:0:1', NULL, '2019-12-20 18:06:00', '2019-12-20 18:06:00');
INSERT INTO `sys_login_log` VALUES (201, 13, 'yang', '0:0:0:0:0:0:0:1', NULL, '2019-12-20 18:08:56', '2019-12-20 18:08:56');
INSERT INTO `sys_login_log` VALUES (202, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-20 18:12:53', '2019-12-20 18:12:53');
INSERT INTO `sys_login_log` VALUES (203, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-20 18:43:38', '2019-12-20 18:43:38');
INSERT INTO `sys_login_log` VALUES (204, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-20 19:23:58', '2019-12-20 19:23:58');
INSERT INTO `sys_login_log` VALUES (205, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 14:23:04', '2019-12-21 14:23:04');
INSERT INTO `sys_login_log` VALUES (206, 13, 'yang', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 14:29:09', '2019-12-21 14:29:09');
INSERT INTO `sys_login_log` VALUES (207, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 14:37:22', '2019-12-21 14:37:22');
INSERT INTO `sys_login_log` VALUES (208, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 14:41:15', '2019-12-21 14:41:15');
INSERT INTO `sys_login_log` VALUES (209, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 15:34:20', '2019-12-21 15:34:20');
INSERT INTO `sys_login_log` VALUES (210, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 15:39:12', '2019-12-21 15:39:12');
INSERT INTO `sys_login_log` VALUES (211, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 15:49:16', '2019-12-21 15:49:16');
INSERT INTO `sys_login_log` VALUES (212, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 17:19:31', '2019-12-21 17:19:31');
INSERT INTO `sys_login_log` VALUES (213, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 17:49:44', '2019-12-21 17:49:44');
INSERT INTO `sys_login_log` VALUES (214, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 17:51:41', '2019-12-21 17:51:41');
INSERT INTO `sys_login_log` VALUES (215, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 18:14:16', '2019-12-21 18:14:16');
INSERT INTO `sys_login_log` VALUES (216, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 18:46:56', '2019-12-21 18:46:56');
INSERT INTO `sys_login_log` VALUES (217, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 18:55:28', '2019-12-21 18:55:28');
INSERT INTO `sys_login_log` VALUES (218, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 18:55:42', '2019-12-21 18:55:42');
INSERT INTO `sys_login_log` VALUES (219, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 19:25:46', '2019-12-21 19:25:46');
INSERT INTO `sys_login_log` VALUES (220, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 19:30:13', '2019-12-21 19:30:13');
INSERT INTO `sys_login_log` VALUES (221, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 19:30:52', '2019-12-21 19:30:52');
INSERT INTO `sys_login_log` VALUES (222, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-21 19:31:14', '2019-12-21 19:31:14');
INSERT INTO `sys_login_log` VALUES (223, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 13:12:43', '2019-12-23 13:12:43');
INSERT INTO `sys_login_log` VALUES (224, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 13:19:05', '2019-12-23 13:19:05');
INSERT INTO `sys_login_log` VALUES (225, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 13:21:21', '2019-12-23 13:21:21');
INSERT INTO `sys_login_log` VALUES (226, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 13:22:41', '2019-12-23 13:22:41');
INSERT INTO `sys_login_log` VALUES (227, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 13:25:33', '2019-12-23 13:25:33');
INSERT INTO `sys_login_log` VALUES (228, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 13:26:34', '2019-12-23 13:26:34');
INSERT INTO `sys_login_log` VALUES (229, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 13:27:47', '2019-12-23 13:27:47');
INSERT INTO `sys_login_log` VALUES (230, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 14:49:53', '2019-12-23 14:49:53');
INSERT INTO `sys_login_log` VALUES (231, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 14:54:51', '2019-12-23 14:54:51');
INSERT INTO `sys_login_log` VALUES (232, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 14:59:24', '2019-12-23 14:59:24');
INSERT INTO `sys_login_log` VALUES (233, 13, 'yang', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 15:00:33', '2019-12-23 15:00:33');
INSERT INTO `sys_login_log` VALUES (234, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 15:05:03', '2019-12-23 15:05:03');
INSERT INTO `sys_login_log` VALUES (235, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 15:05:38', '2019-12-23 15:05:38');
INSERT INTO `sys_login_log` VALUES (236, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 15:14:52', '2019-12-23 15:14:52');
INSERT INTO `sys_login_log` VALUES (237, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 15:38:36', '2019-12-23 15:38:36');
INSERT INTO `sys_login_log` VALUES (238, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 15:38:50', '2019-12-23 15:38:50');
INSERT INTO `sys_login_log` VALUES (239, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 16:20:47', '2019-12-23 16:20:47');
INSERT INTO `sys_login_log` VALUES (240, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 17:00:50', '2019-12-23 17:00:50');
INSERT INTO `sys_login_log` VALUES (241, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 17:02:21', '2019-12-23 17:02:21');
INSERT INTO `sys_login_log` VALUES (242, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 17:40:07', '2019-12-23 17:40:07');
INSERT INTO `sys_login_log` VALUES (243, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 18:23:23', '2019-12-23 18:23:23');
INSERT INTO `sys_login_log` VALUES (244, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 18:53:37', '2019-12-23 18:53:37');
INSERT INTO `sys_login_log` VALUES (245, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 19:16:44', '2019-12-23 19:16:44');
INSERT INTO `sys_login_log` VALUES (246, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 20:07:29', '2019-12-23 20:07:29');
INSERT INTO `sys_login_log` VALUES (247, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 20:38:15', '2019-12-23 20:38:15');
INSERT INTO `sys_login_log` VALUES (248, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-23 21:25:47', '2019-12-23 21:25:47');
INSERT INTO `sys_login_log` VALUES (249, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-24 13:22:27', '2019-12-24 13:22:27');
INSERT INTO `sys_login_log` VALUES (250, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-24 14:28:34', '2019-12-24 14:28:34');
INSERT INTO `sys_login_log` VALUES (251, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-24 15:50:06', '2019-12-24 15:50:06');
INSERT INTO `sys_login_log` VALUES (252, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-24 16:00:53', '2019-12-24 16:00:53');
INSERT INTO `sys_login_log` VALUES (253, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-24 16:18:48', '2019-12-24 16:18:48');
INSERT INTO `sys_login_log` VALUES (254, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-24 16:19:31', '2019-12-24 16:19:31');
INSERT INTO `sys_login_log` VALUES (255, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-24 17:29:37', '2019-12-24 17:29:37');
INSERT INTO `sys_login_log` VALUES (256, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-24 17:55:29', '2019-12-24 17:55:29');
INSERT INTO `sys_login_log` VALUES (257, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-24 18:30:18', '2019-12-24 18:30:18');
INSERT INTO `sys_login_log` VALUES (258, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-24 19:01:55', '2019-12-24 19:01:55');
INSERT INTO `sys_login_log` VALUES (259, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-24 19:31:57', '2019-12-24 19:31:57');
INSERT INTO `sys_login_log` VALUES (260, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-24 20:04:21', '2019-12-24 20:04:21');
INSERT INTO `sys_login_log` VALUES (261, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-24 20:30:20', '2019-12-24 20:30:20');
INSERT INTO `sys_login_log` VALUES (262, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-25 12:55:56', '2019-12-25 12:55:56');
INSERT INTO `sys_login_log` VALUES (263, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-25 13:31:56', '2019-12-25 13:31:56');
INSERT INTO `sys_login_log` VALUES (264, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-25 14:03:23', '2019-12-25 14:03:23');
INSERT INTO `sys_login_log` VALUES (265, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-25 14:37:34', '2019-12-25 14:37:34');
INSERT INTO `sys_login_log` VALUES (266, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-25 17:32:14', '2019-12-25 17:32:14');
INSERT INTO `sys_login_log` VALUES (267, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-25 18:02:36', '2019-12-25 18:02:36');
INSERT INTO `sys_login_log` VALUES (268, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-25 19:10:31', '2019-12-25 19:10:31');
INSERT INTO `sys_login_log` VALUES (269, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-25 19:40:32', '2019-12-25 19:40:32');
INSERT INTO `sys_login_log` VALUES (270, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-25 19:47:26', '2019-12-25 19:47:26');
INSERT INTO `sys_login_log` VALUES (271, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-25 20:19:45', '2019-12-25 20:19:45');
INSERT INTO `sys_login_log` VALUES (272, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-26 13:06:47', '2019-12-26 13:06:47');
INSERT INTO `sys_login_log` VALUES (273, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-26 13:39:33', '2019-12-26 13:39:33');
INSERT INTO `sys_login_log` VALUES (274, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-26 15:34:14', '2019-12-26 15:34:14');
INSERT INTO `sys_login_log` VALUES (275, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-26 17:35:43', '2019-12-26 17:35:43');
INSERT INTO `sys_login_log` VALUES (276, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-26 18:09:30', '2019-12-26 18:09:30');
INSERT INTO `sys_login_log` VALUES (277, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-26 21:27:13', '2019-12-26 21:27:13');
INSERT INTO `sys_login_log` VALUES (278, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-27 14:00:33', '2019-12-27 14:00:33');
INSERT INTO `sys_login_log` VALUES (279, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-30 13:56:31', '2019-12-30 13:56:31');
INSERT INTO `sys_login_log` VALUES (280, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-30 14:45:33', '2019-12-30 14:45:33');
INSERT INTO `sys_login_log` VALUES (281, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-30 15:50:35', '2019-12-30 15:50:35');
INSERT INTO `sys_login_log` VALUES (282, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-30 17:32:35', '2019-12-30 17:32:35');
INSERT INTO `sys_login_log` VALUES (283, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-30 18:35:05', '2019-12-30 18:35:05');
INSERT INTO `sys_login_log` VALUES (284, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-30 19:12:20', '2019-12-30 19:12:20');
INSERT INTO `sys_login_log` VALUES (285, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-31 13:27:45', '2019-12-31 13:27:45');
INSERT INTO `sys_login_log` VALUES (286, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-31 13:36:47', '2019-12-31 13:36:47');
INSERT INTO `sys_login_log` VALUES (287, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-31 14:15:51', '2019-12-31 14:15:51');
INSERT INTO `sys_login_log` VALUES (288, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-31 16:32:32', '2019-12-31 16:32:32');
INSERT INTO `sys_login_log` VALUES (289, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-31 16:34:32', '2019-12-31 16:34:32');
INSERT INTO `sys_login_log` VALUES (290, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-31 17:31:20', '2019-12-31 17:31:20');
INSERT INTO `sys_login_log` VALUES (291, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-31 18:01:24', '2019-12-31 18:01:24');
INSERT INTO `sys_login_log` VALUES (292, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-31 18:18:15', '2019-12-31 18:18:15');
INSERT INTO `sys_login_log` VALUES (293, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-31 18:47:26', '2019-12-31 18:47:26');
INSERT INTO `sys_login_log` VALUES (294, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-31 19:33:22', '2019-12-31 19:33:22');
INSERT INTO `sys_login_log` VALUES (295, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2019-12-31 21:14:30', '2019-12-31 21:14:30');
INSERT INTO `sys_login_log` VALUES (296, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-02 12:49:50', '2020-01-02 12:49:50');
INSERT INTO `sys_login_log` VALUES (297, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-02 13:32:29', '2020-01-02 13:32:29');
INSERT INTO `sys_login_log` VALUES (298, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-02 14:44:05', '2020-01-02 14:44:05');
INSERT INTO `sys_login_log` VALUES (299, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-02 16:22:15', '2020-01-02 16:22:15');
INSERT INTO `sys_login_log` VALUES (300, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-02 17:25:42', '2020-01-02 17:25:42');
INSERT INTO `sys_login_log` VALUES (301, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-02 19:07:37', '2020-01-02 19:07:37');
INSERT INTO `sys_login_log` VALUES (302, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-02 19:50:52', '2020-01-02 19:50:52');
INSERT INTO `sys_login_log` VALUES (303, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-02 20:20:55', '2020-01-02 20:20:55');
INSERT INTO `sys_login_log` VALUES (304, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-02 20:52:59', '2020-01-02 20:52:59');
INSERT INTO `sys_login_log` VALUES (305, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-06 10:53:27', '2020-01-06 10:53:27');
INSERT INTO `sys_login_log` VALUES (306, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-06 11:26:00', '2020-01-06 11:26:00');
INSERT INTO `sys_login_log` VALUES (307, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-06 12:29:34', '2020-01-06 12:29:34');
INSERT INTO `sys_login_log` VALUES (308, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-06 13:37:26', '2020-01-06 13:37:26');
INSERT INTO `sys_login_log` VALUES (309, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-06 15:50:59', '2020-01-06 15:50:59');
INSERT INTO `sys_login_log` VALUES (310, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-06 17:08:24', '2020-01-06 17:08:24');
INSERT INTO `sys_login_log` VALUES (311, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-07 13:50:01', '2020-01-07 13:50:01');
INSERT INTO `sys_login_log` VALUES (312, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-07 14:23:39', '2020-01-07 14:23:39');
INSERT INTO `sys_login_log` VALUES (313, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-07 14:28:43', '2020-01-07 14:28:43');
INSERT INTO `sys_login_log` VALUES (314, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-07 15:33:08', '2020-01-07 15:33:08');
INSERT INTO `sys_login_log` VALUES (315, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-07 15:34:07', '2020-01-07 15:34:07');
INSERT INTO `sys_login_log` VALUES (316, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-07 15:54:09', '2020-01-07 15:54:09');
INSERT INTO `sys_login_log` VALUES (317, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-07 16:28:33', '2020-01-07 16:28:33');
INSERT INTO `sys_login_log` VALUES (318, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-07 16:47:50', '2020-01-07 16:47:50');
INSERT INTO `sys_login_log` VALUES (319, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-07 20:46:17', '2020-01-07 20:46:17');
INSERT INTO `sys_login_log` VALUES (320, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-08 14:20:23', '2020-01-08 14:20:23');
INSERT INTO `sys_login_log` VALUES (321, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-08 14:21:55', '2020-01-08 14:21:55');
INSERT INTO `sys_login_log` VALUES (322, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-08 14:22:31', '2020-01-08 14:22:31');
INSERT INTO `sys_login_log` VALUES (323, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-08 14:53:39', '2020-01-08 14:53:39');
INSERT INTO `sys_login_log` VALUES (324, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-08 16:05:59', '2020-01-08 16:05:59');
INSERT INTO `sys_login_log` VALUES (325, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-08 16:38:53', '2020-01-08 16:38:53');
INSERT INTO `sys_login_log` VALUES (326, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-08 17:11:03', '2020-01-08 17:11:03');
INSERT INTO `sys_login_log` VALUES (327, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-08 17:44:06', '2020-01-08 17:44:06');
INSERT INTO `sys_login_log` VALUES (328, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-08 18:14:48', '2020-01-08 18:14:48');
INSERT INTO `sys_login_log` VALUES (329, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-08 18:47:25', '2020-01-08 18:47:25');
INSERT INTO `sys_login_log` VALUES (330, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-08 19:19:21', '2020-01-08 19:19:21');
INSERT INTO `sys_login_log` VALUES (331, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-09 13:34:24', '2020-01-09 13:34:24');
INSERT INTO `sys_login_log` VALUES (332, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-09 13:53:19', '2020-01-09 13:53:19');
INSERT INTO `sys_login_log` VALUES (333, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-09 13:53:38', '2020-01-09 13:53:38');
INSERT INTO `sys_login_log` VALUES (334, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-09 14:56:44', '2020-01-09 14:56:44');
INSERT INTO `sys_login_log` VALUES (335, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-09 15:14:26', '2020-01-09 15:14:26');
INSERT INTO `sys_login_log` VALUES (336, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-09 15:44:27', '2020-01-09 15:44:27');
INSERT INTO `sys_login_log` VALUES (337, 1, 'admin', '0:0:0:0:0:0:0:1', NULL, '2020-01-09 17:04:40', '2020-01-09 17:04:40');

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_permission`;
CREATE TABLE `sys_permission`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `available` tinyint(1) NULL DEFAULT NULL COMMENT '是否可用',
  `permission_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名称',
  `parent_id` int(10) NULL DEFAULT NULL COMMENT '父权限ID',
  `parent_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '父权限ID列表',
  `permission_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限编码',
  `resource_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源类型(top_directory/directory/menu/button)',
  `url` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资源路径',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 752 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO `sys_permission` VALUES (1, 1, '营业管理', 0, '0', 'yingye', 'top_directory', '', '2019-12-23 13:35:55', '2019-12-23 13:35:55');
INSERT INTO `sys_permission` VALUES (2, 1, '预定管理  ', 0, '0', 'yuding', 'top_directory', NULL, '2019-12-23 14:04:21', '2019-12-23 14:04:21');
INSERT INTO `sys_permission` VALUES (3, 1, '客户管理', 0, '0', 'customer', 'top_directory', NULL, '2019-12-23 14:05:02', '2019-12-23 14:05:02');
INSERT INTO `sys_permission` VALUES (4, 1, '私教管理', 0, '0', 'sijiao', 'top_directory', NULL, '2019-12-23 14:05:20', '2019-12-23 14:05:20');
INSERT INTO `sys_permission` VALUES (5, 1, '课程管理', 0, '0', 'kecheng', 'top_directory', NULL, '2019-12-23 14:05:44', '2019-12-23 14:05:44');
INSERT INTO `sys_permission` VALUES (6, 1, '报表管理', 0, '0', 'baobiao', 'top_directory', NULL, '2019-12-23 14:06:17', '2019-12-23 14:06:17');
INSERT INTO `sys_permission` VALUES (7, 1, '系统管理', 0, '0', 'system', 'top_directory', NULL, '2019-12-23 14:06:49', '2019-12-23 14:06:49');
INSERT INTO `sys_permission` VALUES (11, 1, '刷卡入场', 1, '0/1', 'shuaka', 'menu', NULL, '2019-12-23 14:06:52', '2019-12-23 14:06:52');
INSERT INTO `sys_permission` VALUES (12, 1, '定金管理', 1, '0/1', 'first:view', 'menu', '/first/money/list', '2019-12-23 14:13:24', '2019-12-23 14:13:24');
INSERT INTO `sys_permission` VALUES (13, 1, '付款方式', 1, '0/1', 'paytypes', 'menu', '/paytype/list', '2019-12-23 14:14:06', '2019-12-23 14:14:06');
INSERT INTO `sys_permission` VALUES (14, 1, '卡项管理', 1, '0/1', 'cardsetting', 'menu', '/cardsetting/list', '2019-12-23 14:16:49', '2019-12-23 14:16:49');
INSERT INTO `sys_permission` VALUES (31, 1, '客户信息', 3, '0/3', 'cust:view', 'menu', '/customer/list', '2019-12-23 14:18:42', '2019-12-23 14:18:42');
INSERT INTO `sys_permission` VALUES (32, 1, '会员卡管理', 3, '0/3', 'clubcard:view', 'menu', '/clubcard/list', '2019-12-23 14:20:51', '2019-12-23 14:20:51');
INSERT INTO `sys_permission` VALUES (33, 1, '来源管理', 3, '0/3', 'laiyuan', 'menu', '/fromsource/list', '2020-01-06 12:33:02', '2019-12-23 14:22:10');
INSERT INTO `sys_permission` VALUES (71, 1, '员工管理', 7, '0/7', 'user:view', 'menu', '/user/list', '2019-12-23 14:25:20', '2019-12-23 14:25:20');
INSERT INTO `sys_permission` VALUES (72, 1, '角色管理', 7, '0/7', 'role:view', 'menu', '/role/list', '2019-12-23 14:25:58', '2019-12-23 14:25:58');
INSERT INTO `sys_permission` VALUES (73, 1, '权限管理', 7, '0/7', 'permission:view', 'menu', '/permission/list', '2019-12-23 14:26:40', '2019-12-23 14:26:40');
INSERT INTO `sys_permission` VALUES (74, 1, '登录日志', 7, '0/7', 'loginLog:view', 'menu', '/loginLog/list', '2019-12-23 14:27:18', '2019-12-23 14:27:18');
INSERT INTO `sys_permission` VALUES (75, 1, '系统日志', 7, '0/7', 'log:view', 'menu', '/log/list', '2019-12-23 14:27:46', '2019-12-23 14:27:46');
INSERT INTO `sys_permission` VALUES (76, 1, '代码生成', 7, '0/7', 'code:view', 'menu', '/code/list', '2019-12-23 14:28:35', '2019-12-23 14:28:35');
INSERT INTO `sys_permission` VALUES (120, 1, '新增', 12, '0/1/12', 'first:add', 'button', NULL, '2019-12-23 14:30:42', '2019-12-23 14:30:42');
INSERT INTO `sys_permission` VALUES (121, 1, '编辑', 12, '0/1/12', 'first:edit', 'button', NULL, '2019-12-23 14:31:19', '2019-12-23 14:31:19');
INSERT INTO `sys_permission` VALUES (122, 1, '打印预览', 12, '0/1/12', 'first:printview', 'button', NULL, '2019-12-23 14:31:52', '2019-12-23 14:31:52');
INSERT INTO `sys_permission` VALUES (130, 1, '添加', 13, '0/1/13', 'paytype:add', 'button', NULL, '2019-12-23 14:32:55', '2019-12-23 14:32:55');
INSERT INTO `sys_permission` VALUES (131, 1, '编辑', 13, '0/1/13', 'paytype:edit', 'button', NULL, '2019-12-23 14:33:19', '2019-12-23 14:33:19');
INSERT INTO `sys_permission` VALUES (132, 1, '删除', 13, '0/1/13', 'paytype:del', 'button', NULL, '2019-12-23 14:33:46', '2019-12-23 14:33:46');
INSERT INTO `sys_permission` VALUES (140, 1, '添加', 14, '0/1/14', 'cardset:add', 'button', NULL, '2019-12-23 14:34:25', '2019-12-23 14:34:25');
INSERT INTO `sys_permission` VALUES (310, 1, '新增', 31, '0/3/31', 'cust:add', 'button', NULL, '2019-12-23 14:35:14', '2019-12-23 14:35:14');
INSERT INTO `sys_permission` VALUES (311, 1, '编辑', 31, '0/3/31', 'cust:edit', 'button', NULL, '2019-12-23 14:36:50', '2019-12-23 14:36:50');
INSERT INTO `sys_permission` VALUES (312, 1, '删除', 31, '0/3/31', 'cust:del', 'button', NULL, '2019-12-23 14:37:00', '2019-12-23 14:37:00');
INSERT INTO `sys_permission` VALUES (320, 1, '新增', 32, '0/3/32', 'clubcard:add', 'button', NULL, '2019-12-23 14:37:32', '2019-12-23 14:37:32');
INSERT INTO `sys_permission` VALUES (321, 1, '编辑', 32, '0/3/32', 'clubcard:edit', 'button', NULL, '2019-12-23 14:39:55', '2019-12-23 14:39:55');
INSERT INTO `sys_permission` VALUES (322, 1, '删除', 32, '0/3/32', 'clubcard:del', 'button', NULL, '2019-12-23 14:40:14', '2019-12-23 14:40:14');
INSERT INTO `sys_permission` VALUES (323, 1, '打印预览', 32, '0/3/32', 'clubcard:printview', 'button', NULL, '2019-12-23 14:40:40', '2019-12-23 14:40:40');
INSERT INTO `sys_permission` VALUES (324, 1, '审核', 32, '0/3/32', 'clubcard:examine', 'button', NULL, '2019-12-23 15:38:28', '2019-12-23 15:38:28');
INSERT INTO `sys_permission` VALUES (710, 1, '添加', 71, '0/7/71', 'user:add', 'button', NULL, '2019-12-23 14:42:07', '2019-12-23 14:42:07');
INSERT INTO `sys_permission` VALUES (711, 1, '编辑', 71, '0/7/71', 'user:edit', 'button', NULL, '2019-12-23 14:43:13', '2019-12-23 14:43:13');
INSERT INTO `sys_permission` VALUES (712, 1, '删除', 71, '0/7/71', 'user:del', 'button', NULL, '2019-12-23 14:43:36', '2019-12-23 14:43:36');
INSERT INTO `sys_permission` VALUES (720, 1, '添加', 72, '0/7/72', 'role:add', 'button', NULL, '2019-12-23 14:44:47', '2019-12-23 14:44:47');
INSERT INTO `sys_permission` VALUES (721, 1, '编辑', 72, '0/7/72', 'role:edit', 'button', NULL, '2019-12-23 14:45:21', '2019-12-23 14:45:21');
INSERT INTO `sys_permission` VALUES (722, 1, '删除', 72, '0/7/72', 'role:del', 'button', NULL, '2019-12-23 14:45:36', '2019-12-23 14:45:36');
INSERT INTO `sys_permission` VALUES (730, 1, '添加', 73, '0/7/73', 'permission:add', 'button', NULL, '2019-12-23 14:46:15', '2019-12-23 14:46:15');
INSERT INTO `sys_permission` VALUES (731, 1, '编辑', 73, '0/7/73', 'permission:edit', 'button', NULL, '2019-12-23 14:46:40', '2019-12-23 14:46:40');
INSERT INTO `sys_permission` VALUES (732, 1, '删除', 73, '0/7/73', 'permission:del', 'button', NULL, '2019-12-23 14:46:57', '2019-12-23 14:46:57');
INSERT INTO `sys_permission` VALUES (733, 1, '活动管理', 7, '0/7', 'activitymanagement', 'directory', NULL, '2019-12-24 16:00:36', '2019-12-24 16:00:36');
INSERT INTO `sys_permission` VALUES (734, 1, '用户列表', 733, '0/7/733', 'activity:view', 'menu', '/activity/management/userlist', '2019-12-24 16:18:42', '2019-12-24 16:18:42');
INSERT INTO `sys_permission` VALUES (735, 1, '审核', 734, '0/7/733/734', 'activity:examine', 'button', NULL, '2019-12-24 17:32:43', '2019-12-24 17:32:43');
INSERT INTO `sys_permission` VALUES (736, 1, '反审核', 734, '0/7/733/734', 'reverse:examine', 'button', NULL, '2019-12-24 20:26:35', '2019-12-24 20:26:35');
INSERT INTO `sys_permission` VALUES (737, 1, '录入用户', 734, '0/7/733/734', 'activity:adduser', 'button', NULL, '2019-12-25 19:47:13', '2019-12-25 19:47:13');
INSERT INTO `sys_permission` VALUES (738, 1, '中奖人设定', 734, '0/7/733/734', 'winner:set', 'button', NULL, '2019-12-31 16:33:21', '2019-12-31 16:33:21');
INSERT INTO `sys_permission` VALUES (739, 1, '查看设定', 734, '0/7/733/734', 'winner:view', 'button', NULL, '2019-12-31 18:10:22', '2019-12-31 18:10:22');
INSERT INTO `sys_permission` VALUES (740, 1, '删除设定', 734, '0/7/733/734', 'winner:del', 'button', NULL, '2019-12-31 18:22:40', '2019-12-31 18:22:40');
INSERT INTO `sys_permission` VALUES (741, 1, '课程管理', 4, '0/4', 'course:management', 'menu', '/course/list', '2020-01-07 15:34:02', '2020-01-07 14:28:27');
INSERT INTO `sys_permission` VALUES (742, 1, '新增', 741, '0/4/741', 'cour:add', 'button', NULL, '2020-01-07 15:52:06', '2020-01-07 15:52:06');
INSERT INTO `sys_permission` VALUES (743, 1, '编辑', 741, '0/4/741', 'cour:edit', 'button', NULL, '2020-01-07 15:52:23', '2020-01-07 15:52:23');
INSERT INTO `sys_permission` VALUES (744, 1, '删除', 741, '0/4/741', 'cour:del', 'button', NULL, '2020-01-07 15:52:38', '2020-01-07 15:52:38');
INSERT INTO `sys_permission` VALUES (745, 1, '合同管理', 4, '0/4', 'contract:management', 'menu', '/pe/contract/list', '2020-01-07 16:47:35', '2020-01-07 16:47:35');
INSERT INTO `sys_permission` VALUES (746, 1, '新增', 745, '0/4/745', 'contractset:add', 'button', NULL, '2020-01-08 14:21:49', '2020-01-08 14:21:49');
INSERT INTO `sys_permission` VALUES (748, 1, '教练信息', 4, '0/4', 'coach', 'menu', '/coach/list', '2020-01-09 13:48:17', '2020-01-09 13:48:17');
INSERT INTO `sys_permission` VALUES (749, 1, '新增', 748, '0/4/748', 'coa:add', 'button', NULL, '2020-01-09 13:48:48', '2020-01-09 13:48:48');
INSERT INTO `sys_permission` VALUES (750, 1, '编辑', 748, '0/4/748', 'coa:edit', 'button', NULL, '2020-01-09 13:49:41', '2020-01-09 13:49:41');
INSERT INTO `sys_permission` VALUES (751, 1, '删除', 748, '0/4/748', 'coa:del', 'button', NULL, '2020-01-09 13:50:06', '2020-01-09 13:50:06');
INSERT INTO `sys_permission` VALUES (752, 1, '打印预览', 745, '0/4/745', 'contractset:printview', 'button', NULL, '2020-01-09 15:14:05', '2020-01-09 15:14:05');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `permission_ids` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限ID列表',
  `available` tinyint(1) NULL DEFAULT NULL COMMENT '是否可用',
  `role_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色编号',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统角色' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (6, ',7,733,734,735,736,737,738,739,740,71,710,711,712,72,720,721,722,73,730,731,732,74,75,76,1,11,12,120,121,122,13,130,131,132,14,140,3,31,310,311,312,32,320,321,322,323,324,33,4,741,742,743,744,745,746,752,748,749,750,751,2,5,6,', 1, '超级管理员', '1', '2020-01-09 15:14:16', '2019-12-23 14:58:32');
INSERT INTO `sys_role` VALUES (7, ',1,11,12,120,121,122,', 1, 'test', '2', '2019-12-23 15:00:14', '2019-12-23 15:00:14');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `role_id` int(10) NULL DEFAULT NULL COMMENT '角色ID',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `pass_word` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `salt` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐值',
  `state` tinyint(1) NULL DEFAULT NULL COMMENT '状态(0：禁用，1：启用，2：锁定)',
  `update_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_name`(`user_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 6, '超级管理员', 'admin', '90de4365c537fa959193d13ad8d07665', 'XZUY77Pq41M6jaGeR2q1yMaPOrmemy6A', 1, '2019-12-10 15:24:55', '2018-07-10 11:16:24');
INSERT INTO `sys_user` VALUES (13, 7, '杨彬', 'yang', '32be16f13ceeae06b6c62b52c0eb0574', 'HBgVHEgmdgdCOCH5M1piP571W7acQXcR', 1, '2019-12-23 15:00:22', '2019-12-20 18:05:53');

SET FOREIGN_KEY_CHECKS = 1;
