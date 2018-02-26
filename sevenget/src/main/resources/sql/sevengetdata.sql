-- 회원 정보
delete from memBasicInfo
insert into memBasicInfo values('mem','mem', '멤버', '180220', 'F', 'seoul', 'email@email.com','mem.gif',1,2,3,4,5,6,7);
insert into memBasicInfo values('Guest','Guest', '게스트', '180220', 'F', 'seoul', 'email2@email.com','Guest.jpg',1,2,3,4,5,6,7);
insert into memBasicInfo values('mem1','mem1', '멤버1', '180220', 'F', 'seoul', 'email2@email.com','mem1.jpg',1,2,3,4,5,6,7);
select * from memBasicInfo

--기업 정보
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

delete from companyBasicInfo cascade constraint
select * from companyBasicInfo

insert into advCompany values(2, '100000000', sysdate, sysdate+1);
select * from advCompany;
select c.cid, logo, cname, industry, location, sales, employee, mission, discription, interestedtimes, dateget, marryget, babyget, houseget, relationget, dreamget, hopeget from advCompany a, companybasicinfo c where a.cid = c.cid

select 
		c.cid, logo, cname, industry, location, sales, employee, mission, discription, interestedtimes, 
		dateget, marryget, babyget, houseget, relationget, dreamget, hopeget 
		from advCompany a, companybasicinfo c 
		where a.cid = c.cid
		order by a.cost desc
		
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

select * from companyBasicInfo where ;
SELECT * FROM companybasicinfo WHERE cname LIKE '%카%'

-- keyword
insert into keywords values('카카오', 0);
update keywords set searchnum = searchnum+1 where keyword = '카카오'; 
select * from keywords

select * from search

INSERT INTO search VALUES(sysdate, '.X','mem')

--관심기업 관련
delete from InterestedRC
insert into InterestedRC values('mem', 1, sysdate, null); commit
update InterestedRC set canTime = sysdate where memid='mem' and cid= 1 and canTime is null;
select * from InterestedRC
select * from InterestedRC where memid='mem' and cid=1 and canTime is null
select * from InterestedRC where memid='mem' and cid=1 and canTime is null
commit

insert into companyreview values('mem', 1, sysdate, '아왜안돼');
insert into companyreview values('mem', 1, sysdate, 'aa');
insert into companyreview values('mem', 1, sysdate, 'bb');
insert into companyreview values('mem', 1, sysdate, 'cc');
insert into companyreview values('mem', 1, sysdate, 'dd');
insert into companyreview values('mem', 1, sysdate, 'ee');
insert into companyreview values('mem', 1, sysdate, 'ff');
insert into companyreview values('mem', 1, sysdate, 'gg');

delete from companyreview
commit