--create user tssc identified by a;
--grant resource,connect to tssc;

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
drop table cuser;
create sequence sequserid start with 1;
insert into cuser values (sequserid.nextval,'b','b','347247531@qq.com','男','18394528725',
'192.124.24.2',default,'347247531@qq.com',default,'1993-09-10',default);
select * from cuser;
--图书分类表
create  table ccategory(
	ccid Integer primary key,
	levels varchar2(10) not null,		--级别
	ccname varchar2(25) not null,
	description varchar2(200) default null,
	parentid Integer default null,
	cafree varchar2(25) default null
);
select * from ccategory where levels='一级目录'
drop table ccategory;
create sequence seqcatid start with 1;
drop sequence seqcatid
insert into ccategory values(seqcatid.nextval,'总父类','图书','所有图书的父类',0,default);

insert into ccategory values(seqcatid.nextval,'一级目录','青春读物','关于青春的书籍',1,default);
insert into ccategory values(seqcatid.nextval,'一级目录','文艺','文艺范的图书',1,default);
insert into ccategory values(seqcatid.nextval,'一级目录','生活','生活书籍',1,default);
insert into ccategory values(seqcatid.nextval,'一级目录','考试教育','教育书籍',1,default);
insert into ccategory values(seqcatid.nextval,'一级目录','人文科技','人文科技书籍',1,default);
insert into ccategory values(seqcatid.nextval,'一级目录','其他类','其他分类书籍',1,default);

insert into ccategory values(seqcatid.nextval,'二级目录','娱乐','八卦娱乐',2,default);
insert into ccategory values(seqcatid.nextval,'二级目录','笑话','幽默笑话',2,default);
insert into ccategory values(seqcatid.nextval,'二级目录','小说','各类小说',3,default);
insert into ccategory values(seqcatid.nextval,'二级目录','艺术','艺术类',3,default);
insert into ccategory values(seqcatid.nextval,'二级目录','旅游','旅游类',4,default);
insert into ccategory values(seqcatid.nextval,'二级目录','服装','装扮',4,default);
insert into ccategory values(seqcatid.nextval,'二级目录','辅导书','各种辅导书籍',5,default);
insert into ccategory values(seqcatid.nextval,'二级目录','教材','各年级教材',5,default);
insert into ccategory values(seqcatid.nextval,'二级目录','文化','文化书籍分类',6,default);
insert into ccategory values(seqcatid.nextval,'二级目录','自然科学','自然知识',6,default);
insert into ccategory values(seqcatid.nextval,'二级目录','特色分类','各种特色书籍',7,default);
insert into ccategory values(seqcatid.nextval,'二级目录','杂志','期刊杂志',7,default);
insert into ccategory values(seqcatid.nextval,'二级目录','幽默','期刊杂志',2,default);

insert into ccategory values(seqcatid.nextval,'三级目录','幽默书籍','搞笑幽默',62,default);
insert into ccategory values(seqcatid.nextval,'三级目录','智力游戏','智力游戏攻略',8,default);
insert into ccategory values(seqcatid.nextval,'三级目录','娱乐新闻','娱乐新闻',8,default);
insert into ccategory values(seqcatid.nextval,'三级目录','古代笑话','幽默古代笑话',9,default);
insert into ccategory values(seqcatid.nextval,'三级目录','现代笑话','现代搞笑',9,default);
insert into ccategory values(seqcatid.nextval,'三级目录','外国小说','各类外国小说',10,default);
insert into ccategory values(seqcatid.nextval,'三级目录','艺术史','艺术类历史',11,default);
insert into ccategory values(seqcatid.nextval,'三级目录','旅游指南','旅游指南攻略',12,default);
insert into ccategory values(seqcatid.nextval,'三级目录','服装文化','服装的文化知识',13,default);
insert into ccategory values(seqcatid.nextval,'三级目录','小学辅导书','小学辅导书籍',14,default);
insert into ccategory values(seqcatid.nextval,'三级目录','研究生','考研教材',15,default);
insert into ccategory values(seqcatid.nextval,'三级目录','中国文化','中国文化介绍',16,default);
insert into ccategory values(seqcatid.nextval,'三级目录','科学与自然','科学自然知识',17,default);
insert into ccategory values(seqcatid.nextval,'三级目录','独家好书','独家特色书籍',18,default);
insert into ccategory values(seqcatid.nextval,'三级目录','合订本','合订书籍',19,default);


select * from ccategory c inner join ccategory ca on c.ccid=ca.parentid and ca.parentid=8

--图书产品表
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
select * from cproduct
drop table cproduct;
drop sequence seqcpro
create sequence seqcpro start with 1;
insert into cproduct values(seqcpro.nextval,20,1,'左脑思维魔法训练(2016年新版)','依据科学研究结果设计的104种左脑思维训练题和87种快速学习',
'2017-12-10','28','18','左脑思维魔法训练','../images/notpic.jpg',default);
--书籍表
create table cbook(
	cbid Integer primary key,
	cauthor varchar2(20) not null,
	cimage varchar2(30) not null,
	cisbn varchar2(25) not null,
	cpublishing varchar2(25) not null,
	cpublishtime varchar2(15) not null,
	cwordnumber varchar2(10) not null,
	ctotalpage varchar2(10) not null,
	cintroduce varchar2(300) not null,
	catalogue varchar2(400) not null,
	edition varchar2(10),				--印刷次数
	cbfree varchar2(25) default null
);
select * from cbook;
drop table cbook;
drop sequence seqcbook
create sequence seqcbook start with 1;
insert into cbook values(seqcbook.nextval,'艾伦布莱恩大卫加蒙','../images/notpic.jpg','9787567548138',
'华东师范大学出版社','2016年3月','3万','200','本书用海量题库实现左脑思维','第一章联锁字谜7个联锁字谜练习','新版',default);


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
drop table cfavorites
create sequence seqcfavorites start with 1;

--评论表
create table ccomments(--用户的外键 书籍产品的外键(评论排行);
	cid Integer  primary key,
	cfp references cproduct(cpid),
	cuserid references cuser(cuid),
	ccontent varchar2(1000),
	ccdate varchar2(20)
);
drop table ccomments
create sequence seqccomments start with 1;
