create table notice(
notice_num   int PRIMARY KEY,--������ number
notice_title varchar2(20) not null,
notice_content varchar2(1000) not null,
notice_wdate date
);