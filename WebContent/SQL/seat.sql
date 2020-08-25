create table seat(
  seat_num int primary key, --시퀀스 number(자동증가)
  seat_area1 varchar2(60) not null,-- 지역별 노선(출발지)
  seat_area2 varchar2(60) not null,-- 지역별 노선(도착지)
  seat_bus varchar2(10) not null ,--버스 좌석 번호
  seat_issue int DEFAULT 0 not null, --자리 예약 여부 예약 0 취소 1 변경 2
  seat_start varchar2(60) not null, --출발시간
  seat_end varchar2(60) not null--도착시간
  
);