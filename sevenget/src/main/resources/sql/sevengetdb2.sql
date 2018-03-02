-- DB Table 삭제
drop table memBasicInfo CASCADE CONSTRAINTS purge;
drop table companybasicinfo CASCADE CONSTRAINTS purge;
drop table companyscore purge;
drop table interestedRC purge;
drop table companyreview purge;
drop table advCompany purge;
drop table keywords CASCADE CONSTRAINTS purge;
drop table search purge;
drop table plots purge;
drop table comprawscore purge;
drop table publicrawscore purge;

-- sequence 삭제
drop sequence combasic_seq;
drop sequence inter_seq;
drop sequence review_seq;
drop sequence adv_seq;
drop sequence search_seq;
drop sequence pid_seq;
drop sequence psid_seq;

--sequence 만들기
create sequence combasic_seq start with 1 increment by 1;
create sequence inter_seq start with 1 increment by 1;
create sequence review_seq start with 1 increment by 1;
create sequence adv_seq start with 1 increment by 1;
create sequence search_seq start with 1 increment by 1;
create sequence pid_seq start with 1 increment by 1;
create sequence psid_seq start with 1 increment by 1;
--sequence 사용방법
--- combasic_seq.nextval : 다음 값





------- 위에서 테이블 모두 drop 하신 다음
-----------여기서부터 맨 마지막까지 다 선택 후 실행시키시면 됩니다. 
-------------회원 기본 정보 3개, 기업(카카오, 네이버) 데이터도 들어갑니다. ----------

-- 회원 기본 정보 --
create table memBasicInfo( 
   	id   varchar2(40) constraint membasicinfo_id_pk primary key,
    password varchar2(20) not null,
    name varchar2(20) not null,
    birth date,
    gender varchar2(2) constraint membasicinfo_gender_ck check(gender in ('M', 'F')),
    address varchar2(100) not null,
    email varchar2(30),
    picture varchar2(30),
    dateCon number(2),
    marryCon number(2),
    babyCon number(2),
    houseCon number(2),
    relationCon number(2),
    dreamCon number(2),
    hopeCon number(2)
);

insert into memBasicInfo values('mem','mem', '멤버', '180220', 'F', 'seoul', 'email@email.com','mem.gif',1,2,3,4,5,6,7);
insert into memBasicInfo values('Guest','Guest', '게스트', '180220', 'F', 'seoul', 'email2@email.com','Guest.jpg',1,2,3,4,5,6,7);
insert into memBasicInfo values('mem1','mem1', '멤버1', '180220', 'M', 'seoul', 'email2@email.com','mem1.jpg',1,2,3,4,5,6,7);


-- 기업 관련
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


insert into companyBasicInfo values(
	1, 
	'kakao.png', 
	'카카오(주)', 
	'포털 및 기타 인터넷 정보매개 서비스업', 
	'제주특별자치도 제주시 첨단로 242',
	'1조 4,642억 3,279만 <br> (2016.12. IFRS 연결)',
	2629,
	'카카오는 새로운 연결을 통해 더 편리하고 즐거운 세상을 꿈꿉니다.
	 사람과 사람, 사람과 기술을 한층 가깝게 연결함으로써 세상을 어제보다 더 나은 곳으로 만들기 위해 노력하고 있습니다.',
	'동사는 다음과의 합병을 통해 우회상장. 전문화된 인력, 기술력, 콘텐츠, 경쟁력 높은 모바일 트래픽을 바탕으로 글로벌 모바일 및 인터넷 시장에서 혁신적인 라이프 서비스를 제공하는 ‘모바일 라이프 플랫폼’ 기업임
	국내 1위 메신저인 카카오톡, 국내 1위 SNS 서비스인 카카오스토리를 포함한 다양한 모바일 서비스를 제공. 국내 1위 택시 앱인 카카오택시를 출시하여 편익을 제공. 국내 대표 인터넷 포털 사이트인 다음 운영
	동사는 `이동`하는 모든 순간을 더 빠르고, 편리하고, 안전하게 만들어 간다는 목표 하에 2017년 8월 1일 카카오모빌리티를 공식 출범하였음
	동사는 세계 최초로 모바일 메신저 기반 전자고지결제(Electronic Bill Presentment and Payment; 이하 EBPP) 서비스인 `카카오페이 청구서`를 출시하였음
	매출구성은 콘텐츠 플랫폼 50.4%, 광고 플랫폼 30.55%, 기타 19.04% 등으로 구성', 
	0,
	'T','T','T','N','F','F','F' 
);

insert into companyBasicInfo values(
	2, 
	'naver.png', 
	'네이버',
	'포털 및 기타 인터넷 정보매개 서비스업',
	'경기도 성남시 분당구 불정로 6',
	'4조 226억 2,962만 <br>(2016.12. IFRS 연결)',
	2655,
	'사람과 사람, 오늘과 내일, 네트워크와 네트워크가 연결되는 더 큰 세상, NAVER가 만들어 갑니다', 
	'동사는 다음과의 합병을 통해 우회상장. 전문화된 인력, 기술력, 콘텐츠, 경쟁력 높은 모바일 트래픽을 바탕으로 글로벌 모바일 및 인터넷 시장에서 혁신적인 라이프 서비스를 제공하는 ‘모바일 라이프 플랫폼’ 기업임
	국내 1위 메신저인 카카오톡, 국내 1위 SNS 서비스인 카카오스토리를 포함한 다양한 모바일 서비스를 제공. 국내 1위 택시 앱인 카카오택시를 출시하여 편익을 제공. 국내 대표 인터넷 포털 사이트인 다음 운영
	동사는 `이동`하는 모든 순간을 더 빠르고, 편리하고, 안전하게 만들어 간다는 목표 하에 2017년 8월 1일 카카오모빌리티를 공식 출범하였음
	동사는 세계 최초로 모바일 메신저 기반 전자고지결제(Electronic Bill Presentment and Payment; 이하 EBPP) 서비스인 `카카오페이 청구서`를 출시하였음
	매출구성은 콘텐츠 플랫폼 50.4%, 광고 플랫폼 30.55%, 기타 19.04% 등으로 구성', 
	0,
	'T','F','F','T','N','N','N'
);

insert into companyBasicInfo values(
	3, 
	'toss.jpg', 
	'(주)비바리퍼블리카',
	'통신 판매업',
	'길찾기서울특별시 강남구 테헤란로 142 아크플레이스 12층',
	'200억',
	110,
	'불편하고 복잡한 금융의 문제를 해결하는 것. 복잡한 절차, 정책, 수많은 제약사항과 어려운 용어, 간단한 일에도 매번 겪게 되는 불편함. 이 불편하고 복잡한 금융의 문제를 토스팀이 끝내려고 합니다.', 
	'인터넷서비스(토스) 제공/소프트웨어 개발/공급, 통신판매 등 포털 및 기타 인터넷 정보매개 서비스업체', 
	0,
	'N','N','N','N','N','N','N'
);

-- 기업 점수
create table companyScore(
   cid number(10) constraint companyConcern_id_fk references companyBasicInfo(cid),
   dateSco number(2),
   marrySco number(2),
   babySco number(2),
   houseSco number(2),
   relationSco number(2),
   dreamSco number(2),
   hopeSco number(2),
   constraint companyscore_cid_pk primary key(cid)
);

-- 관심기업 등록 해지
create table interestedRC(
   rcid number(10) constraint interstedrc_rcid_pk primary key,
   memid varchar2(20) constraint interestedrc_memid_fk references memBasicInfo(id),
   cid number(10) constraint interestedrc_cid_fk references companyBasicInfo(cid),
   regTime date default sysdate,
   canTime date
);


-- 기업 리뷰
create table companyreview(
   rid	number(10) constraint companyreview_rid_pk primary key,
   writer varchar2(20) constraint companyreview_writer_fk references memBasicInfo(id),
   cid number(10) constraint companyreview_cid_fk references companyBasicInfo(cid),
   content varchar2(2000) constraint companyreview_content_nn not null,
   reviewdate date default sysdate
);


-- 광고기업
create table advCompany(
	aid number(10) constraint advcompany_aid_pk primary key,
	cid number(10) constraint advcom_cid_fk references companybasicinfo(cid), 
	cost number(10),
	startDate date,
	endDate date
);

insert into advCompany values(1,2, '100000000', sysdate, sysdate+1);

 -- 검색 키워드 관련
create table keywords(
   keyword varchar2(500) constraint keywords_keyword_pk primary key,
   searchNum number(20)
);

create table search(
   sid number(10) constraint search_sid_pk primary key,
   searchDate date default sysdate,
   keyword varchar2(500) constraint search_keyword_fk references keywords(keyword), 
   searchMem varchar(40) constraint search_searchMem_fk references memBasicInfo(id)
);


-- 분석 결과 plot 저장
create table plots(
   pid number(10) constraint plots_pid_pk primary key,
   memid varchar2(40) references memBasicInfo(id),
   cid number(6),
   plotpng varchar2(20),
   savedTime date default sysdate
);



-- 점수입력(전문가?패널)
create table comprawscore(
   cid number(10) constraint companyRawscore_id_fk references companyBasicInfo(cid),
   noOTEPr number(6),
   flexWorkEPr number(6),
   weekendWorkEPr number(6),
   newcomerSalEPr number(6),
   paidVacaEPr number(6),
   compKindergartenEPr number(6),
   eduSupportEPr number(6),
   loanSupportEPr number(6),
   dormiHousingSupportEPr number(6),
   opClubEPr number(6),
   supportClubEPr number(6),
   clubMemRateEPr number(6),
   selfDevSupportEPr number(6),
   seminarInvEPr number(6),
   horizStrucEPr number(6),
   varWorkExpEPr number(6),
   telAvailEPr number(6),
   salIncreRateEPr number(6),
   retireRateEPr number(6),
   busiGrowthEPr number(6),
   induGrowthEPr number(6),
   govSupportEPr number(6),
   constraint comapnyRawscore_id_pk primary key(cid)
);

-- 점수입력(설문조사 결과 반영한 기준으로..)
create table publicrawscore(
   psid number(10) constraint publicrawscore_psid_pk primary key,
   id varchar2(20) constraint publicrawscore_id_fk references memBasicInfo(id),
   cid number(10) constraint publicrawscore_cid_fk references companyBasicInfo(cid),
   noOTPuP number(6),
   flexWorkPuP number(6),
   weekendWorkPuP number(6),
   eggshellsPuP number(6),
   finanSupportPuP number(6),
   dormiHousingSupportPuP number(6),
   loanSupportPuP number(6),
   selfDevSupportPuP number(6),
   apprAmountWorkPuP number(6),
   suffSalaryPuP number(6),
   relSysAfterMarriagePuP number(6),
   childcareLeavePuP number(6),
   guarantReinstatementPuP number(6),
   vacationPuP number(6),
   moodEnvImprovPuP number(6),
   diningTogetherPuP number(6),
   moneyManageCoachPuP number(6)
);
commit