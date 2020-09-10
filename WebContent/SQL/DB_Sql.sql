--회원테이블
select * from busMember;
create table busMember(
  userNum int not null primary key, -- 시퀀스
  userId varchar2(20) not null UNIQUE , --유저 아이디(고유값)
  userPass varchar2(30) not null,--유저 패스워드
  userImgUp varchar2(100) null,--회원 이미지 업로드
  userEmail varchar2(30) not null,--유저 이메일
  userPhone varchar2(40) not null, --유저 폰번호 
  userDate date, --유저 가입날짜
  userAdmin int default 0 -- 관리자 9 회원 0
);
--공지사항
create table busNotice(
noticeSeq int primary key,
userId VARCHAR2(10) not null,--유저 아이디(외래키)
noticeTitle VARCHAR2(100) not null,
noticeContent varchar2(1000) not null,
noticeDate date,
noticeHit number(3) not null
);


CREATE SEQUENCE payNum --시퀀스이름 EX_SEQ
INCREMENT BY 1 --증감숫자 1
START WITH 1 --시작숫자 1
MINVALUE 1 --최소값 1
MAXVALUE 1000 --최대값 1000
NOCYCLE --순한하지않음
noCACHE; --메모리에 시퀀스값 미리할당
commit;

insert into busMember values(userNum.nextval,'pink','pink','','pink@pink.com','010-2345-6789',sysdate,0);

--버스 노선 정보 목록
create table busList(
  busListNum int PRIMARY key not null,--시퀀스 자동증가
  busStTmCd varchar2(5) not null,--출발 터미널 코드
  busStTmNm varchar2(40) not null,--출발 터미널 이름
  busStLcCd varchar2(5) not null, --출발 지역 분류
  busStLcNm varchar2(40) not null, --출발지역분류이름
  busEdTmCd varchar2(5) not null, -- 도착 터미널 코드
  busEdTmNm varchar2(40) not null, --도착 터미널 이름
  busEdLcCd varchar2(3) not null,--도착 지역 분류 코드
  busEdLcNm varchar2(20) not null, --도착 지역 분류 이름
  busTranTm int not null --환승구분
);
insert into busList values(busListNum.nextval,   '010',   '서울경부' ,   '1',   '서울',   '130',   '안성',   '2',   '인천/경기',   '0');

commit;

--버스별 좌석 테이블
create table busSeat(
  seatNum int primary key ,--버스 좌석 테이블 시퀀스
  seatPay int null, --결제번호(외래키)
  seatRtNum int null, --노선정보번호(외래키)
  busSeatNum int null,--노선별배차(외래키)
  userId varchar2(20) not null , --회원아이디 FK
  seatCode varchar2(30) not null,--버스 좌석코드
  seatMoney int default 0 not null,--버스 판매금액
  seatName varchar2(20) not null,--성인,학생
  seatDate date --좌석 예약번호
);
--버스 별 배차목록
create table busCompany(
  busCpNum int not null primary key,--시퀀스
  busRtNum int not null, --노선정보(외래키)
  busStart date not null, --출발시간날짜
  busEnd date not null, -- 도착 시간 날짜
  busCompany varchar2(50) not null, --버스회사
  busRatingName varchar2(20) not null,--버스 등급
  busSeatCnt int not null,--버스 총 좌석수 ex)30
  busSeatRemind int not null,--잔여좌석수ex) 총 좌석에서 - 예약좌석
  busSeatPlatform varchar2(10) null, --버스대기자리 
  busMoney int DEFAULT 0 null --버스 한 좌석당 가격 = 학생 8500원, 일반 12500원
);

commit;
--결제 시스템
create table BusPay(
  payNum int primary key not null,--결제 시퀀스
  userId varchar2(20) not null, --사용자 아이디 외래키
  payPrice int DEFAULT 0 not null,--일반 12500,학생 8500
  payType varchar2(10) not null,--카드 종류
  payCdNum varchar2(20) null ,-- 카드 번호
  payMonth int DEFAULT 0 null,--일시불
  payVarDay date null, --카드 유효기간
  paySecurity varchar2(2) null,--카드 비밀번호 앞 2자리
  payBirthDay date not null, --생년월일 YYYYMMDD
  payDay date not null--202011292359 sysdate
);