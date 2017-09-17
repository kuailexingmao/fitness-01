/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.5.13 : Database - fitness
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
  `uid` int(30) DEFAULT NULL COMMENT '用户id',
  `cid` int(30) DEFAULT NULL COMMENT '课程id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_c_u` */

/*Table structure for table `t_class` */

DROP TABLE IF EXISTS `t_class`;

CREATE TABLE `t_class` (
  `cid` int(30) NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `cname` varchar(30) DEFAULT NULL COMMENT '课程名称',
  `ctime` int(20) DEFAULT NULL COMMENT '课程时长',
  `cprice` double(16,2) DEFAULT NULL COMMENT '单节课程价格',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_class` */

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_emp` */

insert  into `t_emp`(`eid`,`ename`,`tel`,`address`,`email`,`jointime`,`username`,`password`,`lastupdatetime`,`isboss`) values (1,'张三','13254687895','河南省郑州市金水区','123@qq.com','2017-09-07','zhangs','111aaa','2017-09-07 21:45:31','1'),(2,'李四','13520346602','河南省郑州市新郑','456@qq.com','2017-09-14','lis','111aaa','2017-09-14 21:47:51','0');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

/*Data for the table `t_menu` */

insert  into `t_menu`(`mid`,`mname`,`pid`,`path`,`target`,`icon`,`isshow`) values (1,'员工管理','0',NULL,NULL,'./ztree3/zTreeStyle/img/diy/2.png','1'),(2,'添加员工','1','./emp/addEmp.do',NULL,'./ztree3/zTreeStyle/img/diy/2.png','1'),(3,'删除员工','1',NULL,NULL,'./ztree3/zTreeStyle/img/diy/2.png','1'),(4,'修改员工','1',NULL,NULL,'./ztree3/zTreeStyle/img/diy/2.png','1'),(5,'客户管理','0',NULL,NULL,'./ztree3/zTreeStyle/img/diy/2.png','1'),(6,'添加客户','5',NULL,NULL,'./ztree3/zTreeStyle/img/diy/2.png','1'),(7,'删除客户','5',NULL,NULL,'./ztree3/zTreeStyle/img/diy/2.png','1'),(8,'修改客户','5',NULL,NULL,'./ztree3/zTreeStyle/img/diy/2.png','1');

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
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
