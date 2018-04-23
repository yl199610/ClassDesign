--create user tssc identified by a;
--grant resource,connect to tssc;
--  状态为1 正常
--1 管理员			--0超级管理
create table cadmin(
	caid Integer primary key,
	caname varchar2(10) unique,
	capwd varchar2(10) not null,
	cpower varchar2(6)
);
create sequence adminid start with 1;
insert into cadmin values(adminid.nextval,'a','a',0);
select * from cadmin;
--用户 --applynum付款账号
create table cuser(
	cuid Integer primary key,
	cusername varchar2(20) unique,
	cpassword varchar2(20) not null,
	cemail varchar2(20) not null,
	csex varchar2(10),
	cphone varchar2(15) not null,
	clastloginip varchar2(30),
	cphoto varchar2(30) default '../images/notpic.jpg',
	applynum varchar2(20),
	clikebook varchar2(30) default null,
	cbirthday varchar2(20),
	cufree varchar2(25) default null
);
select * from cuser c where 1=1 and cufree=1 and c.cuid like '%%' and c.cusername like '%%'
update cuser set cufree=1 where cusername='a'
select * from (select m.*,rownum rn from (select * from cuser where cuid=2) m where 1*5>=rownum) where rn>(1-1)*5 
drop table cuser;
create sequence sequserid start with 1;
insert into cuser values (sequserid.nextval,'d','d','4564@qq.com','男','678678678',
'192.128.28.122',default,'678678678@qq.com',default,'1993-08-10',default);
select * from cuser;
--图书分类表
create  table ccategory(
	ccid Integer primary key,
	levels varchar2(20) not null,		--级别
	ccname varchar2(25) not null,
	description varchar2(200) default null,
	parentid Integer default null,
	cafree varchar2(25) default null
);
select * from ccategory where ccid=3 and cafree=1
update ccategory set cafree=1 where ccid>=1
select count(1) total,ceil(count(1)/5) totalPage from ccategory
select * from (select m.*,rownum rn from (select * from ccategory where levels='二级目录') m where 1*10>=rownum) where rn>0
select * from ccategory where ccid=9
select * from ccategory where ccid=(select parentid from ccategory where ccid=3)
drop table ccategory;
create sequence seqcatid start with 1;
drop sequence seqcatid
insert into ccategory values(seqcatid.nextval,'总父类','图书','所有图书的父类',0,default);
update CCATEGORY set cafree=1 where levels='总父类'
select * from CCATEGORY where levels='总父类'
insert into ccategory values(seqcatid.nextval,'一级目录','青春读物','关于青春的书籍',2,1);
insert into ccategory values(seqcatid.nextval,'一级目录','文艺','文艺范的图书',2,1);
insert into ccategory values(seqcatid.nextval,'一级目录','生活','生活书籍',2,1);
insert into ccategory values(seqcatid.nextval,'一级目录','考试教育','教育书籍',2,1);
insert into ccategory values(seqcatid.nextval,'一级目录','人文科技','人文科技书籍',2,1);
insert into ccategory values(seqcatid.nextval,'一级目录','其他类','其他分类书籍',2,1);

insert into ccategory values(seqcatid.nextval,'二级目录','娱乐','八卦娱乐',3,1);
insert into ccategory values(seqcatid.nextval,'二级目录','笑话','幽默笑话',3,1);
insert into ccategory values(seqcatid.nextval,'二级目录','幽默','期刊杂志',3,1);
insert into ccategory values(seqcatid.nextval,'二级目录','小说','各类小说',4,1);
insert into ccategory values(seqcatid.nextval,'二级目录','艺术','艺术类',4,1);
insert into ccategory values(seqcatid.nextval,'二级目录','旅游','旅游类',5,1);
insert into ccategory values(seqcatid.nextval,'二级目录','服装','装扮',5,1);
insert into ccategory values(seqcatid.nextval,'二级目录','辅导书','各种辅导书籍',6,1);
insert into ccategory values(seqcatid.nextval,'二级目录','教材','各年级教材',6,1);
insert into ccategory values(seqcatid.nextval,'二级目录','文化','文化书籍分类',7,1);
insert into ccategory values(seqcatid.nextval,'二级目录','自然科学','自然知识',7,1);
insert into ccategory values(seqcatid.nextval,'二级目录','特色分类','各种特色书籍',8,1);
insert into ccategory values(seqcatid.nextval,'二级目录','杂志','期刊杂志',8,1);

insert into ccategory values(seqcatid.nextval,'三级目录','智力游戏','智力游戏攻略',8,1);
insert into ccategory values(seqcatid.nextval,'三级目录','娱乐新闻','娱乐新闻',8,1);
insert into ccategory values(seqcatid.nextval,'三级目录','古代笑话','幽默古代笑话',9,1);
insert into ccategory values(seqcatid.nextval,'三级目录','现代笑话','现代搞笑',9,1);
insert into ccategory values(seqcatid.nextval,'三级目录','幽默书籍','搞笑幽默',9,1);
insert into ccategory values(seqcatid.nextval,'三级目录','外国小说','各类外国小说',10,1);
insert into ccategory values(seqcatid.nextval,'三级目录','艺术史','艺术类历史',11,1);
insert into ccategory values(seqcatid.nextval,'三级目录','旅游指南','旅游指南攻略',12,1);
insert into ccategory values(seqcatid.nextval,'三级目录','服装文化','服装的文化知识',13,1);
insert into ccategory values(seqcatid.nextval,'三级目录','小学辅导书','小学辅导书籍',14,1);
insert into ccategory values(seqcatid.nextval,'三级目录','研究生','考研教材',15,1);
insert into ccategory values(seqcatid.nextval,'三级目录','中国文化','中国文化介绍',16,1);
insert into ccategory values(seqcatid.nextval,'三级目录','科学与自然','科学自然知识',17,1);
insert into ccategory values(seqcatid.nextval,'三级目录','独家好书','独家特色书籍',18,1);
insert into ccategory values(seqcatid.nextval,'三级目录','合订本','合订书籍',19,1);
insert into ccategory values(seqcatid.nextval,'三级目录','特色书','特色书111',20,1);
insert into ccategory values(seqcatid.nextval,'三级目录','杂志','特色书222',21,1);


select * from ccategory c inner join ccategory ca on c.ccid=ca.parentid and ca.parentid=8

--图书产品表  cpfree为已销售数量
create table cproduct(
	cpid Integer primary key,
	spcaid references ccategory(ccid),
	cbcpid references cbook(cbid),--书籍
	cproductname varchar2(100) not null,
	cdescription varchar2(200) default null,
	caddtime varchar2(20),
	cnormalprice varchar2(20) not null,
	cwsscprice varchar2(20) not null,
	ckeywords varchar2(30),
	cimage varchar2(30),
	cpstatus varchar2(20) default 'normal',
	cpfree varchar2(25) default null
);
select * from (select t.*,rownum rownu from cproduct t where rownum<=1*10 and 1=1 and cpstatus='normal' and cproductname='左脑思维魔法训练' )tt where tt.rownu>(1-1)*10
select * from cproduct;
drop table cproduct;
drop sequence seqcpro
create sequence seqcpro start with 1;
insert into cproduct values(seqcpro.nextval,2,11,'左脑思维魔法训练(2016年新版)','依据科学研究结果设计的104种左脑思维训练题和87种快速学习',
'2017-12-10','28','18','左脑思维魔法训练','../images/notpic.jpg',default,null);
insert into cproduct values(seqcpro.nextval,2,11,'左脑思维','依据科学研和87种快速学习',
'2012-1-14','38','38','左脑思维练','../images/notpic.jpg',default,null);
insert into CPRODUCT values(seqcpro.nextval,21,27,'萧乾家书','名家著作','2011-02-12','32.5','28','萧乾','images/pic.jpg',123,default);
insert into CPRODUCT values(seqcpro.nextval,22,23,'孟森讲清史','名家著作','2016-01-02','98.5','70','孟森','images/pic.jpg',23,default);
insert into CPRODUCT values(seqcpro.nextval,21,24,'圣经故事','外国著作','2012-04-02','32.5','28','圣经','images/pic.jpg',13,default);
insert into CPRODUCT values(seqcpro.nextval,22,25,'我们悲惨的宇宙','名家著作','2013-01-01','28.5','18','悲惨的宇宙','images/pic.jpg',21,default);
insert into CPRODUCT values(seqcpro.nextval,22,26,'谈美书简','名家著作','2005-02-01','24.5','20','谈美书简','images/pic.jpg',33,default);
insert into CPRODUCT values(seqcpro.nextval,22,22,'欧美现代美术史','名家著作','2003-02-01','25.5','20','孟森','images/pic.jpg',4,default);
insert into CPRODUCT values(seqcpro.nextval,25,28,'放学后','名家著作1','2013-04-01','30','25','孟森','images/fx.jpg',2,default);
insert into CPRODUCT values(seqcpro.nextval,26,29,'幻想的哲学','名家著作11','2002-02-14','52.5','40','孟森','images/hx.jpg',1,default);


update CPRODUCT set cimage='images/xq.jpg' where cpid=42;
update CPRODUCT set cimage='images/ms.jpg' where cpid=43;
update CPRODUCT set cimage='images/sj.jpg' where cpid=44;
update CPRODUCT set cimage='images/bs.jpg' where cpid=45;
update CPRODUCT set cimage='images/ts.jpg' where cpid=46;
update CPRODUCT set cimage='images/om.jpg' where cpid=47;

--书籍表
create table cbook(
	cbid Integer primary key,
	cauthor varchar2(20) not null,
	cimage varchar2(30) not null,
	cisbn varchar2(25) not null,
	bookname varchar2(30) not null,
	cpublishing varchar2(25) not null,
	cpublishtime varchar2(15) not null,
	cwordnumber varchar2(20) not null,
	ctotalpage varchar2(20) not null,
	cintroduce varchar2(300) not null,
	catalogue varchar2(400) not null,
	edition varchar2(10),				--印刷次数
	cbfree varchar2(25) default null
);
select * from (select t.*,rownum rownu from cbook t where rownum<=1*5 and 1=1 and cbfree=1)tt where tt.rownu>(1-1)*5
select * from cbook;
drop table cbook;
drop sequence seqcbook
create sequence seqcbook start with 1;
insert into cbook values(seqcbook.nextval,'艾伦布莱恩','../images/notpic.jpg','9787567548138','左脑思维',
'华东师范大学出版社','2016-2-1','300','98','本书用海量题库实现左脑思维','第一章联锁字谜7个联锁字谜练习',
'新版',default);
insert into cbook values(seqcbook.nextval,'何政广','images/pic.jpg','7535621767','欧美现代美术史',
'湖南美术出版社','2005-02-01','大16开','239','从西洋美术史看来，20世纪是人类的文化发展极为多彩多姿的一个时代。',
'2001年版前言新版序初版自序新艺术的历史渊源现代美术发展分析一览表','1','1')
insert into cbook values(seqcbook.nextval,'孟森','images/pic.jpg','9787506027588','孟森讲清史',
'东方出版社','2007-04-01','483页','483','本书选用孟森在北京大学教书采用的讲义《清史讲义》',
'diyi编　总论diyi章　清史在史学上之位置','1','1')
insert into cbook values(seqcbook.nextval,'格特鲁德','images/pic.jpg','9787500686705','圣经故事',
'中国青年出版社','2003-02-01','346页','457','《圣经》是一本世界文学名著',
'序章','1','1')
insert into cbook values(seqcbook.nextval,'托马斯','images/pic.jpg','9787562469995','我们悲惨的宇宙',
'重庆大学出版社','2013-01-01','大32开','400','达特茅斯，达特摩尔东南部,是一片充满神秘传说的土地',
'序章','1','1')
insert into cbook values(seqcbook.nextval,'朱光潜','images/pic.jpg','780115679X','谈美书简',
'当代世界出版社','2003-02-01','大32开','118','作者82岁高龄时写的“暮年心血”之作',
'一、代前言：怎样学美学？','1','1')
insert into cbook values(seqcbook.nextval,'萧乾','images/pic.jpg','9787506034142','萧乾家书',
'中国青年出版社','2013-02-11','16开','296','《萧乾家书》收录了萧乾写给文洁若的姐姐文常书',
'萧乾致文常韦(十四封) ','1','1')


insert into cbook values(seqcbook.nextval,'东野圭吾','images/fx.jpg','9787544291224','放学后',
'中国青年出版社','2017-09-11','32开','296','《放学后》是东野圭吾的成名作，获第31届江户川乱步奖',
'序章','1','1');
insert into cbook values(seqcbook.nextval,'约尔根·哈斯','images/hj.jpg','9787506034142','幻觉的哲学',
'东方出版社','2011-01-01','16开','358','在尼采看来，欧洲哲学的传统在根本上是人的幻觉的历史',
'一、不合时宜的人及其同代人','1','1');
alter table cbook modify cpublishing varchar2(32) 
alter table cbook add (cpublishing varchar2(30));
update CBOOK set cimage='images/notpic.jpg' where cbid=11
--订单表
create table corder(
  coid Integer primary key,
  cordid references cuser(cuid),--用户id
  cstatus varchar2(10) not null,
  cordertime varchar2(20) not null,
  corderdesc varchar2(100) default null,--备注
  ctotalprice varchar2(10) not null,
  cordername varchar2(10),--可以买给别人
  cfulladdress varchar2(100) not null,
  cpostalcode varchar2(20) not null,
  cphone varchar2(20) default null,
  cofree varchar2(25) default null
);
create sequence seqcorder start with 1;
select * from corder where cstatus='normal' and coid like '%23%'
insert into corder values(2323,2,'normal','2018-4-18','请寄顺丰快递','18','tom','湖南衡阳','42200','15486597435',default);
insert into corder values(seqcorder.nextval,2,'normal','2018-4-18','请寄顺丰快递','18','tom','湖南衡阳','42200','15486597435',default);
--订单详细表
create  table corderitem(
  coiid Integer primary key,
  coiname varchar2(20),
  coinumber varchar2(10),
  ciprice varchar2(10),
  cobid references cproduct(cpid),--产品表
  corid references corder(coid)--订单表
);
create sequence seqcorderitem start with 1;
drop table corderitem
--收藏表
create table cfavorites(--用户的外键 书籍产品的外键
   cfid Integer primary key,
   cuserid references cuser(cuid),
   cfp references cproduct(cpid),
   cfstatus varchar2(10) default '不收藏'
);
select * from cfavorites;
drop table cfavorites
create sequence seqcfavorites start with 1;
insert into cfavorites values(seqcfavorites.nextval,2,26,default);
insert into cfavorites values(seqcfavorites.nextval,21,26,default);
insert into cfavorites values(seqcfavorites.nextval,22,26,default);
insert into cfavorites values(seqcfavorites.nextval,23,26,default);
insert into cfavorites values(seqcfavorites.nextval,23,26,default);

insert into cfavorites values(seqcfavorites.nextval,2,27,default);
insert into cfavorites values(seqcfavorites.nextval,21,27,default);
insert into cfavorites values(seqcfavorites.nextval,22,27,default);
insert into cfavorites values(seqcfavorites.nextval,23,27,default);

insert into cfavorites values(seqcfavorites.nextval,21,42,default);
insert into cfavorites values(seqcfavorites.nextval,22,42,default);
insert into cfavorites values(seqcfavorites.nextval,23,42,default);

insert into cfavorites values(seqcfavorites.nextval,22,43,default);
insert into cfavorites values(seqcfavorites.nextval,23,43,default);

insert into cfavorites values(seqcfavorites.nextval,22,44,default);


select t.*,c.*,cp.*,rownum rownu from cfavorites t join cuser c
		on c.cuid=t.cuserid
		join cproduct cp on cp.cpid=t.cfp
--评论表
create table ccomments(--用户的外键 书籍产品的外键(评论排行);
	cid Integer  primary key,
	cfp references cproduct(cpid),
	cuserid references cuser(cuid),
	ccontent varchar2(1000),
	ccdate varchar2(20)
);
insert into ccomments values(seqccomments.nextval,26,2,'这本书好看','2018-4-16');
insert into ccomments values(seqccomments.nextval,26,2,'这本书好看','2018-5-11');

insert into ccomments values(seqcfavorites.nextval,26,2,'好书1','2018-02-12');
insert into ccomments values(seqcfavorites.nextval,26,21,'好书11','2011-02-22');
insert into ccomments values(seqcfavorites.nextval,26,22,'好书111','2012-02-12');
insert into ccomments values(seqcfavorites.nextval,26,23,'好书11111','2013-02-12');
insert into ccomments values(seqcfavorites.nextval,26,23,'好书111111','2014-02-12');

insert into ccomments values(seqcfavorites.nextval,27,2,'好书2','2012-07-09');
insert into ccomments values(seqcfavorites.nextval,27,21,'好书22','2014-06-10');
insert into ccomments values(seqcfavorites.nextval,27,22,'好书222','2002-10-04');
insert into ccomments values(seqcfavorites.nextval,27,23,'好书2222','2012-12-04');

insert into ccomments values(seqcfavorites.nextval,42,21,'好书3','2009-04-11');
insert into ccomments values(seqcfavorites.nextval,42,22,'好书33','2008-06-12');
insert into ccomments values(seqcfavorites.nextval,42,23,'好书333','2009-02-14');

insert into ccomments values(seqcfavorites.nextval,43,22,'好书4','2016-05-11');
insert into ccomments values(seqcfavorites.nextval,43,23,'好书44','2017-03-17');

insert into ccomments values(seqcfavorites.nextval,44,22,'好书5','2013-03-13');
select * from cfavorites;
drop table ccomments
create sequence seqccomments start with 1;

--按照热门排序
select * from (select * from cproduct where cpstatus='normal' order by to_number(cpfree) desc) where rownum<4

--按照评论排序
select * from (select count(cfp) t,cfp from ccomments group by cfp order by t desc) where rownum<4;

--按照收藏排序
select * from (select count(cfp) t,cfp from cfavorites where cfstatus='收藏' group by cfp order by t desc) where rownum<4;
select * from cproduct where cpid=26
--查询所有图书产品 
select count(1) from CPRODUCT where cpstatus='normal'
--显示下面的产品推荐(将不热门的推荐)

select * from (select c.*,rownum rownu from cproduct c where rownum<=1*3 and cpstatus='normal'
order by to_number(cpfree) asc) cp where cp.rownu>(1-1)*3
and cp.rownu<(select count(1)-4 from CPRODUCT)

select * from CPRODUCT

update cproduct set cpstatus='normal' where cpid=49

select * from (select c.*,rownum rownu from cproduct c where
		rownum<=1*8 and cpstatus='normal'
		order by to_number(cpfree) asc) cp where
		cp.rownu>(1-1)*8
		and cp.rownu<(select count(1)-3 from CPRODUCT)
		
		
select * from (select t.*,rownum rownu from cproduct t where
rownum<=1*8 and cpstatus='normal' order by to_number(cpfree) asc
)tt where tt.rownu>(1-1)*8

select (select count(1)-5 total from CPRODUCT) total,ceil(count(1)/8)
		totalPage,8 pageSize,1 currPage from cproduct

select * from
(select m.*,rownum rn from
(select * from cproduct where cpstatus='normal' order by to_number(cpfree) asc) m where 1*8>=rownum)
where rn>(1-1)*8 and rn<(select count(1)-4 from CPRODUCT)

