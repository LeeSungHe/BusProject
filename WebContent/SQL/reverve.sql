--예약
create table reverve(
  reserve_seq int PRIMARY key ,--예약 시퀀스(자동증가)
  reserve_num int , --예약번호
  reserve_time varchar2(200) ,--결제 시간
  reserve_seat varchar2(200) DEFAULT 0   --결제 좌석
);