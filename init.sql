/*
SQLyog Ultimate v11.24 (32 bit)
MySQL - 5.6.17 : Database - db_xuxu
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_xuxu` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_xuxu`;

/*Table structure for table `t_msg_contact` */

DROP TABLE IF EXISTS `t_msg_contact`;

CREATE TABLE `t_msg_contact` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `msg_contact_to` int(10) NOT NULL COMMENT '接收者id',
  `msg_contact_uname` varchar(200) NOT NULL COMMENT '接收者姓名',
  `msg_contact_cid` int(10) NOT NULL COMMENT '消息内容id',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_msg_contact` */

/*Table structure for table `t_msg_content` */

DROP TABLE IF EXISTS `t_msg_content`;

CREATE TABLE `t_msg_content` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `msg_content_type` char(6) NOT NULL COMMENT '消息类型',
  `msg_content_txt` text COMMENT '消息文本内容',
  `msg_content_media` varchar(2000) DEFAULT NULL COMMENT '消息多媒体内容',
  `msg_content_del` char(6) NOT NULL COMMENT '消息撤回标志',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_msg_content` */

/*Table structure for table `t_ucenter_menu` */

DROP TABLE IF EXISTS `t_ucenter_menu`;

CREATE TABLE `t_ucenter_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ucenter_menu_title` varchar(200) NOT NULL COMMENT '菜单名称',
  `ucenter_menu_url` varchar(200) DEFAULT '--' COMMENT '菜单地址',
  `ucenter_menu_sn` char(2) NOT NULL COMMENT '菜单序号',
  `ucenter_menu_type` char(6) NOT NULL COMMENT '菜单类型',
  `ucenter_menu_parent_id` int(10) NOT NULL DEFAULT '0' COMMENT '菜单父id',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=192 DEFAULT CHARSET=utf8;

/*Data for the table `t_ucenter_menu` */

insert  into `t_ucenter_menu`(`id`,`ucenter_menu_title`,`ucenter_menu_url`,`ucenter_menu_sn`,`ucenter_menu_type`,`ucenter_menu_parent_id`,`cdate`,`cuser_name`,`cuser_id`) values (1,'菜单管理','/ucenter/menu','01','000101',18,'2014-09-11 00:00:00','uikoo9',1),(8,'用户管理','/ucenter/user','02','000101',18,'2014-09-11 00:00:00','uikoo9',1),(18,'auth','--','01','000101',0,'2014-12-10 15:26:52','admin',2),(23,'角色管理','/ucenter/role','03','000101',18,'2014-12-11 20:32:55','admin',2),(26,'fore','--','99','000102',0,'2014-12-18 15:49:47','admin',2),(34,'login','--','00','000102',26,'2014-12-18 16:26:13','admin',2),(35,'login-修改密码页面','/login/modifyPwdp','01','000102',34,'2014-12-18 16:26:38','admin',2),(36,'login-修改密码','/login/modifyPwd','02','000102',34,'2014-12-18 16:26:58','admin',2),(88,'管理-首页','/manage','01','000102',26,'2015-03-12 13:36:16','uikoo9',0),(90,'添加','/ucenter/menu/add','1','000101',1,'2015-03-12 13:51:57','uikoo9',0),(91,'编辑','/ucenter/menu/savep','2','000101',1,'2015-03-12 13:52:12','uikoo9',0),(92,'保存','/ucenter/menu/save','3','000101',1,'2015-03-12 13:52:24','uikoo9',0),(93,'删除','/ucenter/menu/del','4','000101',1,'2015-03-12 13:52:39','uikoo9',0),(94,'编辑','/ucenter/user/savep','1','000101',8,'2015-03-12 13:53:08','uikoo9',0),(95,'保存','/ucenter/user/save','2','000101',8,'2015-03-12 13:53:23','uikoo9',0),(96,'删除','/ucenter/user/del','3','000101',8,'2015-03-12 13:53:37','uikoo9',0),(97,'编辑','/ucenter/role/savep','1','000101',23,'2015-03-12 13:54:42','uikoo9',0),(98,'保存','/ucenter/role/save','2','000101',23,'2015-03-12 13:55:26','uikoo9',0),(99,'删除','/ucenter/role/del','3','000101',23,'2015-03-12 13:55:37','uikoo9',0),(100,'设置用户','/ucenter/role/setUser','4','000101',23,'2015-03-12 13:56:16','uikoo9',0),(101,'添加用户','/ucenter/role/addUser','5','000101',23,'2015-03-12 13:56:37','uikoo9',0),(102,'移除用户','/ucenter/role/removeUser','6','000101',23,'2015-03-12 13:57:05','uikoo9',0),(103,'设置权限','/ucenter/role/setUrl','7','000101',23,'2015-03-12 13:57:42','uikoo9',0),(104,'保存权限','/ucenter/role/saveUrl','8','000101',23,'2015-03-12 13:57:59','uikoo9',0),(159,'搜索','/ucenter/user/search','00','000101',8,'2015-09-01 11:59:51','admin',2),(160,'搜索','/ucenter/role/search','00','000101',23,'2015-09-01 12:00:14','admin',2),(181,'消息联系管理','/msg/contact','01','000101',186,'2015-11-18 20:15:50','admin',2),(182,'搜索','/msg/contact/search','01','000101',181,'2015-11-18 20:16:33','admin',2),(183,'编辑','/msg/contact/savep','02','000101',181,'2015-11-18 20:16:55','admin',2),(184,'保存','/msg/contact/save','03','000101',181,'2015-11-18 20:17:20','admin',2),(185,'删除','/msg/contact/del','04','000101',181,'2015-11-18 20:17:45','admin',2),(186,'msg','--','08','000101',0,'2015-11-18 20:19:16','admin',2),(187,'消息内容管理','/msg/content','02','000101',186,'2015-11-18 20:21:45','admin',2),(188,'搜索','/msg/content/search','01','000101',187,'2015-11-18 20:22:09','admin',2),(189,'编辑','/msg/content/savep','02','000101',187,'2015-11-18 20:22:31','admin',2),(190,'保存','/msg/content/save','03','000101',187,'2015-11-18 20:22:51','admin',2),(191,'删除','/msg/content/del','04','000101',187,'2015-11-18 20:23:08','admin',2);

/*Table structure for table `t_ucenter_role` */

DROP TABLE IF EXISTS `t_ucenter_role`;

CREATE TABLE `t_ucenter_role` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ucenter_role_name` varchar(200) NOT NULL COMMENT '角色名称',
  `ucenter_role_login_url` varchar(200) NOT NULL COMMENT '角色跳转地址',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_ucenter_role` */

insert  into `t_ucenter_role`(`id`,`ucenter_role_name`,`ucenter_role_login_url`,`cdate`,`cuser_id`,`cuser_name`) values (7,'超级管理员','/manage','2015-03-12 13:20:45',0,'uikoo9');

/*Table structure for table `t_ucenter_role_r_menu` */

DROP TABLE IF EXISTS `t_ucenter_role_r_menu`;

CREATE TABLE `t_ucenter_role_r_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ucenter_role_id` int(10) NOT NULL COMMENT '角色id',
  `ucenter_menu_id` int(10) NOT NULL COMMENT '菜单id',
  `ucenter_menu_url` varchar(200) NOT NULL COMMENT '菜单url',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2910 DEFAULT CHARSET=utf8;

/*Data for the table `t_ucenter_role_r_menu` */

insert  into `t_ucenter_role_r_menu`(`id`,`ucenter_role_id`,`ucenter_menu_id`,`ucenter_menu_url`,`cdate`,`cuser_id`,`cuser_name`) values (2872,7,18,'--','2015-11-19 22:53:12',2,'admin'),(2873,7,1,'/ucenter/menu','2015-11-19 22:53:12',2,'admin'),(2874,7,90,'/ucenter/menu/add','2015-11-19 22:53:12',2,'admin'),(2875,7,91,'/ucenter/menu/savep','2015-11-19 22:53:12',2,'admin'),(2876,7,92,'/ucenter/menu/save','2015-11-19 22:53:12',2,'admin'),(2877,7,93,'/ucenter/menu/del','2015-11-19 22:53:12',2,'admin'),(2878,7,8,'/ucenter/user','2015-11-19 22:53:12',2,'admin'),(2879,7,159,'/ucenter/user/search','2015-11-19 22:53:12',2,'admin'),(2880,7,94,'/ucenter/user/savep','2015-11-19 22:53:12',2,'admin'),(2881,7,95,'/ucenter/user/save','2015-11-19 22:53:12',2,'admin'),(2882,7,96,'/ucenter/user/del','2015-11-19 22:53:12',2,'admin'),(2883,7,23,'/ucenter/role','2015-11-19 22:53:12',2,'admin'),(2884,7,160,'/ucenter/role/search','2015-11-19 22:53:12',2,'admin'),(2885,7,97,'/ucenter/role/savep','2015-11-19 22:53:12',2,'admin'),(2886,7,98,'/ucenter/role/save','2015-11-19 22:53:12',2,'admin'),(2887,7,99,'/ucenter/role/del','2015-11-19 22:53:12',2,'admin'),(2888,7,100,'/ucenter/role/setUser','2015-11-19 22:53:12',2,'admin'),(2889,7,101,'/ucenter/role/addUser','2015-11-19 22:53:12',2,'admin'),(2890,7,102,'/ucenter/role/removeUser','2015-11-19 22:53:12',2,'admin'),(2891,7,103,'/ucenter/role/setUrl','2015-11-19 22:53:12',2,'admin'),(2892,7,104,'/ucenter/role/saveUrl','2015-11-19 22:53:12',2,'admin'),(2893,7,186,'--','2015-11-19 22:53:12',2,'admin'),(2894,7,181,'/msg/contact','2015-11-19 22:53:12',2,'admin'),(2895,7,182,'/msg/contact/search','2015-11-19 22:53:12',2,'admin'),(2896,7,183,'/msg/contact/savep','2015-11-19 22:53:12',2,'admin'),(2897,7,184,'/msg/contact/save','2015-11-19 22:53:12',2,'admin'),(2898,7,185,'/msg/contact/del','2015-11-19 22:53:12',2,'admin'),(2899,7,187,'/msg/content','2015-11-19 22:53:12',2,'admin'),(2900,7,188,'/msg/content/search','2015-11-19 22:53:12',2,'admin'),(2901,7,189,'/msg/content/savep','2015-11-19 22:53:12',2,'admin'),(2902,7,190,'/msg/content/save','2015-11-19 22:53:12',2,'admin'),(2903,7,191,'/msg/content/del','2015-11-19 22:53:12',2,'admin'),(2904,7,34,'--','2015-11-19 22:53:12',2,'admin'),(2905,7,35,'/login/modifyPwdp','2015-11-19 22:53:12',2,'admin'),(2906,7,36,'/login/modifyPwd','2015-11-19 22:53:12',2,'admin'),(2907,7,153,'/login/modifyNicknamep','2015-11-19 22:53:12',2,'admin'),(2908,7,154,'/login/modifyNickname','2015-11-19 22:53:12',2,'admin'),(2909,7,88,'/manage','2015-11-19 22:53:12',2,'admin');

/*Table structure for table `t_ucenter_role_r_user` */

DROP TABLE IF EXISTS `t_ucenter_role_r_user`;

CREATE TABLE `t_ucenter_role_r_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ucenter_role_id` int(10) NOT NULL COMMENT '角色id',
  `ucenter_user_id` int(10) NOT NULL COMMENT '用户id',
  `ucenter_user_name` varchar(200) NOT NULL COMMENT '用户姓名',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_ucenter_role_r_user` */

insert  into `t_ucenter_role_r_user`(`id`,`ucenter_role_id`,`ucenter_user_id`,`ucenter_user_name`,`cdate`,`cuser_id`,`cuser_name`) values (3,7,2,'admin','2015-03-12 13:20:58',0,'uikoo9');

/*Table structure for table `t_ucenter_user` */

DROP TABLE IF EXISTS `t_ucenter_user`;

CREATE TABLE `t_ucenter_user` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `ucenter_user_name` varchar(200) NOT NULL COMMENT '用户名',
  `ucenter_user_password` varchar(200) NOT NULL COMMENT '用户密码',
  `ucenter_user_type` char(6) NOT NULL COMMENT '用户类型',
  `ucenter_user_mobi` char(11) DEFAULT NULL COMMENT '用户手机',
  `ucenter_user_mobi_code` char(6) DEFAULT NULL COMMENT '用户手机验证码',
  `ucenter_user_mobi_code_date` datetime DEFAULT NULL COMMENT '用户手机验证码时间',
  `ucenter_user_mobi_code_confirm` char(6) DEFAULT NULL COMMENT '用户手机验证码确认',
  `ucenter_user_mail` varchar(200) DEFAULT NULL COMMENT '用户邮箱',
  `ucenter_user_mail_confirm` char(6) DEFAULT NULL COMMENT '用户邮箱确认',
  `cdate` datetime NOT NULL COMMENT '创建时间',
  `cuser_name` varchar(200) NOT NULL COMMENT '创建人姓名',
  `cuser_id` int(10) NOT NULL COMMENT '创建人id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `t_ucenter_user` */

insert  into `t_ucenter_user`(`id`,`ucenter_user_name`,`ucenter_user_password`,`ucenter_user_type`,`ucenter_user_mobi`,`ucenter_user_mobi_code`,`ucenter_user_mobi_code_date`,`ucenter_user_mobi_code_confirm`,`ucenter_user_mail`,`ucenter_user_mail_confirm`,`cdate`,`cuser_name`,`cuser_id`) values (2,'admin','ISMvKXpXpadDiUoOSoAfww==','010101','17080157325','123456','2014-10-09 14:55:38','000101','admin','000101','2014-10-09 14:55:38','admin',0);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
