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
insert into cuser values (sequserid.nextval,'a','a','1232134234@qq.com','男','1343543534',
'192.124.22.12',default,'4534534534@qq.com',default,'1992-02-10',default);
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
select * from (select t.*,rownum rownu from cproduct t where rownum<=1*10 and 1=1 and cpstatus='normal' and cproductname='左脑思维魔法训练' )tt where tt.rownu>(1-1)*10
select * from cproduct where cproductname='左脑思维魔法训练(2016年新版)'
drop table cproduct;
drop sequence seqcpro
create sequence seqcpro start with 1;
insert into cproduct values(seqcpro.nextval,2,11,'左脑思维魔法训练(2016年新版)','依据科学研究结果设计的104种左脑思维训练题和87种快速学习',
'2017-12-10','28','18','左脑思维魔法训练','../images/notpic.jpg',default,null);
insert into cproduct values(seqcpro.nextval,2,11,'左脑思维','依据科学研和87种快速学习',
'2012-1-14','38','38','左脑思维练','../images/notpic.jpg',default,null);
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
select * from (select t.*,rownum rownu from cbook t where rownum<=1*5 and 1=1 and cbfree=1 and bookname '%左脑思维魔法训练%' )tt where tt.rownu>(1-1)*5
select * from cbook;
drop table cbook;
drop sequence seqcbook
create sequence seqcbook start with 1;
insert into cbook values(seqcbook.nextval,'艾伦布莱恩','../images/notpic.jpg','9787567548138','左脑思维',
'华东师范大学出版社','2016-2-1','300','98','本书用海量题库实现左脑思维','第一章联锁字谜7个联锁字谜练习',
'新版',default);
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
drop table cfavorites
create sequence seqcfavorites start with 1;
insert into cfavorites values(seqcfavorites.nextval,2,26,default);
insert into cfavorites values(seqcfavorites.nextval,2,27,default);
update cfavorites set cfstatus='收藏' where cfp=23
select * from (select t.*,rownum rownu from cfavorites t join cuser c on c.cuid=t.cuserid
join cproduct cp on cp.cpid=t.cfp where rownum<=5 and 1=1)tt where tt.rownu>0

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
select * from cfavorites;
drop table ccomments
create sequence seqccomments start with 1;
