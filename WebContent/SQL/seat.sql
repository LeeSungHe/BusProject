create table seat(
  seat_num int primary key, --������ number(�ڵ�����)
  seat_area1 varchar2(60) not null,-- ������ �뼱(�����)
  seat_area2 varchar2(60) not null,-- ������ �뼱(������)
  seat_bus varchar2(10) not null ,--���� �¼� ��ȣ
  seat_issue int DEFAULT 0 not null, --�ڸ� ���� ���� ���� 0 ��� 1 ���� 2
  seat_start varchar2(60) not null, --��߽ð�
  seat_end varchar2(60) not null--�����ð�
  
);