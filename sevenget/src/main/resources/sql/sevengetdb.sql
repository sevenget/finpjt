-- 회원정보 --
drop table memBasicInfo purge;
create table memBasicInfo( 
	id   varchar2(40) constraint membasicinfo_id_pk primary key,
   	password varchar2(20) not null,
   	name varchar2(20) not null,
   	birth date
);

-- 회원 속성
drop table memDetail purge;
create table memDetail(
   	id varchar2(20) constraint memdetail_id_fk references memBasicInfo(id),
   	detail varchar(100) constraint memdetail_detail_nn  not null,
   	score number(3) constraint memdetail_score_nn  not null
);

-- 회원별 중요도
drop table memConcern purge;
create table memConcern(
   id varchar2(20) constraint memconcern_id_fk references memBasicInfo(id),
   dateCon number(2),
   marryCon number(2),
   babyCon number(2),
   houseCon number(2),
   relationCon number(2),
   dreamCon number(2),
   hopeCon number(2)
);

-- 기업 관련 --
drop table companybasicinfo purge;
create table companyBasicInfo(
   cid number(10) constraint companybasicinfo_cid_pk primary key,
   cname varchar(50) constraint companybasicinfo_cname_nn not null, 
   cmission varchar(200),
   sales number(20),
   cdiscription varchar(2000),
   interestedTimes number(10)
);

drop table companyconcern purge;
create table companyConcern(
   cid number(10) constraint companyConcern_id_fk references companyBasicInfo(cid),
   dateCon number(2),
   marryCon number(2),
   babyCon number(2),
   houseCon number(2),
   relationCon number(2),
   dreamCon number(2),
   hopeCon number(2)
);

-- 기업세부정보
drop table companydetail purge;
create table companyDetail(
   cid number(20) constraint companydetail_cid_fk references companyBasicInfo(cid),
   detail varchar(100) constraint companydetail_detail_nn not null,
   score number(3) constraint companydetail_score_nn not null
);

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
   title varchar2(200) constraint companyreview_title_nn not null,
   content varchar2(2000) constraint companyreview_content_nn not null
);

 -- 검색 키워드 관련
drop table keywords purge;
create table keywords(
   keyword varchar2(500) constraint keywords_keyword_pk primary key,
   searchedNum number(20)
);

drop table searched purge;
create table searched(
   searchDate date default sysdate,
   keyword varchar2(500) constraint searched_keyword_fk references keywords(keyword), 
   searchMem varchar(40) constraint searched_searchMem_fk references memBasicInfo(id)
)