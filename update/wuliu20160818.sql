/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50617
Source Host           : localhost:3306
Source Database       : wuliu

Target Server Type    : MYSQL
Target Server Version : 50617
File Encoding         : 65001

Date: 2016-08-18 23:46:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `jefsky_ad`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_ad`;
CREATE TABLE `jefsky_ad` (
  `ad_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '广告id',
  `ad_name` varchar(255) NOT NULL COMMENT '广告名称',
  `ad_content` text COMMENT '广告内容',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`ad_id`),
  KEY `ad_name` (`ad_name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jefsky_ad
-- ----------------------------

-- ----------------------------
-- Table structure for `jefsky_asset`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_asset`;
CREATE TABLE `jefsky_asset` (
  `aid` bigint(20) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户 id',
  `key` varchar(50) NOT NULL COMMENT '资源 key',
  `filename` varchar(50) DEFAULT NULL COMMENT '文件名',
  `filesize` int(11) DEFAULT NULL COMMENT '文件大小,单位Byte',
  `filepath` varchar(200) NOT NULL COMMENT '文件路径，相对于 upload 目录，可以为 url',
  `uploadtime` int(11) NOT NULL COMMENT '上传时间',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1：可用，0：删除，不可用',
  `meta` text COMMENT '其它详细信息，JSON格式',
  `suffix` varchar(50) DEFAULT NULL COMMENT '文件后缀名，不包括点',
  `download_times` int(11) NOT NULL DEFAULT '0' COMMENT '下载次数',
  PRIMARY KEY (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='资源表';

-- ----------------------------
-- Records of jefsky_asset
-- ----------------------------

-- ----------------------------
-- Table structure for `jefsky_auth_access`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_auth_access`;
CREATE TABLE `jefsky_auth_access` (
  `role_id` mediumint(8) unsigned NOT NULL COMMENT '角色',
  `rule_name` varchar(255) NOT NULL COMMENT '规则唯一英文标识,全小写',
  `type` varchar(30) DEFAULT NULL COMMENT '权限规则分类，请加应用前缀,如admin_',
  KEY `role_id` (`role_id`),
  KEY `rule_name` (`rule_name`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='权限授权表';

-- ----------------------------
-- Records of jefsky_auth_access
-- ----------------------------

-- ----------------------------
-- Table structure for `jefsky_auth_rule`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_auth_rule`;
CREATE TABLE `jefsky_auth_rule` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '规则id,自增主键',
  `module` varchar(20) NOT NULL COMMENT '规则所属module',
  `type` varchar(30) NOT NULL DEFAULT '1' COMMENT '权限规则分类，请加应用前缀,如admin_',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则唯一英文标识,全小写',
  `param` varchar(255) DEFAULT NULL COMMENT '额外url参数',
  `title` varchar(20) NOT NULL DEFAULT '' COMMENT '规则中文描述',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否有效(0:无效,1:有效)',
  `condition` varchar(300) NOT NULL DEFAULT '' COMMENT '规则附加条件',
  PRIMARY KEY (`id`),
  KEY `module` (`module`,`status`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=162 DEFAULT CHARSET=utf8 COMMENT='权限规则表';

-- ----------------------------
-- Records of jefsky_auth_rule
-- ----------------------------
INSERT INTO `jefsky_auth_rule` VALUES ('1', 'Admin', 'admin_url', 'admin/content/default', null, '内容管理', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('2', 'Api', 'admin_url', 'api/guestbookadmin/index', null, '所有留言', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('3', 'Api', 'admin_url', 'api/guestbookadmin/delete', null, '删除网站留言', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('4', 'Comment', 'admin_url', 'comment/commentadmin/index', null, '评论管理', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('5', 'Comment', 'admin_url', 'comment/commentadmin/delete', null, '删除评论', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('6', 'Comment', 'admin_url', 'comment/commentadmin/check', null, '评论审核', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('7', 'Portal', 'admin_url', 'portal/adminpost/index', null, '文章管理', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('8', 'Portal', 'admin_url', 'portal/adminpost/listorders', null, '文章排序', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('9', 'Portal', 'admin_url', 'portal/adminpost/top', null, '文章置顶', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('10', 'Portal', 'admin_url', 'portal/adminpost/recommend', null, '文章推荐', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('11', 'Portal', 'admin_url', 'portal/adminpost/move', null, '批量移动', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('12', 'Portal', 'admin_url', 'portal/adminpost/check', null, '文章审核', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('13', 'Portal', 'admin_url', 'portal/adminpost/delete', null, '删除文章', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('14', 'Portal', 'admin_url', 'portal/adminpost/edit', null, '编辑文章', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('15', 'Portal', 'admin_url', 'portal/adminpost/edit_post', null, '提交编辑', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('16', 'Portal', 'admin_url', 'portal/adminpost/add', null, '添加文章', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('17', 'Portal', 'admin_url', 'portal/adminpost/add_post', null, '提交添加', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('18', 'Portal', 'admin_url', 'portal/adminterm/index', null, '分类管理', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('19', 'Portal', 'admin_url', 'portal/adminterm/listorders', null, '文章分类排序', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('20', 'Portal', 'admin_url', 'portal/adminterm/delete', null, '删除分类', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('21', 'Portal', 'admin_url', 'portal/adminterm/edit', null, '编辑分类', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('22', 'Portal', 'admin_url', 'portal/adminterm/edit_post', null, '提交编辑', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('23', 'Portal', 'admin_url', 'portal/adminterm/add', null, '添加分类', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('24', 'Portal', 'admin_url', 'portal/adminterm/add_post', null, '提交添加', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('25', 'Portal', 'admin_url', 'portal/adminpage/index', null, '页面管理', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('26', 'Portal', 'admin_url', 'portal/adminpage/listorders', null, '页面排序', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('27', 'Portal', 'admin_url', 'portal/adminpage/delete', null, '删除页面', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('28', 'Portal', 'admin_url', 'portal/adminpage/edit', null, '编辑页面', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('29', 'Portal', 'admin_url', 'portal/adminpage/edit_post', null, '提交编辑', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('30', 'Portal', 'admin_url', 'portal/adminpage/add', null, '添加页面', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('31', 'Portal', 'admin_url', 'portal/adminpage/add_post', null, '提交添加', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('32', 'Admin', 'admin_url', 'admin/recycle/default', null, '回收站', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('33', 'Portal', 'admin_url', 'portal/adminpost/recyclebin', null, '文章回收', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('34', 'Portal', 'admin_url', 'portal/adminpost/restore', null, '文章还原', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('35', 'Portal', 'admin_url', 'portal/adminpost/clean', null, '彻底删除', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('36', 'Portal', 'admin_url', 'portal/adminpage/recyclebin', null, '页面回收', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('37', 'Portal', 'admin_url', 'portal/adminpage/clean', null, '彻底删除', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('38', 'Portal', 'admin_url', 'portal/adminpage/restore', null, '页面还原', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('39', 'Admin', 'admin_url', 'admin/extension/default', null, '扩展工具', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('40', 'Admin', 'admin_url', 'admin/backup/default', null, '备份管理', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('41', 'Admin', 'admin_url', 'admin/backup/restore', null, '数据还原', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('42', 'Admin', 'admin_url', 'admin/backup/index', null, '数据备份', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('43', 'Admin', 'admin_url', 'admin/backup/index_post', null, '提交数据备份', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('44', 'Admin', 'admin_url', 'admin/backup/download', null, '下载备份', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('45', 'Admin', 'admin_url', 'admin/backup/del_backup', null, '删除备份', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('46', 'Admin', 'admin_url', 'admin/backup/import', null, '数据备份导入', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('47', 'Admin', 'admin_url', 'admin/plugin/index', null, '插件管理', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('48', 'Admin', 'admin_url', 'admin/plugin/toggle', null, '插件启用切换', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('49', 'Admin', 'admin_url', 'admin/plugin/setting', null, '插件设置', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('50', 'Admin', 'admin_url', 'admin/plugin/setting_post', null, '插件设置提交', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('51', 'Admin', 'admin_url', 'admin/plugin/install', null, '插件安装', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('52', 'Admin', 'admin_url', 'admin/plugin/uninstall', null, '插件卸载', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('53', 'Admin', 'admin_url', 'admin/slide/default', null, '幻灯片', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('54', 'Admin', 'admin_url', 'admin/slide/index', null, '幻灯片管理', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('55', 'Admin', 'admin_url', 'admin/slide/listorders', null, '幻灯片排序', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('56', 'Admin', 'admin_url', 'admin/slide/toggle', null, '幻灯片显示切换', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('57', 'Admin', 'admin_url', 'admin/slide/delete', null, '删除幻灯片', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('58', 'Admin', 'admin_url', 'admin/slide/edit', null, '编辑幻灯片', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('59', 'Admin', 'admin_url', 'admin/slide/edit_post', null, '提交编辑', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('60', 'Admin', 'admin_url', 'admin/slide/add', null, '添加幻灯片', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('61', 'Admin', 'admin_url', 'admin/slide/add_post', null, '提交添加', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('62', 'Admin', 'admin_url', 'admin/slidecat/index', null, '幻灯片分类', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('63', 'Admin', 'admin_url', 'admin/slidecat/delete', null, '删除分类', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('64', 'Admin', 'admin_url', 'admin/slidecat/edit', null, '编辑分类', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('65', 'Admin', 'admin_url', 'admin/slidecat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('66', 'Admin', 'admin_url', 'admin/slidecat/add', null, '添加分类', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('67', 'Admin', 'admin_url', 'admin/slidecat/add_post', null, '提交添加', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('68', 'Admin', 'admin_url', 'admin/ad/index', null, '网站广告', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('69', 'Admin', 'admin_url', 'admin/ad/toggle', null, '广告显示切换', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('70', 'Admin', 'admin_url', 'admin/ad/delete', null, '删除广告', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('71', 'Admin', 'admin_url', 'admin/ad/edit', null, '编辑广告', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('72', 'Admin', 'admin_url', 'admin/ad/edit_post', null, '提交编辑', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('73', 'Admin', 'admin_url', 'admin/ad/add', null, '添加广告', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('74', 'Admin', 'admin_url', 'admin/ad/add_post', null, '提交添加', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('75', 'Admin', 'admin_url', 'admin/link/index', null, '友情链接', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('76', 'Admin', 'admin_url', 'admin/link/listorders', null, '友情链接排序', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('77', 'Admin', 'admin_url', 'admin/link/toggle', null, '友链显示切换', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('78', 'Admin', 'admin_url', 'admin/link/delete', null, '删除友情链接', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('79', 'Admin', 'admin_url', 'admin/link/edit', null, '编辑友情链接', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('80', 'Admin', 'admin_url', 'admin/link/edit_post', null, '提交编辑', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('81', 'Admin', 'admin_url', 'admin/link/add', null, '添加友情链接', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('82', 'Admin', 'admin_url', 'admin/link/add_post', null, '提交添加', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('83', 'Api', 'admin_url', 'api/oauthadmin/setting', null, '第三方登陆', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('84', 'Api', 'admin_url', 'api/oauthadmin/setting_post', null, '提交设置', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('85', 'Admin', 'admin_url', 'admin/menu/default', null, '菜单管理', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('86', 'Admin', 'admin_url', 'admin/navcat/default1', null, '前台菜单', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('87', 'Admin', 'admin_url', 'admin/nav/index', null, '菜单管理', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('88', 'Admin', 'admin_url', 'admin/nav/listorders', null, '前台导航排序', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('89', 'Admin', 'admin_url', 'admin/nav/delete', null, '删除菜单', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('90', 'Admin', 'admin_url', 'admin/nav/edit', null, '编辑菜单', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('91', 'Admin', 'admin_url', 'admin/nav/edit_post', null, '提交编辑', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('92', 'Admin', 'admin_url', 'admin/nav/add', null, '添加菜单', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('93', 'Admin', 'admin_url', 'admin/nav/add_post', null, '提交添加', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('94', 'Admin', 'admin_url', 'admin/navcat/index', null, '菜单分类', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('95', 'Admin', 'admin_url', 'admin/navcat/delete', null, '删除分类', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('96', 'Admin', 'admin_url', 'admin/navcat/edit', null, '编辑分类', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('97', 'Admin', 'admin_url', 'admin/navcat/edit_post', null, '提交编辑', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('98', 'Admin', 'admin_url', 'admin/navcat/add', null, '添加分类', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('99', 'Admin', 'admin_url', 'admin/navcat/add_post', null, '提交添加', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('100', 'Admin', 'admin_url', 'admin/menu/index', null, '后台菜单', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('101', 'Admin', 'admin_url', 'admin/menu/add', null, '添加菜单', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('102', 'Admin', 'admin_url', 'admin/menu/add_post', null, '提交添加', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('103', 'Admin', 'admin_url', 'admin/menu/listorders', null, '后台菜单排序', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('104', 'Admin', 'admin_url', 'admin/menu/export_menu', null, '菜单备份', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('105', 'Admin', 'admin_url', 'admin/menu/edit', null, '编辑菜单', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('106', 'Admin', 'admin_url', 'admin/menu/edit_post', null, '提交编辑', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('107', 'Admin', 'admin_url', 'admin/menu/delete', null, '删除菜单', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('108', 'Admin', 'admin_url', 'admin/menu/lists', null, '所有菜单', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('109', 'Admin', 'admin_url', 'admin/setting/default', null, '设置', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('110', 'Admin', 'admin_url', 'admin/setting/userdefault', null, '个人信息', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('111', 'Admin', 'admin_url', 'admin/user/userinfo', null, '修改信息', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('112', 'Admin', 'admin_url', 'admin/user/userinfo_post', null, '修改信息提交', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('113', 'Admin', 'admin_url', 'admin/setting/password', null, '修改密码', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('114', 'Admin', 'admin_url', 'admin/setting/password_post', null, '提交修改', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('115', 'Admin', 'admin_url', 'admin/setting/site', null, '网站信息', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('116', 'Admin', 'admin_url', 'admin/setting/site_post', null, '提交修改', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('117', 'Admin', 'admin_url', 'admin/route/index', null, '路由列表', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('118', 'Admin', 'admin_url', 'admin/route/add', null, '路由添加', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('119', 'Admin', 'admin_url', 'admin/route/add_post', null, '路由添加提交', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('120', 'Admin', 'admin_url', 'admin/route/edit', null, '路由编辑', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('121', 'Admin', 'admin_url', 'admin/route/edit_post', null, '路由编辑提交', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('122', 'Admin', 'admin_url', 'admin/route/delete', null, '路由删除', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('123', 'Admin', 'admin_url', 'admin/route/ban', null, '路由禁止', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('124', 'Admin', 'admin_url', 'admin/route/open', null, '路由启用', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('125', 'Admin', 'admin_url', 'admin/route/listorders', null, '路由排序', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('126', 'Admin', 'admin_url', 'admin/mailer/default', null, '邮箱配置', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('127', 'Admin', 'admin_url', 'admin/mailer/index', null, 'SMTP配置', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('128', 'Admin', 'admin_url', 'admin/mailer/index_post', null, '提交配置', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('129', 'Admin', 'admin_url', 'admin/mailer/active', null, '邮件模板', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('130', 'Admin', 'admin_url', 'admin/mailer/active_post', null, '提交模板', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('131', 'Admin', 'admin_url', 'admin/setting/clearcache', null, '清除缓存', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('132', 'User', 'admin_url', 'user/indexadmin/default', null, '用户管理', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('133', 'User', 'admin_url', 'user/indexadmin/default1', null, '用户组', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('134', 'User', 'admin_url', 'user/indexadmin/index', null, '本站用户', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('135', 'User', 'admin_url', 'user/indexadmin/ban', null, '拉黑会员', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('136', 'User', 'admin_url', 'user/indexadmin/cancelban', null, '启用会员', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('137', 'User', 'admin_url', 'user/oauthadmin/index', null, '第三方用户', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('138', 'User', 'admin_url', 'user/oauthadmin/delete', null, '第三方用户解绑', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('139', 'User', 'admin_url', 'user/indexadmin/default3', null, '管理组', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('140', 'Admin', 'admin_url', 'admin/rbac/index', null, '角色管理', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('141', 'Admin', 'admin_url', 'admin/rbac/member', null, '成员管理', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('142', 'Admin', 'admin_url', 'admin/rbac/authorize', null, '权限设置', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('143', 'Admin', 'admin_url', 'admin/rbac/authorize_post', null, '提交设置', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('144', 'Admin', 'admin_url', 'admin/rbac/roleedit', null, '编辑角色', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('145', 'Admin', 'admin_url', 'admin/rbac/roleedit_post', null, '提交编辑', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('146', 'Admin', 'admin_url', 'admin/rbac/roledelete', null, '删除角色', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('147', 'Admin', 'admin_url', 'admin/rbac/roleadd', null, '添加角色', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('148', 'Admin', 'admin_url', 'admin/rbac/roleadd_post', null, '提交添加', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('149', 'Admin', 'admin_url', 'admin/user/index', null, '管理员', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('150', 'Admin', 'admin_url', 'admin/user/delete', null, '删除管理员', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('151', 'Admin', 'admin_url', 'admin/user/edit', null, '管理员编辑', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('152', 'Admin', 'admin_url', 'admin/user/edit_post', null, '编辑提交', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('153', 'Admin', 'admin_url', 'admin/user/add', null, '管理员添加', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('154', 'Admin', 'admin_url', 'admin/user/add_post', null, '添加提交', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('155', 'Admin', 'admin_url', 'admin/plugin/update', null, '插件更新', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('156', 'Admin', 'admin_url', 'admin/storage/index', null, '文件存储', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('157', 'Admin', 'admin_url', 'admin/storage/setting_post', null, '文件存储设置提交', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('158', 'Admin', 'admin_url', 'admin/slide/ban', null, '禁用幻灯片', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('159', 'Admin', 'admin_url', 'admin/slide/cancelban', null, '启用幻灯片', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('160', 'Admin', 'admin_url', 'admin/user/ban', null, '禁用管理员', '1', '');
INSERT INTO `jefsky_auth_rule` VALUES ('161', 'Admin', 'admin_url', 'admin/user/cancelban', null, '启用管理员', '1', '');

-- ----------------------------
-- Table structure for `jefsky_comments`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_comments`;
CREATE TABLE `jefsky_comments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_table` varchar(100) NOT NULL COMMENT '评论内容所在表，不带表前缀',
  `post_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '评论内容 id',
  `url` varchar(255) DEFAULT NULL COMMENT '原文地址',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '发表评论的用户id',
  `to_uid` int(11) NOT NULL DEFAULT '0' COMMENT '被评论的用户id',
  `full_name` varchar(50) DEFAULT NULL COMMENT '评论者昵称',
  `email` varchar(255) DEFAULT NULL COMMENT '评论者邮箱',
  `createtime` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '评论时间',
  `content` text NOT NULL COMMENT '评论内容',
  `type` smallint(1) NOT NULL DEFAULT '1' COMMENT '评论类型；1实名评论',
  `parentid` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '被回复的评论id',
  `path` varchar(500) DEFAULT NULL,
  `status` smallint(1) NOT NULL DEFAULT '1' COMMENT '状态，1已审核，0未审核',
  PRIMARY KEY (`id`),
  KEY `comment_post_ID` (`post_id`),
  KEY `comment_approved_date_gmt` (`status`),
  KEY `comment_parent` (`parentid`),
  KEY `table_id_status` (`post_table`,`post_id`,`status`),
  KEY `createtime` (`createtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
-- Records of jefsky_comments
-- ----------------------------

-- ----------------------------
-- Table structure for `jefsky_common_action_log`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_common_action_log`;
CREATE TABLE `jefsky_common_action_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` bigint(20) DEFAULT '0' COMMENT '用户id',
  `object` varchar(100) DEFAULT NULL COMMENT '访问对象的id,格式：不带前缀的表名+id;如posts1表示xx_posts表里id为1的记录',
  `action` varchar(50) DEFAULT NULL COMMENT '操作名称；格式规定为：应用名+控制器+操作名；也可自己定义格式只要不发生冲突且惟一；',
  `count` int(11) DEFAULT '0' COMMENT '访问次数',
  `last_time` int(11) DEFAULT '0' COMMENT '最后访问的时间戳',
  `ip` varchar(15) DEFAULT NULL COMMENT '访问者最后访问ip',
  PRIMARY KEY (`id`),
  KEY `user_object_action` (`user`,`object`,`action`),
  KEY `user_object_action_ip` (`user`,`object`,`action`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='访问记录表';

-- ----------------------------
-- Records of jefsky_common_action_log
-- ----------------------------

-- ----------------------------
-- Table structure for `jefsky_guestbook`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_guestbook`;
CREATE TABLE `jefsky_guestbook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `full_name` varchar(50) NOT NULL COMMENT '留言者姓名',
  `email` varchar(100) NOT NULL COMMENT '留言者邮箱',
  `title` varchar(255) DEFAULT NULL COMMENT '留言标题',
  `msg` text NOT NULL COMMENT '留言内容',
  `createtime` datetime NOT NULL COMMENT '留言时间',
  `status` smallint(2) NOT NULL DEFAULT '1' COMMENT '留言状态，1：正常，0：删除',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='留言表';

-- ----------------------------
-- Records of jefsky_guestbook
-- ----------------------------

-- ----------------------------
-- Table structure for `jefsky_links`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_links`;
CREATE TABLE `jefsky_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) NOT NULL COMMENT '友情链接地址',
  `link_name` varchar(255) NOT NULL COMMENT '友情链接名称',
  `link_image` varchar(255) DEFAULT NULL COMMENT '友情链接图标',
  `link_target` varchar(25) NOT NULL DEFAULT '_blank' COMMENT '友情链接打开方式',
  `link_description` text NOT NULL COMMENT '友情链接描述',
  `link_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `link_rating` int(11) NOT NULL DEFAULT '0' COMMENT '友情链接评级',
  `link_rel` varchar(255) DEFAULT NULL COMMENT '链接与网站的关系',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='友情链接表';

-- ----------------------------
-- Records of jefsky_links
-- ----------------------------
INSERT INTO `jefsky_links` VALUES ('1', 'http://www.thinkcmf.com', 'ThinkCMF', '', '_blank', '', '1', '0', '', '0');

-- ----------------------------
-- Table structure for `jefsky_menu`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_menu`;
CREATE TABLE `jefsky_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `parentid` smallint(6) unsigned NOT NULL DEFAULT '0',
  `app` char(20) NOT NULL COMMENT '应用名称app',
  `model` char(20) NOT NULL COMMENT '控制器',
  `action` char(20) NOT NULL COMMENT '操作名称',
  `data` char(50) NOT NULL COMMENT '额外参数',
  `type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '菜单类型  1：权限认证+菜单；0：只作为菜单',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态，1显示，0不显示',
  `name` varchar(50) NOT NULL COMMENT '菜单名称',
  `icon` varchar(50) DEFAULT NULL COMMENT '菜单图标',
  `remark` varchar(255) NOT NULL COMMENT '备注',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0' COMMENT '排序ID',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `parentid` (`parentid`),
  KEY `model` (`model`)
) ENGINE=MyISAM AUTO_INCREMENT=164 DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of jefsky_menu
-- ----------------------------
INSERT INTO `jefsky_menu` VALUES ('1', '0', 'Admin', 'Content', 'default', '', '0', '0', '内容管理', 'th', '', '30');
INSERT INTO `jefsky_menu` VALUES ('2', '1', 'Api', 'Guestbookadmin', 'index', '', '1', '1', '所有留言', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('3', '2', 'Api', 'Guestbookadmin', 'delete', '', '1', '0', '删除网站留言', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('4', '1', 'Comment', 'Commentadmin', 'index', '', '1', '1', '评论管理', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('5', '4', 'Comment', 'Commentadmin', 'delete', '', '1', '0', '删除评论', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('6', '4', 'Comment', 'Commentadmin', 'check', '', '1', '0', '评论审核', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('7', '1', 'Portal', 'AdminPost', 'index', '', '1', '1', '文章管理', '', '', '1');
INSERT INTO `jefsky_menu` VALUES ('8', '7', 'Portal', 'AdminPost', 'listorders', '', '1', '0', '文章排序', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('9', '7', 'Portal', 'AdminPost', 'top', '', '1', '0', '文章置顶', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('10', '7', 'Portal', 'AdminPost', 'recommend', '', '1', '0', '文章推荐', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('11', '7', 'Portal', 'AdminPost', 'move', '', '1', '0', '批量移动', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('12', '7', 'Portal', 'AdminPost', 'check', '', '1', '0', '文章审核', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('13', '7', 'Portal', 'AdminPost', 'delete', '', '1', '0', '删除文章', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('14', '7', 'Portal', 'AdminPost', 'edit', '', '1', '0', '编辑文章', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('15', '14', 'Portal', 'AdminPost', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('16', '7', 'Portal', 'AdminPost', 'add', '', '1', '0', '添加文章', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('17', '16', 'Portal', 'AdminPost', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('18', '1', 'Portal', 'AdminTerm', 'index', '', '0', '1', '分类管理', '', '', '2');
INSERT INTO `jefsky_menu` VALUES ('19', '18', 'Portal', 'AdminTerm', 'listorders', '', '1', '0', '文章分类排序', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('20', '18', 'Portal', 'AdminTerm', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('21', '18', 'Portal', 'AdminTerm', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('22', '21', 'Portal', 'AdminTerm', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('23', '18', 'Portal', 'AdminTerm', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('24', '23', 'Portal', 'AdminTerm', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('25', '1', 'Portal', 'AdminPage', 'index', '', '1', '1', '页面管理', '', '', '3');
INSERT INTO `jefsky_menu` VALUES ('26', '25', 'Portal', 'AdminPage', 'listorders', '', '1', '0', '页面排序', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('27', '25', 'Portal', 'AdminPage', 'delete', '', '1', '0', '删除页面', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('28', '25', 'Portal', 'AdminPage', 'edit', '', '1', '0', '编辑页面', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('29', '28', 'Portal', 'AdminPage', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('30', '25', 'Portal', 'AdminPage', 'add', '', '1', '0', '添加页面', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('31', '30', 'Portal', 'AdminPage', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('32', '1', 'Admin', 'Recycle', 'default', '', '1', '1', '回收站', '', '', '4');
INSERT INTO `jefsky_menu` VALUES ('33', '32', 'Portal', 'AdminPost', 'recyclebin', '', '1', '1', '文章回收', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('34', '33', 'Portal', 'AdminPost', 'restore', '', '1', '0', '文章还原', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('35', '33', 'Portal', 'AdminPost', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('36', '32', 'Portal', 'AdminPage', 'recyclebin', '', '1', '1', '页面回收', '', '', '1');
INSERT INTO `jefsky_menu` VALUES ('37', '36', 'Portal', 'AdminPage', 'clean', '', '1', '0', '彻底删除', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('38', '36', 'Portal', 'AdminPage', 'restore', '', '1', '0', '页面还原', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('39', '0', 'Admin', 'Extension', 'default', '', '0', '0', '扩展工具', 'cloud', '', '40');
INSERT INTO `jefsky_menu` VALUES ('40', '39', 'Admin', 'Backup', 'default', '', '1', '1', '备份管理', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('41', '40', 'Admin', 'Backup', 'restore', '', '1', '1', '数据还原', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('42', '40', 'Admin', 'Backup', 'index', '', '1', '1', '数据备份', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('43', '42', 'Admin', 'Backup', 'index_post', '', '1', '0', '提交数据备份', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('44', '40', 'Admin', 'Backup', 'download', '', '1', '0', '下载备份', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('45', '40', 'Admin', 'Backup', 'del_backup', '', '1', '0', '删除备份', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('46', '40', 'Admin', 'Backup', 'import', '', '1', '0', '数据备份导入', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('47', '39', 'Admin', 'Plugin', 'index', '', '1', '1', '插件管理', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('48', '47', 'Admin', 'Plugin', 'toggle', '', '1', '0', '插件启用切换', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('49', '47', 'Admin', 'Plugin', 'setting', '', '1', '0', '插件设置', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('50', '49', 'Admin', 'Plugin', 'setting_post', '', '1', '0', '插件设置提交', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('51', '47', 'Admin', 'Plugin', 'install', '', '1', '0', '插件安装', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('52', '47', 'Admin', 'Plugin', 'uninstall', '', '1', '0', '插件卸载', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('53', '39', 'Admin', 'Slide', 'default', '', '1', '1', '幻灯片', '', '', '1');
INSERT INTO `jefsky_menu` VALUES ('54', '53', 'Admin', 'Slide', 'index', '', '1', '1', '幻灯片管理', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('55', '54', 'Admin', 'Slide', 'listorders', '', '1', '0', '幻灯片排序', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('56', '54', 'Admin', 'Slide', 'toggle', '', '1', '0', '幻灯片显示切换', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('57', '54', 'Admin', 'Slide', 'delete', '', '1', '0', '删除幻灯片', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('58', '54', 'Admin', 'Slide', 'edit', '', '1', '0', '编辑幻灯片', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('59', '58', 'Admin', 'Slide', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('60', '54', 'Admin', 'Slide', 'add', '', '1', '0', '添加幻灯片', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('61', '60', 'Admin', 'Slide', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('62', '53', 'Admin', 'Slidecat', 'index', '', '1', '1', '幻灯片分类', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('63', '62', 'Admin', 'Slidecat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('64', '62', 'Admin', 'Slidecat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('65', '64', 'Admin', 'Slidecat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('66', '62', 'Admin', 'Slidecat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('67', '66', 'Admin', 'Slidecat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('68', '39', 'Admin', 'Ad', 'index', '', '1', '1', '网站广告', '', '', '2');
INSERT INTO `jefsky_menu` VALUES ('69', '68', 'Admin', 'Ad', 'toggle', '', '1', '0', '广告显示切换', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('70', '68', 'Admin', 'Ad', 'delete', '', '1', '0', '删除广告', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('71', '68', 'Admin', 'Ad', 'edit', '', '1', '0', '编辑广告', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('72', '71', 'Admin', 'Ad', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('73', '68', 'Admin', 'Ad', 'add', '', '1', '0', '添加广告', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('74', '73', 'Admin', 'Ad', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('75', '39', 'Admin', 'Link', 'index', '', '0', '1', '友情链接', '', '', '3');
INSERT INTO `jefsky_menu` VALUES ('76', '75', 'Admin', 'Link', 'listorders', '', '1', '0', '友情链接排序', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('77', '75', 'Admin', 'Link', 'toggle', '', '1', '0', '友链显示切换', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('78', '75', 'Admin', 'Link', 'delete', '', '1', '0', '删除友情链接', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('79', '75', 'Admin', 'Link', 'edit', '', '1', '0', '编辑友情链接', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('80', '79', 'Admin', 'Link', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('81', '75', 'Admin', 'Link', 'add', '', '1', '0', '添加友情链接', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('82', '81', 'Admin', 'Link', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('83', '39', 'Api', 'Oauthadmin', 'setting', '', '1', '1', '第三方登陆', 'leaf', '', '4');
INSERT INTO `jefsky_menu` VALUES ('84', '83', 'Api', 'Oauthadmin', 'setting_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('85', '0', 'Admin', 'Menu', 'default', '', '1', '0', '菜单管理', 'list', '', '20');
INSERT INTO `jefsky_menu` VALUES ('86', '85', 'Admin', 'Navcat', 'default1', '', '1', '1', '前台菜单', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('87', '86', 'Admin', 'Nav', 'index', '', '1', '1', '菜单管理', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('88', '87', 'Admin', 'Nav', 'listorders', '', '1', '0', '前台导航排序', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('89', '87', 'Admin', 'Nav', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('90', '87', 'Admin', 'Nav', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('91', '90', 'Admin', 'Nav', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('92', '87', 'Admin', 'Nav', 'add', '', '1', '0', '添加菜单', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('93', '92', 'Admin', 'Nav', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('94', '86', 'Admin', 'Navcat', 'index', '', '1', '1', '菜单分类', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('95', '94', 'Admin', 'Navcat', 'delete', '', '1', '0', '删除分类', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('96', '94', 'Admin', 'Navcat', 'edit', '', '1', '0', '编辑分类', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('97', '96', 'Admin', 'Navcat', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('98', '94', 'Admin', 'Navcat', 'add', '', '1', '0', '添加分类', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('99', '98', 'Admin', 'Navcat', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('100', '85', 'Admin', 'Menu', 'index', '', '1', '1', '后台菜单', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('101', '100', 'Admin', 'Menu', 'add', '', '1', '0', '添加菜单', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('102', '101', 'Admin', 'Menu', 'add_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('103', '100', 'Admin', 'Menu', 'listorders', '', '1', '0', '后台菜单排序', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('104', '100', 'Admin', 'Menu', 'export_menu', '', '1', '0', '菜单备份', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('105', '100', 'Admin', 'Menu', 'edit', '', '1', '0', '编辑菜单', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('106', '105', 'Admin', 'Menu', 'edit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('107', '100', 'Admin', 'Menu', 'delete', '', '1', '0', '删除菜单', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('108', '100', 'Admin', 'Menu', 'lists', '', '1', '0', '所有菜单', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('109', '0', 'Admin', 'Setting', 'default', '', '0', '0', '设置', 'cogs', '', '0');
INSERT INTO `jefsky_menu` VALUES ('110', '109', 'Admin', 'Setting', 'userdefault', '', '0', '1', '个人信息', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('111', '110', 'Admin', 'User', 'userinfo', '', '1', '1', '修改信息', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('112', '111', 'Admin', 'User', 'userinfo_post', '', '1', '0', '修改信息提交', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('113', '110', 'Admin', 'Setting', 'password', '', '1', '1', '修改密码', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('114', '113', 'Admin', 'Setting', 'password_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('115', '109', 'Admin', 'Setting', 'site', '', '1', '1', '网站信息', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('116', '115', 'Admin', 'Setting', 'site_post', '', '1', '0', '提交修改', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('117', '115', 'Admin', 'Route', 'index', '', '1', '0', '路由列表', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('118', '115', 'Admin', 'Route', 'add', '', '1', '0', '路由添加', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('119', '118', 'Admin', 'Route', 'add_post', '', '1', '0', '路由添加提交', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('120', '115', 'Admin', 'Route', 'edit', '', '1', '0', '路由编辑', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('121', '120', 'Admin', 'Route', 'edit_post', '', '1', '0', '路由编辑提交', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('122', '115', 'Admin', 'Route', 'delete', '', '1', '0', '路由删除', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('123', '115', 'Admin', 'Route', 'ban', '', '1', '0', '路由禁止', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('124', '115', 'Admin', 'Route', 'open', '', '1', '0', '路由启用', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('125', '115', 'Admin', 'Route', 'listorders', '', '1', '0', '路由排序', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('126', '109', 'Admin', 'Mailer', 'default', '', '1', '1', '邮箱配置', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('127', '126', 'Admin', 'Mailer', 'index', '', '1', '1', 'SMTP配置', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('128', '127', 'Admin', 'Mailer', 'index_post', '', '1', '0', '提交配置', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('129', '126', 'Admin', 'Mailer', 'active', '', '1', '1', '邮件模板', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('130', '129', 'Admin', 'Mailer', 'active_post', '', '1', '0', '提交模板', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('131', '109', 'Admin', 'Setting', 'clearcache', '', '1', '1', '清除缓存', '', '', '1');
INSERT INTO `jefsky_menu` VALUES ('132', '0', 'User', 'Indexadmin', 'default', '', '1', '1', '用户管理', 'group', '', '10');
INSERT INTO `jefsky_menu` VALUES ('133', '132', 'User', 'Indexadmin', 'default1', '', '1', '0', '用户组', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('134', '133', 'User', 'Indexadmin', 'index', '', '1', '1', '本站用户', 'leaf', '', '0');
INSERT INTO `jefsky_menu` VALUES ('135', '134', 'User', 'Indexadmin', 'ban', '', '1', '0', '拉黑会员', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('136', '134', 'User', 'Indexadmin', 'cancelban', '', '1', '0', '启用会员', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('137', '133', 'User', 'Oauthadmin', 'index', '', '1', '1', '第三方用户', 'leaf', '', '0');
INSERT INTO `jefsky_menu` VALUES ('138', '137', 'User', 'Oauthadmin', 'delete', '', '1', '0', '第三方用户解绑', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('139', '132', 'User', 'Indexadmin', 'default3', '', '1', '1', '管理组', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('140', '139', 'Admin', 'Rbac', 'index', '', '1', '0', '角色管理', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('141', '140', 'Admin', 'Rbac', 'member', '', '1', '0', '成员管理', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('142', '140', 'Admin', 'Rbac', 'authorize', '', '1', '0', '权限设置', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('143', '142', 'Admin', 'Rbac', 'authorize_post', '', '1', '0', '提交设置', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('144', '140', 'Admin', 'Rbac', 'roleedit', '', '1', '0', '编辑角色', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('145', '144', 'Admin', 'Rbac', 'roleedit_post', '', '1', '0', '提交编辑', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('146', '140', 'Admin', 'Rbac', 'roledelete', '', '1', '1', '删除角色', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('147', '140', 'Admin', 'Rbac', 'roleadd', '', '1', '1', '添加角色', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('148', '147', 'Admin', 'Rbac', 'roleadd_post', '', '1', '0', '提交添加', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('149', '139', 'Admin', 'User', 'index', '', '1', '1', '管理员', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('150', '149', 'Admin', 'User', 'delete', '', '1', '0', '删除管理员', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('151', '149', 'Admin', 'User', 'edit', '', '1', '0', '管理员编辑', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('152', '151', 'Admin', 'User', 'edit_post', '', '1', '0', '编辑提交', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('153', '149', 'Admin', 'User', 'add', '', '1', '0', '管理员添加', '', '', '1000');
INSERT INTO `jefsky_menu` VALUES ('154', '153', 'Admin', 'User', 'add_post', '', '1', '0', '添加提交', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('155', '47', 'Admin', 'Plugin', 'update', '', '1', '0', '插件更新', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('156', '39', 'Admin', 'Storage', 'index', '', '1', '1', '文件存储', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('157', '156', 'Admin', 'Storage', 'setting_post', '', '1', '0', '文件存储设置提交', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('158', '54', 'Admin', 'Slide', 'ban', '', '1', '0', '禁用幻灯片', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('159', '54', 'Admin', 'Slide', 'cancelban', '', '1', '0', '启用幻灯片', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('160', '149', 'Admin', 'User', 'ban', '', '1', '0', '禁用管理员', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('161', '149', 'Admin', 'User', 'cancelban', '', '1', '0', '启用管理员', '', '', '0');
INSERT INTO `jefsky_menu` VALUES ('162', '0', 'Admin', 'Order', 'index', '', '1', '1', '运单管理', 'file-text-o', '', '0');
INSERT INTO `jefsky_menu` VALUES ('163', '0', 'Admin', 'Wuliu', 'index', '', '1', '1', '轨迹管理', 'car', '', '0');

-- ----------------------------
-- Table structure for `jefsky_nav`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_nav`;
CREATE TABLE `jefsky_nav` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) NOT NULL COMMENT '导航分类 id',
  `parentid` int(11) NOT NULL COMMENT '导航父 id',
  `label` varchar(255) NOT NULL COMMENT '导航标题',
  `target` varchar(50) DEFAULT NULL COMMENT '打开方式',
  `href` varchar(255) NOT NULL COMMENT '导航链接',
  `icon` varchar(255) NOT NULL COMMENT '导航图标',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(6) DEFAULT '0' COMMENT '排序',
  `path` varchar(255) NOT NULL DEFAULT '0' COMMENT '层级关系',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='前台导航表';

-- ----------------------------
-- Records of jefsky_nav
-- ----------------------------
INSERT INTO `jefsky_nav` VALUES ('1', '1', '0', '首页', '', 'home', '', '1', '0', '0-1');
INSERT INTO `jefsky_nav` VALUES ('2', '1', '0', '列表演示', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"1\";}}', '', '1', '0', '0-2');
INSERT INTO `jefsky_nav` VALUES ('3', '1', '0', '瀑布流', '', 'a:2:{s:6:\"action\";s:17:\"Portal/List/index\";s:5:\"param\";a:1:{s:2:\"id\";s:1:\"2\";}}', '', '1', '0', '0-3');

-- ----------------------------
-- Table structure for `jefsky_nav_cat`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_nav_cat`;
CREATE TABLE `jefsky_nav_cat` (
  `navcid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '导航分类名',
  `active` int(1) NOT NULL DEFAULT '1' COMMENT '是否为主菜单，1是，0不是',
  `remark` text COMMENT '备注',
  PRIMARY KEY (`navcid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='前台导航分类表';

-- ----------------------------
-- Records of jefsky_nav_cat
-- ----------------------------
INSERT INTO `jefsky_nav_cat` VALUES ('1', '主导航', '1', '主导航');

-- ----------------------------
-- Table structure for `jefsky_oauth_user`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_oauth_user`;
CREATE TABLE `jefsky_oauth_user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `from` varchar(20) NOT NULL COMMENT '用户来源key',
  `name` varchar(30) NOT NULL COMMENT '第三方昵称',
  `head_img` varchar(200) NOT NULL COMMENT '头像',
  `uid` int(20) NOT NULL COMMENT '关联的本站用户id',
  `create_time` datetime NOT NULL COMMENT '绑定时间',
  `last_login_time` datetime NOT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(16) NOT NULL COMMENT '最后登录ip',
  `login_times` int(6) NOT NULL COMMENT '登录次数',
  `status` tinyint(2) NOT NULL,
  `access_token` varchar(512) NOT NULL,
  `expires_date` int(11) NOT NULL COMMENT 'access_token过期时间',
  `openid` varchar(40) NOT NULL COMMENT '第三方用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='第三方用户表';

-- ----------------------------
-- Records of jefsky_oauth_user
-- ----------------------------

-- ----------------------------
-- Table structure for `jefsky_options`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_options`;
CREATE TABLE `jefsky_options` (
  `option_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `option_name` varchar(64) NOT NULL COMMENT '配置名',
  `option_value` longtext NOT NULL COMMENT '配置值',
  `autoload` int(2) NOT NULL DEFAULT '1' COMMENT '是否自动加载',
  PRIMARY KEY (`option_id`),
  UNIQUE KEY `option_name` (`option_name`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='全站配置表';

-- ----------------------------
-- Records of jefsky_options
-- ----------------------------
INSERT INTO `jefsky_options` VALUES ('1', 'member_email_active', '{\"title\":\"\\u90ae\\u4ef6\\u6fc0\\u6d3b\\u901a\\u77e5.\",\"template\":\"<p>\\u672c\\u90ae\\u4ef6\\u6765\\u81ea<a href=\\\"http:\\/\\/www.thinkcmf.com\\\">ThinkCMF<\\/a><br\\/><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/>&nbsp; &nbsp;<strong>\\u5e10\\u53f7\\u6fc0\\u6d3b\\u8bf4\\u660e<\\/strong><br\\/>&nbsp; &nbsp;<strong>---------------<\\/strong><br\\/><br\\/>&nbsp; &nbsp; \\u5c0a\\u656c\\u7684<span style=\\\"FONT-SIZE: 16px; FONT-FAMILY: Arial; COLOR: rgb(51,51,51); LINE-HEIGHT: 18px; BACKGROUND-COLOR: rgb(255,255,255)\\\">#username#\\uff0c\\u60a8\\u597d\\u3002<\\/span>\\u5982\\u679c\\u60a8\\u662fThinkCMF\\u7684\\u65b0\\u7528\\u6237\\uff0c\\u6216\\u5728\\u4fee\\u6539\\u60a8\\u7684\\u6ce8\\u518cEmail\\u65f6\\u4f7f\\u7528\\u4e86\\u672c\\u5730\\u5740\\uff0c\\u6211\\u4eec\\u9700\\u8981\\u5bf9\\u60a8\\u7684\\u5730\\u5740\\u6709\\u6548\\u6027\\u8fdb\\u884c\\u9a8c\\u8bc1\\u4ee5\\u907f\\u514d\\u5783\\u573e\\u90ae\\u4ef6\\u6216\\u5730\\u5740\\u88ab\\u6ee5\\u7528\\u3002<br\\/>&nbsp; &nbsp; \\u60a8\\u53ea\\u9700\\u70b9\\u51fb\\u4e0b\\u9762\\u7684\\u94fe\\u63a5\\u5373\\u53ef\\u6fc0\\u6d3b\\u60a8\\u7684\\u5e10\\u53f7\\uff1a<br\\/>&nbsp; &nbsp; <a title=\\\"\\\" href=\\\"http:\\/\\/#link#\\\" target=\\\"_self\\\">http:\\/\\/#link#<\\/a><br\\/>&nbsp; &nbsp; (\\u5982\\u679c\\u4e0a\\u9762\\u4e0d\\u662f\\u94fe\\u63a5\\u5f62\\u5f0f\\uff0c\\u8bf7\\u5c06\\u8be5\\u5730\\u5740\\u624b\\u5de5\\u7c98\\u8d34\\u5230\\u6d4f\\u89c8\\u5668\\u5730\\u5740\\u680f\\u518d\\u8bbf\\u95ee)<br\\/>&nbsp; &nbsp; \\u611f\\u8c22\\u60a8\\u7684\\u8bbf\\u95ee\\uff0c\\u795d\\u60a8\\u4f7f\\u7528\\u6109\\u5feb\\uff01<br\\/><br\\/>&nbsp; &nbsp; \\u6b64\\u81f4<br\\/>&nbsp; &nbsp;  \\u7ba1\\u7406\\u56e2\\u961f.<\\/p>\"}', '1');
INSERT INTO `jefsky_options` VALUES ('2', 'site_options', '{\"site_name\":\"\\u8fd0\\u5355\\u8f68\\u8ff9\\u67e5\\u8be2\",\"site_host\":\"http:\\/\\/127.0.0.1\\/\",\"site_admin_url_password\":\"\",\"site_tpl\":\"simplebootx\",\"site_adminstyle\":\"bluesky\",\"site_icp\":\"\",\"site_admin_email\":\"371048998@qq.com\",\"site_tongji\":\"\",\"site_copyright\":\"\",\"site_seo_title\":\"\\u8fd0\\u5355\\u8f68\\u8ff9\\u67e5\\u8be2\",\"site_seo_keywords\":\"ThinkCMF,php,\\u5185\\u5bb9\\u7ba1\\u7406\\u6846\\u67b6,cmf,cms,\\u7b80\\u7ea6\\u98ce, simplewind,framework\",\"site_seo_description\":\"\\u8fd0\\u5355\\u8f68\\u8ff9\\u67e5\\u8be2\",\"urlmode\":\"1\",\"html_suffix\":\"\",\"comment_time_interval\":60}', '1');
INSERT INTO `jefsky_options` VALUES ('3', 'cmf_settings', '{\"banned_usernames\":\"\"}', '1');

-- ----------------------------
-- Table structure for `jefsky_order`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_order`;
CREATE TABLE `jefsky_order` (
  `id` int(50) NOT NULL AUTO_INCREMENT,
  `o_yid` varchar(50) NOT NULL COMMENT '运单号',
  `o_zid` varchar(50) NOT NULL COMMENT '转单号',
  `o_date` varchar(50) NOT NULL COMMENT '日期时间',
  `o_end` varchar(50) NOT NULL COMMENT '目的地',
  `o_content` text NOT NULL COMMENT '说明',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=811 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jefsky_order
-- ----------------------------
INSERT INTO `jefsky_order` VALUES ('335', '921845426792', '', '2016-03-28 15:52:06', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('336', '922252023038', '', '2016-03-29 14:30:25', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('337', '922533919563', '', '2016-03-28 11:48:20', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('421', '922533407076', '', '2016-04-17 16:10:39', '韩国 Korea', '派送失败，收件人不在指定地址 ，货物退回delivery failure，The recipient is not at the specified address，The goods are returned');
INSERT INTO `jefsky_order` VALUES ('329', '922533919281', '', '2016-03-28 13:02:18', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('330', '662743480763', '', '2016-03-28 12:40:18', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('331', '922252022989', '', '2016-03-28 12:15:54', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('332', '922533732089', '', '2016-03-27 17:08:39', 'USA', '快件已完成清关手续并从海关放行 LOS ANGELES GATEWAY - USA');
INSERT INTO `jefsky_order` VALUES ('333', '921845426756', '', '2016-03-28 12:28:37', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('334', '921845464165', '', '2016-03-30 12:10:53', 'Canada', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('343', '922252022970', '', '2016-03-29 12:41:56', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('327', '922516131388', '', '2016-03-28 16:49:09', 'Canada', '待确认递送地址Waiting for confirmation of delivery address');
INSERT INTO `jefsky_order` VALUES ('291', '132580861004', '', '2016-03-21 14:40:09', '新加坡Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('292', '922555054131', '', '2016-03-24 16:56:19', '澳大利亚Australia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('323', '922517017333', '', '2016-03-26 16:25:19', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('293', '922516342330', '', '2016-03-21 11:04:49', '新加坡Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('294', '921845523532', '', '2016-03-23 12:28:44', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('295', '662741700404', '', '2016-03-22 18:09:30', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('355', '922533975180', '', '2016-03-31 13:57:29', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('356', '919490789926', '', '2016-04-13 08:44:44', 'USA', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_order` VALUES ('298', '132473625510', '', '2016-03-21 12:22:13', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('299', '922533772495', '', '2016-03-24 16:48:29', '澳大利亚Australia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('300', '922246037089', '', '2016-03-23 14:20:25', '法国France', '海关状态更新Custom status update');
INSERT INTO `jefsky_order` VALUES ('301', '922251968688', '', '2016-03-27 13:17:49', '美国USA', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_order` VALUES ('302', '922251969629', '', '2016-03-26 11:21:49', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('303', '921845463965', '', '2016-03-23 15:22:52', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('304', '921845463929', '', '2016-04-08 10:45:59', '墨西哥Mexico', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('325', '922531037807', '', '2016-03-25 11:34:41', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('305', '920295102346', '', '2016-03-24 15:30:58', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('328', '919485782179', '', '2016-03-28 15:38:54', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('324', '919490789874', '', '2016-04-06 13:33:16', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('321', '921347592744', '', '2016-03-29 14:44:00', '香港', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('326', '922533919272', '', '2016-03-28 13:54:52', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('308', '921845464174', '', '2016-04-02 15:23:06', '墨西哥Mexico', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_order` VALUES ('359', '664160298431', '', '2016-04-01 14:16:46', 'Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('309', '921845463992', '', '2016-04-11 10:44:14', '墨西哥Mexico', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('310', '922252023056', '', '2016-03-25 11:42:20', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('311', '921845464004', '', '2016-03-25 11:42:29', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('319', '922531037870', '', '2016-03-25 13:36:58', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('313', '922533657420', '', '2016-03-25 12:13:04', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('314', '922252023074', '', '2016-03-25 13:51:15', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('315', '922252023047', '', '2016-03-25 15:38:27', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('242', '132602047355', '', '2016-03-14 14:16:26', '越南Vietnam', '已派送并签收: Sign and have it delivered');
INSERT INTO `jefsky_order` VALUES ('247', '5262735447', '01051459835', '2016-03-11 08:20:57', '马来西亚 Malaysia', '快件已经到达派送作业地点  Express delivery has arrived at the site of operation');
INSERT INTO `jefsky_order` VALUES ('244', '921849571819', '', '2016-03-09 14:32:21', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('245', '132171660759', '', '2016-03-11 09:33:42', '韩国South Korea', '清关流程 Customs clearance process');
INSERT INTO `jefsky_order` VALUES ('345', '132428396045', '', '2016-03-29 11:35:18', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('279', '922533772653', '', '2016-03-23 16:26:36', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('256', '471472914172', '', '2016-03-16 10:37:34', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('252', '662743480772', '', '2016-03-16 15:53:59', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('253', '471472914163', '', '2016-03-16 11:23:12', '美国USA', '已派送并签收: D HANIG');
INSERT INTO `jefsky_order` VALUES ('254', '922531037834', '', '2016-03-17 10:40:37', '美国USA', '派送并已签收Sign and have it delivered');
INSERT INTO `jefsky_order` VALUES ('255', '664179175399', '', '2016-03-16 10:25:50', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('261', '922548033537', '', '2016-03-16 16:08:49', '新加坡Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('239', '664214063419', '', '2016-03-07 11:23:27', '新加坡Singapore', '已派送并签收: ABDULLAH');
INSERT INTO `jefsky_order` VALUES ('258', '132132788332', '', '2016-03-15 14:29:28', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('265', '922533772699', '', '2016-03-18 13:17:04', '美国USA', '已派送并签收: Sign and have it delivered');
INSERT INTO `jefsky_order` VALUES ('262', '132560077048', '', '2016-03-17 14:23:03', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('264', '922533772671', '', '2016-03-18 12:29:02', '美国USA', '已派送并签收: Sign and have it delivered');
INSERT INTO `jefsky_order` VALUES ('263', '132132788314', '', '2016-03-17 14:22:27', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('266', '922531037940', '', '2016-03-18 15:35:19', '美国USA', '已派送并签收Sign and have it delivered');
INSERT INTO `jefsky_order` VALUES ('267', '922533803872', '', '2016-03-21 09:14:31', '加拿大Canada', '等待确认收件人地址Wait for the confirmation of the recipient\'s address');
INSERT INTO `jefsky_order` VALUES ('268', '922535311906', '', '2016-03-25 16:39:18', '泰国Thailand', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('346', '921845427124', '', '2016-03-30 16:53:56', 'USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('269', '922531037913', '', '2016-03-21 15:09:23', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('270', '922533772592', '', '2016-03-21 16:39:21', '美国USA', '已派送并签收  Have delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('271', '922533772704', '', '2016-03-21 14:15:34', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('272', '922533731889', '', '2016-03-22 17:45:17', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('273', '922533772617', '', '2016-03-21 16:31:35', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('274', '922533772635', '', '2016-03-21 16:39:07', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('275', '922533772722', '', '2016-03-21 12:30:03', '美国USA', '将根据与客户沟通的转运时间，另行安排派送According to the transit time to communicate with customers, arrange separate delivery');
INSERT INTO `jefsky_order` VALUES ('316', '922531037922', '', '2016-03-25 13:32:59', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('277', '922533772608', '', '2016-03-22 16:07:02', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('278', '922531038131', '', '2016-03-23 12:27:45', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('240', '922528976133', '', '2016-03-03 15:48:30', '香港Hongkong', '已签收');
INSERT INTO `jefsky_order` VALUES ('339', '902107379646', '', '2016-03-29 16:34:02', '日本 Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('338', '662742686611', '', '2016-03-29 16:44:33', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('342', '922533772025', '', '2016-03-28 11:52:03', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('283', '922517191265', '', '2016-03-21 14:27:50', '日本Japan', '海关状态更新Custom status update');
INSERT INTO `jefsky_order` VALUES ('284', '922530843250', '', '2016-03-21 12:15:17', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('285', '921845523499', '', '2016-03-21 18:12:45', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('286', '922531037843', '', '2016-03-21 14:58:54', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('287', '922533772662', '', '2016-03-21 14:58:22', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('288', '921845523514', '', '2016-03-21 13:28:44', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('289', '922530843065', '', '2016-03-21 12:37:05', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('290', '922533947164', '', '2016-03-21 12:07:38', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('282', '922533772626', '', '2016-03-22 16:10:19', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('280', '922533772713', '', '2016-03-22 15:59:44', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('281', '922531038104', '', '2016-03-22 11:08:41', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('320', '922535311915', '', '2016-03-22 11:17:14', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('241', '5262767325', '316270724', '2016-03-09 20:51:34', 'UAE  阿联酋', '已派送并签收 Have delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('257', '664215349484', '', '2016-03-15 13:57:44', '香港Hongkong', '已签收Already sign');
INSERT INTO `jefsky_order` VALUES ('248', '132573289561', '', '2016-03-14 17:50:33', '新加坡Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('260', '921845523357', '', '2016-03-15 15:28:28', '美国USA', '已派送并签收: I PARRADO');
INSERT INTO `jefsky_order` VALUES ('344', '920295102294', '', '2016-03-29 11:19:49', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('347', '921845426862', '', '2016-03-28 13:13:05', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('348', '922252023001', '', '2016-03-29 11:49:26', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('349', '920295102373', '', '2016-03-29 16:57:54', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('350', '920295102364', '', '2016-03-29 13:04:03', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('351', '132428396036', '', '2016-03-29 13:09:53', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('352', '922533919509', '', '2016-03-25 11:27:54', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('353', '922533772326', '', '2016-03-26 14:17:01', '日本 Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('386', '664194992160', '', '2016-03-25 12:06:10', '新加坡Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('354', '922553846036', '', '2016-03-22 21:28:31', 'Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('357', '921845427115', '', '2016-04-03 12:43:17', 'Canada', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('392', '662743480445', '', '2016-03-29 11:44:42', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('360', '919490478944', '', '2016-03-27 11:48:03', 'USA', '收到快件 Receive express');
INSERT INTO `jefsky_order` VALUES ('361', '919485782212', '', '2016-03-31 19:32:26', 'USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('362', '664177148980', '', '2016-03-30 14:07:40', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('387', '923199307675', '', '2016-03-30 15:51:13', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('363', '132573155741', '', '2016-04-04 10:50:54', '泰国Thailand', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('364', '132573155732', '', '2016-04-04 17:00:11', '马来西亚Malaysia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('365', '132603536064', '', '2016-03-31 14:23:13', '日本 Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('368', '919490789944', '', '2016-04-10 04:17:06', '美国USA', '到达东莞Arrive in DongGuan');
INSERT INTO `jefsky_order` VALUES ('367', '922520471635', '', '2016-03-24 10:47:08', '法国 France', '收到快件Receive express');
INSERT INTO `jefsky_order` VALUES ('369', '921846191952', '', '2016-03-31 12:24:47', '新加坡 Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('370', '922533772140', '', '2016-03-31 11:45:19', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('371', '921845426774', '', '2016-03-30 11:17:53', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('372', '471470685344', '', '2016-03-30 11:35:42', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('373', '922520491635', '', '2016-03-30 10:43:37', '法国 France', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('374', '921845464068', '', '2016-03-29 12:40:55', '加拿大 Canada', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('375', '921845464147', '', '2016-03-30 17:54:27', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('376', '921845464156', '', '2016-03-29 12:43:08', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('377', '922251968633', '', '2016-03-30 17:35:55', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('378', '922533772061', '', '2016-03-28 10:50:51', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('379', '922533772052', '', '2016-03-28 13:21:30', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('380', '922533772007', '', '2016-03-28 11:47:51', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('381', '922533772131', '', '2016-03-28 11:52:06', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('382', '922533772098', '', '2016-03-28 15:25:35', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('383', '922533772104', '', '2016-03-28 13:03:44', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('384', '622743480445', '', '2016-03-28 12:24:36', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_order` VALUES ('385', '922251966864', '', '2016-04-02 11:05:29', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('399', '922533432768', '', '2016-04-04 15:33:36', '韩国 Korea', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('388', '132501272525', '', '2016-03-30 11:44:48', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('396', '662743480454', '', '2016-04-02 13:52:55', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('398', '923195925023', '', '2016-04-05 13:27:35', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('408', '923198274591', '', '2016-04-12 13:33:14', '澳大利亚Australia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('389', '922533429034', '', '2016-04-04 16:52:58', '柬埔寨Cambodia', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_order` VALUES ('390', '922520410978', '', '2016-04-01 13:58:26', '新加坡Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('418', '922516136404', '', '2016-04-12 13:36:43', '加拿大 Canada', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('393', '922533732362', '', '2016-04-04 14:38:39', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('394', '923195925102', '', '2016-04-05 12:26:14', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('397', '664179175547', '', '2016-03-31 20:30:02', '香港Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('400', '922516540852', '', '2016-04-04 12:44:04', '新加坡 Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('401', '664177783932', '', '2016-04-04 14:31:41', '新加坡 Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('402', '664194398006', '', '2016-04-11 12:38:30', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('403', '132568825343', '', '2016-04-05 10:30:01', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('404', '923195925041', '', '2016-04-05 12:36:43', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('405', '922533732326', '', '2016-04-05 14:27:25', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('406', '922530845577', '', '2016-04-21 20:29:47', '加拿大 Canada', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('407', '922554671727', '', '2016-04-05 10:55:47', '加拿大 Canada', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('409', '664179175538', '', '2016-04-05 14:56:53', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('410', '664195169154', '', '2016-04-11 10:24:53', '日本 Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('412', '919485781915', '', '2016-04-11 11:33:24', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('411', '902106282975', '', '2016-04-12 10:30:39', '韩国 Korea', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('413', '919485782036', '', '2016-04-09 10:51:07', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('414', '919485781997', '', '2016-04-11 11:26:12', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('415', '919485781933', '', '2016-04-09 10:53:23', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('416', '919485781924', '', '2016-04-11 11:35:36', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('417', '919485782027', '', '2016-04-11 11:27:33', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('422', '922555609594', '', '2016-04-07 14:19:10', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('425', '923195923855', '', '2016-04-04 16:55:55', '澳大利亚Australia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('419', '923455299185', '', '2016-04-09 11:43:47', '新加坡 Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('420', '662741702625', '', '2016-04-12 05:52:20', '加拿大 Canada', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('423', '922540355177', '', '2016-04-12 09:50:40', '巴基斯坦 Pakistan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('424', '902101379514', '', '2016-04-14 14:16:52', '韩国South Korea', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('426', '919485781863', '', '2016-04-12 10:36:34', '美国USA', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_order` VALUES ('427', '919485781881', '', '2016-04-12 10:38:25', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('428', '923195925272', '', '2016-04-12 10:37:07', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('429', '922533771764', '', '2016-04-11 13:51:20', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('430', '921845427258', '', '2016-04-13 13:17:46', '美国USA', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_order` VALUES ('431', '132570470194', '', '2016-04-14 14:33:00', '新加坡 Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('443', '923195925245', '', '2016-04-13 12:57:18', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('442', '923195926646', '', '2016-04-14 08:30:19', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('432', '664215693919', '', '2016-04-11 14:53:22', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('436', '132570470158', '', '2016-04-14 11:24:42', '新加坡 Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('435', '664217634784', '', '2016-04-09 14:59:09', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('437', '921845427212', '', '2016-04-15 13:44:23', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('438', '921845427160', '', '2016-04-14 13:42:48', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('439', '921845427203', '', '2016-04-13 12:49:58', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('440', '921845427151', '', '2016-04-14 11:56:13', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('441', '921845427133', '', '2016-04-15 13:51:15', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('444', '923195926600', '', '2016-04-14 08:34:58', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('445', '923195926637', '', '2016-04-16 08:58:18', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('458', '922545126747', '', '2016-04-20 13:17:07', '泰国 Thailand', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('446', '922251968388', '', '2016-04-15 12:30:20', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('447', '923455530587', '', '2016-04-14 17:52:53', '日本 Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('448', '922251966794', '', '2016-04-16 11:22:36', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('449', '664179175510', '', '2016-04-12 14:58:30', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('450', '5262767339', '', '2016-04-13 10:19:23', '香港Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('456', '132603178549', '', '2016-04-13 16:03:50', '香港 Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('454', '923450878265', '', '2016-04-18 11:52:38', '泰国 Thailand', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('463', '132596847462', '', '2016-04-18 14:10:33', '日本 Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('459', '919490981993', '', '2016-04-22 15:14:14', '罗马尼亚 Romania', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_order` VALUES ('460', '923195926479', '', '2016-04-20 10:27:12', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('461', '902106282814', '', '2016-04-18 13:34:40', '韩国 Korea', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('462', '662741704175', '', '2016-04-18 09:20:21', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('464', '919485782106', '', '2016-04-18 10:53:16', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('465', '919485781809', '', '2016-04-18 14:13:00', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('466', '919485782133', '', '2016-04-19 12:19:10', '美国 USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_order` VALUES ('467', '923451111804', '', '2016-04-18 18:35:56', '新加坡 Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('468', '471455779781', '', '2016-04-15 16:26:58', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('707', '116774243303', '', '2016-06-27 17:08:15', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('470', '132069651245', '', '2016-04-14 16:34:38', '香港Hong Kong', '派送并已签收Sign and have it delivered');
INSERT INTO `jefsky_order` VALUES ('471', '664179017823', '', '2016-04-18 14:41:22', '澳大利亚Australia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('478', '923455533518', '', '2016-05-05 13:36:37', '加拿大 Canada', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('472', '931483912210', '', '2016-04-15 14:12:53', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('475', '923455460909', '', '2016-04-21 10:10:47', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('473', '922535270378', '', '2016-04-15 16:52:33', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('474', '662742686541', '', '2016-04-18 10:31:12', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('476', '923196051523', '', '2016-04-20 13:51:03', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('477', '662743180897', '', '2016-04-20 17:25:09', '新加坡Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('479', '923455342322', '', '2016-04-23 13:26:01', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('484', '922541520005', '', '2016-04-25 13:14:15', '新加坡 Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('480', '664178944671', '', '2016-04-22 18:30:45', '瑞典Sweden', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('481', '664195002236', '', '2016-04-19 16:45:16', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('482', '923449445289', '', '2016-04-21 13:27:14', '日本Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('483', '662741703648', '', '2016-04-22 13:08:44', '韩国 Korea', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('485', '923451513045', '', '2016-04-23 10:47:38', '日本Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('486', '664195002263', '', '2016-04-22 10:56:02', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('487', '664194769632', '', '2016-04-26 11:52:47', '澳大利亚Australia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('507', '471470197778', '', '2016-04-27 15:15:49', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('492', '664217358609', '', '2016-05-10 16:47:07', '俄罗斯 Russia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('488', '922251969416', '', '2016-04-25 11:53:54', '英国 UK', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('489', '922251969407', '', '2016-04-25 11:53:32', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('490', '923455349775', '', '2016-04-26 11:24:45', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('491', '923455349766', '', '2016-04-25 17:55:52', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('498', '132359254128', '', '2016-04-25 17:50:34', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('497', '922546093226', '', '2016-04-28 12:55:02', 'Germany 德国', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('494', '471470069549', '', '2016-04-22 17:14:02', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('495', '923446766653', '', '2016-04-25 14:28:04', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('496', '919485781624', '', '2016-04-27 17:08:42', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('504', '921845464138', '', '2016-04-29 14:17:57', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('499', '923455349379', '', '2016-04-29 14:27:27', '美国', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('500', '923446390740', '', '2016-04-27 11:41:49', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('501', '132597180430', '', '2016-04-25 17:26:59', '台湾Taiwan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('502', '921845464101', '', '2016-04-28 11:40:36', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('503', '132614548352', '', '2016-04-25 18:50:41', '越南Vietnam', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('505', '931482856943', '', '2016-04-26 11:42:54', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('512', '923195732261', '', '2016-05-02 12:27:05', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('545', '664214827437', '', '2016-05-06 17:45:23', '越南 Vietnam', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('506', '132596848563', '', '2016-05-02 13:59:10', '日本 Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('508', '922517019678', '', '2016-04-29 14:34:42', '新加坡 Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('509', '902104918582', '', '2016-04-29 14:29:57', '韩国 Korea', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('511', '5262767333', '', '2016-04-28 17:22:28', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('510', '922542822011', '', '2016-05-03 15:28:20', '巴基斯坦 Pakistan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('513', '923446833801', '', '2016-05-05 09:56:32', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('515', '923457514214', '', '2016-05-02 15:57:22', '加拿大 Canada', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('516', '931483912229', '', '2016-04-29 18:09:54', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('517', '923455349818', '', '2016-05-06 12:17:59', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('518', '922533913548', '', '2016-05-04 17:16:55', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('519', '923195926036', '', '2016-05-04 12:28:07', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('520', '920256382030', '', '2016-05-06 16:29:17', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('521', '922533913539', '', '2016-05-04 10:59:41', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('522', '923195926203', '', '2016-05-05 12:47:41', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('523', '923457514205', '', '2016-05-02 15:41:28', '日本 Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('542', '664215674682', '', '2016-05-13 16:49:48', '马来西亚 Malaysia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('524', '662743344083', '', '2016-05-06 12:32:04', '马来西亚 Malaysia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('525', '922546119978', '', '2016-05-06 09:55:49', '日本 Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('526', '662743051009', '', '2016-05-06 16:44:20', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('527', '132597282439', '', '2016-05-04 17:33:23', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('528', '471470198002', '', '2016-04-30 16:22:58', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('529', '923195926072', '', '2016-05-04 12:29:50', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('530', '923195925979', '', '2016-05-05 10:40:32', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('531', '923195925997', '', '2016-05-04 10:45:07', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('532', '664217932528', '', '2016-05-03 17:49:34', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('533', '664179175486', '', '2016-05-03 13:30:37', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('534', '923455342076', '', '2016-05-07 12:32:09', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('535', '923455349809', '', '2016-05-07 11:54:22', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('536', '923455349793', '', '2016-05-09 09:31:18', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('537', '922251968818', '', '2016-05-09 13:21:07', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('538', '923455491692', '', '2016-05-06 15:30:40', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('539', '922251968809', '', '2016-05-06 12:39:57', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('540', '923455349827', '', '2016-05-07 14:23:32', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('541', '923463493212', '', '2016-05-10 11:14:15', '印度尼西亚Indonesia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('547', '931484238334', '', '2016-05-06 14:26:24', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('543', '923195925951', '', '2016-05-10 14:41:37', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('544', '923455342021', '', '2016-05-12 16:42:58', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('546', '662741703602', '', '2016-05-09 12:42:11', '新加坡 Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('548', '664214066200', '', '2016-05-09 11:26:40', '英国 UK', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('549', '923449589028', '', '2016-05-22 15:06:28', '以色列 Israel', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('550', '923196051771', '', '2016-05-10 11:24:47', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('551', '922530845770', '', '2016-05-10 09:59:52', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('559', '922542945144', '', '2016-05-17 11:36:25', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('567', '923455348329', '', '2016-05-21 14:24:52', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('552', '132585980253', '', '2016-05-09 15:39:43', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('553', '922546159100', '', '2016-05-09 17:29:09', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('554', '922533913327', '', '2016-05-14 12:53:45', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('555', '922533913336', '', '2016-05-12 14:51:45', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('556', '924675260194', '', '2016-05-18 14:14:28', '马来西亚 Malaysia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('557', '664195017499', '', '2016-05-11 14:45:42', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('558', '664217369711', '', '2016-05-12 16:55:27', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('560', '924674556173', '', '2016-05-17 11:31:56', '印度尼西亚Indonesia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('561', '132207073808', '', '2016-05-16 11:32:24', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('562', '5262767323', '', '2016-05-19 18:28:59', '马来西亚 Malaysia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('563', '132207073835', '', '2016-05-16 14:14:00', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('564', '924675225822', '', '2016-05-19 17:59:34', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('565', '919485781281', '', '2016-05-18 16:52:52', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('566', '919485781324', '', '2016-05-19 09:45:58', '美国 USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('570', '132617243839', '', '2016-05-23 10:22:16', '日本Japan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('571', '118236684393', '', '2016-05-19 17:03:05', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('569', '664196978741', '', '2016-05-17 13:32:30', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('578', '664178474623', '', '2016-05-19 17:27:01', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('572', '922251968854', '', '2016-05-26 08:36:44', '美国 USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('573', '923455348231', '', '2016-05-25 09:34:46', '美国 USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('574', '923455348504', '', '2016-05-23 12:51:38', '澳大利亚Australia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('575', '922541315661', '', '2016-05-20 15:53:19', '新加坡 Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('576', '922251968863', '', '2016-05-25 11:34:21', '美国 USA', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_order` VALUES ('598', '662743413938', '', '2016-05-31 18:22:45', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('577', '923451185465', '', '2016-05-26 11:48:26', '日本 Japan', '海关流程 Customs process');
INSERT INTO `jefsky_order` VALUES ('579', '664195018890', '', '2016-05-19 18:27:27', '香港Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('580', '924675374468', '', '2016-05-23 11:59:23', '美国 USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('597', '471454611192', '', '2016-05-31 10:55:56', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('583', '664178944495', '', '2016-05-24 12:36:19', '英国 UK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('581', '921845463461', '', '2016-05-26 10:29:23', '美国 USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('582', '922533913309', '', '2016-05-24 11:55:59', '美国 USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('596', '667425460780', '', '2016-05-26 15:46:24', '越南 Vietnam', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('587', '116774222118', '', '2016-05-23 17:26:08', '香港Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('586', '924809241403', '', '2016-06-10 11:15:03', '德国 Germany', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('588', '919485781757', '', '2016-05-25 12:01:29', '美国 USA', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_order` VALUES ('589', '923455348929', '', '2016-05-25 10:33:53', '美国 USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('590', '924185016407', '', '2016-05-26 11:26:43', '美国 USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('591', '105832764906', '', '2016-05-23 13:32:17', '香港Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('592', '924676169836', '', '2016-06-08 12:37:49', '澳大利亚Australia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('593', '667426111058', '', '2016-05-26 12:03:05', '马来西亚 Malaysia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('594', '132617089473', '', '2016-05-25 12:34:25', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('595', '664194432563', '', '2016-05-25 16:27:23', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('599', '919485781739', '', '2016-05-31 10:11:37', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('600', '132596849965', '', '2016-05-30 10:00:40', '日本 Japan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('601', '924673401135', '', '2016-06-02 13:12:48', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('602', '132614551883', '', '2016-05-29 10:28:44', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('605', '919485781518', '', '2016-06-02 09:49:20', '美国 USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('603', '902079034274', '', '2016-05-31 17:46:42', '美国USA', '货物已退回 The goods have been returned');
INSERT INTO `jefsky_order` VALUES ('604', '924675202505', '', '2016-05-30 13:16:22', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('606', '132618782392', '', '2016-06-02 17:41:42', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('608', '664178474599', '', '2016-05-30 15:37:14', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('607', '923454480209', '', '2016-06-03 20:27:36', '马来西亚 Malaysia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('609', '924809548238', '', '2016-06-01 09:33:31', '日本 Japan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('610', '921839375682', '', '2016-05-30 15:27:15', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('611', '923451114668', '', '2016-06-01 10:58:31', '新西兰 New Zealand', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('612', '923455348531', '', '2016-06-01 14:08:45', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('613', '921845463416', '', '2016-06-03 12:31:45', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('614', '922543078099', '', '2016-06-02 11:47:15', '澳大利亚 Australia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('616', '924076505427', '', '2016-06-03 12:55:32', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('615', '925487700838', '', '2016-06-01 17:31:48', '马来西亚 Malaysia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('624', '919485781484', '', '2016-06-07 12:16:37', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('617', '925487699982', '', '2016-06-03 09:31:24', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('618', '664215270896', '', '2016-06-01 15:36:15', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('619', '664196978539', '', '2016-06-01 15:36:58', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('620', '132021487358', '', '2016-06-15 10:34:26', '台湾  Taiwan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('621', '132372836736', '', '2016-06-01 15:33:22', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('623', '922253858203', '', '2016-06-10 10:53:44', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('622', '922516516525', '', '2016-06-03 12:45:18', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('625', '919485781475', '', '2016-06-07 12:23:20', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('626', '902102401625', '', '2016-06-08 14:48:59', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('627', '132339387331', '', '2016-06-06 13:18:53', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('628', '471470202378', '', '2016-06-04 15:16:27', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('630', '924506520127', '', '2016-06-03 22:30:41', '韩国 Korea', '收到快件 Receive express');
INSERT INTO `jefsky_order` VALUES ('632', '931484238430', '', '2016-06-06 17:18:25', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('633', '922533914288', '', '2016-06-10 10:32:21', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('636', '662741598378', '', '2016-06-14 16:17:50', '台湾  Taiwan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('634', '664196158598', '', '2016-06-07 14:27:24', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('635', '132571497046', '', '2016-06-07 14:20:04', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('637', '953005702531', '', '2016-06-08 16:57:13', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('638', '662741703578', '', '2016-06-10 13:57:56', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('639', '921845467636', '', '2016-06-11 11:10:17', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('647', '923455349184', '', '2016-06-17 11:46:20', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('640', '132623240220', '', '2016-06-10 17:24:31', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('641', '919485781411', '', '2016-06-14 10:42:36', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('642', '919485781439', '', '2016-06-14 11:10:52', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('643', '919485781448', '', '2016-06-15 10:11:11', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('644', '919485781420', '', '2016-06-15 10:44:42', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('645', '925494823690', '', '2016-06-14 09:11:10', '法国 France', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('646', '132596848572', '', '2016-06-15 14:56:25', '日本 Japan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('648', '923455348983', '', '2016-06-15 11:53:53', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('649', '924183021429', '', '2016-06-16 09:38:45', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('650', '922541314269', '', '2016-06-17 12:19:27', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('651', '919485781397', '', '2016-06-18 09:01:58', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('652', '923455348498', '', '2016-06-20 10:55:26', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('653', '923455349333', '', '2016-06-17 10:47:36', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('655', '919485781388', '', '2016-06-17 13:57:38', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('656', '132207074008', '', '', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('657', '924806520888', '', '2016-06-20 09:19:00', '德国 Germany', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('664', '5262767729', '', '2016-06-29 15:51:42', '马来西亚 Malaysia', '派送并签收Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('658', '922533914321', '', '2016-06-29 13:25:05', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('671', '952068897146', '', '2016-06-17 16:24:32', '香港Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('659', '902054706045', '', '2016-06-16 18:27:55', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('660', '471455558279', '', '2016-06-14 17:45:49', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('661', '113161039272', '', '2016-06-14 10:43:49', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('662', '925501247027', '', '2016-06-20 12:36:46', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('663', '924678077808', '', '2016-06-20 13:14:35', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('683', '924809862747', '', '2016-06-23 17:09:48', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('670', '5262767733', '', '2016-06-22 14:31:00', '阿联酋 UAE', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('665', '113161039290', '', '2016-06-16 17:46:15', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('666', '920295388050', '', '2016-06-21 14:35:53', '澳大利亚 Australia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('667', '924678077678', '', '2016-06-21 11:40:07', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('668', '924678077817', '', '2016-06-21 11:39:59', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('669', '919485781402', '', '2016-06-22 10:11:20', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('675', '953006568036', '', '2016-06-21 10:27:35', '日本 Japan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('674', '953005707030', '', '2016-06-18 17:46:44', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('672', '923455221299', '', '2016-06-24 21:08:02', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('673', '919485781720', '', '2016-06-21 11:54:08', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('676', '924675264553', '', '2016-06-23 16:28:57', '德国 Germany', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('677', '924928726993', '', '2016-06-22 11:19:28', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('678', '924928726975', '', '2016-06-22 12:28:48', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('679', '924928727006', '', '2016-06-22 13:58:39', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('680', '924928726957', '', '2016-06-22 10:41:36', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('681', '924928726966', '', '2016-06-22 18:51:52', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('698', '662741703569', '', '2016-06-28 10:36:04', '英国 UK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('699', '664196855522', '', '2016-06-23 12:21:11', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('696', '113161039315', '', '2016-06-22 17:14:05', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('682', '924928948881', '', '2016-06-20 17:24:47', '台湾  Taiwan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('684', '662741598369', '', '2016-06-23 15:13:17', '台湾  Taiwan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('685', '925328360233', '', '2016-06-21 14:49:06', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('686', '471163682897', '', '2016-06-21 15:32:41', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('687', '922533914349', '', '2016-06-25 11:12:24', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('688', '919485781193', '', '2016-06-25 11:25:31', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('689', '904032810750', '', '2016-06-27 10:43:34', '英国 UK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('690', '925328710514', '', '2016-06-30 14:57:18', '澳大利亚 Australia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('691', '919485781166', '', '2016-06-27 14:45:16', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('692', '919485781157', '', '2016-06-27 14:49:58', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('693', '925328872110', '', '2016-06-29 16:57:24', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('695', '667424982486', '', '2016-06-22 17:26:54', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('697', '902102401616', '', '2016-06-29 16:31:13', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('700', '132480383483', '', '2016-06-24 14:57:20', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('721', '664214033591', '', '2016-07-08 09:35:45', '安提瓜 Antigua', '快件已经转交收件人指定的清关代理清关并由其负责派送。The shipment has been transferred to customs clearance customs clearance agent designated by the recipient and is responsible for the delivery of.');
INSERT INTO `jefsky_order` VALUES ('712', '952086125570', '', '2016-07-05 14:00:38', '新加坡Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('720', '922533914418', '', '2016-07-08 11:58:13', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('703', '5262767751', '', '2016-06-25 17:52:35', '台湾  Taiwan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('706', '924185186070', '', '2016-06-29 09:52:47', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('702', '924674674364', '', '2016-07-01 10:39:45', '安提瓜 Antigua', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('704', '925512580804', '', '2016-06-29 15:34:49', '日本 Japan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('709', '922540359096', '', '2016-06-30 15:30:34', '澳门 Macao', '派送并签收Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('708', '132207074035', '', '2016-06-27 15:51:11', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('710', '667424982495', '', '2016-06-29 14:35:25', '香港 Hong Kong', '派送并签收');
INSERT INTO `jefsky_order` VALUES ('711', '132202740208', '', '2016-06-29 13:42:29', '香港 Hong Kong', '派送并签收');
INSERT INTO `jefsky_order` VALUES ('718', '953007566336', '', '2016-07-04 12:57:30', '加拿大 Canada', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('713', '132132812232', '', '2016-06-30 05:37:39', '香港Hong Kong', '派送并签收Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('714', '664196978557', '', '2016-06-30 05:18:55', '香港 Hong Kong', '派送并签收Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('715', '953006565943', '', '2016-07-04 16:46:40', '台湾', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('716', '924678139562', '', '2016-07-07 16:38:10', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('717', '88832940545', '', '2016-07-04 17:49:24', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('719', '664215177922', '', '2016-06-30 16:57:19', '香港Hong Kong', '收到货物   Receive the goods');
INSERT INTO `jefsky_order` VALUES ('722', '921349494882', '', '2016-07-04 16:46:04', '台湾  Taiwan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('723', '664196855568', '', '2016-07-02 12:14:06', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('724', '132617846823', '', '2016-07-07 16:24:57', '香港 Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('725', '667424982477', '', '2016-07-07 16:26:24', '香港 Hong Kong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_order` VALUES ('726', '132069651572', '', '2016-07-07 14:58:42', '香港 Hong Kong', '货物已签收The goods have signed');
INSERT INTO `jefsky_order` VALUES ('727', '953005860642', '', '2016-07-13 07:36:08', '奥地利 Austria', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('728', '924678139299', '', '2016-07-11 12:13:49', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('729', '924185186052', '', '2016-07-11 11:30:42', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('733', '667424222128', '', '2016-07-15 15:39:51', '新加坡 Singapore', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('730', '950179162665', '', '2016-07-08 10:18:23', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('731', '953005702434', '', '2016-07-09 12:51:44', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('732', '925364930291', '', '2016-07-11 17:53:06', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('734', '113161039078', '', '2016-07-11 17:51:27', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('735', '925501246844', '', '2016-07-13 09:34:04', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('736', '132426514670', '', '2016-07-12 16:22:45', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('737', '924185186016', '', '2016-07-15 13:16:26', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('744', '925362443777', '', '2016-07-18 12:56:21', '英国 UK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('740', '667424772087', '', '2016-07-19 12:14:56', '日本 Japan', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('738', '952077711951', '', '2016-07-13 17:00:28', '澳门 Macao', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('739', '664196855489', '', '2016-07-13 17:00:24', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('741', '664196978645', '', '2016-07-14 13:42:13', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('742', '132589918537', '', '2016-07-14 16:58:51', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('743', '664217610622', '', '2016-07-13 17:00:28', '澳门 Macao', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('745', '925358030693', '', '2016-07-20 15:21:56', '澳大利亚 Australia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('746', '925506751747', '', '2016-07-20 12:28:09', '美国 USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('747', '132586895740', '', '2016-07-18 03:11:24', '台湾 Tai Wan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_order` VALUES ('748', '132586895759', '', '2016-07-18 03:11:56', '台湾 Tai Wan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_order` VALUES ('749', '132586895768', '', '2016-07-20 15:04:49', '台湾 Tai Wan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('750', '664194488156', '', '2016-07-19 14:39:45', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('751', '662741704102', '', '2016-07-25 10:41:54', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('752', '922533914524', '', '2016-07-23 12:30:14', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('755', '664706972656', '', '2016-07-20 17:56:55', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('753', '664196978636', '', '2016-07-20 16:58:11', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('754', '664196978627', '', '2016-07-20 15:08:08', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('756', '902106284595', '', '2016-07-28 11:46:48', '阿根廷 Argentina', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('757', '922533914445', '', '2016-07-26 15:11:06', '加拿大 Canada', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('758', '924192481468', '', '2016-07-23 10:44:46', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('759', '5262767320', '', '2016-07-20 16:34:20', '俄罗斯 Russia', '预计22号开船 No. 22 is expected to sail');
INSERT INTO `jefsky_order` VALUES ('773', '919920746542', '', '2016-07-29 14:15:26', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('760', '953005702425', '', '2016-07-21 16:47:04', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('761', '925368974703', '', '2016-07-22 17:23:06', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('762', '953006391351', '', '2016-07-22 16:23:48', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('763', '925368974698', '', '2016-07-22 16:32:25', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('764', '953024289402', '', '2016-07-25 15:50:46', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('765', '924185186007', '', '2016-07-27 11:32:04', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('774', '132584821556', '', '2016-08-01 09:51:22', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('766', '925328869252', '', '2016-07-28 13:56:48', '英国 UK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('767', '925328920137', '', '2016-07-26 14:54:07', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('768', '925426263030', '', '2016-07-26 13:20:25', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('769', '925328869225', '', '2016-07-30 09:16:14', '英国 UK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('770', '925426263021', '', '2016-07-26 13:13:29', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('771', '925328920128', '', '2016-07-25 10:51:56', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('772', '922533913787', '', '2016-07-26 09:55:15', '美国USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('775', '952065419692', '', '2016-08-11 14:55:48', '菲律宾 Philippines', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('777', '925328869640', '', '2016-08-12 15:30:32', '加拿大 Canada', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('776', '664706973096', '', '2016-08-01 16:54:30', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('778', '925396609455', '', '2016-08-04 14:10:07', '日本 Japan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('779', '667425944606', '', '2016-08-01 17:00:54', '香港 Hong Kong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('796', '664196855461', '', '2016-08-12 17:15:51', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('780', '925357312160', '', '2016-08-05 11:03:03', '美国 USA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('781', ' 925328869598', '', '2016-08-04 14:52:28', '英国 UK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_order` VALUES ('782', '925104917463', '', '2016-08-08 16:35:03', '台湾  Taiwan', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('783', '925104917472', '', '2016-08-08 16:33:53', '台湾  Taiwan', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('784', '664706972674', '', '2016-08-05 11:51:16', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('786', '924675221418', '', '2016-08-15 11:27:28', '美国USA', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('785', '664706972665', '', '2016-08-06 12:49:01', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('787', '925328869904', '', '2016-08-09 15:27:49', '英国 UK', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('788', '925328869677', '', '2016-08-09 08:29:54', '英国 UK', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('789', '925104559295', '', '2016-08-11 09:05:02', '台湾 Tai Wan', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('790', '132339387386', '', '2016-08-09 14:23:33', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('791', '925328869940', '', '2016-08-11 16:52:28', '英国 UK', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('792', '132584821662', '', '2016-08-10 12:57:50', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('793', '925426440581', '', '2016-08-13 07:14:12', '美国 USA', '离开香港，转运中leave Hong Kong，in operation');
INSERT INTO `jefsky_order` VALUES ('800', '926076809240', '', '2016-08-18 01:50:56', '巴基斯坦 Pakistan', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_order` VALUES ('794', '925104653012', '', '2016-08-12 16:31:07', '台湾 Tai Wan', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('795', '953007567898', '', '2016-08-15 11:53:43', '马来西亚 Malaysia', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('797', '664196180165', '', '2016-08-15 17:45:33', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('805', '132584821786', '', '2016-08-17 14:53:08', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('798', '925357137634', '', '2016-08-17 09:56:38', '英国 UK', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_order` VALUES ('799', '924185185782', '', '2016-08-18 04:48:38', '美国 USA', '离开香港，转运中leave Hong Kong，in operation');
INSERT INTO `jefsky_order` VALUES ('801', '924675220883', '', '2016-08-18 02:53:10', '美国 USA', '正在（已经）安排下一站转运 (already) arrangements for the next station');
INSERT INTO `jefsky_order` VALUES ('804', '925364707047', '', '2016-08-18 03:54:55', '英国 UK', '到达英国 Arrive in UK');
INSERT INTO `jefsky_order` VALUES ('806', '924185185773', '', '2016-08-18 09:09:39', '美国 USA', '到达香港 Arrive in Hong Kong');
INSERT INTO `jefsky_order` VALUES ('807', '953005860660', '', '2016-08-18 08:41:20', '奥地利 Austria', '到达香港 Arrive in Hong Kong');
INSERT INTO `jefsky_order` VALUES ('808', '925106009155', '', '2016-08-18 03:17:33', '台湾 Tai Wan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_order` VALUES ('809', '925106009146', '', '2016-08-18 03:17:15', '台湾 Tai Wan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_order` VALUES ('810', '925104311679', '', '2016-08-18 12:01:52', '新加坡 Singapore', '收到快件信息 Receive express message');

-- ----------------------------
-- Table structure for `jefsky_plugins`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_plugins`;
CREATE TABLE `jefsky_plugins` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(50) NOT NULL COMMENT '插件名，英文',
  `title` varchar(50) NOT NULL DEFAULT '' COMMENT '插件名称',
  `description` text COMMENT '插件描述',
  `type` tinyint(2) DEFAULT '0' COMMENT '插件类型, 1:网站；8;微信',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态；1开启；',
  `config` text COMMENT '插件配置',
  `hooks` varchar(255) DEFAULT NULL COMMENT '实现的钩子;以“，”分隔',
  `has_admin` tinyint(2) DEFAULT '0' COMMENT '插件是否有后台管理界面',
  `author` varchar(50) DEFAULT '' COMMENT '插件作者',
  `version` varchar(20) DEFAULT '' COMMENT '插件版本号',
  `createtime` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '插件安装时间',
  `listorder` smallint(6) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

-- ----------------------------
-- Records of jefsky_plugins
-- ----------------------------

-- ----------------------------
-- Table structure for `jefsky_posts`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_posts`;
CREATE TABLE `jefsky_posts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned DEFAULT '0' COMMENT '发表者id',
  `post_keywords` varchar(150) NOT NULL COMMENT 'seo keywords',
  `post_source` varchar(150) DEFAULT NULL COMMENT '转载文章的来源',
  `post_date` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post创建日期，永久不变，一般不显示给用户',
  `post_content` longtext COMMENT 'post内容',
  `post_title` text COMMENT 'post标题',
  `post_excerpt` text COMMENT 'post摘要',
  `post_status` int(2) DEFAULT '1' COMMENT 'post状态，1已审核，0未审核',
  `comment_status` int(2) DEFAULT '1' COMMENT '评论状态，1允许，0不允许',
  `post_modified` datetime DEFAULT '2000-01-01 00:00:00' COMMENT 'post更新时间，可在前台修改，显示给用户',
  `post_content_filtered` longtext,
  `post_parent` bigint(20) unsigned DEFAULT '0' COMMENT 'post的父级post id,表示post层级关系',
  `post_type` int(2) DEFAULT NULL,
  `post_mime_type` varchar(100) DEFAULT '',
  `comment_count` bigint(20) DEFAULT '0',
  `smeta` text COMMENT 'post的扩展字段，保存相关扩展属性，如缩略图；格式为json',
  `post_hits` int(11) DEFAULT '0' COMMENT 'post点击数，查看数',
  `post_like` int(11) DEFAULT '0' COMMENT 'post赞数',
  `istop` tinyint(1) NOT NULL DEFAULT '0' COMMENT '置顶 1置顶； 0不置顶',
  `recommended` tinyint(1) NOT NULL DEFAULT '0' COMMENT '推荐 1推荐 0不推荐',
  PRIMARY KEY (`id`),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`id`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`),
  KEY `post_date` (`post_date`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal文章表';

-- ----------------------------
-- Records of jefsky_posts
-- ----------------------------

-- ----------------------------
-- Table structure for `jefsky_role`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_role`;
CREATE TABLE `jefsky_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL COMMENT '角色名称',
  `pid` smallint(6) DEFAULT NULL COMMENT '父角色ID',
  `status` tinyint(1) unsigned DEFAULT NULL COMMENT '状态',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `listorder` int(3) NOT NULL DEFAULT '0' COMMENT '排序字段',
  PRIMARY KEY (`id`),
  KEY `parentId` (`pid`),
  KEY `status` (`status`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of jefsky_role
-- ----------------------------
INSERT INTO `jefsky_role` VALUES ('1', '超级管理员', '0', '1', '拥有网站最高管理员权限！', '1329633709', '1329633709', '0');

-- ----------------------------
-- Table structure for `jefsky_role_user`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_role_user`;
CREATE TABLE `jefsky_role_user` (
  `role_id` int(11) unsigned DEFAULT '0' COMMENT '角色 id',
  `user_id` int(11) DEFAULT '0' COMMENT '用户id',
  KEY `group_id` (`role_id`),
  KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户角色对应表';

-- ----------------------------
-- Records of jefsky_role_user
-- ----------------------------
INSERT INTO `jefsky_role_user` VALUES ('1', '3');

-- ----------------------------
-- Table structure for `jefsky_route`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_route`;
CREATE TABLE `jefsky_route` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '路由id',
  `full_url` varchar(255) DEFAULT NULL COMMENT '完整url， 如：portal/list/index?id=1',
  `url` varchar(255) DEFAULT NULL COMMENT '实际显示的url',
  `listorder` int(5) DEFAULT '0' COMMENT '排序，优先级，越小优先级越高',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态，1：启用 ;0：不启用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='url路由表';

-- ----------------------------
-- Records of jefsky_route
-- ----------------------------

-- ----------------------------
-- Table structure for `jefsky_slide`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_slide`;
CREATE TABLE `jefsky_slide` (
  `slide_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `slide_cid` int(11) NOT NULL COMMENT '幻灯片分类 id',
  `slide_name` varchar(255) NOT NULL COMMENT '幻灯片名称',
  `slide_pic` varchar(255) DEFAULT NULL COMMENT '幻灯片图片',
  `slide_url` varchar(255) DEFAULT NULL COMMENT '幻灯片链接',
  `slide_des` varchar(255) DEFAULT NULL COMMENT '幻灯片描述',
  `slide_content` text COMMENT '幻灯片内容',
  `slide_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  `listorder` int(10) DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`slide_id`),
  KEY `slide_cid` (`slide_cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片表';

-- ----------------------------
-- Records of jefsky_slide
-- ----------------------------

-- ----------------------------
-- Table structure for `jefsky_slide_cat`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_slide_cat`;
CREATE TABLE `jefsky_slide_cat` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` varchar(255) NOT NULL COMMENT '幻灯片分类',
  `cat_idname` varchar(255) NOT NULL COMMENT '幻灯片分类标识',
  `cat_remark` text COMMENT '分类备注',
  `cat_status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1显示，0不显示',
  PRIMARY KEY (`cid`),
  KEY `cat_idname` (`cat_idname`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='幻灯片分类表';

-- ----------------------------
-- Records of jefsky_slide_cat
-- ----------------------------

-- ----------------------------
-- Table structure for `jefsky_terms`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_terms`;
CREATE TABLE `jefsky_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `name` varchar(200) DEFAULT NULL COMMENT '分类名称',
  `slug` varchar(200) DEFAULT '',
  `taxonomy` varchar(32) DEFAULT NULL COMMENT '分类类型',
  `description` longtext COMMENT '分类描述',
  `parent` bigint(20) unsigned DEFAULT '0' COMMENT '分类父id',
  `count` bigint(20) DEFAULT '0' COMMENT '分类文章数',
  `path` varchar(500) DEFAULT NULL COMMENT '分类层级关系路径',
  `seo_title` varchar(500) DEFAULT NULL,
  `seo_keywords` varchar(500) DEFAULT NULL,
  `seo_description` varchar(500) DEFAULT NULL,
  `list_tpl` varchar(50) DEFAULT NULL COMMENT '分类列表模板',
  `one_tpl` varchar(50) DEFAULT NULL COMMENT '分类文章页模板',
  `listorder` int(5) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`term_id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类表';

-- ----------------------------
-- Records of jefsky_terms
-- ----------------------------
INSERT INTO `jefsky_terms` VALUES ('1', '列表演示', '', 'article', '', '0', '0', '0-1', '', '', '', 'list', 'article', '0', '1');
INSERT INTO `jefsky_terms` VALUES ('2', '瀑布流', '', 'article', '', '0', '0', '0-2', '', '', '', 'list_masonry', 'article', '0', '1');

-- ----------------------------
-- Table structure for `jefsky_term_relationships`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_term_relationships`;
CREATE TABLE `jefsky_term_relationships` (
  `tid` bigint(20) NOT NULL AUTO_INCREMENT,
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'posts表里文章id',
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '分类id',
  `listorder` int(10) NOT NULL DEFAULT '0' COMMENT '排序',
  `status` int(2) NOT NULL DEFAULT '1' COMMENT '状态，1发布，0不发布',
  PRIMARY KEY (`tid`),
  KEY `term_taxonomy_id` (`term_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='Portal 文章分类对应表';

-- ----------------------------
-- Records of jefsky_term_relationships
-- ----------------------------

-- ----------------------------
-- Table structure for `jefsky_users`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_users`;
CREATE TABLE `jefsky_users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_login` varchar(60) NOT NULL DEFAULT '' COMMENT '用户名',
  `user_pass` varchar(64) NOT NULL DEFAULT '' COMMENT '登录密码；sp_password加密',
  `user_nicename` varchar(50) NOT NULL DEFAULT '' COMMENT '用户美名',
  `user_email` varchar(100) NOT NULL DEFAULT '' COMMENT '登录邮箱',
  `user_url` varchar(100) NOT NULL DEFAULT '' COMMENT '用户个人网站',
  `avatar` varchar(255) DEFAULT NULL COMMENT '用户头像，相对于upload/avatar目录',
  `sex` smallint(1) DEFAULT '0' COMMENT '性别；0：保密，1：男；2：女',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `last_login_ip` varchar(16) DEFAULT NULL COMMENT '最后登录ip',
  `last_login_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '最后登录时间',
  `create_time` datetime NOT NULL DEFAULT '2000-01-01 00:00:00' COMMENT '注册时间',
  `user_activation_key` varchar(60) NOT NULL DEFAULT '' COMMENT '激活码',
  `user_status` int(11) NOT NULL DEFAULT '1' COMMENT '用户状态 0：禁用； 1：正常 ；2：未验证',
  `score` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `user_type` smallint(1) DEFAULT '1' COMMENT '用户类型，1:admin ;2:会员',
  `coin` int(11) NOT NULL DEFAULT '0' COMMENT '金币',
  `mobile` varchar(20) NOT NULL DEFAULT '' COMMENT '手机号',
  PRIMARY KEY (`id`),
  KEY `user_login_key` (`user_login`),
  KEY `user_nicename` (`user_nicename`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of jefsky_users
-- ----------------------------
INSERT INTO `jefsky_users` VALUES ('1', 'admin', '###127fbcd4f16d67cac489d83e10c9610a', 'admin', '371048998@qq.com', '', null, '0', null, null, '127.0.0.1', '2016-08-18 23:38:48', '2016-08-18 11:17:49', '', '1', '0', '1', '0', '');
INSERT INTO `jefsky_users` VALUES ('3', 'ruan', '###f51bce2455bd3c7b13e9db5c6b79a7bf', '', '123@123.com', '', null, '0', null, null, null, '2000-01-01 00:00:00', '2016-08-18 23:41:06', '', '1', '0', '1', '0', '');

-- ----------------------------
-- Table structure for `jefsky_user_favorites`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_user_favorites`;
CREATE TABLE `jefsky_user_favorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(20) DEFAULT NULL COMMENT '用户 id',
  `title` varchar(255) DEFAULT NULL COMMENT '收藏内容的标题',
  `url` varchar(255) DEFAULT NULL COMMENT '收藏内容的原文地址，不带域名',
  `description` varchar(500) DEFAULT NULL COMMENT '收藏内容的描述',
  `table` varchar(50) DEFAULT NULL COMMENT '收藏实体以前所在表，不带前缀',
  `object_id` int(11) DEFAULT NULL COMMENT '收藏内容原来的主键id',
  `createtime` int(11) DEFAULT NULL COMMENT '收藏时间',
  PRIMARY KEY (`id`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户收藏表';

-- ----------------------------
-- Records of jefsky_user_favorites
-- ----------------------------

-- ----------------------------
-- Table structure for `jefsky_wuliu`
-- ----------------------------
DROP TABLE IF EXISTS `jefsky_wuliu`;
CREATE TABLE `jefsky_wuliu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `w_yid` varchar(50) NOT NULL COMMENT '运单号',
  `w_date` varchar(50) NOT NULL COMMENT '日期时间',
  `w_place` varchar(50) NOT NULL COMMENT '区域',
  `w_content` text NOT NULL COMMENT '详细信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4464 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jefsky_wuliu
-- ----------------------------
INSERT INTO `jefsky_wuliu` VALUES ('1593', '922531038104', '2016-03-22 08:29:29', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1540', '922516342330', '2016-03-21 08:29:29', '新加坡Singapore', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1537', '922516342330', '2016-03-19 15:58:30', '深圳shenzhen', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('1536', '922516342330', '2016-03-19 02:56:25', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1499', '921845523514', '2016-03-19 07:42:21', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1498', '922531037843', '2016-03-20 09:39:18', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1500', '921845523514', '2016-03-20 05:29:51', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1488', '922533731889', '2016-03-20 11:21:51', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1489', '922533772617', '2016-03-19 05:23:44', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1490', '922533772617', '2016-03-20 12:24:39', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1491', '922533772653', '2016-03-22 03:53:34', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1492', '922533772635', '2016-03-20 10:27:58', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1493', '922533772635', '2016-03-19 22:32:40', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1494', '922533772722', '2016-03-19 05:33:57', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1495', '922533772722', '2016-03-20 09:34:32', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1496', '922531037843', '2016-03-18 18:37:59', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1497', '922531037843', '2016-03-19 05:38:40', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1558', '922531037913', '2016-03-21 08:07:58', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件正在派送中Express mail is sent');
INSERT INTO `jefsky_wuliu` VALUES ('1557', '922531037913', '2016-03-21 06:06:37', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1535', '132473625510', '2016-03-21 12:22:13', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1533', '922517191265', '2016-03-21 14:27:50', '日本Japan', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1534', '132473625510', '2016-03-21 10:19:35', '香港Hongkong', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1539', '922516342330', '2016-03-20 16:02:40', '新加坡Singapore', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1538', '922516342330', '2016-03-20 08:59:27', '新加坡Singapore', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1556', '921845523499', '2016-03-21 06:23:04', 'MIAMI, FL - USA', '快件已经到达派送作业地点 Express delivery has arrived at the site of operation');
INSERT INTO `jefsky_wuliu` VALUES ('1371', '471472914172', '2016-03-15 12:26:19', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1372', '471472914172', '2016-03-15 14:27:27', 'HONG KONG - HONG KONG', '离开转运地 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1373', '471472914172', '2016-03-15 09:28:31', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1374', '662743480772', '2016-03-15 17:43:19', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1375', '662743480772', '2016-03-15 08:43:22', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1376', '664179175399', '2016-03-15 12:52:01', '深圳shenzhen', '重新清关');
INSERT INTO `jefsky_wuliu` VALUES ('1377', '664179175399', '2016-03-15 17:17:48', '香港Hongkong', '通关到港');
INSERT INTO `jefsky_wuliu` VALUES ('1378', '664179175399', '2016-03-16 09:13:26', '香港Hongkong', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1379', '664179175399', '2016-03-16 10:25:50', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1367', '921845523357', '2016-03-15 10:06:17', 'MIAMI, FL - USA', '快件正在派送中Express mail is sent');
INSERT INTO `jefsky_wuliu` VALUES ('1368', '921845523357', '2016-03-15 10:13:49', 'MIAMI, FL - USA', '快件正在派送中Express mail is sent');
INSERT INTO `jefsky_wuliu` VALUES ('1369', '921845523357', '', 'MIAMI, FL - USA', '快件正在派送中Express mail is sent');
INSERT INTO `jefsky_wuliu` VALUES ('1370', '921845523357', '2016-03-15 15:28:28', 'CORAL GABLES', '已派送并签收: I PARRADO');
INSERT INTO `jefsky_wuliu` VALUES ('1362', '132132788332', '2016-03-15 14:29:28', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1363', '921845523357', '2016-03-15 01:19:33', 'CINCINNATI HUB, OH - USA', '快件到达中转中心 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1364', '921845523357', '2016-03-15 03:21:26', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1365', '921845523357', '2016-03-15 04:04:23', 'CINCINNATI HUB, OH - USA', '正在（已经）安排下一站的转运 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1366', '921845523357', '2016-03-15 09:11:28', 'MIAMI, FL - USA', '快件已经到达派送作业地点 MIAMI - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1331', '664215349484', '2016-03-14 24:46:54', '东莞-香港', '货物处理中');
INSERT INTO `jefsky_wuliu` VALUES ('1332', '664215349484', '2016-03-15 05:14:53', '深圳shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1333', '664215349484', '2016-03-15 09:16:27', '香港Hongkong', '海关放行Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1334', '132132788332', '2016-03-14 24:19:40', '东莞', '货物处理中');
INSERT INTO `jefsky_wuliu` VALUES ('1335', '132132788332', '2016-03-15 05:20:19', '深圳shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1336', '132132788332', '2016-03-15 08:21:03', '香港Hongkong', '海关放行Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1348', '664215349484', '2016-03-15 13:57:44', '香港Hongkong', '已签收Already sign');
INSERT INTO `jefsky_wuliu` VALUES ('1349', '132132788332', '2016-03-15 11:59:32', '香港Hongkong', '派件中Send a piece of');
INSERT INTO `jefsky_wuliu` VALUES ('1350', '922548033537', '2016-03-13 10:02:24', '东莞', '发往广州中转中心Sent to the Guangzhou transit centre');
INSERT INTO `jefsky_wuliu` VALUES ('1351', '922548033537', '2016-03-13 14:03:48', '广州Guangzhou', '到达广州中转中心Arrival at the Guangzhou transit centre');
INSERT INTO `jefsky_wuliu` VALUES ('1352', '922548033537', '2016-03-13 22:04:59', '广州Guangzhou', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1353', '922548033537', '2016-03-14 04:05:34', '新加坡Singapore', '中转中Transfer medium');
INSERT INTO `jefsky_wuliu` VALUES ('1354', '922548033537', '2016-03-15 08:06:50', '新加坡Singapore', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1355', '922548033537', '2016-03-15 14:07:40', '新加坡Singapore', '清关流程：等待收件人付关税Customs clearance process: waiting for the recipient to pay customs duties');
INSERT INTO `jefsky_wuliu` VALUES ('1356', '471472914163', '2016-03-15 03:10:55', 'LOS ANGELES GATEWAY, CA - USA', '快件到达中转中心 LOS ANGELES GATEWAY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1357', '471472914163', '2016-03-15 03:40:50', 'LOS ANGELES GATEWAY, CA - USA', '快件已完成清关手续并从海关放行 LOS ANGELES GATEWAY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1358', '471472914163', '2016-03-15 04:29:03', 'LOS ANGELES GATEWAY, CA - USA', '正在（已经）安排下一站的转运 LOS ANGELES GATEWAY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1359', '471472914163', '2016-03-15 08:18:23', 'PHOENIX, AZ - USA', '快件已经到达派送作业地点 PHOENIX - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1360', '471472914163', '2016-03-15 08:42:49', 'PHOENIX, AZ - USA', '快件正在派送中Express mail is sent');
INSERT INTO `jefsky_wuliu` VALUES ('1361', '471472914163', '2016-03-15 12:36:29', 'PHOENIX, AZ - USA', '已尝试派送－派送时收件人地点已关闭Have tried to send - send when the recipient site has been closed');
INSERT INTO `jefsky_wuliu` VALUES ('1342', '921845523357', '2016-03-14 17:37:59', '香港Hongkong', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1343', '921845523357', '2016-03-14 21:50:55', '香港Hongkong', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1315', '132573289561', '2016-03-14 17:50:33', '新加坡Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1326', '471472914163', '2016-03-15 01:07:40', '香港Hongkong', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1325', '471472914172', '2016-03-14 23:54:54', '香港Hongkong', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1324', '471472914172', '2016-03-14 23:45:54', '香港Hongkong', '离开转运地 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1323', '471472914172', '2016-03-14 23:42:09', '香港Hongkong', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1320', '662743480772', '2016-03-14 23:33:44', '香港Hongkong', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1321', '662743480772', '2016-03-15 23:35:31', '香港Hongkong', '离开转运地 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1322', '662743480772', '2016-03-14 23:43:06', '香港Hongkong', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1327', '471472914163', '2016-03-15 03:46:26', '香港Hongkong', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1328', '471472914163', '2016-03-15 03:34:02', '香港Hongkong', '离开转运地 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1329', '471472914163', '2016-03-14 15:41:11', '美国 LOS ANGELES GATEWAY, CA - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1438', '132580861004', '2016-03-18 21:55:38', '深圳shenzhen', '离开深圳，运转中Leave shenzhen, in operation');
INSERT INTO `jefsky_wuliu` VALUES ('1439', '922555054131', '2016-03-18 18:00:34', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1853', '664194992160', '2016-03-24 13:44:41', 'SINGAPORE - SINGAPORE', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1437', '132580861004', '2016-03-18 09:38:36', '深圳shenzhen', '申报出口中Declaration for export in');
INSERT INTO `jefsky_wuliu` VALUES ('1436', '922533947164', '2016-03-18 16:52:40', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1435', '922530843065', '2016-03-18 15:50:04', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1408', '922531037913', '2016-03-18 13:33:44', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1406', '132132788314', '2016-03-17 13:21:52', '香港 HONG KONG', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1407', '132132788314', '2016-03-17 14:22:27', '香港 HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1399', '471472914172', '2016-03-16 10:37:34', 'PENNSAUKEN', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1400', '922533772671', '2016-03-16 18:57:08', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1401', '922533772699', '2016-03-16 16:33:18', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1402', '922531037940', '2016-03-16 16:37:56', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1403', '922533803872', '2016-03-16 16:41:46', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1404', '922535311906', '2016-03-16 10:12:30', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('1405', '922535311906', '2016-03-17 16:15:02', '深圳shenzhen', '入海运仓，等待下一站运输The shipping warehouse, waiting for the next transport');
INSERT INTO `jefsky_wuliu` VALUES ('1300', '132573289561', '2016-03-10 09:35:32', '深圳shenzhen', '申报出口中Declaration for export in');
INSERT INTO `jefsky_wuliu` VALUES ('1291', '921849571819', '2016-03-09 14:32:21', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1298', '132171660759', '2016-03-09 16:46:59', '深圳shenzhen', '申报成功，等待下一站运转To declare success, waiting for the next stop');
INSERT INTO `jefsky_wuliu` VALUES ('1299', '132171660759', '2016-03-10 09:49:31', '深圳-韩国Shenzhen- South Korea', '离开深圳，运转中Leave shenzhen, in operation');
INSERT INTO `jefsky_wuliu` VALUES ('1522', '662741700404', '2016-03-20 23:37:42', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1521', '662741700404', '2016-03-19 15:36:22', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1520', '921845523532', '2016-03-20 14:34:49', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1516', '921845523499', '2016-03-20 09:23:09', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1752', '664160298431', '2016-03-27 04:28:16', '', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1751', '921845464165', '2016-03-26 22:19:28', '香港Hongkong', '离开转运地-香港 Leaving the run - Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('1519', '921845523532', '2016-03-19 10:33:25', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1460', '922533772699', '2016-03-17 10:10:26', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1461', '922533772699', '2016-03-17 10:10:26', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1462', '922533772699', '2016-03-17 10:11:50', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1463', '922533772699', '2016-03-18 01:12:30', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1464', '922533772699', '2016-03-18 09:06:09', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1465', '922533772699', '2016-03-18 09:45:50', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件正在派送中Express mail is sent');
INSERT INTO `jefsky_wuliu` VALUES ('1466', '922533772699', '2016-03-18 13:17:04', 'GERMANTOWN', '已派送并签收: Sign and have it delivered');
INSERT INTO `jefsky_wuliu` VALUES ('1398', '471472914172', '2016-03-16 09:56:22', 'WEST PHILADELPHIA, PA - USA', '快件正在派送中Express mail is sent');
INSERT INTO `jefsky_wuliu` VALUES ('1397', '471472914172', '2016-03-16 09:33:49', 'WEST PHILADELPHIA, PA - USA', '快件已经到达派送作业地点 WEST PHILADELPHIA - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1530', '922517191265', '2016-03-21 14:23:14', '日本Japan', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1450', '922533803872', '2016-03-18 14:26:56', 'ONTARIO SERVICE AREA, ON - CANADA', '待确认递送地址；请联络DHL  To be confirmed delivery address; please contact DHL');
INSERT INTO `jefsky_wuliu` VALUES ('1451', '132560077048', '2016-03-17 13:20:24', '香港 HONG KONG', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1452', '132473625510', '2016-03-19 11:21:14', '香港 HONG KONG', '通关到港Clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('1453', '132473625510', '2016-03-19 12:21:48', '香港 HONG KONG', '收件人要求星期一派送');
INSERT INTO `jefsky_wuliu` VALUES ('1454', '132560077048', '2016-03-17 14:23:03', '香港 HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1531', '922517191265', '2016-03-21 14:23:14', '日本Japan', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1529', '922517191265', '2016-03-19 18:21:33', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('1526', '921845464174', '2016-03-18 17:29:04', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1527', '921845464174', '2016-03-19 15:30:02', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1528', '921845464174', '2016-03-21 17:41:17', 'CINCINNATI HUB, OH - USA', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('1428', '922533772626', '2016-03-18 15:41:48', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1429', '922517191265', '2016-03-18 15:21:55', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1430', '922530843250', '2016-03-18 15:27:16', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1431', '921845523499', '2016-03-18 14:30:25', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1432', '922531037843', '2016-03-18 15:37:49', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1433', '922533772662', '2016-03-18 14:40:22', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1434', '921845523514', '2016-03-18 19:43:37', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1447', '922533803872', '2016-03-18 09:13:40', 'ONTARIO SERVICE AREA, ON - CANADA', '快件已完成清关手续并从海关放行 ONTARIO SERVICE AREA - CANADA');
INSERT INTO `jefsky_wuliu` VALUES ('1448', '922533803872', '2016-03-18 10:51:30', 'ONTARIO SERVICE AREA, ON - CANADA', '快件已经到达派送作业地点 ONTARIO SERVICE AREA - CANADA');
INSERT INTO `jefsky_wuliu` VALUES ('1449', '922533803872', '2016-03-18 11:16:32', 'ONTARIO SERVICE AREA, ON - CANADA', '快件正在派送中Express mail is sent');
INSERT INTO `jefsky_wuliu` VALUES ('1396', '471472914172', '2016-03-16 02:30:38', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1395', '662743480772', '2016-03-16 15:53:59', 'LAWRENCEVILLE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1390', '922531037834', '2016-03-16 15:33:48', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1391', '471472914163', '2016-03-16 08:21:28', 'PHOENIX, AZ - USA', '快件正在第三次派送中Express mail is delivered in the third');
INSERT INTO `jefsky_wuliu` VALUES ('1392', '471472914163', '2016-03-16 11:23:12', 'SCOTTSDALE', '已派送并签收: D HANIG');
INSERT INTO `jefsky_wuliu` VALUES ('1393', '662743480772', '2016-03-16 09:27:18', 'RICHMOND, VA - USA', '快件已经到达派送作业地点 RICHMOND - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1394', '662743480772', '2016-03-16 09:57:01', 'RICHMOND, VA - USA', '快件正在派送中Express mail is sent');
INSERT INTO `jefsky_wuliu` VALUES ('1532', '922517191265', '2016-03-21 14:23:14', '日本Japan', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1749', '922555054131', '2016-03-23 15:24:26', 'Australia', '快件已经到达派送作业地点 Australia');
INSERT INTO `jefsky_wuliu` VALUES ('1750', '921845464174', '2016-03-25 14:58:18', '美国 USA', '离开转运地 Leave a transit');
INSERT INTO `jefsky_wuliu` VALUES ('1442', '132473625510', '2016-03-19 02:45:48', '东莞dongguan', '已装港车，准备下一站运转');
INSERT INTO `jefsky_wuliu` VALUES ('1443', '132473625510', '2016-03-19 09:26:22', '深圳shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1444', '922533803872', '2016-03-17 09:28:25', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1445', '922533803872', '2016-03-18 01:30:32', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1446', '922533803872', '2016-03-18 07:26:12', 'ONTARIO SERVICE AREA, ON - CANADA', '快件到达中转中心 ONTARIO SERVICE AREA - CANADA');
INSERT INTO `jefsky_wuliu` VALUES ('1427', '922531038104', '2016-03-18 15:33:20', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1426', '922533772713', '2016-03-18 15:30:45', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1524', '921845463929', '2016-03-18 15:22:32', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1423', '922533772608', '2016-03-18 15:33:53', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1424', '922531038131', '2016-03-18 15:37:44', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1425', '922533772653', '2016-03-18 15:32:34', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1409', '922531037913', '2016-03-18 08:23:53', '香港 HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1410', '922533772592', '2016-03-18 13:54:25', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1411', '922533772592', '2016-03-18 08:38:00', '香港 HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1412', '922533772704', '2016-03-17 14:11:35', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1413', '922533772704', '2016-03-18 08:09:18', '香港 HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1414', '922533731889', '2016-03-17 14:15:32', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1415', '922533731889', '2016-03-18 08:16:17', '香港 HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1416', '922533772617', '2016-03-17 14:20:53', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1417', '922533772617', '2016-03-18 08:21:34', '香港 HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1418', '922533772635', '2016-03-17 14:34:29', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1419', '922533772635', '2016-03-18 08:35:12', '香港 HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1420', '922533772722', '2016-03-17 14:39:11', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1421', '922533772722', '2016-03-18 08:26:42', '香港 HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1476', '132602047355', '2016-03-14 10:16:09', 'HO CHI MINH CITY VN', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1459', '922531037940', '2016-03-18 15:35:19', 'GAITHERSBURG', '已派送并签收Sign and have it delivered');
INSERT INTO `jefsky_wuliu` VALUES ('1456', '922531037940', '2016-03-18 00:31:40', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1457', '922531037940', '2016-03-18 09:33:00', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1458', '922531037940', '2016-03-19 10:03:21', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件正在派送中Express mail is sent');
INSERT INTO `jefsky_wuliu` VALUES ('1455', '922531037940', '2016-03-17 09:29:44', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1515', '921845523499', '2016-03-19 10:22:13', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1514', '921845523499', '2016-03-19 03:21:20', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1473', '922531037834', '2016-03-20 08:37:48', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1474', '922531037834', '2016-03-17 09:13:29', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件正在派送中Express mail is sent');
INSERT INTO `jefsky_wuliu` VALUES ('1475', '922531037834', '2016-03-17 10:40:37', 'RICHMOND, VA - USA', '派送并已签收Sign and have it delivered');
INSERT INTO `jefsky_wuliu` VALUES ('1487', '922533731889', '2016-03-19 05:20:04', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1486', '922533772704', '2016-03-20 08:13:06', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1471', '922533772671', '2016-03-18 12:29:02', 'RICHMOND, VA - USA', '已派送并签收: Sign and have it delivered');
INSERT INTO `jefsky_wuliu` VALUES ('1472', '922531037834', '2016-03-16 18:36:34', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1470', '922533772671', '2016-03-18 09:35:52', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件正在派送中Express mail is sent');
INSERT INTO `jefsky_wuliu` VALUES ('1485', '922533772704', '2016-03-19 10:11:08', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1477', '132602047355', '2016-03-14 13:22:30', '	HO CHI MINH CITY VN', '快件正在派送中Express mail is sent');
INSERT INTO `jefsky_wuliu` VALUES ('1478', '132602047355', '2016-03-14 14:16:26', '	DANANG CITY VN', '已派送并签收: Sign and have it delivered');
INSERT INTO `jefsky_wuliu` VALUES ('1484', '922533772592', '2016-03-20 13:01:00', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1482', '922533772592', '2016-03-19 10:36:28', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1483', '922533772592', '2016-03-19 05:27:27', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1480', '922531037913', '2016-03-19 05:49:46', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1481', '922531037913', '2016-03-20 11:34:14', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1479', '922531037913', '2016-03-19 10:23:49', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1467', '922533772671', '2016-03-18 10:20:44', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1468', '922533772671', '2016-03-18 00:21:49', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1469', '922533772671', '2016-03-18 09:07:34', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1257', '922528976133', '2016-03-03 12:02:21', '香港Hongkong', '等待安排派送');
INSERT INTO `jefsky_wuliu` VALUES ('1256', '922528976133', '2016-03-03 09:51:04', '香港Hongkong', '通关到港');
INSERT INTO `jefsky_wuliu` VALUES ('1555', '922530843250', '2016-03-21 12:15:17', 'LONG BEACH, CA - USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1554', '922530843250', '2016-03-21 11:48:22', 'LONG BEACH, CA - USA', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1553', '922530843250', '2016-03-21 04:20:04', 'LONG BEACH, CA - USA', '快件已经到达派送作业地点 Express delivery has arrived at the site of operation');
INSERT INTO `jefsky_wuliu` VALUES ('1552', '132580861004', '2016-03-21 14:40:09', '新加坡Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1551', '132580861004', '2016-03-21 13:22:29', '新加坡Singapore', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1544', '922535311906', '2016-03-21 14:33:39', '泰国Thailand', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1545', '921845523514', '2016-03-21 07:26:05', 'NEW YORK, NY - USA', '快件已经到达派送作业地点 Express delivery has arrived at the site of operation');
INSERT INTO `jefsky_wuliu` VALUES ('1546', '921845523514', '2016-03-21 09:03:03', 'NEW YORK, NY - USA', '快件正在派送中Express mail is sent');
INSERT INTO `jefsky_wuliu` VALUES ('1547', '921845523514', '2016-03-21 13:28:44', 'NEW YORK, NY - USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1548', '922530843065', '2016-03-21 06:35:20', 'FRANKLIN PARK, IL - USA', '快件已经到达派送作业地点 Express delivery has arrived at the site of operation');
INSERT INTO `jefsky_wuliu` VALUES ('1549', '922530843065', '2016-03-21 08:36:21', 'FRANKLIN PARK, IL - USA', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1550', '922530843065', '2016-03-21 12:37:05', 'CHICAGO', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1574', '922533772662', '2016-03-21 14:58:22', 'ROCKVILLE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1570', '922533772662', '2016-03-21 17:49:44', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1571', '922533772662', '2016-03-19 17:56:25', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1572', '922533772662', '2016-03-20 10:31:40', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1560', '922533772592', '2016-03-21 06:13:30', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1559', '922531037913', '2016-03-21 15:09:23', 'GAITHERSBURG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1255', '922528976133', '2016-03-03 07:29:18', '深圳-香港', '清关流程');
INSERT INTO `jefsky_wuliu` VALUES ('1254', '922528976133', '2016-03-03 05:40:40', '深圳-香港', '离开东莞，运输中');
INSERT INTO `jefsky_wuliu` VALUES ('1253', '922528976133', '2016-03-03 03:26:26', '东莞', '货物已装港车');
INSERT INTO `jefsky_wuliu` VALUES ('1252', '664214063419', '2016-03-03 09:12:40', '深圳shenzhen', '货物在申报出口中');
INSERT INTO `jefsky_wuliu` VALUES ('1251', '664214063419', '2016-03-02 20:49:31', '深圳shenzhen', '货物已到深圳机场');
INSERT INTO `jefsky_wuliu` VALUES ('1729', '919490789874', '2016-03-25 08:32:13', 'DFW AIRPORT, TX - USA', '快件已经到达派送作业地点 DFW AIRPORT, TX - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1543', '922535311906', '2016-03-18 09:32:47', '深圳shenzhen', '离开深圳，运转中Leave shenzhen, in operation');
INSERT INTO `jefsky_wuliu` VALUES ('1541', '922516342330', '2016-03-21 11:04:49', '新加坡Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1542', '922533803872', '2016-03-21 09:14:31', 'ONTARIO SERVICE AREA, ON - CANADA', '等待确认收件人地址Wait for the confirmation of the recipient\'s address');
INSERT INTO `jefsky_wuliu` VALUES ('1575', '922531037843', '2016-03-21 14:58:54', 'ROCKVILLE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1576', '921845523532', '2016-03-22 03:57:26', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1573', '922533772662', '2016-03-21 06:13:31', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1592', '922531038104', '2016-03-22 03:09:47', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1389', '132132788314', '2016-03-17 11:01:48', '香港 HONG KONG', '通关到港Clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('1388', '132132788314', '2016-03-17 07:26:18', '深圳shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1693', '922533772326', '2016-03-23 11:36:46', 'GUANG ZHOU', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1694', '922533919272', '2016-03-24 11:11:13', 'GUANG ZHOU', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1387', '132132788314', '2016-03-17 05:18:46', '东莞', '离开东莞，运输中Leave Dongguan, transportation');
INSERT INTO `jefsky_wuliu` VALUES ('1568', '922533772722', '2016-03-21 06:13:46', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1569', '922533772722', '2016-03-21 12:30:03', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '将根据与客户沟通的转运时间，另行安排派送According to the transit time to communicate with customers, arrange separate delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1561', '922533772592', '2016-03-21 16:39:25', 'NO POTOMAC', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1562', '922533772704', '2016-03-21 14:15:34', 'GERMANTOWN', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1563', '922533731889', '2016-03-21 04:45:19', 'DFW AIRPORT, TX - USA', '快件已经到达派送作业地点 DFW AIRPORT - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1564', '922533731889', '2016-03-22 17:45:17', 'GERMANTOWN', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1565', '922533772617', '2016-03-21 16:31:35', 'SILVER SPRING', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1566', '922533772635', '2016-03-21 06:14:32', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1567', '922533772635', '2016-03-21 16:39:07', 'NORTH POTOMAC', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1583', '922533772608', '2016-03-21 12:22:30', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1582', '922533772608', '2016-03-21 20:21:15', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1591', '922531038104', '2016-03-21 12:31:37', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1590', '922531038104', '2016-03-21 20:23:41', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1577', '922246037089', '2016-03-20 15:38:03', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1578', '922246037089', '2016-03-21 10:39:42', '香港Hongkong', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1579', '662741700404', '2016-03-21 14:59:18', 'LOS ANGELES GATEWAY, CA - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1581', '922246037089', '2016-03-22 01:41:25', '香港Hongkong', '离开转运地-香港 Leaving the run - Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('1580', '662741700404', '2016-03-22 03:25:24', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已完成清关手续并从海关放行 LOS ANGELES GATEWAY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1588', '922531037870', '2016-03-22 03:33:32', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1589', '922531037870', '2016-03-22 03:54:04', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1594', '922533772713', '2016-03-21 21:40:09', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1584', '922533772608', '2016-03-22 03:07:09', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1585', '922533772626', '2016-03-21 20:21:40', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1586', '922533772626', '2016-03-21 12:22:39', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1587', '922533772626', '2016-03-22 03:09:29', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1609', '662741700404', '2016-03-22 09:49:56', 'FREMONT, CA - USA', '快件已经到达派送作业地点 FREMONT - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1608', '922533947164', '2016-03-21 12:07:38', 'CHAMBERSBURG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1604', '922535311915', '2016-03-22 11:17:14', '香港 HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1607', '922533947164', '2016-03-21 05:49:10', 'HARRISBURG, PA - USA', '快件已经到达派送作业地点 HARRISBURG, PA - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1606', '922555054131', '2016-03-18 23:32:50', 'GUANG ZHOU', '快件到达中转中心 GUANG ZHOU-GUANG ZHOU');
INSERT INTO `jefsky_wuliu` VALUES ('1748', '922553846036', '2016-03-22 21:28:31', 'Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1386', '132132788314', '2016-03-17 02:59:07', '东莞', '已装港车，准备下一站运转');
INSERT INTO `jefsky_wuliu` VALUES ('1347', '664215349484', '2016-03-15 11:56:58', '香港Hongkong', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1346', '922531037834', '2016-03-15 01:02:14', '广州Guangzhou', '【广州市】 离开广州市 发往纽约肯尼迪机场（经转）[Guangzhou] to leave Guangzhou city to New York J.F.Kennedy.Apt Airport (via)');
INSERT INTO `jefsky_wuliu` VALUES ('1345', '921845523357', '2016-03-14 12:21:47', '美国CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1344', '921845523357', '2016-03-14 22:18:38', '香港Hongkong', '离开转运地 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1307', '664179175399', '2016-03-12 01:56:11', '东莞-香港', '已装港车，准备下一站运转');
INSERT INTO `jefsky_wuliu` VALUES ('1308', '664179175399', '2016-03-12 05:16:55', '东莞-香港', '离开东莞，运输中');
INSERT INTO `jefsky_wuliu` VALUES ('1309', '664179175399', '2016-03-12 08:36:35', '深圳shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1310', '664179175399', '2016-03-12 10:09:19', '深圳shenzhen', '大陆海关查验，很抱歉！时效延误');
INSERT INTO `jefsky_wuliu` VALUES ('1305', '132573289561', '2016-03-11 19:18:26', '深圳shenzhen', '离开深圳，运转中Leave shenzhen, in operation');
INSERT INTO `jefsky_wuliu` VALUES ('1306', '132573289561', '2016-03-12 00:22:52', '新加坡Singapore', '等待清关Wait for customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1303', '132573289561', '2016-03-11 10:46:41', '深圳机舱Shenzhen machine warehouse', '等待航班起飞，准备下一站运转Waiting for departure, get ready for the next station');
INSERT INTO `jefsky_wuliu` VALUES ('1304', '132171660759', '2016-03-11 09:33:42', '韩国South Korea', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1595', '922533772713', '2016-03-21 12:31:56', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1596', '922533772713', '2016-03-22 03:10:02', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1597', '922533772713', '2016-03-22 08:29:59', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1598', '922535311915', '2016-03-22 02:43:44', '东莞dongguan', '已装港车，准备下一站运转');
INSERT INTO `jefsky_wuliu` VALUES ('1599', '922535311915', '2016-03-22 07:44:15', '深圳shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1600', '922531038131', '2016-03-22 03:33:04', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1601', '922535311915', '2016-03-22 10:08:57', '香港Hongkong', '通关到港Clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('1602', '922531038131', '2016-03-22 03:56:52', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1603', '922535311915', '2016-03-22 10:23:42', '香港 HONG KONG', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1301', '132573289561', '2016-03-10 14:55:21', '深圳机舱Shenzhen machine warehouse', '因货物单件超长，预定舱位Single long for goods, booking shipping space');
INSERT INTO `jefsky_wuliu` VALUES ('1302', '5262735447', '2016-03-11 08:20:57', '马来西亚 Malaysia', '快件已经到达派送作业地点  Express delivery has arrived at the site of operation');
INSERT INTO `jefsky_wuliu` VALUES ('1385', '132560077048', '2016-03-17 10:56:16', '香港 HONG KONG', '通关到港Clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('1384', '132560077048', '2016-03-17 07:39:44', '深圳shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1380', '662743480772', '2016-03-16 00:43:49', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1381', '922548033537', '2016-03-16 16:08:49', '新加坡Singapore', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1382', '132560077048', '2016-03-17 02:15:26', '东莞-香港', '已装港车，准备下一站运转');
INSERT INTO `jefsky_wuliu` VALUES ('1383', '132560077048', '2016-03-17 05:40:06', '东莞-香港', '离开东莞，运输中');
INSERT INTO `jefsky_wuliu` VALUES ('1627', '922531037922', '2016-03-22 12:31:21', 'HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1678', '920295102346', '2016-03-24 15:30:58', 'CARDINAL', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1611', '922533772608', '2016-03-22 16:07:02', 'GERMANTOWN', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1610', '922533772608', '2016-03-22 08:31:39', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1692', '922516131388', '2016-03-24 15:48:26', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1659', '920295102346', '2016-03-23 08:27:23', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1657', '922531037922', '2016-03-24 11:10:38', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1658', '922252023056', '2016-03-24 02:50:43', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1613', '922533772626', '2016-03-22 16:10:19', 'GERMANTOWN', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1612', '922533772626', '2016-03-22 08:31:09', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1676', '920295102346', '2016-03-24 02:37:33', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1677', '920295102346', '2016-03-24 09:39:07', 'RICHMOND, VA - USA', '快件已经到达派送作业地点 RICHMOND, VA - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1675', '922531037922', '2016-03-24 04:07:02', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1674', '922531037922', '2016-03-24 04:10:44', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1614', '922531038104', '2016-03-22 11:08:41', 'GAITHERSBURG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1615', '922533772713', '2016-03-22 15:59:44', 'GERMANTOWN', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1747', '922553846036', '2016-03-21 10:59:34', 'Singapore', '快件已完成清关手续并从海关放行 Singapore');
INSERT INTO `jefsky_wuliu` VALUES ('1617', '921845523499', '2016-03-21 18:12:45', 'CORAL GABLES', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1618', '921347592744', '2016-03-23 03:12:28', 'DONGGUAN', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1619', '921347592744', '2016-03-23 09:14:42', 'HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('1620', '922517017333', '2016-03-22 12:32:05', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1621', '922252023047', '2016-03-22 12:32:26', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1622', '921845464004', '2016-03-22 12:32:17', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1623', '922533657420', '2016-03-22 12:31:31', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1624', '922252023074', '2016-03-22 12:22:32', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1625', '922531037807', '2016-03-22 12:32:26', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1626', '921845463992', '2016-03-22 23:01:07', 'GUANG ZHOU', '快件到达中转中心 GUANG ZHOU-GUANG ZHOU');
INSERT INTO `jefsky_wuliu` VALUES ('1673', '922531037807', '2016-03-24 04:07:24', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1672', '922252023074', '2016-03-24 04:23:05', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1671', '919490789874', '2016-03-24 04:14:33', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1656', '922531037807', '2016-03-24 11:02:51', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1655', '922252023074', '2016-03-23 23:54:33', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1654', '919490789874', '2016-03-24 00:00:08', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1653', '922533657420', '2016-03-24 00:16:03', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1651', '922252023047', '2016-03-24 00:29:45', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1652', '921845464004', '2016-03-24 00:21:45', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1650', '922517017333', '2016-03-23 23:57:21', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1648', '922531038131', '2016-03-23 09:14:39', 'RICHMOND, VA - USA', '快件已经到达派送作业地点 RICHMOND - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1649', '922531038131', '2016-03-23 12:27:45', 'ETTRICK', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1628', '922252023056', '2016-03-22 12:33:23', 'HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1629', '920295102346', '2016-03-22 18:37:15', 'HONG KONG ', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1630', '920295102346', '2016-03-23 00:08:22', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1631', '922251969629', '2016-03-21 23:46:57', 'GUANG ZHOU', '快件到达中转中心 GUANG ZHOU-GUANG ZHOU');
INSERT INTO `jefsky_wuliu` VALUES ('1632', '921845463965', '2016-03-22 04:17:26', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1633', '921845463965', '2016-03-22 10:38:58', 'NEW YORK CITY GATEWAY, NY - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1634', '921845463965', '2016-03-22 21:34:40', 'NEW YORK CITY GATEWAY, NY - USA', '快件已完成清关手续并从海关放行 NEW YORK CITY GATEWAY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1635', '922533772495', '2016-03-21 23:46:43', 'GUANG ZHOU', '快件到达中转中心 GUANG ZHOU-GUANG ZHOU');
INSERT INTO `jefsky_wuliu` VALUES ('1636', '922251968688', '2016-03-21 23:46:31', 'GUANG ZHOU', '快件到达中转中心 GUANG ZHOU-GUANG ZHOU');
INSERT INTO `jefsky_wuliu` VALUES ('1637', '921845463929', '2016-03-21 23:46:35', 'GUANG ZHOU', '快件到达中转中心 GUANG ZHOU-GUANG ZHOU');
INSERT INTO `jefsky_wuliu` VALUES ('1638', '921845523532', '2016-03-23 00:34:06', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1639', '921845523532', '2016-03-23 09:16:08', 'RICHMOND, VA - USA', '快件已经到达派送作业地点 RICHMOND - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1640', '921845523532', '2016-03-23 12:28:44', 'ETTRICK', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1641', '662741700404', '2016-03-22 18:09:30', 'SANTA CLARA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1642', '922531037870', '2016-03-23 09:03:27', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1695', '662742686611', '2016-03-24 11:14:48', 'HONG KONG - HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('1644', '922533772653', '2016-03-23 00:27:43', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1645', '922533772653', '2016-03-23 09:04:30', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1646', '922533772653', '2016-03-23 16:26:36', 'GAITHERSBURG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1647', '922531038131', '2016-03-23 00:35:52', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1643', '922531037870', '2016-03-23 18:24:01', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '待确认递送地址Waiting for confirmation of delivery address');
INSERT INTO `jefsky_wuliu` VALUES ('1660', '922246037089', '2016-03-23 14:20:25', 'LYON - FRANCE', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1661', '921845463965', '2016-03-23 15:22:52', 'BROOKLYN', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1670', '922533657420', '2016-03-24 04:10:21', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1668', '922252023047', '2016-03-24 04:06:57', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1669', '921845464004', '2016-03-24 04:12:33', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1691', '922533919509', '2016-03-24 15:12:16', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1690', '922533919563', '2016-03-24 15:06:49', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1697', '921845464165', '2016-03-25 10:19:14', 'HONG KONG - HONG KONG', '快件到达转运中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1662', '922533772495', '2016-03-23 15:47:25', 'Australia', '到达澳大利亚Arriving in Australia');
INSERT INTO `jefsky_wuliu` VALUES ('1852', '664194992160', '2016-03-24 07:06:44', '新加坡Singapore', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1851', '664194992160', '2016-03-23 23:41:12', '深圳shenzhen', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('1667', '922517017333', '2016-03-24 04:12:23', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1696', '921845464165', '2016-03-24 11:16:56', 'GUANG ZHOU', '快件到达中转中心 GUANG ZHOU-GUANG ZHOU');
INSERT INTO `jefsky_wuliu` VALUES ('1663', '922251968688', '2016-03-23 07:40:28', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1679', '922251969629', '2016-03-24 10:26:02', 'USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1680', '902107379646', '2016-03-25 02:54:33', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1681', '919485782179', '2016-03-24 15:06:29', 'HONG KONG - HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('1682', '662743480763', '2016-03-24 15:04:46', 'HONG KONG - HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('1683', '922533919281', '2016-03-25 07:36:47', 'HONG KONG - HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('1684', '922252022989', '2016-03-24 15:06:43', 'HONG KONG - HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('1685', '922533732089', '2016-03-24 15:05:57', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1686', '921845426756', '2016-03-24 15:08:39', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1687', '921845426756', '2016-03-24 15:08:39', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1688', '921845426792', '2016-03-24 15:05:24', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1689', '922252023038', '2016-03-24 15:03:50', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1289', '5262767325', '2016-03-09 20:51:34', '阿联酋 UAE', '已派送并签收 Have delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('1732', '922252023074', '2016-03-25 08:32:04', 'ROCHESTER - MONROE, NY - USA', '快件已经到达派送作业地点 ROCHESTER - MONROE, NY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1702', '921845426756', '2016-03-26 03:56:55', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1701', '921845426792', '2016-03-26 04:33:34', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1700', '922252023038', '2016-03-26 03:57:34', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1699', '922533919563', '2016-03-25 19:48:20', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1850', '664194992160', '2016-03-23 15:16:04', '深圳shenzhen', '已入机场仓We have the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('1706', '662743480763', '2016-03-26 03:55:38', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1704', '922252022989', '2016-03-25 20:18:53', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1705', '922533919281', '2016-03-25 19:48:33', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1703', '922533732089', '2016-03-26 00:00:44', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1849', '664194992160', '2016-03-23 11:37:04', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('1715', '902107379646', '2016-03-26 08:28:06', '日本 Japan', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1714', '922516131388', '2016-03-25 20:20:39', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1713', '922533919509', '2016-03-25 11:27:54', 'ROCKVILLE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1712', '922533919509', '2016-03-25 08:07:17', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1513', '922530843250', '2016-03-20 02:19:00', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1511', '922530843250', '2016-03-19 14:16:24', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1512', '922530843250', '2016-03-19 10:55:22', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1711', '922533919509', '2016-03-25 03:57:19', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1710', '922533919509', '2016-03-24 14:07:25', 'HONG KONG - HONG KONG', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1709', '922533919509', '2016-03-24 19:55:53', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1707', '919485782179', '2016-03-26 03:54:30', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1708', '922533772326', '2016-03-25 09:52:15', '日本 Japan', '快件已完成清关手续并从海关放行 CINCINNATI HUB - Japan');
INSERT INTO `jefsky_wuliu` VALUES ('1731', '922252023074', '2016-03-25 01:15:05', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1721', '922252023047', '2016-03-25 15:38:27', 'DREW', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1722', '921845464004', '2016-03-25 05:06:30', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1720', '922252023047', '2016-03-25 09:31:16', 'MEMPHIS, TN - USA', '快件已经到达派送作业地点 MEMPHIS - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1719', '922252023047', '2016-03-25 00:52:43', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1510', '132580861004', '2016-03-21 12:11:57', '新加坡Singapore', '快件已经到达派送作业地点Shipment has arrived at the delivery job site');
INSERT INTO `jefsky_wuliu` VALUES ('1509', '132580861004', '2016-03-21 07:11:27', '新加坡Singapore', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1508', '132580861004', '2016-03-19 16:09:25', '新加坡Singapore', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1507', '922533947164', '2016-03-20 09:01:12', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1506', '922533947164', '2016-03-19 10:05:27', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1505', '922533947164', '2016-03-19 12:32:46', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1718', '922517017333', '2016-03-26 16:25:19', 'ATLANTA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1717', '922517017333', '2016-03-25 03:25:34', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1504', '922530843065', '2016-03-20 09:16:09', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1503', '922530843065', '2016-03-19 10:19:14', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1502', '922530843065', '2016-03-19 16:33:48', 'HONG KONG - HONG KONG', '正在（已经）安排下一站的转运 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1730', '919490789874', '2016-03-25 15:05:37', 'DFW AIRPORT, TX - USA', '待确认递送地址Waiting for confirmation of delivery address');
INSERT INTO `jefsky_wuliu` VALUES ('1288', '921849571819', '2016-03-09 13:23:32', '香港Hongkong', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1287', '132602047355', '2016-03-08 10:31:58', '越南Vietnam', '客户要求自行正式清关The customer request to formal customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1286', '132171660759', '2016-03-09 09:31:07', '深圳机舱Shenzhen machine warehouse', '申报出口中Declaration for export in');
INSERT INTO `jefsky_wuliu` VALUES ('1501', '921845523514', '2016-03-20 14:30:36', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1284', '921849571819', '2016-03-09 09:03:06', '香港Hongkong', '通关到港');
INSERT INTO `jefsky_wuliu` VALUES ('1285', '132171660759', '2016-03-08 20:43:02', '深圳机仓', 'Shenzhen machine warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('1276', '664214063419', '2016-03-07 11:23:27', '新加坡Singapore', '已派送并签收: ABDULLAH');
INSERT INTO `jefsky_wuliu` VALUES ('1271', '664214063419', '2016-03-07 09:29:27', '新加坡 Singapore', '外出派送 Send out');
INSERT INTO `jefsky_wuliu` VALUES ('1273', '132602047355', '2016-03-04 24:51:54', '深圳shenzhen--越南Vietnam', '离开深圳，运转中Leave shenzhen, in operation');
INSERT INTO `jefsky_wuliu` VALUES ('1274', '132602047355', '2016-03-06 10:03:50', '越南Vietnam', '等待清关Wait for customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1275', '132602047355', '2016-03-07 10:22:33', '越南Vietnam', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1724', '921845464004', '2016-03-25 11:42:29', 'ROCKVILLE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1723', '921845464004', '2016-03-25 08:10:58', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1270', '5262767325', '2016-03-07 09:50:26', '阿联酋 UAE', '货物达到派送作业点 The goods reach the delivery point of operation');
INSERT INTO `jefsky_wuliu` VALUES ('1269', '5262767325', '2016-03-05 09:06:05', '阿联酋 UAE', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1265', '132602047355', '2016-03-04 08:17:54', '深圳shenzhen', '资料不全，等待确认');
INSERT INTO `jefsky_wuliu` VALUES ('1266', '132602047355', '2016-03-04 11:38:55', '深圳shenzhen', '申报出口中');
INSERT INTO `jefsky_wuliu` VALUES ('1267', '664214063419', '2016-03-05 05:04:27', '新加坡Singapore', '完成清关To complete the customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1268', '664214063419', '2016-03-05 10:24:18', '新加坡Singapore', '货物到派送作业点The goods to send operating point');
INSERT INTO `jefsky_wuliu` VALUES ('1283', '921849571819', '2016-03-09 07:51:34', '深圳shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1282', '921849571819', '2016-03-09 05:50:47', '东莞-香港', '离开东莞，运输中');
INSERT INTO `jefsky_wuliu` VALUES ('1297', '5262735447', '2016-03-10 09:28:29', '马来西亚 Malaysia', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1280', '921849571819', '2016-03-08 23:48:17', '东莞-香港', '已装港车，准备下一站运转');
INSERT INTO `jefsky_wuliu` VALUES ('1296', '5262735447', '2016-03-09 12:27:22', '广州 Guangzhou', '海关出口放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1293', '5262735447', '2016-03-07 11:23:37', '东莞 Dongguan', '快件发往广州中转中心 Express sent to Guangzhou transit center');
INSERT INTO `jefsky_wuliu` VALUES ('1294', '5262735447', '2016-03-07 19:25:38', '广州 Guangzhou', '快件到达中转中心  Have delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('1295', '5262735447', '2016-03-08 11:26:30', '广州 Guangzhou', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1728', '919490789874', '2016-03-25 01:20:09', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1727', '922533657420', '2016-03-25 12:13:04', 'SOUTH OZONE PARK', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1725', '922533657420', '2016-03-25 01:49:21', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1726', '922533657420', '2016-03-25 10:26:17', 'WOODSIDE, NY - USA', '快件已经到达派送作业地点WOODSIDE, NY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1264', '664214063419', '2016-03-04 10:34:55', '新加坡Singapore', '清关流程');
INSERT INTO `jefsky_wuliu` VALUES ('1262', '5262767325', '2016-03-04 08:29:08', '香港 Hongkong', '货物中转中 The goods in transit');
INSERT INTO `jefsky_wuliu` VALUES ('1263', '664214063419', '2016-03-03 23:32:20', '深圳shenzhen--新加坡Singapore', '离开深圳，运转中');
INSERT INTO `jefsky_wuliu` VALUES ('1261', '5262767325', '2016-03-03 18:04:34', '深圳  Shenzhen', '货物已经进入机场仓 The goods have entered the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('1258', '922528976133', '2016-03-03 15:03:23', '香港Hongkong', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1259', '664214063419', '2016-03-03 14:31:35', '深圳shenzhen', '申报成功，等待下一站运转');
INSERT INTO `jefsky_wuliu` VALUES ('1260', '922528976133', '2016-03-03 15:48:30', '香港Hongkong', '已签收');
INSERT INTO `jefsky_wuliu` VALUES ('1733', '922252023074', '2016-03-25 13:51:15', 'UTICA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1734', '922531037807', '2016-03-25 00:42:15', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1735', '922531037807', '2016-03-25 08:18:49', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1736', '922531037807', '2016-03-25 11:34:41', 'ROCKVILLE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1737', '922531037922', '2016-03-25 00:47:57', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1738', '922531037922', '2016-03-25 08:20:26', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1739', '922531037922', '2016-03-25 13:32:59', 'GAITHERSBURG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1740', '922252023056', '2016-03-24 04:10:13', 'HONG KONG - HONG KONG', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1741', '922252023056', '2016-03-25 00:42:19', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1742', '922252023056', '2016-03-25 08:18:48', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1743', '922252023056', '2016-03-25 11:42:20', 'ROCKVILLE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1744', '922251968688', '2016-03-25 08:21:04', 'USA', '快件已经到达派送作业地点 USA');
INSERT INTO `jefsky_wuliu` VALUES ('1745', '922531037870', '2016-03-25 13:36:58', 'GAITHERSBURG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1746', '922553846036', '2016-03-21 11:56:22', '新加坡', 'Singapore');
INSERT INTO `jefsky_wuliu` VALUES ('1848', '664194992160', '2016-03-23 08:35:33', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1755', '922251969629', '2016-03-26 11:21:49', 'USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1756', '922533919563', '2016-03-26 07:23:48', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1757', '922533919563', '2016-03-27 08:57:30', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1758', '922252023038', '2016-03-26 14:06:24', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1759', '922252023038', '2016-03-27 15:02:30', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1760', '921845426792', '2016-03-26 14:11:09', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1761', '921845426792', '2016-03-27 12:16:01', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1762', '921845426756', '2016-03-26 13:51:00', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1763', '921845426756', '2016-03-27 16:56:38', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1764', '922533732089', '2016-03-26 15:07:34', 'LOS ANGELES GATEWAY, CA - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1765', '922533732089', '2016-03-27 17:08:39', 'LOS ANGELES GATEWAY - USA', '快件已完成清关手续并从海关放行 LOS ANGELES GATEWAY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1766', '922252022989', '2016-03-26 11:47:36', 'NEW YORK CITY GATEWAY, NY - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1767', '922252022989', '2016-03-26 23:51:42', 'NEW YORK CITY GATEWAY, NY - USA', '快件已完成清关手续并从海关放行 NEW YORK CITY GATEWAY, NY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1768', '922533919281', '2016-03-26 07:53:07', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1769', '922533919281', '2016-03-27 09:04:49', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1770', '662743480763', '2016-03-26 13:52:44', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1771', '132573155741', '2016-03-26 13:55:35', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1772', '662743480763', '2016-03-27 15:56:39', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1773', '919485782179', '2016-03-26 14:21:46', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1774', '919485782179', '2016-03-27 13:33:20', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1775', '132573155741', '2016-03-27 10:56:27', '深圳shenzhen', '已入盐田监管仓It has the Yantian regulatory positions');
INSERT INTO `jefsky_wuliu` VALUES ('1776', '922533772326', '2016-03-26 14:17:01', '日本 Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1777', '132573155741', '2016-03-28 08:38:57', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('1778', '664160298431', '2016-03-28 09:37:40', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('1779', '132573155732', '2016-03-27 15:08:10', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1780', '132573155732', '2016-03-27 20:11:52', '深圳shenzhen', '已入机场仓We have the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('1781', '922516131388', '2016-03-26 07:34:09', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1782', '132573155732', '2016-03-28 08:33:08', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('1783', '902107379646', '2016-03-26 11:15:59', 'OSAKA - JAPAN', '快件已完成清关手续并从海关放行 OSAKA - JAPAN');
INSERT INTO `jefsky_wuliu` VALUES ('1784', '922535311906', '2016-03-24 10:15:42', '泰国Thailand', '海关查验customs inspection');
INSERT INTO `jefsky_wuliu` VALUES ('1785', '902107379646', '2016-03-28 10:07:37', 'KANSAI - JAPAN', '快件已经到达派送作业地点 KANSAI - JAPAN');
INSERT INTO `jefsky_wuliu` VALUES ('1786', '922535311906', '2016-03-25 11:16:53', '泰国Thailand', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('1787', '922535311906', '2016-03-25 14:17:35', '泰国Thailand', '快件已经到达派送作业地点 Express delivery has arrived at the site of operation');
INSERT INTO `jefsky_wuliu` VALUES ('1788', '922535311906', '2016-03-25 15:30:39', '泰国Thailand', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1789', '132428396036', '2016-03-25 10:19:37', '', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1790', '922535311906', '2016-03-25 16:39:18', '泰国Thailand', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1791', '132428396036', '2016-03-27 20:38:11', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1792', '920295102364', '2016-03-25 10:23:35', '', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1793', '920295102364', '2016-03-28 00:11:39', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1794', '920295102373', '2016-03-25 10:39:50', '', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1795', '920295102373', '2016-03-27 21:10:54', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1796', '922252023001', '2016-03-25 10:42:01', '', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1797', '922252023001', '2016-03-27 21:51:29', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1801', '919490789944', '2016-03-28 08:52:39', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('1800', '919490789944', '2016-03-27 15:51:58', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1802', '922251968688', '2016-03-25 09:41:40', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('1803', '921845464147', '2016-03-26 16:31:31', '', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1804', '922251968633', '2016-03-26 16:38:52', '', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1805', '921846191952', '2016-03-26 16:32:11', '', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1806', '921845426774', '2016-03-26 16:31:47', '', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1807', '622743480445', '2016-03-26 16:31:14', '', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1808', '471470685344', '2016-03-25 08:36:29', 'HONG KONG - HONG KONG', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1809', '922533772140', '2016-03-26 23:13:35', '', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('1810', '132603536064', '2016-03-25 13:42:39', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1811', '132603536064', '2016-03-26 13:43:30', '香港Hongkong', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('1812', '921845426862', '2016-03-26 19:45:50', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1813', '132603536064', '2016-03-27 16:44:59', '香港Hongkong', '航班延误');
INSERT INTO `jefsky_wuliu` VALUES ('1814', '132603536064', '2016-03-28 10:45:42', '香港Hongkong', '等待航班起飞，准备下一站运转Waiting for departure, get ready for the next station');
INSERT INTO `jefsky_wuliu` VALUES ('1815', '921845426862', '2016-03-26 20:40:59', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1816', '921845426862', '2016-03-27 12:53:57', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1817', '921845427124', '2016-03-28 00:19:36', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1818', '132428396045', '2016-03-28 00:17:41', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1819', '920295102294', '2016-03-28 00:18:45', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1820', '922252022970', '2016-03-27 23:54:05', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1821', '922533772025', '2016-03-26 20:17:21', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1822', '922533772025', '2016-03-27 00:59:19', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1823', '922533772025', '2016-03-27 13:57:29', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1824', '922533772104', '2016-03-26 17:50:05', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1825', '922533772104', '2016-03-26 21:52:37', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1826', '922533772104', '2016-03-27 13:52:19', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1827', '922533772098', '2016-03-26 17:51:07', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1828', '922533772098', '2016-03-26 21:55:32', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1829', '922533772098', '2016-03-27 13:59:01', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1830', '922533772131', '2016-03-26 18:31:18', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1831', '922533772131', '2016-03-27 01:12:53', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1832', '922533772131', '2016-03-27 14:02:34', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1833', '922533772007', '2016-03-26 17:51:31', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1834', '922533772007', '2016-03-26 21:49:16', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1835', '922533772007', '2016-03-27 13:57:52', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1836', '922533772052', '2016-03-26 17:50:54', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1837', '922533772052', '2016-03-26 21:47:31', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1838', '922533772052', '2016-03-27 13:58:06', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1839', '922533772061', '2016-03-26 17:51:05', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1840', '922533772061', '2016-03-26 21:57:44', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1841', '922533772061', '2016-03-27 14:00:19', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1842', '921845464156', '2016-03-27 19:37:08', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1844', '921845464068', '2016-03-27 21:07:10', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1845', '922520491635', '2016-03-27 00:06:01', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1846', '922251966864', '2016-03-28 20:48:36', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1847', '922555054131', '2016-03-24 16:56:19', '', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1854', '664194992160', '2016-03-24 15:01:42', 'SINGAPORE - SINGAPORE', '第一次派送不成功（原因：客户不在派送地）The first delivery is unsuccessful (Reason: The client is not delivered to)');
INSERT INTO `jefsky_wuliu` VALUES ('1855', '664194992160', '2016-03-25 09:04:52', 'SINGAPORE - SINGAPORE', '第二次派送中The second delivery in');
INSERT INTO `jefsky_wuliu` VALUES ('1856', '664194992160', '2016-03-25 12:06:10', 'SINGAPORE - SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1857', '132573155741', '2016-03-28 15:05:54', '深圳shenzhen', '盐田监管仓YanTian CFS');
INSERT INTO `jefsky_wuliu` VALUES ('1858', '132573155741', '2016-03-29 08:42:37', '深圳shenzhen', '正在安排下一站转运arrangement transport');
INSERT INTO `jefsky_wuliu` VALUES ('1859', '919490789944', '2016-03-28 15:07:29', '深圳shenzhen', '离开深圳Leave for ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('1860', '922533772495', '2016-03-24 16:48:29', '澳大利亚Australia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1861', '922516131388', '2016-03-28 07:02:06', 'BRITISH COLUMBIA, BC - CANADA', '快件已完成清关手续并从海关放行 BRITISH COLUMBIA - CANADA');
INSERT INTO `jefsky_wuliu` VALUES ('1862', '922516131388', '2016-03-28 16:49:09', 'BRITISH COLUMBIA, BC - CANADA', '待确认递送地址Waiting for confirmation of delivery address');
INSERT INTO `jefsky_wuliu` VALUES ('1863', '922533919272', '2016-03-28 09:25:39', '美国USA', '快件已经到达派送作业地点 USA');
INSERT INTO `jefsky_wuliu` VALUES ('1864', '922533919272', '2016-03-28 13:54:52', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1865', '919485782179', '2016-03-28 07:24:12', 'GREENVILLE, SC - USA', '快件已经到达派送作业地点 GREENVILLE, SC - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1866', '919485782179', '2016-03-28 15:38:54', 'GREENVILLE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1867', '662743480763', '2016-03-28 06:46:06', 'MIAMI, FL - USA', '快件已经到达派送作业地点 MIAMI - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1868', '662743480763', '2016-03-28 12:40:18', 'MIAMI', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1869', '922533919281', '2016-03-28 05:53:38', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1870', '922533919281', '2016-03-28 13:02:18', 'GAITHERSBURG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1871', '922252022989', '2016-03-28 06:58:18', 'WOODSIDE, NY - USA', '快件已经到达派送作业地点 WOODSIDE, NY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1872', '922252022989', '2016-03-28 12:15:54', 'JACKSON HEIGHTS', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1873', '921845426756', '2016-03-28 07:11:57', 'FRANKLIN PARK, IL - USA', '快件已经到达派送作业地点 FRANKLIN PARK, IL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1874', '921845426756', '2016-03-28 12:28:37', 'CHICAGO', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1875', '921845426792', '2016-03-28 07:26:29', 'GREENVILLE, SC - USA', '快件已经到达派送作业地点 GREENVILLE, SC - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1876', '921845426792', '2016-03-28 15:52:06', 'GREENWOOD', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1877', '922252023038', '2016-03-28 04:52:17', 'GREENWOOD', '快件已经到达派送作业地点 GREENWOOD');
INSERT INTO `jefsky_wuliu` VALUES ('1878', '922533919563', '2016-03-28 05:46:44', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1879', '922533919563', '2016-03-28 11:48:20', 'ROCKVILLE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1880', '622743480445', '2016-03-28 21:25:21', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1881', '622743480445', '2016-03-28 12:24:36', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1882', '921845426774', '2016-03-28 18:06:49', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1883', '921845426774', '2016-03-28 12:43:23', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1884', '922533772140', '2016-03-28 12:46:19', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('1885', '921846191952', '2016-03-28 18:03:57', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1886', '921846191952', '2016-03-29 03:12:31', '新加坡SINGAPORE - SINGAPORE', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1887', '923199307675', '2016-03-29 02:32:37', '东莞dongguan', '已装港车，准备下一站运转');
INSERT INTO `jefsky_wuliu` VALUES ('1888', '921846191952', '2016-03-29 07:56:42', 'SINGAPORE - SINGAPORE', '快件已完成清关手续并从海关放行 SINGAPORE - SINGAPORE');
INSERT INTO `jefsky_wuliu` VALUES ('1889', '923199307675', '2016-03-29 05:40:27', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1890', '921846191952', '2016-03-29 08:30:28', 'SINGAPORE - SINGAPORE', '快件已经到达派送作业地点 SINGAPORE - SINGAPORE');
INSERT INTO `jefsky_wuliu` VALUES ('1891', '923199307675', '2016-03-29 08:18:10', '深圳shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1892', '921846191952', '2016-03-29 09:57:05', 'SINGAPORE - SINGAPORE', '待确认递送地址Waiting for confirmation of delivery address');
INSERT INTO `jefsky_wuliu` VALUES ('1893', '921845426862', '2016-03-28 06:18:30', 'SAN ANTONIO, TX - USA', '快件已经到达派送作业地点SAN ANTONIO, TX - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1894', '921845426862', '2016-03-28 13:13:05', 'SAN ANTONIO, TX - USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1895', '923199307675', '2016-03-29 09:02:39', '香港Hongkong', '通关到港Clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('1896', '921845427124', '2016-03-28 10:16:06', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1897', '132501272525', '2016-03-29 02:39:14', '东莞dongguan', '已装港车，准备下一站运转');
INSERT INTO `jefsky_wuliu` VALUES ('1898', '132428396045', '2016-03-28 10:12:57', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1899', '132501272525', '2016-03-29 05:04:41', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1900', '132501272525', '2016-03-29 08:05:03', '深圳shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('1901', '920295102294', '2016-03-28 10:17:45', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1902', '132501272525', '2016-03-29 09:05:29', '香港Hongkong', '通关到港Clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('1903', '922252022970', '2016-03-28 10:14:47', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1904', '922533772025', '2016-03-28 05:55:11', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1905', '922533772025', '2016-03-28 11:52:03', 'ROCKVILLE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1906', '922533772104', '2016-03-28 05:49:09', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1907', '922533772104', '2016-03-28 13:03:44', 'GAITHERSBURG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1908', '922533772098', '2016-03-28 05:49:01', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1909', '922533772098', '2016-03-28 15:25:35', 'SILVER SPRING', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1910', '922533772131', '2016-03-28 05:43:42', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1911', '922533772131', '2016-03-28 11:52:06', 'ROCKVILLE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1912', '922533772007', '2016-03-28 05:45:24', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1913', '922533772007', '2016-03-28 11:47:51', 'ROCKVILLE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1914', '922533772052', '2016-03-28 05:45:04', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1915', '922533772052', '2016-03-28 13:21:30', 'GAITHERSBURG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1916', '922533772061', '2016-03-28 05:47:15', 'WASHINGTON - RONALD REAGAN NATIONAL, DC - USA', '快件已经到达派送作业地点 WASHINGTON - RONALD REAGAN NATIONAL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1917', '922533772061', '2016-03-28 10:50:51', 'NORTH POTOMAC', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1918', '922251968633', '2016-03-28 18:26:43', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1919', '922251968633', '2016-03-28 12:29:13', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1920', '921845464156', '2016-03-28 16:32:21', 'LOS ANGELES GATEWAY, CA - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1921', '921845464147', '2016-03-28 18:29:32', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1922', '921845464147', '2016-03-28 12:18:58', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1923', '921845464068', '2016-03-28 16:31:24', 'LOS ANGELES GATEWAY, CA - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1924', '920295102364', '2016-03-28 09:33:47', 'LOS ANGELES GATEWAY, CA - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1925', '920295102373', '2016-03-28 15:47:29', 'LOS ANGELES GATEWAY, CA - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1926', '922252023001', '2016-03-28 15:35:09', 'LOS ANGELES GATEWAY, CA - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1927', '132428396036', '2016-03-28 10:11:17', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1928', '132573155732', '2016-03-29 08:00:42', '中国 CHINA', '航班延误Flight delay');
INSERT INTO `jefsky_wuliu` VALUES ('1929', '664160298431', '2016-03-29 10:05:44', '新加坡SINGAPORE', '清关流程Customs clearance technological process');
INSERT INTO `jefsky_wuliu` VALUES ('1930', '922251966864', '2016-03-29 12:02:49', '香港Hongkong', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('1931', '919490789944', '2016-03-29 12:06:11', '香港Hongkong', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('1932', '664160298431', '2016-03-29 14:08:58', '新加坡Singapore', '等待收件人配合清关Waiting for clearance with the recipient');
INSERT INTO `jefsky_wuliu` VALUES ('1933', '132573155741', '2016-03-29 15:12:40', '深圳shenzhen', '离开深圳，运转中Leave shenzhen, in operation');
INSERT INTO `jefsky_wuliu` VALUES ('1934', '132573155732', '2016-03-29 23:24:42', '深圳shenzhen', '离开深圳，运转中Leave shenzhen, in operation');
INSERT INTO `jefsky_wuliu` VALUES ('1935', '132428396036', '2016-03-29 00:28:05', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1936', '132428396036', '2016-03-29 08:42:45', 'SMYRNA, GA - USA', '快件已经到达派送作业地点 SMYRNA - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1937', '132428396036', '2016-03-29 13:09:53', 'MARIETTA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1938', '922252023001', '2016-03-29 05:09:43', 'LOS ANGELES GATEWAY, CA - USA', '快件已完成清关手续并从海关放行 LOS ANGELES GATEWAY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1939', '922252023001', '2016-03-29 08:12:29', 'LOS ANGELES, CA - USA', '快件已经到达派送作业地点 LOS ANGELES - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1940', '922252023001', '2016-03-29 11:49:26', 'LOS ANGELES', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1941', '920295102373', '2016-03-29 03:51:18', 'LOS ANGELES GATEWAY, CA - USA', '快件已完成清关手续并从海关放行 LOS ANGELES GATEWAY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1942', '920295102373', '2016-03-29 09:21:10', 'SACRAMENTO - MATHER, CA - USA', '快件已经到达派送作业地点 SACRAMENTO - MATHER, CA - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1943', '920295102373', '2016-03-29 16:57:54', 'FAIRFIELD', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1944', '920295102364', '2016-03-28 22:43:24', 'LOS ANGELES GATEWAY, CA - USA', '快件已完成清关手续并从海关放行 LOS ANGELES GATEWAY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1945', '920295102364', '2016-03-29 08:28:00', 'PHOENIX, AZ - USA', '快件已经到达派送作业地点 PHOENIX, AZ - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1946', '920295102364', '2016-03-29 13:04:03', 'GLENDALE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1947', '922520491635', '2016-03-27 20:26:24', 'LEIPZIG - GERMANY', '正在（已经）安排下一站的转运 LEIPZIG - GERMANY');
INSERT INTO `jefsky_wuliu` VALUES ('1948', '921845464068', '2016-03-29 03:56:18', 'LOS ANGELES GATEWAY, CA - USA', '快件已完成清关手续并从海关放行 LOS ANGELES GATEWAY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1949', '921845464068', '2016-03-29 09:56:15', 'BRITISH COLUMBIA, BC - CANADA', '快件已经到达派送作业地点 BRITISH COLUMBIA, BC - CANADA');
INSERT INTO `jefsky_wuliu` VALUES ('1950', '664177148980', '2016-03-27 18:35:26', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('1951', '921845464068', '2016-03-29 12:40:55', 'NEW WESTMINSTER', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1952', '664177148980', '2016-03-28 09:13:53', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('1953', '921845464147', '2016-03-29 04:49:05', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1954', '921845464147', '2016-03-29 07:06:58', 'ATLANTA, GA - USA', '快件已经到达派送作业地点 ATLANTA, GA - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1955', '664177148980', '2016-03-29 12:39:31', '深圳shenzhen', '离开深圳，运转中Leave shenzhen, in operation');
INSERT INTO `jefsky_wuliu` VALUES ('1956', '664177148980', '2016-03-29 16:40:51', '香港Hongkong', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('1957', '921845464147', '2016-03-29 18:20:41', 'ATLANTA, GA - USA', '由于收件人不在暂时无法派送 Because the recipient is not temporarily unable to delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1958', '664177148980', '2016-03-30 00:10:55', '香港Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('1959', '662742686611', '2016-03-29 16:44:33', 'HONG KONG - HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1960', '664177148980', '2016-03-29 15:44:04', 'LOS ANGELES GATEWAY, CA - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1961', '471470685344', '2016-03-30 09:00:32', 'HONG KONG - HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('1962', '921347592744', '2016-03-29 14:44:00', 'HONG KONG - HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1963', '921845464156', '2016-03-29 09:02:35', 'BRITISH COLUMBIA, BC - CANADA', '快件已完成清关手续并从海关放行 BRITISH COLUMBIA, BC - CANADA');
INSERT INTO `jefsky_wuliu` VALUES ('1964', '921845464156', '2016-03-29 12:43:08', 'NEW WESTMINSTER', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1965', '922251968633', '2016-03-29 04:50:25', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1966', '922251968633', '2016-03-29 07:10:20', 'ATLANTA, GA - USA', '快件已经到达派送作业地点 ATLANTA, GA - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1967', '922251968633', '2016-03-29 18:04:45', 'ATLANTA, GA - USA', '由于收件人不在暂时无法派送 Because the recipient is not temporarily unable to delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1968', '922252022970', '2016-03-29 04:32:03', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1969', '922252022970', '2016-03-29 12:41:56', 'BRONX', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1970', '920295102294', '2016-03-29 05:25:34', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1971', '920295102294', '2016-03-29 07:25:10', 'FRANKLIN PARK, IL - USA', '快件已经到达派送作业地点 FRANKLIN PARK, IL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1972', '920295102294', '2016-03-29 11:19:49', 'CHICAGO', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1973', '132428396045', '2016-03-29 00:58:43', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1974', '132428396045', '2016-03-29 08:57:20', 'JACKSONVILLE, FL - USA', '快件已经到达派送作业地点 JACKSONVILLE, FL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1975', '132428396045', '2016-03-29 11:35:18', 'JACKSONVILLE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1976', '921845427124', '2016-03-29 05:19:45', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1977', '921845427124', '2016-03-29 07:34:00', 'FRANKLIN PARK, IL - USA', '快件已经到达派送作业地点 FRANKLIN PARK, IL - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1978', '132501272525', '2016-03-30 09:40:51', 'HONG KONG - HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('1979', '921845427124', '2016-03-29 11:49:59', 'FRANKLIN PARK, IL - USA', '由于收件人不在暂时无法派送 Because the recipient is not temporarily unable to delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1980', '921846191952', '2016-03-29 12:28:34', 'SINGAPORE - SINGAPORE', '将根据与客户沟通的转运时间，另行安排派送According to the transit time to communicate with customers, arrange separate delivery');
INSERT INTO `jefsky_wuliu` VALUES ('1981', '922533772140', '2016-03-29 13:08:55', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('1982', '921845426774', '2016-03-29 03:15:18', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1983', '921845426774', '2016-03-29 12:19:04', 'MEMPHIS, TN - USA', '快件已经到达派送作业地点 MEMPHIS, TN - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1984', '662743480445', '2016-03-28 20:48:15', 'HONG KONG - HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('1985', '662743480445', '2016-03-28 12:27:45', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1986', '662743480445', '2016-03-29 04:57:36', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1987', '662743480445', '2016-03-29 07:44:07', 'HAZELWOOD, MO - USA', '快件已经到达派送作业地点 HAZELWOOD, MO - USA');
INSERT INTO `jefsky_wuliu` VALUES ('1988', '662743480445', '2016-03-29 11:44:42', 'CHESTERFIELD', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1989', '923199307675', '2016-03-29 14:44:05', '香港Hongkong', '派送延误');
INSERT INTO `jefsky_wuliu` VALUES ('1990', '923199307675', '2016-03-30 11:22:55', '香港Hongkong', '等待安排派送');
INSERT INTO `jefsky_wuliu` VALUES ('1991', '922252023038', '2016-03-29 14:30:25', 'RENO', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1992', '922251966864', '2016-03-30 11:56:37', '香港Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('1993', '921845464165', '2016-03-28 19:35:18', '加拿大Canada', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1994', '921845464165', '2016-03-28 20:59:12', '加拿大Canada', '快件已完成清关手续并从海关放行 Canada');
INSERT INTO `jefsky_wuliu` VALUES ('1995', '922533429034', '2016-03-30 08:37:47', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('1996', '902107379646', '2016-03-29 16:34:02', 'KOBE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('1997', '132573155732', '2016-03-30 07:07:26', '马来西亚 Malaysian ', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('1998', '132573155741', '2016-03-30 12:12:54', '胡志明Ho chi minh', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('1999', '471470685344', '2016-03-30 11:35:42', 'HONG KONG - HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2000', '922520410978', '2016-03-30 08:30:55', '深圳ShenZhen', '申报出口Declaration of export');
INSERT INTO `jefsky_wuliu` VALUES ('2196', '922516136404', '2016-04-01 14:34:04', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2002', '132501272525', '2016-03-30 11:44:48', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2003', '923199307675', '2016-03-30 13:45:38', '香港Hongkong', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('2004', '923199307675', '2016-03-30 15:51:13', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2005', '921845464174', '2016-03-29 09:11:50', '墨西哥Mexico', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('2006', '921845464174', '2016-03-30 09:57:07', '墨西哥Mexico', '海关出口放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2007', '921845464165', '2016-03-30 12:10:53', '加拿大Canada', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2008', '132573155741', '2016-03-30 17:51:30', '胡志明Ho chi minh', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2009', '922533732362', '2016-03-31 02:22:28', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('2010', '922533732362', '2016-03-31 08:35:01', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2011', '664177148980', '2016-03-30 03:05:07', 'LOS ANGELES GATEWAY, CA - USA', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2012', '664177148980', '2016-03-30 09:24:22', 'SACRAMENTO - MATHER, CA - USA', '快件已经到达派送作业地点 Express delivery has arrived at the site of operation');
INSERT INTO `jefsky_wuliu` VALUES ('2013', '664177148980', '2016-03-30 09:51:47', 'SACRAMENTO - MATHER, CA - USA', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('2014', '664177148980', '2016-03-30 14:07:40', 'EL DORADO HILLS', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2015', '923195925102', '2016-03-31 04:10:26', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('2016', '923195925102', '2016-03-31 08:37:07', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2017', '132603536064', '2016-03-31 08:18:31', 'TOKYO - JAPAN', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2018', '132603536064', '2016-03-31 10:08:22', 'TOKYO - JAPAN', '快件已完成清关手续并从海关放行 TOKYO - JAPAN');
INSERT INTO `jefsky_wuliu` VALUES ('2019', '919485782212', '2016-03-28 03:26:38', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('2020', '919485782212', '2016-03-28 08:27:24', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2021', '922520491635', '2016-03-30 07:24:45', 'LILLE - FRANCE', '到达作业地点 Arrive at work place');
INSERT INTO `jefsky_wuliu` VALUES ('2022', '922520491635', '2016-03-30 10:43:37', 'HEM', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2023', '919485782212', '2016-03-28 17:28:43', '深圳shenzhen', '离开转运地 -深圳Leave a transit - Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('2024', '921845464147', '2016-03-30 17:54:27', 'MILLBROOK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2025', '919485782212', '2016-03-29 10:30:24', '香港Hongkong', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('2026', '922251968633', '2016-03-30 17:35:55', 'MILLBROOK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2027', '919485782212', '2016-03-30 01:34:12', '香港Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2028', '919485782212', '2016-03-30 07:17:01', 'SACRAMENTO - MATHER, CA - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2029', '921845427124', '2016-03-30 16:53:56', 'CHICAGO', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2030', '921845426774', '2016-03-30 11:17:53', 'GREENVILLE', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2031', '922533975180', '2016-03-27 10:40:08', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('2032', '922533975180', '2016-03-28 08:41:51', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2033', '922533975180', '2016-03-28 14:42:27', '深圳shenzhen', '离开深圳，运转中Leave shenzhen, in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2034', '922533975180', '2016-03-29 10:43:28', '香港Hongkong', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('2035', '922533975180', '2016-03-29 21:46:27', '香港Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2036', '922533975180', '2016-03-30 02:47:18', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2037', '919490789926', '2016-03-27 16:49:57', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('2038', '919490789926', '2016-03-28 08:50:44', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2039', '919490789926', '2016-03-28 16:51:09', '深圳shenzhen', '离开深圳，运转中Leave shenzhen, in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2040', '919490789926', '2016-03-29 10:51:44', '香港Hongkong', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('2041', '919490789926', '2016-03-29 22:52:21', '香港Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2042', '919490789926', '2016-03-30 05:53:09', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2248', '923195923855', '2016-04-03 17:54:27', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2247', '923195923855', '2016-04-02 01:43:56', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2045', '921845427115', '2016-03-27 16:09:35', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('2046', '921845427115', '2016-03-28 08:31:31', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2047', '921845427115', '2016-03-28 16:13:43', '深圳shenzhen', '离开深圳，运转中Leave shenzhen, in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2048', '921845427115', '2016-03-29 11:15:00', '香港Hongkong', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('2049', '921845427115', '2016-03-30 00:16:30', '香港Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2050', '662743480454', '2016-03-27 16:19:08', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('2051', '662743480454', '2016-03-28 08:33:37', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2052', '662743480454', '2016-03-28 16:20:05', '深圳shenzhen', '离开深圳，运转中Leave shenzhen, in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2053', '662743480454', '2016-03-29 11:20:36', '香港Hongkong', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('2054', '662743480454', '2016-03-30 00:21:13', '香港Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2195', '922516136404', '2016-03-31 17:32:57', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2057', '922520410978', '2016-03-31 09:27:29', '深圳  Shenzhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2058', '922533429034', '2016-03-31 09:30:40', '深圳  Shenzhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2059', '664179175547', '2016-03-31 08:33:02', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2060', '664179175547', '2016-03-31 14:26:51', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2061', '921845427115', '2016-03-30 07:58:08', '加拿大Canada', '快件已经到达派送作业地点 Canada');
INSERT INTO `jefsky_wuliu` VALUES ('2062', '921845427115', '2016-03-30 12:47:57', '加拿大Canada', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2063', '919490789944', '2016-03-30 00:55:14', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2064', '922533975180', '2016-03-31 06:57:04', '美国USA', '快件已完成清关手续并从海关放行 美国USA');
INSERT INTO `jefsky_wuliu` VALUES ('2065', '922533975180', '2016-03-31 15:58:11', '美国USA', '快件已经到达派送作业地点 USA');
INSERT INTO `jefsky_wuliu` VALUES ('2066', '919485782212', '2016-03-31 01:59:39', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('2067', '922251966864', '2016-03-31 11:04:22', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2068', '132603536064', '2016-03-31 12:34:41', 'NARITA - JAPAN', '快件已经到达派送作业地点 NARITA - JAPAN');
INSERT INTO `jefsky_wuliu` VALUES ('2069', '132603536064', '2016-03-31 14:23:13', 'NARITA - JAPAN', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2070', '921846191952', '2016-03-31 12:24:47', 'SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2071', '922533772140', '2016-03-31 11:45:19', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2072', '662743480454', '2016-03-31 13:46:16', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2073', '919490789944', '2016-03-31 15:07:01', 'CINCINNATI HUB, OH - USA', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2074', '919485782212', '2016-03-31 08:43:32', 'ATLANTA, GA - USA', '到达作业地点 Arrive at work place');
INSERT INTO `jefsky_wuliu` VALUES ('2075', '919485782212', '2016-03-31 19:32:26', 'ATLANTA', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2193', '922516136404', '2016-03-30 07:47:23', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2194', '922516136404', '2016-03-31 10:31:24', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2077', '922520410978', '2016-04-01 03:39:30', '新加坡 Singapore', '到达新加坡 Arrive  Singapore');
INSERT INTO `jefsky_wuliu` VALUES ('2246', '923195923855', '2016-04-01 10:20:08', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2079', '923195925102', '2016-04-01 10:21:25', '深圳  Shenzhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2080', '664179175547', '2016-03-31 20:30:02', '香港HONG KONG', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2081', '921845463992', '2016-03-23 14:25:44', '广州Guangzhou', '离开转运地 ，运输中Leave a transit, transportation');
INSERT INTO `jefsky_wuliu` VALUES ('2082', '921845463992', '2016-03-24 10:28:39', '香港Hongkong', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('2083', '921845463992', '2016-03-25 01:29:42', '香港Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2084', '921845463992', '2016-03-26 03:30:47', 'SACRAMENTO - MATHER, CA - USA', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('2085', '922516540852', '2016-04-01 08:43:30', '深圳  Shenzhen', '申报出口 declaring export');
INSERT INTO `jefsky_wuliu` VALUES ('2086', '922533432768', '2016-04-01 08:50:51', '深圳  Shenzhen', '申报出口 declaring export');
INSERT INTO `jefsky_wuliu` VALUES ('2087', '921845463992', '2016-03-31 03:33:56', 'SACRAMENTO - MATHER, CA - USA', '离开转运地 ，运输中Leave a transit, transportation');
INSERT INTO `jefsky_wuliu` VALUES ('2088', '923195925023', '2016-04-01 08:52:00', '深圳  Shenzhen', '申报出口 declaring export');
INSERT INTO `jefsky_wuliu` VALUES ('2089', '921845463929', '2016-03-22 03:19:56', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('2090', '921845463929', '2016-03-22 09:23:51', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2091', '921845463929', '2016-03-22 17:24:31', '深圳shenzhen', '离开深圳，运转中Leave shenzhen, in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2092', '921845463929', '2016-03-23 13:30:52', '香港Hongkong', '快件到达中转中心-香港 Express arrival Transfer Center-Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2093', '921845463929', '2016-03-24 01:02:58', '香港Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2094', '921845463929', '2016-03-25 12:58:53', 'SACRAMENTO - MATHER, CA - USA', '快件到达中转中心-美国 Express arrival Transfer Center-USA');
INSERT INTO `jefsky_wuliu` VALUES ('2095', '921845463929', '2016-03-30 22:56:58', 'SACRAMENTO - MATHER, CA - USA', '离开转运地 -美国，运输中Leave a transit, transportation');
INSERT INTO `jefsky_wuliu` VALUES ('2096', '921845463929', '2016-04-01 02:03:51', '墨西哥城Mexico City', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2097', '132573155741', '2016-04-01 11:29:52', '曼谷Bangkok', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2098', '132573155732', '2016-04-01 10:00:10', '马来西亚 Malaysian ', '快件已完成清关手续并从海关放行 Completed express clearance from customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2099', '662743480454', '2016-04-01 10:09:48', '美国 USA ', '海关出口放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2100', '919490789926', '2016-04-01 09:52:40', '美国 USA ', '海关出口放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2101', '919490789944', '2016-04-01 08:13:06', '美国 USA ', '海关出口放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2102', '132568825343', '2016-04-02 02:47:07', '东莞DongGuan', '已装港车 Already loading car');
INSERT INTO `jefsky_wuliu` VALUES ('2103', '132568825343', '2016-04-02 04:54:06', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2104', '132568825343', '2016-04-02 08:29:58', 'HONG KONG', '清关流程Customs clearance technological process');
INSERT INTO `jefsky_wuliu` VALUES ('2105', '922533975180', '2016-03-31 13:57:29', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2106', '922251966864', '2016-04-01 10:49:33', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2107', '922520410978', '2016-04-01 13:58:26', '新加坡SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2108', '922533429034', '2016-04-01 12:39:05', '柬埔寨 Cambodia', '快件已经到达派送作业地点 Cambodia');
INSERT INTO `jefsky_wuliu` VALUES ('2109', '922533429034', '2016-04-01 16:53:56', '柬埔寨 Cambodia', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2111', '923195925102', '2016-04-01 14:32:57', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2112', '922516540852', '2016-04-02 08:34:42', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2113', '922533432768', '2016-04-02 08:37:02', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2114', '923195925023', '2016-04-02 08:40:24', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2115', '923195925041', '2016-04-02 07:55:36', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2116', '922533732326', '2016-04-02 07:57:59', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2117', '922530845577', '2016-04-02 07:59:01', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2118', '922554671727', '2016-04-02 07:38:27', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2119', '664194398006', '2016-04-02 07:40:28', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2120', '664177783932', '2016-04-02 07:27:05', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2121', '664160298431', '2016-04-01 14:16:46', '新加坡SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2122', '923198274591', '2016-03-31 09:19:45', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2123', '923198274591', '2016-04-01 13:20:40', '', '申报出口Declaration of export');
INSERT INTO `jefsky_wuliu` VALUES ('2124', '923198274591', '2016-04-01 22:22:12', '广州GuangZhou', '离开广州Leave for GuangZhou');
INSERT INTO `jefsky_wuliu` VALUES ('2125', '923198274591', '2016-04-02 11:23:35', '香港HONG KONG', '快件到达中转中心 HONG KONG - HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('2201', '919490789874', '2016-03-28 06:54:12', 'DFW AIRPORT, TX - USA', '快件处于操作过程中Express in operation process');
INSERT INTO `jefsky_wuliu` VALUES ('2127', '921845463992', '2016-04-01 17:32:17', '墨西哥 Mexico', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2128', '921845463992', '2016-04-04 08:39:26', '墨西哥 Mexico', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2129', '921845463992', '2016-04-04 08:45:01', '墨西哥 Mexico', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2130', '132573155732', '2016-04-04 17:00:11', '马来西亚 Malaysia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2131', '921845427115', '2016-04-03 12:43:17', '加拿大Canada', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2132', '662743480454', '2016-04-02 13:52:55', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2133', '919490789926', '2016-04-02 09:53:28', '美国USA', '快件已经到达派送作业地点 USA');
INSERT INTO `jefsky_wuliu` VALUES ('2134', '919490789926', '2016-04-02 11:58:22', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2135', '919490789944', '2016-04-04 07:13:32', '美国USA', '快件已经到达派送作业地点 USA');
INSERT INTO `jefsky_wuliu` VALUES ('2136', '919490789944', '2016-04-04 11:53:28', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2137', '922251966864', '2016-04-02 06:06:51', '美国USA', '快件已经到达派送作业地点 USA');
INSERT INTO `jefsky_wuliu` VALUES ('2138', '922251966864', '2016-04-02 11:05:29', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2197', '922516136404', '2016-04-02 01:34:39', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2140', '923195925102', '2016-04-03 16:57:10', '美国USA', '快件已完成清关手续并从海关放行 USA');
INSERT INTO `jefsky_wuliu` VALUES ('2141', '922516540852', '2016-04-03 17:10:34', '新加坡SINGAPORE', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2142', '922516540852', '2016-04-04 09:59:24', '新加坡SINGAPORE', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2143', '922516540852', '2016-04-04 12:44:04', '新加坡SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2144', '922533432768', '2016-04-04 09:28:43', '韩国 Korea', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2145', '922533432768', '2016-04-04 10:52:40', '韩国 Korea', '快件已完成清关手续并从海关放行 Korea');
INSERT INTO `jefsky_wuliu` VALUES ('2146', '922533432768', '2016-04-04 13:38:40', '韩国 Korea', '快件已经到达派送作业地点 Korea');
INSERT INTO `jefsky_wuliu` VALUES ('2147', '922533432768', '2016-04-04 15:33:36', '韩国 Korea', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2148', '923195925023', '2016-04-03 03:51:03', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2149', '923195925023', '2016-04-03 17:09:37', 'CINCINNATI HUB, OH - USA', '快件已完成清关手续并从海关放行 CINCINNATI HUB - USA');
INSERT INTO `jefsky_wuliu` VALUES ('2150', '923195925023', '2016-04-04 08:12:13', 'WOODSIDE, NY - USA', '快件已经到达派送作业地点 WOODSIDE, NY - USA');
INSERT INTO `jefsky_wuliu` VALUES ('2151', '923195925023', '2016-04-04 15:33:00', 'WOODSIDE, NY - USA', '由于收件人不在暂时无法派送 Because the recipient is not temporarily unable to delivery');
INSERT INTO `jefsky_wuliu` VALUES ('2152', '132573155741', '2016-04-01 17:34:37', '泰国 Thailand', '快件已完成清关手续并从海关放行 Thailand');
INSERT INTO `jefsky_wuliu` VALUES ('2153', '132573155741', '2016-04-04 09:00:57', '泰国 Thailand', '快件已经到达派送作业地点 Thailand');
INSERT INTO `jefsky_wuliu` VALUES ('2154', '132573155741', '2016-04-04 10:50:54', '泰国 Thailand', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2155', '923195925041', '2016-04-03 11:56:06', '香港HONG KONG', '快件到达香港转运中 Express arrived in Hongkong-Transit');
INSERT INTO `jefsky_wuliu` VALUES ('2156', '923195925041', '2016-04-04 18:58:54', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2157', '922530845577', '2016-04-03 09:46:14', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2158', '922530845577', '2016-04-03 17:47:38', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2159', '922530845577', '2016-04-04 13:48:13', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2474', '922530845577', '2016-04-07 11:09:32', '美国USA', '到达美国转运中Arrive in USA in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2161', '132568825343', '2016-04-05 09:00:35', '香港HONG KONG', '快件已经到达派送作业地点 HONG KONG');
INSERT INTO `jefsky_wuliu` VALUES ('2162', '132568825343', '2016-04-05 10:30:01', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2163', '922554671727', '2016-04-02 17:13:45', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2164', '922554671727', '2016-04-03 06:17:45', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2165', '922554671727', '2016-04-03 17:19:07', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2166', '922554671727', '2016-04-04 19:03:50', '加拿大Canada', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2167', '922554671727', '2016-04-04 20:30:21', '加拿大Canada', '快件已完成清关手续并从海关放行 Canada');
INSERT INTO `jefsky_wuliu` VALUES ('2168', '922533732326', '2016-04-03 00:33:24', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2169', '922533732326', '2016-04-04 01:34:44', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2170', '922533732326', '2016-04-04 01:45:18', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2171', '664194398006', '2016-04-02 18:20:50', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2172', '664194398006', '2016-04-04 07:31:24', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2173', '664177783932', '2016-04-03 12:22:59', '新加坡SINGAPORE', '到达新加坡Arrive in SINGAPORE');
INSERT INTO `jefsky_wuliu` VALUES ('2174', '664177783932', '2016-04-04 14:31:41', '新加坡SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2175', '921845464174', '2016-03-31 11:45:55', '墨西哥 Mexico', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2176', '664179175538', '2016-04-05 08:35:21', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2177', '664179175538', '2016-04-05 13:58:01', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2178', '923198274591', '2016-04-05 10:03:59', '香港HONG KONG', '预计今晚11点航班 Estimate tonight 11 o\'clock flight');
INSERT INTO `jefsky_wuliu` VALUES ('2179', '664179175538', '2016-04-05 14:56:53', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2180', '923195925102', '2016-04-05 10:45:49', '美国USA', '快件已经到达派送作业地点 USA');
INSERT INTO `jefsky_wuliu` VALUES ('2181', '923195925102', '2016-04-05 12:26:14', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2182', '923195925023', '2016-04-05 13:27:35', 'BROOKLYN', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2183', '922533732326', '2016-04-05 03:32:42', '美国USA', '快件已完成清关手续并从海关放行 USA');
INSERT INTO `jefsky_wuliu` VALUES ('2184', '922533732326', '2016-04-05 08:51:34', '美国USA', '快件已经到达派送作业地点 USA');
INSERT INTO `jefsky_wuliu` VALUES ('2185', '922533732326', '2016-04-05 14:27:25', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2186', '922554671727', '2016-04-05 07:34:31', '加拿大Canada', '快件已经到达派送作业地点 Canada');
INSERT INTO `jefsky_wuliu` VALUES ('2187', '922554671727', '2016-04-05 10:55:47', '加拿大Canada', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2188', '923195925041', '2016-04-05 02:42:10', '美国USA', '快件已完成清关手续并从海关放行 USA');
INSERT INTO `jefsky_wuliu` VALUES ('2189', '923195925041', '2016-04-05 07:43:06', '美国USA', '快件已经到达派送作业地点  USA');
INSERT INTO `jefsky_wuliu` VALUES ('2190', '923195925041', '2016-04-05 12:36:43', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2258', '919485781924', '2016-04-07 19:22:58', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2202', '919490789874', '2016-04-04 15:41:58', 'DFW AIRPORT, TX - USA', '快件处于操作过程中Express in operation process');
INSERT INTO `jefsky_wuliu` VALUES ('2245', '923195923855', '2016-03-31 08:30:23', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2244', '923195923855', '2016-03-31 03:58:02', '东莞DongGuan', '离开东莞，转运中leave DongGuan，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2203', '919490789874', '2016-04-06 09:16:25', 'DFW AIRPORT, TX - USA', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('2204', '922516136404', '2016-04-06 09:10:28', '加拿大Canada', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2205', '922555609594', '2016-04-07 03:02:26', '深圳ShenZhen', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2206', '922555609594', '2016-04-07 08:23:09', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2207', '922555609594', '2016-04-07 09:21:56', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2208', '919490789874', '2016-04-06 13:33:16', 'HALTOM CITY', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2209', '919485781924', '2016-04-06 08:35:24', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2210', '919485781924', '2016-04-07 09:28:04', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2211', '919485781933', '2016-04-06 14:57:40', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2212', '919485781933', '2016-04-07 09:34:06', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2213', '664195169154', '2016-04-04 20:05:50', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('2214', '664195169154', '2016-04-06 08:33:50', '广州Guangzhou', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2215', '664195169154', '2016-04-07 02:09:27', '广州Guangzhou', '离开转运地 -广州Leave the transhipment - guangzhou');
INSERT INTO `jefsky_wuliu` VALUES ('2216', '664195169154', '2016-04-07 05:11:03', '香港 HONG KONG', '快件到达中转中心-香港 Express arrival Transfer Center-Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2217', '922533732362', '2016-04-01 22:06:43', 'HONG KONG - HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2218', '922533732362', '2016-04-02 06:35:17', 'LOS ANGELES GATEWAY, CA - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2219', '922533732362', '2016-04-02 19:56:27', 'LOS ANGELES GATEWAY, CA - USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2220', '922533732362', '2016-04-04 07:04:16', 'LONG BEACH, CA - USA', '快件已经到达派送作业地点 LONG BEACH, CA - USA');
INSERT INTO `jefsky_wuliu` VALUES ('2221', '922533732362', '2016-04-04 14:38:39', 'LAWNDALE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2222', '919485781915', '2016-04-06 08:41:21', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2223', '919485781915', '2016-04-07 08:41:53', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2224', '919485782036', '2016-04-06 09:43:36', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2225', '919485782036', '2016-04-07 08:44:01', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2226', '919485781997', '2016-04-06 08:45:00', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2227', '919485781997', '2016-04-07 08:45:40', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2228', '919485782027', '2016-04-06 08:46:25', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2229', '919485782027', '2016-04-07 08:47:17', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2230', '902101379514', '2016-04-07 08:30:30', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2231', '902101379514', '2016-04-07 14:35:18', '深圳shenzhen', '资料不全，等待确认Information is not complete, wait for confirmation');
INSERT INTO `jefsky_wuliu` VALUES ('2232', '902106282975', '2016-04-06 08:25:44', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2233', '902106282975', '2016-04-07 10:26:37', '深圳shenzhen', '已入盐田监管仓It has the Yantian regulatory positions');
INSERT INTO `jefsky_wuliu` VALUES ('2234', '902106282975', '2016-04-07 15:29:08', '深圳shenzhen', '预计4月10号派送');
INSERT INTO `jefsky_wuliu` VALUES ('2235', '922533407076', '2016-04-07 02:28:09', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('2236', '922533407076', '2016-04-07 09:27:18', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2237', '662741702625', '2016-04-07 02:17:11', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2238', '662741702625', '2016-04-07 09:11:27', '深圳ShenZhen', '申报出口Declaration of export');
INSERT INTO `jefsky_wuliu` VALUES ('2239', '923455299185', '2016-04-07 02:12:14', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2240', '923455299185', '2016-04-07 08:13:18', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2241', '922540355177', '2016-04-07 02:14:14', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2242', '922540355177', '2016-04-07 12:51:48', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2243', '922555609594', '2016-04-07 14:19:10', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2249', '923195923855', '2016-04-07 15:22:16', '美国USA', '到达美国转运中Arrive in USA in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2250', '921845427258', '2016-04-08 00:59:02', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2251', '922533771764', '2016-04-08 00:59:24', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2252', '923195925272', '2016-04-08 00:59:42', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2253', '919485781881', '2016-04-08 01:00:00', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2254', '919485781863', '2016-04-08 01:00:42', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2255', '919490789944', '2016-04-05 21:25:07', '美国USA', '到达处理中心 Arrival processing center');
INSERT INTO `jefsky_wuliu` VALUES ('2257', '664195169154', '2016-04-08 09:12:07', 'TOKYO - JAPAN', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2259', '919485781933', '2016-04-07 19:25:08', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2260', '919485781915', '2016-04-07 19:26:18', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2261', '919485782036', '2016-04-07 19:27:03', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2262', '919485781997', '2016-04-07 21:31:53', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2263', '919485782027', '2016-04-07 19:38:11', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2264', '662741702625', '2016-04-08 04:33:59', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2265', '922533407076', '2016-04-08 04:45:59', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2266', '923195923855', '2016-04-04 15:15:52', '澳大利亚Australia', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2267', '923195923855', '2016-04-04 16:55:55', '澳大利亚Australia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2268', '921845463929', '2016-04-07 04:31:55', '墨西哥 Mexico', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2269', '923198274591', '2016-04-05 23:12:26', '香港Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2270', '919490789944', '2016-04-09 06:17:31', '深圳ShenZhen', '投送失败，快件被退回 delivery fail，express delivery is returned');
INSERT INTO `jefsky_wuliu` VALUES ('2271', '922516136404', '2016-04-07 21:52:27', '加拿大Canada', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2272', '664195169154', '2016-04-08 13:18:11', 'TOKYO - JAPAN', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2273', '664195169154', '2016-04-09 06:18:51', 'NARITA - JAPAN', '快件已经到达派送作业地点 NARITA - JAPAN');
INSERT INTO `jefsky_wuliu` VALUES ('2274', '919485781924', '2016-04-08 14:38:24', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2275', '919485781933', '2016-04-08 13:42:27', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2276', '919485782036', '2016-04-08 14:29:15', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2277', '919485781997', '2016-04-08 13:24:27', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2278', '919485782027', '2016-04-08 13:25:25', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2279', '662741702625', '2016-04-09 06:31:00', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2280', '923455299185', '2016-04-08 07:32:12', '深圳ShenZhen', '离开深圳Leave for ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2281', '923455299185', '2016-04-09 01:27:25', '新加坡SINGAPORE', '到达新加坡Arrive in SINGAPORE');
INSERT INTO `jefsky_wuliu` VALUES ('2282', '922533407076', '2016-04-09 06:34:34', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2283', '132570470194', '2016-04-07 23:38:27', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2284', '132570470194', '2016-04-08 10:39:53', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2285', '132570470194', '2016-04-08 11:40:48', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2286', '921845427258', '2016-04-08 12:42:41', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2287', '921845427258', '2016-04-08 09:46:52', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2288', '919485781863', '2016-04-08 06:47:32', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2289', '919485781863', '2016-04-08 09:48:13', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2290', '923195925272', '2016-04-08 06:48:54', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2291', '922533771764', '2016-04-08 06:50:00', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2292', '922533771764', '2016-04-08 10:51:55', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2293', '919485781881', '2016-04-08 06:53:21', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2294', '919485781881', '2016-04-08 09:53:51', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2295', '921845427258', '2016-04-09 06:54:58', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2296', '919485781863', '2016-04-09 06:55:29', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2297', '923195925272', '2016-04-09 06:55:59', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2298', '922533771764', '2016-04-09 06:56:36', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2299', '919485781881', '2016-04-09 06:57:00', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2300', '921845463929', '2016-04-08 10:45:59', '墨西哥 Mexico', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2302', '664217634784', '2016-04-09 03:05:23', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2303', '664217634784', '2016-04-09 08:06:05', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2304', '664217634784', '2016-04-09 12:25:33', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2305', '664215693919', '2016-04-09 03:31:52', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2306', '664215693919', '2016-04-09 08:09:40', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2307', '921845427212', '2016-04-09 06:44:27', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2308', '921845427160', '2016-04-09 06:46:16', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2309', '921845427203', '2016-04-09 06:47:29', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2310', '921845427151', '2016-04-09 06:49:13', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2311', '921845427133', '2016-04-09 06:50:07', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2312', '664217634784', '2016-04-09 14:59:09', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2313', '919490789944', '2016-04-10 04:17:06', '东莞DongGuan', '到达东莞Arrive in DongGuan');
INSERT INTO `jefsky_wuliu` VALUES ('2475', '922530845577', '2016-04-10 11:10:57', '加拿大Canada', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2315', '919485781924', '2016-04-09 12:31:26', '美国USA', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('2316', '919485781933', '2016-04-09 10:53:23', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2317', '919485781915', '2016-04-09 12:34:23', '美国USA', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('2318', '919485782036', '2016-04-09 10:51:07', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2319', '919485781997', '2016-04-09 10:17:19', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2320', '919485782027', '2016-04-09 12:40:44', '美国USA', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('2321', '922540355177', '2016-04-10 07:46:47', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2322', '662741702625', '2016-04-10 08:48:01', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2323', '923455299185', '2016-04-09 11:43:47', '新加坡SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2324', '922533407076', '2016-04-09 19:18:26', '韩国 Korea', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2325', '902101379514', '2016-04-10 10:48:01', '深圳ShenZhen', '预计明日到达韩国 Estimated to reach South Korea tomorrow');
INSERT INTO `jefsky_wuliu` VALUES ('2326', '921845427258', '2016-04-10 06:25:19', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2327', '919485781863', '2016-04-10 07:25:58', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2328', '923195925272', '2016-04-10 07:27:38', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2329', '922533771764', '2016-04-10 07:28:05', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2330', '919485781881', '2016-04-10 07:28:39', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2331', '921845427212', '2016-04-10 07:31:16', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2332', '921845427133', '2016-04-10 08:31:36', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2333', '921845427151', '2016-04-10 08:32:19', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2334', '921845427203', '2016-04-10 08:33:18', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2335', '921845427160', '2016-04-10 08:34:52', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2336', '132570470158', '2016-04-09 17:57:10', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2337', '664194398006', '2016-04-10 07:29:20', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2338', '664194398006', '2016-04-10 15:53:02', 'CINCINNATI HUB, OH - USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2339', '664195169154', '2016-04-11 10:24:53', 'NARITA - JAPAN', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2340', '902106282975', '2016-04-11 08:37:23', '韩国 Korea', '清关流程Customs clearance technological process');
INSERT INTO `jefsky_wuliu` VALUES ('2341', '922540355177', '2016-04-11 02:42:12', 'BANGKOK - THAILAND', '快件到达中转中心 BANGKOK - THAILAND');
INSERT INTO `jefsky_wuliu` VALUES ('2342', '921845427258', '2016-04-10 16:52:07', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2343', '902101379514', '2016-04-11 09:54:31', '韩国 Korea', '到达韩国Arrive in Korea');
INSERT INTO `jefsky_wuliu` VALUES ('2344', '919485781863', '2016-04-10 17:59:28', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2345', '922533771764', '2016-04-10 17:17:13', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2346', '919485781881', '2016-04-10 17:41:46', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2347', '921845427160', '2016-04-11 08:30:43', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2348', '921845427203', '2016-04-11 08:29:00', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2349', '921845427151', '2016-04-11 08:30:00', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2350', '921845427133', '2016-04-11 08:30:43', '深圳ShenZhen', '申报出口Declaration of export');
INSERT INTO `jefsky_wuliu` VALUES ('2351', '921845427212', '2016-04-11 08:31:57', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2352', '923195926637', '2016-04-11 02:35:29', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2353', '923195926637', '2016-04-11 08:40:48', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2354', '923195926646', '2016-04-11 02:42:10', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2355', '923195926646', '2016-04-11 08:42:53', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2356', '923195926600', '2016-04-11 02:44:35', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2357', '923195926600', '2016-04-11 08:46:13', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2358', '923195925245', '2016-04-11 02:08:55', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2359', '923198274591', '2016-04-09 09:50:05', 'Melbourne 墨尔本', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2360', '923198274591', '2016-04-11 13:41:12', 'Melbourne  墨尔本', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2361', '922540355177', '2016-04-11 12:32:29', 'BANGKOK - THAILAND', '离开泰国-曼谷，转运中leave BANGKOK - THAILAND，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2476', '922530845577', '2016-04-11 09:12:07', '加拿大Canada', '清关流程Customs clearance technological process');
INSERT INTO `jefsky_wuliu` VALUES ('2363', '922516136404', '2016-04-11 04:26:48', '加拿大Canada', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('2364', '922516136404', '2016-04-11 11:15:24', '加拿大Canada', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2365', '923198274591', '2016-04-12 08:23:59', 'Melbourne 墨尔本', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('2366', '664194398006', '2016-04-11 12:38:30', 'FRANKLIN PARK, IL - USA', '部分快递已经签收 Part of the courier has been signed');
INSERT INTO `jefsky_wuliu` VALUES ('2367', '919485781924', '2016-04-11 11:35:36', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2368', '919485781915', '2016-04-11 11:33:24', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2369', '919485781997', '2016-04-11 11:26:12', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2370', '919485782027', '2016-04-11 11:27:33', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2371', '922540355177', '2016-04-12 03:19:03', 'KARACHI - PAKISTAN', '到达卡拉奇-巴基斯坦转运中Arrive in KARACHI - PAKISTAN in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2372', '662741702625', '2016-04-11 14:39:43', '加拿大Canada', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2373', '921845427258', '2016-04-11 14:46:29', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2374', '923195925272', '2016-04-11 13:50:01', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2375', '922533771764', '2016-04-11 13:51:20', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2376', '921845427212', '2016-04-12 02:53:50', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2377', '921845427133', '2016-04-12 02:55:09', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2378', '921845427151', '2016-04-12 02:55:40', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2379', '921845427203', '2016-04-12 02:56:18', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2380', '921845427160', '2016-04-12 02:56:46', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2381', '664215693919', '2016-04-11 14:53:22', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2382', '923195926637', '2016-04-12 08:36:30', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2383', '923195926646', '2016-04-12 08:32:19', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2384', '923195926600', '2016-04-12 08:34:21', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2385', '923195925245', '2016-04-11 13:56:06', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2386', '922251966794', '2016-04-12 02:29:36', '东莞', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2387', '923455530587', '2016-04-12 02:30:11', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2388', '922251968388', '2016-04-12 02:30:37', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2389', '902106282975', '2016-04-12 10:30:39', '韩国 Korea', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2390', '664179175510', '2016-04-12 08:18:47', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2391', '664179175510', '2016-04-12 11:53:57', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2392', '5262767339', '2016-04-12 08:21:05', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2393', '5262767339', '2016-04-12 11:58:39', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2394', '921845463992', '2016-04-11 10:44:14', '墨西哥 Mexico', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2395', '664179175510', '2016-04-12 14:58:30', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2396', '919490789926', '2016-04-12 09:48:13', '美国 USA ', '第二次派送失败second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2397', '922516136404', '2016-04-12 13:36:43', '加拿大Canada', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2398', '923198274591', '2016-04-12 13:33:14', 'Melbourne 墨尔本', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2399', '922540355177', '2016-04-12 09:50:40', 'KARACHI', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2400', '662741702625', '2016-04-12 05:52:20', '加拿大Canada', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2401', '919485781863', '2016-04-12 10:36:34', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('2402', '923195925272', '2016-04-12 10:37:07', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2403', '919485781881', '2016-04-12 10:38:25', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2404', '921845427212', '2016-04-12 20:11:20', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2405', '921845427133', '2016-04-12 23:16:54', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2406', '921845427151', '2016-04-13 08:21:11', '美国USA', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('2407', '921845427203', '2016-04-12 21:20:19', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('2408', '921845427160', '2016-04-12 22:21:58', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2409', '132570470158', '2016-04-13 05:34:25', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2410', '5262767339', '2016-04-13 10:19:23', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('2411', '923195926646', '2016-04-13 08:48:11', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2412', '923195926600', '2016-04-13 08:49:45', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2413', '922251968388', '2016-04-13 08:40:33', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('2414', '922251966794', '2016-04-13 08:35:32', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('2415', '923455530587', '2016-04-13 08:38:16', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('2416', '132603178549', '2016-04-13 08:30:59', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2417', '132603178549', '2016-04-13 10:17:39', '香港 Hongkong', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('2444', '662741704175', '2016-04-13 02:24:50', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2419', '922545126747', '2016-04-13 02:52:23', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2420', '919490981993', '2016-04-13 02:54:57', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2421', '923195926479', '2016-04-13 02:03:24', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2422', '132603178549', '2016-04-13 16:03:50', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2423', '919490789926', '2016-04-12 21:11:12', '美国USA', '第三次派送失败Thirddelivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2424', '132570470194', '2016-04-13 11:20:13', '新加坡SINGAPORE', '收件人要求自己清关 Recipient requirements own Clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2425', '921845427212', '2016-04-13 08:21:43', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2426', '921845427133', '2016-04-13 08:25:19', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2427', '921845427151', '2016-04-13 10:22:46', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2428', '921845427203', '2016-04-13 12:49:58', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2429', '921845427160', '2016-04-13 20:06:28', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2430', '132570470158', '2016-04-14 02:42:43', '新加坡SINGAPORE', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2431', '132570470158', '2016-04-14 07:46:02', '新加坡SINGAPORE', '快件已经到达派送作业地点 SINGAPORE - SINGAPORE');
INSERT INTO `jefsky_wuliu` VALUES ('2432', '923195926637', '2016-04-14 05:51:17', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2433', '923195925245', '2016-04-13 03:55:54', 'LOS ANGELES GATEWAY, CA - USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2434', '923195925245', '2016-04-13 08:14:29', 'LONG BEACH, CA - USA', '快件已经到达派送作业地点 LONG BEACH - USA');
INSERT INTO `jefsky_wuliu` VALUES ('2435', '923195925245', '2016-04-13 12:57:18', 'LA HABRA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2436', '922251968388', '2016-04-14 05:03:25', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2437', '922251966794', '2016-04-14 06:04:04', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2438', '923455530587', '2016-04-14 06:05:08', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2439', '923450878265', '2016-04-13 23:24:33', 'GUANGZHOU - CHINA, PEOPLES REPUBLIC', '快件到达中转中心 GUANGZHOU - CHINA, PEOPLES REPUBLIC');
INSERT INTO `jefsky_wuliu` VALUES ('2440', '923450878265', '2016-04-14 05:36:13', 'GUANGZHOU - CHINA, PEOPLES REPUBLIC', '离开转运地 GUANGZHOU - CHINA, PEOPLES REPUBLIC');
INSERT INTO `jefsky_wuliu` VALUES ('2441', '902106282814', '2016-04-13 02:16:26', '东莞DongGuan', '离开东莞，转运中leave DongGuan，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2442', '922545126747', '2016-04-13 08:31:05', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2443', '923195926479', '2016-04-14 08:29:18', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2445', '662741704175', '2016-04-14 08:37:23', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2446', '919490981993', '2016-04-14 08:30:17', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2447', '471455779781', '2016-04-14 08:36:48', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2448', '471455779781', '2016-04-14 10:10:34', '香港HONG KONG', '客户要求15号派送 Customer requirements 4-15 delivery');
INSERT INTO `jefsky_wuliu` VALUES ('3846', '922533914349', '2016-06-23 02:16:31', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2450', '902101379514', '2016-04-14 14:16:52', '韩国 Korea', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2451', '132596847462', '2016-04-14 05:26:03', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('2452', '132596847462', '2016-04-14 09:17:48', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2453', '902106282814', '2016-04-14 13:26:02', '深圳ShenZhen', '船期延误，预计4-15号出发 The shipment delayed, is expected to start 4-15');
INSERT INTO `jefsky_wuliu` VALUES ('2454', '919490789926', '2016-04-13 08:44:44', '美国USA', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_wuliu` VALUES ('2455', '922533429034', '2016-04-02 14:49:20', '柬埔寨 Cambodia', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2456', '922533429034', '2016-04-03 12:50:40', '柬埔寨 Cambodia', '第三次派送失败Thirddelivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2457', '922533429034', '2016-04-04 16:52:58', '柬埔寨 Cambodia', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_wuliu` VALUES ('2477', '922530845577', '2016-04-14 13:12:42', '加拿大Canada', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2478', '922533407076', '2016-04-15 08:30:35', '韩国 Korea', '清关流程Customs clearance technological process');
INSERT INTO `jefsky_wuliu` VALUES ('2479', '921845427151', '2016-04-14 11:56:13', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2480', '921845427160', '2016-04-14 13:42:48', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2462', '922533407076', '2016-04-10 06:06:29', '韩国 Korea', '清关流程Customs clearance technological process');
INSERT INTO `jefsky_wuliu` VALUES ('2463', '922533407076', '2016-04-11 06:07:31', '韩国 Korea', '清关流程Customs clearance technological process');
INSERT INTO `jefsky_wuliu` VALUES ('2464', '922533407076', '2016-04-12 06:08:11', '韩国 Korea', '清关流程Customs clearance technological process');
INSERT INTO `jefsky_wuliu` VALUES ('2465', '922533407076', '2016-04-14 08:27:05', '韩国 Korea', '清关流程Customs clearance technological process');
INSERT INTO `jefsky_wuliu` VALUES ('2466', '921845427258', '2016-04-12 09:13:21', '美国USA', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2468', '921845427258', '2016-04-13 10:16:20', '美国USA', '第三次派送失败Thirddelivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2469', '921845427258', '2016-04-13 13:17:46', '美国USA', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_wuliu` VALUES ('2470', '132570470158', '2016-04-14 11:24:42', '新加坡SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2471', '132069651245', '2016-04-14 08:29:19', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2472', '132069651245', '2016-04-14 15:08:47', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2473', '132069651245', '2016-04-14 16:34:38', '香港Hongkong', '派送并已签收Sign and have it delivered');
INSERT INTO `jefsky_wuliu` VALUES ('2525', '923195926637', '2016-04-15 06:23:54', '美国USA', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('2526', '923195926637', '2016-04-15 06:54:27', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2482', '923195926646', '2016-04-14 04:19:33', '美国USA', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('2483', '923195926646', '2016-04-14 08:30:19', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2484', '923195926600', '2016-04-14 04:27:04', '美国USA', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('2485', '923195926600', '2016-04-14 08:34:58', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2486', '922251968388', '2016-04-15 02:13:59', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2487', '922251966794', '2016-04-14 06:16:00', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2488', '923455530587', '2016-04-14 15:51:22', '日本 Japan', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('2489', '923455530587', '2016-04-14 17:52:53', '日本 Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2490', '923450878265', '2016-04-15 04:24:19', 'BANGKOK - THAILAND', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2491', '923450878265', '2016-04-15 06:53:52', 'BANGKOK - THAILAND', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2492', '922545126747', '2016-04-14 07:25:05', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2493', '922545126747', '2016-04-15 07:25:48', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2494', '923195926479', '2016-04-15 07:27:11', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2495', '662741704175', '2016-04-15 06:28:24', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2496', '919490981993', '2016-04-15 07:31:26', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2497', '923451111804', '2016-04-14 02:34:45', '东莞', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2498', '923451111804', '2016-04-15 08:35:15', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2499', '919485782106', '2016-04-14 02:35:40', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2500', '919485782106', '2016-04-15 08:36:10', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2501', '919485782133', '2016-04-14 02:36:35', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2502', '919485782133', '2016-04-15 08:37:05', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2503', '919485781809', '2016-04-14 02:37:51', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2504', '919485781809', '2016-04-15 08:38:16', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2505', '931483912210', '2016-04-15 08:30:50', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2506', '922251968688', '2016-03-26 12:14:32', '美国USA', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2507', '922251968688', '2016-03-27 11:17:07', '美国USA', '第三次派送失败Thirddelivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2508', '922251968688', '2016-03-27 13:17:49', '美国USA', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_wuliu` VALUES ('2509', '921845464174', '2016-04-01 07:20:51', '墨西哥 Mexico', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2510', '921845464174', '2016-04-02 09:22:40', '墨西哥 Mexico', '第三次派送失败Thirddelivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2511', '921845464174', '2016-04-02 15:23:06', '墨西哥 Mexico', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_wuliu` VALUES ('2512', '664179017823', '2016-04-15 05:23:39', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('2513', '664179017823', '2016-04-15 09:24:38', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2514', '132596847462', '2016-04-14 17:27:32', '深圳shenzhen', '离开深圳，运转中Leave shenzhen, in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2515', '132596847462', '2016-04-15 11:28:36', '香港Hongkong', '快件到达香港中转中心 Shipment to Hong Kong transit center');
INSERT INTO `jefsky_wuliu` VALUES ('2516', '931483912210', '2016-04-15 14:12:53', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2517', '471455779781', '2016-04-15 16:26:58', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2518', '132570470194', '2016-04-14 14:33:00', '新加坡SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2519', '922530845577', '2016-04-15 10:44:34', '加拿大Canada', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2520', '921845427212', '2016-04-15 13:44:23', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2521', '922535270378', '2016-04-15 08:38:01', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2522', '922535270378', '2016-04-15 16:52:33', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2523', '662742686541', '2016-04-16 08:07:11', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2524', '921845427133', '2016-04-15 13:51:15', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2527', '922251968388', '2016-04-15 12:30:20', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2528', '922251966794', '2016-04-15 10:58:32', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2529', '922545126747', '2016-04-16 07:01:14', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2530', '923195926479', '2016-04-15 19:02:13', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2531', '662741704175', '2016-04-15 23:03:18', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2532', '919490981993', '2016-04-16 06:06:29', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2533', '923451111804', '2016-04-16 01:56:55', '新加坡SINGAPORE', '到达新加坡Arrive in SINGAPORE');
INSERT INTO `jefsky_wuliu` VALUES ('2534', '919485782106', '2016-04-16 04:09:07', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2535', '919485782133', '2016-04-16 06:11:17', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2536', '919485781809', '2016-04-16 05:12:05', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2537', '132596847462', '2016-04-16 08:20:32', 'SENNAN-SHI JP', '到达日本 Arrive in japan');
INSERT INTO `jefsky_wuliu` VALUES ('2538', '923455460909', '2016-04-16 02:32:58', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2539', '923196051523', '2016-04-16 02:34:23', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2540', '923455460909', '2016-04-16 05:14:33', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2541', '923455460909', '2016-04-16 08:37:00', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2542', '923455460909', '2016-04-18 04:17:06', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2543', '923196051523', '2016-04-16 05:18:31', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2544', '923196051523', '2016-04-16 08:28:24', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2545', '923196051523', '2016-04-18 05:20:30', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2546', '664179017823', '2016-04-16 17:31:15', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2547', '664179017823', '2016-04-17 01:32:13', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2548', '664179017823', '2016-04-18 05:25:57', 'BRISBANE - AUSTRALIA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2549', '132596847462', '2016-04-17 18:23:07', 'SENNAN-SHI JP', '正在运输 to be in transit');
INSERT INTO `jefsky_wuliu` VALUES ('2550', '919485781809', '2016-04-16 18:44:46', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2551', '919485782133', '2016-04-16 21:55:16', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2552', '919485782106', '2016-04-16 19:47:39', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2553', '919490981993', '2016-04-17 21:50:00', 'Romania 罗马尼亚', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2554', '662741704175', '2016-04-16 09:36:30', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2555', '662741704175', '2016-04-16 14:53:15', '美国USA', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2556', '923195926479', '2016-04-16 15:17:25', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2557', '922545126747', '2016-04-17 09:59:00', '泰国 Thailand', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2558', '923455533518', '2016-04-18 02:09:38', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2559', '923455342322', '2016-04-18 02:14:01', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2560', '662743180897', '2016-04-17 07:15:16', '深圳ShenZhen', '到达深圳Arrive in ShenZhen');
INSERT INTO `jefsky_wuliu` VALUES ('2561', '922545126747', '2016-04-17 10:16:40', '泰国 Thailand', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2562', '922251966794', '2016-04-16 11:22:36', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2563', '922530845577', '2016-04-16 09:27:16', '加拿大Canada', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2564', '922530845577', '2016-04-17 12:27:47', '加拿大Canada', '第三次派送失败Thirddelivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2565', '922530845577', '2016-04-17 17:28:19', '加拿大Canada', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_wuliu` VALUES ('2566', '923195926637', '2016-04-16 08:58:18', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2567', '902106282814', '2016-04-16 16:54:38', '韩国 Korea', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2568', '662742686541', '2016-04-18 09:19:28', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2569', '662742686541', '2016-04-18 10:31:12', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2570', '132596847462', '2016-04-18 10:50:07', 'KOBE-SHI HIGASHINADA-KU JP', '货件已装车，派送途中 The goods have been loaded car，send process');
INSERT INTO `jefsky_wuliu` VALUES ('2571', '923455342322', '2016-04-18 08:27:15', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2572', '923455533518', '2016-04-18 08:33:42', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2573', '923195926479', '2016-04-18 11:38:36', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2574', '662741704175', '2016-04-18 09:20:21', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2575', '919490981993', '2016-04-18 08:52:43', 'Romania 罗马尼亚', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2576', '923450878265', '2016-04-18 11:52:38', 'THAILAND', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2577', '923451111804', '2016-04-18 18:35:56', '新加坡SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2578', '919485782106', '2016-04-18 10:53:16', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2579', '919485782133', '2016-04-18 02:23:32', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2580', '919485781809', '2016-04-18 14:13:00', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2581', '664179017823', '2016-04-18 10:53:21', 'BRISBANE - AUSTRALIA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2582', '664179017823', '2016-04-18 14:41:22', 'BRISBANE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2583', '923196051523', '2016-04-18 09:49:48', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2584', '923196051523', '2016-04-18 14:32:46', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2585', '923455460909', '2016-04-19 01:35:54', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2586', '132596847462', '2016-04-18 14:10:33', 'KAWANISHI JP', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2587', '662743180897', '2016-04-18 08:50:22', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2588', '923449445289', '2016-04-19 02:59:25', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2589', '664178944671', '2016-04-19 02:15:04', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2590', '664195002236', '2016-04-19 09:39:20', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2591', '922533407076', '2016-04-17 16:10:39', '东莞DongGuan', '派送失败，收件人不在指定地址 ，货物退回delivery failure，The recipient is not at the specified address，The goods are returned');
INSERT INTO `jefsky_wuliu` VALUES ('2592', '662741703648', '2016-04-19 02:11:22', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2593', '662741703648', '2016-04-19 08:39:14', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2594', '923449445289', '2016-04-19 08:40:57', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2595', '664178944671', '2016-04-19 08:41:37', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2596', '662743180897', '2016-04-19 11:04:17', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2597', '923455533518', '2016-04-19 13:17:12', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2598', '923455342322', '2016-04-19 13:18:19', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2599', '664195002236', '2016-04-19 14:38:20', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2600', '902106282814', '2016-04-18 13:34:40', '韩国 Korea', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2601', '664195002236', '2016-04-19 16:45:16', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2602', '923195926479', '2016-04-18 18:12:46', '美国USA', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2603', '922545126747', '2016-04-18 22:54:58', '泰国 Thailand', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2604', '922545126747', '2016-04-19 16:56:08', '泰国 Thailand', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2605', '923455460909', '2016-04-19 18:40:39', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2606', '662743180897', '2016-04-20 07:08:45', '新加坡SINGAPORE', '到达新加坡Arrive in SINGAPORE');
INSERT INTO `jefsky_wuliu` VALUES ('2607', '923455342322', '2016-04-20 08:11:17', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2608', '923455533518', '2016-04-20 08:13:29', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2609', '922541520005', '2016-04-19 16:19:13', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2610', '664195002263', '2016-04-20 03:21:57', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2611', '664195002263', '2016-04-20 08:53:04', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2612', '922541520005', '2016-04-20 08:32:32', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2613', '664194769632', '2016-04-20 03:28:20', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2614', '664194769632', '2016-04-20 08:35:33', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2615', '923451513045', '2016-04-20 03:32:37', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2616', '923451513045', '2016-04-20 08:32:55', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2617', '662741703648', '2016-04-20 09:13:46', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2618', '664178944671', '2016-04-20 09:16:24', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2619', '923449445289', '2016-04-20 09:25:06', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2620', '923195926479', '2016-04-19 11:31:14', '美国USA', '第三次派送失败Third delivery failure ');
INSERT INTO `jefsky_wuliu` VALUES ('2621', '923195926479', '2016-04-19 14:24:03', '美国USA', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_wuliu` VALUES ('2622', '919485782133', '2016-04-19 12:19:10', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2623', '662743180897', '2016-04-20 17:25:09', '新加坡SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2624', '922251969416', '2016-04-21 02:11:07', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2625', '922251969416', '2016-04-21 08:31:53', '深圳ShenZhen', '申报出口Declaration of export');
INSERT INTO `jefsky_wuliu` VALUES ('2626', '922251969407', '2016-04-21 02:14:58', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2627', '922251969407', '2016-04-21 08:32:29', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2628', '923455349775', '2016-04-21 02:23:06', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2629', '923455349775', '2016-04-21 08:31:39', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2630', '923455349766', '2016-04-21 02:32:53', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2631', '923455349766', '2016-04-21 08:33:11', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2632', '923196051523', '2016-04-20 13:51:03', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2633', '923455460909', '2016-04-20 10:38:46', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2634', '923455342322', '2016-04-20 18:58:54', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2635', '662741703648', '2016-04-20 20:24:25', '韩国 Korea', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2636', '664178944671', '2016-04-21 04:56:43', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2637', '923449445289', '2016-04-21 09:58:33', 'NARITA-SHI JP', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2638', '922541520005', '2016-04-21 09:37:48', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2639', '664194769632', '2016-04-21 09:36:01', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2640', '923451513045', '2016-04-21 09:42:10', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2641', '664217358609', '2016-04-21 02:16:13', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2642', '664217358609', '2016-04-21 08:35:02', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2643', '923195926479', '2016-04-20 10:27:12', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2644', '922545126747', '2016-04-20 08:59:11', '泰国 Thailand', '第三次派送失败Third delivery failure ');
INSERT INTO `jefsky_wuliu` VALUES ('2645', '922545126747', '2016-04-20 12:30:00', '泰国 Thailand', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_wuliu` VALUES ('2646', '919490981993', '2016-04-20 08:58:24', 'Romania 罗马尼亚', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2647', '922545126747', '2016-04-20 13:17:07', '泰国 Thailand', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2648', '919490981993', '2016-04-21 11:31:14', 'Romania 罗马尼亚', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2649', '923455460909', '2016-04-21 10:10:47', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2650', '923455342322', '2016-04-21 08:08:31', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2651', '662741703648', '2016-04-21 17:53:41', '韩国 Korea', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2652', '664178944671', '2016-04-21 18:20:12', 'LEIPZIG - GERMANY', '到达莱比锡-德国转运中Arrive in LEIPZIG - GERMANY in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2653', '923449445289', '2016-04-21 13:27:14', 'SANBU GUN JP', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2654', '664194769632', '2016-04-22 04:43:04', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2655', '923451513045', '2016-04-22 08:30:17', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2656', '471470069549', '2016-04-22 03:19:56', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2657', '471470069549', '2016-04-22 08:35:48', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2658', '922541520005', '2016-04-21 15:37:50', '新加坡SINGAPORE', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2659', '664195002263', '2016-04-22 10:56:02', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2661', '923455349766', '2016-04-22 09:57:59', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2662', '923455349775', '2016-04-22 09:56:03', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2663', '922251969407', '2016-04-22 09:38:18', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2664', '922251969416', '2016-04-22 09:52:44', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2665', '919485781624', '2016-04-22 02:15:15', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2666', '919485781624', '2016-04-22 08:45:46', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2667', '923446766653', '2016-04-22 02:29:37', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2668', '923446766653', '2016-04-22 08:48:08', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2669', '922546093226', '2016-04-22 02:25:15', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2670', '922546093226', '2016-04-22 08:25:35', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2671', '471470069549', '2016-04-22 11:33:18', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2672', '664178944671', '2016-04-22 07:29:41', 'STOCKHOLM - SWEDEN', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2673', '664178944671', '2016-04-22 18:30:45', 'Switzerland', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2674', '923446390740', '2016-04-23 18:45:48', '东莞Dongguan', '离开东莞运输中To leave Dongguan for transport');
INSERT INTO `jefsky_wuliu` VALUES ('2675', '923455349379', '', '', '');
INSERT INTO `jefsky_wuliu` VALUES ('2676', '923455349379', '2016-04-23 18:51:29', '东莞Dongguan', '离开东莞运输中To leave Dongguan for transport');
INSERT INTO `jefsky_wuliu` VALUES ('2677', '132359254128', '2016-04-23 08:54:08', '深圳', '清关流程');
INSERT INTO `jefsky_wuliu` VALUES ('2678', '132359254128', '2016-04-23 08:54:08', '深圳', '清关流程');
INSERT INTO `jefsky_wuliu` VALUES ('2679', '132359254128', '2016-04-23 08:54:08', '深圳', '清关流程');
INSERT INTO `jefsky_wuliu` VALUES ('2680', '132359254128', '2016-04-23 08:54:08', '深圳', '清关流程');
INSERT INTO `jefsky_wuliu` VALUES ('2681', '132359254128', '2016-04-23 09:03:46', '深圳Shenzhen', '清关流程Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('2682', '923455349379', '2016-04-23 10:59:58', '香港Hongkong', '通关到港Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('2683', '132614548352', '2016-04-23 22:17:50', '东莞dongguan', '发往广州机场Sent to Guangzhou Airport');
INSERT INTO `jefsky_wuliu` VALUES ('2711', '132614548352', '2016-04-24 23:23:37', '广州GuangZhou', '离开广州，转运中leave GuangZhou，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2712', '132614548352', '2016-04-25 04:25:47', '越南 Vietnam', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2686', '664194769632', '2016-04-24 09:22:45', '珀斯，澳大利亚PERTH - AUSTRALIA', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2687', '922530845577', '2016-04-21 20:29:47', '加拿大Canada', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2688', '919490981993', '2016-04-22 13:59:41', 'Romania 罗马尼亚', '第三次派送失败Third delivery failure ');
INSERT INTO `jefsky_wuliu` VALUES ('2689', '919490981993', '2016-04-22 15:14:14', 'Romania 罗马尼亚', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_wuliu` VALUES ('2690', '923455342322', '2016-04-23 13:26:01', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2691', '662741703648', '2016-04-22 13:08:44', '韩国 Korea', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2692', '664194769632', '2016-04-25 08:55:20', 'PERTH - AUSTRALIA', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2693', '923451513045', '2016-04-23 10:47:38', '日本 Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2694', '922251969407', '2016-04-24 02:23:26', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2695', '923455349766', '2016-04-24 03:54:34', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2696', '923455349775', '2016-04-24 09:52:42', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2697', '922251969416', '2016-04-23 02:28:22', '英国 UK', '到达英国Arrive in UK');
INSERT INTO `jefsky_wuliu` VALUES ('2698', '471470069549', '2016-04-22 17:14:02', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2699', '923455349379', '2016-04-24 16:34:38', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2700', '923446390740', '2016-04-25 08:36:17', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2701', '921845464101', '2016-04-24 02:48:18', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2702', '921845464101', '2016-04-25 08:48:44', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2703', '922546093226', '2016-04-23 14:58:15', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2704', '922546093226', '2016-04-24 20:24:09', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2705', '919485781624', '2016-04-23 10:36:48', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2706', '919485781624', '2016-04-24 16:56:37', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2707', '923446766653', '2016-04-23 15:25:29', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2708', '923446766653', '2016-04-24 18:34:04', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2719', '664217358609', '2016-04-22 13:39:31', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2713', '132597180430', '2016-04-23 22:27:14', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2714', '132597180430', '2016-04-24 22:27:34', '深圳ShenZhen', '已入机场仓 Has entered the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('2715', '132597180430', '2016-04-24 15:28:58', '深圳ShenZhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2716', '132597180430', '2016-04-24 18:29:50', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2717', '132597180430', '2016-04-25 03:49:42', '台湾 Taiwan', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2718', '922541520005', '2016-04-25 09:14:39', '新加坡SINGAPORE', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2720', '664217358609', '2016-04-25 08:20:26', '香港HONG KONG', '排仓中等待航班 Waiting for a flight.');
INSERT INTO `jefsky_wuliu` VALUES ('2721', '921845464138', '2016-04-25 02:42:03', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2722', '921845464138', '2016-04-25 08:42:27', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2723', '922541520005', '2016-04-25 13:14:15', '新加坡SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2724', '922546093226', '2016-04-25 10:53:37', '香港HONG KONG', '排仓中等待航班 Waiting for a flight.');
INSERT INTO `jefsky_wuliu` VALUES ('2725', '132597180430', '2016-04-25 17:26:59', '台湾 Taiwan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2726', '922251969407', '2016-04-25 11:53:32', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2727', '923455349766', '2016-04-25 08:19:58', '美国USA', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('2728', '923455349775', '2016-04-25 02:51:12', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2729', '922251969416', '2016-04-25 11:53:54', '英国 UK', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2730', '922546093226', '2016-04-26 09:21:41', '香港HONG KONG', '预计明天凌晨1点航班 Estimate tomorrow at one in the morning flight');
INSERT INTO `jefsky_wuliu` VALUES ('2731', '919485781624', '2016-04-25 08:46:30', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2732', '923446766653', '2016-04-25 14:28:04', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2733', '132359254128', '2016-04-25 17:50:34', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2734', '923455349379', '2016-04-25 03:45:15', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2735', '923446390740', '2016-04-25 18:34:58', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2736', '921845464101', '2016-04-26 09:41:49', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2737', '921845464138', '2016-04-26 09:51:17', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2738', '931482856943', '2016-04-26 02:57:25', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2739', '931482856943', '2016-04-26 08:19:48', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2740', '132596848563', '2016-04-26 04:49:38', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2741', '132614548352', '2016-04-25 14:50:43', '越南 Vietnam', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2742', '132614548352', '2016-04-25 18:50:41', '越南 Vietnam', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2743', '931482856943', '2016-04-26 11:42:54', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2745', '664194769632', '2016-04-26 11:52:47', 'PERTH - AUSTRALIA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2746', '132596848563', '2016-04-27 08:33:51', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2747', '921845464138', '2016-04-27 03:25:56', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2748', '921845464101', '2016-04-27 02:27:48', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2749', '923446390740', '2016-04-26 14:19:53', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2750', '919485781624', '2016-04-26 11:22:04', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2751', '922546093226', '2016-04-27 01:48:23', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2752', '923455349775', '2016-04-26 11:24:45', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2753', '923455349766', '2016-04-25 17:55:52', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2754', '923455533518', '2016-04-21 03:41:06', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2755', '923455533518', '2016-04-26 09:16:58', '加拿大Canada', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2756', '902104918582', '2016-04-27 02:33:42', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2757', '902104918582', '2016-04-27 08:43:28', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2758', '922517019678', '2016-04-27 02:34:56', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2759', '922517019678', '2016-04-27 08:49:19', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2760', '471470197778', '2016-04-27 01:36:35', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2761', '471470197778', '2016-04-27 08:30:00', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2762', '922542822011', '2016-04-26 02:14:27', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2763', '922542822011', '2016-04-26 08:36:51', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2764', '922542822011', '2016-04-27 10:48:52', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2765', '471470197778', '2016-04-27 11:12:29', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2766', '5262767333', '2016-04-27 03:43:25', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2767', '5262767333', '2016-04-27 08:20:46', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2768', '5262767333', '2016-04-27 11:21:04', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2769', '922546093226', '2016-04-27 08:41:42', '德国-法兰克福Germany-Frankfurt', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2770', '922546093226', '2016-04-27 09:47:16', '德国-法兰克福Germany-Frankfurt', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2771', '919485781624', '2016-04-27 14:08:36', '美国USA', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2772', '923446390740', '2016-04-27 11:41:49', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2773', '921845464101', '2016-04-27 08:21:52', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2774', '132596848563', '2016-04-27 21:19:00', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2775', '471470197778', '2016-04-27 15:15:49', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2776', '923455533518', '2016-04-27 08:58:31', '加拿大Canada', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('2777', '902104918582', '2016-04-28 08:54:29', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2778', '922517019678', '2016-04-28 09:35:18', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2779', '923446833801', '2016-04-28 02:00:29', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2780', '923446833801', '2016-04-28 08:45:47', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2781', '923195732261', '2016-04-28 02:01:10', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2782', '923195732261', '2016-04-28 08:50:33', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2783', '5262767333', '2016-04-28 17:22:28', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2784', '922546093226', '2016-04-28 12:55:02', '德国Germany', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2785', '919485781624', '2016-04-27 17:08:42', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2786', '923455349379', '2016-04-28 08:54:14', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2787', '921845464101', '2016-04-28 11:40:36', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2788', '921845464138', '2016-04-28 14:12:41', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2789', '922542822011', '2016-04-28 22:14:42', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2790', '922542822011', '2016-04-29 06:23:20', '曼谷-泰国BANGKOK - THAILAND', '到达曼谷-泰国转运中Arrive in BANGKOK - THAILAND in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2791', '923455533518', '2016-04-27 15:21:16', '加拿大Canada', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2792', '923455533518', '2016-04-28 09:48:42', '加拿大Canada', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2793', '922517019678', '2016-04-29 02:28:14', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2794', '902104918582', '2016-04-28 17:29:29', '韩国 Korea', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2795', '902104918582', '2016-04-28 21:49:11', '韩国 Korea', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2796', '902104918582', '2016-04-29 09:26:03', '韩国 Korea', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2797', '923195732261', '2016-04-29 09:20:40', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2798', '923446833801', '2016-04-29 09:45:57', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2799', '931483912229', '2016-04-28 03:46:33', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2800', '931483912229', '2016-04-28 13:28:08', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2801', '923195926203', '2016-04-29 02:14:57', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2802', '923195926203', '2016-04-29 08:47:23', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2803', '922533913539', '2016-04-29 02:01:55', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2804', '922533913539', '2016-04-29 08:52:46', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2805', '920256382030', '2016-04-29 02:03:09', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2806', '920256382030', '2016-04-29 08:47:28', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2807', '923195926036', '2016-04-29 02:03:56', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2808', '923195926036', '2016-04-29 08:47:15', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2809', '922533913548', '2016-04-29 02:04:36', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2810', '922533913548', '2016-04-29 08:50:54', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2811', '923455349818', '2016-04-29 02:05:28', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2812', '923455349818', '2016-04-29 08:57:50', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2813', '923457514205', '2016-04-29 02:45:58', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2814', '923457514205', '2016-04-29 08:46:30', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2815', '923457514214', '2016-04-29 02:47:13', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2816', '923457514214', '2016-04-29 08:47:38', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2817', '931483912229', '2016-04-29 13:52:49', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2818', '132596848563', '2016-04-29 15:59:14', '日本 Japan', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2819', '931483912229', '2016-04-29 18:09:54', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2820', '922542822011', '2016-04-30 03:38:55', 'KARACHI - PAKISTAN', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2821', '922542822011', '2016-04-30 03:56:27', 'KARACHI - PAKISTAN', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2822', '921845464138', '2016-04-29 14:17:57', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2823', '923455349379', '2016-04-29 14:27:27', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2824', '664217358609', '2016-04-27 21:55:37', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2825', '923455533518', '2016-04-29 10:57:09', '加拿大Canada', '第三次派送失败Third delivery failure ');
INSERT INTO `jefsky_wuliu` VALUES ('2826', '923455533518', '2016-04-29 16:57:50', '加拿大Canada', '等待收件方联络当地EMS Wait for the receiving party to contact the local EMS');
INSERT INTO `jefsky_wuliu` VALUES ('2827', '922517019678', '2016-04-29 09:48:06', '新加坡SINGAPORE', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2828', '922517019678', '2016-04-29 14:34:42', '新加坡SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2829', '902104918582', '2016-04-29 14:29:57', '韩国 Korea', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2830', '923195732261', '2016-04-30 01:07:42', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2831', '923446833801', '2016-04-30 08:56:51', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2832', '923457514214', '2016-04-30 08:59:14', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2833', '923457514205', '2016-04-29 17:46:26', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2834', '923457514205', '2016-04-30 09:02:50', 'TOKYO - JAPAN', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2835', '923457514205', '2016-04-30 09:59:27', 'TOKYO - JAPAN', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2836', '920256382030', '2016-04-30 09:37:00', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2837', '923455349818', '2016-04-30 09:49:35', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2838', '922533913539', '2016-04-30 09:58:05', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2839', '922533913548', '2016-04-30 09:56:27', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2840', '923195926203', '2016-04-30 09:58:51', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2841', '923195926036', '2016-04-30 09:54:13', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2842', '132597282439', '2016-04-30 05:13:14', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2843', '132597282439', '2016-04-30 08:42:41', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2844', '471470198002', '2016-04-30 05:18:32', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2845', '471470198002', '2016-04-30 08:43:55', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2846', '923195926072', '2016-04-30 02:24:55', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2847', '923195926072', '2016-04-30 08:53:19', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2848', '923195925979', '2016-04-30 02:26:30', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2849', '923195925979', '2016-04-30 08:57:49', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2850', '923195925997', '2016-04-30 02:27:50', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2851', '923195925997', '2016-04-30 08:56:08', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2852', '923457514205', '2016-05-02 15:41:28', 'NARITA - JAPAN', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2853', '923457514214', '2016-05-01 20:54:32', 'ONTARIO SERVICE AREA, ON - CANADA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2854', '923457514214', '2016-05-02 15:57:22', 'ONTARIO SERVICE AREA, ON - CANADA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2855', '132596848563', '2016-05-02 13:59:10', 'HYOGO JP', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2856', '923195925979', '2016-05-01 19:51:38', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2857', '923195925979', '2016-05-01 22:53:45', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2858', '923195926072', '2016-05-01 21:55:59', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2859', '923195926072', '2016-05-02 22:56:38', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2860', '664217932528', '2016-05-03 00:30:52', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2861', '664217932528', '2016-05-03 08:30:25', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2862', '664179175486', '2016-05-03 00:36:56', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2863', '664179175486', '2016-05-03 08:23:24', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2864', '923195925997', '2016-05-01 09:27:45', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2865', '923195925997', '2016-05-02 22:25:27', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2866', '662743051009', '2016-04-30 02:26:35', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2867', '662743051009', '2016-04-30 09:37:16', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2868', '662743344083', '2016-04-30 02:28:15', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2869', '662743344083', '2016-04-30 09:34:46', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2870', '922546119978', '2016-04-30 02:29:24', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2871', '922546119978', '2016-04-30 09:41:49', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2872', '922533913548', '2016-05-01 23:21:00', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2873', '923195926203', '2016-05-01 22:52:03', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2874', '923195926036', '2016-05-01 23:25:21', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2875', '923455349818', '2016-05-01 01:56:20', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2876', '922533913539', '2016-05-01 01:59:20', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2877', '920256382030', '2016-05-01 23:37:27', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2878', '923446833801', '2016-05-01 03:39:30', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2879', '923195732261', '2016-05-01 17:49:16', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2880', '923195732261', '2016-05-02 12:27:05', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2881', '664217358609', '2016-05-01 12:23:42', '俄罗斯 Russia ', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2882', '923455342076', '2016-05-03 01:31:22', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2883', '923455342076', '2016-05-03 09:31:51', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2884', '923455349809', '2016-05-03 01:42:24', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2885', '923455349809', '2016-05-03 09:42:44', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2886', '923455349793', '2016-05-03 01:44:47', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2887', '923455349793', '2016-05-03 09:45:02', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2888', '922251968818', '2016-05-03 01:47:40', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2889', '922251968818', '2016-05-03 09:50:24', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2890', '923455491692', '2016-05-03 01:57:39', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2891', '923455491692', '2016-05-03 09:58:05', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2892', '922251968809', '2016-05-03 01:37:35', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2893', '922251968809', '2016-05-03 09:43:56', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2894', '923455349827', '2016-05-03 01:38:19', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2895', '923455349827', '2016-05-03 09:44:37', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2896', '662743051009', '2016-05-03 13:41:32', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2897', '664179175486', '2016-05-03 13:30:37', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2898', '922542822011', '2016-05-03 15:28:20', 'KARACHI', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2899', '923463493212', '2016-05-04 02:41:34', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2900', '923463493212', '2016-05-04 08:52:59', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2901', '923195926203', '2016-05-03 12:06:57', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2902', '923195926036', '2016-05-03 14:26:04', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2903', '922533913539', '2016-05-02 22:17:37', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2904', '922533913539', '2016-05-03 20:36:19', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2905', '922546119978', '2016-05-03 18:01:30', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2906', '922546119978', '2016-05-04 00:57:06', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2907', '662743344083', '2016-05-03 19:33:11', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2908', '923195926072', '2016-05-03 11:12:36', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2909', '664217932528', '2016-05-03 11:31:43', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2910', '923455349809', '2016-05-04 09:50:01', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2911', '923455342076', '2016-05-04 09:51:25', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2912', '922251968818', '2016-05-04 09:52:16', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2913', '923455349793', '2016-05-04 09:57:52', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2914', '923455349827', '2016-05-04 09:57:34', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2915', '922251968809', '2016-05-04 09:57:08', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2916', '923455491692', '2016-05-04 09:55:53', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2917', '664217932528', '2016-05-03 17:49:34', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2918', '923455491692', '2016-05-05 03:56:42', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2919', '922251968809', '2016-05-05 02:58:10', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2920', '923455349827', '2016-05-05 01:59:06', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2921', '923455349793', '2016-05-05 01:42:44', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2922', '922251968818', '2016-05-05 01:52:48', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2923', '923455342076', '2016-05-05 01:51:43', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2924', '923455349809', '2016-05-05 01:45:32', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2925', '923195926072', '2016-05-04 12:29:50', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2926', '923195925979', '2016-05-03 08:31:48', '美国USA', '清关流程Customs clearance technological process');
INSERT INTO `jefsky_wuliu` VALUES ('2927', '923195925997', '2016-05-04 10:45:07', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2928', '132597282439', '2016-05-04 17:33:23', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2929', '662743344083', '2016-05-04 16:09:18', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2930', '662743051009', '2016-05-04 02:10:34', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2931', '922546119978', '2016-05-05 06:41:57', 'TOKYO - JAPAN', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2932', '922546119978', '2016-05-05 09:54:40', 'TOKYO - JAPAN', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2933', '922533913539', '2016-05-04 10:59:41', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2934', '923455349818', '2016-05-04 11:28:37', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2935', '923195926036', '2016-05-04 12:28:07', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2936', '923195926203', '2016-05-04 13:48:03', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2937', '922533913548', '2016-05-04 10:46:40', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2938', '922533913548', '2016-05-04 12:58:05', '美国USA', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2939', '923446833801', '2016-05-03 23:40:28', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2940', '664215674682', '2016-05-05 02:27:45', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2941', '664215674682', '2016-05-05 08:51:05', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2942', '923195925951', '2016-05-05 02:30:36', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2943', '923195925951', '2016-05-05 08:55:54', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2944', '923455342021', '2016-05-05 01:45:05', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2945', '923455342021', '2016-05-05 08:56:33', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2946', '664217358609', '2016-05-04 18:35:41', '俄罗斯 Russia ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2947', '662741703602', '2016-05-05 11:26:16', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2948', '662741703602', '2016-05-05 13:54:04', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2949', '664217358609', '2016-05-05 09:47:08', '俄罗斯 Russia ', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2950', '923463493212', '2016-05-05 16:27:30', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2951', '923463493212', '2016-05-06 03:36:21', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('2952', '923195925979', '2016-05-04 19:56:59', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2953', '662743344083', '2016-05-05 10:00:55', '马来西亚 Malaysia', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2954', '662743344083', '2016-05-06 07:24:53', '马来西亚 Malaysia', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2955', '662743051009', '2016-05-05 07:13:27', 'CINCINNATI HUB, OH - USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2956', '922546119978', '2016-05-06 08:21:41', 'NARITA - JAPAN', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('2957', '920256382030', '2016-05-04 20:08:47', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2958', '923195926203', '2016-05-05 11:25:29', '美国USA', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2959', '922533913548', '2016-05-04 17:16:55', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2960', '923446833801', '2016-05-04 20:23:07', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2961', '923446833801', '2016-05-04 20:23:07', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2962', '923446833801', '2016-05-04 20:32:58', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2963', '923455342021', '2016-05-06 09:46:02', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2964', '923195925951', '2016-05-06 09:39:58', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2965', '662741703602', '2016-05-06 09:49:10', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2966', '931484238334', '2016-05-06 01:21:59', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2967', '931484238334', '2016-05-06 08:25:39', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('2968', '664214827437', '2016-05-05 01:23:12', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2969', '664214827437', '2016-05-05 08:37:52', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2970', '664214827437', '2016-05-06 10:07:16', '越南 Vietnam', '清关流程Customs clearance technological process');
INSERT INTO `jefsky_wuliu` VALUES ('2971', '662743051009', '2016-05-06 00:57:34', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2972', '931484238334', '2016-05-06 14:26:24', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2973', '664214066200', '2016-05-07 01:50:13', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('2974', '664214066200', '2016-05-07 08:40:44', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('2975', '662741703602', '2016-05-07 01:52:39', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2976', '923195925951', '2016-05-07 01:53:40', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2977', '923455342021', '2016-05-07 01:54:45', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2978', '664215674682', '2016-05-06 11:56:40', '香港HONG KONG', '到达香港转运中Arrive in Hongkong in operation');
INSERT INTO `jefsky_wuliu` VALUES ('2979', '923463493212', '2016-05-06 18:59:28', '雅加达-印度尼西亚 JAKARTA - INDONESIA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2980', '923463493212', '2016-05-06 22:43:59', '雅加达-印度尼西亚 JAKARTA - INDONESIA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2981', '923455491692', '2016-05-06 06:04:08', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2982', '923455491692', '2016-05-06 15:30:40', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2983', '922251968809', '2016-05-06 06:53:27', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('2984', '922251968809', '2016-05-06 12:39:57', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2985', '923455349827', '2016-05-06 11:37:10', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2986', '923455349793', '2016-05-05 22:35:19', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('2987', '922251968818', '2016-05-06 11:10:18', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2988', '923455342076', '2016-05-06 14:45:15', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2989', '923455349809', '2016-05-06 11:39:15', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('2990', '923195925979', '2016-05-05 10:40:32', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2991', '662743344083', '2016-05-06 12:32:04', '马来西亚 Malaysia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2992', '662743051009', '2016-05-06 16:44:20', 'CARY', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2993', '922546119978', '2016-05-06 09:55:49', '日本 Japan', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2994', '920256382030', '2016-05-05 09:40:16', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('2995', '923455349818', '2016-05-06 12:17:59', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2996', '923195926203', '2016-05-05 12:47:41', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2997', '923446833801', '2016-05-05 09:56:32', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2998', '923455533518', '2016-05-05 13:36:37', '加拿大Canada', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('2999', '664214827437', '2016-05-06 17:45:23', '越南 Vietnam', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3000', '664217358609', '2016-05-05 13:53:37', '俄罗斯 Russia ', '收件人不在目的地 Recipient is not in destination');
INSERT INTO `jefsky_wuliu` VALUES ('3003', '923196051771', '2016-05-07 19:49:05', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3002', '922530845770', '2016-05-07 19:45:02', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3004', '923196051771', '2016-05-07 20:39:29', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3005', '922530845770', '2016-05-07 20:57:55', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3006', '922530845770', '2016-05-08 15:50:23', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3007', '923196051771', '2016-05-08 15:50:47', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3008', '923196051771', '2016-05-09 02:51:21', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3009', '922530845770', '2016-05-09 02:51:39', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3010', '923449589028', '2016-05-07 02:53:46', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3011', '923449589028', '2016-05-07 08:35:05', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3012', '923449589028', '2016-05-08 16:36:54', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3013', '923449589028', '2016-05-09 02:29:44', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3014', '132585980253', '2016-05-09 00:29:28', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3015', '132585980253', '2016-05-09 08:11:10', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3016', '664214066200', '2016-05-07 20:03:43', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3017', '664214066200', '2016-05-08 05:13:15', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3018', '664214066200', '2016-05-08 20:34:06', '英国 UK', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3019', '662741703602', '2016-05-09 06:58:52', '新加坡SINGAPORE', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3020', '923195925951', '2016-05-08 10:40:09', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3021', '923455342021', '2016-05-08 09:48:32', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3022', '923463493212', '2016-05-07 09:46:20', 'JAKARTA - INDONESIA', '快件已经到达派送作业地点 JAKARTA - INDONESIA');
INSERT INTO `jefsky_wuliu` VALUES ('3023', '923463493212', '2016-05-07 09:46:20', 'JAKARTA - INDONESIA', '快件已经到达派送作业地点 JAKARTA - INDONESIA');
INSERT INTO `jefsky_wuliu` VALUES ('3024', '923455349827', '2016-05-07 14:23:32', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3025', '923455349793', '2016-05-07 13:24:20', '美国USA', '清关流程Customs clearance technological process');
INSERT INTO `jefsky_wuliu` VALUES ('3026', '923455342076', '2016-05-07 12:32:09', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3027', '923455349809', '2016-05-07 11:54:22', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3028', '920256382030', '2016-05-06 16:29:17', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3029', '922546159100', '2016-05-09 00:19:08', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3030', '922546159100', '2016-05-09 08:36:05', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3031', '664215674682', '2016-05-08 16:39:29', '马来西亚 Malaysia', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3032', '471470198002', '2016-04-30 16:22:58', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3033', '922546159100', '2016-05-09 12:29:29', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('3034', '132585980253', '2016-05-09 09:52:05', '香港HONG KONG', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('3035', '132585980253', '2016-05-09 15:39:43', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3036', '922546159100', '2016-05-09 17:29:09', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3037', '922251968818', '2016-05-09 13:21:07', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3038', '923455349793', '2016-05-09 09:31:18', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3039', '664214066200', '2016-05-09 11:26:40', 'BLACKBURN', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3040', '923455342021', '2016-05-09 14:21:22', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3041', '662741703602', '2016-05-09 12:42:11', '新加坡SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3042', '923449589028', '2016-05-10 02:39:32', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3043', '923196051771', '2016-05-09 18:41:01', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3044', '922530845770', '2016-05-09 15:42:02', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('3045', '922533913327', '2016-05-10 01:43:27', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3046', '922533913327', '2016-05-10 08:56:45', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3047', '922533913336', '2016-05-10 02:18:35', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3048', '922533913336', '2016-05-10 08:49:59', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3049', '924675260194', '2016-05-10 01:28:27', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3050', '924675260194', '2016-05-10 08:45:47', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3051', '923463493212', '2016-05-10 11:14:15', 'DUKUH', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3052', '923195925951', '2016-05-10 14:41:37', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3053', '923455342021', '2016-05-10 10:38:50', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3054', '923196051771', '2016-05-10 11:24:47', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3055', '922530845770', '2016-05-10 09:59:52', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3056', '664195017499', '2016-05-11 02:40:34', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3057', '664195017499', '2016-05-11 08:17:57', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3058', '664217369711', '2016-05-11 01:20:09', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3059', '664217369711', '2016-05-11 08:42:30', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3060', '922533913327', '2016-05-11 09:07:23', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3061', '922533913336', '2016-05-11 09:05:42', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3062', '664215674682', '2016-05-11 02:43:50', '马来西亚 Malaysia', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3063', '664217358609', '2016-05-10 16:47:07', '俄罗斯 Russia ', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3064', '664195017499', '2016-05-11 14:45:42', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3065', '923455342021', '2016-05-11 09:34:06', '美国USA', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3066', '922533913327', '2016-05-11 21:15:00', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3067', '922533913336', '2016-05-11 22:43:00', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('3068', '924675260194', '2016-05-11 15:24:32', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3069', '924674556173', '2016-05-12 02:55:19', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3070', '924674556173', '2016-05-12 08:48:00', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3071', '924675260194', '2016-05-12 02:09:53', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3072', '922542945144', '2016-05-12 02:11:38', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3073', '922542945144', '2016-05-12 08:45:30', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3074', '922533913336', '2016-05-12 14:51:45', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3075', '922533913327', '2016-05-12 08:28:43', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3076', '923455342021', '2016-05-12 16:42:58', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3077', '924674556173', '2016-05-13 09:11:45', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3078', '922542945144', '2016-05-13 09:12:07', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3079', '924675260194', '2016-05-12 15:06:50', '马来西亚 Malaysia', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3080', '664217369711', '2016-05-12 04:18:46', '新加坡SINGAPORE', '到达新加坡Arrive in SINGAPORE');
INSERT INTO `jefsky_wuliu` VALUES ('3081', '664217369711', '2016-05-12 16:55:27', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3082', '924674556173', '2016-05-14 04:47:37', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3083', '924674556173', '2016-05-14 06:35:38', 'JAKARTA - INDONESIA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3084', '132207073808', '2016-05-14 01:18:13', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3085', '132207073808', '2016-05-14 08:21:45', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3086', '922542945144', '2016-05-14 03:57:59', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3087', '664215674682', '2016-05-13 16:49:48', '马来西亚 Malaysia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3088', '5262767323', '2016-05-14 10:30:41', '深圳  Shenzhen', '入机场仓 Into the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('3089', '924674556173', '2016-05-15 02:49:10', 'JAKARTA - INDONESIA', '清关流程Customs clearance technological process');
INSERT INTO `jefsky_wuliu` VALUES ('3090', '922533913327', '2016-05-14 12:53:45', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3091', '919485781324', '2016-05-15 02:37:26', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3092', '919485781324', '2016-05-16 08:38:05', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3093', '919485781281', '2016-05-15 02:38:50', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3094', '919485781281', '2016-05-16 08:42:06', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3095', '924675225822', '2016-05-15 02:39:29', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3096', '924675225822', '2016-05-16 08:39:51', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3097', '132207073835', '2016-05-16 02:41:08', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3098', '132207073835', '2016-05-16 08:29:31', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3099', '922542945144', '2016-05-14 21:44:52', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3100', '923449589028', '2016-05-15 07:57:09', '以色列 Israel', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3101', '923455348329', '2016-05-16 02:28:34', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3102', '923455348329', '2016-05-16 08:49:58', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3103', '924674556173', '2016-05-16 00:30:08', 'JAKARTA - INDONESIA', '清关流程Customs clearance technological process');
INSERT INTO `jefsky_wuliu` VALUES ('3106', '132207073808', '2016-05-16 11:32:24', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3107', '5262767323', '2016-05-16 08:55:55', '马来西亚 Malaysia', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3108', '132207073835', '2016-05-16 14:14:00', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3109', '664196978741', '2016-05-17 03:24:46', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3110', '664196978741', '2016-05-17 08:34:42', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3111', '922542945144', '2016-05-16 13:51:47', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3112', '924674556173', '2016-05-17 02:54:50', 'JAKARTA - INDONESIA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3113', '923455348329', '2016-05-17 09:24:26', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3114', '919485781281', '2016-05-17 09:24:47', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3115', '924675225822', '2016-05-17 09:26:13', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3116', '919485781324', '2016-05-17 09:24:26', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3117', '5262767323', '2016-05-17 07:34:18', '马来西亚 Malaysia', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3118', '132617243839', '2016-05-18 06:26:49', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('3119', '132617243839', '2016-05-18 08:28:18', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3120', '664196978741', '2016-05-17 13:32:30', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3121', '923455348329', '2016-05-18 03:53:30', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3122', '919485781324', '2016-05-18 02:54:28', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3123', '919485781281', '2016-05-18 03:55:56', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3124', '924675225822', '2016-05-18 02:46:11', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3125', '922542945144', '2016-05-17 11:36:25', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3126', '924674556173', '2016-05-17 11:31:56', 'TANGERANG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3127', '923455348504', '2016-05-18 02:45:06', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3128', '923455348231', '2016-05-18 02:45:39', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3129', '922541315661', '2016-05-18 02:46:18', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3130', '922251968863', '2016-05-18 02:46:43', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3131', '922251968854', '2016-05-18 02:48:17', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3132', '922251968854', '2016-05-18 08:49:14', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3133', '922251968863', '2016-05-18 08:49:34', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3134', '922541315661', '2016-05-18 08:51:37', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3135', '923455348231', '2016-05-18 08:51:55', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3136', '924675260194', '2016-05-18 14:14:28', '马来西亚 Malaysia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3137', '919485781324', '2016-05-18 16:49:46', '美国USA', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('3138', '919485781281', '2016-05-18 16:52:52', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3139', '924675225822', '2016-05-18 16:55:02', '美国USA', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3140', '664195018890', '2016-05-19 04:16:48', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3141', '664178474623', '2016-05-19 03:17:12', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3142', '118236684393', '2016-05-19 03:06:02', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3143', '924675374468', '2016-05-19 02:19:51', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3144', '924675374468', '2016-05-19 08:36:02', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3145', '923455348231', '2016-05-19 09:32:57', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3146', '922541315661', '2016-05-19 09:41:27', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3147', '922251968863', '2016-05-19 09:34:12', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3148', '922251968854', '2016-05-19 09:36:41', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3149', '923451185465', '2016-05-18 17:18:58', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3150', '923451185465', '2016-05-19 09:36:45', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3151', '118236684393', '2016-05-19 08:46:23', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3152', '118236684393', '2016-05-19 17:03:05', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3153', '664195018890', '2016-05-19 10:34:46', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3154', '664178474623', '2016-05-19 10:56:56', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3155', '923449589028', '2016-05-18 11:54:02', '以色列 Israel', '第一次派送失败First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3156', '5262767323', '2016-05-19 18:28:59', '马来西亚 Malaysia', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3157', '924675225822', '2016-05-19 10:51:06', '美国USA', '第二次派送失败Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3158', '919485781324', '2016-05-19 09:45:58', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3159', '922251968854', '2016-05-20 02:57:35', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3160', '923455348231', '2016-05-20 02:58:20', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3161', '922541315661', '2016-05-20 01:30:21', '新加坡SINGAPORE', '到达新加坡Arrive in SINGAPORE');
INSERT INTO `jefsky_wuliu` VALUES ('3162', '923455348504', '2016-05-18 08:35:46', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3163', '923455348504', '2016-05-19 09:33:16', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3164', '923455348504', '2016-05-20 02:51:40', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3165', '922251968863', '2016-05-20 02:38:27', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3166', '923451185465', '2016-05-19 17:34:01', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3167', '923451185465', '2016-05-20 02:37:30', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3168', '664178474623', '2016-05-19 17:27:01', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3169', '664195018890', '2016-05-19 18:27:27', '香港HONG KONG', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3170', '921845463461', '2016-05-20 02:07:01', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3171', '922533913309', '2016-05-20 02:07:18', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3172', '922533913309', '2016-05-20 08:34:33', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3173', '921845463461', '2016-05-20 08:34:22', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3174', '132617243839', '2016-05-19 10:30:59', '深圳ShenZhen', '正式报关中 Formal customs declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3213', '132617243839', '2016-05-20 16:27:11', '日本 Japan', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3214', '132617243839', '2016-05-20 17:47:02', '日本 Japan', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3180', '924675225822', '2016-05-19 17:59:34', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3212', '132617243839', '2016-05-20 08:17:57', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3181', '923455348329', '2016-05-20 07:24:55', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3182', '922251968854', '2016-05-21 02:26:23', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3183', '923455348231', '2016-05-21 02:27:13', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3184', '922541315661', '2016-05-20 15:53:19', '新加坡SINGAPORE', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3185', '923455348504', '2016-05-21 02:29:23', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3186', '922251968863', '2016-05-21 02:31:05', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3215', '132617243839', '2016-05-23 08:37:33', '日本 Japan', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3188', '923451185465', '2016-05-20 09:34:21', '日本 Japan', '到达日本 Arrive in japan');
INSERT INTO `jefsky_wuliu` VALUES ('3189', '924675374468', '2016-05-20 09:53:08', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3190', '922533913309', '2016-05-21 09:40:08', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3191', '921845463461', '2016-05-21 09:41:00', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3192', '664178944495', '2016-05-21 02:44:06', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3193', '923449589028', '2016-05-22 15:06:28', '以色列 Israel', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3194', '923449589028', '2016-05-22 15:06:28', '以色列 Israel', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3195', '923455348329', '2016-05-21 14:24:52', '美国USA', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('3196', '922251968854', '2016-05-22 14:54:46', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3197', '923455348231', '2016-05-21 20:57:34', '美国USA', '到达美国Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('3198', '922251968863', '2016-05-22 09:25:49', '美国USA', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3199', '924675374468', '2016-05-22 07:20:17', '美国USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3200', '923451185465', '2016-05-21 16:47:33', '日本 Japan', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3201', '923451185465', '2016-05-21 16:47:33', '日本 Japan', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3202', '922533913309', '2016-05-22 02:11:05', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3203', '921845463461', '2016-05-22 02:12:58', '美国USA', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3204', '664178944495', '2016-05-21 23:56:34', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3205', '664178944495', '2016-05-22 05:55:35', '香港HONG KONG', '离开香港，转运中leave HONG KONG，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3206', '664178944495', '2016-05-22 18:31:43', 'EAST MIDLANDS - UK', '海关状态更新Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3207', '664178944495', '2016-05-22 19:32:37', 'EAST MIDLANDS - UK', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3208', '924809241403', '2016-05-21 01:41:00', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3209', '924809241403', '2016-05-21 08:41:47', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3210', '924809241403', '2016-05-22 09:42:59', '香港HONG KONG', '到达香港Arrive in Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3211', '924809241403', '2016-05-23 02:43:25', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3216', '132617243839', '2016-05-23 10:22:16', '日本 Japan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3217', '919485781757', '2016-05-22 03:58:28', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3218', '919485781757', '2016-05-23 08:30:09', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3219', '924185016407', '2016-05-22 02:59:46', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3220', '923455348929', '2016-05-22 02:44:18', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3221', '924185016407', '2016-05-23 08:42:05', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3222', '923455348929', '2016-05-23 08:35:29', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3223', '116774222118', '2016-05-23 04:40:11', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3224', '105832764906', '2016-05-23 00:37:52', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3225', '105832764906', '2016-05-23 08:33:34', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3226', '105832764906', '2016-05-23 10:57:13', '香港 Hongkong', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3227', '105832764906', '2016-05-23 13:32:17', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3228', '924676169836', '2016-05-23 02:21:41', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3229', '667426111058', '2016-05-23 02:22:11', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3230', '667426111058', '2016-05-23 08:35:39', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3231', '924676169836', '2016-05-23 08:35:03', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3232', '116774222118', '2016-05-23 13:16:54', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3233', '922251968854', '2016-05-23 01:43:39', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3234', '923455348231', '2016-05-23 10:10:54', '美国 USA ', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3235', '923455348504', '2016-05-23 12:51:38', '澳大利亚 Australia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3236', '922251968863', '2016-05-23 01:22:07', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3237', '924675374468', '2016-05-23 11:59:23', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3238', '923451185465', '2016-05-23 16:38:11', '日本 Japan', '海关流程 Customs process');
INSERT INTO `jefsky_wuliu` VALUES ('3239', '922533913309', '2016-05-23 14:16:45', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3240', '924809241403', '2016-05-24 02:02:07', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3241', '919485781757', '2016-05-24 08:41:14', '香港 Hongkong', '到达香港，转运中 Arrive Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3242', '923455348929', '2016-05-24 08:32:51', '香港 Hongkong', '到达香港，转运中 Arrive Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3243', '924185016407', '2016-05-24 08:40:50', '香港 Hongkong', '到达香港，转运中 Arrive Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3244', '132617089473', '2016-05-24 04:39:05', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3245', '132617089473', '2016-05-24 08:39:29', '香港 Hongkong', '海关查验 Customs inspection');
INSERT INTO `jefsky_wuliu` VALUES ('3247', '116774222118', '2016-05-23 17:26:08', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3248', '667426111058', '2016-05-24 13:21:34', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3249', '924676169836', '2016-05-24 13:21:59', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3250', '664178944495', '2016-05-24 08:36:27', 'GATWICK - UK', '正在派送Sending agoods');
INSERT INTO `jefsky_wuliu` VALUES ('3251', '667425460780', '2016-05-24 02:41:18', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3252', '667425460780', '2016-05-24 08:52:38', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3253', '664178944495', '2016-05-24 12:36:19', 'ST. ALBANS', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3254', '923455348231', '2016-05-24 09:52:43', '美国 USA ', '第二次派送失败second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3255', '922533913309', '2016-05-24 11:55:59', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3256', '921845463461', '2016-05-24 08:27:49', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3257', '919485781757', '2016-05-24 21:58:50', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3258', '923455348929', '2016-05-24 20:23:31', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3259', '664194432563', '2016-05-25 01:20:19', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3260', '664194432563', '2016-05-25 08:36:39', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3261', '667426111058', '2016-05-25 02:55:36', '马来西亚 Malaysia', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3262', '132617089473', '2016-05-25 12:34:25', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3263', '664194432563', '2016-05-25 13:20:22', '香港 Hongkong', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3264', '922251968854', '2016-05-25 11:33:39', '美国 USA ', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3265', '923455348231', '2016-05-25 09:34:46', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3266', '922251968863', '2016-05-25 11:34:21', '美国 USA ', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3267', '919485781757', '2016-05-25 12:01:29', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('3268', '923455348929', '2016-05-25 10:33:53', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3269', '924185016407', '2016-05-25 17:33:18', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3270', '667426111058', '2016-05-25 20:48:13', '马来西亚 Malaysia', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3271', '924676169836', '2016-05-25 12:49:39', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3272', '471454611192', '2016-05-26 02:57:16', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3273', '471454611192', '2016-05-26 08:36:43', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3274', '662743413938', '2016-05-25 03:18:12', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3275', '662743413938', '2016-05-25 08:50:15', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3276', '664194432563', '2016-05-25 16:27:23', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3277', '132614551883', '2016-05-26 03:08:40', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3278', '132614551883', '2016-05-26 08:32:59', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3279', '924673401135', '2016-05-26 02:09:25', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3280', '924673401135', '2016-05-26 08:39:04', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3281', '132596849965', '2016-05-26 03:21:31', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3282', '132596849965', '2016-05-26 08:36:58', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3283', '919485781739', '2016-05-26 02:11:20', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3284', '919485781739', '2016-05-26 08:38:52', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3285', '922251968854', '2016-05-26 08:36:44', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3286', '923451185465', '2016-05-26 11:48:26', '日本 Japan', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3287', '921845463461', '2016-05-26 10:29:23', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3288', '924185016407', '2016-05-26 11:26:43', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3289', '667426111058', '2016-05-26 12:03:05', '马来西亚 Malaysia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3290', '662743413938', '2016-05-26 09:36:41', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3291', '471454611192', '2016-05-26 18:24:45', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3292', '471454611192', '2016-05-27 02:36:08', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3293', '132596849965', '2016-05-26 17:05:14', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3294', '132596849965', '2016-05-27 07:56:49', '日本 Japan', '到达日本 Arrive  Japan');
INSERT INTO `jefsky_wuliu` VALUES ('3295', '902079034274', '2016-05-27 02:10:18', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3296', '924675202505', '2016-05-27 01:13:13', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3297', '924675202505', '2016-05-27 08:31:40', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3298', '132614551883', '2016-05-27 09:15:25', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3299', '919485781739', '2016-05-27 09:14:52', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3300', '924673401135', '2016-05-27 09:19:25', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3301', '919485781518', '2016-05-27 02:30:34', '东莞DongGuan', '离开东莞Leave for Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3302', '919485781518', '2016-05-27 08:43:56', '深圳ShenZhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3303', '924809241403', '2016-05-27 13:55:30', '德国 Germany', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3304', '924676169836', '2016-05-26 05:23:30', '澳大利亚 Australia', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3306', '471454611192', '2016-05-27 10:54:16', 'CINCINNATI HUB, OH - USA', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3307', '919485781739', '2016-05-28 02:30:35', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3308', '132596849965', '2016-05-28 08:32:55', '日本 Japan', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3309', '132614551883', '2016-05-28 00:26:45', '新加坡 Singapore', '到达新加坡 Arrive  Singapore');
INSERT INTO `jefsky_wuliu` VALUES ('3310', '924673401135', '2016-05-28 03:34:44', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3314', '667425460780', '2016-05-25 09:45:40', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3312', '919485781518', '2016-05-28 09:25:20', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3315', '667425460780', '2016-05-26 15:46:24', ' 越南 Vietnam', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3317', '922543078099', '2016-05-28 02:53:53', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3319', '921845463416', '2016-05-28 02:57:00', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3320', '923455348531', '2016-05-28 02:57:45', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3321', '923451114668', '2016-05-28 02:58:03', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3322', '921839375682', '2016-05-28 02:50:30', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3324', '924809548238', '2016-05-28 02:51:14', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3325', '923454480209', '2016-05-28 02:08:49', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3326', '132618782392', '2016-05-28 02:54:21', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3327', '664178474599', '2016-05-28 02:32:49', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3328', '664178474599', '2016-05-28 08:58:03', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3329', '923451114668', '2016-05-28 08:44:14', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3330', '923455348531', '2016-05-28 08:44:35', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3331', '921845463416', '2016-05-28 08:44:50', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3332', '132618782392', '2016-05-28 08:45:09', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3333', '922543078099', '2016-05-28 08:45:25', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3334', '924809548238', '2016-05-28 08:45:45', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3335', '921839375682', '2016-05-28 08:46:06', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3336', '923454480209', '2016-05-28 08:46:45', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3337', '662743413938', '2016-05-27 15:48:04', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3338', '662743413938', '2016-05-28 09:48:59', '韩国 Korea', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3339', '471454611192', '2016-05-29 10:50:55', 'CINCINNATI HUB, OH - USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3340', '919485781739', '2016-05-28 23:52:08', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3341', '132596849965', '2016-05-28 12:24:33', '日本 Japan', '派送失败，等待下一次派送 Delivery failed, waiting for the next delivery');
INSERT INTO `jefsky_wuliu` VALUES ('3342', '132614551883', '2016-05-29 10:28:44', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3343', '919485781518', '2016-05-29 02:11:48', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3344', '923454480209', '2016-05-28 16:29:47', '香港 Hongkong', '到达香港，转运中 Arrive Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3345', '922543078099', '2016-05-29 09:43:55', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3346', '921845463416', '2016-05-29 09:36:55', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3347', '923455348531', '2016-05-29 09:35:30', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3348', '921839375682', '2016-05-29 09:31:01', '香港 Hongkong', '到达香港，转运中 Arrive Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3349', '921839375682', '2016-05-30 02:59:23', '新加坡 Singapore', '到达新加坡 Arrive  Singapore');
INSERT INTO `jefsky_wuliu` VALUES ('3350', '923451114668', '2016-05-29 09:32:40', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3351', '925487700838', '2016-05-29 02:19:26', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3352', '925487700838', '2016-05-30 08:36:24', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3353', '132596849965', '2016-05-30 10:00:40', '日本 Japan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3354', '924675202505', '2016-05-30 13:16:22', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3355', '132618782392', '2016-05-29 12:20:41', '香港 Hongkong', '到达香港，转运中 Arrive Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3356', '132618782392', '2016-05-30 04:22:25', '新加坡 Singapore', '到达新加坡 Arrive  Singapore');
INSERT INTO `jefsky_wuliu` VALUES ('3357', '923454480209', '2016-05-29 15:36:46', '马来西亚 Malaysia', '到达马来西亚 Arrive Malaysia');
INSERT INTO `jefsky_wuliu` VALUES ('3358', '132618782392', '2016-05-30 09:12:52', '新加坡 Singapore', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3359', '923454480209', '2016-05-30 08:47:55', '马来西亚 Malaysia', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3360', '924809548238', '2016-05-28 23:51:31', '香港 Hongkong', '航班延误 Flight delay');
INSERT INTO `jefsky_wuliu` VALUES ('3361', '924809548238', '2016-05-30 04:52:30', '日本 Japan', '到达日本 Arrive Japan');
INSERT INTO `jefsky_wuliu` VALUES ('3362', '924809548238', '2016-05-30 09:36:03', '日本 Japan', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3363', '471454611192', '2016-05-30 06:41:03', 'ELIZABETH, NJ - USA', '快件已经到达派送作业地点  Express delivery has arrived at the site of operation');
INSERT INTO `jefsky_wuliu` VALUES ('3364', '662743413938', '2016-05-30 18:02:09', '韩国 Korea', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3365', '919485781739', '2016-05-30 09:26:48', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('3367', '924673401135', '2016-05-29 17:55:08', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3368', '919485781518', '2016-05-30 15:56:52', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3369', '664178474599', '2016-05-30 15:37:14', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3370', '922543078099', '2016-05-30 15:17:34', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3371', '921845463416', '2016-05-30 16:24:53', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3372', '923455348531', '2016-05-29 22:44:55', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3373', '921839375682', '2016-05-30 15:27:15', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3374', '923451114668', '2016-05-31 10:20:21', '新西兰 New Zealand', '到达新西兰 Arrive New Zealand');
INSERT INTO `jefsky_wuliu` VALUES ('3375', '925487700838', '2016-05-31 09:10:02', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3376', '924076505427', '2016-05-31 02:50:27', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3377', '925487699982', '2016-05-31 02:51:34', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3378', '925487699982', '2016-05-31 08:51:52', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3379', '924076505427', '2016-05-31 08:52:10', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3380', '902079034274', '2016-05-31 08:44:29', '东莞 Dongguan', '回到东莞 Back to Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3381', '924809241403', '2016-05-31 11:27:15', '德国 Germany', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3382', '471454611192', '2016-05-31 10:55:56', 'SECAUCUS', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3383', '919485781739', '2016-05-31 10:11:37', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3384', '902079034274', '2016-05-31 17:46:42', '东莞 Dongguan', '货物已退回 The goods have been returned');
INSERT INTO `jefsky_wuliu` VALUES ('3385', '924809548238', '2016-05-31 14:36:52', '日本 Japan', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3386', '921845463416', '2016-05-31 02:16:41', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3387', '923451114668', '2016-06-01 00:18:47', '新西兰 New Zealand', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('3388', '925487700838', '2016-06-01 08:19:58', '马来西亚 Malaysia', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3389', '925487699982', '2016-06-01 09:23:53', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3390', '924076505427', '2016-06-01 09:32:10', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3391', '664215270896', '2016-06-01 01:57:35', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3392', '132372836736', '2016-06-01 01:58:55', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3393', '664196978539', '2016-06-01 01:58:32', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3394', '132372836736', '2016-06-01 08:21:54', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3395', '664196978539', '2016-06-01 08:47:16', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3396', '664215270896', '2016-06-01 08:47:36', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3397', '924809548238', '2016-06-01 09:33:31', '日本 Japan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3398', '662743413938', '2016-05-31 18:22:45', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3399', '132372836736', '2016-06-01 15:33:22', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3400', '664196978539', '2016-06-01 15:36:58', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3401', '664215270896', '2016-06-01 15:36:15', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3402', '924673401135', '2016-06-01 13:23:40', '美国 USA ', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3403', '919485781518', '2016-06-01 12:21:24', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('3404', '922543078099', '2016-06-01 07:48:49', '澳大利亚 Australia', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('3405', '922543078099', '2016-06-01 13:43:19', '澳大利亚 Australia', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3406', '922543078099', '2016-06-01 14:02:53', '澳大利亚 Australia', '第二次派送失败second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3407', '921845463416', '2016-06-01 10:35:35', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3408', '923455348531', '2016-06-01 14:08:45', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3409', '923451114668', '2016-06-01 10:58:31', '新西兰 New Zealand', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3410', '925487700838', '2016-06-01 17:31:48', '马来西亚 Malaysia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3411', '925487699982', '2016-06-02 02:13:35', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3412', '924076505427', '2016-06-02 02:36:01', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3417', '132021487358', '2016-06-01 01:30:12', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3414', '922516516525', '2016-06-01 02:46:31', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3415', '922516516525', '2016-06-01 08:46:59', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3416', '922516516525', '2016-06-02 09:26:28', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3418', '132021487358', '2016-06-01 08:49:47', '深圳  Shenzhen', '入机场仓');
INSERT INTO `jefsky_wuliu` VALUES ('3419', '132021487358', '2016-06-01 16:31:15', '深圳  Shenzhen', '因包装不合格，需重新打木箱');
INSERT INTO `jefsky_wuliu` VALUES ('3420', '132021487358', '2016-06-01 20:32:12', '深圳  Shenzhen', '入机场仓');
INSERT INTO `jefsky_wuliu` VALUES ('3421', '132618782392', '2016-06-02 17:41:42', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3422', '924673401135', '2016-06-02 13:12:48', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3423', '919485781518', '2016-06-02 09:49:20', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3424', '925487699982', '2016-06-02 16:39:37', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3425', '924076505427', '2016-06-02 16:48:21', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3426', '922543078099', '2016-06-02 11:47:15', '澳大利亚 Australia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3427', '132021487358', '2016-06-02 17:10:22', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3428', '132021487358', '2016-06-03 05:56:08', '台湾 TAIWAN', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3429', '919485781475', '2016-06-03 02:50:51', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3430', '919485781475', '2016-06-03 08:38:57', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3431', '919485781484', '2016-06-03 02:32:17', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3432', '919485781484', '2016-06-03 08:36:39', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3433', '922253858203', '2016-06-03 02:39:03', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3434', '922253858203', '2016-06-03 08:39:47', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3435', '923454480209', '2016-06-03 20:27:36', '马来西亚 Malaysia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3436', '921845463416', '2016-06-03 12:31:45', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3437', '925487699982', '2016-06-03 09:31:24', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3438', '924076505427', '2016-06-03 12:55:32', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3439', '132021487358', '2016-06-04 00:57:28', '台湾 TAIWAN', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3440', '922516516525', '2016-06-03 12:45:18', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3441', '922253858203', '2016-06-04 09:19:39', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3442', '919485781475', '2016-06-04 09:29:27', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3443', '919485781484', '2016-06-04 09:26:04', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3444', '471470202378', '2016-06-04 03:39:59', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3445', '132339387331', '2016-06-04 03:31:33', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3446', '471470202378', '2016-06-04 08:31:26', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3447', '132339387331', '2016-06-04 08:28:58', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3452', '132021487358', '2016-06-06 00:56:54', '台湾 TAIWAN', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3449', '902102401625', '2016-06-04 04:12:30', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3450', '902102401625', '2016-06-04 08:36:04', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('3453', '919485781484', '2016-06-05 02:58:25', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3454', '922253858203', '2016-06-05 02:00:21', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3455', '919485781475', '2016-06-05 02:11:22', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3456', '902102401625', '2016-06-06 08:31:08', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3457', '471470202378', '2016-06-04 15:16:27', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3458', '931484238430', '2016-06-05 23:21:48', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3459', '931484238430', '2016-06-06 08:22:11', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3460', '922533914288', '2016-06-06 02:18:07', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3461', '922533914288', '2016-06-06 08:44:28', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3462', '132021487358', '2016-06-07 00:41:00', '台湾 TAIWAN', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3463', '132339387331', '2016-06-06 13:18:53', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3464', '902102401625', '2016-06-06 17:54:12', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3465', '931484238430', '2016-06-06 17:18:25', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3466', '132571497046', '2016-06-07 04:54:21', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3467', '664196158598', '2016-06-07 04:51:50', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3468', '664196158598', '2016-06-07 08:40:13', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3469', '664196158598', '2016-06-07 14:27:24', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3470', '132571497046', '2016-06-07 08:27:47', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3471', '132571497046', '2016-06-07 14:20:04', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3472', '924676169836', '2016-06-07 12:31:35', '澳大利亚 Australia', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3473', '132021487358', '2016-06-08 00:37:37', '台湾 TAIWAN', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3474', '919485781484', '2016-06-07 12:16:37', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3475', '919485781475', '2016-06-07 12:23:20', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3476', '902102401625', '2016-06-07 02:38:42', 'CINCINNATI HUB, OH - USA', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3477', '902102401625', '2016-06-07 14:27:01', 'SMYRNA, GA - USA', '由于收件人不在暂时无法派送 Because the recipient is not in the destination temporarily unable to delivery');
INSERT INTO `jefsky_wuliu` VALUES ('3478', '922533914288', '2016-06-07 13:32:17', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3479', '953005702531', '2016-06-08 03:49:21', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3480', '953005702531', '2016-06-08 08:34:50', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3481', '662741598378', '2016-06-08 02:05:11', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3482', '662741598378', '2016-06-08 09:40:33', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3483', '921845467636', '2016-06-08 02:07:34', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3484', '662741703578', '2016-06-08 02:07:59', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3485', '662741703578', '2016-06-08 08:36:26', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3486', '921845467636', '2016-06-08 08:27:50', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3487', '953005702531', '2016-06-08 16:57:13', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3488', '924676169836', '2016-06-08 12:37:49', '澳大利亚 Australia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3489', '924809241403', '2016-06-09 14:34:16', '德国 Germany', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3490', '132021487358', '2016-06-10 01:38:21', '台湾 TAIWAN', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3491', '922253858203', '2016-06-08 14:20:44', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3492', '902102401625', '2016-06-08 14:48:59', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3493', '922533914288', '2016-06-08 20:51:47', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3494', '922533914288', '2016-06-08 20:51:47', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3495', '662741703578', '2016-06-09 17:57:03', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3496', '921845467636', '2016-06-09 14:58:13', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3497', '132623240220', '2016-06-09 05:21:36', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3498', '132623240220', '2016-06-10 08:36:57', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3499', '921845467636', '2016-06-10 03:02:52', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3500', '925494823690', '2016-06-10 02:25:08', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3501', '919485781448', '2016-06-10 02:17:51', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3502', '919485781420', '2016-06-10 02:18:08', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3503', '919485781411', '2016-06-10 02:18:24', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3504', '919485781439', '2016-06-10 02:18:51', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3505', '925494823690', '2016-06-10 08:43:14', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3506', '919485781439', '2016-06-10 08:46:34', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3507', '919485781411', '2016-06-10 08:56:53', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3508', '919485781420', '2016-06-10 08:54:14', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3509', '919485781448', '2016-06-10 08:52:31', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3510', '132623240220', '2016-06-10 17:24:31', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3511', '132021487358', '2016-06-11 01:44:31', '台湾 TAIWAN', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3512', '922253858203', '2016-06-10 02:56:08', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('3513', '922533914288', '2016-06-10 10:32:21', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3514', '662741703578', '2016-06-10 13:57:56', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3515', '921845467636', '2016-06-10 16:47:02', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3516', '919485781411', '2016-06-11 09:05:13', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3517', '919485781420', '2016-06-11 09:03:53', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3518', '919485781448', '2016-06-11 09:02:09', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3519', '919485781439', '2016-06-11 09:05:26', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3520', '925494823690', '2016-06-11 09:03:47', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3521', '924809241403', '2016-06-10 11:15:03', '德国 Germany', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3522', '132596848572', '2016-06-11 02:28:09', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3523', '924183021429', '2016-06-11 02:21:16', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3524', '923455348983', '2016-06-11 02:21:31', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3525', '923455349184', '2016-06-11 02:21:48', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3526', '923455349184', '2016-06-11 09:32:31', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3527', '924183021429', '2016-06-11 09:32:47', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3528', '923455348983', '2016-06-11 09:33:11', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3529', '922253858203', '2016-06-10 10:53:44', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3530', '921845467636', '2016-06-11 11:10:17', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3531', '919485781448', '2016-06-12 02:14:22', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3532', '925494823690', '2016-06-12 02:14:44', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3533', '919485781420', '2016-06-12 02:15:01', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3534', '919485781411', '2016-06-12 02:15:14', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3535', '919485781439', '2016-06-12 02:15:30', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3536', '919485781411', '2016-06-12 18:07:07', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3537', '919485781439', '2016-06-12 16:09:49', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3538', '919485781448', '2016-06-12 17:11:42', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3539', '922541314269', '2016-06-13 02:31:19', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3540', '924806520888', '2016-06-13 02:38:23', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3559', '919485781420', '2016-06-13 01:07:00', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3542', '923455349333', '2016-06-13 02:40:00', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3543', '923455348498', '2016-06-13 02:40:16', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3544', '919485781397', '2016-06-13 02:40:34', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3545', '919485781388', '2016-06-13 02:40:50', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3546', '132207074008', '2016-06-13 02:42:37', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3547', '919485781388', '2016-06-13 08:38:23', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3548', '919485781397', '2016-06-13 08:44:48', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3549', '923455348498', '2016-06-13 08:45:12', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3550', '923455349333', '2016-06-13 08:45:33', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3558', '132021487358', '2016-06-14 06:57:44', '台湾 TAIWAN', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3552', '922541314269', '2016-06-13 08:46:14', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3553', '924806520888', '2016-06-13 08:46:31', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3554', '923455349184', '2016-06-12 09:39:04', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3555', '923455348983', '2016-06-12 09:56:34', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3556', '924183021429', '2016-06-12 09:38:02', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3557', '132207074008', '2016-06-13 09:43:32', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3560', '925494823690', '2016-06-13 01:10:57', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3561', '923455349184', '2016-06-13 02:18:16', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3562', '923455348983', '2016-06-13 02:20:38', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3563', '924183021429', '2016-06-13 02:21:53', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3564', '902054706045', '2016-06-14 02:26:25', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3565', '471455558279', '2016-06-14 05:27:25', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3566', '113161039272', '2016-06-14 01:36:41', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3567', '113161039272', '2016-06-14 08:37:17', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3568', '471455558279', '2016-06-14 09:27:42', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3569', '132207074008', '2016-06-13 17:40:46', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3570', '922541314269', '2016-06-14 09:29:12', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3571', '923455349333', '2016-06-14 09:31:08', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3572', '923455348498', '2016-06-14 09:29:11', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3573', '919485781397', '2016-06-14 09:35:35', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3574', '919485781388', '2016-06-14 09:27:02', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3575', '902054706045', '2016-06-14 08:44:21', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3576', '113161039272', '2016-06-14 10:43:49', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3577', '132596848572', '2016-06-11 08:40:00', '深圳  Shenzhen', '入机场仓 Into the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('3578', '132596848572', '2016-06-12 08:43:23', '深圳  Shenzhen', '因包装纸箱过软，退货 As a result of the packing box is too soft, the goods return');
INSERT INTO `jefsky_wuliu` VALUES ('3579', '132596848572', '2016-06-13 09:53:22', '深圳  Shenzhen', '重新更换包装 Replace the packaging');
INSERT INTO `jefsky_wuliu` VALUES ('3580', '132596848572', '2016-06-13 09:53:22', '深圳  Shenzhen', '重新更换包装 Replace the packaging');
INSERT INTO `jefsky_wuliu` VALUES ('3581', '132596848572', '2016-06-13 14:56:09', '深圳  Shenzhen', '入机场仓 Into the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('3582', '662741598378', '2016-06-08 17:24:38', '深圳  Shenzhen', '入机场仓 Into the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('3583', '662741598378', '2016-06-09 11:25:13', '台湾 TAIWAN', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3584', '662741598378', '2016-06-13 11:25:56', '台湾 TAIWAN', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3585', '662741598378', '2016-06-14 16:17:50', '台湾 TAIWAN', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3586', '132021487358', '2016-06-14 17:12:04', '台湾 TAIWAN', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3587', '132021487358', '2016-06-15 08:36:06', '台湾 TAIWAN', '到达作业地点 Arrive at work place');
INSERT INTO `jefsky_wuliu` VALUES ('3588', '919485781411', '2016-06-14 10:42:36', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3589', '919485781439', '2016-06-14 11:10:52', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3590', '925494823690', '2016-06-14 03:19:32', '法国 France', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3591', '925494823690', '2016-06-14 09:11:10', '法国 France', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3592', '132596848572', '2016-06-14 17:53:46', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3593', '132596848572', '2016-06-15 02:33:15', '日本 Japan', '到达日本 Arrive  Japan');
INSERT INTO `jefsky_wuliu` VALUES ('3594', '919485781397', '2016-06-15 02:02:25', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3595', '923455349333', '2016-06-15 02:02:43', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3596', '922541314269', '2016-06-15 02:03:56', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3597', '923455348498', '2016-06-15 02:04:22', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3598', '919485781388', '2016-06-15 02:04:49', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3599', '471455558279', '2016-06-14 17:45:49', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3600', '902054706045', '2016-06-15 09:20:26', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3601', '5262767729', '2016-06-15 02:14:15', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3602', '5262767729', '2016-06-15 08:37:36', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3603', '924678077808', '2016-06-15 02:46:39', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3604', '924678077808', '2016-06-15 08:46:58', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3605', '925501247027', '2016-06-15 02:26:43', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3606', '925501247027', '2016-06-15 08:42:05', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3607', '132021487358', '2016-06-15 10:34:26', '台湾 TAIWAN', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3608', '113161039290', '2016-06-16 01:18:10', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3609', '113161039290', '2016-06-16 08:11:55', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3610', '113161039290', '2016-06-16 08:38:24', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('3611', '919485781448', '2016-06-15 10:11:11', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3612', '919485781420', '2016-06-14 05:44:20', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3613', '919485781420', '2016-06-15 10:44:42', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3614', '132596848572', '2016-06-15 14:56:25', '日本 Japan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3615', '923455349184', '2016-06-14 22:49:20', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3616', '923455349184', '2016-06-15 22:15:49', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3617', '923455348983', '2016-06-14 05:51:27', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3618', '923455348983', '2016-06-15 11:53:53', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3619', '924183021429', '2016-06-15 15:53:32', '韩国 Korea', '到达韩国 Arrive Korea');
INSERT INTO `jefsky_wuliu` VALUES ('3620', '924183021429', '2016-06-16 09:38:45', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3621', '924678077678', '2016-06-16 02:55:03', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3622', '920295388050', '2016-06-16 02:55:23', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3623', '902054706045', '2016-06-15 15:11:56', '新加坡 Singapore', '到达新加坡 Arrive  Singapore');
INSERT INTO `jefsky_wuliu` VALUES ('3624', '902054706045', '2016-06-16 03:12:34', '新加坡 Singapore', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3625', '924678077808', '2016-06-16 09:34:40', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3626', '925501247027', '2016-06-16 09:38:19', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3627', '5262767729', '2016-06-16 09:42:56', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3628', '5262767733', '2016-06-16 02:04:26', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3629', '5262767733', '2016-06-16 08:45:51', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3630', '113161039290', '2016-06-16 17:46:15', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3631', '919485781402', '2016-06-16 02:48:06', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3632', '924678077817', '2016-06-16 02:48:28', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3633', '952068897146', '2016-06-17 03:25:22', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3634', '952068897146', '2016-06-17 08:01:48', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3635', '952068897146', '2016-06-17 08:29:13', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('3636', '922533914321', '2016-06-16 02:51:00', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3637', '920295388050', '2016-06-16 08:51:44', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3638', '924678077678', '2016-06-16 08:52:06', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3639', '922533914321', '2016-06-16 08:52:41', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3640', '924678077817', '2016-06-16 08:53:10', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3641', '919485781402', '2016-06-16 08:53:33', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3642', '919485781397', '2016-06-16 13:05:28', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3643', '923455348498', '2016-06-16 10:43:29', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3644', '923455349333', '2016-06-16 10:44:26', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3645', '922541314269', '2016-06-15 22:37:20', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3648', '924678077808', '2016-06-17 02:15:58', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3647', '925501247027', '2016-06-17 02:15:29', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3649', '924806520888', '2016-06-17 08:32:01', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3650', '922533914321', '2016-06-17 09:21:25', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3651', '920295388050', '2016-06-17 09:22:56', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3652', '924678077678', '2016-06-17 09:17:20', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3653', '924678077817', '2016-06-17 09:22:47', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3654', '919485781402', '2016-06-17 09:23:18', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3655', '5262767729', '2016-06-16 19:33:11', '马来西亚 Malaysia', '到达马来西亚 Arrive Malaysia');
INSERT INTO `jefsky_wuliu` VALUES ('3656', '5262767729', '2016-06-17 04:30:00', '马来西亚 Malaysia', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3657', '919485781720', '2016-06-17 03:36:06', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3658', '923455221299', '2016-06-17 02:36:36', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3659', '919485781720', '2016-06-17 08:27:37', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3660', '923455221299', '2016-06-17 08:29:54', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3661', '952068897146', '2016-06-17 16:24:32', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3662', '902054706045', '2016-06-16 18:27:55', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3663', '5262767733', '2016-06-17 15:32:49', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3664', '923455349184', '2016-06-17 11:46:20', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3665', '924806520888', '2016-06-18 07:11:28', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3666', '919485781397', '2016-06-17 12:34:08', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('3667', '923455348498', '2016-06-17 11:47:50', '美国 USA ', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3668', '923455349333', '2016-06-17 10:47:36', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3669', '922541314269', '2016-06-17 12:19:27', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3670', '919485781388', '2016-06-16 10:14:07', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3671', '919485781388', '2016-06-17 13:57:38', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3672', '922533914321', '2016-06-18 02:32:55', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3673', '920295388050', '2016-06-18 02:37:50', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3674', '924678077678', '2016-06-18 02:38:19', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3675', '924678077817', '2016-06-18 02:38:46', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3676', '919485781402', '2016-06-18 02:39:07', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3677', '923455221299', '2016-06-18 09:43:01', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3678', '919485781720', '2016-06-18 09:44:23', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3679', '924928726966', '2016-06-18 02:44:39', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3680', '924928726957', '2016-06-18 02:45:54', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3681', '924928727006', '2016-06-18 02:47:46', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3682', '924928726975', '2016-06-18 02:48:01', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3683', '924928726993', '2016-06-18 02:48:19', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3684', '924675264553', '2016-06-18 02:48:39', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3685', '953006568036', '2016-06-18 02:49:04', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3686', '953005707030', '2016-06-18 03:14:33', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3687', '953005707030', '2016-06-18 08:04:05', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3688', '953005707030', '2016-06-18 08:36:32', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('3689', '924806520888', '2016-06-18 07:15:03', 'LEIPZIG - GERMANY', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3690', '919485781397', '2016-06-18 09:01:58', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3691', '923455348498', '2016-06-18 12:03:27', '美国 USA ', '第二次派送失败second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3692', '924678077808', '2016-06-18 08:04:40', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3693', '925501247027', '2016-06-18 08:54:34', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3694', '923455221299', '2016-06-19 02:08:39', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3695', '919485781720', '2016-06-19 02:09:03', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3696', '5262767733', '2016-06-18 17:10:36', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3697', '953006568036', '2016-06-18 09:22:21', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('3698', '924675264553', '2016-06-18 08:37:31', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('3699', '924928726993', '2016-06-18 08:38:02', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('3700', '924928726975', '2016-06-18 08:38:39', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('3701', '924928727006', '2016-06-18 08:39:03', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('3702', '924928726957', '2016-06-18 08:39:23', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('3703', '924928726966', '2016-06-18 08:39:47', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('3704', '924928948881', '2016-06-19 02:45:22', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3705', '923455348498', '2016-06-19 14:51:19', '美国 USA ', '第三次派送失败，等待收件人联系当地EMS Third delivery failure，Waiting for the recipient to contact the local EMS');
INSERT INTO `jefsky_wuliu` VALUES ('3706', '922533914321', '2016-06-19 02:56:01', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3707', '920295388050', '2016-06-19 01:56:50', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3708', '924678077678', '2016-06-18 23:57:47', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3709', '924678077817', '2016-06-18 23:58:38', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3710', '919485781402', '2016-06-18 23:59:26', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3711', '923455221299', '2016-06-20 06:57:28', '新加坡 Singapore', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3712', '924809862747', '2016-06-19 04:39:45', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3713', '924809862747', '2016-06-19 10:40:25', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('3714', '924809862747', '2016-06-20 08:40:58', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3715', '924928726993', '2016-06-19 09:43:25', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3716', '924928726975', '2016-06-19 09:43:51', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3717', '924928727006', '2016-06-19 09:44:12', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3718', '924928726957', '2016-06-19 09:44:51', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3719', '924928726966', '2016-06-19 09:46:29', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3720', '924928948881', '2016-06-19 08:39:44', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('3721', '924928948881', '2016-06-19 12:25:05', '深圳  Shenzhen', '入机场仓 Into the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('3728', '924928948881', '2016-06-19 14:21:38', '深圳  Shenzhen', '等待航班 Waiting for flights');
INSERT INTO `jefsky_wuliu` VALUES ('3725', '953005707030', '2016-06-18 14:44:53', '香港 Hongkong', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3724', '5262767729', '2016-06-20 02:39:09', '马来西亚 Malaysia', '等待收件人支付关税 Waiting for the recipient to pay the tariff');
INSERT INTO `jefsky_wuliu` VALUES ('3727', '953005707030', '2016-06-18 17:46:44', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3729', '924928948881', '2016-06-19 21:39:00', '深圳  Shenzhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3730', '924928948881', '2016-06-20 04:23:19', '台湾 TAIWAN', '到达台湾 Arrive in Taiwan');
INSERT INTO `jefsky_wuliu` VALUES ('3731', '924928948881', '2016-06-20 08:24:00', '台湾 TAIWAN', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3732', '924928948881', '2016-06-20 12:24:51', '台湾 TAIWAN', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3733', '5262767733', '2016-06-19 10:45:45', '阿联酋 UAE', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3734', '924806520888', '2016-06-20 09:19:00', 'OFFENBACH AM MAIN', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3735', '923455348498', '2016-06-20 10:55:26', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3736', '924678077808', '2016-06-20 13:14:35', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3737', '925501247027', '2016-06-20 12:36:46', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3738', '924678077678', '2016-06-20 15:44:53', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3739', '924678077817', '2016-06-20 14:15:56', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3740', '919485781402', '2016-06-20 13:41:40', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3741', '923455221299', '2016-06-21 11:42:48', '新加坡 Singapore', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3742', '923455221299', '2016-06-20 13:30:14', '新加坡 Singapore', '第二次派送失败second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3743', '919485781720', '2016-06-20 01:01:50', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3744', '953006568036', '2016-06-19 08:20:00', '日本 Japan', '到达日本 Arrive  Japan');
INSERT INTO `jefsky_wuliu` VALUES ('3745', '953006568036', '2016-06-20 08:30:09', '日本 Japan', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3746', '953006568036', '2016-06-20 16:17:03', '日本 Japan', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3747', '953006568036', '2016-06-21 07:55:31', '日本 Japan', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3748', '924928726993', '2016-06-20 03:08:47', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3749', '924928726975', '2016-06-20 03:09:11', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3750', '924928727006', '2016-06-20 03:10:19', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3751', '924928726957', '2016-06-20 03:11:37', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3752', '924928726966', '2016-06-20 03:13:40', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3753', '924675264553', '2016-06-20 08:27:14', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3754', '924675264553', '2016-06-20 15:19:39', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3755', '924809862747', '2016-06-20 15:22:40', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3756', '924928948881', '2016-06-20 15:28:13', '台湾 TAIWAN', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3757', '924928948881', '2016-06-20 17:24:47', '台湾 TAIWAN', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3758', '662741598369', '2016-06-21 02:58:45', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3759', '925328360233', '2016-06-21 02:59:28', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3760', '925328360233', '2016-06-21 08:00:11', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3761', '925328360233', '2016-06-21 08:36:26', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('3762', '662741598369', '2016-06-21 08:24:58', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('3763', '471163682897', '2016-06-21 03:03:39', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3764', '471163682897', '2016-06-21 08:04:09', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3765', '471163682897', '2016-06-21 08:30:50', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('3766', '471163682897', '2016-06-21 12:05:24', '香港 Hongkong', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3767', '925328360233', '2016-06-21 13:06:17', '香港 Hongkong', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3768', '953006568036', '2016-06-21 10:27:35', '日本 Japan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3769', '919485781193', '2016-06-21 02:38:24', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3770', '919485781193', '2016-06-21 08:38:53', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3771', '922533914349', '2016-06-21 02:39:13', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3772', '925328872110', '2016-06-21 02:39:29', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3773', '919485781157', '2016-06-21 02:39:45', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3774', '919485781166', '2016-06-21 02:40:09', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3775', '925328710514', '2016-06-21 02:41:18', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3776', '904032810750', '2016-06-21 02:41:38', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3777', '904032810750', '2016-06-21 08:42:20', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3778', '925328710514', '2016-06-21 08:43:16', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3779', '919485781166', '2016-06-21 08:43:32', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3780', '919485781157', '2016-06-21 08:43:56', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3781', '925328872110', '2016-06-21 08:46:35', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3782', '922533914349', '2016-06-21 08:47:10', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3783', '922533914321', '2016-06-20 16:40:26', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3784', '922533914321', '2016-06-21 14:50:14', '美国 USA ', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3785', '920295388050', '2016-06-21 06:42:15', '澳大利亚 Australia', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('3786', '920295388050', '2016-06-21 14:35:53', '澳大利亚 Australia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3787', '924678077678', '2016-06-21 11:40:07', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3788', '924678077817', '2016-06-21 11:39:59', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3789', '919485781402', '2016-06-21 11:52:54', '美国 USA ', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3790', '923455221299', '2016-06-21 12:22:19', '新加坡 Singapore', '第三次派送失败，等待收件人联系当地EMS Third delivery failure，Waiting for the recipient to contact the local EMS');
INSERT INTO `jefsky_wuliu` VALUES ('3791', '919485781720', '2016-06-21 11:54:08', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3792', '924675264553', '2016-06-21 09:33:29', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3793', '924675264553', '2016-06-22 05:34:06', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3794', '924809862747', '2016-06-21 14:51:46', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3795', '924809862747', '2016-06-22 00:27:43', '韩国 Korea', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3796', '924928726957', '2016-06-20 19:40:18', '韩国 Korea', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3797', '924928726957', '2016-06-22 10:41:36', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3798', '924928726993', '2016-06-20 19:43:19', '韩国 Korea', '到达韩国 Arrive Korea');
INSERT INTO `jefsky_wuliu` VALUES ('3799', '924928726975', '2016-06-20 19:43:46', '韩国 Korea', '到达韩国 Arrive Korea');
INSERT INTO `jefsky_wuliu` VALUES ('3800', '924928727006', '2016-06-20 19:44:15', '韩国 Korea', '到达韩国 Arrive Korea');
INSERT INTO `jefsky_wuliu` VALUES ('3801', '924928726966', '2016-06-20 19:44:40', '韩国 Korea', '到达韩国 Arrive Korea');
INSERT INTO `jefsky_wuliu` VALUES ('3802', '662741598369', '2016-06-21 12:45:45', '深圳  Shenzhen', '入机场仓 Into the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('3803', '662741598369', '2016-06-21 15:46:20', '深圳  Shenzhen', '等待航班 Waiting for flights');
INSERT INTO `jefsky_wuliu` VALUES ('3804', '662741598369', '2016-06-21 19:47:57', '深圳  Shenzhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3805', '662741598369', '2016-06-22 04:48:45', '台湾 TAIWAN', '到达台湾 Arrive in Taiwan');
INSERT INTO `jefsky_wuliu` VALUES ('3806', '662741598369', '2016-06-22 08:31:09', '台湾 TAIWAN', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3807', '925328360233', '2016-06-21 14:49:06', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3808', '471163682897', '2016-06-21 15:32:41', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3809', '922533914349', '2016-06-22 09:10:24', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3810', '919485781193', '2016-06-22 09:12:15', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3811', '904032810750', '2016-06-22 09:12:36', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3812', '925328710514', '2016-06-22 09:13:01', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3813', '919485781166', '2016-06-22 09:13:33', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3814', '919485781157', '2016-06-22 09:13:59', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3815', '925328872110', '2016-06-22 09:14:20', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3816', '667424982486', '2016-06-21 23:17:45', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3817', '113161039315', '2016-06-21 23:18:47', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3818', '113161039315', '2016-06-22 08:00:35', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3819', '113161039315', '2016-06-22 08:21:07', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('3820', '667424982486', '2016-06-22 08:01:39', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3821', '667424982486', '2016-06-22 08:21:10', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('3822', '5262767729', '2016-06-21 12:34:20', '马来西亚 Malaysia', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3823', '132207074008', '', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3824', '902102401616', '2016-06-22 02:07:11', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3825', '902102401616', '2016-06-22 08:24:46', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3826', '664196855522', '2016-06-23 03:49:37', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3827', '5262767733', '2016-06-21 15:50:29', '阿联酋 UAE', '收件人联系电话无人接听，等待下次派送 The recipient phone no answer, waiting for the next delivery');
INSERT INTO `jefsky_wuliu` VALUES ('3828', '5262767733', '2016-06-22 14:31:00', '阿联酋 UAE', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3829', '922533914321', '2016-06-22 12:08:28', '美国 USA ', '第二次派送失败second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3830', '919485781402', '2016-06-22 10:11:20', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3831', '924928726993', '2016-06-22 11:19:28', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3832', '924928726975', '2016-06-22 12:28:48', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3833', '924928727006', '2016-06-22 13:58:39', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3834', '924928726966', '2016-06-22 18:51:52', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3835', '924675264553', '2016-06-22 22:35:13', 'LEIPZIG - GERMANY', '快件到达中转中心 LEIPZIG - GERMANY');
INSERT INTO `jefsky_wuliu` VALUES ('3836', '924809862747', '2016-06-22 21:38:50', '韩国 Korea', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3837', '924809862747', '2016-06-23 09:34:45', '韩国 Korea', '快件已经到达派送作业地点  Express delivery has arrived at the site of operation');
INSERT INTO `jefsky_wuliu` VALUES ('3838', '667424982486', '2016-06-22 17:26:54', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3839', '113161039315', '2016-06-22 17:14:05', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3840', '664196855522', '2016-06-23 08:01:36', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3841', '664196855522', '2016-06-23 08:20:57', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('3842', '664196855522', '2016-06-23 09:33:20', '香港 Hongkong', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3843', '662741703569', '2016-06-23 03:54:54', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3844', '662741703569', '2016-06-23 08:38:14', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3845', '902102401616', '2016-06-23 09:04:04', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3847', '919485781193', '2016-06-23 02:16:56', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3848', '904032810750', '2016-06-23 02:17:15', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3849', '925328710514', '2016-06-23 02:18:31', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3850', '919485781166', '2016-06-23 02:20:42', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3851', '919485781157', '2016-06-23 02:21:06', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3852', '925328872110', '2016-06-23 02:21:35', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3853', '662741598369', '2016-06-23 09:34:44', '台湾 TAIWAN', '派送失败，等待下一次派送 Delivery failed, waiting for the next delivery');
INSERT INTO `jefsky_wuliu` VALUES ('3854', '924809862747', '2016-06-23 13:59:45', '韩国 Korea', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3855', '924809862747', '2016-06-23 17:09:48', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3856', '924675264553', '2016-06-23 16:28:57', '德国 Germany', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3857', '664196855522', '2016-06-23 12:21:11', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3858', '919485781166', '2016-06-23 11:42:14', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3859', '919485781157', '2016-06-23 12:42:55', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3860', '925328872110', '2016-06-23 11:46:38', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3861', '925328710514', '2016-06-23 15:47:23', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3862', '922533914349', '2016-06-23 11:49:02', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3863', '919485781193', '2016-06-23 15:49:24', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3864', '902102401616', '2016-06-24 05:50:17', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3865', '132480383483', '2016-06-24 03:59:41', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3866', '132480383483', '2016-06-24 08:00:00', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3867', '132480383483', '2016-06-24 08:23:25', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('3868', '132480383483', '2016-06-24 10:00:43', '香港 Hongkong', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3897', '924185186070', '2016-06-24 09:33:42', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3896', '924185186070', '2016-06-24 03:18:52', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3871', '924674674364', '2016-06-24 04:01:56', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3872', '662741703569', '2016-06-24 10:38:35', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3873', '922533914321', '2016-06-23 14:58:21', '美国 USA ', '第三次派送失败，等待收件人联系当地EMS Third delivery failure，Waiting for the recipient to contact the local EMS');
INSERT INTO `jefsky_wuliu` VALUES ('3874', '132480383483', '2016-06-24 14:57:20', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3875', '5262767751', '2016-06-24 12:13:47', '深圳  Shenzhen', '入机场仓 Into the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('3876', '5262767751', '2016-06-24 16:14:20', '深圳  Shenzhen', '等待航班 Waiting for flights');
INSERT INTO `jefsky_wuliu` VALUES ('3877', '925512580804', '2016-06-25 03:34:37', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3878', '925512580804', '2016-06-25 08:34:55', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('3879', '923455221299', '2016-06-24 21:08:02', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3880', '925328872110', '2016-06-24 06:56:07', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('3881', '922533914349', '2016-06-24 10:46:40', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3882', '919485781193', '2016-06-24 10:57:23', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3883', '5262767751', '2016-06-24 19:12:07', '深圳  Shenzhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3884', '5262767751', '2016-06-25 04:12:37', '台湾 TAIWAN', '到达台湾 Arrive in Taiwan');
INSERT INTO `jefsky_wuliu` VALUES ('3885', '5262767751', '2016-06-25 08:38:04', '台湾 TAIWAN', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3886', '662741598369', '2016-06-23 15:13:17', '台湾 TAIWAN', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3887', '919485781166', '2016-06-25 13:56:36', '美国 USA ', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3888', '919485781166', '2016-06-26 15:05:09', '美国 USA ', '第二次派送失败second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3889', '919485781157', '2016-06-25 11:07:43', '美国 USA ', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3890', '919485781157', '2016-06-26 17:36:05', '美国 USA ', '第二次派送失败second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3891', '904032810750', '2016-06-25 06:50:07', '英国 UK', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('3892', '922533914349', '2016-06-25 11:12:24', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3893', '919485781193', '2016-06-25 11:25:31', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3894', '662741703569', '2016-06-25 11:15:32', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3895', '662741703569', '2016-06-26 02:16:07', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3898', '924185186070', '2016-06-25 12:22:03', '香港 Hongkong', '到达香港，转运中 Arrive Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3899', '924185186070', '2016-06-26 10:45:16', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('3900', '116774243303', '2016-06-27 01:55:11', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3901', '116774243303', '2016-06-27 08:00:18', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3902', '116774243303', '2016-06-27 08:36:05', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('3903', '925512580804', '2016-06-26 14:37:29', '日本 Japan', '到达日本 Arrive  Japan');
INSERT INTO `jefsky_wuliu` VALUES ('3904', '132207074035', '2016-06-27 03:39:19', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3905', '132207074035', '2016-06-27 08:00:45', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3906', '132207074035', '2016-06-27 08:33:04', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('3907', '5262767751', '2016-06-25 17:52:35', '台湾 TAIWAN', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3908', '925512580804', '2016-06-27 13:49:39', '日本 Japan', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3909', '925512580804', '2016-06-28 10:26:17', '日本 Japan', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3910', '5262767729', '2016-06-28 07:52:31', '马来西亚 Malaysia', '等待派送中 Wait for delivery');
INSERT INTO `jefsky_wuliu` VALUES ('3911', '919485781166', '2016-06-27 14:45:16', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3912', '919485781157', '2016-06-27 14:49:58', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3913', '925328710514', '2016-06-28 07:36:39', '澳大利亚 Australia', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('3914', '904032810750', '2016-06-27 10:43:34', '英国 UK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3915', '662741703569', '2016-06-27 22:57:34', '英国 UK', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('3916', '924674674364', '2016-06-28 09:46:47', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3917', '116774243303', '2016-06-27 17:08:15', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3918', '132207074035', '2016-06-27 15:51:11', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3919', '132202740208', '2016-06-29 03:05:00', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3920', '667424982495', '2016-06-29 03:05:17', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3921', '922540359096', '2016-06-29 03:05:36', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3922', '667424982495', '2016-06-29 08:00:00', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3923', '132202740208', '2016-06-29 08:00:17', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3924', '132202740208', '2016-06-29 08:21:38', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('3925', '667424982495', '2016-06-29 08:25:06', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('3926', '925328872110', '2016-06-28 13:14:32', '美国 USA ', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('3927', '662741703569', '2016-06-28 10:36:04', '英国 UK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3928', '924185186070', '2016-06-28 11:18:46', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('3929', '924674674364', '2016-06-29 09:18:45', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3930', '5262767729', '2016-06-29 15:51:42', '马来西亚Malaysia', '派送并签收Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('3931', '132132812232', '2016-06-29 21:36:43', '东莞 Dongguan', '货物中转中 The goods in transit');
INSERT INTO `jefsky_wuliu` VALUES ('3932', '952086125570', '2016-06-29 21:37:44', '东莞 Dongguan', '货物中转中 The goods in transit');
INSERT INTO `jefsky_wuliu` VALUES ('3933', '664196978557', '2016-06-29 21:39:37', '东莞 Dongguan', '货物中转中 The goods in transit');
INSERT INTO `jefsky_wuliu` VALUES ('3934', '132132812232', '2016-06-30 05:16:58', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('3935', '132132812232', '2016-06-30 08:26:39', '深圳shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3936', '664196978557', '2016-06-30 05:27:54', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('3937', '664196978557', '2016-06-30 08:28:39', '深圳shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3938', '953006565943', '2016-06-30 07:13:17', '东莞dongguan', '离开东莞，运转中Leave Dongguan, operation');
INSERT INTO `jefsky_wuliu` VALUES ('3939', '953006565943', '2016-06-30 08:22:16', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3940', '952086125570', '2016-06-30 08:26:08', '深圳shenzhen', '出口申报中Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('3941', '664196978557', '2016-06-30 12:31:03', '香港 HONG KONG', '海关放行Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3942', '132132812232', '2016-06-30 12:31:43', '香港Hongkong', '海关放行Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3943', '88832940545', '2016-06-30 07:08:09', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3944', '952086125570', '2016-06-30 08:53:31', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3945', '88832940545', '2016-06-30 08:43:23', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3946', '924678139562', '2016-07-01 02:46:51', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3947', '953006565943', '2016-07-01 02:17:28', '深圳  Shenzhen', '等待航班 Waiting for flights');
INSERT INTO `jefsky_wuliu` VALUES ('3948', '664196978557', '2016-06-30 05:18:55', '香港HONG KONG', '派送并签收Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('3949', '132132812232', '2016-06-30 05:37:39', '香港HONG KONG', '派送并签收Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('3950', '952086125570', '2016-06-30 23:59:35', '深圳  Shenzhen', '中转至目的地中Transfer to a destination');
INSERT INTO `jefsky_wuliu` VALUES ('3951', '952086125570', '2016-07-01 07:25:33', '新加坡 Singapore', '航班到达Flight arrival');
INSERT INTO `jefsky_wuliu` VALUES ('3952', '952086125570', '2016-07-01 09:19:36', '新加坡 Singapore', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3953', '922540359096', '2016-06-30 10:28:46', '珠海Zhuhai', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3954', '922540359096', '2016-06-30 15:30:34', '澳门Macao', '派送并签收Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('3955', '132202740208', '2016-06-29 13:42:29', '香港HONG KONG', '派送并签收');
INSERT INTO `jefsky_wuliu` VALUES ('3956', '667424982495', '2016-06-29 14:35:25', '香港HONG KONG', '派送并签收');
INSERT INTO `jefsky_wuliu` VALUES ('3957', '953007566336', '2016-06-30 03:41:38', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3958', '953007566336', '2016-06-30 08:42:24', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3959', '953007566336', '2016-07-01 08:55:17', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3960', '924678139562', '2016-07-01 08:47:18', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3961', '88832940545', '2016-06-30 17:49:55', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3962', '88832940545', '2016-07-01 02:50:35', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('3963', '922533914321', '2016-06-29 13:25:05', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3964', '925328710514', '2016-06-30 14:57:18', '澳大利亚 Australia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3965', '925328872110', '2016-06-29 16:57:24', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3966', '902102401616', '2016-06-25 12:30:13', '韩国 Korea', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3967', '902102401616', '2016-06-29 16:31:13', '韩国 Korea', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3968', '924185186070', '2016-06-29 09:52:47', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3969', '925512580804', '2016-06-29 15:34:49', '日本 Japan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3970', '924674674364', '2016-06-30 10:37:16', '安提瓜 Antigua', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3971', '924674674364', '2016-07-01 08:39:06', '安提瓜 Antigua', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3972', '924674674364', '2016-07-01 10:39:45', '安提瓜 Antigua', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3973', '953007566336', '2016-07-02 05:46:46', '美国 USA ', '到达美国，转运中 Arrive USA，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3974', '953007566336', '2016-07-03 18:04:36', '加拿大Canada', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3975', '953007566336', '2016-07-03 18:37:56', '加拿大Canada', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3976', '953006565943', '2016-07-01 12:51:03', '深圳  Shenzhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3977', '953006565943', '2016-07-02 08:29:31', '台湾 TAIWAN', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3978', '924678139562', '2016-07-02 12:53:09', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3979', '924678139562', '2016-07-03 01:53:57', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3980', '664196855568', '2016-07-01 03:59:27', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3981', '664196855568', '2016-07-01 08:00:57', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('3982', '664196855568', '2016-07-01 08:29:16', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('3983', '922533914418', '2016-07-02 05:01:10', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3984', '922533914418', '2016-07-02 09:36:43', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('3985', '922533914418', '2016-07-04 08:43:31', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3986', '664214033591', '2016-07-02 02:05:44', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3987', '664214033591', '2016-07-02 08:36:11', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('3988', '664214033591', '2016-07-04 08:45:32', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('3989', '921349494882', '2016-07-02 02:07:01', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('3990', '88832940545', '2016-07-02 06:00:49', '新加坡 Singapore', '到达新加坡 Arrive  Singapore');
INSERT INTO `jefsky_wuliu` VALUES ('3991', '953006565943', '2016-07-02 13:43:38', '台湾 TAIWAN', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('3992', '664196855568', '2016-07-02 12:14:06', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3993', '953007566336', '2016-07-04 12:57:30', '加拿大Canada', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('3994', '924678139562', '2016-07-03 09:52:29', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('3995', '922533914418', '2016-07-04 16:23:19', '美国 USA ', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('3996', '664214033591', '2016-07-04 16:05:43', '香港 Hongkong', '到达香港，转运中 Arrive Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('3997', '88832940545', '2016-07-04 09:14:14', '新加坡 Singapore', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('3998', '921349494882', '2016-07-02 13:43:46', '深圳  Shenzhen', '入机场仓 Into the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('3999', '921349494882', '2016-07-02 21:44:20', '深圳  Shenzhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4000', '921349494882', '2016-07-03 04:44:59', '台湾 TAIWAN', '到达台湾 Arrive in Taiwan');
INSERT INTO `jefsky_wuliu` VALUES ('4001', '921349494882', '2016-07-04 08:45:37', '台湾 TAIWAN', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4002', '921349494882', '2016-07-04 16:46:04', '台湾 TAIWAN', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4003', '953006565943', '2016-07-04 16:46:40', '台湾 TAIWAN', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4004', '88832940545', '2016-07-04 17:49:24', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4005', '952086125570', '2016-07-04 15:36:34', '新加坡 Singapore', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4006', '924678139562', '2016-07-05 00:24:05', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4007', '922533914418', '2016-07-05 03:40:15', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4008', '664214033591', '2016-07-05 01:41:44', '美国 USA ', '快件到达中转中心  Have delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4009', '664214033591', '2016-07-05 18:30:17', '美国 USA ', '离开转运地 To leave the place of  transport');
INSERT INTO `jefsky_wuliu` VALUES ('4010', '132069651572', '2016-07-07 02:06:31', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4011', '132617846823', '2016-07-07 02:06:46', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4012', '667424982477', '2016-07-07 02:07:02', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4013', '924678139562', '2016-07-06 10:20:55', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('4014', '924678139562', '2016-07-06 12:54:27', '美国 USA ', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('4015', '922533914418', '2016-07-05 20:56:23', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('4016', '667424982477', '2016-07-07 08:00:33', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4017', '132617846823', '2016-07-07 08:00:58', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4018', '132069651572', '2016-07-07 08:00:21', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4019', '132617846823', '2016-07-07 08:29:48', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4020', '667424982477', '2016-07-07 08:30:06', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4021', '132069651572', '2016-07-07 08:30:26', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4022', '132617846823', '2016-07-07 13:24:47', '香港Hongkong', '派送中In the delivery');
INSERT INTO `jefsky_wuliu` VALUES ('4023', '132069651572', '2016-07-07 13:29:10', '香港HONG KONG', '派件中Send a piece of');
INSERT INTO `jefsky_wuliu` VALUES ('4024', '132069651572', '2016-07-07 14:58:42', '香港HONG KONG', '货物已签收The goods have signed');
INSERT INTO `jefsky_wuliu` VALUES ('4025', '667424982477', '2016-07-07 13:29:20', '香港HONG KONG', '外出派送 Send out');
INSERT INTO `jefsky_wuliu` VALUES ('4026', '132617846823', '2016-07-07 16:24:57', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('4027', '667424982477', '2016-07-07 16:26:24', '香港Hongkong', '派送并已签收Delivery and have sign for it');
INSERT INTO `jefsky_wuliu` VALUES ('4028', '924678139562', '2016-07-07 16:38:10', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4029', '922533914418', '2016-07-07 09:40:19', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4030', '664214033591', '2016-07-06 17:42:01', '安提瓜 Antigua', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4031', '664214033591', '2016-07-07 14:17:36', '安提瓜 Antigua', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4032', '953005860642', '2016-07-07 16:54:21', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4033', '953005860642', '2016-07-08 08:35:05', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4034', '924678139299', '2016-07-07 17:59:59', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4035', '924678139299', '2016-07-08 08:34:20', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4036', '924185186052', '2016-07-07 17:23:48', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4037', '924185186052', '2016-07-08 08:31:08', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4038', '950179162665', '2016-07-08 03:01:59', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4039', '950179162665', '2016-07-08 08:02:21', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4040', '952086125570', '2016-07-05 14:00:38', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4041', '950179162665', '2016-07-08 08:29:34', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4057', '953005860642', '2016-07-10 16:21:04', 'LEIPZIG - GERMANY', '快件到达中转中心  Have delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4043', '925364930291', '2016-07-09 03:09:14', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4044', '953005702434', '2016-07-09 03:09:27', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4045', '953005702434', '2016-07-09 08:00:39', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4046', '925364930291', '2016-07-09 08:00:53', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4047', '922533914418', '2016-07-08 11:58:13', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4048', '664214033591', '2016-07-08 09:35:45', '安提瓜 Antigua', '快件已经转交收件人指定的清关代理清关并由其负责派送。The shipment has been transferred to customs clearance customs clearance agent designated by the recipient and is responsible for the delivery of.');
INSERT INTO `jefsky_wuliu` VALUES ('4049', '953005860642', '2016-07-08 15:23:56', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4050', '953005860642', '2016-07-09 06:36:14', '香港 Hongkong', '快件到达中转中心  Have delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4051', '925364930291', '2016-07-09 08:25:46', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4052', '953005702434', '2016-07-09 08:26:04', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4053', '924678139299', '2016-07-09 08:42:32', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4054', '924185186052', '2016-07-09 08:27:02', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4055', '950179162665', '2016-07-08 10:18:23', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4061', '667424222128', '2016-07-10 20:33:01', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4058', '924678139299', '2016-07-09 21:24:55', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('4059', '924185186052', '2016-07-09 23:25:57', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('4060', '953005702434', '2016-07-09 12:51:44', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4062', '667424222128', '2016-07-11 08:33:35', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4063', '925501246844', '2016-07-10 03:34:04', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4064', '925501246844', '2016-07-11 08:34:41', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4065', '113161039078', '2016-07-11 03:35:31', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4066', '113161039078', '2016-07-11 08:00:25', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4067', '113161039078', '2016-07-11 08:27:04', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4068', '132426514670', '2016-07-12 03:09:35', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4069', '924185186016', '2016-07-12 03:10:13', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4070', '924678139299', '2016-07-11 12:13:49', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4071', '924185186052', '2016-07-11 11:30:42', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4072', '925364930291', '2016-07-11 17:53:06', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4073', '925501246844', '2016-07-12 09:12:11', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4074', '113161039078', '2016-07-11 17:51:27', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4075', '132426514670', '2016-07-12 08:01:58', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4076', '132426514670', '2016-07-12 08:26:17', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4077', '924185186016', '2016-07-12 08:29:45', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4078', '667424222128', '2016-07-11 14:57:56', '香港 Hong Kong', '快件到达香港，转运中 Express arrival in Hongkong，Transport in');
INSERT INTO `jefsky_wuliu` VALUES ('4079', '667424222128', '2016-07-12 02:59:48', '新加坡 Singapore', '到达新加坡 Arriving in Singapore');
INSERT INTO `jefsky_wuliu` VALUES ('4080', '953005860642', '2016-07-12 09:25:20', '奥地利 Austria', '快件到达转运中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('4081', '667424222128', '2016-07-12 08:32:12', '新加坡 Singapore', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('4082', '925501246844', '2016-07-12 15:57:26', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('4083', '132426514670', '2016-07-12 16:22:45', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4084', '924185186016', '2016-07-13 08:44:28', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4085', '664196855489', '2016-07-13 03:00:05', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4086', '664196855489', '2016-07-13 08:00:29', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4087', '664196855489', '2016-07-13 08:54:47', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4088', '952077711951', '2016-07-12 21:21:31', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4089', '952077711951', '2016-07-13 03:21:57', '珠海 Zhu Hai', '装澳门车 Loading Macao car');
INSERT INTO `jefsky_wuliu` VALUES ('4090', '952077711951', '2016-07-13 08:30:13', '珠海 Zhu Hai', '报关中 Customs declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4091', '952077711951', '2016-07-13 11:05:24', '珠海 Zhu Hai', '已完成报关，等待放行 Has completed the declaration, waiting for the release');
INSERT INTO `jefsky_wuliu` VALUES ('4092', '953005860642', '2016-07-13 07:36:08', '奥地利 Austria', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4093', '132589918537', '2016-07-14 03:14:45', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4094', '664196978645', '2016-07-14 03:15:03', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4095', '664196978645', '2016-07-14 08:00:15', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4096', '132589918537', '2016-07-14 08:00:31', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4097', '132589918537', '2016-07-14 08:37:50', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4098', '664196978645', '2016-07-14 08:44:16', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4099', '664196855489', '2016-07-13 17:00:24', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4100', '952077711951', '2016-07-13 13:00:26', '珠海 Zhu Hai', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4101', '952077711951', '2016-07-13 13:20:46', '澳门Macao', '到达澳门 Arrive Macao');
INSERT INTO `jefsky_wuliu` VALUES ('4102', '952077711951', '2016-07-13 13:30:16', '澳门Macao', '等待客户安排人员卸货 Waiting for customers to arrange for staff to unload');
INSERT INTO `jefsky_wuliu` VALUES ('4103', '952077711951', '2016-07-13 17:00:28', '澳门Macao', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4104', '667424772087', '2016-07-14 03:52:00', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4105', '667424772087', '2016-07-14 08:52:36', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4106', '925501246844', '2016-07-13 09:34:04', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4107', '924185186016', '2016-07-14 02:02:03', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4108', '664196978645', '2016-07-14 10:40:52', '香港 Hongkong', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('4109', '132589918537', '2016-07-14 10:41:11', '香港 Hongkong', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('4110', '664196978645', '2016-07-14 13:42:13', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4111', '132589918537', '2016-07-14 16:58:51', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4112', '924185186016', '2016-07-14 13:59:41', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('4113', '667424772087', '2016-07-14 16:21:41', '香港 Hong Kong', '到达香港 Arrive in Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4114', '667424772087', '2016-07-15 02:22:58', '香港 Hong Kong', '正在（已经）安排下一站转运 (already) arrangements for the next station');
INSERT INTO `jefsky_wuliu` VALUES ('4115', '667424222128', '2016-07-15 15:39:51', '新加坡 Singapore', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4116', '664217610622', '2016-07-12 21:21:31', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4117', '664217610622', '2016-07-13 03:21:57', '珠海 Zhu Hai', '装澳门车 Macao car');
INSERT INTO `jefsky_wuliu` VALUES ('4118', '664217610622', '2016-07-13 08:30:13', '珠海 Zhu Hai', '报关中 Customs declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4119', '664217610622', '2016-07-13 11:05:24', '珠海 Zhu Hai', '已完成报关，等待放行 Has completed the declaration, waiting for the release');
INSERT INTO `jefsky_wuliu` VALUES ('4120', '664217610622', '2016-07-13 13:00:26', '珠海 Zhu Hai', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4121', '664217610622', '2016-07-13 13:20:46', '澳门 Macao', '到达澳门 Arrive Macao');
INSERT INTO `jefsky_wuliu` VALUES ('4122', '664217610622', '2016-07-13 13:30:16', '澳门 Macao', '等待客户安排人员卸货 Waiting for customers to arrange for staff to unload');
INSERT INTO `jefsky_wuliu` VALUES ('4123', '664217610622', '2016-07-13 17:00:28', '澳门 Macao', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4124', '924185186016', '2016-07-15 13:16:26', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4125', '667424772087', '2016-07-15 10:24:51', '日本 Japan', '到达日本 Arrive  Japan');
INSERT INTO `jefsky_wuliu` VALUES ('4126', '667424772087', '2016-07-15 18:29:32', '日本 Japan', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('4127', '925362443777', '2016-07-16 04:02:05', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4128', '925362443777', '2016-07-16 08:43:33', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('4129', '667424772087', '2016-07-15 23:56:22', '日本 Japan', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4130', '667424772087', '2016-07-16 09:56:57', '日本 Japan', '转运中 Transport in');
INSERT INTO `jefsky_wuliu` VALUES ('4131', '925362443777', '2016-07-16 19:19:49', '香港 Hongkong', '到达香港，转运中 Arrive Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4132', '925362443777', '2016-07-17 20:47:13', '英国 UK', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4133', '925358030693', '2016-07-17 03:09:04', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4134', '925506751747', '2016-07-17 03:09:46', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4135', '925506751747', '2016-07-17 08:09:56', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('4136', '925358030693', '2016-07-17 08:10:15', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('4137', '925358030693', '2016-07-18 08:38:34', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4138', '925506751747', '2016-07-18 08:30:51', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4139', '132586895740', '2016-07-18 03:11:24', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4140', '132586895759', '2016-07-18 03:11:56', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4141', '132586895768', '2016-07-18 03:12:22', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4142', '667424772087', '2016-07-17 08:58:37', '日本 Japan', '收件人不在指定地点，等待下一次派送The recipient is not in the specified place, waiting for the next delivery');
INSERT INTO `jefsky_wuliu` VALUES ('4143', '667424772087', '2016-07-19 08:47:19', '日本 Japan', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('4144', '925362443777', '2016-07-18 12:56:21', '英国 UK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4145', '925358030693', '2016-07-19 08:56:48', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4146', '925506751747', '2016-07-18 17:03:52', '香港 Hongkong', '到达香港，转运中 Arrive Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4147', '925506751747', '2016-07-19 01:22:33', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4148', '925506751747', '2016-07-18 17:52:56', '美国 USA ', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('4149', '132586895768', '2016-07-18 13:06:53', '深圳  Shenzhen', '入机场仓 Into the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('4150', '132586895768', '2016-07-18 21:18:21', '深圳  Shenzhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4151', '132586895768', '2016-07-19 04:07:41', '台湾 TAIWAN', '到达台湾 Arrive in Taiwan');
INSERT INTO `jefsky_wuliu` VALUES ('4152', '132586895768', '2016-07-19 08:21:28', '台湾 TAIWAN', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('4153', '664194488156', '2016-07-19 03:25:59', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4154', '664194488156', '2016-07-19 08:00:16', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4155', '664194488156', '2016-07-19 08:26:48', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4156', '662741704102', '2016-07-19 03:38:49', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4157', '922533914524', '2016-07-19 03:39:10', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4158', '922533914524', '2016-07-19 08:39:27', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4159', '662741704102', '2016-07-19 08:39:46', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4160', '667424772087', '2016-07-19 12:14:56', '日本 Japan', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4161', '664194488156', '2016-07-19 14:39:45', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4162', '925358030693', '2016-07-19 18:19:01', '澳大利亚 Australia', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4163', '925358030693', '2016-07-20 05:27:42', '澳大利亚 Australia', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('4164', '925358030693', '2016-07-20 10:43:10', '澳大利亚 Australia', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4165', '922533914524', '2016-07-20 09:32:27', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4166', '662741704102', '2016-07-20 09:28:53', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4167', '664706972656', '2016-07-20 03:58:05', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4168', '664196978627', '2016-07-20 03:58:22', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4169', '664196978636', '2016-07-20 03:58:38', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4170', '664196978636', '2016-07-20 08:00:51', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4171', '664196978627', '2016-07-20 08:00:06', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4172', '664706972656', '2016-07-20 08:00:25', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4173', '664196978636', '2016-07-20 08:30:17', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4174', '664706972656', '2016-07-20 08:29:38', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4175', '664196978627', '2016-07-20 08:31:53', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4176', '5262767320', '2016-07-13 16:27:41', '佛山 Fo Shan', '入仓 Warehousing');
INSERT INTO `jefsky_wuliu` VALUES ('4177', '5262767320', '2016-07-15 09:30:10', '佛山 Fo Shan', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4178', '5262767320', '2016-07-18 09:30:58', '佛山 Fo Shan', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4179', '5262767320', '2016-07-20 13:33:14', '佛山 Fo Shan', '货物已装船 loaded on board');
INSERT INTO `jefsky_wuliu` VALUES ('4180', '5262767320', '2016-07-20 16:34:20', '佛山 Fo Shan', '预计22号开船 No. 22 is expected to sail');
INSERT INTO `jefsky_wuliu` VALUES ('4181', '925358030693', '2016-07-20 15:21:56', '澳大利亚 Australia', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4182', '925506751747', '2016-07-20 12:28:09', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4183', '922533914524', '2016-07-21 03:05:23', '香港HONG KONG', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4184', '662741704102', '2016-07-21 02:06:39', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4185', '664196978636', '2016-07-20 16:58:11', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4186', '664196978627', '2016-07-20 15:08:08', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4187', '664706972656', '2016-07-20 17:56:55', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4188', '924192481468', '2016-07-21 02:22:45', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4189', '922533914445', '2016-07-21 01:27:32', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4190', '902106284595', '2016-07-21 02:29:58', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4191', '922533914445', '2016-07-21 08:31:27', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4192', '902106284595', '2016-07-21 08:34:50', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4193', '924192481468', '2016-07-21 08:39:00', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4194', '953005702425', '2016-07-21 03:55:07', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4195', '953005702425', '2016-07-21 08:00:31', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4196', '953005702425', '2016-07-21 08:27:17', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4197', '132586895768', '2016-07-20 15:04:49', '台湾 TAIWAN', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4198', '925368974698', '2016-07-22 03:14:58', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4199', '953006391351', '2016-07-22 03:16:36', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4200', '925368974703', '2016-07-22 03:17:49', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4201', '925368974703', '2016-07-22 08:00:33', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4202', '953006391351', '2016-07-22 08:00:45', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4203', '925368974698', '2016-07-22 08:00:32', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4204', '953006391351', '2016-07-22 08:29:10', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4205', '925368974703', '2016-07-22 08:31:02', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4206', '925368974698', '2016-07-22 08:32:39', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4207', '922533914445', '2016-07-22 09:23:21', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4208', '924192481468', '2016-07-22 09:26:47', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4209', '902106284595', '2016-07-22 09:23:22', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4210', '953005702425', '2016-07-21 16:47:04', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4211', '924185186007', '2016-07-22 03:09:57', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4212', '953024289402', '2016-07-22 03:18:16', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4213', '924185186007', '2016-07-22 08:32:07', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4214', '953024289402', '2016-07-22 08:41:09', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4215', '925328920137', '2016-07-23 03:11:58', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4216', '925426263030', '2016-07-23 03:11:58', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4217', '925328869225', '2016-07-23 03:11:58', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4218', '925426263021', '2016-07-23 03:11:58', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4219', '925328920128', '2016-07-23 03:11:58', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4220', '922533913787', '2016-07-23 03:11:58', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4221', '925328869252', '2016-07-23 03:11:58', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4222', '925328869252', '2016-07-23 08:33:49', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4223', '925328920137', '2016-07-23 08:33:49', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4224', '925426263030', '2016-07-23 08:33:49', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4225', '925328869225', '2016-07-23 08:33:49', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4226', '925426263021', '2016-07-23 08:33:49', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4227', '925328920128', '2016-07-23 08:33:49', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4228', '922533913787', '2016-07-23 08:33:49', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4229', '924192481468', '2016-07-23 03:15:26', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4230', '902106284595', '2016-07-23 03:15:49', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4231', '922533914445', '2016-07-23 03:16:03', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4232', '924185186007', '2016-07-23 08:42:57', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4233', '925368974703', '2016-07-22 17:23:06', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4234', '953006391351', '2016-07-22 16:23:48', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4235', '925368974698', '2016-07-22 16:32:25', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4236', '922533914524', '2016-07-22 13:46:32', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4237', '922533914524', '2016-07-23 12:30:14', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4238', '662741704102', '2016-07-22 11:48:25', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4239', '662741704102', '2016-07-23 09:42:10', '美国 USA ', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('4240', '925328869252', '2016-07-24 12:52:40', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4241', '925328920137', '2016-07-24 12:52:40', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4242', '925426263030', '2016-07-24 12:52:40', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4243', '925328869225', '2016-07-24 12:52:40', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4244', '925426263021', '2016-07-24 12:52:40', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4245', '925328920128', '2016-07-24 12:52:40', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4246', '922533913787', '2016-07-24 12:52:40', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4247', '924185186007', '2016-07-24 05:54:30', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4248', '925328869252', '2016-07-25 03:54:53', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4249', '925328920137', '2016-07-25 03:54:53', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4250', '925426263030', '2016-07-25 03:54:53', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4251', '925328869225', '2016-07-25 03:54:53', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4252', '925426263021', '2016-07-25 03:54:53', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4253', '925328920128', '2016-07-25 03:54:53', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4254', '922533913787', '2016-07-25 03:54:53', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4255', '953024289402', '2016-07-22 17:56:43', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4256', '953024289402', '2016-07-23 04:57:02', '新加坡 Singapore', '到达新加坡 Arrive  Singapore');
INSERT INTO `jefsky_wuliu` VALUES ('4257', '953024289402', '2016-07-23 07:57:33', '新加坡 Singapore', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('4258', '924192481468', '2016-07-23 06:59:13', '美国 USA ', '到达美国arrive USA');
INSERT INTO `jefsky_wuliu` VALUES ('4259', '924192481468', '2016-07-23 10:44:46', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4260', '902106284595', '2016-07-24 05:01:45', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4261', '922533914445', '2016-07-24 04:03:18', '加拿大Canada', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('4262', '662741704102', '2016-07-25 10:41:54', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4263', '922533914445', '2016-07-25 10:48:36', '加拿大Canada', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('4264', '953024289402', '2016-07-25 10:47:54', '新加坡 Singapore', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('4265', '925328920128', '2016-07-25 09:51:31', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('4266', '925328920128', '2016-07-25 10:51:56', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4267', '925328869225', '2016-07-25 14:53:21', '英国 UK', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4268', '922533914445', '2016-07-26 15:11:06', '加拿大Canada', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4269', '953024289402', '2016-07-25 15:50:46', '新加坡 Singapore', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4270', '924185186007', '2016-07-26 10:11:21', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('4271', '922533913787', '2016-07-25 18:08:53', '美国 USA ', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4272', '922533913787', '2016-07-26 09:55:15', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4273', '925426263021', '2016-07-26 09:53:59', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('4274', '925426263021', '2016-07-26 13:13:29', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4275', '925426263030', '2016-07-26 09:54:45', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('4276', '925426263030', '2016-07-26 13:20:08', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4277', '925426263030', '2016-07-26 13:20:08', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4278', '925426263030', '2016-07-26 13:20:25', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4279', '925328920137', '2016-07-26 09:43:09', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('4280', '925328920137', '2016-07-26 14:54:07', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4281', '902106284595', '2016-07-27 09:45:54', '阿根廷 Argentina', '到达阿根廷 Arrive Argentina');
INSERT INTO `jefsky_wuliu` VALUES ('4282', '902106284595', '2016-07-28 11:46:48', '阿根廷 Argentina', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4283', '924185186007', '2016-07-27 11:32:04', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4284', '925328869252', '2016-07-26 13:53:37', '英国 UK', '到达英国 Arrive UK');
INSERT INTO `jefsky_wuliu` VALUES ('4285', '925328869252', '2016-07-28 13:56:48', '英国 UK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4286', '919920746542', '2016-07-29 04:56:22', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4287', '919920746542', '2016-07-29 08:00:36', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4288', '919920746542', '2016-07-29 08:29:57', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4289', '132584821556', '2016-07-30 03:13:10', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4290', '919920746542', '2016-07-29 14:15:26', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4291', '132584821556', '2016-07-30 08:00:12', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4292', '132584821556', '2016-07-30 08:34:30', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4293', '952065419692', '2016-07-30 04:19:33', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4294', '952065419692', '2016-07-30 08:30:56', '深圳  Shenzhen', '到达深圳  Arrive Shenzhen');
INSERT INTO `jefsky_wuliu` VALUES ('4295', '664706973096', '2016-08-01 03:52:41', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4296', '667425944606', '2016-08-01 03:52:59', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4297', '664706973096', '2016-08-01 08:00:16', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4298', '667425944606', '2016-08-01 08:00:33', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4299', '667425944606', '2016-08-01 08:26:47', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4300', '664706973096', '2016-08-01 08:26:01', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4301', '952065419692', '2016-08-01 08:29:29', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4302', '925396609455', '2016-08-01 03:57:34', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4303', '925396609455', '2016-08-01 08:28:53', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4304', '925328869225', '2016-07-30 09:16:14', '英国 UK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4305', '925328869640', '2016-08-01 03:07:22', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4306', '925328869640', '2016-08-01 08:32:37', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4307', '664706973096', '2016-08-01 16:54:30', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4308', '664706973096', '2016-08-01 16:54:30', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4309', '664706973096', '2016-08-01 16:54:30', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4310', '667425944606', '2016-08-01 17:00:54', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4311', '132584821556', '2016-08-01 08:12:41', '香港 Hongkong', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('4312', '132584821556', '2016-08-01 09:51:22', '香港 Hongkong', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4313', '925357312160', '2016-08-02 03:20:00', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4314', ' 925328869598', '2016-08-02 03:20:15', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4315', ' 925328869598', '2016-08-02 10:20:31', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4316', '925357312160', '2016-08-02 10:20:47', '深圳  Shenzhen', '出口申报中 Export reporting');
INSERT INTO `jefsky_wuliu` VALUES ('4317', '952065419692', '2016-08-01 17:38:18', '香港 Hongkong', '到达香港，转运中 Arrive Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4318', '952065419692', '2016-08-02 08:33:08', '菲律宾 Philippines', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4319', '925396609455', '2016-08-02 15:41:19', '香港 Hongkong', '到达香港，转运中 Arrive Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4320', '925396609455', '2016-08-03 05:41:47', '日本 Japan', '海关状态更新 Custom status update');
INSERT INTO `jefsky_wuliu` VALUES ('4321', '925328869640', '2016-08-02 09:42:26', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4322', '925328869640', '2016-08-03 02:42:46', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4323', '952065419692', '2016-08-03 13:39:22', '菲律宾 Philippines', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4324', '925396609455', '2016-08-04 07:55:03', '日本 Japan', '到达作业地点 Arrive at work place');
INSERT INTO `jefsky_wuliu` VALUES ('4325', '925328869640', '2016-08-04 02:42:21', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4326', ' 925328869598', '2016-08-03 09:46:03', '香港 Hongkong', '到达香港，转运中 Arrive Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4327', '925357312160', '2016-08-03 09:46:54', '香港 Hongkong', '到达香港 Arrive Hongkong');
INSERT INTO `jefsky_wuliu` VALUES ('4328', '925357312160', '2016-08-04 02:47:46', '香港 Hongkong', '正在（已经）安排下一站的转运 We are (already) next transport arrangements');
INSERT INTO `jefsky_wuliu` VALUES ('4329', '664706972674', '2016-08-04 06:50:30', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4330', '664706972674', '2016-08-04 08:10:49', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4331', '664706972674', '2016-08-04 10:43:33', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4332', '925396609455', '2016-08-04 14:10:07', '日本 Japan', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4333', ' 925328869598', '2016-08-03 23:51:40', '英国 UK', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4334', ' 925328869598', '2016-08-04 14:52:28', '英国 UK', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4335', '925357312160', '2016-08-05 02:56:18', '香港 Hongkong', '离开香港，转运中leave  Hongkong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4336', '664706972674', '2016-08-05 08:50:07', '香港 Hongkong', '正在派送货物 sending  goods');
INSERT INTO `jefsky_wuliu` VALUES ('4337', '925104917472', '2016-08-04 08:11:29', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4338', '925104917463', '2016-08-04 08:12:19', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4339', '925104917463', '2016-08-04 13:13:09', '深圳  Shenzhen', '入机场仓 Into the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('4340', '925104917472', '2016-08-04 13:13:29', '深圳  Shenzhen', '入机场仓 Into the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('4341', '664706972674', '2016-08-05 11:51:16', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4342', '925357312160', '2016-08-05 10:06:48', '美国 USA ', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('4343', '925357312160', '2016-08-05 11:03:03', '美国 USA ', '派送并已签收 Delivery and Sign');
INSERT INTO `jefsky_wuliu` VALUES ('4344', '664706972665', '2016-08-06 02:46:31', '东莞 Dongguan', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4345', '664706972665', '2016-08-06 08:00:00', '深圳  Shenzhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4346', '664706972665', '2016-08-06 08:27:45', '香港 Hongkong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4347', '925104917472', '2016-08-05 10:22:22', '深圳  Shenzhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4348', '925104917463', '2016-08-05 10:22:52', '深圳  Shenzhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4349', '925104917463', '2016-08-06 03:23:20', '台湾 TAIWAN', '到达台湾 Arrive in Taiwan');
INSERT INTO `jefsky_wuliu` VALUES ('4350', '925104917472', '2016-08-06 03:24:05', '台湾 TAIWAN', '到达台湾 Arrive in Taiwan');
INSERT INTO `jefsky_wuliu` VALUES ('4351', '925104917472', '2016-08-06 08:08:57', '台湾 TAIWAN', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4352', '925104917463', '2016-08-06 08:08:32', '台湾 TAIWAN', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4353', '925104917472', '2016-08-06 10:12:54', '台湾 TAIWAN', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4354', '925104917463', '2016-08-06 10:13:20', '台湾 TAIWAN', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4355', '664706972665', '2016-08-06 12:49:01', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4356', '924675221418', '2016-08-08 02:43:45', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4357', '924675221418', '2016-08-08 08:29:12', '深圳 Shen Zhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4358', '925328869677', '2016-08-08 02:44:54', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4359', '925328869904', '2016-08-08 02:45:09', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4360', '925328869904', '2016-08-08 08:28:24', '深圳 Shen Zhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4361', '925328869677', '2016-08-08 08:28:42', '深圳 Shen Zhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4362', '925328869677', '2016-08-08 08:28:42', '深圳 Shen Zhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4363', '925328869677', '2016-08-08 08:29:32', '深圳 Shen Zhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4364', '925104917472', '2016-08-08 16:33:53', '台湾 TAI WAN', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4365', '925104917463', '2016-08-08 16:35:03', '台湾 TaiWan', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4366', '925328869904', '2016-08-08 15:45:49', '香港 Hong Kong', '到达香港，转运中 Arrive in Hong Kong，Transport in');
INSERT INTO `jefsky_wuliu` VALUES ('4367', '925328869677', '2016-08-08 15:47:25', '香港 Hong Kong', '到达香港，转运中 Arrive in Hong Kong，Transport in');
INSERT INTO `jefsky_wuliu` VALUES ('4368', '924675221418', '2016-08-09 08:39:29', '香港 Hong Kong', '到达香港 Arrive in Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4369', '132339387386', '2016-08-09 00:38:46', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4370', '132339387386', '2016-08-09 08:00:10', '深圳 Shen Zhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4371', '132339387386', '2016-08-09 08:37:03', '香港 Hong Kong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4372', '925328869940', '2016-08-09 02:44:34', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4373', '925328869940', '2016-08-09 08:44:48', '深圳 Shen Zhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4374', '132339387386', '2016-08-09 14:23:33', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4375', '925328869940', '2016-08-10 09:14:12', '香港 Hong Kong', '到达香港 Arrive in Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4376', '925104559295', '2016-08-09 02:25:55', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4377', '925104559295', '2016-08-09 13:26:34', '深圳 Shen Zhen', '入机场仓  Into the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('4378', '925104559295', '2016-08-09 19:29:23', '深圳 Shen Zhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4379', '925104559295', '2016-08-10 03:29:44', '台湾 TaiWan', '到达台湾 Arrive in TaiWan');
INSERT INTO `jefsky_wuliu` VALUES ('4380', '925104559295', '2016-08-10 08:22:31', '台湾 TaiWan', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4381', '132584821662', '2016-08-10 03:32:04', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4382', '132584821662', '2016-08-10 08:00:30', '深圳 Shen Zhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4383', '132584821662', '2016-08-10 08:25:54', '香港 Hong Kong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4384', '925426440581', '2016-08-10 04:19:29', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4385', '925426440581', '2016-08-10 08:40:52', '深圳 Shen Zhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4386', '925426440581', '2016-08-11 09:13:17', '香港 Hong Kong', '到达香港 Arrive in Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4387', '952065419692', '2016-08-10 22:53:01', '菲律宾 Philippines', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4388', '952065419692', '2016-08-11 08:51:51', '菲律宾 Philippines', '正在派送货物 delivery of goods');
INSERT INTO `jefsky_wuliu` VALUES ('4389', '925328869904', '2016-08-09 12:27:08', '英国 UK', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('4390', '925328869904', '2016-08-09 15:27:49', '英国 UK', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4391', '925328869677', '2016-08-09 05:46:10', '英国 UK', '到达投递局 Arrival delivery office');
INSERT INTO `jefsky_wuliu` VALUES ('4392', '925328869677', '2016-08-09 08:29:54', '英国 UK', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4393', '925328869940', '2016-08-10 10:14:34', '英国 UK', '正在（已经）安排下一站转运 (already) arrangements for the next station');
INSERT INTO `jefsky_wuliu` VALUES ('4394', '132584821662', '2016-08-10 12:57:50', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4395', '925104653012', '2016-08-11 03:43:27', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4396', '925104559295', '2016-08-11 09:05:02', '台湾 TaiWan', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4397', '952065419692', '2016-08-11 14:55:48', '菲律宾 Philippines', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4398', '925328869640', '2016-08-11 08:22:23', '加拿大 Canada', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4399', '924675221418', '2016-08-10 03:59:51', '香港 Hong Kong', '正在（已经）安排下一站转运 (already) arrangements for the next station');
INSERT INTO `jefsky_wuliu` VALUES ('4400', '924675221418', '2016-08-11 05:00:23', '香港 Hong Kong', '离开香港，转运中leave Hong Kong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4401', '925328869940', '2016-08-10 22:12:47', '英国 UK', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4402', '925328869940', '2016-08-11 16:52:28', '英国', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4403', '925426440581', '2016-08-12 02:04:45', '香港 Hong Kong', '正在（已经）安排下一站转运 (already) arrangements for the next station');
INSERT INTO `jefsky_wuliu` VALUES ('4404', '925104653012', '2016-08-11 13:06:15', '深圳 Shen Zhen', '入机场仓  Into the airport warehouse');
INSERT INTO `jefsky_wuliu` VALUES ('4405', '953007567898', '2016-08-11 04:07:34', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4406', '953007567898', '2016-08-11 08:41:08', '深圳 Shen Zhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4407', '925104653012', '2016-08-11 19:10:08', '深圳 Shen Zhen', '离开深圳，转运中leave Shenzhen，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4408', '925104653012', '2016-08-12 04:10:39', '台湾 TaiWan', '到达台湾 Arrive in TaiWan');
INSERT INTO `jefsky_wuliu` VALUES ('4409', '925104653012', '2016-08-12 08:38:02', '台湾 TaiWan', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4410', '664196855461', '2016-08-12 03:12:09', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4411', '664196855461', '2016-08-12 08:00:04', '深圳 Shen Zhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4412', '664196855461', '2016-08-12 08:33:20', '香港 Hong Kong', '到达香港 Arrive in Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4413', '925104653012', '2016-08-12 11:45:55', '台湾 TaiWan', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4414', '953007567898', '2016-08-11 15:52:05', '香港 Hong Kong', '到达香港，转运中 Arrive in Hong Kong，Transport in');
INSERT INTO `jefsky_wuliu` VALUES ('4415', '953007567898', '2016-08-12 08:00:37', '马来西亚 Malaysia', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4416', '664196855461', '2016-08-12 17:15:51', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4417', '664196180165', '2016-08-13 03:57:34', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4418', '664196180165', '2016-08-13 08:00:01', '深圳 Shen Zhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4419', '664196180165', '2016-08-13 08:31:14', '香港 Hong Kong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4420', '925104653012', '2016-08-12 16:31:07', '台湾 TaiWan', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4421', '924675221418', '2016-08-13 08:48:04', '美国 USA', '到达美国 Arrive in USA');
INSERT INTO `jefsky_wuliu` VALUES ('4422', '925426440581', '2016-08-13 07:14:12', '香港 Hong Kong', '离开香港，转运中leave Hong Kong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4423', '924185185782', '2016-08-15 03:31:10', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4424', '924185185782', '2016-08-15 08:31:31', '深圳 Shen Zhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4425', '925357137634', '2016-08-15 03:31:48', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4426', '925357137634', '2016-08-15 08:32:00', '深圳 Shen Zhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4427', '925364707047', '2016-08-16 03:20:46', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4428', '924675220883', '2016-08-16 03:20:58', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4429', '926076809240', '2016-08-16 03:21:13', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4430', '926076809240', '2016-08-16 08:32:25', '深圳 Shen Zhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4431', '924675220883', '2016-08-16 08:37:40', '深圳 Shen Zhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4432', '925364707047', '2016-08-16 08:35:37', '深圳 Shen Zhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4433', '925357137634', '2016-08-15 13:24:09', '香港 Hong Kong', '到达香港，转运中 Arrive in Hong Kong，Transport in');
INSERT INTO `jefsky_wuliu` VALUES ('4434', '925357137634', '2016-08-16 04:25:37', '英国 UK', '海关放行 Customs clearance');
INSERT INTO `jefsky_wuliu` VALUES ('4435', '924185185782', '2016-08-16 11:26:15', '香港 Hong Kong', '到达香港 Arrive in Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4436', '924675221418', '2016-08-15 11:27:28', '美国 USA', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4437', '953007567898', '2016-08-15 09:36:59', '马来西亚 Malaysia', '正在派送货物 delivery of goods');
INSERT INTO `jefsky_wuliu` VALUES ('4438', '953007567898', '2016-08-15 11:53:43', '马来西亚 Malaysia', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4439', '664196180165', '2016-08-15 14:27:59', '香港 Hong Kong', '正在派送货物 delivery of goods');
INSERT INTO `jefsky_wuliu` VALUES ('4440', '664196180165', '2016-08-15 17:45:33', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4441', '924185185782', '2016-08-17 03:48:14', '香港 Hong Kong', '正在（已经）安排下一站转运 (already) arrangements for the next station');
INSERT INTO `jefsky_wuliu` VALUES ('4442', '925357137634', '2016-08-16 15:20:15', '英国 UK', '第一次派送失败 First delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('4443', '925357137634', '2016-08-16 17:09:08', '英国 UK', '第二次派送失败 Second delivery failure');
INSERT INTO `jefsky_wuliu` VALUES ('4444', '926076809240', '2016-08-17 08:29:41', '香港 Hong Kong', '到达香港 Arrive in Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4445', '925364707047', '2016-08-17 08:31:35', '香港 Hong Kong', '到达香港 Arrive in Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4446', '924675220883', '2016-08-17 08:31:05', '香港 Hong Kong', '到达香港 Arrive in Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4447', '132584821786', '2016-08-17 04:56:58', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4448', '132584821786', '2016-08-17 08:00:14', '深圳 Shen Zhen', '清关流程 Customs clearance process');
INSERT INTO `jefsky_wuliu` VALUES ('4449', '132584821786', '2016-08-17 08:30:40', '香港 Hong Kong', '通关到港 Customs clearance to Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4450', '924185185773', '2016-08-17 03:58:37', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4451', '925328869640', '2016-08-12 15:30:32', '加拿大 Canada', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4452', '132584821786', '2016-08-17 14:53:08', '香港 Hong Kong', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4453', '924185185782', '2016-08-18 04:48:38', '香港 Hong Kong', '离开香港，转运中leave Hong Kong，in operation');
INSERT INTO `jefsky_wuliu` VALUES ('4454', '925357137634', '2016-08-17 09:56:38', '英国 UK', '派送并已签收 Delivery and receipt');
INSERT INTO `jefsky_wuliu` VALUES ('4455', '926076809240', '2016-08-18 01:50:56', '巴基斯坦 PAKISTAN', '快件到达中转中心 Express arrival Transfer Center');
INSERT INTO `jefsky_wuliu` VALUES ('4456', '924675220883', '2016-08-18 02:53:10', '香港 Hong Kong', '正在（已经）安排下一站转运 (already) arrangements for the next station');
INSERT INTO `jefsky_wuliu` VALUES ('4457', '925364707047', '2016-08-18 03:54:55', '英国 UK', '到达英国 Arrive in UK');
INSERT INTO `jefsky_wuliu` VALUES ('4458', '924185185773', '2016-08-17 08:33:13', '深圳 Shen Zhen', '出口申报中 Export declaration');
INSERT INTO `jefsky_wuliu` VALUES ('4459', '924185185773', '2016-08-18 09:09:39', '香港 Hong Kong', '到达香港 Arrive in Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4460', '953005860660', '2016-08-17 13:14:41', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4461', '953005860660', '2016-08-18 08:41:20', '香港 Hong Kong', '到达香港 Arrive in Hong Kong');
INSERT INTO `jefsky_wuliu` VALUES ('4462', '925106009146', '2016-08-18 03:17:15', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
INSERT INTO `jefsky_wuliu` VALUES ('4463', '925106009155', '2016-08-18 03:17:33', '东莞 Dong Guang', '离开东莞 Leave Dongguan');
