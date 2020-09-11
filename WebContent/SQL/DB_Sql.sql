--회원테이블
create sequence m_userNo
  start with 1
  increment by 1;

create table busMember(
  m_userNo  number(4) primary key,          --m_userNo 시퀀스
  m_id      varchar2(20) not null unique,   --유저 아이디
  m_pw      varchar2(20) not null,          --유저 비밀번호
  m_img     varchar2(100) null,             --유저 이미지
  m_email   varchar2(40) not null,          --유저 이메일
  m_phone   varchar2(40) not null,          --유저 폰번호
  m_date    date,                           --유저 가입날짜
  m_admin   number(2) default 0             --관리자9, 회원0
);

--공지사항
create sequence n_noticeNo
  start with 1
  increment by 1;

create table busNotice(
  n_noticeNo  number(4) primary key,         --n_noticeNo 시퀀스
  n_id        varchar2(20) not null unique,  --유저 아이디(fk)
  n_title     varchar2(100) not null,        --글 제목
  n_content   varchar2(1000) not null,       --글 내용
  n_date      date,                          --게시 날짜(sysdate)
  n_hit       number(3) default 0 not null,  --조회수
  constraints bus_id_fk foreign key(n_id)    
  references busMember(m_id)                 
);

--버스 노선 정보 목록
create sequence r_routeNo
  start with 1
  increment by 1;

create table busRoute(
  r_routeNo   number(4) primary key,    --r_routeNo시퀀스
  r_departNo  number(4) not null,       --출발 지역 번호
  r_depart    varchar2(20) not null,    --출발 지역
  r_arrivalNo number(4) not null,       --도착 지역 번호
  r_arrival   varchar2(20) not null     --도착 지역
);

--버스 배차 목록
create sequence t_timeNo
  start with 1
  increment by 1;

create table busTime(
  t_timeNo    number(4) primary key,         --t_timeNo시퀀스
  t_routeNo   number(4) not null unique,     --노선 정보 번호(fk)
  t_depart    date not null,                 --출발 날짜&시간
  t_arrival   date not null,                 --도착 날짜&시간
  t_company   varchar2(20) not null,         --버스회사('tis고속')
  t_rank      varchar2(20) not null,         --버스등급('우등'or'일반')
  t_seat      number(4) not null,            --총 좌석 수(28)
  t_seatRmd   number(4) not null,            --잔여 좌석 수
  t_platform  number(4) not null,            --버스 타는 홈
  t_fare      number(10) default 0 not null, --버스 요금(성인 12500, 학생 8500)
  constraints bus_routeNo_fk foreign key(t_routeNo) 
  references busRoute(r_routeNo)
);

--버스별 좌석 테이블
create sequence s_seatNo
  start with 1
  increment by 1;

create table busSeat(
  s_seatNo    number(4) primary key,         --s_seatNo시퀀스
  s_routeNo   number(4) not null unique,     --노선 정보 번호(fk)
  s_timeNo    number(4) not null unique,     --배차 번호(fk)
  s_id        varchar2(20) not null,         --유저 아이디(fk)
  s_code      varchar2(20) not null,         --좌석 코드
  s_fare      number(10) default 0 not null, --좌석 요금(성인 12500, 학생 8500)
  s_userType  varchar2(20) not null          --승객 구분('성인'or'학생')
);

alter table busSeat add constraints bus_routeNo_fk2 foreign key (s_routeNo) references busRoute (r_routeNo);
alter table busSeat add constraints bus_timeNo_fk foreign key (s_timeNo) references busTime (t_timeNo);
alter table busSeat add constraints bus_id_fk2 foreign key (s_id) references busMember (m_id);

--버스 결제
create sequence p_payNo
  start with 1
  increment by 1;
  
create table busPay(
  p_payNo   number(4) primary key,           --p_payNo시퀀스
  p_fare    number(10) default 0 not null,   --총 결제 요금
  p_card    varchar2(10) not null,           --카드 종류('visa' or 'master')
  p_cardNo  varchar2(20) not null,           --카드 번호
  p_period  number(4) default 0 not null,    --결제 종류(0)
  p_valDate date not null,                   --카드 유효기간
  p_cardPw  number(2) not null,              --카드 비밀번호 앞2자리
  p_birth   date not null,                   --유저 생년월일
  p_date    date not null                    --결제 날짜(sysdate)
);