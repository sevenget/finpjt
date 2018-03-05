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
	'서울특별시 강남구 테헤란로 142 아크플레이스 12층',
	'200억',
	110,
	'불편하고 복잡한 금융의 문제를 해결하는 것. 복잡한 절차, 정책, 수많은 제약사항과 어려운 용어, 간단한 일에도 매번 겪게 되는 불편함. 이 불편하고 복잡한 금융의 문제를 토스팀이 끝내려고 합니다.', 
	'인터넷서비스(토스) 제공/소프트웨어 개발/공급, 통신판매 등 포털 및 기타 인터넷 정보매개 서비스업체', 
	0,
	'N','N','N','N','N','N','N'
);

insert into companyBasicInfo values(
	4, 
	'woowahan.gif', 
	'(주)우아한형제들',
	'소프트웨어 개발,공급 등<br>응용소프트웨어 개발 및 공급업',
	'서울특별시 송파구 위례성대로 2 장은빌딩',
	'848억 5,026만<br> (2016.12. GAAP 개별)',
	393,
	'좋은 음식을 먹고 싶은 곳에서',
	'조금은 RAW한 사람들.
일에 대한 가치, 일의 즐거움에 대해 진지하게 탐구하는 사람들.
그리고 매일 매일이 감탄사인 사람들.
우아한형제들은 이렇게 ‘우와!’하고 열정적인 사람들입니다.

우아한형제들은 건전한 철학이 바탕이 된 
정보기술을 활용하여 한 단계 더 나은 세상을 만들어 가려 합니다.
즉, 세상의 발전에 도움이 되고 세상을 조금 더 ‘우아~’하게 만들 수 있는 기업이 되기 위해 노력하고 있습니다.', 
	0,
	'N','N','N','N','N','N','N'
);

insert into companyBasicInfo values(
	5, 
	'lgcns.png', 
	'엘지씨엔에스㈜',
	'IT/웹/통신',
	'서울 영등포구 여의대로 24 (여의도동,전국경제인연합회회관)',
	'3조 369억 2,332만<br>(2016.12. IFRS 연결)',
	5702,
	'최고의 IT서비스 기술역량으로 고객의 비즈니스 혁신 선도', 
	'LG CNS는 30년 동안 대한민국을 대표해온 IT서비스 전문기업입니다.

제조, 금융, 공공, 통신, 에너지 등 다양한 분야의 경험에 근거한 산업 전문성과 IT기술력을 바탕으로  국내외 고객에게 컨설팅, 시스템 구축 및 운영, 아웃소싱 등의 토털 IT서비스를 제공하고 있습니다.

아울러 AI/빅데이터 · 에너지신산업 · 스마트팩토리 · O2O · 헬스케어 등의 분야를 새로운 성장 동력으로 육성하고 있습니다. 이를 위해 글로벌 파트너십과 빅데이터 · IoT · 클라우드 등 신기술의 적극 확보 및 적용으로 새로운 고객 가치를 창출해나가고 있습니다.', 
	0,
	'N','N','N','N','N','N','N'
);

insert into companyBasicInfo values(
	6, 
	'line.png', 
	'라인플러스',
	'IT/웹/통신',
	'경기 성남시 분당구 황새울로360번길 42 (서현동,AK플라자)',
	'4,702억 3,937만<br>(2016.12. IFRS 개별)',
	1010,
	'우리 미션은 사람과 사람,
정보, 서비스 사이의 거리를 좁히는 것입니다.', 
	'LINE은 2011년 6월 첫 출시 후 3년 만에 전 세계 사용자 5억 명이 함께 쓰는 명실상부한 글로벌 서비스로 성장했습니다. 현재 LINE은 17개 언어로 서비스되고 있으며, LINE의 서비스를 제공받는 국가의 수는 230개에 이릅니다. 일반적인 모바일 메신저를 넘어 전 세계 모든 사용자들이 일상생활 곳곳에서 친근하고 편리하게 사용할 수 있는 모바일 플랫폼을 제공하기 위해, 오늘도 LINE의 직원들은 세계 곳곳을 누비며 가슴 뛰는 도전을 펼치고 있습니다.', 
	0,
	'N','N','N','N','N','N','N'
);

insert into companyBasicInfo values(
	7, 
	'jikbang.png', 
	'(주)직방',
	'IT/웹/통신',
	'서울특별시 종로구 종로 47, SC제일은행본점빌딩 7층 (공평동 100)',
	'-',
	140,
	'믿을 수 있는, 편리한 주거정보 플랫폼을 만든다.', 
	'대한민국 대표 부동산정보 플랫폼 직방!

직방은 오피스텔, 원룸, 투룸 뿐 아니라 아파트까지 대한민국의 부동산 정보를 제공하는 모바일/온라인 서비스입니다. 바쁜 현대인들이 집을 구할 때 직방에서 미리 보고 부동산중개소를 찾아가게 함으로써 살아갈 곳을 정하는 데 드는 시간을 줄여줍니다. 무엇보다 신뢰할 수 있는 매물 정보를 제공하기 위해 ‘안심중개사’, ‘헛걸음보상제’ 등 다양한 정책을 마련해 운영하고 있습니다. 또 젊은 세대들의 필요와 사회적 변화, 라이프스타일에 맞추어 소통하기 위한 다양한 공감 마케팅을 펼치고 있습니다.', 
	0,
	'N','N','N','N','N','N','N'
);

insert into companyBasicInfo values(
	8, 
	'coupang.png', 
	'쿠팡(주)',
	'IT/웹/통신',
	'서울시 송파구 송파대로 570, 18층(신천동)',
	'1조 9,159억 3,800만<br>(2016.12. IFRS 연결)',
	6000,
	'"우리는 ‘고객들이 쿠팡 없는 삶을 상상조차 할 수 없는’ 세상을 열어 가고자 합니다.
세계 최고 수준의 기술과 운영 노하우를 통해 쿠팡은 쇼핑의 시작부터 상품 수령까지 고객 경험 전반에 걸친 혁신을 실현하고 있습니다.
예컨대, 상품 배송의 모든 과정을 직접 책임지는 로켓배송을 도입했고, 고객이 상품을 검색하고 발견하는 과정 자체에 대한 새로운 고민을 통해 진정한 모바일 중심 플랫폼을 구현해 나가고 있습니다."
', 
	'우리는 ‘고객들이 쿠팡 없는 삶을 상상조차 할 수 없는’ 세상을 열어 가고자 합니다.
세계 최고 수준의 기술과 운영 노하우를 통해 쿠팡은 쇼핑의 시작부터 상품 수령까지 고객 경험 전반에 걸친 혁신을 실현하고 있습니다.
예컨대, 상품 배송의 모든 과정을 직접 책임지는 로켓배송을 도입했고, 고객이 상품을 검색하고 발견하는 과정 자체에 대한 새로운 고민을 통해 진정한 모바일 중심 플랫폼을 구현해 나가고 있습니다.', 
	0,
	'N','N','N','N','N','N','N'
);

insert into companyBasicInfo values(
	9, 
	'cafe24.png', 
	'카페24',
	'호스팅',
	'서울 동작구 보라매로5길 15 (신대방동,전문건설회관빌딩)',
	'1426억(2017년)',
	970,
	'앞으로도 150만 전문쇼핑몰을 통해 축적한 ''전자상거래 빅데이터''와 고도화된 알고리즘을 적용한 최첨단 ‘인공지능(AI)’ 기술 등을 적극 활용해 경쟁력 있는 글로벌 서비스를 제공하겠습니다.', 
	'"시장 점유율 1위! 글로벌 성공 파트너! 

카페24는 1999년에 설립된 글로벌 전자상거래 플랫폼 기업입니다. 
창의가 있는 사람이라면 누구나 국내를 넘어 전 세계 시장에서 온라인 비즈니스가 가능할 수 있도록 
쇼핑몰 솔루션, 광고∙마케팅, 호스팅 인프라 등 다양한 서비스를 원스톱 (One-Stop)으로 제공하고 있습니다.

카페24는 끊임없는 기술개발과 투자를 통한 서비스 혁신을 이어가면서 다양한 인터넷 서비스 분야에서 1위 자리를 굳건히 지키고 있습니다. "', 
	0,
	'N','N','N','N','N','N','N'
);

insert into companyBasicInfo values(
	10, 
	'incruit.png', 
	'인크루트',
	'취업포털',
	'서울 종로구 북촌로 104, 2층,3층 (계동)',
	'114억',
	179,
	'구성원 모두가 함께 즐거운 회사를 만들어갑니다. 
구성원간 다양한 소통문화와 즐거운 일터를 위한 복지 제도, 직원 개개인의 성장을 위한 프로그램까지, 인크루트는 일할 맛 나는 회사, 사람을 존중하는 조직 문화 구현으로 개인의 성취감과 회사의 생산성을 향상 시키고 있으며, 이를 통해서 “2012년 대한민국 일하기 좋은 기업(특별상)”을 수상 했습니다.', 
	'대한민국 취업포털의 역사, ‘인크루트’
인크루트는 국내 최초로 온라인 리크루팅 서비스를 도입한 한국의 대표 취업포털입니다. 1998년 6월 인터넷 채용 시스템을 처음으로 선보이며 오프라인 중심으로 전개되었던 기존의 채용시장을 온라인화한 선도적인 기반을 마련하며 국내 대표 취업포털로 자리매김했습니다.', 
	0,
	'N','N','N','N','N','N','N'
);

insert into companyBasicInfo values(
	11, 
	'netmable.png', 
	'넷마블게임즈(주)',
	'게임/모바일',
	'서울시 구로구 디지털로 300 지밸리플라자 20층',
	'1조 5,000억 1,576만<br>(2016.12. IFRS 연결)',
	675,
	'"거듭된 혁신을 통해 진화하고 있는 넷마블게임즈는 국내 게임 시장의 성공을 토대로 
글로벌 시장 진출 또한 본격화하며 영역을 확대해 나가고 있습니다.

이제 넷마블게임즈는 대한민국을 넘어 전세계 사람들에게 즐거움을 선사하는 
글로벌 최고의 게임회사로 도약해 나가고자 합니다."
', 
	'"넷마블게임즈는 2000년 설립된 이후 게임 업계 최초로 온라인게임 ‘퍼블리싱’ 비즈니스 모델을 
도입하는 등 혁신적인 시도로 한국 게임 시장을 선도해 왔습니다. 지난 2012년부터는 본격적으로 
모바일게임 사업에 도전했으며 ‘모두의마블’, ‘세븐나이츠’, ‘마블 퓨처파이트’, ‘리니지2 레볼루션’ 등 
다수의 우수 게임 배출과 혁신을 통해 명실상부한 국내 No.1 모바일게임 기업으로 자리 잡았습니다"', 
	0,
	'N','N','N','N','N','N','N'
);

insert into companyBasicInfo values(
	12, 
	'kbbank.jpg', 
	'국민은행',
	'금융 및 보험업',
	'서울 중구 남대문로 84',
	'18조',
	19828,
	'아시아 금융을 선도하는 글로벌 뱅크', 
	'" 대한민국의 은행이자 KB금융그룹의 계열사이다. 
예금업무, 대출업무, 지급보증업무, 유가증권 투자업무, 
신탁업무, KB국민카드, 삼성체크카드 업무 등이다."', 
	0,
	'N','N','N','N','N','N','N'
);

insert into companyBasicInfo values(
	13, 
	'cje&m.jpg', 
	'CJ E&M㈜',
	'서비스/미디어/디자인',
	'서울 마포구 상암산로 66 씨제이이앤엠센터',
	'1748억',
	386,
	'글로벌 대중문화와 새로운 지평을 여는 NO. 1 콘텐츠 기업', 
	'다양한 미디어 콘텐츠와 플랫폼 서비스를 통해 문화 트렌드를 리드하는 아시아 No. 1 종합 콘텐츠 기업입니다.
최초, 최고, 차별화를 추구하는 Only One 정신을 바탕으로 고객에게 최고의 즐거움을 제공하고 있으며, 문화 콘텐츠 전반에 걸쳐 다양한 사업을 진행하고 있습니다.', 
	0,
	'N','N','N','N','N','N','N'
);

insert into companyBasicInfo values(
	14, 
	'facebook.png', 
	'페이스북코리아(유)',
	'소셜 네트워크 서비스<br>(포털 및 기타 인터넷 정보매개 서비스업)',
	'서울 강남구 역삼동 736-1 캐피탈타워',
	'-',
	60,
	'사람들에게 공동체를 건설하고 
세계를 좀 더 가깝게 하기 위한 힘을 부여하는 것', 
	'-', 
	0,
	'N','N','N','N','N','N','N'
);

insert into companyBasicInfo values(
	15, 
	'nexon.png', 
	'넥슨',
	'게임/모바일',
	'경기 성남시 분당구 판교로 256번길 7',
	'1.9조원',
	2000,
	'"게임을 사랑하는 사람들이 모여 즐겁게 게임을 만드는 곳.

전세계 게이머들에게 최고의 재미와 경험을 선사하기 위한 도전."
"', 
	'1994년 대한민국 서울에 설립된 이후 다수의 온라인게임을 개발 및 서비스하고 있는 글로벌 게임 기업이다. 넥슨에서 최초로 서비스한 MMORPG ''바람의나라''는 전 세계 최장수 상용화 그래픽 MMORPG로 기네스북에 등재된 바 있으며 ‘부분 유료화(Free to Play)’에 기반한 비즈니스 모델의 선구자로, 현재 약 66여개의 게임을 아시아, 북미, 남미, 유럽을 포함한 110여개의 국가에 서비스를 제공하고 있다.', 
	0,
	'N','N','N','N','N','N','N'
);

insert into companyBasicInfo values(
	16, 
	'jennifer.jpg', 
	'(주)제니퍼소프트',
	'소프트웨어 개발, 애플리케이션 성능 관리',
	'경기도 파주시 탄현면 헤이리마을길 59-19',
	'272억 <br> (2016년, 데일리그리드)',
	21,
	'건강한 노동과 근사한 삶', 
	'"2005년 1월 21일 설립된 12년이 된 토종 SW 기업입니다.

2012년에 지금 헤이리 예술마을로 사옥을 짓고 본사를 이전하였습니다.  개발자들에게 개발하기 좋은 환경, 구성원이 삶의 질을 높일 수 있는 곳을 찾기 위해 4년 동안 준비하여 이전하게 되었습니다. 지금은 당당히 예술마을의 일원으로 기술과 예술의 접점을 찾아 우리의 가치와 철학 그리고 제품을 개발하기 위해 노력하고 있습니다. "', 
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