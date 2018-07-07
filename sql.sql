/*
SQLyog Enterprise v12.09 (64 bit)
MySQL - 5.7.16 : Database - imooc
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`imooc` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `dzdp`;

/*Table structure for table `ad` */

DROP TABLE IF EXISTS `ad`;

CREATE TABLE `ad` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `img_file_name` varchar(100) DEFAULT NULL COMMENT '图片文件名',
  `link` varchar(200) DEFAULT NULL COMMENT '链接地址',
  `weight` int(11) DEFAULT NULL COMMENT '权重',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `ad` */

insert  into `ad`(`id`,`title`,`img_file_name`,`link`,`weight`) values (1,'暑假6折','1495353501938_ad_1.png','http://www.imooc.com/wap/index',6),(2,'特价出国','1495353568008_ad_2.png','http://www.imooc.com/wap/index',5),(3,'亮亮车','1495353623949_ad_3.png','http://www.imooc.com/wap/index',4),(4,'学钢琴','1495353664627_ad_4.png','http://www.imooc.com/wap/index',3),(5,'电影','1495353700766_ad_5.png','http://www.imooc.com/wap/index',2),(6,'旅游热线','1495353735839_ad_6.png','http://www.imooc.com/wap/index',1),(8,'小柴','1527945961935_微信图片_20180130120812.jpg','www',5);

/*Table structure for table `business` */

DROP TABLE IF EXISTS `business`;

CREATE TABLE `business` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `img_file_name` varchar(100) DEFAULT NULL COMMENT '图片文件名',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `subtitle` varchar(100) DEFAULT NULL COMMENT '副标题',
  `price` decimal(11,2) DEFAULT NULL COMMENT '价格(单位：元)',
  `distance` int(11) DEFAULT NULL COMMENT '距离(单位：米)',
  `number` int(11) DEFAULT NULL COMMENT '已售数量',
  `desc` varchar(500) DEFAULT NULL COMMENT '描述',
  `city` varchar(16) DEFAULT NULL COMMENT '城市',
  `category` varchar(16) DEFAULT NULL COMMENT '类别',
  `star_total_num` int(11) DEFAULT NULL COMMENT '评论星星总数',
  `comment_total_num` int(11) DEFAULT NULL COMMENT '评论总次数',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `business` */

insert  into `business`(`id`,`img_file_name`,`title`,`subtitle`,`price`,`distance`,`number`,`desc`,`city`,`category`,`star_total_num`,`comment_total_num`) values (1,'1495354718489_business_1.png','汉堡大大大','叫我汉堡大大，还你多彩口味','28.00',120,0,'1、当图片在app上不显示时，请查看system.properties里的访问路径，保存路径，如果看懂了视频：\r\n应该知道这个配置文件里的参数怎么改、我给你们的图片放在哪就可以了。<br/>2、后台管理用户名密码：admin/admin<br/>3、如果出现“没有权限访问请求资源，请切换账户后重试！”，请不要着急，先把applicationContext-web.xml中关于AuthInterceptor拦截器部分注释掉，等把拦截器听懂再来看看怎么回事！','北京','meishi',0,0),(2,'1528209165235_1516173010(1).jpg','可口可乐','康师傅可口可乐','15.00',33,0,'康师傅可口可乐康师傅可口可乐','上海','meishi',0,0);

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `orders_id` int(11) DEFAULT NULL COMMENT '用户名',
  `comment` varchar(500) DEFAULT NULL COMMENT '评论内容',
  `star` int(1) DEFAULT NULL COMMENT '星级评分',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Normal_create_time` (`create_time`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `dic` */

DROP TABLE IF EXISTS `dic`;

CREATE TABLE `dic` (
  `type` varchar(16) NOT NULL,
  `code` varchar(16) NOT NULL,
  `name` varchar(16) NOT NULL,
  `weight` int(11) DEFAULT NULL,
  PRIMARY KEY (`type`,`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `dic` */

insert  into `dic`(`type`,`code`,`name`,`weight`) values ('category','jiehun','结婚',4),('category','jingdian','景点',1),('category','ktv','KTV',2),('category','meishi','美食',3),('city','上海','上海',2),('city','北京','北京',1),('city','广州','广州',3),('httpMethod','DELETE','DELETE',2),('httpMethod','GET','GET',4),('httpMethod','POST','POST',1),('httpMethod','PUT','PUT',3);

/*Table structure for table `member` */

DROP TABLE IF EXISTS `member`;

CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` bigint(13) DEFAULT NULL COMMENT '手机号',
  `name` varchar(16) DEFAULT NULL COMMENT '用户名',
  `password` char(32) DEFAULT NULL COMMENT '密码',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone_unique` (`phone`),
  UNIQUE KEY `name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `member` */

insert  into `member`(`id`,`phone`,`name`,`password`) values (1,13912345678,NULL,NULL),(2,13800138000,NULL,NULL);

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `business_id` int(11) DEFAULT NULL COMMENT '商户主键',
  `member_id` int(11) DEFAULT NULL COMMENT '会员主键',
  `num` int(11) DEFAULT NULL COMMENT '消费人数',
  `comment_state` int(1) DEFAULT NULL COMMENT '评论状态 -- 0：未评论 2：已评论',
  `price` decimal(11,2) DEFAULT NULL COMMENT '价格(消费金额)',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

insert  into `orders`(`id`,`business_id`,`member_id`,`num`,`comment_state`,`price`,`create_time`) values (2,1,1,1,NULL,'12.00','2018-06-16 20:03:35'),(3,1,1,1,NULL,'15.00','2018-06-16 19:03:49'),(4,1,1,1,NULL,'16.00','2018-06-16 18:04:37');

/*Table structure for table `sys_action` */

DROP TABLE IF EXISTS `sys_action`;

CREATE TABLE `sys_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL COMMENT '动作名称',
  `url` varchar(200) DEFAULT NULL COMMENT '动作地址',
  `menu_id` int(11) DEFAULT NULL,
  `method` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COMMENT='系统表-操作表，权限拦截用，存放系统里全部动作。';

/*Data for the table `sys_action` */

insert  into `sys_action`(`id`,`name`,`url`,`menu_id`,`method`) values (1,'浏览','/auth',2,''),(2,'浏览用户','/users',2,''),(3,'维护用户','/users/.{1,}',2,''),(4,'浏览用户组','/groups',2,''),(5,'维护用户组','/groups/.{1,}',2,''),(6,'分配菜单','/groups/.{1,}/menus',2,''),(7,'浏览菜单','/menus',2,''),(8,'维护菜单','/menus/.{1,}',2,''),(9,'菜单排序','/menus/.{1,}/.{1,}/.{1,}',2,''),(10,'浏览动作','/actions',2,''),(11,'维护动作','/actions/.{1,}',2,''),(12,'浏览','/ad',4,''),(13,'查询','/ad/search',4,''),(14,'删除','/ad/remove',4,''),(15,'新增页初始化','/ad/addInit',4,''),(16,'新增','/ad/add',4,''),(17,'修改页初始化','/ad/modifyInit',4,''),(18,'修改','/ad/modify',4,''),(19,'浏览','/businesses',5,'GET'),(20,'删除','/businesses/.{1,}',5,'DELETE'),(21,'新增页初始化','/businesses/addPage',5,'GET'),(22,'新增','/businesses',5,'POST'),(23,'修改页初始化','/businesses/.{1,}',5,'GET'),(24,'修改','/businesses/.{1,}',5,'PUT'),(25,'浏览','/orderReport',9,''),(26,'统计','/orderReport/count',9,'GET'),(27,'浏览','/orders',7,'GET'),(29,'浏览','/comments',6,'GET');

/*Table structure for table `sys_group` */

DROP TABLE IF EXISTS `sys_group`;

CREATE TABLE `sys_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `sys_group` */

insert  into `sys_group`(`id`,`name`) values (1,'系统管理员'),(2,'管理'),(3,'业务组');

/*Table structure for table `sys_group_action` */

DROP TABLE IF EXISTS `sys_group_action`;

CREATE TABLE `sys_group_action` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `action_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=112 DEFAULT CHARSET=utf8;

/*Data for the table `sys_group_action` */

insert  into `sys_group_action`(`id`,`group_id`,`action_id`) values (27,3,13),(28,3,12),(29,3,14),(30,3,16),(31,3,15),(32,3,18),(33,3,17),(34,3,19),(35,3,20),(36,3,22),(37,3,21),(38,3,24),(39,3,23),(67,1,9),(68,1,6),(69,1,1),(70,1,7),(71,1,10),(72,1,2),(73,1,4),(74,1,8),(75,1,11),(76,1,3),(77,1,5),(78,1,13),(79,1,12),(80,1,14),(81,1,16),(82,1,15),(83,1,18),(84,1,17),(85,1,19),(86,1,20),(87,1,22),(88,1,21),(89,1,24),(90,1,23),(91,1,27),(92,1,29),(93,1,25),(94,1,26),(95,2,13),(96,2,12),(97,2,14),(98,2,16),(99,2,15),(100,2,18),(101,2,17),(102,2,19),(103,2,20),(104,2,22),(105,2,21),(106,2,24),(107,2,23),(108,2,27),(109,2,29),(110,2,25),(111,2,26);

/*Table structure for table `sys_group_menu` */

DROP TABLE IF EXISTS `sys_group_menu`;

CREATE TABLE `sys_group_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `menu_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

/*Data for the table `sys_group_menu` */

insert  into `sys_group_menu`(`id`,`group_id`,`menu_id`) values (10,3,3),(11,3,4),(12,3,5),(13,3,6),(14,3,7),(24,1,1),(25,1,2),(26,1,3),(27,1,4),(28,1,5),(29,1,7),(30,1,6),(31,1,8),(32,1,9),(33,2,3),(34,2,4),(35,2,5),(36,2,7),(37,2,6),(38,2,8),(39,2,9);

/*Table structure for table `sys_menu` */

DROP TABLE IF EXISTS `sys_menu`;

CREATE TABLE `sys_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `url` varchar(256) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order_num` decimal(5,0) DEFAULT NULL COMMENT '排序值',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `sys_menu` */

insert  into `sys_menu`(`id`,`name`,`url`,`parent_id`,`order_num`) values (1,'系统管理','',0,'1'),(2,'权限管理','/auth',1,'1'),(3,'内容管理','',0,'2'),(4,'广告管理','/ad',3,'1'),(5,'商户管理','/businesses',3,'2'),(6,'评论查询','/comments',3,'5'),(7,'订单查询','/orders',3,'4'),(8,'统计报表','',0,'4'),(9,'订单统计','/orderReport',8,'1');

/*Table structure for table `sys_param` */

DROP TABLE IF EXISTS `sys_param`;

CREATE TABLE `sys_param` (
  `param_key` varchar(20) DEFAULT NULL,
  `param_value` datetime DEFAULT NULL,
  `param_desc` varchar(200) DEFAULT NULL,
  UNIQUE KEY `Unique_key` (`param_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统参数表';

/*Data for the table `sys_param` */

insert  into `sys_param`(`param_key`,`param_value`,`param_desc`) values ('last_sync_star_time',NULL,'最后一次同步星星数时间');

/*Table structure for table `sys_user` */

DROP TABLE IF EXISTS `sys_user`;

CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(32) NOT NULL COMMENT '用户名',
  `password` varchar(32) NOT NULL COMMENT '登录密码',
  `ch_name` varchar(32) DEFAULT NULL,
  `group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `Unique_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `sys_user` */

insert  into `sys_user`(`id`,`name`,`password`,`ch_name`,`group_id`) values (1,'admin','21232f297a57a5a743894a0e4a801fc3','超级管理员',1),(2,'zhangsan','01d7f40760960e7bd9443513f22ab9af','张三',NULL),(3,'lisi','dc3a8f1670d65bea69b7b65048a0ac40','李四四',NULL),(5,'xiaochai','113a337f82eeb1829a27c7b4ea124dbd','小柴',3);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
