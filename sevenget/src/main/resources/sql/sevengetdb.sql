-- 회원정보 --
drop table memBasicInfo CASCADE CONSTRAINTS;
create table memBasicInfo( 
	id   varchar2(40) constraint membasicinfo_id_pk primary key,
   	password varchar2(20) not null,
   	name varchar2(20) not null,
   	birth date,
   	gender varchar2(2) constraint membasicinfo_gender_ck check(gender in ('M', 'F')),
   	address varchar2(100) not null,
   	email varchar2(30),
   	dateCon number(2),
  	marryCon number(2),
   	babyCon number(2),
   	houseCon number(2),
   	relationCon number(2),
   	dreamCon number(2),
   	hopeCon number(2)
);
SELECT * FROM memBasicInfo where id = 'Guest'
select id from memBasicInfo where id='mem';

-- 회원 속성
drop table memDetail purge;
create table memDetail(
   	id varchar2(20) constraint memdetail_id_fk references memBasicInfo(id),
   	detail varchar(100) constraint memdetail_detail_nn  not null,
   	score number(3) constraint memdetail_score_nn  not null
);


-- 기업 관련 --
drop table companybasicinfo purge;
create table companyBasicInfo(
   cid number(10) constraint companybasicinfo_cid_pk primary key,
   logo varchar2(100),
   cname varchar2(50) constraint companybasicinfo_cname_nn not null, 
   industry varchar2(100),
   location varchar2(200),
   sales varchar2(50),
   employee number(10),
   mission varchar2(1000),
   discription varchar2(2000),
   interestedTimes number(10),
   dateGet varchar2(2) constraint combasicinfo_dateget_ck check(dateGet in('T', 'F', 'N')),
   marryGet varchar2(2) constraint combasicinfo_marryget_ck check(marryGet in('T', 'F', 'N')), 
   babyGet varchar2(2) constraint combasicinfo_babyget_ck check(babyGet in('T', 'F', 'N')),
   houseGet varchar2(2) constraint combasicinfo_houseget_ck check(houseGet in('T', 'F', 'N')),
   relationGet varchar2(2) constraint combasicinfo_relationget_ck check(relationGet in('T', 'F', 'N')),
   dreamGet varchar2(2) constraint combasicinfo_dreamget_ck check(dreamGet in('T', 'F', 'N')),
   hopeGet varchar2(2) constraint combasicinfo_hopeget_ck check(hopeGet in('T', 'F', 'N'))
);
alter table companyBasicInfo drop constraint companybasicinfo_cid_pk cascade;

select * from companyBasicInfo;

-- 기업 점수
drop table companyscore purge;
create table companyScore(
   cid number(10) constraint companyConcern_id_fk references companyBasicInfo(cid),
   dateSco number(2),
   marrySco number(2),
   babySco number(2),
   houseSco number(2),
   relationSco number(2),
   dreamSco number(2),
   hopeSco number(2)
);
select * from companyscore

-- 기업세부정보
drop table companydetail purge;
create table companyDetail(
   cid number(20) constraint companydetail_cid_fk references companyBasicInfo(cid),
   detail varchar(100) constraint companydetail_detail_nn not null,
   score number(3) constraint companydetail_score_nn not null
);
select * from companydetail

-- 관심기업 등록 해지
drop table interestedRC purge;
create table interestedRC(
   memid varchar2(20) constraint interestedrd_memid_fk references memBasicInfo(id),
   cid number(10) constraint interestedrd_cid_fk references companyBasicInfo(cid),
   regTime date default sysdate,
   canTime date
);

-- 기업 리뷰
drop table companyreview purge;
create table companyreview(
   writer varchar2(20) constraint companyreview_writer_fk references memBasicInfo(id),
   cid number(10) constraint companyreview_cid_fk references companyBasicInfo(cid),
   reviewdate date default sysdate,
   content varchar2(2000) constraint companyreview_content_nn not null
);
--title varchar2(200) constraint companyreview_title_nn not null,
select * from companyreview;



--광고기업
create table advCompany(
	cid number(10) constraint advcom_cid_fk references companybasicinfo(cid), 
	cost number(10),
	startDate date,
	endDate date
)



 -- 검색 키워드 관련
drop table keywords purge;
create table keywords(
   keyword varchar2(500) constraint keywords_keyword_pk primary key,
   searchNum number(20)
);

drop table searched purge;
create table search(
   searchDate date default sysdate,
   keyword varchar2(500) constraint search_keyword_fk references keywords(keyword), 
   searchMem varchar(40) constraint search_searchMem_fk references memBasicInfo(id)
)

-- 분석 결과 plot 저장
drop table plots purge;
create table plots(
   memid varchar2(40) references memBasicInfo(id),
   plotpng varchar2(20),
   savedTime date default sysdate
);

select * from plots;
insert into plots values('mem', 'mem.png', sysdate)