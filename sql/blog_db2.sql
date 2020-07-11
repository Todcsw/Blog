/*
 Navicat Premium Data Transfer

 Source Server         : windows_csw
 Source Server Type    : MySQL
 Source Server Version : 50712
 Source Host           : localhost:3306
 Source Schema         : blog_db2

 Target Server Type    : MySQL
 Target Server Version : 50712
 File Encoding         : 65001

 Date: 09/07/2020 11:31:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id递增',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章标题',
  `photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文章封面图路径',
  `view` int(10) NOT NULL COMMENT '文章浏览量',
  `tags` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '博客标签，多个标签使用，分割开',
  `catalog` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客所属目录',
  `uploadTime` datetime NOT NULL COMMENT '上传时间(按照时间顺序取出博客)',
  `content` mediumtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文章内容路径',
  `updateTime` datetime NOT NULL COMMENT '最后更改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '博客文章表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES (1, '程序员的心得', 'BlogPhoto\\7c69db7c-7546-45a1-8c33-8ad54bce4461-1.jpg', 0, 'java', 'php', '2020-07-09 11:24:03', '[![这是一张图片](https://s1.ax1x.com/2020/06/30/N4dki8.jpg \"这是一张图片\")](https://s1.ax1x.com/2020/06/30/N4dki8.jpg \"这是一张图片\")\r\n图片的插入方式得输入远程图片的链接地址,建议将图片上传至图床之后获得链接地址后上传', '2020-07-09 11:24:03');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id主键递增',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类,采用,分割开显示出来',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '目录表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '数据结构与算法1', '2020-07-09 11:22:17');
INSERT INTO `category` VALUES (2, 'php', '2020-07-09 11:22:22');
INSERT INTO `category` VALUES (3, 'mysql', '2020-07-09 11:22:27');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id主键递增',
  `flag` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否开启评论管理',
  `appId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '如果开启填写APP ID AppID 是该项目的唯一标识符。此 ID 不可变更',
  `appKey` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '如果开启请填写APP Key  AppKey 是公开的访问密钥，适用于在公开的客户端中使用。使用 AppKey 进行的访问受到 ACL 的限制',
  `placeholder` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '欢迎留言！在这里说出你的想法！' COMMENT '提示评论什么',
  `placePhoto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'https:Todcsw.github.io/images/comment_bg.png' COMMENT '占位图片的链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '评论表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (1, '1', '5vUJRWPzLBnLKd9eVkIfHnft-gzGzoHsz', 'vHaqmdNUohtm2JHPSNmkbKlm', '欢迎留言！在这里说出你的想法!', 'https:Todcsw.github.io/images/comment_bg.png');

-- ----------------------------
-- Table structure for description
-- ----------------------------
DROP TABLE IF EXISTS `description`;
CREATE TABLE `description`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id递增主键',
  `name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `constellation` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '星座',
  `experience` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教育经历',
  `sentence` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '最喜欢的一句话',
  `idol` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '偶像',
  `character1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性格',
  `contact` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系方式',
  `information` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人详细介绍',
  `language` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '开发语言介绍,及工作',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '个人表述表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of description
-- ----------------------------
INSERT INTO `description` VALUES (1, 'Todcsw', '双鱼座', '2018年入学软件工程专业', '只有决心成功,失败就永远不会把你击垮', '勒布朗•詹姆斯', '有趣的直男', 'qq群聊:617310699', '好好学习,天天向上', '学习一年半的java开发实习生');

-- ----------------------------
-- Table structure for footer
-- ----------------------------
DROP TABLE IF EXISTS `footer`;
CREATE TABLE `footer`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id递增主键',
  `about` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '底部about',
  `number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '底部备案号',
  `copyright` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资讯著作权',
  `powerby` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '技术支持',
  `byurl` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '博客的超链接',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '底部栏目表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of footer
-- ----------------------------
INSERT INTO `footer` VALUES (1, '驱动 Hexo', 'ICP 豫ICP备17008806号-1 ', '©2020 ', 'By Todcsw', 'http://www.todcsw.site/');

-- ----------------------------
-- Table structure for information
-- ----------------------------
DROP TABLE IF EXISTS `information`;
CREATE TABLE `information`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id主键递增',
  `photo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '个人头像',
  `sentence` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名下的句子',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '个人邮箱',
  `github` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'github网址',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '个人信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of information
-- ----------------------------
INSERT INTO `information` VALUES (1, 'https://s1.ax1x.com/2020/06/30/N4azMd.jpg', '学深夜的习,读清晨的书', '1759864302@qq.com', 'https://github.com/Todcsw', 'Todcsw');

-- ----------------------------
-- Table structure for link
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id递增',
  `hphoto` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '友链图片',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '友情链接，写网址时提示必须填写的是https: 不加www.的网址',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '友链名称',
  `introduce` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '友链介绍',
  `create_time` datetime NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '友情链接表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES (1, 'https://s1.ax1x.com/2020/06/30/N4azMd.jpg', 'http://www.todcsw.site/', '行路のblog', '学深夜的习,读清晨的书', '2020-07-09 11:20:50');
INSERT INTO `link` VALUES (2, 'https://bingbuliang.github.io/images/%E5%A4%B4%E5%83%8F.jpg', 'https:bingbuliang.github.io', '胡冰的blog', '这是一个大佬', '2020-07-09 11:21:32');

-- ----------------------------
-- Table structure for photo
-- ----------------------------
DROP TABLE IF EXISTS `photo`;
CREATE TABLE `photo`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键递增',
  `linkPhoto` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '友情链接页上面的图片',
  `aboutPhoto` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '关于页上面的图片',
  `tagPhoto` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标签页上面的图片',
  `indexPhoto` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '首页上面的图片',
  `categoryPhoto` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '目录页上面的图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of photo
-- ----------------------------
INSERT INTO `photo` VALUES (1, 'https://s1.ax1x.com/2020/06/30/N4dki8.jpg', 'https://s1.ax1x.com/2020/06/30/N4dPdP.jpg', 'https://s1.ax1x.com/2020/06/30/N4deMj.jpg', 'https://s1.ax1x.com/2020/06/30/N4dVzQ.jpg', 'https://s1.ax1x.com/2020/06/30/N4diIf.jpg');

-- ----------------------------
-- Table structure for site
-- ----------------------------
DROP TABLE IF EXISTS `site`;
CREATE TABLE `site`  (
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点名称',
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id主键递增',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点描述',
  `logo` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点Logo图片路径',
  `favicon` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点favico图片路径',
  `notice` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '站点公告',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '站点信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of site
-- ----------------------------
INSERT INTO `site` VALUES ('行路のblog', 1, '要么去读书 要么去旅行 灵魂和身体必须有一个在路上', 'http://www.todcsw.site/img/favicon.ico', 'http://www.todcsw.site/img/favicon.ico', '感谢访问本站，若喜欢请收藏 ^_^ ^_^不喜欢的话我再想想办法');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id主键',
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签名称',
  `deleted` int(10) NOT NULL COMMENT '是否被删除,0=否 1=是',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`, `name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '标签表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 'springcloud', 0, '2020-07-09 11:21:55');
INSERT INTO `tag` VALUES (2, 'alibaba', 0, '2020-07-09 11:22:01');
INSERT INTO `tag` VALUES (3, 'mysql', 0, '2020-07-09 11:22:07');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id递增',
  `account` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录后台管理账号一般只允许用邮箱注册',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录后台管理密码',
  `problem` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密保问题',
  `answer` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密保答案',
  `createTime` datetime NULL DEFAULT NULL COMMENT '用户创建时间,也就是博客创建时间',
  `identify` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '个人信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1759864302@qq.com', 'NDg1MjI2', '你的名字', '行路', '2020-07-09 10:00:18', '学习一年半的Java开发实习生');

SET FOREIGN_KEY_CHECKS = 1;
