-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- 主机: localhost
-- 生成日期: 2017 年 05 月 11 日 02:55
-- 服务器版本: 5.5.24-log
-- PHP 版本: 5.4.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `blog`
--

-- --------------------------------------------------------

--
-- 表的结构 `blog_admin`
--

CREATE TABLE IF NOT EXISTS `blog_admin` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '管理员ID',
  `username` varchar(60) NOT NULL COMMENT '管理员名字',
  `password` char(32) NOT NULL COMMENT '管理员密码',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `blog_admin`
--

INSERT INTO `blog_admin` (`id`, `username`, `password`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3'),
(3, '888', '0a113ef6b61820daa5611c870ed8d5ee');

-- --------------------------------------------------------

--
-- 表的结构 `blog_article`
--

CREATE TABLE IF NOT EXISTS `blog_article` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `title` varchar(60) NOT NULL COMMENT '文章标题',
  `desc` varchar(255) NOT NULL COMMENT '文章描述',
  `pic` varchar(100) NOT NULL COMMENT '文章图片',
  `content` text NOT NULL COMMENT '文章内容',
  `cateid` mediumint(9) NOT NULL COMMENT '文章所属栏目ID',
  `time` int(12) NOT NULL COMMENT '发布时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=32 ;

--
-- 转存表中的数据 `blog_article`
--

INSERT INTO `blog_article` (`id`, `title`, `desc`, `pic`, `content`, `cateid`, `time`) VALUES
(27, 'PHP再建站', '为了验证时间戳的正确与否写', './Public/Uploads/2017-04-24/58fd964d279f0.jpg', '&lt;p&gt;时间戳&lt;/p&gt;', 2, 1493014093),
(22, 'PHP初建站', '遇到的一些一些问题、心得', '', '&lt;p&gt;&amp;nbsp;&amp;nbsp;今天，进一步练习thinkphp框架，发现不用很久的语法再次生疏了。&lt;img src=&quot;http://img.baidu.com/hi/jx2/j_0065.gif&quot;/&gt;幸好，有个大兄弟不觉我烦躁，耐心地指导我，帮助我完成文件上传、图片路径等问题。我还从他身上学到了很宝贵的调试经验。虽然我现在调试速度很慢，打代码速度也不快。但是我会继续努力的。把这个项目做得完善，做得到位。麻雀虽小，五脏俱全！从小做起！从细节做起！fighting!&lt;img src=&quot;http://img.baidu.com/hi/jx2/j_0003.gif&quot;/&gt;&lt;/p&gt;', 2, 0),
(19, '二二', '啊', '', '&lt;p&gt;地方该罚的个&lt;/p&gt;', 2, 0),
(26, '试试水', '试试水', './Public/Uploads/2017-04-23/58fc0ec9de0bb.jpg', '&lt;p&gt;试试水&lt;/p&gt;', 3, 1492913865),
(28, '罗楠是SB', '这是一个悲伤的故事！', './Public/Uploads/2017-04-24/58fdee85c0e59.jpg', '&lt;p&gt;嗯。就是个SB&lt;/p&gt;', 4, 1493036677),
(25, '是是是是', '啊啊啊', './Public/Uploads/2017-04-23/58fc0dd308fe1.jpg', '&lt;p&gt;电风扇过热个&lt;/p&gt;', 3, 1492913619);

-- --------------------------------------------------------

--
-- 表的结构 `blog_cate`
--

CREATE TABLE IF NOT EXISTS `blog_cate` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `catename` varchar(60) NOT NULL COMMENT '栏目名称',
  `sort` mediumint(9) NOT NULL DEFAULT '20' COMMENT '栏目排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

--
-- 转存表中的数据 `blog_cate`
--

INSERT INTO `blog_cate` (`id`, `catename`, `sort`) VALUES
(2, 'PHP初出茅庐', 4),
(3, '歌词经典', 3),
(4, '生活日记', 20),
(5, '伤感文字', 20),
(6, '心灵拾句', 20),
(7, '', 20);

-- --------------------------------------------------------

--
-- 表的结构 `blog_link`
--

CREATE TABLE IF NOT EXISTS `blog_link` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '链接ID',
  `title` varchar(50) NOT NULL COMMENT '链接标题',
  `url` varchar(100) NOT NULL COMMENT '链接地址',
  `desc` varchar(255) NOT NULL COMMENT '链接描述',
  `sort` mediumint(9) NOT NULL DEFAULT '20' COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `blog_link`
--

INSERT INTO `blog_link` (`id`, `title`, `url`, `desc`, `sort`) VALUES
(1, 'PHP中文网', 'www.php.cn', 'PHP中文网', 1),
(2, 'thinkphp中文网', 'www.thinkphp.cn', 'thinkphp中文网', 2),
(5, '百度一下', 'www.baidu.com', '百度一下', 20),
(4, '意空间', 'yispace.net/', '意空间', 1);

-- --------------------------------------------------------

--
-- 表的结构 `tb_smalltype`
--

CREATE TABLE IF NOT EXISTS `tb_smalltype` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(20) NOT NULL,
  `s_sum` int(11) NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- 转存表中的数据 `tb_smalltype`
--

INSERT INTO `tb_smalltype` (`s_id`, `s_name`, `s_sum`) VALUES
(1, 'PHP', 0),
(2, 'Web', 0),
(3, '数据库', 0),
(4, 'PHP框架', 0),
(5, 'IT信息资讯', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
