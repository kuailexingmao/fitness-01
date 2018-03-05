/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.18-log : Database - fitness
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`fitness` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fitness`;

/*Table structure for table `t_c_u` */

DROP TABLE IF EXISTS `t_c_u`;

CREATE TABLE `t_c_u` (
  `certifyno` int(30) DEFAULT NULL COMMENT '用户身份证号',
  `cno` int(30) DEFAULT NULL COMMENT '课程编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_c_u` */

/*Table structure for table `t_class` */

DROP TABLE IF EXISTS `t_class`;

CREATE TABLE `t_class` (
  `cid` int(30) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `cno` varchar(30) NOT NULL COMMENT '课程编号',
  `cname` varchar(30) DEFAULT NULL COMMENT '课程名称',
  `ctime` int(20) DEFAULT NULL COMMENT '课程时长',
  `cprice` double(16,2) DEFAULT NULL COMMENT '单节课程价格',
  PRIMARY KEY (`cid`,`cno`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_class` */

insert  into `t_class`(`cid`,`cno`,`cname`,`ctime`,`cprice`) values (1,'1001','健身操',6,600.00),(3,'3001','有氧运动',6,600.00),(4,'4001','增肌方法',3,300.00),(5,'5001','扩胸运动',5,500.00),(6,'6001','腿部塑性',6,600.00),(7,'2001','瑜伽',24,998.00);

/*Table structure for table `t_emp` */

DROP TABLE IF EXISTS `t_emp`;

CREATE TABLE `t_emp` (
  `eid` int(30) NOT NULL AUTO_INCREMENT COMMENT ' 序列号',
  `ename` varchar(20) NOT NULL COMMENT '员工名字',
  `tel` varchar(20) DEFAULT NULL COMMENT '员工手机号',
  `address` varchar(30) DEFAULT NULL COMMENT '员工住址',
  `email` varchar(30) DEFAULT NULL COMMENT '员工邮箱',
  `jointime` date DEFAULT NULL COMMENT '入职时间',
  `username` varchar(30) NOT NULL COMMENT '用户名',
  `password` varchar(30) NOT NULL COMMENT '密码',
  `lastupdatetime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `isboss` char(2) NOT NULL DEFAULT '0' COMMENT '判断是否为管理0不是1是',
  PRIMARY KEY (`eid`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `t_emp` */

insert  into `t_emp`(`eid`,`ename`,`tel`,`address`,`email`,`jointime`,`username`,`password`,`lastupdatetime`,`isboss`) values (1,'张三','13254687895','河南省郑州市金水区','123@qq.com','2017-09-07','zhangs','111aaa','2017-09-07 21:45:31','1'),(2,'李四','13254687895','河南省郑州市金水区','123@qq.com','2017-09-07','lis','111aaa','2017-09-07 21:45:31','0'),(3,'张三1','13254687895','河南省郑州市金水区','123@qq.com','2017-09-07','zhangs1','111aaa','2017-09-07 21:45:31','1'),(4,'张三2','13254687895','河南省郑州市金水区','123@qq.com','2017-09-07','zhangs2','111aaa','2017-09-07 21:45:31','1'),(5,'张三4','13254687895','河南省郑州市金水区','123@qq.com','2017-09-07','zhangs3','111aaa','2017-09-07 21:45:31','1'),(6,'张三3','13254687895','河南省郑州市金水区','123@qq.com','2017-09-07','zhangs4','111aaa','2017-09-07 21:45:31','1'),(7,'李四5','13254687895','河南省郑州市金水区','123@qq.com','2017-09-07','lis111','111aaa','2017-10-08 14:26:46','0'),(8,'李四6','13254687895','河南省郑州市金水区','123@qq.com','2017-09-07','lis222','111aaa','2017-10-08 14:38:17','0'),(9,'李四7','13254687895','河南省郑州市金水区','123@qq.com','2017-09-07','lis3','111aaa','2017-09-07 21:45:31','0'),(10,'李四8','13254687895','河南省郑州市金水区','123@qq.com','2017-09-07','lis4','111aaa','2017-10-08 14:38:04','0'),(13,'李四9','13254687895','河南省郑州市金水区','123@qq.com','2017-09-07','lis5','111aaa','2017-09-07 21:45:31','0'),(14,'李四10','13254687895','河南省郑州市金水区','123@qq.com','2017-09-07','lis6','111aaa','2017-09-07 21:45:31','0'),(15,'王五','13526485545','郑州市金水区黄河路','123@qq.com','2017-10-17','wangw','111aaa','2017-10-08 15:42:34','0');

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `mid` int(30) NOT NULL AUTO_INCREMENT COMMENT '菜单id',
  `mname` varchar(30) DEFAULT NULL COMMENT '菜单名称',
  `pid` varchar(30) DEFAULT NULL COMMENT '父id',
  `path` varchar(255) DEFAULT NULL COMMENT '请求路径',
  `target` varchar(255) DEFAULT NULL COMMENT '目标地址',
  `icon` varchar(255) DEFAULT NULL COMMENT '菜单图片',
  `isshow` char(2) NOT NULL DEFAULT '1' COMMENT '是否显示0不显示1显示',
  PRIMARY KEY (`mid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_menu` */

insert  into `t_menu`(`mid`,`mname`,`pid`,`path`,`target`,`icon`,`isshow`) values (1,'员工管理','0','./emp/toListEmp.do',NULL,'./ztree3/zTreeStyle/img/diy/2.png','1'),(2,'添加员工','1','./emp/toAddEmp.do',NULL,'./ztree3/zTreeStyle/img/diy/2.png','1'),(5,'客户管理','0','./user/toListUser.do',NULL,'./ztree3/zTreeStyle/img/diy/2.png','0'),(6,'添加客户','5','./user/toAddUser.do',NULL,'./ztree3/zTreeStyle/img/diy/2.png','0'),(7,'课程管理','0','./clazz/toListClazz.do',NULL,'./ztree3/zTreeStyle/img/diy/2.png','0'),(8,'添加课程','7','./clazz/toAddClazz.do',NULL,'./ztree3/zTreeStyle/img/diy/2.png','0'),(9,'会员查看','5',NULL,NULL,'./ztree3/zTreeStyle/img/diy/2.png','0'),(10,'缴费记录','5',NULL,NULL,'./ztree3/zTreeStyle/img/diy/2.png','0');

/*Table structure for table `t_paycost` */

DROP TABLE IF EXISTS `t_paycost`;

CREATE TABLE `t_paycost` (
  `pid` int(30) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `pname` varchar(30) DEFAULT NULL COMMENT '用户名',
  `ptel` varchar(30) DEFAULT NULL COMMENT '联系方式',
  `certifyno` varchar(30) DEFAULT NULL COMMENT '身份证号',
  `paytime` date DEFAULT NULL COMMENT '缴费时间',
  `recordpeople` varchar(30) NOT NULL COMMENT '记录员',
  `payaccount` double(16,2) unsigned DEFAULT NULL COMMENT '缴费额度',
  `note` tinytext COMMENT '其他备注',
  PRIMARY KEY (`pid`,`recordpeople`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_paycost` */

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `uid` int(30) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uname` varchar(30) DEFAULT NULL COMMENT '用户名称',
  `sex` char(2) DEFAULT NULL COMMENT '用户性别',
  `certifyno` varchar(30) DEFAULT NULL COMMENT '身份证号',
  `tel` varchar(30) DEFAULT NULL COMMENT '联系方式',
  `address` varchar(30) DEFAULT NULL COMMENT '用户地址',
  `email` varchar(30) DEFAULT NULL COMMENT '邮箱',
  `opentime` date DEFAULT NULL COMMENT '开户时间',
  `isvip` char(2) NOT NULL DEFAULT '0' COMMENT '是否为VIP0不是1是',
  `lastupdatetime` datetime DEFAULT NULL COMMENT '最后修改时间',
  `vipcardid` varchar(30) DEFAULT NULL COMMENT 'vip卡号',
  `viptime` date DEFAULT NULL COMMENT 'vip时间',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `pk_certifyno` (`certifyno`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`uid`,`uname`,`sex`,`certifyno`,`tel`,`address`,`email`,`opentime`,`isvip`,`lastupdatetime`,`vipcardid`,`viptime`) values (1,'王者','1','410522198009123142','13459082204','河南省郑州市金水区金水路131号','123@qq.com','2017-10-10','1','2017-10-10 11:00:10','452343443','2017-10-10'),(2,'荣耀','0','410522198009345142','13452342204','河南省郑州市金水区金水路143号','123@qq.com','2017-10-18','0','2017-10-18 09:56:48',NULL,NULL),(3,'荣耀1','0','410522198009345242','13452342204','河南省郑州市金水区金水路143号','123@qq.com','2017-10-18','0','2017-10-18 09:56:48',NULL,NULL),(4,'王者1','1','410522198009145142','13459082204','河南省郑州市金水区金水路131号','123@qq.com','2017-10-10','1','2017-10-10 11:00:10','452343443','2017-10-10'),(6,'荣耀3','0','410522198009575142','13452342204','河南省郑州市金水区金水路143号','123@qq.com','2017-10-18','0','2017-10-18 09:56:48',NULL,NULL),(7,'王者2','1','410522198689123142','13459082204','河南省郑州市金水区金水路131号','123@qq.com','2017-10-10','1','2017-10-10 11:00:10','452343443','2017-10-10');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
