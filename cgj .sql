-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:8889
-- Generation Time: 2017-06-09 09:52:10
-- 服务器版本： 5.6.33
-- PHP Version: 5.6.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cgj`
--

-- --------------------------------------------------------

--
-- 表的结构 `cgj_admin_user`
--

CREATE TABLE `cgj_admin_user` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '管理员id',
  `account` varchar(50) NOT NULL COMMENT '管理员账号',
  `realname` varchar(50) NOT NULL COMMENT '管理别名',
  `last_login_time` int(11) NOT NULL COMMENT '最后一次登录时间',
  `last_login_ip` int(10) UNSIGNED NOT NULL COMMENT '最后一次登录的ip',
  `password` varchar(50) NOT NULL COMMENT '管理员密码',
  `status` int(5) UNSIGNED NOT NULL COMMENT '登录状态',
  `isdelete` int(10) UNSIGNED NOT NULL COMMENT '是否删除',
  `create_time` int(10) UNSIGNED NOT NULL COMMENT '创建时间',
  `update_time` int(10) UNSIGNED NOT NULL COMMENT '更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员表';

--
-- 转存表中的数据 `cgj_admin_user`
--

INSERT INTO `cgj_admin_user` (`id`, `account`, `realname`, `last_login_time`, `last_login_ip`, `password`, `status`, `isdelete`, `create_time`, `update_time`) VALUES
(1, '靈吾靈', '0', 1496992624, 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0, 1496991988, 1496992624),
(2, 'admin', '0', 1496991999, 0, '21232f297a57a5a743894a0e4a801fc3', 1, 0, 1496991999, 1496991999);

-- --------------------------------------------------------

--
-- 表的结构 `cgj_blog_article`
--

CREATE TABLE `cgj_blog_article` (
  `id` int(11) NOT NULL COMMENT '博客文章表的ID',
  `title` varchar(255) NOT NULL COMMENT '博客文章标题',
  `content` text NOT NULL COMMENT '博客文章内容',
  `create_user` varchar(50) NOT NULL COMMENT '文章的录入用户人',
  `is_secrecy` varchar(20) NOT NULL COMMENT '文章是否保密',
  `blog_desc` varchar(255) NOT NULL COMMENT '文章描述',
  `create_time` int(10) UNSIGNED NOT NULL COMMENT '博客文章的创建时间',
  `update_time` int(10) UNSIGNED NOT NULL COMMENT '博客文章的更新时间',
  `tag_id` int(10) UNSIGNED NOT NULL COMMENT '文章类型，外键',
  `img_id` int(10) UNSIGNED NOT NULL COMMENT '封面图的id，外键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客文章信息表';

--
-- 转存表中的数据 `cgj_blog_article`
--

INSERT INTO `cgj_blog_article` (`id`, `title`, `content`, `create_user`, `is_secrecy`, `blog_desc`, `create_time`, `update_time`, `tag_id`, `img_id`) VALUES
(1, '案发时发生', '<p>方式发顺丰师傅的说法</p>', 'admin', '是', '', 1495948593, 1496037771, 3, 2),
(4, '我爱你啊发顺丰', '<p>发顺丰吧</p>', 'admin', '是', '', 1496038350, 1496039252, 6, 5),
(5, '翻了翻看了多少决定了是否觉得上了飞机的说法', '<p>范德萨发的规范化</p>', 'admin', '是', '', 1496038378, 1496038378, 7, 5),
(6, 'digitalocean虚拟空间的创建教程', '<p>1、首先有个域名，这个国外的服务器，用国内的.cn后缀有时候会出现问题，所以不要贪小便宜，去申请.com的域名吧</p><p>2、打开网址：https://www.digitalocean.com/，二话不说，先创建个人账号吧。</p><p style="text-align:center"><img src="/cgj_html/ueditor/php/upload/image/20170601/1496285265363522.jpeg" title="1496285265363522.jpeg" width="800" height="357" alt="1496285265363522.jpeg"/></p><p>3、不需要验证码什么的，输入邮箱和密码就创建成功了，然后你的邮箱会收到一封激活的邮件，你打开邮箱点击激活连接，接下来就是填写详细的信息，首先要填写你的信用卡，要是visa的，就是国外可以用的那种信用卡，有的银联卡是不能用的。然后填写姓名，街道地址，城市，省份，邮政编码，选择国家，填写手机号码等信息。因为我已经添加了，所以找不到那个页面了，无法截图，但是大家要注意的是，这个网站很慢，如果你点击保存信息，很久都没有反应，那就等一下，其实他是保存好了的。上面步骤搞定之后，会看到下面的界面。</p><p style="text-align:center"><img src="/cgj_html/ueditor/php/upload/image/20170601/1496285620272305.jpeg" alt="1496285620272305.jpeg" width="800" height="502" title="1496285620272305.jpeg"/></p><p>4、接下来就是选择你的服务器的一些服务和基本信息，如下图</p><p style="text-align:center"><img src="/cgj_html/ueditor/php/upload/image/20170601/1496285638741445.jpeg" alt="1496285638741445.jpeg" width="800" height="508" title="1496285638741445.jpeg"/></p><p style="text-align:center"><img src="/cgj_html/ueditor/php/upload/image/20170601/1496285655457188.jpeg" alt="1496285655457188.jpeg" width="800" height="429" title="1496285655457188.jpeg"/><img src="/cgj_html/ueditor/php/upload/image/20170601/1496285670721651.jpeg" alt="1496285670721651.jpeg" width="800" height="414" title="1496285670721651.jpeg"/></p><p style="text-align:center"><img src="/cgj_html/ueditor/php/upload/image/20170601/1496285685318069.jpeg" alt="1496285685318069.jpeg" width="800" height="429" title="1496285685318069.jpeg"/></p><p style="text-align:center"><img src="/cgj_html/ueditor/php/upload/image/20170601/1496285697327428.jpeg" title="1496285697327428.jpeg" alt="1496285697327428.jpeg" width="800" height="475"/></p><p><br/></p>', 'admin', '否', '1、首先有个域名，这个国外的服务器，用国内的.cn后缀有时候会出现问题，所以不要贪小便宜，去申请.com的域名吧;2、打开网址：https://www.digitalocean.com/，二话不说，先创建个人账号吧。', 1496127431, 1496905246, 3, 19),
(7, '范德萨发生发顺丰dddd', '<p>范德萨发生发但是fdfa</p>', 'admin', '是', '', 1496654788, 1496719900, 5, 14),
(10, '原生Js 实现页面关键字高亮显示', '<pre class="brush:js;toolbar:false">function&nbsp;keyLight(id,&nbsp;key,&nbsp;bgColor){\n&nbsp;&nbsp;&nbsp;var&nbsp;oDiv&nbsp;=&nbsp;document.getElementById(id),\n&nbsp;&nbsp;&nbsp;sText&nbsp;=&nbsp;oDiv.innerHTML,\n&nbsp;&nbsp;&nbsp;bgColor&nbsp;=&nbsp;bgColor&nbsp;||&nbsp;&quot;orange&quot;,\n&nbsp;&nbsp;&nbsp;sKey&nbsp;=&nbsp;&quot;&lt;span&nbsp;style=&#39;background-color:&nbsp;&quot;+bgColor+&quot;;&#39;&gt;&quot;+key+&quot;&lt;/span&gt;&quot;,\n&nbsp;&nbsp;&nbsp;num&nbsp;=&nbsp;-1,\n&nbsp;&nbsp;&nbsp;rStr&nbsp;=&nbsp;new&nbsp;RegExp(key,&nbsp;&quot;g&quot;),\n&nbsp;&nbsp;&nbsp;rHtml&nbsp;=&nbsp;new&nbsp;RegExp(&quot;\\&lt;.*?\\&gt;&quot;,&quot;ig&quot;),&nbsp;//匹配html元素\n&nbsp;&nbsp;&nbsp;aHtml&nbsp;=&nbsp;sText.match(rHtml);&nbsp;//存放html元素的数组\n&nbsp;&nbsp;&nbsp;sText&nbsp;=&nbsp;sText.replace(rHtml,&nbsp;&#39;{~}&#39;);&nbsp;&nbsp;//替换html标签\n&nbsp;&nbsp;&nbsp;sText&nbsp;=&nbsp;sText.replace(rStr,sKey);&nbsp;//替换key\n&nbsp;&nbsp;&nbsp;sText&nbsp;=&nbsp;sText.replace(/{~}/g,function(){&nbsp;&nbsp;//恢复html标签\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;num++;\n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;return&nbsp;aHtml[num];\n&nbsp;&nbsp;	});\n&nbsp;&nbsp;&nbsp;oDiv.innerHTML&nbsp;=&nbsp;sText;\n&nbsp;}\n&nbsp;var&nbsp;key1&nbsp;=&nbsp;keyLight(&#39;result&#39;,&nbsp;&#39;和尚&#39;)\n&nbsp;var&nbsp;key2&nbsp;=&nbsp;keyLight(&#39;result&#39;,&nbsp;&#39;一&#39;,&nbsp;&#39;red&#39;)</pre><p><br/></p><p>效果图如下：</p><p style="text-align:center"><img src="/cgj_html/ueditor/php/upload/image/20170609/1496972945625766.jpg" title="1496972945625766.jpg" alt="07121543-0bd8f559e8b546aaa45b59ff1c2d0d25.jpg"/></p><p><br/></p>', 'admin', '否', '1.获取obj的html\n2.统一替换html标签\n3.替换要修改的关键字\n4.再把html标签修改回去\n不足就是如果查找的关键字跟替换的标签一样就有冲突了', 1496972988, 1496974602, 5, 20);

-- --------------------------------------------------------

--
-- 表的结构 `cgj_blog_article_img`
--

CREATE TABLE `cgj_blog_article_img` (
  `id` int(10) UNSIGNED NOT NULL COMMENT '封面图id',
  `src` varchar(200) NOT NULL COMMENT '封面图路径',
  `create_time` int(10) UNSIGNED NOT NULL COMMENT '封面图创建时间',
  `update_time` int(10) UNSIGNED NOT NULL COMMENT '封面图更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='封面图';

--
-- 转存表中的数据 `cgj_blog_article_img`
--

INSERT INTO `cgj_blog_article_img` (`id`, `src`, `create_time`, `update_time`) VALUES
(2, 'public/uploads.jpg', 1496649816, 1496649816),
(3, '20170605/526837e44d7881a4a407d819e47b187d.jpg', 1496650092, 1496650092),
(4, '20170605/2715baadd9ea884f7d4686390d3969e0.jpg', 1496650427, 1496650427),
(5, '20170605/580cd644114406b01ae051e2a8f4c26e.jpg', 1496650484, 1496650484),
(7, '20170605/6345c762c6f00ba0b2df52380c7e3dd3.jpg', 1496650935, 1496650935),
(8, '20170605/79c20cb30e75225922e383bb08854f1b.jpg', 1496650950, 1496650950),
(9, '20170605/ffc276804b23837e5836acedeede9388.jpg', 1496651212, 1496651212),
(10, '20170605/a4e69afa9a8ff38887806bf9c94a5dc5.jpg', 1496651464, 1496651464),
(11, '20170605/026e9c3c58c3d0a9666766780ba681fd.jpg', 1496651492, 1496651492),
(14, '20170606/2a1f75b4fd8a34af765c49b018b33f59.jpg', 1496719819, 1496719819),
(15, '20170606/3033f11ab3e7abe2cd91eb70466c7ed4.jpg', 1496732027, 1496732027),
(16, '20170606/6173ec071b0e7e5258d4179413b16a0e.jpg', 1496732342, 1496732342),
(19, '20170608/fac198098c119c7fc5f128629c9bee8b.jpg', 1496905149, 1496905149),
(20, '20170609/fe7c6bb104fe42f138bedae3049669b2.jpg', 1496972986, 1496972986);

-- --------------------------------------------------------

--
-- 表的结构 `cgj_blog_tag`
--

CREATE TABLE `cgj_blog_tag` (
  `id` int(11) NOT NULL COMMENT '博客分类ID',
  `name` varchar(50) NOT NULL COMMENT '博客分类名称',
  `create_time` int(10) UNSIGNED NOT NULL COMMENT '博客分类创建时间',
  `update_time` int(10) UNSIGNED NOT NULL COMMENT '博客分类更新时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='博客分类表';

--
-- 转存表中的数据 `cgj_blog_tag`
--

INSERT INTO `cgj_blog_tag` (`id`, `name`, `create_time`, `update_time`) VALUES
(3, '程序员必备知识', 1495613000, 1496125889),
(4, 'HTML5.0/CSS', 1495613185, 1495619037),
(5, 'JavaScript/jQuery', 1495613217, 1495619034),
(6, 'PHP/ThinkPHP', 1495613262, 1495613262),
(7, '前端框架', 1495613282, 1495619030);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cgj_admin_user`
--
ALTER TABLE `cgj_admin_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cgj_blog_article`
--
ALTER TABLE `cgj_blog_article`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cgj_blog_article_img`
--
ALTER TABLE `cgj_blog_article_img`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cgj_blog_tag`
--
ALTER TABLE `cgj_blog_tag`
  ADD PRIMARY KEY (`id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `cgj_admin_user`
--
ALTER TABLE `cgj_admin_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '管理员id', AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `cgj_blog_article`
--
ALTER TABLE `cgj_blog_article`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客文章表的ID', AUTO_INCREMENT=11;
--
-- 使用表AUTO_INCREMENT `cgj_blog_article_img`
--
ALTER TABLE `cgj_blog_article_img`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '封面图id', AUTO_INCREMENT=21;
--
-- 使用表AUTO_INCREMENT `cgj_blog_tag`
--
ALTER TABLE `cgj_blog_tag`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '博客分类ID', AUTO_INCREMENT=9;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
