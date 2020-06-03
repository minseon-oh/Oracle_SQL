--TEST01 / TEST01

create table member01(
    id VARCHAR2(30) not null,
    pw VARCHAR2(30),
    name VARCHAR2(30),
    email VARCHAR2(30),
    address VARCHAR2(50)
);

alter table member01 add CONSTRAINT member01_pk PRIMARY KEY (id);

insert into member01 values('kkk123','1234','홍길동','kkk123@naver.com','서울시');
insert into member01 values('aaa123','1234','홍길순','aaa123@naver.com','경기도');
insert into member01 values('bbb123','1234','이순신','bbb123@naver.com','부산시');

commit;
select * from member01;