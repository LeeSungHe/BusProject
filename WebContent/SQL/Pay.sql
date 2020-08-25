create table pay(
  pay_seq int PRIMARY key ,--결제 시퀀스(자동증가)
  pay_date date, -- 결제 날짜
  pay_money varchar(30)--결제 금액
);