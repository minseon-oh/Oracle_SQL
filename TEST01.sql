--TEST01 / TEST01

create table member01(
    id VARCHAR2(30) not null,
    pw VARCHAR2(30),
    name VARCHAR2(30),
    email VARCHAR2(30),
    address VARCHAR2(50)
);

alter table member01 add CONSTRAINT member01_pk PRIMARY KEY (id);

insert into member01 values('kkk123','1234','ȫ�浿','kkk123@naver.com','�����');
insert into member01 values('aaa123','1234','ȫ���','aaa123@naver.com','��⵵');
insert into member01 values('bbb123','1234','�̼���','bbb123@naver.com','�λ��');

commit;
select * from member01;